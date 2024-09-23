@implementation ADASManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefStore, 0);
}

- (id)_setDefaultValueIfNeeded:(id)a3 nano:(BOOL)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v5 = a5;
  v6 = a4;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[ADASPreferenceStore defaultValues](self->_prefStore, "defaultValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("EnableHAELiveMonitor"));
    if (v6)
    {
      if (v11)
      {
        -[ADASPreferenceStore coreAudioDeviceDomain](self->_prefStore, "coreAudioDeviceDomain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("HAENFeatureMandatory"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) == 0)
        {

          v10 = &unk_24C83F828;
        }

      }
      -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v10, v8);

      if (v5)
      {
        v15 = (void *)MEMORY[0x24BDBCF20];
        v27[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setWithArray:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADASManager _syncNanoForWrite:](self, "_syncNanoForWrite:", v17);

      }
    }
    else
    {
      if (v11)
      {
        -[ADASManager _getDeviceSpecificDefaultsFor:](self, "_getDeviceSpecificDefaultsFor:", CFSTR("HAENFeatureMandatory"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18 && (objc_msgSend(v18, "BOOLValue") & 1) == 0)
        {

          v10 = &unk_24C83F828;
        }

      }
      v20 = -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", v8, v10);
      if (v5)
        -[ADASManager _sync](self, "_sync");
    }
    ADAFLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_20DC02000, v21, OS_LOG_TYPE_DEFAULT, "setting default value for key [ %@ ] -> [ %@ ]", (uint8_t *)&v23, 0x16u);
    }

  }
  return v10;
}

- (id)getPreferenceFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ADASManager _sync](self, "_sync");
  -[ADASManager _getSpecialKeys:nano:](self, "_getSpecialKeys:nano:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ADASManager _getDefaultsKey:](self, "_getDefaultsKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        -[ADASManager _setDefaultValueIfNeeded:nano:sync:](self, "_setDefaultValueIfNeeded:nano:sync:", v6, 0, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      ADAFLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ADASManager getPreferenceFor:].cold.1();

      v5 = 0;
    }

  }
  ADAFLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20DC02000, v8, OS_LOG_TYPE_DEFAULT, "get preference: %@ -> %@", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

void __33__ADASManager_getPreferencesFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getSpecialKeys:nano:", v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_2;
  objc_msgSend(*(id *)(a1 + 32), "_getDefaultsKey:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "_getDefaultsFor:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v4 = v8;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setDefaultValueIfNeeded:nano:sync:", v7, 0, 0);
      v4 = objc_claimAutoreleasedReturnValue();

      if (!v4)
        goto LABEL_3;
    }
LABEL_2:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);
LABEL_3:
    ADAFLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_20DC02000, v5, OS_LOG_TYPE_DEFAULT, "get preferences for: %@ -> %@", (uint8_t *)&v9, 0x16u);
    }

    goto LABEL_6;
  }
  ADAFLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33__ADASManager_getPreferencesFor___block_invoke_cold_1();
LABEL_6:

}

- (id)_getSpecialKeys:(id)a3 nano:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("_ADAFPreferenceKeyHAENotificationIsMandatory")))
  {
    if (!-[ADASManager _featureFlagEnabled](self, "_featureFlagEnabled"))
    {
      v9 = (void *)MEMORY[0x24BDBD1C0];
      goto LABEL_11;
    }
    v7 = -[ADASManager _isDeviceMandatoryForHAENotification:](self, "_isDeviceMandatoryForHAENotification:", v4);
    if (v7)
      -[ADASManager migrateKeyEnableHAEHKMeasurement:](self, "migrateKeyEnableHAEHKMeasurement:", v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("_ADAFPreferenceKeyVolumeLimitThreshold")))
    {
      v9 = 0;
      goto LABEL_11;
    }
    -[ADASManager _migrateVolumeLimitThreshold:](self, "_migrateVolumeLimitThreshold:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_11:

  return v9;
}

- (id)_getDefaultsKey:(id)a3
{
  ADASPreferenceStore *prefStore;
  id v4;
  void *v5;
  void *v6;

  prefStore = self->_prefStore;
  v4 = a3;
  -[ADASPreferenceStore keyMap](prefStore, "keyMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)migrateKeyEnableHAEHKMeasurement:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[3];

  v3 = a3;
  v20[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = CFSTR("EnableHAEHKWrite");
    v20[1] = CFSTR("HAENSampleTransient");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADASManager _syncNanoForRead:](self, "_syncNanoForRead:", v7);

    -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("EnableHAEHKWrite"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("HAENSampleTransient"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "BOOLValue") ^ 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
        {
          if (v3)
          {
            -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("HAENSurfaceMigrationAlert"));

LABEL_11:
            v16 = -[ADASManager setNanoPreferenceFor:value:notify:](self, "setNanoPreferenceFor:value:notify:", CFSTR("_ADAFPreferenceKeyHAESampleTransient"), v11, 0);
            goto LABEL_14;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", CFSTR("HAENSurfaceMigrationAlert"), v17);

LABEL_13:
          v19 = -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", CFSTR("HAENSampleTransient"), v11);
          -[ADASManager _sync](self, "_sync");
          goto LABEL_14;
        }
      }
      else
      {
        v11 = (void *)v12;
      }
      if (v3)
        goto LABEL_11;
      goto LABEL_13;
    }
  }
  else
  {
    -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("EnableHAEHKWrite"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("HAENSampleTransient"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_5;
  }
LABEL_14:

}

- (id)_getDefaultsFor:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.coreaudio"));
}

- (BOOL)_isDeviceMandatoryForHAENotification:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  const __CFString *v16;
  uint8_t buf[4];
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = CFSTR("HAENFeatureMandatoryOverride");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADASManager _syncNanoForRead:](self, "_syncNanoForRead:", v6);

    -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("HAENFeatureMandatoryOverride"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)MEMORY[0x24BDBCF20];
      v16 = CFSTR("HAENFeatureMandatory");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADASManager _syncNanoDeviceSpecificForRead:](self, "_syncNanoDeviceSpecificForRead:", v11);

      -[ADASPreferenceStore coreAudioDeviceDomain](self->_prefStore, "coreAudioDeviceDomain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("HAENFeatureMandatory"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_9;
      goto LABEL_13;
    }
LABEL_6:
    ADAFLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_20DC02000, v13, OS_LOG_TYPE_DEFAULT, "device has HAEN turned on through defaults: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  -[ADASManager _sync](self, "_sync");
  -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("HAENFeatureMandatoryOverride"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_6;
  -[ADASManager _syncDeviceSpecificDomain](self, "_syncDeviceSpecificDomain");
  -[ADASManager _getDeviceSpecificDefaultsFor:](self, "_getDeviceSpecificDefaultsFor:", CFSTR("HAENFeatureMandatory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_9:
    ADAFLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ADASManager _isDeviceMandatoryForHAENotification:].cold.1();
    v8 = (void *)MEMORY[0x24BDBD1C8];
LABEL_12:

  }
LABEL_13:
  v14 = objc_msgSend(v8, "BOOLValue");

  return v14;
}

- (id)getPreferencesFor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  ADASManager *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[ADASManager _sync](self, "_sync");
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __33__ADASManager_getPreferencesFor___block_invoke;
  v13 = &unk_24C83DCA8;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  -[ADASManager _sync](self, "_sync", v10, v11, v12, v13, v14);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (void)_sync
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
}

- (void)_syncDeviceSpecificDomain
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio.device"));
}

- (id)_getDeviceSpecificDefaultsFor:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.coreaudio.device"));
}

- (BOOL)_featureFlagEnabled
{
  return _os_feature_enabled_impl();
}

- (ADASManager)init
{
  ADASManager *v2;
  uint64_t v3;
  ADASPreferenceStore *prefStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADASManager;
  v2 = -[ADASManager init](&v6, sel_init);
  if (v2)
  {
    +[ADASPreferenceStore sharedInstance](ADASPreferenceStore, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    prefStore = v2->_prefStore;
    v2->_prefStore = (ADASPreferenceStore *)v3;

  }
  return v2;
}

- (id)setPreferenceFor:(id)a3 value:(id)a4
{
  return -[ADASManager setPreferenceFor:value:notify:](self, "setPreferenceFor:value:notify:", a3, a4, 1);
}

- (id)setPreferenceFor:(id)a3 value:(id)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  ADAFLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_20DC02000, v10, OS_LOG_TYPE_DEFAULT, "set preference for %@ to %@", (uint8_t *)&v22, 0x16u);
  }

  -[ADASManager _getDefaultsKey:](self, "_getDefaultsKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v15 = "yek!";
LABEL_11:
    -[ADASManager _error:](self, "_error:", *(_QWORD *)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!v9)
  {
    ADAFLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ADASManager setPreferenceFor:value:notify:].cold.1();

    v15 = "lav!";
    goto LABEL_11;
  }
  -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[ADASManager _setChainedKeys:val:nano:modifiedKeys:](self, "_setChainedKeys:val:nano:modifiedKeys:", v8, v9, 0, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      ADAFLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ADASManager setPreferenceFor:value:notify:].cold.2();

    }
    -[ADASManager _sync](self, "_sync");
    if (v5)
    {
      -[ADASPreferenceStore specialDarwinKeys](self->_prefStore, "specialDarwinKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v8);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = v19;
      else
        v20 = CFSTR("AppleHAESettingsChanged");
      -[ADASManager _notify:](self, "_notify:", v20);

    }
  }

LABEL_22:
  return v13;
}

- (id)setNanoPreferenceFor:(id)a3 value:(id)a4
{
  return -[ADASManager setNanoPreferenceFor:value:notify:](self, "setNanoPreferenceFor:value:notify:", a3, a4, 1);
}

- (id)setNanoPreferenceFor:(id)a3 value:(id)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!-[ADASManager nanoSettingsAvailable](self, "nanoSettingsAvailable"))
  {
    ADAFLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ADASManager setNanoPreferenceFor:value:notify:].cold.3();

    v18 = "nan!";
    goto LABEL_19;
  }
  if (!v9)
  {
    ADAFLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ADASManager setPreferenceFor:value:notify:].cold.1();

    v18 = "lav!";
LABEL_19:
    -[ADASManager _error:](self, "_error:", *(_QWORD *)v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  -[ADASManager _getDefaultsKey:](self, "_getDefaultsKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    ADAFLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_20DC02000, v11, OS_LOG_TYPE_DEFAULT, "setting nano preference for key: %@", buf, 0xCu);
    }

    -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v9, v10);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v10, 0);
    -[ADASManager _setChainedKeys:val:nano:modifiedKeys:](self, "_setChainedKeys:val:nano:modifiedKeys:", v8, v9, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      ADAFLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ADASManager setNanoPreferenceFor:value:notify:].cold.2();

    }
    -[ADASManager _syncNanoForWrite:](self, "_syncNanoForWrite:", v13);
    if (v5)
      -[ADASManager _notify:](self, "_notify:", CFSTR("NanoHAESettingsChanged"));

    v16 = 0;
  }
  else
  {
    -[ADASManager _error:](self, "_error:", *(_QWORD *)"yek!");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  return v16;
}

- (id)getNanoPreferenceFor:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  NSObject *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ADAFLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_20DC02000, v5, OS_LOG_TYPE_DEFAULT, "get nano preference for %@", (uint8_t *)&v16, 0xCu);
  }

  if (-[ADASManager nanoSettingsAvailable](self, "nanoSettingsAvailable"))
  {
    -[ADASManager _getSpecialKeys:nano:](self, "_getSpecialKeys:nano:", v4, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_19;
    -[ADASManager _getDefaultsKey:](self, "_getDefaultsKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x24BDBCF20];
      v20[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADASManager _syncNanoForRead:](self, "_syncNanoForRead:", v11);

      -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v8);
      v6 = objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[ADASManager _setDefaultValueIfNeeded:nano:sync:](self, "_setDefaultValueIfNeeded:nano:sync:", v8, 1, 1);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_18:

LABEL_19:
        ADAFLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412546;
          v17 = v4;
          v18 = 2112;
          v19 = v6;
          _os_log_impl(&dword_20DC02000, v14, OS_LOG_TYPE_DEFAULT, "get nano preference: %@ -> %@", (uint8_t *)&v16, 0x16u);
        }
        goto LABEL_21;
      }
      ADAFLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ADASManager getNanoPreferenceFor:].cold.2();

    }
    else
    {
      ADAFLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[ADASManager getNanoPreferenceFor:].cold.1();
    }

    v6 = 0;
    goto LABEL_18;
  }
  ADAFLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[ADASManager setNanoPreferenceFor:value:notify:].cold.3();
  v6 = 0;
LABEL_21:

  return v6;
}

- (void)removePreferenceFor:(id)a3
{
  -[ADASManager removePreferenceFor:notify:](self, "removePreferenceFor:notify:", a3, 1);
}

- (void)removePreferenceFor:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ADAFLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_DEFAULT, "remove preference for %@", (uint8_t *)&v14, 0xCu);
  }

  -[ADASManager _getDefaultsKey:](self, "_getDefaultsKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    ADAFLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ADASManager removePreferenceFor:notify:].cold.1();
    goto LABEL_11;
  }
  v9 = -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", v8, 0);
  v10 = -[ADASManager _setChainedKeys:val:nano:modifiedKeys:](self, "_setChainedKeys:val:nano:modifiedKeys:", v6, 0, 0, 0);
  -[ADASManager _sync](self, "_sync");
  if (v4)
  {
    -[ADASPreferenceStore specialDarwinKeys](self->_prefStore, "specialDarwinKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = (const __CFString *)v12;
    else
      v13 = CFSTR("AppleHAESettingsChanged");
    -[ADASManager _notify:](self, "_notify:", v13);
LABEL_11:

  }
}

- (void)removeNanoPreferenceFor:(id)a3
{
  -[ADASManager removePreferenceFor:notify:](self, "removePreferenceFor:notify:", a3, 1);
}

- (void)removeNanoPreferenceFor:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ADAFLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_DEFAULT, "remove nano preference for %@", buf, 0xCu);
  }

  if (-[ADASManager nanoSettingsAvailable](self, "nanoSettingsAvailable"))
  {
    -[ADASManager _getDefaultsKey:](self, "_getDefaultsKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    ADAFLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_20DC02000, v10, OS_LOG_TYPE_DEFAULT, "removing nano preference for defaults key %@", buf, 0xCu);
      }

      -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v8);

      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v8, 0);
      -[ADASManager _setChainedKeys:val:nano:modifiedKeys:](self, "_setChainedKeys:val:nano:modifiedKeys:", v6, 0, 1, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        ADAFLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[ADASManager removeNanoPreferenceFor:notify:].cold.2();

      }
      -[ADASManager _syncNanoForWrite:](self, "_syncNanoForWrite:", v10);
      if (v4)
        -[ADASManager _notify:](self, "_notify:", CFSTR("NanoHAESettingsChanged"));

    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[ADASManager getPreferenceFor:].cold.1();
    }

  }
  else
  {
    ADAFLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ADASManager setNanoPreferenceFor:value:notify:].cold.3();
  }

}

- (id)getNanoPreferencesFor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  ADASManager *v16;
  id v17;

  v4 = a3;
  if (-[ADASManager nanoSettingsAvailable](self, "nanoSettingsAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADASManager _syncNanoForRead:](self, "_syncNanoForRead:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __37__ADASManager_getNanoPreferencesFor___block_invoke;
    v15 = &unk_24C83DCA8;
    v16 = self;
    v17 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v12);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4, v12, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADASManager _syncNanoForWrite:](self, "_syncNanoForWrite:", v8);

    v9 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    ADAFLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ADASManager setNanoPreferenceFor:value:notify:].cold.3();

    v9 = 0;
  }

  return v9;
}

void __37__ADASManager_getNanoPreferencesFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getSpecialKeys:nano:", v3, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getDefaultsKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      ADAFLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_1();
      v5 = 0;
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "coreAudioDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        ADAFLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_2();
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setDefaultValueIfNeeded:nano:sync:", v6, 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v3);
LABEL_13:
    ADAFLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_20DC02000, v8, OS_LOG_TYPE_DEFAULT, "get preferences for: %@ -> %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_15;
  }
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);
LABEL_16:

}

- (id)_setDefaultsFor:(id)a3 value:(id)a4
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  v6 = a4;
  if (!v6)
  {
    ADAFLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = -[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
      _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_DEFAULT, "removing key: %s", (uint8_t *)&v9, 0xCu);
    }

  }
  CFPreferencesSetAppValue(v5, v6, CFSTR("com.apple.coreaudio"));

  return 0;
}

- (id)_setDeviceSpecificDefaultsFor:(id)a3 value:(id)a4
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  v6 = a4;
  if (!v6)
  {
    ADAFLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_DEFAULT, "removing key: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  CFPreferencesSetAppValue(v5, v6, CFSTR("com.apple.coreaudio.device"));

  return 0;
}

- (void)_notify:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);

}

- (void)_syncNanoForRead:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "synchronizeNanoDomain:keys:", CFSTR("com.apple.coreaudio"), v4);

  -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "synchronize");

}

- (void)_syncNanoDeviceSpecificForRead:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "synchronizeNanoDomain:keys:", CFSTR("com.apple.coreaudio.device"), v4);

  -[ADASPreferenceStore coreAudioDeviceDomain](self->_prefStore, "coreAudioDeviceDomain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "synchronize");

}

- (void)_syncNanoForWrite:(id)a3
{
  ADASPreferenceStore *prefStore;
  id v4;
  void *v5;
  id v6;
  id v7;

  prefStore = self->_prefStore;
  v4 = a3;
  -[ADASPreferenceStore coreAudioDomain](prefStore, "coreAudioDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");

  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "synchronizeNanoDomain:keys:", CFSTR("com.apple.coreaudio"), v4);

}

- (id)_setChainedKeys:(id)a3 val:(id)a4 nano:(BOOL)a5 modifiedKeys:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("_ADAFPreferenceKeyHAEEnableHKWrite"));
  if (v11 && v13 && (objc_msgSend(v11, "BOOLValue") & 1) == 0)
  {
    ADAFLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_20DC02000, v16, OS_LOG_TYPE_DEFAULT, "HAE being turned off -> turning off notification feature as well.", v18, 2u);
    }

    if (v7)
    {
      -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("EnableHAELiveMonitor"));

      v14 = 0;
      if (!v12)
        goto LABEL_8;
    }
    else
    {
      -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", CFSTR("EnableHAELiveMonitor"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_8;
    }
    objc_msgSend(v12, "addObject:", CFSTR("EnableHAELiveMonitor"));
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("_ADAFPreferenceKeyHAENotificationFeatureEnabled"))
    && !-[ADASManager _isDeviceMandatoryForHAENotification:](self, "_isDeviceMandatoryForHAENotification:", v7))
  {
    -[ADASManager _donateSignalToTipsKit:](self, "_donateSignalToTipsKit:", objc_msgSend(v11, "BOOLValue"));
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)_migrateVolumeLimitThreshold:(BOOL)a3
{
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[6];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  if (a3)
  {
    -[ADASPreferenceStore coreAudioDomain](self->_prefStore, "coreAudioDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("VolumeLimitThreshold"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("VolumeLimitThreshold"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v14[5];
  if (!v6)
  {
    v7 = dispatch_time(0, 10000000000);
    dispatch_get_global_queue(-32768, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__ADASManager__migrateVolumeLimitThreshold___block_invoke;
    block[3] = &unk_24C83DCD0;
    v12 = a3;
    block[4] = self;
    block[5] = &v13;
    dispatch_after(v7, v8, block);

    v6 = (void *)v14[5];
  }
  v9 = v6;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __44__ADASManager__migrateVolumeLimitThreshold___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  float v4;
  float v5;
  float v6;
  int v7;
  NSObject *v8;
  float v9;
  NSObject *v10;
  int v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  int v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_getCurrentVolumeLimit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v2;
    _os_log_impl(&dword_20DC02000, v3, OS_LOG_TYPE_DEFAULT, "VLT currentLimit = %@", (uint8_t *)&v21, 0xCu);
  }

  if (v2 && (objc_msgSend(v2, "floatValue"), v4 > 0.0))
  {
    objc_msgSend(v2, "floatValue");
    v6 = v5;
    if (v5 >= 0.5)
    {
      if (v5 >= 0.6)
      {
        if (v5 >= 0.7)
        {
          if (v5 >= 0.8)
          {
            if (v5 >= 0.9)
            {
              if (v5 >= 1.0)
                goto LABEL_25;
              v7 = 1120403456;
            }
            else
            {
              v7 = 1119748096;
            }
          }
          else
          {
            v7 = 1119092736;
          }
        }
        else
        {
          v7 = 1118437376;
        }
      }
      else
      {
        v7 = 1117782016;
      }
    }
    else
    {
      v7 = 1117126656;
    }
    v9 = *(float *)&v7;
    ADAFLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(unsigned __int8 *)(a1 + 48);
      v21 = 138413058;
      v22 = v2;
      v23 = 2048;
      v24 = v6;
      v25 = 2048;
      v26 = v9;
      v27 = 1024;
      v28 = v11;
      _os_log_impl(&dword_20DC02000, v10, OS_LOG_TYPE_DEFAULT, "migrating %@ (%f) to %f\n nano? %d", (uint8_t *)&v21, 0x26u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_clearCurrentVolumeLimit");
    *(float *)&v12 = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (*(_BYTE *)(a1 + 48))
      v18 = (id)objc_msgSend(v16, "setNanoPreferenceFor:value:notify:", CFSTR("_ADAFPreferenceKeyVolumeLimitThreshold"), v17, 1);
    else
      v19 = (id)objc_msgSend(v16, "setPreferenceFor:value:notify:", CFSTR("_ADAFPreferenceKeyVolumeLimitThreshold"), v17, 1);
  }
  else
  {
    ADAFLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__ADASManager__migrateVolumeLimitThreshold___block_invoke_cold_1();

  }
LABEL_25:
  ADAFLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_20DC02000, v20, OS_LOG_TYPE_DEFAULT, "VLT migration done...", (uint8_t *)&v21, 2u);
  }

}

- (id)_getCurrentVolumeLimit
{
  double v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  id v19;

  LODWORD(v2) = -1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (+[ADAFUtil isProcessMediaserverd](ADAFUtil, "isProcessMediaserverd"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BE64990]);
    v5 = objc_msgSend(v4, "copyAttributeForKey:withValueOut:", *MEMORY[0x24BE64B58], &v19);
    if ((_DWORD)v5)
    {
      v6 = v5;
      ADAFLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ADASManager _getCurrentVolumeLimit].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

      LODWORD(v14) = -1.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      v19 = v15;

    }
    v3 = v19;
  }
  v17 = v3;

  return v17;
}

- (void)_clearCurrentVolumeLimit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "error clearing current volume limit %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)shouldSufaceHAENotificationMigrationAlert
{
  void *v3;
  char v4;
  void *v5;

  if (!-[ADASManager _isAlertSupported](self, "_isAlertSupported"))
    return 0;
  -[ADASManager _sync](self, "_sync");
  -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("HAENMigrationAlertSurfaced"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("HAENSurfaceMigrationAlert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLValue");

  }
  return v4;
}

- (void)didSurfaceMigrationAlert
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint8_t v7[16];

  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DC02000, v3, OS_LOG_TYPE_DEFAULT, "didSurfaceMigrationAlert...", v7, 2u);
  }

  if (+[ADAFUtil isProcessMediaserverd](ADAFUtil, "isProcessMediaserverd"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", CFSTR("HAENMigrationAlertSurfaced"), v4);

    v6 = -[ADASManager _setDefaultsFor:value:](self, "_setDefaultsFor:value:", CFSTR("HAENSurfaceMigrationAlert"), 0);
    -[ADASManager _sync](self, "_sync");
  }
}

- (id)_error:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADAFErrorDomain"), a3, 0);
}

- (BOOL)_isAlertSupported
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  if (!+[ADAFUtil isProcessMediaserverd](ADAFUtil, "isProcessMediaserverd"))
    return 0;
  -[ADASManager _sync](self, "_sync");
  -[ADASManager _getDefaultsFor:](self, "_getDefaultsFor:", CFSTR("DisableHAENMigrationAlert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MGGetStringAnswer();
    v9[0] = CFSTR("iPhone");
    v9[1] = CFSTR("iPad");
    v9[2] = CFSTR("iPod");
    v9[3] = CFSTR("Watch");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "containsObject:", v6);

  }
  return v5;
}

- (BOOL)nanoSettingsAvailable
{
  ADASManager *v2;
  void *v3;

  v2 = self;
  -[ADASPreferenceStore initNPSDomain](self->_prefStore, "initNPSDomain");
  -[ADASPreferenceStore coreAudioDomain](v2->_prefStore, "coreAudioDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 != 0;

  return (char)v2;
}

- (void)_donateSignalToTipsKit:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE0CDB8], "discoverabilitySignal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE0CB78]);
  if (v3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.Health.Hearing.HAENOptIn"), CFSTR("com.apple.Health"), v6);
  objc_msgSend(v4, "sendEvent:", v7);

}

- (void)setPreferenceFor:value:notify:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "value cannot be null for key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setPreferenceFor:value:notify:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_20DC02000, v0, v1, "failed to handle special key for %@ value: %@");
  OUTLINED_FUNCTION_2();
}

- (void)setNanoPreferenceFor:value:notify:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3(&dword_20DC02000, v0, v1, "failed to handle nano special key for %@ value: %@");
  OUTLINED_FUNCTION_2();
}

- (void)setNanoPreferenceFor:value:notify:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "nano settings not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)getPreferenceFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "defaults key %@ unknown to ADASManager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getNanoPreferenceFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "defaults nano key %@ unknown to ADASManager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getNanoPreferenceFor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "result type must be a NSNumber for key:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removePreferenceFor:notify:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "unknown defaults key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeNanoPreferenceFor:notify:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "failed to remove nano chained key for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __33__ADASManager_getPreferencesFor___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "key %@ unknown to ADASManager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "nano key %@ unknown to ADASManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "result type must be a NSNumber for key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__ADASManager__migrateVolumeLimitThreshold___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "failed to fetch current volume limit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_getCurrentVolumeLimit
{
  OUTLINED_FUNCTION_0(&dword_20DC02000, a2, a3, "error fetching current volume limit %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_isDeviceMandatoryForHAENotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "feature mandatory flag is not set, default to mandatory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
