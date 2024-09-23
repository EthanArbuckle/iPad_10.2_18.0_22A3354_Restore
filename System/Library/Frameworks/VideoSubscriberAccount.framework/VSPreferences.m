@implementation VSPreferences

- (NSUserDefaults)userDefaults
{
  VSPreferences *v2;
  NSUserDefaults *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_userDefaults;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_userDefaults, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (NSUserDefaults)globalUserDefaults
{
  VSPreferences *v2;
  NSUserDefaults *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_globalUserDefaults;
  if (!v3)
  {
    v3 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.VideoSubscriberAccount"));
    objc_storeStrong((id *)&v2->_globalUserDefaults, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (int64_t)forcedAvailabilityStatus
{
  void *v2;
  int64_t v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("VSForcedAvailabilityStatus"));

  return v3;
}

- (int64_t)cachedAvailabilityStatus
{
  void *v2;
  int64_t v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("VSIdentityProviderAvailabilityStatus"));

  return v3;
}

- (VSDevice)device
{
  VSPreferences *v2;
  VSDevice *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  if (!v3)
  {
    +[VSDevice currentDevice](VSDevice, "currentDevice");
    v3 = (VSDevice *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_device, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (void)_updateValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Updating value for key %@ to %@", (uint8_t *)&v13, 0x16u);
  }

  -[VSPreferences userDefaults](self, "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPreferences undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "valueForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prepareWithInvocationTarget:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_updateValue:forKey:", v11, v7);

  }
  if (v6)
    objc_msgSend(v9, "setValue:forKey:", v6, v7);
  else
    objc_msgSend(v9, "removeObjectForKey:", v7);

}

- (BOOL)shouldSkipSetup
{
  void *v2;
  char v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VSSkipSetup"));

  return v3;
}

- (void)_updateShouldSkipSetupWithNumber:(id)a3
{
  -[VSPreferences _updateValue:forKey:](self, "_updateValue:forKey:", a3, CFSTR("VSSkipSetup"));
}

- (void)setShouldSkipSetup
{
  -[VSPreferences _updateShouldSkipSetupWithNumber:](self, "_updateShouldSkipSetupWithNumber:", MEMORY[0x1E0C9AAB0]);
}

- (void)removeSkipSetupPreset
{
  -[VSPreferences _updateValue:forKey:](self, "_updateValue:forKey:", 0, CFSTR("VSSkipSetup"));
}

- (void)setCachedAvailabilityStatus:(int64_t)a3
{
  id v4;

  -[VSPreferences userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VSIdentityProviderAvailabilityStatus"));

}

- (int64_t)cachedDeveloperProviderStatus
{
  void *v2;
  int64_t v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("VSDeveloperIdentityProviderAvailabilityStatus"));

  return v3;
}

- (void)setCachedDeveloperProviderStatus:(int64_t)a3
{
  id v4;

  -[VSPreferences userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VSDeveloperIdentityProviderAvailabilityStatus"));

}

- (int64_t)cachedStoreProviderStatus
{
  void *v2;
  int64_t v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("VSStoreIdentityProviderAvailabilityStatus"));

  return v3;
}

- (void)setCachedStoreProviderStatus:(int64_t)a3
{
  id v4;

  -[VSPreferences userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VSStoreIdentityProviderAvailabilityStatus"));

}

- (BOOL)allowNonSystemTrust
{
  void *v3;
  char v4;
  void *v5;

  -[VSPreferences userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("VSIgnoreExtendedValidation")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLForKey:", CFSTR("VSIgnoreExtendedValidation"));

  }
  return v4;
}

- (BOOL)allowInsecureAuthContext
{
  void *v3;
  char v4;
  void *v5;

  -[VSPreferences userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("VSAllowInsecureAuthContext")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLForKey:", CFSTR("VSAllowInsecureAuthContext"));

  }
  return v4;
}

- (NSURL)overridingAppBootURL
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[VSPreferences device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningAnInternalBuild");

  if (v4)
  {
    -[VSPreferences userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("vsa-boot-url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      if (!v6)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The bootURLStrOrNil parameter must not be nil."));
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return (NSURL *)v7;
}

- (BOOL)shouldDisableRequestTimeouts
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[VSPreferences device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningAnInternalBuild");

  if (!v4)
    return 0;
  -[VSPreferences userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("vsa-disable-timeouts"));

  return v6;
}

- (BOOL)shouldAlwaysAllowRemoteInspection
{
  void *v2;
  char v3;

  -[VSPreferences device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningAnInternalBuild");

  return v3;
}

- (BOOL)hasChosenDesiredApp
{
  void *v2;
  void *v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSProviderAppInstallMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)noteDesiredApp:(id)a3
{
  -[VSPreferences _updateValue:forKey:](self, "_updateValue:forKey:", a3, CFSTR("VSProviderAppInstallMetadata"));
}

- (BOOL)isInSTBMode
{
  void *v2;
  void *v3;
  char v4;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSProviderIsInSTBMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setIsInSTBMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSPreferences _updateValue:forKey:](self, "_updateValue:forKey:", v4, CFSTR("VSProviderIsInSTBMode"));

}

- (BOOL)setTopBoxInfoIsSetTopBoxOverride
{
  void *v2;
  char v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VSSetTopBoxInfoIsSetTopBoxOverride"));

  return v3;
}

- (NSString)setTopBoxInfoProviderIdOverride
{
  void *v2;
  void *v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSSetTopBoxInfoProviderIdOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)setTopBoxInfoProviderDisplayNameOverride
{
  void *v2;
  void *v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSSetTopBoxInfoProviderDisplayNameOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)setTopBoxInfoAppAdamIdOverride
{
  void *v2;
  void *v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSSetTopBoxInfoAppAdamIdOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)setTopBoxInfoBundleIdentifierOverride
{
  void *v2;
  void *v3;

  -[VSPreferences userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSSetTopBoxBundleIdentifierOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setIgnoreSetTopBoxProfile:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VSIgnoreSetTopBoxProfile"));

}

- (BOOL)ignoreSetTopBoxProfile
{
  void *v2;
  char v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VSIgnoreSetTopBoxProfile"));

  return v3;
}

- (NSString)metricUserID
{
  void *v2;
  void *v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("VSMetricUserID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMetricUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("VSMetricUserID"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("VSMetricUserIDLastGenerated"));

}

- (NSDate)setTopBoxActivationTime
{
  void *v2;
  double v3;
  double v4;
  void *v5;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("VSSetTopBoxActivationTime"));
  v4 = v3;

  if (v4 <= 0.0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v5;
}

- (void)setSetTopBoxActivationTime
{
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDouble:forKey:", CFSTR("VSSetTopBoxActivationTime"), v5);

}

- (void)clearSetTopBoxActivationTime
{
  id v2;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("VSSetTopBoxActivationTime"));

}

- (NSDate)metricUserIDLastGenerated
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("VSMetricUserIDLastGenerated"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)featureIsEnabled:(id)a3 present:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("VSFeature"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = v9 != 0;
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

- (void)enableFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("VSFeature"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBool:forKey:", 1, v5);
}

- (void)disableFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("VSFeature"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBool:forKey:", 0, v5);
}

- (void)clearFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("VSFeature"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (BOOL)performedSubcriptionToUserAccountMigration
{
  void *v2;
  char v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VSPerformedSubToUserAccountMigration"));

  return v3;
}

- (void)setPerformedSubcriptionToUserAccountMigration
{
  id v2;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("VSPerformedSubToUserAccountMigration"));

}

- (BOOL)shouldUseLegacyVendorIdentifier
{
  return 0;
}

- (BOOL)useLegacyVendorIdentifier
{
  return 0;
}

- (NSDictionary)vendorIdentifierDictionary
{
  void *v2;
  id v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("VSVendorIdentifierTable"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  return (NSDictionary *)v3;
}

- (void)setVendorIdentifierDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("VSVendorIdentifierTable"));

}

- (BOOL)flushMetrics
{
  void *v2;
  char v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VSFlushMetrics"));

  return v3;
}

- (NSString)forceSingleProviderID
{
  void *v2;
  void *v3;

  -[VSPreferences globalUserDefaults](self, "globalUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("VSForceSingleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void)setGlobalUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_globalUserDefaults, a3);
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_globalUserDefaults, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end
