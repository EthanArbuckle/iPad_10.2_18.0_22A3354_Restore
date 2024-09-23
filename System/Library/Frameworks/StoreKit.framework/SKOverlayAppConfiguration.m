@implementation SKOverlayAppConfiguration

- (SKOverlayAppConfiguration)initWithAppIdentifier:(NSString *)appIdentifier position:(SKOverlayPosition)position
{
  objc_class *v6;
  NSString *v7;
  void *v8;
  SKOverlayAppConfiguration *v9;
  objc_super v11;

  v6 = (objc_class *)MEMORY[0x1E0CFA178];
  v7 = appIdentifier;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithAppIdentifier:position:", v7, position != SKOverlayPositionBottom);

  v11.receiver = self;
  v11.super_class = (Class)SKOverlayAppConfiguration;
  v9 = -[SKOverlayConfiguration initWithBacking:](&v11, sel_initWithBacking_, v8);

  return v9;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKOverlayAppConfiguration;
  return -[SKOverlayConfiguration _init](&v3, sel__init);
}

- (SKOverlayAppConfiguration)initWithBacking:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKOverlayAppConfiguration;
  return -[SKOverlayConfiguration initWithBacking:](&v4, sel_initWithBacking_, a3);
}

- (void)setAppIdentifier:(NSString *)appIdentifier
{
  NSString *v4;
  id v5;

  v4 = appIdentifier;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppIdentifier:", v4);

}

- (NSString)appIdentifier
{
  void *v2;
  void *v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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

- (void)setUserDismissible:(BOOL)userDismissible
{
  _BOOL8 v3;
  id v4;

  v3 = userDismissible;
  -[SKOverlayConfiguration _backing](self, "_backing");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserDismissible:", v3);

}

- (BOOL)userDismissible
{
  void *v2;
  char v3;

  -[SKOverlayConfiguration _backing](self, "_backing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userDismissible");

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

- (void)setAdImpression:(SKAdImpression *)impression
{
  id v4;
  _QWORD v5[5];

  if (impression)
  {
    -[SKOverlayAppConfiguration _impressionDictFromImpression:](self, "_impressionDictFromImpression:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__SKOverlayAppConfiguration_setAdImpression___block_invoke;
    v5[3] = &unk_1E5B26B78;
    v5[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

uint64_t __45__SKOverlayAppConfiguration_setAdImpression___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdditionalValue:forKey:", a3, a2);
}

- (id)_impressionDictFromImpression:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("adNetworkAttributionSignature"));

  objc_msgSend(v3, "adCampaignIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("adNetworkCampaignId"));

  objc_msgSend(v3, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("sourceIdentifier"));

  objc_msgSend(v3, "adNetworkIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("adNetworkId"));

  objc_msgSend(v3, "adImpressionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("adNetworkNonce"));

  objc_msgSend(v3, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("adNetworkImpressionTimestamp"));

  objc_msgSend(v3, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("adNetworkPayloadVersion"));

  objc_msgSend(v3, "sourceAppStoreItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("adNetworkSourceAppStoreIdentifier"));
  return v4;
}

@end
