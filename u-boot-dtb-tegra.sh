#!/bin/sh
if (( $EUID != 0 )); then
    echo "Please run script as root!"
    exit
fi
echo "0" > /sys/block/mmcblk0boot0/force_ro 
echo "0" > /sys/block/mmcblk0boot1/force_ro 
dd if=u-boot-dtb-tegra.bct of=/dev/mmcblk0boot0 
dd if=u-boot-dtb-tegra.bin of=/dev/mmcblk0boot1
echo "All done!"
