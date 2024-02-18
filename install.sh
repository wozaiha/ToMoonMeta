#!/bin/sh

if test -e /home/deck/homebrew/plugins/tomoon; then
    echo "tomoon exists"
    sudo rm -r /home/deck/homebrew/plugins/tomoon
fi

if test -e /tmp/tomoon.zip; then
    sudo rm /tmp/tomoon.zip
fi

echo "Downloading Tomoon..."
curl -L -o /tmp/tomoon.zip https://moon.ohmydeck.net

if test -e /home/deck/homebrew/plugins; then
    sudo mkdir -p /home/deck/homebrew/plugins
fi
systemctl --user stop plugin_loader 2> /dev/null
sudo systemctl stop plugin_loader 2> /dev/null

sudo unzip -qq /tmp/tomoon.zip -d /home/deck/homebrew/plugins/
sudo rm /tmp/tomoon.zip
sudo chmod -R 777 /home/deck/homebrew/plugins/tomoon

sudo systemctl start plugin_loader
echo "Tomoon is installed."
