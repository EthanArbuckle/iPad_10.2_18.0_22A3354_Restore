@implementation MOAppStoreSettingsGroup

+ (id)groupName
{
  return CFSTR("appStore");
}

- (NSNumber)denyAppStoreAppInstallation
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyAppStoreAppInstallation"));
}

- (void)setDenyAppStoreAppInstallation:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyAppStoreAppInstallation"));
}

+ (MOBoolSettingMetadata)denyAppStoreAppInstallationMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MOAppStoreSettingsGroup_denyAppStoreAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppStoreAppInstallationMetadata_onceToken != -1)
    dispatch_once(&denyAppStoreAppInstallationMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyAppStoreAppInstallationMetadata_metadata;
}

void __62__MOAppStoreSettingsGroup_denyAppStoreAppInstallationMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyAppStoreAppInstallation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyAppStoreAppInstallationMetadata_metadata;
  denyAppStoreAppInstallationMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyInAppPurchases
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyInAppPurchases"));
}

- (void)setDenyInAppPurchases:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyInAppPurchases"));
}

+ (MOBoolSettingMetadata)denyInAppPurchasesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MOAppStoreSettingsGroup_denyInAppPurchasesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyInAppPurchasesMetadata_onceToken != -1)
    dispatch_once(&denyInAppPurchasesMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyInAppPurchasesMetadata_metadata;
}

void __53__MOAppStoreSettingsGroup_denyInAppPurchasesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyInAppPurchases"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyInAppPurchasesMetadata_metadata;
  denyInAppPurchasesMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyMarketplaceAppInstallation
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMarketplaceAppInstallation"));
}

- (void)setDenyMarketplaceAppInstallation:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMarketplaceAppInstallation"));
}

+ (MOBoolSettingMetadata)denyMarketplaceAppInstallationMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MOAppStoreSettingsGroup_denyMarketplaceAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMarketplaceAppInstallationMetadata_onceToken != -1)
    dispatch_once(&denyMarketplaceAppInstallationMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMarketplaceAppInstallationMetadata_metadata;
}

void __65__MOAppStoreSettingsGroup_denyMarketplaceAppInstallationMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMarketplaceAppInstallation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyMarketplaceAppInstallationMetadata_metadata;
  denyMarketplaceAppInstallationMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyWebDistributionAppInstallation
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyWebDistributionAppInstallation"));
}

- (void)setDenyWebDistributionAppInstallation:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyWebDistributionAppInstallation"));
}

+ (MOBoolSettingMetadata)denyWebDistributionAppInstallationMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MOAppStoreSettingsGroup_denyWebDistributionAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyWebDistributionAppInstallationMetadata_onceToken != -1)
    dispatch_once(&denyWebDistributionAppInstallationMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyWebDistributionAppInstallationMetadata_metadata;
}

void __69__MOAppStoreSettingsGroup_denyWebDistributionAppInstallationMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyWebDistributionAppInstallation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyWebDistributionAppInstallationMetadata_metadata;
  denyWebDistributionAppInstallationMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)maximumRating
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("maximumRating"));
}

- (void)setMaximumRating:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("maximumRating"));
}

+ (MOIntegerSettingMetadata)maximumRatingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MOAppStoreSettingsGroup_maximumRatingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (maximumRatingMetadata_onceToken != -1)
    dispatch_once(&maximumRatingMetadata_onceToken, block);
  return (MOIntegerSettingMetadata *)(id)maximumRatingMetadata_metadata;
}

void __48__MOAppStoreSettingsGroup_maximumRatingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOIntegerSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("maximumRating"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = 0;
  v2 = -[MOIntegerSettingMetadata initWithSettingName:defaultInt:combineOperator:lowerBound:upperBound:isPublic:scope:isPrivacySensitive:]([MOIntegerSettingMetadata alloc], "initWithSettingName:defaultInt:combineOperator:lowerBound:upperBound:isPublic:scope:isPrivacySensitive:", v5, 1000, 0, 0, 2000, 1, CFSTR("user"), v4);
  v3 = (void *)maximumRatingMetadata_metadata;
  maximumRatingMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)requirePasswordForPurchases
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("requirePasswordForPurchases"));
}

- (void)setRequirePasswordForPurchases:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("requirePasswordForPurchases"));
}

+ (MOBoolSettingMetadata)requirePasswordForPurchasesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MOAppStoreSettingsGroup_requirePasswordForPurchasesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (requirePasswordForPurchasesMetadata_onceToken != -1)
    dispatch_once(&requirePasswordForPurchasesMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)requirePasswordForPurchasesMetadata_metadata;
}

void __62__MOAppStoreSettingsGroup_requirePasswordForPurchasesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("requirePasswordForPurchases"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)requirePasswordForPurchasesMetadata_metadata;
  requirePasswordForPurchasesMetadata_metadata = (uint64_t)v2;

}

@end
