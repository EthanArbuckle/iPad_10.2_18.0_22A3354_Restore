@implementation MOScreenTimeSettingsGroup

+ (id)groupName
{
  return CFSTR("screenTime");
}

- (NSDictionary)applicationShieldPolicies
{
  return (NSDictionary *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("applicationShieldPolicies"));
}

- (void)setApplicationShieldPolicies:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("applicationShieldPolicies"));
}

+ (MOPersistableKeyStringDictionarySettingMetadata)applicationShieldPoliciesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MOScreenTimeSettingsGroup_applicationShieldPoliciesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applicationShieldPoliciesMetadata_onceToken != -1)
    dispatch_once(&applicationShieldPoliciesMetadata_onceToken, block);
  return (MOPersistableKeyStringDictionarySettingMetadata *)(id)applicationShieldPoliciesMetadata_metadata;
}

void __62__MOScreenTimeSettingsGroup_applicationShieldPoliciesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOPersistableKeyStringDictionarySettingMetadata *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("applicationShieldPolicies"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOPersistableKeyStringDictionarySettingMetadata alloc];
  v4 = objc_opt_class();
  v10[0] = CFSTR("none");
  v10[1] = CFSTR("warn");
  v11[0] = &unk_1E6768AB8;
  v11[1] = &unk_1E6768AD0;
  v10[2] = CFSTR("ask");
  v10[3] = CFSTR("askPending");
  v11[2] = &unk_1E6768AE8;
  v11[3] = &unk_1E6768B00;
  v10[4] = CFSTR("blocked");
  v11[4] = &unk_1E6768B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  v6 = -[MOPersistableKeyStringDictionarySettingMetadata initWithSettingName:defaultDictionary:persistableKeyClass:combineOperator:rankedAllowedValues:maximumCount:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultDictionary:persistableKeyClass:combineOperator:rankedAllowedValues:maximumCount:isPublic:scope:isPrivacySensitive:", v2, MEMORY[0x1E0C9AA70], v4, 1, v5, -1, v8, CFSTR("user"), v9);
  v7 = (void *)applicationShieldPoliciesMetadata_metadata;
  applicationShieldPoliciesMetadata_metadata = v6;

}

- (NSDictionary)categoryShieldPolicies
{
  return (NSDictionary *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("categoryShieldPolicies"));
}

- (void)setCategoryShieldPolicies:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("categoryShieldPolicies"));
}

+ (MOPersistableKeyStringDictionarySettingMetadata)categoryShieldPoliciesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MOScreenTimeSettingsGroup_categoryShieldPoliciesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (categoryShieldPoliciesMetadata_onceToken != -1)
    dispatch_once(&categoryShieldPoliciesMetadata_onceToken, block);
  return (MOPersistableKeyStringDictionarySettingMetadata *)(id)categoryShieldPoliciesMetadata_metadata;
}

void __59__MOScreenTimeSettingsGroup_categoryShieldPoliciesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOPersistableKeyStringDictionarySettingMetadata *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("categoryShieldPolicies"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOPersistableKeyStringDictionarySettingMetadata alloc];
  v4 = objc_opt_class();
  v10[0] = CFSTR("none");
  v10[1] = CFSTR("warn");
  v11[0] = &unk_1E6768AB8;
  v11[1] = &unk_1E6768AD0;
  v10[2] = CFSTR("ask");
  v10[3] = CFSTR("askPending");
  v11[2] = &unk_1E6768AE8;
  v11[3] = &unk_1E6768B00;
  v10[4] = CFSTR("blocked");
  v11[4] = &unk_1E6768B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  v6 = -[MOPersistableKeyStringDictionarySettingMetadata initWithSettingName:defaultDictionary:persistableKeyClass:combineOperator:rankedAllowedValues:maximumCount:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultDictionary:persistableKeyClass:combineOperator:rankedAllowedValues:maximumCount:isPublic:scope:isPrivacySensitive:", v2, MEMORY[0x1E0C9AA70], v4, 1, v5, -1, v8, CFSTR("user"), v9);
  v7 = (void *)categoryShieldPoliciesMetadata_metadata;
  categoryShieldPoliciesMetadata_metadata = v6;

}

- (NSDictionary)webDomainShieldPolicies
{
  return (NSDictionary *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("webDomainShieldPolicies"));
}

- (void)setWebDomainShieldPolicies:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("webDomainShieldPolicies"));
}

+ (MOPersistableKeyStringDictionarySettingMetadata)webDomainShieldPoliciesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MOScreenTimeSettingsGroup_webDomainShieldPoliciesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (webDomainShieldPoliciesMetadata_onceToken != -1)
    dispatch_once(&webDomainShieldPoliciesMetadata_onceToken, block);
  return (MOPersistableKeyStringDictionarySettingMetadata *)(id)webDomainShieldPoliciesMetadata_metadata;
}

void __60__MOScreenTimeSettingsGroup_webDomainShieldPoliciesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOPersistableKeyStringDictionarySettingMetadata *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("webDomainShieldPolicies"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOPersistableKeyStringDictionarySettingMetadata alloc];
  v4 = objc_opt_class();
  v10[0] = CFSTR("none");
  v10[1] = CFSTR("warn");
  v11[0] = &unk_1E6768AB8;
  v11[1] = &unk_1E6768AD0;
  v10[2] = CFSTR("ask");
  v10[3] = CFSTR("askPending");
  v11[2] = &unk_1E6768AE8;
  v11[3] = &unk_1E6768B00;
  v10[4] = CFSTR("blocked");
  v11[4] = &unk_1E6768B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  v6 = -[MOPersistableKeyStringDictionarySettingMetadata initWithSettingName:defaultDictionary:persistableKeyClass:combineOperator:rankedAllowedValues:maximumCount:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultDictionary:persistableKeyClass:combineOperator:rankedAllowedValues:maximumCount:isPublic:scope:isPrivacySensitive:", v2, MEMORY[0x1E0C9AA70], v4, 1, v5, -1, v8, CFSTR("user"), v9);
  v7 = (void *)webDomainShieldPoliciesMetadata_metadata;
  webDomainShieldPoliciesMetadata_metadata = v6;

}

@end
