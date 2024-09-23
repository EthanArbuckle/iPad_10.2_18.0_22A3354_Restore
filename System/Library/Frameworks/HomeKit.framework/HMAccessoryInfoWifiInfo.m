@implementation HMAccessoryInfoWifiInfo

- (HMAccessoryInfoWifiInfo)initWithWifiNetworkInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessoryInfoWifiInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "MACAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMAccessoryInfoWifiInfo initWithMacAddress:networkSSID:](self, "initWithMacAddress:networkSSID:", v6, v7);
  return v8;
}

- (HMAccessoryInfoWifiInfo)initWithMacAddress:(id)a3 networkSSID:(id)a4
{
  id v7;
  id v8;
  HMAccessoryInfoWifiInfo *v9;
  HMAccessoryInfoWifiInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryInfoWifiInfo;
  v9 = -[HMAccessoryInfoWifiInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_macAddress, a3);
    objc_storeStrong((id *)&v10->_networkSSID, a4);
  }

  return v10;
}

- (id)hmfWifiNetworkInfo
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D285C0]);
  -[HMAccessoryInfoWifiInfo macAddress](self, "macAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMACAddressString:", v4);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D286F0]);
    -[HMAccessoryInfoWifiInfo networkSSID](self, "networkSSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithMACAddress:SSID:", v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)protoPayload
{
  HMAccessoryInfoProtoWifiNetworkInfoEvent *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(HMAccessoryInfoProtoWifiNetworkInfoEvent);
  -[HMAccessoryInfoWifiInfo macAddress](self, "macAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setMacAddress:](v3, "setMacAddress:", v4);

  -[HMAccessoryInfoWifiInfo networkSSID](self, "networkSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkSSID:](v3, "setNetworkSSID:", v5);

  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMAccessoryInfoWifiInfo protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessoryInfoWifiInfo)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessoryInfoWifiInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "macAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkSSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMAccessoryInfoWifiInfo initWithMacAddress:networkSSID:](self, "initWithMacAddress:networkSSID:", v5, v6);
  return v7;
}

- (HMAccessoryInfoWifiInfo)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *v5;
  HMAccessoryInfoWifiInfo *v6;

  v4 = a3;
  v5 = -[HMAccessoryInfoProtoWifiNetworkInfoEvent initWithData:]([HMAccessoryInfoProtoWifiNetworkInfoEvent alloc], "initWithData:", v4);

  v6 = -[HMAccessoryInfoWifiInfo initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (NSString)macAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)networkSSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSSID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
}

@end
