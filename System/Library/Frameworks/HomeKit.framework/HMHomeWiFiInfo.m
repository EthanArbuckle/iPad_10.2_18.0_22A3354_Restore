@implementation HMHomeWiFiInfo

- (HMHomeWiFiInfo)initWithSSID:(id)a3
{
  id v5;
  HMHomeWiFiInfo *v6;
  HMHomeWiFiInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMHomeWiFiInfo;
  v6 = -[HMHomeWiFiInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_SSID, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMHomeWiFiInfo SSID](self, "SSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMHomeWiFiInfo SSID](self, "SSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SSID"));

  }
}

- (HMHomeWiFiInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMHomeWiFiInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMHomeWiFiInfo initWithSSID:](self, "initWithSSID:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMHomeWiFiInfo SSID](self, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMHomeWiFiInfo SSID](self, "SSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
