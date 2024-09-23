@implementation MONewsSettingsGroup

+ (id)groupName
{
  return CFSTR("news");
}

- (NSNumber)denyNews
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyNews"));
}

- (void)setDenyNews:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyNews"));
}

+ (MOBoolSettingMetadata)denyNewsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MONewsSettingsGroup_denyNewsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyNewsMetadata_onceToken != -1)
    dispatch_once(&denyNewsMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyNewsMetadata_metadata;
}

void __39__MONewsSettingsGroup_denyNewsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyNews"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyNewsMetadata_metadata;
  denyNewsMetadata_metadata = (uint64_t)v2;

}

@end
