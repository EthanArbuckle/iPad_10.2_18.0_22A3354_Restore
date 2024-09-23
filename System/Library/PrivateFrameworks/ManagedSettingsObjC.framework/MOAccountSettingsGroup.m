@implementation MOAccountSettingsGroup

+ (id)groupName
{
  return CFSTR("account");
}

- (NSNumber)denyiCloudLogout
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyiCloudLogout"));
}

- (void)setDenyiCloudLogout:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyiCloudLogout"));
}

+ (MOBoolSettingMetadata)denyiCloudLogoutMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MOAccountSettingsGroup_denyiCloudLogoutMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyiCloudLogoutMetadata_onceToken != -1)
    dispatch_once(&denyiCloudLogoutMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyiCloudLogoutMetadata_metadata;
}

void __50__MOAccountSettingsGroup_denyiCloudLogoutMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyiCloudLogout"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyiCloudLogoutMetadata_metadata;
  denyiCloudLogoutMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockAccounts
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockAccounts"));
}

- (void)setLockAccounts:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockAccounts"));
}

+ (MOBoolSettingMetadata)lockAccountsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MOAccountSettingsGroup_lockAccountsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockAccountsMetadata_onceToken != -1)
    dispatch_once(&lockAccountsMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockAccountsMetadata_metadata;
}

void __46__MOAccountSettingsGroup_lockAccountsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockAccounts"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)lockAccountsMetadata_metadata;
  lockAccountsMetadata_metadata = (uint64_t)v2;

}

@end
