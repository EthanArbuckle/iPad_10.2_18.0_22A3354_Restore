@implementation HMFWiFiNetworkInfo

- (HMFWiFiNetworkInfo)initWithMACAddress:(id)a3 SSID:(id)a4
{
  return -[HMFWiFiNetworkInfo initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:](self, "initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:", a3, a4, 0, 0, 0);
}

- (HMFWiFiNetworkInfo)initWithMACAddress:(id)a3 SSID:(id)a4 BSSID:(id)a5 gatewayIPAddress:(id)a6 gatewayMACAddress:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMFWiFiNetworkInfo *v17;
  HMFWiFiNetworkInfo *v18;
  NSString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13 || v14 && !objc_msgSend(v14, "length"))
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v22;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_19B546000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot create HMFWiFiNetworkInfo with MACAddress: %@ and SSID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    v18 = 0;
    goto LABEL_9;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFWiFiNetworkInfo;
  v17 = -[HMFWiFiNetworkInfo init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_MACAddress, a3);
    objc_storeStrong((id *)&v18->_SSID, a4);
    objc_storeStrong((id *)&v18->_networkBSSID, a5);
    objc_storeStrong((id *)&v18->_networkGatewayIPAddress, a6);
    v19 = (NSString *)v16;
    self = (HMFWiFiNetworkInfo *)v18->_networkGatewayMACAddress;
    v18->_networkGatewayMACAddress = v19;
LABEL_9:

  }
  return v18;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMFWiFiNetworkInfo MACAddress](self, "MACAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFWiFiNetworkInfo SSID](self, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" MACAddress=%@ SSID=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[HMFWiFiNetworkInfo isEqualToNetworkInfo:](self, "isEqualToNetworkInfo:", v4);

  return v5;
}

- (BOOL)isEqualToNetworkInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HMFWiFiNetworkInfo MACAddress](self, "MACAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MACAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToAddress:", v6))
  {
    -[HMFWiFiNetworkInfo SSID](self, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "SSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects(v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMFWiFiNetworkInfo MACAddress](self, "MACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMFWiFiNetworkInfo SSID](self, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFWiFiNetworkInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMFWiFiNetworkInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.MACAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.SSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMFWiFiNetworkInfo initWithMACAddress:SSID:](self, "initWithMACAddress:SSID:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMFWiFiNetworkInfo MACAddress](self, "MACAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMF.MACAddress"));

  -[HMFWiFiNetworkInfo SSID](self, "SSID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMF.SSID"));

}

- (HMFMACAddress)MACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)networkBSSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)networkGatewayIPAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)networkGatewayMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkGatewayMACAddress, 0);
  objc_storeStrong((id *)&self->_networkGatewayIPAddress, 0);
  objc_storeStrong((id *)&self->_networkBSSID, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end
