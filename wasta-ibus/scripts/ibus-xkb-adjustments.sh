#!/bin/bash

# ==============================================================================
# wasta-ibus: ibus-xkb-adjustments.sh
#
# 2017-12-20 rik: initial script
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "You must run this script with sudo." >&2
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Script Entry: ibus-xkb-adjustments.sh"
echo

# Setup Diretory for later reference
DIR=/usr/share/wasta-ibus

# ------------------------------------------------------------------------------
# Add Cameroon xkb keyboards to ibus-setup
# ------------------------------------------------------------------------------

# Cameroon qwerty: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:cm:qwerty:cm"]' \
    /usr/share/ibus/component/simple.xml

# Cameroon qwerty: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:cm:qwerty:cm" \
    -s //engineTMP -t elem -n language -v "cm" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "cm" \
    -s //engineTMP -t elem -n layout_variant -v "qwerty" \
    -s //engineTMP -t elem -n longname -v "Cameroon Multilingual (qwerty)" \
    -s //engineTMP -t elem -n description -v "Cameroon Multilingual (qwerty keyboard)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    /usr/share/ibus/component/simple.xml

# Cameroon azerty: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:cm:azerty:cm"]' \
    /usr/share/ibus/component/simple.xml

# Cameroon azerty: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:cm:azerty:cm" \
    -s //engineTMP -t elem -n language -v "cm" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "cm" \
    -s //engineTMP -t elem -n layout_variant -v "azerty" \
    -s //engineTMP -t elem -n longname -v "Cameroon Multilingual (azerty)" \
    -s //engineTMP -t elem -n description -v "Cameroon Multilingual (azerty keyboard)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    /usr/share/ibus/component/simple.xml

# Cameroon Dvorak: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:cm:dvorak:cm"]' \
    /usr/share/ibus/component/simple.xml

# Cameroon Dvorak: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:cm:dvorak:cm" \
    -s //engineTMP -t elem -n language -v "cm" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "cm" \
    -s //engineTMP -t elem -n layout_variant -v "dvorak" \
    -s //engineTMP -t elem -n longname -v "Cameroon Multilingual (Dvorak)" \
    -s //engineTMP -t elem -n description -v "Cameroon Multilingual (Dvorak keyboard)" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    /usr/share/ibus/component/simple.xml

# Ghana GILLBT: FIRST delete existing element
xmlstarlet ed --inplace --delete 'component/engines/engine[name="xkb:gh:gillbt:gh"]' \
    /usr/share/ibus/component/simple.xml

# Ghana GILLBT: SECOND create element
xmlstarlet ed --inplace -s /component/engines -t elem -n engineTMP \
    -s //engineTMP -t elem -n name -v "xkb:gh:gillbt:gh" \
    -s //engineTMP -t elem -n language -v "gh" \
    -s //engineTMP -t elem -n license -v "GPL" \
    -s //engineTMP -t elem -n author -v "Wasta Linux Team &lt;wasta.linux.team@gmail.com&gt;" \
    -s //engineTMP -t elem -n layout -v "gh" \
    -s //engineTMP -t elem -n layout_variant -v "gillbt" \
    -s //engineTMP -t elem -n longname -v "Ghana GILLBT" \
    -s //engineTMP -t elem -n description -v "Ghana GILLBT keyboard" \
    -s //engineTMP -t elem -n icon -v "ibus-keyboard" \
    -s //engineTMP -t elem -n rank -v "99" \
    -r //engineTMP -v engine \
    /usr/share/ibus/component/simple.xml

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Script Exit: app-adjustments.sh"
echo

exit 0
