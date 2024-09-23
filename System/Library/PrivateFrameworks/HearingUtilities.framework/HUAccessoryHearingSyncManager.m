@implementation HUAccessoryHearingSyncManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_13);
  return (id)sharedInstance_Settings_2;
}

void __47__HUAccessoryHearingSyncManager_sharedInstance__block_invoke()
{
  HUAccessoryHearingSyncManager *v0;
  void *v1;

  v0 = objc_alloc_init(HUAccessoryHearingSyncManager);
  v1 = (void *)sharedInstance_Settings_2;
  sharedInstance_Settings_2 = (uint64_t)v0;

}

+ (NSSet)adaptiveTransparencySupportedDevices
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)adaptiveTransparencySupportedDevices_AudioRouteProductIDs;
  if (!adaptiveTransparencySupportedDevices_AudioRouteProductIDs)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("76,8212"), CFSTR("76,8228"), 0);
    v4 = (void *)adaptiveTransparencySupportedDevices_AudioRouteProductIDs;
    adaptiveTransparencySupportedDevices_AudioRouteProductIDs = v3;

    v2 = (void *)adaptiveTransparencySupportedDevices_AudioRouteProductIDs;
  }
  return (NSSet *)v2;
}

+ (NSSet)syncableSupportedDevices
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)syncableSupportedDevices_AudioRouteProductIDs;
  if (!syncableSupportedDevices_AudioRouteProductIDs)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("76,8206"), CFSTR("76,8202"), CFSTR("76,8212"), CFSTR("76,8228"), 0);
    v4 = (void *)syncableSupportedDevices_AudioRouteProductIDs;
    syncableSupportedDevices_AudioRouteProductIDs = v3;

    v2 = (void *)syncableSupportedDevices_AudioRouteProductIDs;
  }
  return (NSSet *)v2;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)deviceState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  _QWORD v20[7];
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[HUAccessoryHearingSyncManager deviceListeningState](self, "deviceListeningState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __44__HUAccessoryHearingSyncManager_deviceState__block_invoke;
  v21[3] = &unk_1EA8E9E78;
  v21[4] = self;
  v21[5] = &v26;
  v21[6] = &v22;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v21);

  if (!v27[3])
  {
    -[HUAccessoryHearingSyncManager nearbyDevicesListeningState](self, "nearbyDevicesListeningState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_2;
    v20[3] = &unk_1EA8E9EA0;
    v20[4] = self;
    v20[5] = &v26;
    v20[6] = &v22;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v20);

  }
  if ((objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall") & 1) != 0)
  {
    v6 = deviceState_LastListeningState;
    if (deviceState_LastListeningState != v27[3])
    {
      HCHPInitializeLogging();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27[3]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessoryHearingSyncManager deviceListeningState](self, "deviceListeningState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessoryHearingSyncManager nearbyDevicesListeningState](self, "nearbyDevicesListeningState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessoryHearingSyncManager deviceType](self, "deviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Listening state %@ = %@ - %@ = %@ = %@"), v8, v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager deviceState]", 143, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v31 = v16;
        _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      v6 = v27[3];
      deviceState_LastListeningState = v6;
    }
  }
  else
  {
    v6 = v27[3];
  }
  v17 = v23[3];
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  v18 = v17;
  v19 = v6;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

void __44__HUAccessoryHearingSyncManager_deviceState__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "listeningStateForAddress:andStoredState:", v8, a3);
  v9 = objc_msgSend(*(id *)(a1 + 32), "deviceTypeForAddress:", v8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 5)
    *a4 = 1;
}

uint64_t __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_3;
  v4[3] = &unk_1EA8E9E78;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __44__HUAccessoryHearingSyncManager_deviceState__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "listeningStateForAddress:andStoredState:", v8, a3);
  v9 = objc_msgSend(*(id *)(a1 + 32), "deviceTypeForAddress:", v8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 5)
    *a4 = 1;
}

- (BOOL)hasPairedDeviceWithHearingProtectionEnabled
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "address");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "activeHearingProtectionEnabledForAddress:", v9);

        if (v11)
        {
          HCHPInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hearing Protection device %@, HP is enabled"), v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager hasPairedDeviceWithHearingProtectionEnabled]", 166, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)*MEMORY[0x1E0D2F938];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_retainAutorelease(v18);
            v21 = v19;
            v22 = objc_msgSend(v20, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v29 = v22;
            _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
          v16 = 1;
          v12 = v4;
          goto LABEL_15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v6)
        continue;
      break;
    }
  }

  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No paired hearing protection device is found"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager hasPairedDeviceWithHearingProtectionEnabled]", 171, v12);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v9);
    v14 = v13;
    v15 = objc_msgSend(v9, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v29 = v15;
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (HUAccessoryHearingSyncManager)init
{
  HUAccessoryHearingSyncManager *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  HUAccessoryHearingSyncManager *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUAccessoryHearingSyncManager;
  v2 = -[HUAccessoryHearingSyncManager init](&v8, sel_init);
  if (v2)
  {
    +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__HUAccessoryHearingSyncManager_init__block_invoke;
    block[3] = &unk_1EA8E8220;
    v7 = v2;
    dispatch_async(v4, block);

  }
  return v2;
}

void __37__HUAccessoryHearingSyncManager_init__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__HUAccessoryHearingSyncManager_init__block_invoke_2;
  v2[3] = &unk_1EA8E95C0;
  v3 = v1;
  objc_msgSend(v3, "getDeviceTypesWithCompletion:", v2);

}

void __37__HUAccessoryHearingSyncManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setDeviceListeningState:", v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setPersistentDeviceListeningState:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_initCachedEnabled");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNearbyDevicesListeningState:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDeviceType:", v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_listeningModeDidChange_, *MEMORY[0x1E0D03388], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_listeningModeDidChange_, *MEMORY[0x1E0D03378], 0);

  objc_msgSend(*(id *)(a1 + 32), "_registerForAccessoryHearingSettingsUpdate");
  objc_msgSend(*(id *)(a1 + 32), "_registerForAccessoryManagerUpdate");
  objc_msgSend(*(id *)(a1 + 32), "_registerForNearbyControllerUpdate");
  objc_msgSend(*(id *)(a1 + 32), "_registerForNoiseEnabledPreferenceChange");
  v12 = objc_alloc(MEMORY[0x1E0CF3978]);
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sharedQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithTargetSerialQueue:", v14);
  objc_msgSend(*(id *)(a1 + 32), "setMessageTimer:", v15);

  objc_msgSend(*(id *)(a1 + 32), "messageTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_routesDidChange_, CFSTR("com.apple.accessibility.hearingaid.audio.route.changed"), 0);

}

- (void)_initCachedEnabled
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedEnabled;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeHearingProtectionEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  cachedEnabled = self->_cachedEnabled;
  self->_cachedEnabled = v5;

  if (!self->_cachedEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedEnabled;
    self->_cachedEnabled = v7;

  }
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting sync %@"), self->_cachedEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _initCachedEnabled]", 219, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v10);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)_registerForAccessoryHearingSettingsUpdate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke;
  v4[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", v4, sel_activeHearingProtectionEnabled, self);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke_2;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __75__HUAccessoryHearingSyncManager__registerForAccessoryHearingSettingsUpdate__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeHearingProtectionEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "cachedEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isEqualToDictionary:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = objc_loadWeakRetained(v4);
      objc_msgSend(v8, "sendUpdateToAccessory");

      v9 = objc_loadWeakRetained(v4);
      v10 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v9, "setCachedEnabled:", v10);

      v13 = CFSTR("HUAHPEnabledKey");
      v14[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendMessage:toDevicesWithDomain:withPriority:", v11, CFSTR("com.apple.hearing.accessory"), 1);

    }
  }

}

- (void)_registerForAccessoryManagerUpdate
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke;
  v10[3] = &unk_1EA8E9F58;
  v5 = v3;
  v11 = v5;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "registerDiscoveryBlock:withListener:", v10, self);
  objc_copyWeak(&v9, &location);
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("a48fec08-3921-43db-82aa-afbce8ebb4fb"), v4, 3221225472, __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_3, &unk_1EA8E9F80);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerUpdateBlock:forCharacteristicUUIDs:withListener:", &v8, v7, self);

  objc_msgSend(v5, "registerLoggingBlock:withListener:", &__block_literal_global_59, self);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found new accessories %@, lost accessories %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 246, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v22 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("a48fec08-3921-43db-82aa-afbce8ebb4fb"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readValueForCharacteristicUUID:", v13);

  v14 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_40;
  v17[3] = &unk_1EA8E9F30;
  v15 = v5;
  v18 = v15;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  v16 = v6;
  v19 = v16;
  objc_msgSend(v14, "getAvailableAddressesSupportingCharacteristic:withCompletion:", CFSTR("a48fec08-3921-43db-82aa-afbce8ebb4fb"), v17);

  objc_destroyWeak(&v20);
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUAccessoryHearingSyncManager Characteristic %@, addresses %@"), CFSTR("a48fec08-3921-43db-82aa-afbce8ebb4fb"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 251, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_45);
  v9 = *(void **)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_50;
  v15[3] = &unk_1EA8E9F08;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
  v11 = *(void **)(a1 + 40);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_2;
  v13[3] = &unk_1EA8E9F08;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "listeningModeDidChange:", 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_43(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceFromAddressString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "getAACPCapabilityInteger:", 48);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d,%d"), objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessoryHearingSyncManager adaptiveTransparencySupportedDevices](HUAccessoryHearingSyncManager, "adaptiveTransparencySupportedDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  HCHPInitializeLogging();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("HP version %@, product code %@, supported %@, for accessory %@"), v10, v6, v11, v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 258, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v13);
    v16 = v14;
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend(v15, "UTF8String");
    _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v5)
    v19 = 1;
  else
    v19 = v8;
  objc_msgSend(v17, "setActiveHearingProtectionAvailable:forAddress:", v19, v2);

}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_50(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceFromAddressString:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d,%d"), objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deviceTypeForProductCode:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "deviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v8, v11);

  }
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *WeakRetained;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C97778];
  v10 = a3;
  objc_msgSend(v9, "UUIDWithString:", CFSTR("a48fec08-3921-43db-82aa-afbce8ebb4fb"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found value for AHP %@ - %@"), v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke_3", 286, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v14);
      v17 = v15;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v16, "UTF8String");
      _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (v8)
    {
      buf[0] = 1;
      objc_msgSend(v8, "getBytes:length:", buf, 1);
      +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setActiveHearingProtectionEnabled:forAddress:", buf[0] != 0, v7);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "sendUpdateToAccessory");
    }

  }
}

void __67__HUAccessoryHearingSyncManager__registerForAccessoryManagerUpdate__block_invoke_57(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForAccessoryManagerUpdate]_block_invoke", 302, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)_registerForNearbyControllerUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerQueue:forDomain:", v5, CFSTR("com.apple.hearing.accessory"));

  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke;
  v8[3] = &unk_1EA8EA008;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "registerMessageBlock:forDomain:withListener:", v8, CFSTR("com.apple.hearing.accessory"), self);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_76;
  v7[3] = &unk_1EA8E9598;
  v7[4] = self;
  objc_msgSend(v3, "registerDiscoveryBlock:forDomain:withListener:", v7, CFSTR("com.apple.hearing.accessory"), self);
  objc_msgSend(v3, "registerLoggingBlock:forDomain:withListener:", &__block_literal_global_90, CFSTR("com.apple.hearing.accessory"), self);
  objc_msgSend(v3, "discoverNearbyDevicesWithDomain:", CFSTR("com.apple.hearing.accessory"));
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "processNoiseMeasurementsDisabledMessage:fromDevice:", v6, v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("HUAHPEnabledKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cachedEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)v7;
  objc_msgSend(v10, "addEntriesFromDictionary:", v7);
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActiveHearingProtectionEnabled:", v10);

  objc_msgSend(v6, "objectForKey:", CFSTR("HUAHPAvailableKey"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_64);
  objc_msgSend(v6, "objectForKey:", CFSTR("HUListenModeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Listening modes %@ for device %@"), v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 328, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v14);
    v17 = v15;
    *(_DWORD *)buf = 136446210;
    v43 = objc_msgSend(v16, "UTF8String");
    _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v5)
  {
    v18 = objc_msgSend(v12, "count");
    v19 = objc_loadWeakRetained(v8);
    objc_msgSend(v19, "nearbyDevicesListeningState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v20, "setObject:forKey:", v12, v21);

      v19 = objc_loadWeakRetained(v8);
      objc_msgSend(v19, "_cleanupNearbyDeviceStateDuplicatesForDevice:", v5);
    }
    else
    {
      objc_msgSend(v20, "removeObjectForKey:", v21);

    }
    HCHPInitializeLogging();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = objc_loadWeakRetained(v8);
    objc_msgSend(v23, "nearbyDevicesListeningState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Updated nearbyDevicesListeningState: %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 340, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_retainAutorelease(v26);
      v29 = v27;
      v30 = objc_msgSend(v28, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v43 = v30;
      _os_log_impl(&dword_1DE311000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("HUDeviceTypeKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device types %@ for device %@"), v31, v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 344, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v35 = objc_retainAutorelease(v33);
    v36 = v34;
    v37 = objc_msgSend(v35, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v43 = v37;
    _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v5)
  {
    v38 = objc_loadWeakRetained(v8);
    objc_msgSend(v38, "deviceType");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addEntriesFromDictionary:", v31);

  }
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = a2;
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v7, "setActiveHearingProtectionAvailable:forAddress:", v6, v5);
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_77;
    v5[3] = &unk_1EA8EA098;
    v5[4] = v4;
    v6 = v3;
    objc_msgSend(v4, "getDeviceTypesWithCompletion:", v5);

  }
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = headphoneStreamSelected();
  v6 = (NSObject **)MEMORY[0x1E0D2F938];
  if (v5)
  {
    +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeHearingProtectionEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeHearingProtectionAvailable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "deviceListeningState");
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("HUAHPAvailableKey"));
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("HUAHPEnabledKey"));
    if (-[NSObject count](v11, "count"))
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("HUListenModeKey"));
    if (objc_msgSend(v3, "count"))
      objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("HUDeviceTypeKey"));
  }
  else
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Headphone is not selected, NOT sending Accessory info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke_2", 387, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *v6;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v13 = objc_retainAutorelease(v10);
    v11 = v12;
    *(_DWORD *)buf = 136446210;
    v40 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

LABEL_13:
  if (objc_msgSend(v4, "count"))
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending Accessory state message to discovered devices: %@"), *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 392, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      v19 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v40 = v19;
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendMessage:withDomain:toDevices:withPriority:", v4, CFSTR("com.apple.hearing.accessory"), *(_QWORD *)(a1 + 40), 1);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nearbyDevices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ax_mappedArrayUsingBlock:", &__block_literal_global_84);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "nearbyDevicesListeningState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_85;
  v36[3] = &unk_1EA8EA070;
  v26 = v24;
  v37 = v26;
  v27 = v21;
  v38 = v27;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v36);

  HCHPInitializeLogging();
  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "nearbyDevicesListeningState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("Filtering nearby listening modes on update to nearby devices %@ - %@"), v29, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke_3", 407, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_retainAutorelease(v31);
    v34 = v32;
    v35 = objc_msgSend(v33, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v40 = v35;
    _os_log_impl(&dword_1DE311000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setNearbyDevicesListeningState:", v27);

}

uint64_t __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_82(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_2_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v6);

}

void __67__HUAccessoryHearingSyncManager__registerForNearbyControllerUpdate__block_invoke_89(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _registerForNearbyControllerUpdate]_block_invoke", 413, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)_cleanupNearbyDeviceStateDuplicatesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryHearingSyncManager nearbyDevicesListeningState](self, "nearbyDevicesListeningState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAccessoryHearingSyncManager nearbyDevicesListeningState](self, "nearbyDevicesListeningState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__HUAccessoryHearingSyncManager__cleanupNearbyDeviceStateDuplicatesForDevice___block_invoke;
  v14[3] = &unk_1EA8EA0E0;
  v15 = v4;
  v16 = v5;
  v17 = v9;
  v11 = v9;
  v12 = v5;
  v13 = v4;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);

  -[HUAccessoryHearingSyncManager setNearbyDevicesListeningState:](self, "setNearbyDevicesListeningState:", v12);
}

void __78__HUAccessoryHearingSyncManager__cleanupNearbyDeviceStateDuplicatesForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = v6;
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v10);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectsForKeys:", *(_QWORD *)(a1 + 48));
  v6 = v9;
  if (objc_msgSend(v9, "count"))
    goto LABEL_4;
LABEL_5:

}

- (NSMutableDictionary)cachedEnabled
{
  return self->_cachedEnabled;
}

- (void)setCachedEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_cachedEnabled, a3);
}

- (NSMutableDictionary)deviceListeningState
{
  return self->_deviceListeningState;
}

- (void)setDeviceListeningState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceListeningState, a3);
}

- (NSMutableDictionary)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (NSMutableDictionary)nearbyDevicesListeningState
{
  return self->_nearbyDevicesListeningState;
}

- (void)setNearbyDevicesListeningState:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevicesListeningState, a3);
}

- (NSDictionary)persistentDeviceListeningState
{
  return self->_persistentDeviceListeningState;
}

- (void)setPersistentDeviceListeningState:(id)a3
{
  objc_storeStrong((id *)&self->_persistentDeviceListeningState, a3);
}

- (void)listeningModeDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HUAccessoryHearingSyncManager *v10;

  v4 = a3;
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke;
  v8[3] = &unk_1EA8E81F8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Listening state changed %@"), a1[2].i64[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager listeningModeDidChange:]_block_invoke", 519, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_93;
  v10[3] = &unk_1EA8E9380;
  v9 = a1[2];
  v8 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  objc_msgSend(v7, "getAvailableAddressesSupportingCharacteristic:withCompletion:", 0, v10);

}

void __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_2;
  v19 = &unk_1EA8E9B78;
  v5 = v4;
  v20 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v16);
  HCHPInitializeLogging();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "deviceListeningState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Listening modes current: %@ new: %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager listeningModeDidChange:]_block_invoke", 575, v8, v16, v17, v18, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    v13 = objc_msgSend(v11, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v22 = v13;
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "deviceListeningState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToDictionary:", v5);

  if ((v15 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setDeviceListeningState:", v5);
  objc_msgSend(*(id *)(a1 + 32), "sendIDSMessageIfNeededForNewListeningModes:addresses:force:", v5, v3, *(_QWORD *)(a1 + 40) == 0);

}

void __56__HUAccessoryHearingSyncManager_listeningModeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceFromAddressString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 3;
  v20 = 3;
  objc_msgSend(v5, "inEarStatusPrimary:secondary:", &v20, &v19);
  v6 = objc_msgSend(v5, "featureCapability:", 16);
  v7 = objc_msgSend(v5, "featureCapability:", 17);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d,%d"), objc_msgSend(v5, "vendorId"), objc_msgSend(v5, "productId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessoryHearingSyncManager syncableSupportedDevices](HUAccessoryHearingSyncManager, "syncableSupportedDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if (!v10 || (v6 | v7) != 1 || v20 || v19)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping device because not supported %@ [%d, %d] {%d, %d} %@"), v8, v6, v7, v20, v19, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager listeningModeDidChange:]_block_invoke", 571, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v14);
      v17 = v15;
      v18 = objc_msgSend(v16, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v22 = v18;
      _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    switch(objc_msgSend(v5, "listeningMode"))
    {
      case 0u:
        v11 = *(void **)(a1 + 32);
        v12 = &unk_1EA8FFCB0;
        goto LABEL_14;
      case 1u:
        v11 = *(void **)(a1 + 32);
        v12 = &unk_1EA8FFC68;
        goto LABEL_14;
      case 2u:
        v11 = *(void **)(a1 + 32);
        v12 = &unk_1EA8FFC50;
        goto LABEL_14;
      case 3u:
        v11 = *(void **)(a1 + 32);
        v12 = &unk_1EA8FFC80;
        goto LABEL_14;
      case 4u:
        v11 = *(void **)(a1 + 32);
        v12 = &unk_1EA8FFC98;
LABEL_14:
        objc_msgSend(v11, "setObject:forKey:", v12, v3);
        break;
      default:
        break;
    }
  }

}

- (void)sendUpdateToAccessory
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("a48fec08-3921-43db-82aa-afbce8ebb4fb"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke;
  v6[3] = &unk_1EA8E9380;
  v7 = v3;
  v8 = v2;
  v4 = v2;
  v5 = v3;
  objc_msgSend(v5, "getAvailableAddressesSupportingCharacteristic:withCompletion:", 0, v6);

}

void __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke_2;
  v4[3] = &unk_1EA8EA108;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);

}

void __54__HUAccessoryHearingSyncManager_sendUpdateToAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activeHearingProtectionEnabledForAddress:", v3);

  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending update to %@ - %@ - %@"), v3, v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager sendUpdateToAccessory]_block_invoke_2", 609, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    v12 = objc_msgSend(v10, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v15 = v12;
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "writeValue:forCharacteristicUUID:andAddress:", v6, *(_QWORD *)(a1 + 40), v3);

}

- (void)routesDidChange:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HUAccessoryHearingSyncManager_routesDidChange___block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __49__HUAccessoryHearingSyncManager_routesDidChange___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t result;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = headphoneStreamSelected();
  AXLogTemp();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "routesDidChange isHeadphoneStreamSelected %d", (uint8_t *)v5, 8u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "isHeadphoneStreamSelected");
  if (v2 != (_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "sendListeningModesIDSMessageIfNeeded");
  return result;
}

- (void)getDeviceTypesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__HUAccessoryHearingSyncManager_getDeviceTypesWithCompletion___block_invoke;
    v6[3] = &unk_1EA8EA130;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "getAvailableAddressesSupportingCharacteristic:withCompletion:", 0, v6);

  }
}

void __62__HUAccessoryHearingSyncManager_getDeviceTypesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceTypesForAvailableAddresses:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)deviceTypesForAvailableAddresses:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HUAccessoryHearingSyncManager_deviceTypesForAvailableAddresses___block_invoke;
  v11[3] = &unk_1EA8EA108;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __66__HUAccessoryHearingSyncManager_deviceTypesForAvailableAddresses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceFromAddressString:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d,%d"), objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceTypeForProductCode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);

}

- (id)deviceTypeForProductCode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("76,8206")) & 1) != 0)
  {
    v4 = &unk_1EA8FFC68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("76,8202")) & 1) != 0)
  {
    v4 = &unk_1EA8FFC50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("76,8212")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("76,8228")))
  {
    v4 = &unk_1EA8FFC80;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)deviceTypeForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[HUAccessoryHearingSyncManager deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (int64_t)listeningStateForAddress:(id)a3 andStoredState:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  int v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "unsignedIntegerValue");
  if (v6 == 3)
  {
    +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "activeHearingProtectionEnabledForAddress:", v5);

    if (v8)
      v6 = 5;
    else
      v6 = 3;
  }

  return v6;
}

- (BOOL)shouldUpdateWatchesWithListeningModes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  BOOL v26;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  _QWORD v31[6];
  uint8_t v32[4];
  uint64_t v33;
  _BYTE v34[16];
  __int128 buf;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = headphoneStreamSelected();
  HCHPInitializeLogging();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HUAccessoryHearingSyncManager persistentDeviceListeningState](self, "persistentDeviceListeningState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Headphone Selected %d, Listening modes sent to Watches: %@, new: %@"), v5, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]", 699, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)MEMORY[0x1E0D2F938];
  v11 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v9);
    v13 = v11;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x2020000000;
  v37 = 0;
  if ((_DWORD)v5)
  {
    v14 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke;
    v31[3] = &unk_1EA8E8BB8;
    v31[4] = self;
    v31[5] = &buf;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v31);
    -[HUAccessoryHearingSyncManager persistentDeviceListeningState](self, "persistentDeviceListeningState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    v28[1] = 3221225472;
    v28[2] = __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke_113;
    v28[3] = &unk_1EA8E8BB8;
    v16 = v4;
    v29 = v16;
    p_buf = &buf;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v28);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      -[HUAccessoryHearingSyncManager setPersistentDeviceListeningState:](self, "setPersistentDeviceListeningState:", v16);

  }
  else
  {
    -[HUAccessoryHearingSyncManager persistentDeviceListeningState](self, "persistentDeviceListeningState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") == 0;

    if (!v18)
    {
      *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 1;
      v19 = (void *)objc_opt_new();
      -[HUAccessoryHearingSyncManager setPersistentDeviceListeningState:](self, "setPersistentDeviceListeningState:", v19);

    }
  }
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    self->_isHeadphoneStreamSelected = v5;
  v20 = *v10;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[HUAccessoryHearingSyncManager persistentDeviceListeningState](self, "persistentDeviceListeningState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:].cold.1(v21, (uint64_t)v34, v20);
  }

  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Listening modes for Watch changed: %d"), *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]", 752, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *v10;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    *(_DWORD *)v32 = 136446210;
    v33 = v25;
    _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", v32, 0xCu);
  }

  v26 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v26;
}

void __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "persistentDeviceListeningState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Added listening mode %@, for device: %@"), v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]_block_invoke", 711, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      v10 = objc_retainAutorelease(v10);
      v12 = v11;
      *(_DWORD *)buf = 136446210;
      v14 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
LABEL_7:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Changed listening mode %@, for device: %@"), v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]_block_invoke", 716, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    goto LABEL_7;
  }
LABEL_8:

}

void __71__HUAccessoryHearingSyncManager_shouldUpdateWatchesWithListeningModes___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removed listening mode %@, for device: %@"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:]_block_invoke", 726, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v9);
      v12 = v10;
      *(_DWORD *)buf = 136446210;
      v14 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)sendListeningModesIDSMessageIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[HUAccessoryHearingSyncManager messageTimer](self, "messageTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke;
  v4[3] = &unk_1EA8E8220;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4, 0.5);

}

void __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2;
  v3[3] = &unk_1EA8E9598;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "getAvailableAddressesSupportingCharacteristic:withCompletion:", 0, v3);

}

void __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEBUG))
    __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2_cold_1(a1, v4);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "deviceListeningState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendIDSMessageIfNeededForListeningModes:addresses:force:", v6, v3, 0);

}

- (void)sendIDSMessageIfNeededForNewListeningModes:(id)a3 addresses:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[HUAccessoryHearingSyncManager messageTimer](self, "messageTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__HUAccessoryHearingSyncManager_sendIDSMessageIfNeededForNewListeningModes_addresses_force___block_invoke;
  v13[3] = &unk_1EA8EA158;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "afterDelay:processBlock:", v13, 0.5);

}

uint64_t __92__HUAccessoryHearingSyncManager_sendIDSMessageIfNeededForNewListeningModes_addresses_force___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendIDSMessageIfNeededForListeningModes:addresses:force:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)_sendIDSMessageIfNeededForListeningModes:(id)a3 addresses:(id)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint8_t buf[4];
  uint64_t v28;
  const __CFString *v29;
  _QWORD v30[2];

  v5 = a5;
  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (-[HUAccessoryHearingSyncManager shouldUpdateWatchesWithListeningModes:](self, "shouldUpdateWatchesWithListeningModes:", a3))
  {
    v9 = (void *)MEMORY[0x1E0C99E08];
    v29 = CFSTR("HUListenModeKey");
    -[HUAccessoryHearingSyncManager persistentDeviceListeningState](self, "persistentDeviceListeningState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeHearingProtectionEnabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAccessoryHearingSyncManager deviceTypesForAvailableAddresses:](self, "deviceTypesForAvailableAddresses:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("HUAHPEnabledKey"));
    if (objc_msgSend(v15, "count"))
      objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("HUDeviceTypeKey"));
    HCHPInitializeLogging();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending to all Accessory state message: %@"), v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _sendIDSMessageIfNeededForListeningModes:addresses:force:]", 791, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_retainAutorelease(v17);
        v20 = v18;
        *(_DWORD *)buf = 136446210;
        v28 = objc_msgSend(v19, "UTF8String");
        _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendMessage:toDevicesWithDomain:excludingState:withPriority:", v12, CFSTR("com.apple.hearing.accessory"), &unk_1EA8FFCC8, 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending to Watches Accessory state message: %@"), v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager _sendIDSMessageIfNeededForListeningModes:addresses:force:]", 796, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_retainAutorelease(v23);
        v26 = v24;
        *(_DWORD *)buf = 136446210;
        v28 = objc_msgSend(v25, "UTF8String");
        _os_log_impl(&dword_1DE311000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendMessage:toWatchDevicesWithDomain:excludingState:withPriority:", v12, CFSTR("com.apple.hearing.accessory"), &unk_1EA8FFCC8, 1);
    }

  }
}

- (void)processNoiseMeasurementsDisabledMessage:(id)a3 fromDevice:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%llu"), 0x800000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDS received Noise Disabled: %@ from device: %@"), v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager processNoiseMeasurementsDisabledMessage:fromDevice:]", 811, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(v5, "setState:forDomain:", v9, CFSTR("com.apple.hearing.accessory"));
  }

}

- (BOOL)hasPairedDevicesWithListeningModes
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97758], "devicesWithDiscoveryFlags:error:", 0x80000800000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0D2F938];
  v4 = *MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEBUG))
    -[HUAccessoryHearingSyncManager hasPairedDevicesWithListeningModes].cold.1((uint64_t)v2, v4, v5);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v11, "deviceFlags") & 0x4000000) != 0 || (objc_msgSend(v11, "deviceFlags") & 0x8000000) != 0)
        {
          HCHPInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Has paired devices with listening modes"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager hasPairedDevicesWithListeningModes]", 836, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *v3;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_retainAutorelease(v18);
            v21 = v19;
            v22 = objc_msgSend(v20, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v29 = v22;
            _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
          v17 = 1;
          v12 = v6;
          goto LABEL_18;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No paired devices with listening modes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUAccessoryHearingSyncManager hasPairedDevicesWithListeningModes]", 840, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v13);
    v15 = v14;
    v16 = objc_msgSend(v13, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v29 = v16;
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v17 = 0;
LABEL_18:

  return v17;
}

- (BOOL)isHeadphoneStreamSelected
{
  return self->_isHeadphoneStreamSelected;
}

- (void)setIsHeadphoneStreamSelected:(BOOL)a3
{
  self->_isHeadphoneStreamSelected = a3;
}

- (BOOL)noiseDisabled
{
  return self->_noiseDisabled;
}

- (void)setNoiseDisabled:(BOOL)a3
{
  self->_noiseDisabled = a3;
}

- (AXDispatchTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_messageTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesListeningState, 0);
  objc_storeStrong((id *)&self->_persistentDeviceListeningState, 0);
  objc_storeStrong((id *)&self->_deviceListeningState, 0);
  objc_storeStrong((id *)&self->_cachedEnabled, 0);
}

- (void)shouldUpdateWatchesWithListeningModes:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1DE311000, a3, (uint64_t)a3, "Updated listening modes for Watch: %@", (uint8_t *)a2);

}

void __69__HUAccessoryHearingSyncManager_sendListeningModesIDSMessageIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceListeningState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_6(&dword_1DE311000, v3, v5, "Routes and isHeadphoneStreamSelected are updated, deviceListeningState: %@", (uint8_t *)&v6);

}

- (void)hasPairedDevicesWithListeningModes
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1DE311000, a2, a3, "AccessoryManager pairedDevices: %@", (uint8_t *)&v3);
}

@end
