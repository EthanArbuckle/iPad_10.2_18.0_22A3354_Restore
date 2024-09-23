@implementation MOShieldSettingsGroup

+ (MOWebDomainSetSettingMetadata)webDomainsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MOShieldSettingsGroup_webDomainsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (webDomainsMetadata_onceToken != -1)
    dispatch_once(&webDomainsMetadata_onceToken, block);
  return (MOWebDomainSetSettingMetadata *)(id)webDomainsMetadata_metadata;
}

- (NSSet)webDomains
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("webDomains"));
}

+ (MOApplicationCategoryShieldPolicySettingMetadata)applicationCategoriesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MOShieldSettingsGroup_applicationCategoriesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applicationCategoriesMetadata_onceToken != -1)
    dispatch_once(&applicationCategoriesMetadata_onceToken, block);
  return (MOApplicationCategoryShieldPolicySettingMetadata *)(id)applicationCategoriesMetadata_metadata;
}

+ (MOApplicationSetSettingMetadata)applicationsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MOShieldSettingsGroup_applicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applicationsMetadata_onceToken != -1)
    dispatch_once(&applicationsMetadata_onceToken, block);
  return (MOApplicationSetSettingMetadata *)(id)applicationsMetadata_metadata;
}

+ (id)groupName
{
  return CFSTR("shield");
}

- (NSSet)applications
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("applications"));
}

- (MOApplicationCategoryShieldPolicy)applicationCategories
{
  return (MOApplicationCategoryShieldPolicy *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("applicationCategories"));
}

+ (MOWebDomainCategoryShieldPolicySettingMetadata)webDomainCategoriesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MOShieldSettingsGroup_webDomainCategoriesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (webDomainCategoriesMetadata_onceToken != -1)
    dispatch_once(&webDomainCategoriesMetadata_onceToken, block);
  return (MOWebDomainCategoryShieldPolicySettingMetadata *)(id)webDomainCategoriesMetadata_metadata;
}

- (MOWebDomainCategoryShieldPolicy)webDomainCategories
{
  return (MOWebDomainCategoryShieldPolicy *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("webDomainCategories"));
}

- (void)setApplications:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("applications"));
}

void __45__MOShieldSettingsGroup_applicationsMetadata__block_invoke()
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
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("applications"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, 50, 1, CFSTR("user"), v6);
  v5 = (void *)applicationsMetadata_metadata;
  applicationsMetadata_metadata = v4;

}

- (void)setApplicationCategories:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("applicationCategories"));
}

void __54__MOShieldSettingsGroup_applicationCategoriesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOApplicationCategoryShieldPolicySettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("applicationCategories"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationCategoryShieldPolicySettingMetadata alloc];
  +[MOCategoryShieldPolicy nonePolicy](MOApplicationCategoryShieldPolicy, "nonePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  v4 = -[MOApplicationCategoryShieldPolicySettingMetadata initWithSettingName:defaultPolicy:maximumCategoryCount:maximumActivityCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultPolicy:maximumCategoryCount:maximumActivityCount:isPublic:scope:isPrivacySensitive:", v7, v3, 50, 50, 1, CFSTR("user"), v6);
  v5 = (void *)applicationCategoriesMetadata_metadata;
  applicationCategoriesMetadata_metadata = v4;

}

- (NSSet)unshieldableApplications
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("unshieldableApplications"));
}

- (void)setUnshieldableApplications:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("unshieldableApplications"));
}

+ (MOApplicationSetSettingMetadata)unshieldableApplicationsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MOShieldSettingsGroup_unshieldableApplicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unshieldableApplicationsMetadata_onceToken != -1)
    dispatch_once(&unshieldableApplicationsMetadata_onceToken, block);
  return (MOApplicationSetSettingMetadata *)(id)unshieldableApplicationsMetadata_metadata;
}

void __57__MOShieldSettingsGroup_unshieldableApplicationsMetadata__block_invoke()
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
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("unshieldableApplications"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("localContainer"), v6);
  v5 = (void *)unshieldableApplicationsMetadata_metadata;
  unshieldableApplicationsMetadata_metadata = v4;

}

- (NSSet)unshieldableWebDomains
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("unshieldableWebDomains"));
}

- (void)setUnshieldableWebDomains:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("unshieldableWebDomains"));
}

+ (MOWebDomainSetSettingMetadata)unshieldableWebDomainsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MOShieldSettingsGroup_unshieldableWebDomainsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unshieldableWebDomainsMetadata_onceToken != -1)
    dispatch_once(&unshieldableWebDomainsMetadata_onceToken, block);
  return (MOWebDomainSetSettingMetadata *)(id)unshieldableWebDomainsMetadata_metadata;
}

void __55__MOShieldSettingsGroup_unshieldableWebDomainsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOWebDomainSetSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("unshieldableWebDomains"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOWebDomainSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("localContainer"), v6);
  v5 = (void *)unshieldableWebDomainsMetadata_metadata;
  unshieldableWebDomainsMetadata_metadata = v4;

}

- (void)setWebDomains:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("webDomains"));
}

void __43__MOShieldSettingsGroup_webDomainsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOWebDomainSetSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("webDomains"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOWebDomainSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, 50, 1, CFSTR("user"), v6);
  v5 = (void *)webDomainsMetadata_metadata;
  webDomainsMetadata_metadata = v4;

}

- (void)setWebDomainCategories:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("webDomainCategories"));
}

void __52__MOShieldSettingsGroup_webDomainCategoriesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOWebDomainCategoryShieldPolicySettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("webDomainCategories"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOWebDomainCategoryShieldPolicySettingMetadata alloc];
  +[MOCategoryShieldPolicy nonePolicy](MOWebDomainCategoryShieldPolicy, "nonePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  v4 = -[MOWebDomainCategoryShieldPolicySettingMetadata initWithSettingName:defaultPolicy:maximumCategoryCount:maximumActivityCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultPolicy:maximumCategoryCount:maximumActivityCount:isPublic:scope:isPrivacySensitive:", v7, v3, 50, 50, 1, CFSTR("user"), v6);
  v5 = (void *)webDomainCategoriesMetadata_metadata;
  webDomainCategoriesMetadata_metadata = v4;

}

@end
