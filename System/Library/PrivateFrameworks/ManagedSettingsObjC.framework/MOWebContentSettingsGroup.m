@implementation MOWebContentSettingsGroup

+ (id)groupName
{
  return CFSTR("webContent");
}

- (MOWebContentFilterPolicy)blockedByFilter
{
  return (MOWebContentFilterPolicy *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("blockedByFilter"));
}

- (void)setBlockedByFilter:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("blockedByFilter"));
}

+ (MOWebContentFilterPolicySettingMetadata)blockedByFilterMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MOWebContentSettingsGroup_blockedByFilterMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blockedByFilterMetadata_onceToken != -1)
    dispatch_once(&blockedByFilterMetadata_onceToken, block);
  return (MOWebContentFilterPolicySettingMetadata *)(id)blockedByFilterMetadata_metadata;
}

void __52__MOWebContentSettingsGroup_blockedByFilterMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOWebContentFilterPolicySettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("blockedByFilter"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOWebContentFilterPolicySettingMetadata alloc];
  +[MOWebContentFilterPolicy nonePolicy](MOWebContentFilterPolicy, "nonePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  v4 = -[MOWebContentFilterPolicySettingMetadata initWithSettingName:defaultPolicy:maximumAutoAllowCount:maximumNeverAllowCount:maximumOnlyAllowCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultPolicy:maximumAutoAllowCount:maximumNeverAllowCount:maximumOnlyAllowCount:isPublic:scope:isPrivacySensitive:", v7, v3, 50, 50, 50, 1, CFSTR("user"), v6);
  v5 = (void *)blockedByFilterMetadata_metadata;
  blockedByFilterMetadata_metadata = v4;

}

@end
