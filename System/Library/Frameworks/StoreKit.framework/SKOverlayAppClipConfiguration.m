@implementation SKOverlayAppClipConfiguration

- (SKOverlayAppClipConfiguration)initWithPosition:(SKOverlayPosition)position
{
  void *v4;
  SKOverlayAppClipConfiguration *v5;
  objc_super v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFA170]), "initWithPosition:", position != SKOverlayPositionBottom);
  v7.receiver = self;
  v7.super_class = (Class)SKOverlayAppClipConfiguration;
  v5 = -[SKOverlayConfiguration initWithBacking:](&v7, sel_initWithBacking_, v4);

  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKOverlayAppClipConfiguration;
  return -[SKOverlayConfiguration _init](&v3, sel__init);
}

- (SKOverlayAppClipConfiguration)initWithBacking:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKOverlayAppClipConfiguration;
  return -[SKOverlayConfiguration initWithBacking:](&v4, sel_initWithBacking_, a3);
}

- (void)setCampaignToken:(NSString *)campaignToken
{
  NSString *v4;
  id v5;

  v4 = campaignToken;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCampaignToken:", v4);

}

- (NSString)campaignToken
{
  void *v2;
  void *v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "campaignToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setProviderToken:(NSString *)providerToken
{
  NSString *v4;
  id v5;

  v4 = providerToken;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderToken:", v4);

}

- (NSString)providerToken
{
  void *v2;
  void *v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCustomProductPageIdentifier:(NSString *)customProductPageIdentifier
{
  NSString *v4;
  id v5;

  v4 = customProductPageIdentifier;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProductVariantID:", v4);

}

- (NSString)customProductPageIdentifier
{
  void *v2;
  void *v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productVariantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLatestReleaseID:(NSString *)latestReleaseID
{
  NSString *v4;
  id v5;

  v4 = latestReleaseID;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLatestReleaseID:", v4);

}

- (NSString)latestReleaseID
{
  void *v2;
  void *v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latestReleaseID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPosition:(SKOverlayPosition)position
{
  id v4;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", position != SKOverlayPositionBottom);

}

- (SKOverlayPosition)position
{
  void *v2;
  SKOverlayPosition v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v2, "position") != 0);

  return v3;
}

- (void)setAdditionalValue:(id)value forKey:(NSString *)key
{
  NSString *v6;
  id v7;
  id v8;

  v6 = key;
  v7 = value;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdditionalValue:forKey:", v7, v6);

}

- (id)additionalValueForKey:(NSString *)key
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = key;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalValueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
