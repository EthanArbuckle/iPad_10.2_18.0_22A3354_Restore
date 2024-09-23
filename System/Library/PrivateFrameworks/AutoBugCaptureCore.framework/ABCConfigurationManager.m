@implementation ABCConfigurationManager

- (BOOL)autoBugCaptureAvailable
{
  char v3;
  char v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;

  v3 = -[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures");
  if ((v3 & 1) != 0)
    v4 = !-[ABCConfigurationManager autoBugCaptureSupportedHardware](self, "autoBugCaptureSupportedHardware");
  else
    v4 = 1;
  v5 = -[ABCPreferences disable_autobugcapture](self->_preferences, "disable_autobugcapture");
  v6 = -[ABCPreferences optin_autobugcapture](self->_preferences, "optin_autobugcapture");
  v7 = (v3 & 0x20) == 0 || v6;
  if (v5)
    v7 = 0;
  return (v4 & 1) == 0 && v7;
}

- (ABCConfigurationManager)init
{
  ABCConfigurationManager *v2;
  ABCPreferences *v3;
  ABCPreferences *preferences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABCConfigurationManager;
  v2 = -[ABCConfigurationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ABCPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v3;

    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_internal_build"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("carrier_seed_flag"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("seed_flag"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("vendor_flag"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("npi_flag"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("optin_autobugcapture"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_autobugcapture"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("ABCUserConsent"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("diagnosticsAndUsageEnabled"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("apns_enable"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("apns_dev_environment"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("is_automated_device_group"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("ignore_automated_device_group"), 1, 0);
    -[ABCPreferences addObserver:forKeyPath:options:context:](v2->_preferences, "addObserver:forKeyPath:options:context:", v2, CFSTR("autoFeedbackAssistantEnable"), 1, 0);
    -[ABCConfigurationManager initializeOverrides](v2, "initializeOverrides");
  }
  return v2;
}

+ (id)defaultLibraryDirectory
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  configurationLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "Found usable Library directory at %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = v3;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v2;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Search for usable Library directory returned empty result: %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)autoBugCapturePrefix
{
  return CFSTR("AutoBugCapture");
}

- (void)dealloc
{
  ABCPreferences *preferences;
  objc_super v4;

  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("disable_internal_build"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("carrier_seed_flag"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("seed_flag"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("vendor_flag"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("npi_flag"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("optin_autobugcapture"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("disable_autobugcapture"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("ABCUserConsent"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("diagnosticsAndUsageEnabled"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("apns_enable"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("apns_dev_environment"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("is_automated_device_group"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("ignore_automated_device_group"));
  -[ABCPreferences removeObserver:forKeyPath:](self->_preferences, "removeObserver:forKeyPath:", self, CFSTR("autoFeedbackAssistantEnable"));
  preferences = self->_preferences;
  self->_preferences = 0;

  v4.receiver = self;
  v4.super_class = (Class)ABCConfigurationManager;
  -[ABCConfigurationManager dealloc](&v4, sel_dealloc);
}

- (id)getAutoBugCaptureConfiguration
{
  objc_property_t *v3;
  objc_property_t *v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int outCount;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  outCount = 0;
  v3 = protocol_copyPropertyList((Protocol *)&unk_1F030DB40, &outCount);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v4[i]));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ABCConfigurationManager valueForKey:](self, "valueForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);

      }
    }
    configurationLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "configuration dictionary: %@", buf, 0xCu);
    }

    free(v4);
  }
  else
  {
    configurationLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "ConfigurationProperties is nil!!!!", buf, 2u);
    }

    v5 = 0;
  }
  return v5;
}

- (void)initializeOverrides
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (-[ABCPreferences disable_internal_build](self->_preferences, "disable_internal_build"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ABCPreferences disable_internal_build](self->_preferences, "disable_internal_build"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[ABCConfigurationManager setDisable_internal_build:](self, "setDisable_internal_build:", v3);
  objc_msgSend(v12, "setInternalBuildDisabledByOverride:", objc_msgSend(v3, "BOOLValue"));
  -[ABCPreferences carrier_seed_flag](self->_preferences, "carrier_seed_flag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCConfigurationManager setCarrier_seed_flag:](self, "setCarrier_seed_flag:", v4);

  -[ABCPreferences carrier_seed_flag](self->_preferences, "carrier_seed_flag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCarrierSeedBuildOverride:", v5);

  -[ABCPreferences seed_flag](self->_preferences, "seed_flag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCConfigurationManager setSeed_flag:](self, "setSeed_flag:", v6);

  -[ABCPreferences seed_flag](self->_preferences, "seed_flag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSeedBuildOverride:", v7);

  -[ABCPreferences vendor_flag](self->_preferences, "vendor_flag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCConfigurationManager setVendor_flag:](self, "setVendor_flag:", v8);

  -[ABCPreferences vendor_flag](self->_preferences, "vendor_flag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVendorBuildOverride:", v9);

  -[ABCPreferences npi_flag](self->_preferences, "npi_flag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCConfigurationManager setNpi_flag:](self, "setNpi_flag:", v10);

  -[ABCPreferences npi_flag](self->_preferences, "npi_flag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNpiDeviceOverride:", v11);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSDictionary **p_previousConfiguration;
  NSDictionary *previousConfiguration;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("disable_internal_build")))
  {
    -[ABCConfigurationManager setDisable_internal_build:](self, "setDisable_internal_build:", v11);
    objc_msgSend(v12, "setInternalBuildDisabledByOverride:", objc_msgSend(v11, "BOOLValue"));
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("carrier_seed_flag")))
  {
    -[ABCConfigurationManager setCarrier_seed_flag:](self, "setCarrier_seed_flag:", v11);
    objc_msgSend(v12, "setCarrierSeedBuildOverride:", v11);
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("seed_flag")))
  {
    -[ABCConfigurationManager setSeed_flag:](self, "setSeed_flag:", v11);
    objc_msgSend(v12, "setSeedBuildOverride:", v11);
LABEL_21:
    -[ABCConfigurationManager autoBugCaptureEnabled](self, "autoBugCaptureEnabled");
    -[ABCConfigurationManager getAutoBugCaptureConfiguration](self, "getAutoBugCaptureConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      previousConfiguration = self->_previousConfiguration;
      p_previousConfiguration = &self->_previousConfiguration;
      if (!-[NSDictionary isEqualToDictionary:](previousConfiguration, "isEqualToDictionary:", v13))
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.autobugcapture.configurationchanged"), 0, 0, 4u);
        objc_storeStrong((id *)p_previousConfiguration, v13);
        configurationLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v13;
          _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "ABC Configuration dictionary changed: %@", (uint8_t *)&v18, 0xCu);
        }

      }
    }

    goto LABEL_27;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("vendor_flag")))
  {
    -[ABCConfigurationManager setVendor_flag:](self, "setVendor_flag:", v11);
    objc_msgSend(v12, "setVendorBuildOverride:", v11);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("npi_flag")))
  {
    -[ABCConfigurationManager setNpi_flag:](self, "setNpi_flag:", v11);
    objc_msgSend(v12, "setNpiDeviceOverride:", v11);
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("optin_autobugcapture")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("disable_autobugcapture")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("ABCUserConsent")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("diagnosticsAndUsageEnabled")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("is_automated_device_group")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("ignore_automated_device_group")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("autoFeedbackAssistantEnable")))
  {
    goto LABEL_21;
  }
LABEL_27:

}

- (BOOL)autoBugCaptureSupportedHardware
{
  return 1;
}

- (BOOL)autoBugCaptureSignature
{
  return (-[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures") >> 1) & 1;
}

- (BOOL)autoBugCaptureRegularPayloads
{
  return (-[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures") >> 2) & 1;
}

- (BOOL)autoBugCaptureSensitivePayloads
{
  return (-[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures") >> 3) & 1;
}

- (BOOL)autoBugCaptureUploadPreapproved
{
  return (-[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures") >> 4) & 1;
}

- (int)autoBugCaptureFeatures
{
  void *v2;
  int v3;

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "internalBuild") & 1) != 0 || (objc_msgSend(v2, "carrierSeedBuild") & 1) != 0)
  {
    v3 = 15;
  }
  else if ((objc_msgSend(v2, "customerSeedBuild") & 1) != 0)
  {
    v3 = 7;
  }
  else if (objc_msgSend(v2, "vendorBuild"))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)autoBugCaptureEnabled
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;
  int v9;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = -[ABCConfigurationManager autoBugCaptureAvailable](self, "autoBugCaptureAvailable");
  v4 = -[ABCPreferences diagnosticsAndUsageEnabled](self->_preferences, "diagnosticsAndUsageEnabled");
  v5 = -[ABCPreferences ABCUserConsent](self->_preferences, "ABCUserConsent");
  v6 = -[ABCPreferences is_automated_device_group](self->_preferences, "is_automated_device_group");
  v7 = -[ABCPreferences ignore_automated_device_group](self->_preferences, "ignore_automated_device_group");
  v8 = !v6 || v7;
  if (!v5)
    v8 = 0;
  if (!v4)
    v8 = 0;
  if (v3)
    v9 = v8;
  else
    v9 = 0;
  if (autoBugCaptureEnabled__logPrintCount && autoBugCaptureEnabled__prevEnabledValue == v9)
  {
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * autoBugCaptureEnabled__logPrintCount, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      configurationLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        if (v9)
          v16 = "ON";
        else
          v16 = "OFF";
        if (v7)
          v17 = "(ignored)";
        else
          v17 = "";
        if (v3)
          v18 = "";
        else
          v18 = "not ";
        *(_DWORD *)buf = 136316674;
        v20 = v16;
        v21 = 1024;
        v22 = v4;
        v23 = 1024;
        v24 = v5;
        v25 = 1024;
        v26 = v6;
        v27 = 2080;
        v28 = v17;
        v29 = 2080;
        v30 = v18;
        v31 = 1024;
        v32 = -[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures");
        _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "AutoBugCapture is %s - DNU:%d, user consent:%d, automated device group:%d%s, ABC:%savailable, ABC features:%d", buf, 0x38u);
      }

    }
  }
  else
  {
    configurationLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "OFF";
      if (v9)
        v12 = "ON";
      if (v7)
        v13 = "(ignored)";
      else
        v13 = "";
      if (v3)
        v14 = "";
      else
        v14 = "not ";
      *(_DWORD *)buf = 136316674;
      v20 = v12;
      v21 = 1024;
      v22 = v4;
      v23 = 1024;
      v24 = v5;
      v25 = 1024;
      v26 = v6;
      v27 = 2080;
      v28 = v13;
      v29 = 2080;
      v30 = v14;
      v31 = 1024;
      v32 = -[ABCConfigurationManager autoBugCaptureFeatures](self, "autoBugCaptureFeatures");
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "AutoBugCapture is %s - DNU:%d, user consent:%d, automated device group:%d%s, ABC:%savailable, ABC features:%d", buf, 0x38u);
    }

    autoBugCaptureEnabled__prevEnabledValue = v9;
  }
  ++autoBugCaptureEnabled__logPrintCount;
  if (self->_autoBugCaptureEnabled != v9)
  {
    -[ABCConfigurationManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("autoBugCaptureEnabled"));
    self->_autoBugCaptureEnabled = v9;
    -[ABCConfigurationManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("autoBugCaptureEnabled"));
    LOBYTE(v9) = self->_autoBugCaptureEnabled;
  }
  return v9;
}

- (NSString)logArchivePath
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)logArchivePath_logArchivePath, "length"))
  {
    +[ABCConfigurationManager defaultLibraryDirectory](ABCConfigurationManager, "defaultLibraryDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Logs/AutoBugCapture"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)logArchivePath_logArchivePath;
      logArchivePath_logArchivePath = v3;

      configurationLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = logArchivePath_logArchivePath;
        _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Configured logArchivePath to be %@", (uint8_t *)&v7, 0xCu);
      }

    }
  }
  return (NSString *)(id)logArchivePath_logArchivePath;
}

- (unsigned)logArchiveUID
{
  unsigned int result;

  result = logArchiveUID_logArchiveUID;
  if (!logArchiveUID_logArchiveUID)
  {
    result = getuid();
    logArchiveUID_logArchiveUID = result;
  }
  return result;
}

- (unsigned)logArchiveGID
{
  unsigned int result;
  group *v3;
  NSObject *v4;
  uint8_t v5[16];

  result = logArchiveGID_logArchiveGID;
  if (!logArchiveGID_logArchiveGID)
  {
    v3 = getgrnam("_analyticsusers");
    if (v3)
    {
      logArchiveGID_logArchiveGID = v3->gr_gid;
    }
    else
    {
      logArchiveGID_logArchiveGID = getgid();
      configurationLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "Failed to get _analyticsusers gid, using current user", v5, 2u);
      }

    }
    endgrent();
    return logArchiveGID_logArchiveGID;
  }
  return result;
}

- (NSString)databaseContainerPath
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ABCPreferences database_container_path](self->_preferences, "database_container_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[ABCPreferences database_container_path](self->_preferences, "database_container_path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAbsolutePath");

    if (v5)
    {
      -[ABCPreferences database_container_path](self->_preferences, "database_container_path");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)databaseContainerPath_dbContainerPath;
      databaseContainerPath_dbContainerPath = v6;

      configurationLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = databaseContainerPath_dbContainerPath;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Database directory overridden with: %@", (uint8_t *)&v14, 0xCu);
      }
LABEL_11:

      return (NSString *)(id)databaseContainerPath_dbContainerPath;
    }
  }
  else
  {

  }
  if (!databaseContainerPath_dbContainerPath)
  {
    +[ABCConfigurationManager defaultLibraryDirectory](ABCConfigurationManager, "defaultLibraryDirectory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      +[ABCConfigurationManager autoBugCapturePrefix](ABCConfigurationManager, "autoBugCapturePrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)databaseContainerPath_dbContainerPath;
      databaseContainerPath_dbContainerPath = v10;

      configurationLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = databaseContainerPath_dbContainerPath;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "Using default database directory: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    goto LABEL_11;
  }
  return (NSString *)(id)databaseContainerPath_dbContainerPath;
}

- (unint64_t)dampenedIPSLimit
{
  return -[ABCPreferences arbitrator_dampened_ips_limit](self->_preferences, "arbitrator_dampened_ips_limit");
}

- (unint64_t)maxUploadRetryCount
{
  return -[ABCPreferences max_upload_retries](self->_preferences, "max_upload_retries");
}

- (unint64_t)arbitratorDailyCountLimit
{
  return -[ABCPreferences arbitrator_daily_count_limit](self->_preferences, "arbitrator_daily_count_limit");
}

- (BOOL)arbitratorDisableDampening
{
  return -[ABCPreferences arbitrator_disable_dampening](self->_preferences, "arbitrator_disable_dampening");
}

- (BOOL)isDeviceUnderTest
{
  return -[ABCPreferences dut_flag](self->_preferences, "dut_flag");
}

- (BOOL)isAutomatedDeviceGroup
{
  return -[ABCPreferences is_automated_device_group](self->_preferences, "is_automated_device_group");
}

- (BOOL)hasAppleEmail
{
  return -[ABCPreferences has_apple_email](self->_preferences, "has_apple_email");
}

- (BOOL)isCarryDevice
{
  return -[ABCPreferences is_carry_device](self->_preferences, "is_carry_device");
}

- (unint64_t)dampeningRestrictionFactor
{
  return -[ABCPreferences dampening_restriction_factor](self->_preferences, "dampening_restriction_factor");
}

- (BOOL)disableAPIRateLimit
{
  return -[ABCPreferences disable_api_rate_limit](self->_preferences, "disable_api_rate_limit");
}

- (double)apiRateLimit
{
  double result;

  -[ABCPreferences api_rate_limit](self->_preferences, "api_rate_limit");
  return result;
}

- (BOOL)apnsEnabled
{
  return -[ABCPreferences apns_enable](self->_preferences, "apns_enable");
}

- (BOOL)apnsSandboxEnvironment
{
  return -[ABCPreferences apns_dev_environment](self->_preferences, "apns_dev_environment");
}

- (double)apiLimitWindow
{
  double result;

  -[ABCPreferences api_limit_window](self->_preferences, "api_limit_window");
  return result;
}

- (BOOL)cloudKitEnabled
{
  BOOL v2;
  void *v3;

  v2 = -[ABCPreferences cloudkit_enable](self->_preferences, "cloudkit_enable");
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "vendorBuild") & 1) != 0
    || objc_msgSend(v3, "customerBuild") && (objc_msgSend(v3, "seedBuild") & 1) == 0)
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)cloudKitSandboxEnvironment
{
  return -[ABCPreferences cloudkit_sandbox_environment](self->_preferences, "cloudkit_sandbox_environment");
}

- (NSString)cloudKitContainerIdentifier
{
  return -[ABCPreferences cloudkit_container_identifier](self->_preferences, "cloudkit_container_identifier");
}

- (NSString)cloudKitInvernessService
{
  return -[ABCPreferences cloudkit_inverness_service](self->_preferences, "cloudkit_inverness_service");
}

- (BOOL)cloudKitPrefersAnonymous
{
  BOOL v2;
  void *v3;

  v2 = -[ABCPreferences cloudkit_prefers_anonymous](self->_preferences, "cloudkit_prefers_anonymous");
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "vendorBuild") & 1) != 0 || objc_msgSend(v3, "customerBuild"))
    v2 = 1;

  return v2;
}

- (double)cloudKitTimeoutIntervalForResource
{
  return (double)-[ABCPreferences cloudkit_upload_expiration_timeout](self->_preferences, "cloudkit_upload_expiration_timeout");
}

- (double)cloudKitTimeoutIntervalForRequest
{
  return (double)-[ABCPreferences cloudkit_upload_connection_timeout](self->_preferences, "cloudkit_upload_connection_timeout");
}

- (unint64_t)cloudKitFallbackMaximumLogCount
{
  return -[ABCPreferences cloudkit_upload_max_fallback_log_count](self->_preferences, "cloudkit_upload_max_fallback_log_count");
}

- (BOOL)autoFeedbackAssistantEnable
{
  return -[ABCPreferences autoFeedbackAssistantEnable](self->_preferences, "autoFeedbackAssistantEnable");
}

- (unint64_t)maxCaseSummaryPerSubmission
{
  return -[ABCPreferences case_summary_maximum_per_submission](self->_preferences, "case_summary_maximum_per_submission");
}

- (unint64_t)submittedCaseSummaryRetentionDays
{
  return -[ABCPreferences case_summary_submitted_retention_days](self->_preferences, "case_summary_submitted_retention_days");
}

- (unint64_t)unsubmittedCaseSummaryRetentionDays
{
  return -[ABCPreferences case_summary_unsubmitted_retention_days](self->_preferences, "case_summary_unsubmitted_retention_days");
}

- (BOOL)caseSummaryEnabled
{
  return -[ABCPreferences case_summary_enable](self->_preferences, "case_summary_enable");
}

- (BOOL)submitToDiagnosticPipeline
{
  return -[ABCPreferences diagnostic_pipeline_submission](self->_preferences, "diagnostic_pipeline_submission");
}

- (double)diagnosticPipelineSubmissionRate
{
  double result;

  -[ABCPreferences diagnostic_pipeline_submission_rate](self->_preferences, "diagnostic_pipeline_submission_rate");
  return result;
}

- (id)loadEmbeddedConfigurationPlist:(const char *)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  objc_class *v22;
  void *v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  load_embedded_xml_plist(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_IDENTIFIER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  configurationLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = (uint64_t)v4;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Embedded configuration identifier: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = (uint64_t)v9;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Found unexpected class %@ (%@) for configuration identifier - expected NSString", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_VERSION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  configurationLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v10, "longValue");
      v25 = 134217984;
      v26 = v14;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "Embedded configuration version: %ld", (uint8_t *)&v25, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = (uint64_t)v16;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Found unexpected class %@ (%@) for configuration version - expected NSNumber", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_CONTENT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();
  configurationLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((v18 & 1) != 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = (uint64_t)v17;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_INFO, "Embedded configuration content: %@", (uint8_t *)&v25, 0xCu);
    }

    v21 = v17;
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = (uint64_t)v23;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_ERROR, "Found unexpected class %@ (%@) for configuration content - expected NSDictionary", (uint8_t *)&v25, 0x16u);

    }
    v21 = 0;
  }

  return v21;
}

- (id)defaultDiagnosticActions
{
  return -[ABCConfigurationManager loadEmbeddedConfigurationPlist:](self, "loadEmbeddedConfigurationPlist:", "diag_actions");
}

- (id)currentDiagnosticActions
{
  return 0;
}

- (ABCPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (BOOL)apns_enable
{
  return self->_apns_enable;
}

- (void)setApns_enable:(BOOL)a3
{
  self->_apns_enable = a3;
}

- (BOOL)apns_dev_environment
{
  return self->_apns_dev_environment;
}

- (void)setApns_dev_environment:(BOOL)a3
{
  self->_apns_dev_environment = a3;
}

- (NSNumber)disable_internal_build
{
  return self->_disable_internal_build;
}

- (void)setDisable_internal_build:(id)a3
{
  objc_storeStrong((id *)&self->_disable_internal_build, a3);
}

- (NSNumber)carrier_seed_flag
{
  return self->_carrier_seed_flag;
}

- (void)setCarrier_seed_flag:(id)a3
{
  objc_storeStrong((id *)&self->_carrier_seed_flag, a3);
}

- (NSNumber)seed_flag
{
  return self->_seed_flag;
}

- (void)setSeed_flag:(id)a3
{
  objc_storeStrong((id *)&self->_seed_flag, a3);
}

- (NSNumber)vendor_flag
{
  return self->_vendor_flag;
}

- (void)setVendor_flag:(id)a3
{
  objc_storeStrong((id *)&self->_vendor_flag, a3);
}

- (NSNumber)npi_flag
{
  return self->_npi_flag;
}

- (void)setNpi_flag:(id)a3
{
  objc_storeStrong((id *)&self->_npi_flag, a3);
}

- (NSDictionary)previousConfiguration
{
  return self->_previousConfiguration;
}

- (void)setPreviousConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_previousConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousConfiguration, 0);
  objc_storeStrong((id *)&self->_npi_flag, 0);
  objc_storeStrong((id *)&self->_vendor_flag, 0);
  objc_storeStrong((id *)&self->_seed_flag, 0);
  objc_storeStrong((id *)&self->_carrier_seed_flag, 0);
  objc_storeStrong((id *)&self->_disable_internal_build, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
