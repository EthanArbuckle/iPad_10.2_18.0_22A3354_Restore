@implementation ASOOverlayAppClipConfiguration

- (ASOOverlayAppClipConfiguration)initWithPosition:(int64_t)a3
{
  ASOOverlayAppClipConfiguration *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *storage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASOOverlayAppClipConfiguration;
  v4 = -[ASOOverlayAppClipConfiguration init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v4->_storage;
    v4->_storage = v5;

    -[ASOOverlayAppClipConfiguration setPosition:](v4, "setPosition:", a3);
  }
  return v4;
}

- (ASOOverlayAppClipConfiguration)initWithStorage:(id)a3
{
  id v5;
  ASOOverlayAppClipConfiguration *v6;
  ASOOverlayAppClipConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppClipConfiguration;
  v6 = -[ASOOverlayAppClipConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storage, a3);

  return v7;
}

- (ASOOverlayAppClipConfiguration)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ASOOverlayAppClipConfiguration *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Class;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  Class = ASOSignpostSpanGetClass(v15, v6);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("ASOOverlayConfigurationStorageKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASOOverlayAppClipConfiguration initWithStorage:](self, "initWithStorage:", v9);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ASOOverlayAppClipConfiguration storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = (void *)objc_msgSend(v4, "initWithStorage:", v6);

  return v7;
}

- (void)setCampaignToken:(id)a3
{
  -[ASOOverlayAppClipConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterCampaignToken"));
}

- (NSString)campaignToken
{
  return (NSString *)-[ASOOverlayAppClipConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterCampaignToken"));
}

- (void)setProviderToken:(id)a3
{
  -[ASOOverlayAppClipConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterProviderToken"));
}

- (NSString)providerToken
{
  return (NSString *)-[ASOOverlayAppClipConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterProviderToken"));
}

- (void)setPosition:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayAppClipConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", v4, CFSTR("ASOOverlayConfigurationParameterPosition"));

}

- (int64_t)position
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ASOOverlayAppClipConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterPosition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setLatestReleaseID:(id)a3
{
  -[ASOOverlayAppClipConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterLatestReleaseID"));
}

- (NSString)latestReleaseID
{
  return (NSString *)-[ASOOverlayAppClipConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterLatestReleaseID"));
}

- (void)setProductVariantID:(id)a3
{
  -[ASOOverlayAppClipConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterProductVariantID"));
}

- (NSString)productVariantID
{
  return (NSString *)-[ASOOverlayAppClipConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterProductVariantID"));
}

- (void)setAdditionalValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ASOOverlayAppClipConfiguration storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)additionalValueForKey:(id)a3
{
  return -[ASOOverlayAppClipConfiguration additionalValueForKey:serviceContext:](self, "additionalValueForKey:serviceContext:", a3, 0);
}

- (id)additionalValueForKey:(id)a3 serviceContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "hasPrefix:", CFSTR("ASOOverlayConfigurationPrivate"))
    || v7 && objc_msgSend(v7, "hasPrivateEntitlement"))
  {
    -[ASOOverlayAppClipConfiguration storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASOOverlayAppClipConfiguration storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ASOOverlayConfigurationStorageKey"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppClipConfiguration;
  -[ASOOverlayAppClipConfiguration description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayAppClipConfiguration storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
