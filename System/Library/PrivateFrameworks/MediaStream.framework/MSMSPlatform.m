@implementation MSMSPlatform

- (void)_rereadDefaults
{
  CFIndex AppIntegerValue;
  CFIndex v4;
  int isPerfLoggingEnabled;
  int v6;
  BOOL v7;
  void *v8;
  Boolean v9;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MSPerfLogLevel"), CFSTR("com.apple.mediastream"), &keyExistsAndHasValidFormat);
  v9 = 0;
  v4 = CFPreferencesGetAppIntegerValue(CFSTR("MSPerfOutputLevel"), CFSTR("com.apple.mediastream"), &v9);
  isPerfLoggingEnabled = self->_isPerfLoggingEnabled;
  if (!keyExistsAndHasValidFormat || AppIntegerValue < 0)
  {
    if (v9)
      v7 = v4 < 0;
    else
      v7 = 1;
    v6 = !v7;
  }
  else
  {
    v6 = 1;
  }
  self->_isPerfLoggingEnabled = v6;
  if (v6 != isPerfLoggingEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("MSPlatformPerformanceLoggingSettingDidChange"), self);

  }
}

- (MSMSPlatform)init
{
  MSMSPlatform *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  NSObject *v5;
  id v6;
  _QWORD handler[4];
  id v9;
  int out_token;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MSMSPlatform;
  v2 = -[MSMSPlatform init](&v12, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    objc_initWeak(&location, v2);
    out_token = 0;
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __20__MSMSPlatform_init__block_invoke;
    handler[3] = &unk_1E994D610;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.managedconfiguration.defaultsdidchange", &out_token, v5, handler);

    -[MSMSPlatform _rereadDefaults](v2, "_rereadDefaults");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)shouldLogAtLevel:(int)a3
{
  return a3 != 7 || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
}

- (__CFString)_facilityStringForFacility:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1E994D710[a3];
}

- (void)logFacility:(int)a3 level:(int)a4 format:(id)a5 args:(char *)a6
{
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = a5;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unexpected call to legacy logging method, please switch to os_log(): %@", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)isPerformanceLoggingEnabled
{
  return self->_isPerfLoggingEnabled;
}

- (void)logFile:(const char *)a3 func:(const char *)a4 line:(int)a5 facility:(int)a6 level:(int)a7 format:(id)a8 args:(char *)a9
{
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = a8;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unexpected call to legacy logging method, please switch to os_log(): %@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)pathMediaStreamDir
{
  if (pathMediaStreamDir_once != -1)
    dispatch_once(&pathMediaStreamDir_once, &__block_literal_global_24);
  return (id)pathMediaStreamDir_path;
}

- (Class)pluginClass
{
  void *v2;
  id v3;

  if (pluginClass_onceToken != -1)
    dispatch_once(&pluginClass_onceToken, &__block_literal_global_30_191);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", pluginClass_pluginPath);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "principalClass");

  return (Class)v3;
}

- (Class)publisherPluginClass
{
  objc_class *v2;
  int v4;
  objc_class *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[MSMSPlatform pluginClass](self, "pluginClass");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "publisherPluginClass principalClass %{public}@", (uint8_t *)&v4, 0xCu);
  }
  return v2;
}

- (Class)subscriberPluginClass
{
  objc_class *v2;
  int v4;
  objc_class *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[MSMSPlatform pluginClass](self, "pluginClass");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "subscriberPluginClass principalClass %{public}@", (uint8_t *)&v4, 0xCu);
  }
  return v2;
}

- (Class)deletePluginClass
{
  objc_class *v2;
  int v4;
  objc_class *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[MSMSPlatform pluginClass](self, "pluginClass");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "deleterPluginClass principalClass %{public}@", (uint8_t *)&v4, 0xCu);
  }
  return v2;
}

- (id)UDID
{
  if (UDID_once != -1)
    dispatch_once(&UDID_once, &__block_literal_global_36);
  return (id)UDID_UDID;
}

- (id)OSVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatingSystemVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringForSysctlKey:(id)a3
{
  size_t v4;
  _BYTE v5[256];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 256;
  if (sysctlbyname((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v5, &v4, 0, 0))
    return CFSTR("UNKNOWN");
  v5[v4 - 1] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hardwareString
{
  if (hardwareString_once != -1)
    dispatch_once(&hardwareString_once, &__block_literal_global_40);
  return (id)hardwareString_productType;
}

- (id)OSString
{
  if (OSString_once != -1)
    dispatch_once(&OSString_once, &__block_literal_global_49);
  return (id)OSString_string;
}

- (id)appBundleInfoString
{
  if (appBundleInfoString_once != -1)
    dispatch_once(&appBundleInfoString_once, &__block_literal_global_55);
  return (id)appBundleInfoString_string;
}

- (BOOL)_mayPerformFileTransfer
{
  void *v2;
  char v3;
  double v4;
  double v5;
  void *v6;
  char v7;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[MSBatteryPowerMonitor defaultMonitor](MSBatteryPowerMonitor, "defaultMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isExternalPowerConnected") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "batteryPercentRemaining");
    v5 = v4;
    v3 = 1;
    if (v4 != -1.0 && v4 < 0.2)
    {
      v3 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = v5 * 100.0;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Battery level is too low to continue at %.1f%%.", (uint8_t *)&v9, 0xCu);
        v3 = 0;
      }
    }
  }
  +[MSPauseManager sharedManager](MSPauseManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPaused");

  return v3 & (v7 ^ 1);
}

- (id)socketOptions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, *MEMORY[0x1E0C93250], *MEMORY[0x1E0C93190], *MEMORY[0x1E0C93178], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didDetectUnrecoverableCondition
{
  uint8_t v2[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Restarting mstreamd.", v2, 2u);
  }
  exit(-1);
}

- (id)_accountForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MSMSPlatform accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_appleAccountWithPersonID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)authTokenForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v4 = a3;
  -[MSMSPlatform _accountForPersonID:](self, "_accountForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "aa_authToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Missing authToken. Requesting", v10, 2u);
    }
    +[MSAuthenticationManager sharedManager](MSAuthenticationManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didEncounterAuthenticationFailureForPersonID:", v4);

    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (id)baseURLForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MSForcedBaseURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MSMSPlatform _accountForPersonID:](self, "_accountForPersonID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)contentURLForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    -[MSMSPlatform _accountForPersonID:](self, "_accountForPersonID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      goto LABEL_6;
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F398]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "URLByAppendingPathComponent:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_6:
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)personIDUsesProductionPushEnvironment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MSMSPlatform _accountForPersonID:](self, "_accountForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("apsEnv"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("production"));

  return v6;
}

- (id)pushTokenForPersonID:(id)a3
{
  return self->_pushToken;
}

- (BOOL)shouldEnableNewFeatures
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.mediastream.mstreamd"));
  return CFPreferencesGetAppBooleanValue(CFSTR("shouldEnableNewFeatures"), CFSTR("com.apple.mediastream.mstreamd"), 0) != 0;
}

- (id)fullNameFromFirstName:(id)a3 lastName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      v10 = v5;
    }
    else
    {
      if (!objc_msgSend(v6, "length"))
      {
        v9 = 0;
        goto LABEL_9;
      }
      v10 = v6;
    }
    v9 = v10;
  }
LABEL_9:

  return v9;
}

- (id)theDaemon
{
  return (id)_theDaemon;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (BOOL)isPerfLoggingEnabled
{
  return self->_isPerfLoggingEnabled;
}

- (void)setIsPerfLoggingEnabled:(BOOL)a3
{
  self->_isPerfLoggingEnabled = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

void __35__MSMSPlatform_appBundleInfoString__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C9AE78]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v1, v2);
  v4 = (void *)appBundleInfoString_string;
  appBundleInfoString_string = v3;

}

void __24__MSMSPlatform_OSString__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  objc_msgSend(v5, "objectForKey:", CFSTR("ProductName"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ProductVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ProductBuildVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@;%@;%@"), v0, v1, v2);
  v4 = (void *)OSString_string;
  OSString_string = v3;

}

void __30__MSMSPlatform_hardwareString__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)hardwareString_productType;
  hardwareString_productType = v0;

}

void __20__MSMSPlatform_UDID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)UDID_UDID;
  UDID_UDID = v0;

}

void __27__MSMSPlatform_pluginClass__block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(CFSTR("/System/Library/MediaStreamPlugins"), "stringByAppendingPathComponent:", CFSTR("PhotoStreamsPlugin.mediastream"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pluginClass_pluginPath;
  pluginClass_pluginPath = v0;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = 138543362;
    v3 = pluginClass_pluginPath;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Loading Photo Streams plugin from %{public}@", (uint8_t *)&v2, 0xCu);
  }
}

void __34__MSMSPlatform_pathMediaStreamDir__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "MSMSUserDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("MediaStream"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pathMediaStreamDir_path;
  pathMediaStreamDir_path = v1;

}

void __20__MSMSPlatform_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Re-reading defaults.", v3, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rereadDefaults");

}

+ (id)thePlatform
{
  if (thePlatform_once != -1)
    dispatch_once(&thePlatform_once, &__block_literal_global_199);
  return (id)thePlatform_platform;
}

void __27__MSMSPlatform_thePlatform__block_invoke()
{
  MSMSPlatform *v0;
  void *v1;

  v0 = objc_alloc_init(MSMSPlatform);
  v1 = (void *)thePlatform_platform;
  thePlatform_platform = (uint64_t)v0;

}

@end
