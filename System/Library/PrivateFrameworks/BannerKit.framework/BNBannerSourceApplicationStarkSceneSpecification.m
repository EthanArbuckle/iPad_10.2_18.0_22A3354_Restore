@implementation BNBannerSourceApplicationStarkSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInternal
{
  return 1;
}

- (id)baseSceneComponentClassDictionary
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BNBannerSourceApplicationStarkSceneSpecification;
  -[UIApplicationStarkSceneSpecification baseSceneComponentClassDictionary](&v9, sel_baseSceneComponentClassDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (id)objc_msgSend(v2, "mutableCopy");
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  v6 = objc_opt_class();
  BNBundleIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

  return v5;
}

@end
