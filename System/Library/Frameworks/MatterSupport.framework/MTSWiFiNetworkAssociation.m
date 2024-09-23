@implementation MTSWiFiNetworkAssociation

- (MTSWiFiNetworkAssociation)initWithSSID:(id)a3 credentials:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSWiFiNetworkAssociation *v9;
  uint64_t v10;
  NSData *ssid;
  uint64_t v12;
  NSData *credentials;
  MTSWiFiNetworkAssociation *v15;
  SEL v16;
  _NSZone *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (MTSWiFiNetworkAssociation *)_HMFPreconditionFailure();
    return (MTSWiFiNetworkAssociation *)-[MTSWiFiNetworkAssociation copyWithZone:](v15, v16, v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)MTSWiFiNetworkAssociation;
  v9 = -[MTSWiFiNetworkAssociation init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    ssid = v9->_ssid;
    v9->_ssid = (NSData *)v10;

    v12 = objc_msgSend(v8, "copy");
    credentials = v9->_credentials;
    v9->_credentials = (NSData *)v12;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSWiFiNetworkAssociation ssid](self, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ssid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MTSWiFiNetworkAssociation credentials](self, "credentials");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "credentials");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MTSWiFiNetworkAssociation ssid](self, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MTSWiFiNetworkAssociation credentials](self, "credentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (MTSWiFiNetworkAssociation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MTSWiFiNetworkAssociation *v12;
  MTSWiFiNetworkAssociation *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSWNA.ck.ssid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSWNA.ck.credentials"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x23493F978]();
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded ssid: %@, credentials: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[MTSWiFiNetworkAssociation initWithSSID:credentials:](self, "initWithSSID:credentials:", v5, v6);
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MTSWiFiNetworkAssociation ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSWNA.ck.ssid"));

  -[MTSWiFiNetworkAssociation credentials](self, "credentials");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSWNA.ck.credentials"));

}

- (NSData)ssid
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)credentials
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
