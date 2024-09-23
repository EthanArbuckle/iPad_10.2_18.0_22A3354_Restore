@implementation HMFWiFiNetworkInfo(WifiInfoSerialization)

+ (id)wifiNetworkInfoFromProto:()WifiInfoSerialization
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "macAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D285C0]);
    objc_msgSend(v3, "macAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithMACAddressString:", v6);

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0D286F0]);
      objc_msgSend(v3, "networkSSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "networkBSSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "networkGatewayIPAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "networkGatewayMacAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:", v7, v9, v10, v11, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
