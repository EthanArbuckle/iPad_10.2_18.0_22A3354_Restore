@implementation MOSafariSettingsGroup

+ (id)groupName
{
  return CFSTR("safari");
}

- (NSString)cookiePolicy
{
  return (NSString *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("cookiePolicy"));
}

- (void)setCookiePolicy:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("cookiePolicy"));
}

+ (MOStringSettingMetadata)cookiePolicyMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MOSafariSettingsGroup_cookiePolicyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cookiePolicyMetadata_onceToken != -1)
    dispatch_once(&cookiePolicyMetadata_onceToken, block);
  return (MOStringSettingMetadata *)(id)cookiePolicyMetadata_metadata;
}

void __45__MOSafariSettingsGroup_cookiePolicyMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOStringSettingMetadata *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("cookiePolicy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOStringSettingMetadata alloc];
  v8[0] = CFSTR("never");
  v8[1] = CFSTR("currentWebsite");
  v9[0] = &unk_1E6768BC0;
  v9[1] = &unk_1E6768BD8;
  v8[2] = CFSTR("visitedWebsites");
  v8[3] = CFSTR("always");
  v9[2] = &unk_1E6768BF0;
  v9[3] = &unk_1E6768C08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  v5 = -[MOStringSettingMetadata initWithSettingName:defaultString:combineOperator:rankedAllowedValues:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultString:combineOperator:rankedAllowedValues:isPublic:scope:isPrivacySensitive:", v2, CFSTR("always"), 0, v4, 1, CFSTR("user"), v7);
  v6 = (void *)cookiePolicyMetadata_metadata;
  cookiePolicyMetadata_metadata = v5;

}

- (NSNumber)denyAutoFill
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyAutoFill"));
}

- (void)setDenyAutoFill:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyAutoFill"));
}

+ (MOBoolSettingMetadata)denyAutoFillMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MOSafariSettingsGroup_denyAutoFillMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAutoFillMetadata_onceToken != -1)
    dispatch_once(&denyAutoFillMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyAutoFillMetadata_metadata;
}

void __45__MOSafariSettingsGroup_denyAutoFillMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyAutoFill"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyAutoFillMetadata_metadata;
  denyAutoFillMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denySafari
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denySafari"));
}

- (void)setDenySafari:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denySafari"));
}

+ (MOBoolSettingMetadata)denySafariMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MOSafariSettingsGroup_denySafariMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySafariMetadata_onceToken != -1)
    dispatch_once(&denySafariMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denySafariMetadata_metadata;
}

void __43__MOSafariSettingsGroup_denySafariMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denySafari"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denySafariMetadata_metadata;
  denySafariMetadata_metadata = (uint64_t)v2;

}

@end
