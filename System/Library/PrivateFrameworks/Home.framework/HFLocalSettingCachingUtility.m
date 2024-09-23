@implementation HFLocalSettingCachingUtility

void __46__HFLocalSettingCachingUtility_sharedInstance__block_invoke()
{
  HFLocalSettingCachingUtility *v0;
  void *v1;

  v0 = objc_alloc_init(HFLocalSettingCachingUtility);
  v1 = (void *)_MergedGlobals_213;
  _MergedGlobals_213 = (uint64_t)v0;

}

- (HFLocalSettingCachingUtility)init
{
  HFLocalSettingCachingUtility *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFLocalSettingCachingUtility;
  v2 = -[HFLocalSettingCachingUtility init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[HFLocalSettingCachingUtility setSettingCache:](v2, "setSettingCache:", v3);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFLocalSettingCachingUtility setDefaults:](v2, "setDefaults:", v4);

  }
  return v2;
}

- (void)setSettingCache:(id)a3
{
  objc_storeStrong((id *)&self->_settingCache, a3);
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (BOOL)getWelcomeBannerDismissedLocalCachedValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HFLocalSettingCachingUtility _getWelcomeBannerDismissedKey:](self, "_getWelcomeBannerDismissedKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocalSettingCachingUtility _getValueForSetting:](self, "_getValueForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (id)_getWelcomeBannerDismissedKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("root.home.dismissedWelcomeUI"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HFLocalSettingCachingUtility settingCache](self, "settingCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[HFLocalSettingCachingUtility defaults](self, "defaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HFLocalSettingCachingUtility defaults](self, "defaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKey:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[HFLocalSettingCachingUtility settingCache](self, "settingCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v4);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSMutableDictionary)settingCache
{
  return self->_settingCache;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

+ (id)sharedInstance
{
  if (qword_1ED378C40 != -1)
    dispatch_once(&qword_1ED378C40, &__block_literal_global_9);
  return (id)_MergedGlobals_213;
}

- (void)setWelcomeBannerDismissedLocalCachedValue:(BOOL)a3 home:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[HFLocalSettingCachingUtility _getWelcomeBannerDismissedKey:](self, "_getWelcomeBannerDismissedKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocalSettingCachingUtility _setValueForSetting:settingValue:](self, "_setValueForSetting:settingValue:", v7, v6);

}

- (void)_setValueForSetting:(id)a3 settingValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HFLocalSettingCachingUtility defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v6, v7);

  -[HFLocalSettingCachingUtility settingCache](self, "settingCache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_settingCache, 0);
}

@end
