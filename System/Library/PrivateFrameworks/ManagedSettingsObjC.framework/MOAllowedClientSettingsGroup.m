@implementation MOAllowedClientSettingsGroup

+ (id)groupName
{
  return CFSTR("allowedClient");
}

- (MOApplication)allowedClient
{
  return (MOApplication *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("allowedClient"));
}

- (void)setAllowedClient:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("allowedClient"));
}

+ (MOApplicationSettingMetadata)allowedClientMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MOAllowedClientSettingsGroup_allowedClientMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientMetadata_onceToken != -1)
    dispatch_once(&allowedClientMetadata_onceToken, block);
  return (MOApplicationSettingMetadata *)(id)allowedClientMetadata_metadata;
}

void __53__MOAllowedClientSettingsGroup_allowedClientMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOApplicationSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("allowedClient"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[MOApplicationSettingMetadata initWithSettingName:defaultApplication:combineOperator:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultApplication:combineOperator:isPublic:scope:isPrivacySensitive:", v6, v3, 0, 0, CFSTR("user"), 0);
  v5 = (void *)allowedClientMetadata_metadata;
  allowedClientMetadata_metadata = v4;

}

- (NSNumber)denyMDMEnrollment
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMDMEnrollment"));
}

- (void)setDenyMDMEnrollment:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMDMEnrollment"));
}

+ (MOBoolSettingMetadata)denyMDMEnrollmentMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MOAllowedClientSettingsGroup_denyMDMEnrollmentMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMDMEnrollmentMetadata_onceToken != -1)
    dispatch_once(&denyMDMEnrollmentMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMDMEnrollmentMetadata_metadata;
}

void __57__MOAllowedClientSettingsGroup_denyMDMEnrollmentMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMDMEnrollment"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyMDMEnrollmentMetadata_metadata;
  denyMDMEnrollmentMetadata_metadata = (uint64_t)v2;

}

- (NSSet)tokenKeys
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("tokenKeys"));
}

- (void)setTokenKeys:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("tokenKeys"));
}

+ (MODataSetSettingMetadata)tokenKeysMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MOAllowedClientSettingsGroup_tokenKeysMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tokenKeysMetadata_onceToken != -1)
    dispatch_once(&tokenKeysMetadata_onceToken, block);
  return (MODataSetSettingMetadata *)(id)tokenKeysMetadata_metadata;
}

void __49__MOAllowedClientSettingsGroup_tokenKeysMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MODataSetSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("tokenKeys"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MODataSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("user"), v6);
  v5 = (void *)tokenKeysMetadata_metadata;
  tokenKeysMetadata_metadata = v4;

}

@end
