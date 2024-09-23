@implementation HMFWifiNetworkAssociation(WifiInfoSerialization)

- (HMAccessoryInfoProtoWifiNetworkInfoEvent)protoPayload
{
  HMAccessoryInfoProtoWifiNetworkInfoEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(HMAccessoryInfoProtoWifiNetworkInfoEvent);
  objc_msgSend(a1, "MACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setMacAddress:](v2, "setMacAddress:", v4);

  objc_msgSend(a1, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkSSID:](v2, "setNetworkSSID:", v5);

  objc_msgSend(a1, "gatewayIPAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkGatewayIPAddress:](v2, "setNetworkGatewayIPAddress:", v6);

  objc_msgSend(a1, "BSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkBSSID:](v2, "setNetworkBSSID:", v8);

  objc_msgSend(a1, "gatewayMACAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formattedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkGatewayMacAddress:](v2, "setNetworkGatewayMacAddress:", v10);

  return v2;
}

@end
