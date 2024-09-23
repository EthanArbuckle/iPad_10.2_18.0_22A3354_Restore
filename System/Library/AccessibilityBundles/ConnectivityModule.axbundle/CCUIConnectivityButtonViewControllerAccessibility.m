@implementation CCUIConnectivityButtonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIConnectivityButtonViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityButtonViewController"), CFSTR("CCUILabeledRoundButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityCellularDataViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityWifiViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityBluetoothViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityHotspotViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityAirDropViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityAirplaneViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIConnectivityVPNViewController"), CFSTR("CCUIConnectivityButtonViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CCUIConnectivityAirplaneViewController"), CFSTR("title"), "@");

}

- (id)_accessibilityControlCenterButtonLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[CCUIConnectivityButtonViewControllerAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIConnectivityButtonViewControllerAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityButtonViewController")))
  {
    -[CCUIConnectivityButtonViewControllerAccessibility _accessibilityControlCenterGenericOnOff](self, "_accessibilityControlCenterGenericOnOff");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("on"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", v6))
    {

    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("off"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqualToString:", v7);

      if (!v8)
      {
LABEL_6:

        goto LABEL_7;
      }
    }

    v4 = 0;
    goto LABEL_6;
  }
LABEL_7:
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityCellularDataViewController"), a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("cellular-data-button");
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityAirplaneViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("airplane-mode-button");
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityWifiViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("wifi-button");
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityBluetoothViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("bluetooth-button");
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityHotspotViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("hotspot-button");
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityAirDropViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("airdrop-button");
  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityVPNViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("vpn-button");
  else
    return 0;
}

- (id)_accessibilityControlCenterGenericOnOff
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityButtonViewController"), a2);
  -[CCUIConnectivityButtonViewControllerAccessibility _accessibilityControlCenterButtonIdentifier](self, "_accessibilityControlCenterButtonIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellular-data-button")) & 1) != 0)
  {
    v5 = CFSTR("CONTROL_CENTER_STATUS_CELLULAR_DATA_ON");
    v6 = CFSTR("CONTROL_CENTER_STATUS_CELLULAR_DATA_OFF");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("airplane-mode-button")) & 1) != 0)
  {
    v5 = CFSTR("CONTROL_CENTER_STATUS_AIRPLANE_MODE_ON");
    v6 = CFSTR("CONTROL_CENTER_STATUS_AIRPLANE_MODE_OFF");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("wifi-button")) & 1) != 0)
  {
    v5 = CFSTR("CONTROL_CENTER_STATUS_WIFI_ON");
    v6 = CFSTR("CONTROL_CENTER_STATUS_WIFI_OFF");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bluetooth-button")) & 1) != 0)
  {
    v5 = CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_ON");
    v6 = CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_OFF");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hotspot-button")) & 1) != 0)
  {
    v5 = CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_ON");
    v6 = CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_OFF");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("vpn-button")))
    {
      v10 = 0;
      goto LABEL_14;
    }
    v5 = CFSTR("CONTROL_CENTER_STATUS_VPN_ON");
    v6 = CFSTR("CONTROL_CENTER_STATUS_VPN_OFF");
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v5, &stru_2501D44B8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_2501D44B8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("on");
  v12[1] = CFSTR("off");
  v13[0] = v8;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v10;
}

- (BOOL)_accessibilityControlCenterButtonWillExpand
{
  char isKindOfClass;

  MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityWifiViewController"), a2);
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityBluetoothViewController")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x23490B4B8](CFSTR("CCUIConnectivityAirDropViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end
