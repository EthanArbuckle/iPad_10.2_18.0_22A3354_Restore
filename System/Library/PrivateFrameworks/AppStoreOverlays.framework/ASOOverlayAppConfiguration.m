@implementation ASOOverlayAppConfiguration

- (ASOOverlayAppConfiguration)initWithAppIdentifier:(id)a3 position:(int64_t)a4
{
  id v6;
  ASOOverlayAppConfiguration *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *storage;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASOOverlayAppConfiguration;
  v7 = -[ASOOverlayAppConfiguration init](&v11, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v7->_storage;
    v7->_storage = v8;

    -[ASOOverlayAppConfiguration setAppIdentifier:](v7, "setAppIdentifier:", v6);
    -[ASOOverlayAppConfiguration setPosition:](v7, "setPosition:", a4);
  }

  return v7;
}

- (ASOOverlayAppConfiguration)initWithStorage:(id)a3
{
  id v5;
  ASOOverlayAppConfiguration *v6;
  ASOOverlayAppConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppConfiguration;
  v6 = -[ASOOverlayAppConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storage, a3);

  return v7;
}

- (ASOOverlayAppConfiguration)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ASOOverlayAppConfiguration *v10;
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

  v10 = -[ASOOverlayAppConfiguration initWithStorage:](self, "initWithStorage:", v9);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ASOOverlayAppConfiguration storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = (void *)objc_msgSend(v4, "initWithStorage:", v6);

  return v7;
}

- (void)setAppIdentifier:(id)a3
{
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterAppIdentifier"));
}

- (NSString)appIdentifier
{
  return (NSString *)-[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterAppIdentifier"));
}

- (void)setCampaignToken:(id)a3
{
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterCampaignToken"));
}

- (NSString)campaignToken
{
  return (NSString *)-[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterCampaignToken"));
}

- (void)setProviderToken:(id)a3
{
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterProviderToken"));
}

- (NSString)providerToken
{
  return (NSString *)-[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterProviderToken"));
}

- (void)setPosition:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", v4, CFSTR("ASOOverlayConfigurationParameterPosition"));

}

- (int64_t)position
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterPosition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setUserDismissible:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", v4, CFSTR("ASOOverlayConfigurationParameterUserDismissible"));

}

- (BOOL)userDismissible
{
  void *v2;
  void *v3;
  char v4;

  -[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterUserDismissible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setLatestReleaseID:(id)a3
{
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterLatestReleaseID"));
}

- (NSString)latestReleaseID
{
  return (NSString *)-[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterLatestReleaseID"));
}

- (void)setProductVariantID:(id)a3
{
  -[ASOOverlayAppConfiguration setAdditionalValue:forKey:](self, "setAdditionalValue:forKey:", a3, CFSTR("ASOOverlayConfigurationParameterProductVariantID"));
}

- (NSString)productVariantID
{
  return (NSString *)-[ASOOverlayAppConfiguration additionalValueForKey:](self, "additionalValueForKey:", CFSTR("ASOOverlayConfigurationParameterProductVariantID"));
}

- (void)setAdditionalValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ASOOverlayAppConfiguration storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)additionalValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASOOverlayAppConfiguration storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[ASOOverlayAppConfiguration storage](self, "storage");
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
  v9.super_class = (Class)ASOOverlayAppConfiguration;
  -[ASOOverlayAppConfiguration description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayAppConfiguration storage](self, "storage");
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
