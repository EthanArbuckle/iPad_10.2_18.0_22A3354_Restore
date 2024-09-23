@implementation MSDKPeerDemoWiFiSettings

- (MSDKPeerDemoWiFiSettings)initWithSSID:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  MSDKPeerDemoWiFiSettings *v8;
  MSDKPeerDemoWiFiSettings *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoWiFiSettings;
  v8 = -[MSDKPeerDemoWiFiSettings init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDKPeerDemoWiFiSettings setSsid:](v8, "setSsid:", v6);
    -[MSDKPeerDemoWiFiSettings setPassword:](v9, "setPassword:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoWiFiSettings ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoWiFiSettings password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: SSID=%@ Password=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoWiFiSettings)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoWiFiSettings *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDKPeerDemoWiFiSettings;
  v5 = -[MSDKPeerDemoWiFiSettings init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoWiFiSettings setSsid:](v5, "setSsid:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoWiFiSettings setPassword:](v5, "setPassword:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MSDKPeerDemoWiFiSettings ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ssid"));

  -[MSDKPeerDemoWiFiSettings password](self, "password");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("password"));

}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
