@implementation MOUserSafetySettingsGroup

+ (MOUserSafetyScanningPolicySettingMetadata)scanningPolicyMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MOUserSafetySettingsGroup_scanningPolicyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (scanningPolicyMetadata_onceToken != -1)
    dispatch_once(&scanningPolicyMetadata_onceToken, block);
  return (MOUserSafetyScanningPolicySettingMetadata *)(id)scanningPolicyMetadata_metadata;
}

+ (id)groupName
{
  return CFSTR("userSafety");
}

- (MOUserSafetyScanningPolicy)scanningPolicy
{
  return (MOUserSafetyScanningPolicy *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("scanningPolicy"));
}

void __51__MOUserSafetySettingsGroup_scanningPolicyMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOUserSafetyScanningPolicySettingMetadata *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("scanningPolicy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOUserSafetyScanningPolicySettingMetadata alloc];
  +[MOUserSafetyScanningPolicy nonePolicy](MOUserSafetyScanningPolicy, "nonePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("child");
  v9[1] = CFSTR("teen");
  v10[0] = &unk_1E6768C38;
  v10[1] = &unk_1E6768C50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = -[MOUserSafetyScanningPolicySettingMetadata initWithSettingName:defaultPolicy:interventionCombineOperator:rankedInterventionTypes:maximumApplicationCount:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultPolicy:interventionCombineOperator:rankedInterventionTypes:maximumApplicationCount:isPublic:scope:isPrivacySensitive:", v2, v4, 0, v5, -1, 0, CFSTR("user"), v8);
  v7 = (void *)scanningPolicyMetadata_metadata;
  scanningPolicyMetadata_metadata = v6;

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
  block[2] = __51__MOUserSafetySettingsGroup_allowedClientsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientsMetadata_onceToken_0 != -1)
    dispatch_once(&allowedClientsMetadata_onceToken_0, block);
  return (MOApplicationSetSettingMetadata *)(id)allowedClientsMetadata_metadata_0;
}

void __51__MOUserSafetySettingsGroup_allowedClientsMetadata__block_invoke()
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
  v5 = (void *)allowedClientsMetadata_metadata_0;
  allowedClientsMetadata_metadata_0 = v4;

}

- (void)setScanningPolicy:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("scanningPolicy"));
}

@end
