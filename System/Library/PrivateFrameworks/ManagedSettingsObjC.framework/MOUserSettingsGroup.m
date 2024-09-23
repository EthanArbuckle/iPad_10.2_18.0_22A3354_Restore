@implementation MOUserSettingsGroup

+ (id)groupName
{
  return CFSTR("user");
}

- (NSNumber)denySharing
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denySharing"));
}

- (void)setDenySharing:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denySharing"));
}

+ (MOBoolSettingMetadata)denySharingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MOUserSettingsGroup_denySharingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySharingMetadata_onceToken != -1)
    dispatch_once(&denySharingMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denySharingMetadata_metadata;
}

void __42__MOUserSettingsGroup_denySharingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denySharing"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denySharingMetadata_metadata;
  denySharingMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyUnrestrictedSharing
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyUnrestrictedSharing"));
}

- (void)setDenyUnrestrictedSharing:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyUnrestrictedSharing"));
}

+ (MOBoolSettingMetadata)denyUnrestrictedSharingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MOUserSettingsGroup_denyUnrestrictedSharingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyUnrestrictedSharingMetadata_onceToken != -1)
    dispatch_once(&denyUnrestrictedSharingMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyUnrestrictedSharingMetadata_metadata;
}

void __54__MOUserSettingsGroup_denyUnrestrictedSharingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyUnrestrictedSharing"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 1, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyUnrestrictedSharingMetadata_metadata;
  denyUnrestrictedSharingMetadata_metadata = (uint64_t)v2;

}

- (NSString)sharingPolicy
{
  return (NSString *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("sharingPolicy"));
}

- (void)setSharingPolicy:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("sharingPolicy"));
}

+ (MOStringSettingMetadata)sharingPolicyMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MOUserSettingsGroup_sharingPolicyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharingPolicyMetadata_onceToken != -1)
    dispatch_once(&sharingPolicyMetadata_onceToken, block);
  return (MOStringSettingMetadata *)(id)sharingPolicyMetadata_metadata;
}

void __44__MOUserSettingsGroup_sharingPolicyMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOStringSettingMetadata *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("sharingPolicy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOStringSettingMetadata alloc];
  v8[0] = CFSTR("none");
  v8[1] = CFSTR("unrestricted");
  v9[0] = &unk_1E6768B78;
  v9[1] = &unk_1E6768B90;
  v8[2] = CFSTR("restricted");
  v9[2] = &unk_1E6768BA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  v5 = -[MOStringSettingMetadata initWithSettingName:defaultString:combineOperator:rankedAllowedValues:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultString:combineOperator:rankedAllowedValues:isPublic:scope:isPrivacySensitive:", v2, CFSTR("none"), 1, v4, 0, CFSTR("user"), v7);
  v6 = (void *)sharingPolicyMetadata_metadata;
  sharingPolicyMetadata_metadata = v5;

}

@end
