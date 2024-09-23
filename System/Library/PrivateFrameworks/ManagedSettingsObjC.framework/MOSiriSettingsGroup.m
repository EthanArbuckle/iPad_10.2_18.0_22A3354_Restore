@implementation MOSiriSettingsGroup

+ (id)groupName
{
  return CFSTR("siri");
}

- (NSNumber)denySiri
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denySiri"));
}

- (void)setDenySiri:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denySiri"));
}

+ (MOBoolSettingMetadata)denySiriMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MOSiriSettingsGroup_denySiriMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySiriMetadata_onceToken != -1)
    dispatch_once(&denySiriMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denySiriMetadata_metadata;
}

void __39__MOSiriSettingsGroup_denySiriMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denySiri"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denySiriMetadata_metadata;
  denySiriMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denySiriUserGeneratedContent
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denySiriUserGeneratedContent"));
}

- (void)setDenySiriUserGeneratedContent:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denySiriUserGeneratedContent"));
}

+ (MOBoolSettingMetadata)denySiriUserGeneratedContentMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MOSiriSettingsGroup_denySiriUserGeneratedContentMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySiriUserGeneratedContentMetadata_onceToken != -1)
    dispatch_once(&denySiriUserGeneratedContentMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denySiriUserGeneratedContentMetadata_metadata;
}

void __59__MOSiriSettingsGroup_denySiriUserGeneratedContentMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denySiriUserGeneratedContent"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denySiriUserGeneratedContentMetadata_metadata;
  denySiriUserGeneratedContentMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)forceSiriProfanityFilter
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("forceSiriProfanityFilter"));
}

- (void)setForceSiriProfanityFilter:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("forceSiriProfanityFilter"));
}

+ (MOBoolSettingMetadata)forceSiriProfanityFilterMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MOSiriSettingsGroup_forceSiriProfanityFilterMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceSiriProfanityFilterMetadata_onceToken != -1)
    dispatch_once(&forceSiriProfanityFilterMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)forceSiriProfanityFilterMetadata_metadata;
}

void __55__MOSiriSettingsGroup_forceSiriProfanityFilterMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("forceSiriProfanityFilter"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)forceSiriProfanityFilterMetadata_metadata;
  forceSiriProfanityFilterMetadata_metadata = (uint64_t)v2;

}

@end
