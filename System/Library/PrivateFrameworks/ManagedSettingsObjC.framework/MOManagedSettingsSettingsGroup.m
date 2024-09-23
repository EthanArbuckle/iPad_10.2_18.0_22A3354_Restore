@implementation MOManagedSettingsSettingsGroup

+ (id)groupName
{
  return CFSTR("managedSettings");
}

- (NSSet)allowedClients
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("allowedClients"));
}

- (void)setAllowedClients:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("allowedClients"));
}

+ (MOApplicationSetSettingMetadata)allowedClientsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MOManagedSettingsSettingsGroup_allowedClientsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientsMetadata_onceToken_1 != -1)
    dispatch_once(&allowedClientsMetadata_onceToken_1, block);
  return (MOApplicationSetSettingMetadata *)(id)allowedClientsMetadata_metadata_1;
}

void __56__MOManagedSettingsSettingsGroup_allowedClientsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOApplicationSetSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("allowedClients"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("user"), v6);
  v5 = (void *)allowedClientsMetadata_metadata_1;
  allowedClientsMetadata_metadata_1 = v4;

}

- (NSData)tokenEncodingKey
{
  return (NSData *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("tokenEncodingKey"));
}

- (void)setTokenEncodingKey:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("tokenEncodingKey"));
}

+ (MODataSettingMetadata)tokenEncodingKeyMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MOManagedSettingsSettingsGroup_tokenEncodingKeyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tokenEncodingKeyMetadata_onceToken != -1)
    dispatch_once(&tokenEncodingKeyMetadata_onceToken, block);
  return (MODataSettingMetadata *)(id)tokenEncodingKeyMetadata_metadata;
}

void __58__MOManagedSettingsSettingsGroup_tokenEncodingKeyMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MODataSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("tokenEncodingKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MODataSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[MODataSettingMetadata initWithSettingName:defaultData:combineOperator:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultData:combineOperator:isPublic:scope:isPrivacySensitive:", v6, v3, 0, 0, CFSTR("user"), 0);
  v5 = (void *)tokenEncodingKeyMetadata_metadata;
  tokenEncodingKeyMetadata_metadata = v4;

}

- (NSSet)tokenDecodingKeys
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("tokenDecodingKeys"));
}

- (void)setTokenDecodingKeys:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("tokenDecodingKeys"));
}

+ (MODataSetSettingMetadata)tokenDecodingKeysMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MOManagedSettingsSettingsGroup_tokenDecodingKeysMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tokenDecodingKeysMetadata_onceToken != -1)
    dispatch_once(&tokenDecodingKeysMetadata_onceToken, block);
  return (MODataSetSettingMetadata *)(id)tokenDecodingKeysMetadata_metadata;
}

void __59__MOManagedSettingsSettingsGroup_tokenDecodingKeysMetadata__block_invoke()
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
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("tokenDecodingKeys"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MODataSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("user"), v6);
  v5 = (void *)tokenDecodingKeysMetadata_metadata;
  tokenDecodingKeysMetadata_metadata = v4;

}

@end
