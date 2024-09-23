@implementation MSDLanguageAndRegionHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_1);
  return (id)sharedInstance_shared_0;
}

void __44__MSDLanguageAndRegionHelper_sharedInstance__block_invoke()
{
  MSDLanguageAndRegionHelper *v0;
  void *v1;

  v0 = objc_alloc_init(MSDLanguageAndRegionHelper);
  v1 = (void *)sharedInstance_shared_0;
  sharedInstance_shared_0 = (uint64_t)v0;

}

- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDLanguageAndRegionHelper _systemLocalizedLanguageCodeFromArray:](self, "_systemLocalizedLanguageCodeFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  defaultLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_22A6E6000, v10, OS_LOG_TYPE_DEFAULT, "Setting device language to %{public}@ (%{public}@) and region code to %{public}@.", (uint8_t *)&v14, 0x20u);
  }

  if (-[MSDLanguageAndRegionHelper _isCurrentDeviceLanguage:andRegion:](self, "_isCurrentDeviceLanguage:andRegion:", v9, v7))
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543874;
      v15 = v6;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_22A6E6000, v11, OS_LOG_TYPE_DEFAULT, "Device already has language %{public}@ (%{public}@) and region %{public}@", (uint8_t *)&v14, 0x20u);
    }

    v12 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE5C360], "setRegion:", v7);
    objc_msgSend(MEMORY[0x24BE5C360], "setLanguage:", v9);
    v12 = 0;
  }

  return v12;
}

- (id)getCurrentDeviceLanguage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDLanguageAndRegionHelper _systemLocalizedLanguageCodeFromArray:](self, "_systemLocalizedLanguageCodeFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getCurrentDevicePreferredLanguage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getCurrentDeviceRegion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getCurrentLocaleCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MSDLanguageAndRegionHelper getCurrentDevicePreferredLanguage](self, "getCurrentDevicePreferredLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDLanguageAndRegionHelper getCurrentDeviceRegion](self, "getCurrentDeviceRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[MSDLanguageAndRegionHelper getCurrentDeviceLanguage](self, "getCurrentDeviceLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    -[MSDLanguageAndRegionHelper getCurrentDeviceRegion](self, "getCurrentDeviceRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_systemLocalizedLanguageCodeFromArray:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  objc_msgSend(v4, "systemLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizationsFromArray:forPreferences:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
