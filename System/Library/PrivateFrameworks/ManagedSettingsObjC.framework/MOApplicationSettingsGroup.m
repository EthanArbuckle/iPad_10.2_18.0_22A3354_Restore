@implementation MOApplicationSettingsGroup

+ (id)groupName
{
  return CFSTR("application");
}

- (NSSet)blockedApplications
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("blockedApplications"));
}

- (void)setBlockedApplications:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("blockedApplications"));
}

+ (MOApplicationSetSettingMetadata)blockedApplicationsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MOApplicationSettingsGroup_blockedApplicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blockedApplicationsMetadata_onceToken != -1)
    dispatch_once(&blockedApplicationsMetadata_onceToken, block);
  return (MOApplicationSetSettingMetadata *)(id)blockedApplicationsMetadata_metadata;
}

void __57__MOApplicationSettingsGroup_blockedApplicationsMetadata__block_invoke()
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
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("blockedApplications"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, 50, 1, CFSTR("user"), v6);
  v5 = (void *)blockedApplicationsMetadata_metadata;
  blockedApplicationsMetadata_metadata = v4;

}

- (NSNumber)denyAppClips
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyAppClips"));
}

- (void)setDenyAppClips:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyAppClips"));
}

+ (MOBoolSettingMetadata)denyAppClipsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MOApplicationSettingsGroup_denyAppClipsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppClipsMetadata_onceToken != -1)
    dispatch_once(&denyAppClipsMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyAppClipsMetadata_metadata;
}

void __50__MOApplicationSettingsGroup_denyAppClipsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyAppClips"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyAppClipsMetadata_metadata;
  denyAppClipsMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyAppInstallation
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyAppInstallation"));
}

- (void)setDenyAppInstallation:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyAppInstallation"));
}

+ (MOBoolSettingMetadata)denyAppInstallationMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MOApplicationSettingsGroup_denyAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppInstallationMetadata_onceToken != -1)
    dispatch_once(&denyAppInstallationMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyAppInstallationMetadata_metadata;
}

void __57__MOApplicationSettingsGroup_denyAppInstallationMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyAppInstallation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyAppInstallationMetadata_metadata;
  denyAppInstallationMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyAppRemoval
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyAppRemoval"));
}

- (void)setDenyAppRemoval:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyAppRemoval"));
}

+ (MOBoolSettingMetadata)denyAppRemovalMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MOApplicationSettingsGroup_denyAppRemovalMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppRemovalMetadata_onceToken != -1)
    dispatch_once(&denyAppRemovalMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyAppRemovalMetadata_metadata;
}

void __52__MOApplicationSettingsGroup_denyAppRemovalMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyAppRemoval"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyAppRemovalMetadata_metadata;
  denyAppRemovalMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyBackgroundAppRefresh
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyBackgroundAppRefresh"));
}

- (void)setDenyBackgroundAppRefresh:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyBackgroundAppRefresh"));
}

+ (MOBoolSettingMetadata)denyBackgroundAppRefreshMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MOApplicationSettingsGroup_denyBackgroundAppRefreshMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyBackgroundAppRefreshMetadata_onceToken != -1)
    dispatch_once(&denyBackgroundAppRefreshMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyBackgroundAppRefreshMetadata_metadata;
}

void __62__MOApplicationSettingsGroup_denyBackgroundAppRefreshMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyBackgroundAppRefresh"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyBackgroundAppRefreshMetadata_metadata;
  denyBackgroundAppRefreshMetadata_metadata = (uint64_t)v2;

}

- (NSSet)unremovableApplications
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("unremovableApplications"));
}

- (void)setUnremovableApplications:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("unremovableApplications"));
}

+ (MOApplicationSetSettingMetadata)unremovableApplicationsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MOApplicationSettingsGroup_unremovableApplicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unremovableApplicationsMetadata_onceToken != -1)
    dispatch_once(&unremovableApplicationsMetadata_onceToken, block);
  return (MOApplicationSetSettingMetadata *)(id)unremovableApplicationsMetadata_metadata;
}

void __61__MOApplicationSettingsGroup_unremovableApplicationsMetadata__block_invoke()
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
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("unremovableApplications"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("user"), v6);
  v5 = (void *)unremovableApplicationsMetadata_metadata;
  unremovableApplicationsMetadata_metadata = v4;

}

@end
