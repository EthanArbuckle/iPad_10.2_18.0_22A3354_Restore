@implementation MSDTestPreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_2);
  return (id)sharedInstance_instance;
}

void __36__MSDTestPreferences_sharedInstance__block_invoke()
{
  MSDTestPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(MSDTestPreferences);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (BOOL)fakeActivationDemoBit
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FakeActivationDemoBit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)demoUnitServerURL
{
  void *v2;
  void *v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DemoUnitServerURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)findMyHubRetryDelay
{
  void *v2;
  int64_t v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FMHRetryDelay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (unsigned)rebootDelayForStaging
{
  void *v2;
  unsigned int v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("RebootDelayForStaging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntValue");
  else
    v3 = 0;

  return v3;
}

- (unsigned)timeShowingFatalError
{
  void *v2;
  unsigned int v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("TimeShowingFatalError"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)disableParallelProcessing
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DisableParallelProcessing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)pauseContentUpdateOnError
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PauseContentUpdateOnError"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)bailOnStashedStagingRestoreFailure
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("BailOnStashedStagingRestoreFailure"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)concurrentDownloadRequest
{
  void *v2;
  int64_t v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentDownloadRequest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)concurrentDownloadOperation
{
  void *v2;
  int64_t v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentDownloadOperation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)concurrentSession
{
  void *v2;
  int64_t v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentSession"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (double)cachingHubRetryInterval
{
  void *v2;
  double v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("CachingHubRetryInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)objc_msgSend(v2, "integerValue");
  }

  return v3;
}

- (double)caLogsUploadInterval
{
  void *v2;
  double v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("CALogsUploadInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)objc_msgSend(v2, "integerValue");
  }

  return v3;
}

- (double)appUsagePollingInterval
{
  void *v2;
  double v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("AppUsagePollingInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (double)objc_msgSend(v2, "integerValue");
  }

  return v3;
}

- (unsigned)systemAppTimeoutInterval
{
  void *v2;
  unsigned int v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SystemAppTimeoutInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntValue");
  else
    v3 = 0;

  return v3;
}

- (unsigned)systemAppPollingInterval
{
  void *v2;
  unsigned int v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SystemAppPollingInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)deviceActivationFlag
{
  void *v2;
  int64_t v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DeviceActivationFlag"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = -1;

  return v3;
}

- (BOOL)mockForBetterTogetherDemo
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockForBetterTogetherDemo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)mockAccountSettingsFile
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockAccountSettingsFile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)mockOSUpdateRequestFile
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockOSUpdateRequestFile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)screenSaverIdleDelay
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ScreenSaverIdleDelay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)mockPeerProtocolVersion
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockPeerProtocolVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)contentSyncTimeoutInterval
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ContentSyncTimeoutInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (int64_t)storePickerUIMode
{
  void *v2;
  int64_t v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("StorePickerUIMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 2;

  return v3;
}

- (BOOL)skipMarkAsNotDemo
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipMarkAsNotDemo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)enablePeerDemoService
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("EnablePeerDemoService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)pressDemoXCTestProductsPath
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PressDemoXCTestProductsPath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)pressDemoTestTarget
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PressDemoTestTarget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)LSMeasurementsFilePath
{
  void *v2;
  id v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("LSMeasurementsFilePath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)disassociateWiFiBeforeCheckIn
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DisassociateWiFiBeforeCheckIn"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)skipVerifyHashBeforeStaging
{
  void *v2;
  char v3;

  -[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipVerifyHashBeforeStaging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  NSObject *v6;
  void *v7;

  v3 = (__CFString *)a3;
  v4 = (const __CFString *)*MEMORY[0x24BDBD578];
  v5 = (const __CFString *)*MEMORY[0x24BDBD588];
  if (!CFPreferencesSynchronize(CFSTR("com.apple.MobileStoreDemo.test"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD588]))
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDTestPreferences getValueFromTestPreferencesForKey:].cold.1(v6);

  }
  v7 = (void *)CFPreferencesCopyValue(v3, CFSTR("com.apple.MobileStoreDemo.test"), v4, v5);

  return v7;
}

- (void)getValueFromTestPreferencesForKey:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A6E6000, log, OS_LOG_TYPE_ERROR, "Failed to synchronize with CFPreferences.", v1, 2u);
}

@end
