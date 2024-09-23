@implementation HUAccessoryHearingSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_8);
  return (id)sharedInstance_Settings_0;
}

void __44__HUAccessoryHearingSettings_sharedInstance__block_invoke()
{
  HUAccessoryHearingSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HUAccessoryHearingSettings);
  v1 = (void *)sharedInstance_Settings_0;
  sharedInstance_Settings_0 = (uint64_t)v0;

}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return CFSTR("com.apple.accessory.Hearing");
}

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)keysToSync
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)logMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSettings logMessage:]", 41, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (NSDictionary)activeHearingProtectionEnabled
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("activeHearingProtectionEnabled"), objc_opt_class(), 0);
}

- (void)setActiveHearingProtectionEnabled:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("activeHearingProtectionEnabled"));
}

- (NSDictionary)activeHearingProtectionAvailable
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("activeHearingProtectionAvailable"), objc_opt_class(), 0);
}

- (void)setActiveHearingProtectionAvailable:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("activeHearingProtectionAvailable"));
}

- (BOOL)activeHearingProtectionEnabledForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[HUAccessoryHearingSettings activeHearingProtectionEnabled](self, "activeHearingProtectionEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setActiveHearingProtectionEnabled:(BOOL)a3 forAddress:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[HUAccessoryHearingSettings activeHearingProtectionEnabled](self, "activeHearingProtectionEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[HUAccessoryHearingSettings setActiveHearingProtectionEnabled:](self, "setActiveHearingProtectionEnabled:", v8);
  }

}

- (BOOL)activeHearingProtectionAvailableForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[HUAccessoryHearingSettings activeHearingProtectionAvailable](self, "activeHearingProtectionAvailable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Checking available for %@ = %@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSettings activeHearingProtectionAvailableForAddress:]", 81, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      v15 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(v5, "valueForKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v12 = objc_msgSend(v11, "BOOLValue");
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setActiveHearingProtectionAvailable:(BOOL)a3 forAddress:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[HUAccessoryHearingSettings activeHearingProtectionAvailable](self, "activeHearingProtectionAvailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[HUAccessoryHearingSettings setActiveHearingProtectionAvailable:](self, "setActiveHearingProtectionAvailable:", v8);
  }

}

@end
