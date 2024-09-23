@implementation HKHeartRhythmAvailability

- (HKHeartRhythmAvailability)initWithHealthStore:(id)a3
{
  id v5;
  HKHeartRhythmAvailability *v6;
  HKHeartRhythmAvailability *v7;
  HKActiveWatchRemoteFeatureAvailabilityDataSource *v8;
  HKActiveWatchRemoteFeatureAvailabilityDataSource *electrocardiogramAvailabilityDataSource;
  HKObserverSet *v10;
  uint64_t v11;
  HKObserverSet *heartRhythmAvailabilityObservers;
  uint64_t v13;
  HKKeyValueDomain *keyValueDomain;
  uint64_t v15;
  NSUserDefaults *heartRhythmUserDefaults;
  NSMutableSet *v17;
  NSMutableSet *onboardingKeysReadSet;
  HKWatchAppAvailability *v19;
  HKWatchAppAvailability *ecgAppAvailability;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKHeartRhythmAvailability;
  v6 = -[HKHeartRhythmAvailability init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc_init(HKActiveWatchRemoteFeatureAvailabilityDataSource);
    electrocardiogramAvailabilityDataSource = v7->_electrocardiogramAvailabilityDataSource;
    v7->_electrocardiogramAvailabilityDataSource = v8;

    v10 = [HKObserverSet alloc];
    v11 = -[HKObserverSet initWithName:loggingCategory:](v10, "initWithName:loggingCategory:", CFSTR("heart-rhythm-availability-observers"), HKLogHeartRhythm);
    heartRhythmAvailabilityObservers = v7->_heartRhythmAvailabilityObservers;
    v7->_heartRhythmAvailabilityObservers = (HKObserverSet *)v11;

    +[HKKeyValueDomain heartRhythmDefaultsDomainWithHealthStore:](HKKeyValueDomain, "heartRhythmDefaultsDomainWithHealthStore:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    keyValueDomain = v7->_keyValueDomain;
    v7->_keyValueDomain = (HKKeyValueDomain *)v13;

    objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
    v15 = objc_claimAutoreleasedReturnValue();
    heartRhythmUserDefaults = v7->_heartRhythmUserDefaults;
    v7->_heartRhythmUserDefaults = (NSUserDefaults *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    onboardingKeysReadSet = v7->_onboardingKeysReadSet;
    v7->_onboardingKeysReadSet = v17;

    *(_QWORD *)&v7->_cacheLock._os_unfair_lock_opaque = 0;
    v19 = -[HKWatchAppAvailability initWithBundleID:]([HKWatchAppAvailability alloc], "initWithBundleID:", CFSTR("com.apple.NanoHeartRhythm"));
    ecgAppAvailability = v7->_ecgAppAvailability;
    v7->_ecgAppAvailability = v19;

    -[HKHeartRhythmAvailability _registerForNotifications](v7, "_registerForNotifications");
  }

  return v7;
}

- (HKHeartRhythmAvailability)initWithHealthStore:(id)a3 currentCountryCode:(id)a4
{
  id v7;
  HKHeartRhythmAvailability *v8;
  HKHeartRhythmAvailability *v9;

  v7 = a4;
  v8 = -[HKHeartRhythmAvailability initWithHealthStore:](self, "initWithHealthStore:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_currentCountryCode, a4);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[HKHeartRhythmAvailability _unregisterForNotifications](self, "_unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)HKHeartRhythmAvailability;
  -[HKHeartRhythmAvailability dealloc](&v3, sel_dealloc);
}

- (void)addHeartRhythmAvailabilityObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_heartRhythmAvailabilityObservers, "registerObserver:", a3);
}

- (void)removeHeartRhythmAvailabilityObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_heartRhythmAvailabilityObservers, "unregisterObserver:", a3);
}

- (void)notifyHeartRhythmAvailabilityDidUpdate
{
  -[HKObserverSet notifyObservers:](self->_heartRhythmAvailabilityObservers, "notifyObservers:", &__block_literal_global_102);
}

uint64_t __67__HKHeartRhythmAvailability_notifyHeartRhythmAvailabilityDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "heartRhythmAvailabilityDidUpdate");
}

+ (BOOL)isHeartRateEnabledInPrivacy
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.nanolifestyle.privacy"));
  objc_msgSend(v2, "objectForKey:", CFSTR("EnableHeartRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("EnableHeartRate"));
  else
    v4 = 1;

  return v4;
}

- (BOOL)isHeartAgeGatingEnabledOnActiveWatchWithCurrentDate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[HKHeartRhythmAvailability isHeartAgeGatingEnabledOnWatch:currentDate:](self, "isHeartAgeGatingEnabledOnWatch:currentDate:", v5, v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isHeartAgeGatingEnabledOnWatch:(id)a3 currentDate:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  int v10;
  HKHealthStore *healthStore;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  id v17;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", CFSTR("D6645782-7A76-4E52-8155-151366EBD4AB"));
  v10 = objc_msgSend(v8, "supportsCapability:", v9);

  if (v10)
  {
    healthStore = self->_healthStore;
    v17 = 0;
    -[HKHealthStore dateOfBirthComponentsWithError:](healthStore, "dateOfBirthComponentsWithError:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    v14 = v13;
    if (v12)
    {
      v15 = objc_msgSend(v12, "hk_ageWithCurrentDate:", v6) < 13;
    }
    else
    {
      if (v13)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
          -[HKHeartRhythmAvailability isHeartAgeGatingEnabledOnWatch:currentDate:].cold.1();
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:(id)a3
{
  return -[HKHeartRhythmAvailability _meetsMinimumAgeRequirementWithMinimumRequiredAge:currentDate:](self, "_meetsMinimumAgeRequirementWithMinimumRequiredAge:currentDate:", 22, a3);
}

- (BOOL)_meetsMinimumAgeRequirementWithMinimumRequiredAge:(int64_t)a3 currentDate:(id)a4
{
  id v6;
  HKHealthStore *healthStore;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v13;

  v6 = a4;
  healthStore = self->_healthStore;
  v13 = 0;
  -[HKHealthStore dateOfBirthComponentsWithError:](healthStore, "dateOfBirthComponentsWithError:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v8, "hk_ageWithCurrentDate:", v6) >= a3;
  }
  else
  {
    if (v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
        -[HKHeartRhythmAvailability _meetsMinimumAgeRequirementWithMinimumRequiredAge:currentDate:].cold.1();
    }
    v11 = 1;
  }

  return v11;
}

- (void)_registerForNotifications
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD handler[4];
  id v27;
  id location;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke;
  handler[3] = &unk_1E37E9F88;
  objc_copyWeak(&v27, &location);
  notify_register_dispatch("HKHeartRhythmOnboardingStateDidChangeNotification", &self->_onboardingStateDidChangeNotificationToken, v3, handler);

  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_2;
  v24[3] = &unk_1E37E9F88;
  objc_copyWeak(&v25, &location);
  notify_register_dispatch("HKRemoteFeatureAvailabilityConditionsDidUpdateNotification", &self->_featureAvailabilityConditionsDidUpdateNotificationToken, v3, v24);
  v6 = MEMORY[0x1E0C80D38];

  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_3;
  v22[3] = &unk_1E37E9F88;
  objc_copyWeak(&v23, &location);
  notify_register_dispatch("com.apple.healthd.user-characteristics.did-change", &self->_userCharacteristicsDidChangeNotificationToken, v6, v22);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v8 = (id *)getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1;
  v32 = getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1;
  if (!getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1)
  {
    v9 = (void *)NanoRegistryLibrary_5();
    v8 = (id *)dlsym(v9, "NRPairedDeviceRegistryDeviceIsSetupNotification");
    v30[3] = (uint64_t)v8;
    getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_1 = (uint64_t)v8;
  }
  _Block_object_dispose(&v29, 8);
  if (v8)
  {
    v10 = *v8;
    objc_msgSend(getNRPairedDeviceRegistryClass_1(), "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__pairedOrActiveDevicesDidChange_, v10, v11);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v12 = (id *)getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1;
    v32 = getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1;
    if (!getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1)
    {
      v13 = (void *)NanoRegistryLibrary_5();
      v12 = (id *)dlsym(v13, "NRPairedDeviceRegistryDeviceDidUnpairNotification");
      v30[3] = (uint64_t)v12;
      getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_1 = (uint64_t)v12;
    }
    _Block_object_dispose(&v29, 8);
    if (v12)
    {
      v14 = *v12;
      objc_msgSend(getNRPairedDeviceRegistryClass_1(), "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__pairedOrActiveDevicesDidChange_, v14, v15);

      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v16 = (id *)getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1;
      v32 = getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1;
      if (!getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1)
      {
        v17 = (void *)NanoRegistryLibrary_5();
        v16 = (id *)dlsym(v17, "NRPairedDeviceRegistryDeviceDidBecomeActive");
        v30[3] = (uint64_t)v16;
        getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_1 = (uint64_t)v16;
      }
      _Block_object_dispose(&v29, 8);
      if (v16)
      {
        v18 = *v16;
        objc_msgSend(getNRPairedDeviceRegistryClass_1(), "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__pairedOrActiveDevicesDidChange_, v18, v19);

        objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__localeDidChange, *MEMORY[0x1E0C99720], 0);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRPairedDeviceRegistryDeviceDidBecomeActive(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("HKHeartRhythmAvailability.m"), 65, CFSTR("%s"), dlerror());
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRPairedDeviceRegistryDeviceDidUnpairNotification(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("HKHeartRhythmAvailability.m"), 64, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRPairedDeviceRegistryDeviceIsSetupNotification(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("HKHeartRhythmAvailability.m"), 63, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

void __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyHeartRhythmAvailabilityDidUpdate");

}

void __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_featureAvailabilityConditionsDidUpdate");

}

void __54__HKHeartRhythmAvailability__registerForNotifications__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyHeartRhythmAvailabilityDidUpdate");

}

- (void)_unregisterForNotifications
{
  if (notify_is_valid_token(self->_onboardingStateDidChangeNotificationToken))
    notify_cancel(self->_onboardingStateDidChangeNotificationToken);
  if (notify_is_valid_token(self->_featureAvailabilityConditionsDidUpdateNotificationToken))
    notify_cancel(self->_featureAvailabilityConditionsDidUpdateNotificationToken);
  if (notify_is_valid_token(self->_userCharacteristicsDidChangeNotificationToken))
    notify_cancel(self->_userCharacteristicsDidChangeNotificationToken);
}

- (void)_featureAvailabilityConditionsDidUpdate
{
  -[HKHeartRhythmAvailability _resetElectrocardiogramRescindedStatusCacheWithLock:](self, "_resetElectrocardiogramRescindedStatusCacheWithLock:", 1);
  -[HKHeartRhythmAvailability notifyHeartRhythmAvailabilityDidUpdate](self, "notifyHeartRhythmAvailabilityDidUpdate");
}

- (void)_pairedOrActiveDevicesDidChange:(id)a3
{
  HKActiveWatchRemoteFeatureAvailabilityDataSource *v4;
  HKActiveWatchRemoteFeatureAvailabilityDataSource *electrocardiogramAvailabilityDataSource;

  v4 = objc_alloc_init(HKActiveWatchRemoteFeatureAvailabilityDataSource);
  electrocardiogramAvailabilityDataSource = self->_electrocardiogramAvailabilityDataSource;
  self->_electrocardiogramAvailabilityDataSource = v4;

  -[HKHeartRhythmAvailability _resetElectrocardiogramRescindedStatusCacheWithLock:](self, "_resetElectrocardiogramRescindedStatusCacheWithLock:", 1);
  -[HKHeartRhythmAvailability notifyHeartRhythmAvailabilityDidUpdate](self, "notifyHeartRhythmAvailabilityDidUpdate");
}

+ (id)activePairedDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(getNRPairedDeviceRegistryClass_1(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass_1(), "activeDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pairedDevices
{
  void *v2;
  void *v3;

  objc_msgSend(getNRPairedDeviceRegistryClass_1(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSetupCompletedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice
{
  return (Class)objc_opt_class();
}

+ (Class)deviceRegionFeatureSupportedStateProviderForCompanionDevice:(id)a3
{
  return (Class)objc_opt_class();
}

+ (BOOL)isCompanionRegionCheckEnabledForActiveWatch
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isCompanionRegionCheckEnabledForDevice:", v3);

  return (char)v2;
}

+ (BOOL)isCompanionRegionCheckEnabledForDevice:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", CFSTR("03C7A646-DB1E-404B-B393-033E5496A383"));
  v7 = objc_msgSend(v5, "supportsCapability:", v6);

  _HKInitializeLogging();
  v8 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 1026;
    v19 = v7;
    _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> supports capability: %{public}d", (uint8_t *)&v14, 0x1Cu);

  }
  return v7;
}

+ (BOOL)isCompanionRegionCheckEnabledOnPairedPhone
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "isCompanionRegionCheckEnabledForDevice:", v4);
    +[HKNanoRegistryDeviceUtility systemBuildVersionForDevice:](HKNanoRegistryDeviceUtility, "systemBuildVersionForDevice:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("17E5223")) ^ 1;
    LODWORD(v8) = v5 & v7;
    _HKInitializeLogging();
    v9 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_opt_class();
      v12 = v11;
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 1026;
      v22 = (int)v8;
      v23 = 1026;
      v24 = v7;
      _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (companion software supported: %{public}d)", (uint8_t *)&v17, 0x22u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)HKLogHeartRhythm;
    LOBYTE(v8) = 0;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v14;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = a1;
      v19 = 2114;
      v20 = v15;
      v21 = 1026;
      v22 = 0;
      _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (No paired phone)", (uint8_t *)&v17, 0x1Cu);

      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

+ (id)currentDeviceRegionCode
{
  return +[_HKBehavior currentDeviceRegionCode](_HKBehavior, "currentDeviceRegionCode");
}

+ (id)featureAvailabilityUserDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "hk_remoteFeatureAvailabilityUserDefaults");
}

- (BOOL)_isOnboardingCompletedForKey:(id)a3 version:(int64_t)a4
{
  return -[HKHeartRhythmAvailability _isOnboardingCompletedForKey:version:useCache:](self, "_isOnboardingCompletedForKey:version:useCache:", a3, a4, 1);
}

- (BOOL)_isOnboardingCompletedForKey:(id)a3 version:(int64_t)a4 useCache:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  void *v11;
  int v12;
  os_unfair_lock_s *p_onboardingKeysReadLock;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v33;
  const char *v34;
  __int16 v35;
  _BYTE v36[20];
  void *v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v5)
  {
    -[HKHeartRhythmAvailability heartRhythmUserDefaults](self, "heartRhythmUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      LOBYTE(v12) = objc_msgSend(v11, "integerValue") >= a4;
      p_onboardingKeysReadLock = &self->_onboardingKeysReadLock;
      os_unfair_lock_lock(&self->_onboardingKeysReadLock);
      -[HKHeartRhythmAvailability onboardingKeysReadSet](self, "onboardingKeysReadSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v9);

      if ((v15 & 1) != 0)
      {
        _HKInitializeLogging();
        v16 = (void *)HKLogHeartRhythm;
        if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_INFO))
        {
          v17 = v16;
          v18 = (void *)objc_opt_class();
          v19 = v18;
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138544130;
          v34 = (const char *)v18;
          v35 = 2114;
          *(_QWORD *)v36 = v20;
          *(_WORD *)&v36[8] = 2114;
          *(_QWORD *)&v36[10] = v9;
          *(_WORD *)&v36[18] = 2114;
          v37 = v11;
          v21 = v17;
          v22 = OS_LOG_TYPE_INFO;
LABEL_16:
          _os_log_impl(&dword_19A0E6000, v21, v22, "[%{public}@ %{public}@%{public}@] -> %{public}@ (Cached value)", (uint8_t *)&v33, 0x2Au);

        }
      }
      else
      {
        -[HKHeartRhythmAvailability onboardingKeysReadSet](self, "onboardingKeysReadSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v9);

        _HKInitializeLogging();
        v30 = (void *)HKLogHeartRhythm;
        if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v30;
          v31 = (void *)objc_opt_class();
          v19 = v31;
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138544130;
          v34 = (const char *)v31;
          v35 = 2114;
          *(_QWORD *)v36 = v20;
          *(_WORD *)&v36[8] = 2114;
          *(_QWORD *)&v36[10] = v9;
          *(_WORD *)&v36[18] = 2114;
          v37 = v11;
          v21 = v17;
          v22 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_16;
        }
      }
      os_unfair_lock_unlock(p_onboardingKeysReadLock);

      goto LABEL_18;
    }
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("HKElectrocardiogramOnboardingCompleted")))
  {
    v27 = -[HKHeartRhythmAvailability _getOnboardingVersionForKey:](self, "_getOnboardingVersionForKey:", v9);
    v12 = v27 >= a4;
    if (!v5)
      goto LABEL_12;
LABEL_10:
    if (v27)
      -[HKHeartRhythmAvailability _updateOnboardingCompletionForKey:andVersion:](self, "_updateOnboardingCompletionForKey:andVersion:", v9, v27);
    goto LABEL_12;
  }
  -[HKHeartRhythmAvailability electrocardiogramOnboardingHistoryType:](self, "electrocardiogramOnboardingHistoryType:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "maxOnboardedVersion"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:](HKElectrocardiogramActiveAlgorithmVersion, "knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = +[HKElectrocardiogramActiveAlgorithmVersion onboardingVersionForKnownAlgorithmVersion:](HKElectrocardiogramActiveAlgorithmVersion, "onboardingVersionForKnownAlgorithmVersion:", objc_msgSend(v26, "integerValue"));
  v12 = objc_msgSend(v23, "containsOnboardedVersion:", a4);

  if (v5)
    goto LABEL_10;
LABEL_12:
  _HKInitializeLogging();
  v28 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 136447234;
    v34 = "-[HKHeartRhythmAvailability _isOnboardingCompletedForKey:version:useCache:]";
    v35 = 1024;
    *(_DWORD *)v36 = v12;
    *(_WORD *)&v36[4] = 2114;
    *(_QWORD *)&v36[6] = v9;
    *(_WORD *)&v36[14] = 1026;
    *(_DWORD *)&v36[16] = a4;
    LOWORD(v37) = 1026;
    *(_DWORD *)((char *)&v37 + 2) = v27;
    _os_log_impl(&dword_19A0E6000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> %i, argKey: %{public}@ argVersion: %{public}i, versionCompleted: %{public}i", (uint8_t *)&v33, 0x28u);
  }
LABEL_18:

  return v12;
}

- (int64_t)_getOnboardingVersionForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "numberForKey:error:", v5, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (v7)
  {
    v9 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    if (v8)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
        -[HKHeartRhythmAvailability _getOnboardingVersionForKey:].cold.1((uint64_t)v5);
    }
    v9 = 0;
  }
  _HKInitializeLogging();
  v10 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_opt_class();
    v13 = v12;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v12;
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v5;
    v23 = 2048;
    v24 = v9;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@%{public}@] -> %ld (Retrieved from HealthKit)", buf, 0x2Au);

  }
  return v9;
}

- (void)_updateOnboardingCompletionForKey:(id)a3 andVersion:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HKHeartRhythmAvailability heartRhythmUserDefaults](self, "heartRhythmUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", a4, v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  HKSynchronizeNanoPreferencesUserDefaults(CFSTR("com.apple.private.health.heart-rhythm"), v8);
}

+ (id)_onboardingHistoryKeyFromCompletedKey:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HKElectrocardiogramOnboardingCompleted")) & 1) != 0)
  {
    v4 = CFSTR("HKElectrocardiogramOnboardingHistory");
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HKAtrialFibrillationDetectionOnboardingCompleted")) & 1) == 0)
    {
      _HKInitializeLogging();
      v5 = (void *)HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
        +[HKHeartRhythmAvailability _onboardingHistoryKeyFromCompletedKey:].cold.1(v5);
    }
    v4 = 0;
  }

  return (id)v4;
}

+ (id)_onboardingCountryCodeKeyFromCompletedKey:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HKElectrocardiogramOnboardingCompleted")) & 1) != 0)
  {
    v4 = CFSTR("HKElectrocardiogramOnboardingCountryCode");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HKAtrialFibrillationDetectionOnboardingCompleted")) & 1) != 0)
  {
    v4 = CFSTR("HKAtrialFibrillationDetectionOnboardingCountryCode");
  }
  else
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      +[HKHeartRhythmAvailability _onboardingHistoryKeyFromCompletedKey:].cold.1(v5);
    v4 = 0;
  }

  return (id)v4;
}

- (id)_makeOnboardingHistoryWithVersionCompleted:(int64_t)a3 versionCompletedKey:(id)a4 additionalValues:(id)a5 countryCodeKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;

  if (a3)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = (void *)objc_opt_class();
    -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_onboardingHistoryWithVersionCompletedKey:keyValueDomain:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v18 = &stru_1E37FD4C0;
    if (v17)
      v18 = v17;
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v19, v20);

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v21;
}

- (void)_setOnboardingVersionCompleted:(int64_t)a3 forKey:(id)a4 additionalValues:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[2];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v26 = a5;
  v27 = a6;
  v11 = (void *)objc_msgSend(v26, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;

  objc_msgSend((id)objc_opt_class(), "_onboardingHistoryKeyFromCompletedKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_onboardingCountryCodeKeyFromCompletedKey:", v10);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v15 || !v16)
    goto LABEL_8;
  -[HKHeartRhythmAvailability _makeOnboardingHistoryWithVersionCompleted:versionCompletedKey:additionalValues:countryCodeKey:](self, "_makeOnboardingHistoryWithVersionCompleted:versionCompletedKey:additionalValues:countryCodeKey:", a3, v10, v26, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v20 = objc_msgSend(v19, "setPropertyListValue:forKey:error:", v18, v15, &v32);
  v21 = v32;

  if ((v20 & 1) != 0)
  {

LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v10);

    _HKInitializeLogging();
    v23 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v34 = "-[HKHeartRhythmAvailability _setOnboardingVersionCompleted:forKey:additionalValues:completion:]";
      v35 = 2048;
      v36 = a3;
      v37 = 2114;
      v38 = v10;
      v39 = 2114;
      v40 = v14;
      _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}s] %ld %{public}@ %{public}@", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke;
    v28[3] = &unk_1E37F4808;
    v31[1] = (id)a3;
    v29 = v10;
    v30 = v27;
    objc_copyWeak(v31, (id *)buf);
    objc_msgSend(v24, "setValuesWithDictionary:completion:", v14, v28);

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);
    goto LABEL_16;
  }
  _HKInitializeLogging();
  v25 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v34 = (const char *)a3;
    v35 = 2112;
    v36 = (int64_t)v10;
    v37 = 2112;
    v38 = v21;
    _os_log_error_impl(&dword_19A0E6000, v25, OS_LOG_TYPE_ERROR, "Couldn't set heart rhythm onboarding history %ld for key [%@]: %@", buf, 0x20u);
  }
  if (v27)
    (*((void (**)(id, _QWORD, id))v27 + 2))(v27, 0, v21);

LABEL_16:
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HKNanoSyncControl *v12;
  id v13;
  void *v14;
  HKNanoSyncControl *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "heartRhythmUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
      objc_msgSend(v8, "setInteger:forKey:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults(CFSTR("com.apple.private.health.heart-rhythm"), v11);

    notify_post("HKHeartRhythmOnboardingStateDidChangeNotification");
    v12 = [HKNanoSyncControl alloc];
    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v13, "healthStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKNanoSyncControl initWithHealthStore:](v12, "initWithHealthStore:", v14);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_85;
    v16[3] = &unk_1E37F47E0;
    v19 = *(_QWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    -[HKNanoSyncControl forceNanoSyncWithOptions:completion:](v15, "forceNanoSyncWithOptions:completion:", 0, v16);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_cold_1();
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v5);
  }

}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_85(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_85_cold_1();
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);

}

- (void)_setFirstOnboardingCompletedDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v9);
  _HKInitializeLogging();
  v12 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v23 = "-[HKHeartRhythmAvailability _setFirstOnboardingCompletedDate:forKey:completion:]";
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] %{public}@ %{public}@ %{public}@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke;
  v17[3] = &unk_1E37F4830;
  v14 = v8;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_copyWeak(&v21, (id *)buf);
  objc_msgSend(v13, "setValuesWithDictionary:completion:", v11, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  HKNanoSyncControl *v6;
  id WeakRetained;
  void *v8;
  HKNanoSyncControl *v9;
  void (**v10)(id, _QWORD, id);
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = [HKNanoSyncControl alloc];
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "healthStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKNanoSyncControl initWithHealthStore:](v6, "initWithHealthStore:", v8);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_87;
    v11[3] = &unk_1E37E8C38;
    v12 = a1[4];
    v13 = a1[5];
    v14 = a1[6];
    -[HKNanoSyncControl forceNanoSyncWithOptions:completion:](v9, "forceNanoSyncWithOptions:completion:", 0, v11);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_cold_1();
    v10 = (void (**)(id, _QWORD, id))a1[6];
    if (v10)
      v10[2](v10, 0, v5);
  }

}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_87_cold_1();
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);

}

- (void)_removeFirstOnboardingCompletedDatesForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke;
  v12[3] = &unk_1E37F4858;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v9, "removeValuesForKeys:completion:", v8, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  HKNanoSyncControl *v6;
  id WeakRetained;
  void *v8;
  HKNanoSyncControl *v9;
  void (**v10)(id, _QWORD, id);
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = [HKNanoSyncControl alloc];
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "healthStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKNanoSyncControl initWithHealthStore:](v6, "initWithHealthStore:", v8);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_88;
    v11[3] = &unk_1E37E67C0;
    v12 = a1[4];
    v13 = a1[5];
    -[HKNanoSyncControl forceNanoSyncWithOptions:completion:](v9, "forceNanoSyncWithOptions:completion:", 0, v11);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_cold_1((uint64_t)a1);
    v10 = (void (**)(id, _QWORD, id))a1[5];
    if (v10)
      v10[2](v10, 0, v5);
  }

}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_88_cold_1(a1);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);

}

- (void)_triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay:(int64_t)a3
{
  dispatch_time_t v5;
  _QWORD block[5];

  notify_post("HKRemoteFeatureAvailabilityConditionsDidUpdateNotification");
  v5 = dispatch_time(0, 1000000000 * a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HKHeartRhythmAvailability__triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay___block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

void __87__HKHeartRhythmAvailability__triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend((id)objc_opt_class(), "featureAvailabilityUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v0, CFSTR("RefreshFeatureAvailabilityConditions"));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("RefreshFeatureAvailabilityConditions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults(CFSTR("com.apple.private.health.feature-availability"), v1);

}

- (HKRegulatoryDomainProvider)mobileCountryCodeManager
{
  HKRegulatoryDomainProvider *mobileCountryCodeManager;
  HKRegulatoryDomainProvider *v4;
  HKRegulatoryDomainProvider *v5;

  mobileCountryCodeManager = self->_mobileCountryCodeManager;
  if (!mobileCountryCodeManager)
  {
    HKPreferredRegulatoryDomainProvider();
    v4 = (HKRegulatoryDomainProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mobileCountryCodeManager;
    self->_mobileCountryCodeManager = v4;

    mobileCountryCodeManager = self->_mobileCountryCodeManager;
  }
  return mobileCountryCodeManager;
}

- (BOOL)isElectrocardiogramAvailableOnWatch:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  v8 = +[HKNanoRegistryDeviceUtility systemVersionForDevice:](HKNanoRegistryDeviceUtility, "systemVersionForDevice:", v7);
  v9 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:andWatchDevice:](HKHeartRhythmAvailability, "_isECG2SupportedForCountryCode:andWatchDevice:", v6, v7);

  v10 = v9
     || -[HKHeartRhythmAvailability _isECG1SupportedForCountryCode:watchOSVersion:isWatchOSSeedBuild:](self, "_isECG1SupportedForCountryCode:watchOSVersion:isWatchOSSeedBuild:", v6, v8, 0);

  return v10;
}

- (BOOL)isElectrocardiogramAvailableForOnboardingCountryCode:(id)a3
{
  id v4;
  void *v5;
  uint64_t NRRawVersionFromString;
  void *v7;
  BOOL v8;

  v4 = a3;
  +[_HKBehavior currentOSVersion](_HKBehavior, "currentOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NRRawVersionFromString = getNRRawVersionFromString(v5);

  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7
    && +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:andPhoneDevice:](HKHeartRhythmAvailability, "_isECG2SupportedForCountryCode:andPhoneDevice:", v4, v7)|| -[HKHeartRhythmAvailability _isECG1SupportedForCountryCode:watchOSVersion:isWatchOSSeedBuild:](self, "_isECG1SupportedForCountryCode:watchOSVersion:isWatchOSSeedBuild:", v4, NRRawVersionFromString, 0);

  return v8;
}

- (BOOL)isElectrocardiogramOnboardingCompleted
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[HKHeartRhythmAvailability _isOnboardingCompletedForKey:version:](self, "_isOnboardingCompletedForKey:version:", CFSTR("HKElectrocardiogramOnboardingCompleted"), +[HKECGOnboardingVersion newestAvailableVersion](HKECGOnboardingVersion, "newestAvailableVersion"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));

  return v6;
}

- (BOOL)isElectrocardiogramOnboardingCompletedNoCache
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[HKHeartRhythmAvailability _isOnboardingCompletedForKey:version:useCache:](self, "_isOnboardingCompletedForKey:version:useCache:", CFSTR("HKElectrocardiogramOnboardingCompleted"), +[HKECGOnboardingVersion newestAvailableVersion](HKECGOnboardingVersion, "newestAvailableVersion"), 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));

  return v6;
}

- (void)updateOnboardingCompletionVersionCache
{
  -[HKHeartRhythmAvailability _updateOnboardingCompletionForKey:andVersion:](self, "_updateOnboardingCompletionForKey:andVersion:", CFSTR("HKElectrocardiogramOnboardingCompleted"), -[HKHeartRhythmAvailability electrocardiogramOnboardingCompletedVersionNoCache](self, "electrocardiogramOnboardingCompletedVersionNoCache"));
}

- (void)updateElectrocardiogramWatchAppInstallIsAllowed
{
  if (-[HKHeartRhythmAvailability _isOnboardingCompletedForKey:version:](self, "_isOnboardingCompletedForKey:version:", CFSTR("HKElectrocardiogramOnboardingCompleted"), 3))
  {
    -[HKHeartRhythmAvailability setAllowInstallingElectrocardiogramWatchApp:](self, "setAllowInstallingElectrocardiogramWatchApp:", 1);
  }
}

- (int64_t)electrocardiogramOnboardingCompletedVersionNoCache
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[HKHeartRhythmAvailability _getOnboardingVersionForKey:](self, "_getOnboardingVersionForKey:", CFSTR("HKElectrocardiogramOnboardingCompleted"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));

  return v6;
}

- (id)electrocardiogramOnboardingCountryCode
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  char *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "stringForKey:error:", CFSTR("HKElectrocardiogramOnboardingCountryCode"), &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;

  if (!v4 && v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      -[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode].cold.1();
    if (objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
    {
      _HKInitializeLogging();
      v6 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
        _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}s]: Database inaccessible, resetting electrocardiogram disabled cache for next query.", buf, 0xCu);
      }
      -[HKHeartRhythmAvailability _resetElectrocardiogramRescindedStatusCacheWithLock:](self, "_resetElectrocardiogramRescindedStatusCacheWithLock:", 0);
    }
    _HKInitializeLogging();
    v7 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> nil (Error retrieving)", buf, 0xCu);
    }
    v8 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v4, "hk_copyNonEmptyString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8
    || !-[HKHeartRhythmAvailability isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion](self, "isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion"))
  {
    _HKInitializeLogging();
    v9 = HKLogHeartRhythm;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136446466;
    v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
    v19 = 2114;
    v20 = (const char *)v8;
    v10 = "[%{public}s] -> %{public}@ (Retrieved from HealthKit)";
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogHeartRhythm;
    v8 = CFSTR("US");
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136446466;
    v18 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
    v19 = 2114;
    v20 = CFSTR("US");
    v10 = "[%{public}s] -> %{public}@ (Not Present, Assumed)";
  }
  _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);
LABEL_19:
  _HKInitializeLogging();
  v11 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 2082;
    v20 = "-[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode]";
    v21 = 2114;
    v22 = v8;
    v14 = v13;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}s] -> %{public}@", buf, 0x20u);

  }
LABEL_21:

  return v8;
}

- (id)_electrocardiogramFirstOnboardingCompletedDate
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dateForKey:error:", CFSTR("HKElectrocardiogramFirstOnboardingCompleted"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v3)
  {
    _HKInitializeLogging();
    v5 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v9 = "-[HKHeartRhythmAvailability _electrocardiogramFirstOnboardingCompletedDate]";
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> %{public}@ (Retrieved from HealthKit)", buf, 0x16u);
    }
  }
  else if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      -[HKHeartRhythmAvailability _electrocardiogramFirstOnboardingCompletedDate].cold.1();
  }

  return v3;
}

- (void)setElectrocardiogramOnboardingCompleted
{
  -[HKHeartRhythmAvailability _setOnboardingVersionCompleted:forKey:additionalValues:completion:](self, "_setOnboardingVersionCompleted:forKey:additionalValues:completion:", +[HKECGOnboardingVersion newestAvailableVersion](HKECGOnboardingVersion, "newestAvailableVersion"), CFSTR("HKElectrocardiogramOnboardingCompleted"), 0, 0);
}

- (void)setElectrocardiogramFirstOnboardingCompletedDate:(id)a3
{
  -[HKHeartRhythmAvailability _setFirstOnboardingCompletedDate:forKey:completion:](self, "_setFirstOnboardingCompletedDate:forKey:completion:", a3, CFSTR("HKElectrocardiogramFirstOnboardingCompleted"), 0);
}

- (void)unitTest_setElectrocardiogramOnboardingCompletedForVersion:(int64_t)a3 countryCode:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a4)
  {
    v11 = CFSTR("HKElectrocardiogramOnboardingCountryCode");
    v12[0] = a4;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = a4;
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HKHeartRhythmAvailability _setOnboardingVersionCompleted:forKey:additionalValues:completion:](self, "_setOnboardingVersionCompleted:forKey:additionalValues:completion:", a3, CFSTR("HKElectrocardiogramOnboardingCompleted"), a4, v8);

}

- (void)_setElectrocardiogramOnboardingCompletedForVersion:(int64_t)a3 inCountryCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v12 = CFSTR("HKElectrocardiogramOnboardingCountryCode");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__HKHeartRhythmAvailability__setElectrocardiogramOnboardingCompletedForVersion_inCountryCode___block_invoke;
  v9[3] = &unk_1E37F4880;
  objc_copyWeak(&v10, &location);
  -[HKHeartRhythmAvailability _setOnboardingVersionCompleted:forKey:additionalValues:completion:](self, "_setOnboardingVersionCompleted:forKey:additionalValues:completion:", a3, CFSTR("HKElectrocardiogramOnboardingCompleted"), v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __94__HKHeartRhythmAvailability__setElectrocardiogramOnboardingCompletedForVersion_inCountryCode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerFeatureAvailabilityUpdateOnPhoneAndWatchWithDelay:", 2);

}

- (BOOL)activePairedDevicesSupportElectrocardiogramAlgorithmVersion:(int64_t)a3
{
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  if (a3 == 2)
  {
    v6 = -[HKHeartRhythmAvailability _activePairedDevicesSupportECGAlgorithmVersionTwo:](self, "_activePairedDevicesSupportECGAlgorithmVersionTwo:", v5);
    goto LABEL_7;
  }
  if (a3 != 1)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_8;
  }
  v6 = objc_msgSend((id)objc_opt_class(), "electrocardiogramSupportedForDevice:", v5);
LABEL_7:
  v7 = v6;
LABEL_8:
  _HKInitializeLogging();
  v8 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446466;
    v11 = "-[HKHeartRhythmAvailability activePairedDevicesSupportElectrocardiogramAlgorithmVersion:]";
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s] -> %i", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (BOOL)_activePairedDevicesSupportECGAlgorithmVersionTwo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v3 = a3;
  +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice](HKHeartRhythmAvailability, "_ECG2SupportedCountriesOnDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice:](HKHeartRhythmAvailability, "_ECG2SupportedCountriesOnDevice:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v7 = !v6;

  return v7;
}

+ (BOOL)shouldInstallWatchApp
{
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HKForceInstallCinnamon"));

  if ((v5 & 1) != 0)
    return 1;
  if (+[_HKBehavior isRunningStoreDemoMode](_HKBehavior, "isRunningStoreDemoMode"))
  {
    _HKInitializeLogging();
    v7 = (void *)HKLogHeartRhythm;
    v6 = 0;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      return v6;
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = a1;
    v31 = 2114;
    v32 = v9;
    v10 = "[%{public}@ %{public}@] -> 0 (Not allowed in Store Demo Mode)";
LABEL_15:
    _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v29, 0x16u);

    return 0;
  }
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "tinkerModeEnabled");

  if (v12)
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogHeartRhythm;
    v6 = 0;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      return v6;
    v8 = v13;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = a1;
    v31 = 2114;
    v32 = v9;
    v10 = "[%{public}@ %{public}@] -> 0 (Not allowed in Satellite Pairing Mode)";
    goto LABEL_15;
  }
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    _HKInitializeLogging();
    v19 = (void *)HKLogHeartRhythm;
    v6 = 0;
    if (!os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      return v6;
    v8 = v19;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = a1;
    v31 = 2114;
    v32 = v9;
    v10 = "[%{public}@ %{public}@] -> 0 (Device hardware not supported)";
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hk_electrocardiogramWatchAppInstallHasBeenAllowed");

  if (v15)
  {
    _HKInitializeLogging();
    v16 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = a1;
      v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_19A0E6000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> 1 (HKElectrocardiogramWatchAppInstallIsAllowed is set to True", (uint8_t *)&v29, 0x16u);

    }
    return 1;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.private.health.heart-rhythm"));
  objc_msgSend(v21, "objectForKey:", CFSTR("HKElectrocardiogramOnboardingCompleted"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 && (unint64_t)objc_msgSend(v22, "integerValue") >= 3)
  {
    _HKInitializeLogging();
    v23 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = a1;
      v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_19A0E6000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> 1 (Onboarding has been completed (From Cached Value))", (uint8_t *)&v29, 0x16u);

    }
    v6 = 1;
  }
  else
  {
    _HKInitializeLogging();
    v26 = (void *)HKLogHeartRhythm;
    v6 = 0;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544386;
      v30 = a1;
      v31 = 2114;
      v32 = v28;
      v33 = 1026;
      v34 = 1;
      v35 = 1026;
      v36 = 0;
      v37 = 1026;
      v38 = 0;
      _os_log_impl(&dword_19A0E6000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> 0 (device supported (%{public}d), app install allowed (%{public}d), Current onboarding version completed (%{public}d))", (uint8_t *)&v29, 0x28u);

      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isElectrocardiogramAppInstallableForLocale:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char IsAvailableForGeolocatedCountryCode;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v7 = (void *)HKLogHeartRhythm;
  v8 = os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = a1;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Locale: %{public}@), Country Code: %{public}@)", (uint8_t *)&v16, 0x2Au);

    }
    IsAvailableForGeolocatedCountryCode = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v6);
  }
  else
  {
    if (v8)
    {
      v13 = v7;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = a1;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Locale contained a nil country code", (uint8_t *)&v16, 0x16u);

    }
    IsAvailableForGeolocatedCountryCode = 0;
  }

  return IsAvailableForGeolocatedCountryCode;
}

- (void)setAllowInstallingElectrocardiogramWatchApp:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  HKHeartRhythmAvailability *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_setElectrocardiogramWatchAppInstallIsAllowed:", v3);

  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21[0] = CFSTR("ElectrocardiogramWatchAppInstallIsAllowed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  HKSynchronizeNanoPreferencesUserDefaults(CFSTR("com.apple.private.health.heart-rhythm"), v9);
  _HKInitializeLogging();
  v10 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = self;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = CFSTR("ElectrocardiogramWatchAppInstallIsAllowed");
    v19 = 1026;
    v20 = v3;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Triggered NanoPreferencesSync (key: %{public}@; value: %{public}d)",
      (uint8_t *)&v13,
      0x26u);

  }
}

- (BOOL)isElectrocardiogramAppInstallAllowedForWatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  int v18;
  int IsAvailableForGeolocatedCountryCode;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  _BYTE buf[24];
  _BYTE v29[14];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getNRDevicePropertyName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
  v7 = objc_msgSend(v4, "supportsCapability:", v6);

  getNRDevicePropertyIsAltAccount();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v9, "BOOLValue");

  v10 = -[HKHeartRhythmAvailability isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion](self, "isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion");
  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v13 = (_QWORD *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  *(_QWORD *)v29 = getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  if (!getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr)
  {
    v14 = (void *)NanoRegistryLibrary_5();
    v13 = dlsym(v14, "NRDevicePropertyCurrentUserLocale");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
    getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(buf, 8);
  if (!v13)
    -[HKHeartRhythmAvailability isElectrocardiogramAppInstallAllowedForWatch:].cold.1();
  objc_msgSend(v4, "valueForProperty:", *v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:andWatchDevice:](HKHeartRhythmAvailability, "_isECG2SupportedForCountryCode:andWatchDevice:", v12, v4);
  if (((v16 | +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:andWatchDevice:](HKHeartRhythmAvailability, "_isECG2SupportedForCountryCode:andWatchDevice:", v15, v4)) & 1) == 0)
  {
    if (v12)
    {
      IsAvailableForGeolocatedCountryCode = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v12);
      if (v15)
      {
LABEL_9:
        v20 = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v15);
        goto LABEL_12;
      }
    }
    else
    {
      IsAvailableForGeolocatedCountryCode = 0;
      if (v15)
        goto LABEL_9;
    }
    v20 = 0;
LABEL_12:
    v17 = IsAvailableForGeolocatedCountryCode | v20;
    if (v7)
      goto LABEL_6;
    goto LABEL_13;
  }
  v17 = 1;
  if (v7)
  {
LABEL_6:
    v18 = (v10 | v17) & ~v25;
    goto LABEL_14;
  }
LABEL_13:
  v18 = 0;
LABEL_14:
  _HKInitializeLogging();
  v21 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 1026;
    *(_DWORD *)v29 = v18;
    *(_WORD *)&v29[4] = 2114;
    *(_QWORD *)&v29[6] = v26;
    v30 = 1026;
    v31 = v7;
    v32 = 1026;
    v33 = v25;
    v34 = 1026;
    v35 = v10;
    v36 = 1026;
    v37 = v17;
    _os_log_impl(&dword_19A0E6000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (deviceName: %{public}@, deviceSupported: %{public}d, tinkerPaired: %{public}d, anyOnboardingCompleted: %{public}d, localeSupported: %{public}d", buf, 0x3Eu);

  }
  return v18;
}

+ (BOOL)isElectrocardiogramSupportedOnWatch:(id)a3
{
  id v5;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a1, "_electrocardiogramSupportedStateForDeviceRegion:", v5);
  v7 = objc_msgSend(a1, "electrocardiogramSupportedForDevice:", v5);
  getNRDevicePropertyIsAltAccount();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v6 < 2)
    v11 = v7 & ~v10;
  else
    v11 = 0;
  _HKInitializeLogging();
  v12 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v6 < 2;
    v14 = v12;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getNRDevicePropertyName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544898;
    v20 = a1;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v17;
    v25 = 1026;
    v26 = v11;
    v27 = 1026;
    v28 = v7;
    v29 = 1026;
    v30 = v10;
    v31 = 1026;
    v32 = v13;
    _os_log_impl(&dword_19A0E6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> %{public}d (Device supported: %{public}d; Alt Account: %{public}d; Region"
      " supported: %{public}d;)",
      (uint8_t *)&v19,
      0x38u);

  }
  return v11;
}

+ (BOOL)isElectrocardiogramSupportedOnAnyWatch
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnAnyWatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnAnyWatch"));

    return v7;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a1, "pairedDevices", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(a1, "isElectrocardiogramSupportedOnWatch:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)) & 1) != 0)
          {
            LODWORD(v10) = 1;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

    _HKInitializeLogging();
    v13 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = a1;
      v22 = 2114;
      v23 = v15;
      v24 = 1026;
      v25 = v10;
      _os_log_impl(&dword_19A0E6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", buf, 0x1Cu);

    }
    return v10;
  }
}

+ (BOOL)isElectrocardiogramSupportedOnActiveWatch
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnActiveWatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnActiveWatch"));

    return v7;
  }
  else
  {
    objc_msgSend(a1, "activePairedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = objc_msgSend(a1, "isElectrocardiogramSupportedOnWatch:", v9);
    else
      v10 = 0;
    _HKInitializeLogging();
    v11 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = a1;
      v16 = 2114;
      v17 = v13;
      v18 = 1026;
      v19 = v10;
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v14, 0x1Cu);

    }
    return v10;
  }
}

+ (BOOL)isElectrocardiogramSupportedOnAllWatches
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnAllWatches"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnAllWatches"));

    return v7;
  }
  else
  {
    objc_msgSend(a1, "pairedDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(v9, "count") != 0;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          if (!objc_msgSend(a1, "isElectrocardiogramSupportedOnWatch:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19))
          {
            v10 = 0;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_13:

    _HKInitializeLogging();
    v16 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = a1;
      v25 = 2114;
      v26 = v18;
      v27 = 1026;
      v28 = v10;
      _os_log_impl(&dword_19A0E6000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", buf, 0x1Cu);

    }
    return v10;
  }
}

+ (unint64_t)electrocardiogramSupportedStateForWatch:(id)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a1, "electrocardiogramSupportedForDevice:", v5);
  getNRDevicePropertyIsAltAccount();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = objc_msgSend(a1, "_electrocardiogramSupportedStateForDeviceRegion:", v5);
  _HKInitializeLogging();
  v11 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getNRDevicePropertyName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKElectrocardiogramSupportedState(v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544642;
    v21 = a1;
    v22 = 2114;
    v23 = v13;
    v24 = 2114;
    v25 = v15;
    v26 = 1026;
    v27 = v6;
    v28 = 1026;
    v29 = v9;
    v30 = 2114;
    v31 = v16;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> (Device supported: %{public}d; Alt Account: %{public}d; Region supported: %{public}@)",
      (uint8_t *)&v20,
      0x36u);

  }
  v17 = 5;
  if (!v9)
    v17 = v10;
  if (v6)
    v18 = v17;
  else
    v18 = 2;

  return v18;
}

+ (unint64_t)electrocardiogramSupportedStateForActiveWatch
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HKGlobalDefaultsElectrocardiogramSupportedStateForActiveWatchKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("HKGlobalDefaultsElectrocardiogramSupportedStateForActiveWatchKey"));
  }
  else
  {
    objc_msgSend(a1, "activePairedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7 = 2;
      goto LABEL_6;
    }
    v6 = objc_msgSend(a1, "electrocardiogramSupportedStateForWatch:", v5);
  }
  v7 = v6;
LABEL_6:

  return v7;
}

+ (BOOL)isElectrocardiogramAppDeletableForActiveWatch
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "activePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CFACCB8-FFEB-4682-A50E-16F853583912"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

+ (unint64_t)_electrocardiogramSupportedStateForDeviceRegion:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "deviceRegionFeatureSupportedStateProviderForCompanionDevice:", v4), "electrocardiogramSupportedStateForDeviceRegion:", v4);

  return v5;
}

+ (unint64_t)electrocardiogramSupportedState
{
  void *v3;
  char v4;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tinkerModeEnabled");

  if ((v4 & 1) != 0)
    return 5;
  else
    return objc_msgSend((id)objc_msgSend(a1, "deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice"), "electrocardiogramSupportedStateForCurrentDeviceRegion");
}

- (BOOL)shouldAdvertiseElectrocardiogramForActiveWatch
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HKGlobalDefaultsShouldAdvertiseElectrocardiogramForActiveWatchKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HKGlobalDefaultsShouldAdvertiseElectrocardiogramForActiveWatchKey"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "activePairedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = -[HKHeartRhythmAvailability shouldAdvertiseElectrocardiogramForWatch:](self, "shouldAdvertiseElectrocardiogramForWatch:", v5);
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (BOOL)shouldAdvertiseElectrocardiogramForWatch:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HKHeartRhythmAvailability _shouldAdvertiseECGDirectOnboardingWithDevice:](self, "_shouldAdvertiseECGDirectOnboardingWithDevice:", v4);
  v6 = -[HKHeartRhythmAvailability _shouldAdvertiseECG2DirectOnboardingWithWatchDevice:](self, "_shouldAdvertiseECG2DirectOnboardingWithWatchDevice:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HKHeartRhythmAvailability _shouldAdvertiseWithAdvertiseECGVersions:](self, "_shouldAdvertiseWithAdvertiseECGVersions:", v9);

  return (char)self;
}

- (BOOL)_shouldAdvertiseECGDirectOnboardingWithDevice:(id)a3
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSString *currentCountryCode;
  int v16;
  HKHeartRhythmAvailability *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_currentCountryCode)
  {
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend((id)objc_opt_class(), "electrocardiogramSupportedStateForWatch:", v5);
  if (v6 == 1)
  {
    if (HKElectrocardiogramIsAvailableForGeolocatedCountryCode(self->_currentCountryCode))
    {
      v7 = objc_msgSend((id)objc_opt_class(), "isElectrocardiogramSupportedOnWatch:", v5);
      goto LABEL_9;
    }
  }
  else if (!v6)
  {
    v7 = 1;
    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKHeartRhythmAvailability _meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:](self, "_meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:", v9);

  v8 = v7 & v10;
  _HKInitializeLogging();
  v11 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    currentCountryCode = self->_currentCountryCode;
    v16 = 138544386;
    v17 = self;
    v18 = 2114;
    v19 = v13;
    v20 = 1026;
    v21 = v8;
    v22 = 2114;
    v23 = currentCountryCode;
    v24 = 1026;
    v25 = v10;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d (Cached MCC: %{public}@, Meets Minimum Age Requirement: %{public}d)", (uint8_t *)&v16, 0x2Cu);

  }
LABEL_11:

  return v8;
}

- (BOOL)_shouldAdvertiseECG2DirectOnboardingWithWatchDevice:(id)a3
{
  void *v3;
  char v4;

  -[HKHeartRhythmAvailability _ecg2AvailabilityWithWatchDevice:](self, "_ecg2AvailabilityWithWatchDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "advertiseDirectOnboarding");

  return v4;
}

- (id)_ecg2AvailabilityWithWatchDevice:(id)a3
{
  NSString *currentCountryCode;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  unint64_t v14;
  char v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  NSString *v35;
  uint64_t v37;
  _BOOL4 v38;
  unsigned int v39;
  void *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  void *v44;
  uint8_t buf[4];
  HKHeartRhythmAvailability *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  unsigned int v64;
  __int16 v65;
  _BOOL4 v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  currentCountryCode = self->_currentCountryCode;
  v5 = a3;
  v43 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:andWatchDevice:](HKHeartRhythmAvailability, "_isECG2SupportedForCountryCode:andWatchDevice:", currentCountryCode, v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[HKHeartRhythmAvailability _meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:](self, "_meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:", v6);

  -[HKHeartRhythmAvailability _electrocardiogramOnboardingHistoryKnown](self, "_electrocardiogramOnboardingHistoryKnown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "currentElectrocardiogramOnboardingVersion");
  objc_msgSend(v7, "filteredHistoryByVersion:filterType:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v10 > 0;
  -[HKHeartRhythmAvailability heartRhythmUserDefaults](self, "heartRhythmUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("HKElectrocardiogramOnboardingCompleted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v13;
  if (v13)
  {
    v14 = objc_msgSend(v13, "integerValue");
    v11 = v10 > 0 || v14 < v8;
    LODWORD(v13) = objc_msgSend(v13, "integerValue") == 4;
  }
  v44 = v7;
  v16 = objc_msgSend(v7, "containsOnboardedVersion:", 4);
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("HKElectrocardiogramV1ToV2UpgradeBackgroundDelivered"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("HKElectrocardiogramV1ToV2UpgradeAlertDismissed"));

  if ((v16 & 1) != 0 || (_DWORD)v13)
    v21 = v18 & (v20 ^ 1u);
  else
    v21 = 0;
  v22 = objc_msgSend((id)objc_opt_class(), "electrocardiogramSupportedForDevice:", v5);
  +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice:](HKHeartRhythmAvailability, "_ECG2SupportedCountriesOnDevice:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v22;
  if (v23)
    v24 = v22;
  else
    v24 = 0;
  getNRDevicePropertyIsAltAccount();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "BOOLValue");
  LOBYTE(v37) = v27;
  +[HKECGAvailabilityEngine shouldAdvertiseECG2WithSupportedRegion:meetsAgeRequirement:backgroundDeliveredNotAdvertised:prevOnboarded:watchCapable:phoneCapable:isTinker:](HKECGAvailabilityEngine, "shouldAdvertiseECG2WithSupportedRegion:meetsAgeRequirement:backgroundDeliveredNotAdvertised:prevOnboarded:watchCapable:phoneCapable:isTinker:", v43, v42, v21, v11, v24, 1, v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v29 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v23 != 0;
    v30 = v29;
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v28, "advertiseDirectOnboarding");
    v33 = objc_msgSend(v28, "advertiseUpgradeBackgroundDelivered");
    v34 = objc_msgSend(v28, "advertiseUpgrade");
    v35 = self->_currentCountryCode;
    *(_DWORD *)buf = 138546178;
    v46 = self;
    v47 = 2114;
    v48 = v31;
    v49 = 1026;
    v50 = v32;
    v51 = 1026;
    v52 = v33;
    v53 = 1026;
    v54 = v34;
    v55 = 2114;
    v56 = v35;
    v57 = 1026;
    v58 = v43;
    v59 = 1026;
    v60 = v42;
    v61 = 1026;
    v62 = v11;
    v63 = 1026;
    v64 = v39;
    v65 = 1026;
    v66 = v38;
    v67 = 1026;
    v68 = 1;
    _os_log_impl(&dword_19A0E6000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG2 advertiseDirect: %{public}d advertiseUpgradeBackgroundDelivered: %{public}d advertiseUpgrade: %{public}d (Cached MCC: %{public}@, SupportedRegion: %{public}d, meetsMinAge: %{public}d, highestOnboardedVersionIsLessThanNewestKnownVersion: %{public}d, watchHardwareSupported: %{public}d, watchSoftwareSupported: %{public}d, phoneCapable: %{public}d", buf, 0x56u);

  }
  return v28;
}

- (id)_ecg2AvailabilityWithPhoneDevice:(id)a3
{
  return -[HKHeartRhythmAvailability _ecg2AvailabilityWithPhoneDevice:wasUpgradeBackgroundDelivered:](self, "_ecg2AvailabilityWithPhoneDevice:wasUpgradeBackgroundDelivered:", a3, 0);
}

- (id)_ecg2AvailabilityWithPhoneDevice:(id)a3 wasUpgradeBackgroundDelivered:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  NSString *currentCountryCode;
  uint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  uint8_t buf[4];
  HKHeartRhythmAvailability *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  NSString *v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = v6;
  if (a4)
  {
    v41 = 1;
  }
  else
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = +[HKHeartRhythmAvailability _isECG2SupportedForCountryCode:andPhoneDevice:](HKHeartRhythmAvailability, "_isECG2SupportedForCountryCode:andPhoneDevice:", v9, v7);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKHeartRhythmAvailability _meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:](self, "_meetsMinimumAgeRequirementForElectrocardiogramWithCurrentDate:", v10);

  -[HKHeartRhythmAvailability _electrocardiogramOnboardingHistoryKnown](self, "_electrocardiogramOnboardingHistoryKnown");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredHistoryByVersion:filterType:", objc_msgSend((id)objc_opt_class(), "currentElectrocardiogramOnboardingVersion"), 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v39, "count");
  v38 = v12;
  LODWORD(v12) = objc_msgSend(v12, "containsOnboardedVersion:", 4);
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("HKElectrocardiogramV1ToV2UpgradeBackgroundDelivered"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("HKElectrocardiogramV1ToV2UpgradeAlertDismissed"));

  if ((_DWORD)v12)
    v18 = v15 & (v17 ^ 1u);
  else
    v18 = 0;
  v19 = MGGetBoolAnswer();
  +[HKHeartRhythmAvailability _ECG2SupportedCountriesOnDevice](HKHeartRhythmAvailability, "_ECG2SupportedCountriesOnDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = v19;
  else
    v21 = 0;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "tinkerModeEnabled");

  LOBYTE(v36) = v23;
  v24 = v11;
  +[HKECGAvailabilityEngine shouldAdvertiseECG2WithSupportedRegion:meetsAgeRequirement:backgroundDeliveredNotAdvertised:prevOnboarded:watchCapable:phoneCapable:isTinker:](HKECGAvailabilityEngine, "shouldAdvertiseECG2WithSupportedRegion:meetsAgeRequirement:backgroundDeliveredNotAdvertised:prevOnboarded:watchCapable:phoneCapable:isTinker:", v41, v11, v18, v13 > 0, v21, 1, v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v26 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v20 != 0;
    v28 = v13 > 0;
    v29 = v26;
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v25, "advertiseDirectOnboarding");
    v32 = objc_msgSend(v25, "advertiseUpgradeBackgroundDelivered");
    v33 = objc_msgSend(v25, "advertiseUpgrade");
    currentCountryCode = self->_currentCountryCode;
    *(_DWORD *)buf = 138546178;
    v43 = self;
    v44 = 2114;
    v45 = v30;
    v46 = 1026;
    v47 = v31;
    v48 = 1026;
    v49 = v32;
    v50 = 1026;
    v51 = v33;
    v52 = 2114;
    v53 = currentCountryCode;
    v54 = 1026;
    v55 = v41;
    v56 = 1026;
    v57 = v24;
    v58 = 1026;
    v59 = v28;
    v60 = 1026;
    v61 = v19;
    v62 = 1026;
    v63 = v27;
    v64 = 1026;
    v65 = 1;
    _os_log_impl(&dword_19A0E6000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG2 advertiseDirect: %{public}d advertiseUpgradeBackgroundDelivered: %{public}d advertiseUpgrade: %{public}d (Cached MCC: %{public}@, SupportedRegion: %{public}d, meetsMinAge: %{public}d, prevOnboarded: %{public}d, watchHardwareSupported: %{public}d, watchSoftwareSupported: %{public}d, phoneCapable: %{public}d", buf, 0x56u);

  }
  return v25;
}

- (BOOL)_shouldAdvertiseWithAdvertiseECGVersions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "BOOLValue", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_shouldAdvertiseElectrocardiogramUpgradeForDevice:(id)a3
{
  HKHeartRhythmAvailability *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v3 = self;
  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = -[HKHeartRhythmAvailability _shouldAdvertiseECG2UpgradeWithDevice:](self, "_shouldAdvertiseECG2UpgradeWithDevice:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[HKHeartRhythmAvailability _shouldAdvertiseWithAdvertiseECGVersions:](v3, "_shouldAdvertiseWithAdvertiseECGVersions:", v6);

  return (char)v3;
}

- (BOOL)_shouldAdvertiseECG2UpgradeWithDevice:(id)a3
{
  void *v3;
  char v4;

  -[HKHeartRhythmAvailability _ecg2AvailabilityWithWatchDevice:](self, "_ecg2AvailabilityWithWatchDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "advertiseUpgrade");

  return v4;
}

- (BOOL)_shouldAdvertiseECG2BackgroundDeliveryCompletedWithDevice:(id)a3
{
  void *v3;
  char v4;

  -[HKHeartRhythmAvailability _ecg2AvailabilityWithWatchDevice:](self, "_ecg2AvailabilityWithWatchDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "advertiseUpgradeBackgroundDelivered");

  return v4;
}

- (BOOL)shouldAdvertiseECG2BackgroundDeliveryCompletedForActiveWatch
{
  void *v3;
  BOOL v4;

  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[HKHeartRhythmAvailability _shouldAdvertiseElectrocardiogramUpgradeForDevice:](self, "_shouldAdvertiseElectrocardiogramUpgradeForDevice:", v3);
  else
    v4 = 0;

  return v4;
}

- (unint64_t)electrocardiogramUpgradeBackgroundDeliveryVersionCompletedForActivePhone
{
  void *v3;
  unint64_t v4;
  void *v5;
  char v6;

  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = 1,
        -[HKHeartRhythmAvailability _ecg2AvailabilityWithPhoneDevice:wasUpgradeBackgroundDelivered:](self, "_ecg2AvailabilityWithPhoneDevice:wasUpgradeBackgroundDelivered:", v3, 1), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "advertiseUpgradeBackgroundDelivered"), v5, (v6 & 1) == 0))
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldAdvertiseElectrocardiogramUpgradeBackgroundDeliveryCompletedForActivePhone
{
  return -[HKHeartRhythmAvailability electrocardiogramUpgradeBackgroundDeliveryVersionCompletedForActivePhone](self, "electrocardiogramUpgradeBackgroundDeliveryVersionCompletedForActivePhone") != 0;
}

+ (BOOL)isElectrocardiogramSupportedOnPairedPhone
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(a1, "activePairedDevice");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v7 = objc_msgSend(a1, "_isElectrocardiogramSupportedOnPhone:", v9);
    else
      v7 = 0;
    _HKInitializeLogging();
    v11 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = a1;
      v17 = 2114;
      v18 = v13;
      v19 = 1026;
      v20 = v7;
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v15, 0x1Cu);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"));

  _HKInitializeLogging();
  v8 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = a1;
    v17 = 2114;
    v18 = v10;
    v19 = 1026;
    v20 = v7;
    _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v15, 0x1Cu);

LABEL_9:
  }
  return v7;
}

+ (BOOL)isElectrocardiogramSupportedOnPairedPhoneWithGeolocatedCountryCode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v8, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonEnabledOnActivePhone"));

  }
  else
  {
    objc_msgSend(a1, "activePairedDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v9 = objc_msgSend(a1, "_isElectrocardiogramSupportedOnPhone:geolocatedCountryCode:", v10, v5);
    else
      v9 = 0;
    _HKInitializeLogging();
    v11 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = a1;
      v17 = 2114;
      v18 = v13;
      v19 = 1026;
      v20 = v9;
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> %{public}d", (uint8_t *)&v15, 0x1Cu);

    }
  }

  return v9;
}

+ (BOOL)electrocardiogramSupportedForDevice:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
  v6 = objc_msgSend(v4, "supportsCapability:", v5);

  return v6;
}

+ (BOOL)_isElectrocardiogramSupportedOnPhone:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t NRRawVersionFromString;
  int IsGreaterThanOrEqual;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  getNRDevicePropertySystemVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NRRawVersionFromString = getNRRawVersionFromString(v7);

  IsGreaterThanOrEqual = getNRVersionIsGreaterThanOrEqual(NRRawVersionFromString);
  _HKInitializeLogging();
  v10 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getNRDevicePropertyName();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = a1;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v14;
    v22 = 1026;
    v23 = IsGreaterThanOrEqual;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> %{public}d)", (uint8_t *)&v16, 0x26u);

  }
  return IsGreaterThanOrEqual;
}

+ (BOOL)_isElectrocardiogramSupportedOnPhone:(id)a3 geolocatedCountryCode:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "_isECG2SupportedForCountryCode:andPhoneDevice:", v7, v6) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(a1, "_isECG1SupportedOnCompanionDevice:geolocatedCountryCode:", v6, v7);

  return v8;
}

+ (BOOL)_isECG1SupportedOnCompanionDevice:(id)a3 geolocatedCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t NRRawVersionFromString;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  int IsGreaterThanOrEqual;
  int v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getNRDevicePropertySystemVersion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NRRawVersionFromString = getNRRawVersionFromString(v9);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringForKey:", CFSTR("HKForceIOSVersionKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = a1;
      v35 = 2114;
      v36 = v15;
      v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_19A0E6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"] Forcing iOS product version: %{public}@)", buf, 0x20u);

    }
    v16 = a2;
    v17 = v12;

    v9 = v17;
  }
  else
  {
    v16 = a2;
  }
  v18 = objc_msgSend((id)objc_msgSend(a1, "deviceRegionFeatureSupportedStateProviderForCurrentWatchOSDevice"), "electrocardiogramSupportedOnPhone:iOSVersionString:", v6, v9);
  v19 = HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion(v7, NRRawVersionFromString, 0);

  IsGreaterThanOrEqual = getNRVersionIsGreaterThanOrEqual(NRRawVersionFromString);
  v21 = IsGreaterThanOrEqual;
  if (v19 < 2)
    v22 = IsGreaterThanOrEqual;
  else
    v22 = 0;
  v23 = v18 < 2 && v22;
  _HKInitializeLogging();
  v24 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v19 < 2;
    v31 = v18 < 2;
    v26 = v24;
    NSStringFromSelector(v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    getNRDevicePropertyName();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v34 = a1;
    v35 = 2114;
    v36 = v27;
    v37 = 2114;
    v38 = v29;
    v39 = 1026;
    v40 = v23;
    v41 = 1026;
    v42 = v21;
    v43 = 1026;
    v44 = v31;
    v45 = 1026;
    v46 = v25;
    _os_log_impl(&dword_19A0E6000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@\"%{public}@\"] -> (feature supported: %{public}d, OS supported: %{public}d, region supported: %{public}d, country supported: %{public}d)", buf, 0x38u);

  }
  return v23;
}

+ (BOOL)isElectrocardiogram2SupportedWithCountryCode:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "activePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(a1, "_isECG2SupportedForCountryCode:andWatchDevice:", v4, v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)_isECG1SupportedForCountryCode:(id)a3 watchOSVersion:(unsigned int)a4 isWatchOSSeedBuild:(BOOL)a5
{
  return (unint64_t)HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion(a3, *(uint64_t *)&a4, a5) < 2;
}

+ (BOOL)isECG1SupportedOnlyForCountryCode:(id)a3
{
  id v4;
  char IsAvailableForGeolocatedCountryCode;
  void *v6;
  HKCountrySet *v7;
  BOOL v8;

  v4 = a3;
  IsAvailableForGeolocatedCountryCode = HKElectrocardiogramIsAvailableForGeolocatedCountryCode(v4);
  objc_msgSend(a1, "_ECG2SupportedCountriesOnDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKCountrySet initWithDictionaryRepresentation:provenance:]([HKCountrySet alloc], "initWithDictionaryRepresentation:provenance:", v6, 1);
  v8 = -[HKCountrySet containsCountryCode:](v7, "containsCountryCode:", v4);

  return IsAvailableForGeolocatedCountryCode & !v8;
}

+ (BOOL)_isECG2SupportedForCountryCode:(id)a3 andWatchDevice:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a1, "_ECG2SupportedCountriesOnDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ECG2SupportedCountriesOnDevice:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[HKCountrySet isRegionCodeFound:availabilityWatch:availabilityPhone:](HKCountrySet, "isRegionCodeFound:availabilityWatch:availabilityPhone:", v7, v10, v9);
  _HKInitializeLogging();
  v12 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544642;
    v17 = a1;
    v18 = 2114;
    v19 = v14;
    v20 = 1026;
    v21 = v11;
    v22 = 2114;
    v23 = v7;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Comparator result: %{public}i for country code: %{public}@ with watch availability: %{public}@ phone availability: %{public}@", (uint8_t *)&v16, 0x3Au);

  }
  return v11 == 1;
}

+ (BOOL)_isECG2SupportedForCountryCode:(id)a3 andPhoneDevice:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a1, "_ECG2SupportedCountriesOnDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ECG2SupportedCountriesOnDevice:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[HKCountrySet isRegionCodeFound:availabilityWatch:availabilityPhone:](HKCountrySet, "isRegionCodeFound:availabilityWatch:availabilityPhone:", v7, v9, v10);
  _HKInitializeLogging();
  v12 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544642;
    v17 = a1;
    v18 = 2114;
    v19 = v14;
    v20 = 1026;
    v21 = v11;
    v22 = 2114;
    v23 = v7;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Comparator result: %{public}i for country code: %{public}@ with watch availability: %{public}@ phone availability: %{public}@", (uint8_t *)&v16, 0x3Au);

  }
  return v11 == 1;
}

+ (id)_ECG2SupportedCountriesOnDevice
{
  void *v2;
  void *v3;
  uint64_t v5;

  objc_msgSend(a1, "_availabilityPlistURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  +[HKCountrySet regionsWithPlistAtURL:error:](HKCountrySet, "regionsWithPlistAtURL:error:", v2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_ECG2SupportedCountriesOnDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HKNanoRegistryDeviceUtility electrocardiogramV2AvailableRegionsForDevice:](HKNanoRegistryDeviceUtility, "electrocardiogramV2AvailableRegionsForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _HKInitializeLogging();
    v6 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = a1;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Nil available regions found for paired device %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

+ (id)_availabilityPlistURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingString:", CFSTR("/System/Library/Health/AvailableRegions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("ElectrocardiogramV2Recording"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)electrocardiogramAppInstallStateOnActiveWatch:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  HKHeartRhythmAvailability *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, void *))a3;
  objc_msgSend((id)objc_opt_class(), "activePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HKHeartRhythmAvailability ecgAppAvailability](self, "ecgAppAvailability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appInstallStateOnWatch:completion:", v6, v5);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> No active device", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("No active device"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v7);
  }

}

+ (void)installElectrocardiogramAppOnActiveWatch:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;
  uint64_t v18;
  uint64_t v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  objc_msgSend(a1, "activePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v7 = (void *)getASDSystemAppMetadataClass_softClass;
    v26 = getASDSystemAppMetadataClass_softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getASDSystemAppMetadataClass_softClass)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __getASDSystemAppMetadataClass_block_invoke;
      v21 = &unk_1E37E8690;
      v22 = &v23;
      __getASDSystemAppMetadataClass_block_invoke((uint64_t)&v18);
      v7 = (void *)v24[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v23, 8);
    v10 = (void *)objc_msgSend([v9 alloc], "initWithBundleID:", CFSTR("com.apple.NanoHeartRhythm"));
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v11 = (void *)getASDInstallAppsClass_softClass;
    v26 = getASDInstallAppsClass_softClass;
    if (!getASDInstallAppsClass_softClass)
    {
      v18 = v8;
      v19 = 3221225472;
      v20 = __getASDInstallAppsClass_block_invoke;
      v21 = &unk_1E37E8690;
      v22 = &v23;
      __getASDInstallAppsClass_block_invoke((uint64_t)&v18);
      v11 = (void *)v24[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v23, 8);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke;
    v14[3] = &unk_1E37F48A8;
    v16 = a1;
    v17 = a2;
    v15 = v5;
    objc_msgSend(v12, "installApp:onPairedDevice:withCompletionHandler:", v10, v6, v14);

  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      +[HKHeartRhythmAvailability installElectrocardiogramAppOnActiveWatch:].cold.1((uint64_t)a1, v13, a2);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("No active device"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);
  }

}

void __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void (*v6)(void);
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)HKLogHeartRhythm;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1((uint64_t)a1, v5, (uint64_t)v4);
    v6 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v7 = (const char *)a1[6];
      v9 = v5;
      NSStringFromSelector(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduled installation of ECG app on watch", (uint8_t *)&v11, 0x16u);

    }
    v6 = *(void (**)(void))(a1[4] + 16);
  }
  v6();

}

+ (int64_t)_electrocardiogramRescindedStatusWithDataSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKRemoteFeatureAvailabilityRuleSet *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *log;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  int v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonSeedExpired"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonSeedExpired"));

    if ((v9 & 1) != 0)
    {
      v10 = 2;
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonRemotelyDisabled"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonRemotelyDisabled"));

    if ((v15 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_15;
    }
  }
  else
  {

  }
  v16 = a2;
  objc_msgSend((id)objc_opt_class(), "featureAvailabilityUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v48[0] = CFSTR("DisableElectrocardiogramRecording");
  v48[1] = CFSTR("ExpireElectrocardiogramRecording");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HKRemoteFeatureAvailabilityRuleSet initWithRawValue:dataSource:supportedConditions:]([HKRemoteFeatureAvailabilityRuleSet alloc], "initWithRawValue:dataSource:supportedConditions:", v18, v4, v21);
  -[HKRemoteFeatureAvailabilityRuleSet evaluateAll](v22, "evaluateAll");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DisableElectrocardiogramRecording"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ExpireElectrocardiogramRecording"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  _HKInitializeLogging();
  v28 = (void *)HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    log = v28;
    v29 = (void *)objc_opt_class();
    v37 = v29;
    NSStringFromSelector(v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onboardingCountryCode");
    v31 = v4;
    v32 = v21;
    v33 = v18;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v29;
    v40 = 2114;
    v41 = v30;
    v42 = 2114;
    v43 = v34;
    v44 = 1026;
    v45 = v25;
    v46 = 1026;
    v47 = v27;
    _os_log_impl(&dword_19A0E6000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@ Country: %{public}@] -> Disabled: %{public}d, Expired: %{public}d", buf, 0x2Cu);

    v18 = v33;
    v21 = v32;
    v4 = v31;

  }
  if (v27)
    v10 = 2;
  else
    v10 = v25;

LABEL_15:
  return v10;
}

- (void)_resetElectrocardiogramRescindedStatusCacheWithLock:(BOOL)a3
{
  NSNumber *electrocardiogramRescindedStatusCache;
  NSNumber *v5;

  if (a3)
  {
    os_unfair_lock_lock(&self->_cacheLock);
    electrocardiogramRescindedStatusCache = self->_electrocardiogramRescindedStatusCache;
    self->_electrocardiogramRescindedStatusCache = 0;

    os_unfair_lock_unlock(&self->_cacheLock);
  }
  else
  {
    v5 = self->_electrocardiogramRescindedStatusCache;
    self->_electrocardiogramRescindedStatusCache = 0;

  }
}

- (BOOL)isElectrocardiogramRecordingDisabled
{
  return -[HKHeartRhythmAvailability electrocardiogramRecordingRescindedStatus](self, "electrocardiogramRecordingRescindedStatus") != 0;
}

- (int64_t)electrocardiogramRecordingRescindedStatus
{
  os_unfair_lock_s *p_cacheLock;
  NSNumber *electrocardiogramRescindedStatusCache;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;
  int64_t v8;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  electrocardiogramRescindedStatusCache = self->_electrocardiogramRescindedStatusCache;
  if (!electrocardiogramRescindedStatusCache)
  {
    -[HKHeartRhythmAvailability electrocardiogramOnboardingCountryCode](self, "electrocardiogramOnboardingCountryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource setOnboardingCountryCode:](self->_electrocardiogramAvailabilityDataSource, "setOnboardingCountryCode:", v5);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "_electrocardiogramRescindedStatusWithDataSource:", self->_electrocardiogramAvailabilityDataSource));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_electrocardiogramRescindedStatusCache;
    self->_electrocardiogramRescindedStatusCache = v6;

    electrocardiogramRescindedStatusCache = self->_electrocardiogramRescindedStatusCache;
  }
  v8 = -[NSNumber integerValue](electrocardiogramRescindedStatusCache, "integerValue");
  os_unfair_lock_unlock(p_cacheLock);
  return v8;
}

+ (int64_t)currentElectrocardiogramOnboardingVersion
{
  return +[HKECGOnboardingVersion newestAvailableVersion](HKECGOnboardingVersion, "newestAvailableVersion");
}

- (BOOL)isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HKGlobalDefaultsIsCinnamonOnboardingCompleted"));

    return v7;
  }
  else
  {
    -[HKHeartRhythmAvailability heartRhythmUserDefaults](self, "heartRhythmUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("HKElectrocardiogramOnboardingCompleted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _HKInitializeLogging();
      v11 = (void *)HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (void *)objc_opt_class();
        v14 = v13;
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138544130;
        v19 = v13;
        v20 = 2114;
        v21 = v15;
        v22 = 2114;
        v23 = CFSTR("HKElectrocardiogramOnboardingCompleted");
        v24 = 2114;
        v25 = v10;
        _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@%{public}@] -> %{public}@ (Cached value)", (uint8_t *)&v18, 0x2Au);

      }
      v16 = 1;
    }
    else
    {
      -[HKHeartRhythmAvailability electrocardiogramOnboardingHistoryType:](self, "electrocardiogramOnboardingHistoryType:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "count") > 0;

    }
    return v16;
  }
}

- (id)electrocardiogramOnboardingHistoryType:(int64_t)a3
{
  const char *v3;

  if (a3 == 2)
  {
    -[HKHeartRhythmAvailability _electrocardiogramOnboardingHistoryKnown](self, "_electrocardiogramOnboardingHistoryKnown");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    -[HKHeartRhythmAvailability _electrocardiogramOnboardingHistory](self, "_electrocardiogramOnboardingHistory");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)_electrocardiogramOnboardingHistory
{
  void *v3;
  void *v4;
  void *v5;
  HKHeartRhythmOnboardingHistory *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  HKHeartRhythmOnboardingHistory *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[HKHeartRhythmAvailability keyValueDomain](self, "keyValueDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_onboardingHistoryWithVersionCompletedKey:keyValueDomain:", CFSTR("HKElectrocardiogramOnboardingCompleted"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKHeartRhythmOnboardingHistory initWithDictionary:]([HKHeartRhythmOnboardingHistory alloc], "initWithDictionary:", v5);
  _HKInitializeLogging();
  v7 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[HKHeartRhythmAvailability _electrocardiogramOnboardingHistory]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s] AllHistory: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)_electrocardiogramOnboardingHistoryKnown
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HKHeartRhythmAvailability _electrocardiogramOnboardingHistory](self, "_electrocardiogramOnboardingHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredHistoryByVersion:filterType:", +[HKECGOnboardingVersion newestAvailableVersion](HKECGOnboardingVersion, "newestAvailableVersion"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v4 = HKLogHeartRhythm;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[HKHeartRhythmAvailability _electrocardiogramOnboardingHistoryKnown]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s] KnownHistory: %@", (uint8_t *)&v6, 0x16u);
  }

  return v3;
}

+ (id)electrocardiogramOnboardingHistoryMaxKnownWithKeyValueDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  __CFString *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_onboardingHistoryWithVersionCompletedKey:keyValueDomain:", CFSTR("HKElectrocardiogramOnboardingCompleted"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (!v6)
    goto LABEL_14;
  v7 = v6;
  v8 = *(_QWORD *)v22;
  v9 = 0xFFFFFFFF80000000;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "integerValue");
      if ((unint64_t)v11 < 5 && v11 > v9)
        v9 = v11;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  }
  while (v7);
  if (v9 != 0xFFFFFFFF80000000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = -[__CFString length](v15, "length");
    v17 = &stru_1E37FD4C0;
    if (v16)
      v17 = v15;
    v25 = v14;
    v26 = v17;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = v17;
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_14:
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

+ (id)_onboardingHistoryWithVersionCompletedKey:(id)a3 keyValueDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_onboardingHistoryKeyFromCompletedKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "propertyListValueForKey:error:", v8, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  v11 = v10;
  if (v9 || !v10)
  {
    v22 = 0;
    objc_msgSend(v7, "numberForKey:error:", v6, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    v19 = objc_msgSend(v13, "integerValue");

    if (v14)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
        +[HKHeartRhythmAvailability _onboardingHistoryWithVersionCompletedKey:keyValueDomain:].cold.3();
    }
    v20 = v14;
    objc_msgSend(a1, "_onboardingCountryCodeKeyFromCompletedKey:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v7, "stringForKey:error:", v15, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    if (v17)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
        +[HKHeartRhythmAvailability _onboardingHistoryWithVersionCompletedKey:keyValueDomain:].cold.2();
    }
    objc_msgSend(a1, "_history:addCurrentOnboardingVersionCompletedIfApplicable:countryCode:", v9, v19, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      +[HKHeartRhythmAvailability _onboardingHistoryWithVersionCompletedKey:keyValueDomain:].cold.1();
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v12;
}

+ (id)_history:(id)a3 addCurrentOnboardingVersionCompletedIfApplicable:(int64_t)a4 countryCode:(id)a5
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = (__CFString *)a5;
  v9 = v8;
  v10 = &stru_1E37FD4C0;
  if (v8)
    v10 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7)
    objc_msgSend(v12, "addEntriesFromDictionary:", v7);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v11, v14);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isAtrialFibrillationDetectionSettingEnabled
{
  HKFeatureStatusManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = -[HKFeatureStatusManager initWithFeatureIdentifier:healthStore:countryCodeSource:]([HKFeatureStatusManager alloc], "initWithFeatureIdentifier:healthStore:countryCodeSource:", CFSTR("IrregularRhythmNotifications"), self->_healthStore, 0);
  -[HKFeatureStatusManager featureStatusWithError:](v2, "featureStatusWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onboardingRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberForKey:", CFSTR("Enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isAtrialFibrillationDetectionOnboardingCompleted
{
  HKFeatureStatusManager *v2;
  void *v3;
  char v4;

  v2 = -[HKFeatureStatusManager initWithFeatureIdentifier:healthStore:countryCodeSource:]([HKFeatureStatusManager alloc], "initWithFeatureIdentifier:healthStore:countryCodeSource:", CFSTR("IrregularRhythmNotifications"), self->_healthStore, 0);
  -[HKFeatureStatusManager featureStatusWithError:](v2, "featureStatusWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOnboardingRecordPresent");

  return v4;
}

- (BOOL)shouldAdvertiseAtrialFibrillationDetectionForActiveWatch
{
  HKFeatureStatusManager *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = -[HKFeatureStatusManager initWithFeatureIdentifier:healthStore:countryCodeSource:]([HKFeatureStatusManager alloc], "initWithFeatureIdentifier:healthStore:countryCodeSource:", CFSTR("IrregularRhythmNotifications"), self->_healthStore, 1);
  -[HKFeatureStatusManager featureStatusWithError:](v2, "featureStatusWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OnboardingPromotion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areAllRequirementsSatisfied");

  return v5;
}

- (BOOL)isAtrialFibrillationDetectionDisabled
{
  return -[HKHeartRhythmAvailability atrialFibrillationDetectionRescindedStatus](self, "atrialFibrillationDetectionRescindedStatus") != 0;
}

- (int64_t)atrialFibrillationDetectionRescindedStatus
{
  HKFeatureStatusManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int64_t v10;

  v2 = -[HKFeatureStatusManager initWithFeatureIdentifier:healthStore:countryCodeSource:]([HKFeatureStatusManager alloc], "initWithFeatureIdentifier:healthStore:countryCodeSource:", CFSTR("IrregularRhythmNotifications"), self->_healthStore, 0);
  -[HKFeatureStatusManager featureStatusWithError:](v2, "featureStatusWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isOnboardingRecordPresent"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Usage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SeedIsNotExpired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FeatureIsNotRemotelyDisabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v7)
      v10 = v9 ^ 1u;
    else
      v10 = 2;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDomain, a3);
}

- (NSUserDefaults)heartRhythmUserDefaults
{
  return self->_heartRhythmUserDefaults;
}

- (void)setHeartRhythmUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_heartRhythmUserDefaults, a3);
}

- (HKObserverSet)heartRhythmAvailabilityObservers
{
  return self->_heartRhythmAvailabilityObservers;
}

- (void)setHeartRhythmAvailabilityObservers:(id)a3
{
  objc_storeStrong((id *)&self->_heartRhythmAvailabilityObservers, a3);
}

- (HKActiveWatchRemoteFeatureAvailabilityDataSource)electrocardiogramAvailabilityDataSource
{
  return self->_electrocardiogramAvailabilityDataSource;
}

- (void)setElectrocardiogramAvailabilityDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogramAvailabilityDataSource, a3);
}

- (NSMutableSet)onboardingKeysReadSet
{
  return self->_onboardingKeysReadSet;
}

- (void)setOnboardingKeysReadSet:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingKeysReadSet, a3);
}

- (int)onboardingStateDidChangeNotificationToken
{
  return self->_onboardingStateDidChangeNotificationToken;
}

- (void)setOnboardingStateDidChangeNotificationToken:(int)a3
{
  self->_onboardingStateDidChangeNotificationToken = a3;
}

- (int)featureAvailabilityConditionsDidUpdateNotificationToken
{
  return self->_featureAvailabilityConditionsDidUpdateNotificationToken;
}

- (void)setFeatureAvailabilityConditionsDidUpdateNotificationToken:(int)a3
{
  self->_featureAvailabilityConditionsDidUpdateNotificationToken = a3;
}

- (int)userCharacteristicsDidChangeNotificationToken
{
  return self->_userCharacteristicsDidChangeNotificationToken;
}

- (void)setUserCharacteristicsDidChangeNotificationToken:(int)a3
{
  self->_userCharacteristicsDidChangeNotificationToken = a3;
}

- (void)setMobileCountryCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, a3);
}

- (NSString)currentCountryCode
{
  return self->_currentCountryCode;
}

- (void)setCurrentCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_currentCountryCode, a3);
}

- (HKWatchAppAvailability)ecgAppAvailability
{
  return self->_ecgAppAvailability;
}

- (void)setEcgAppAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_ecgAppAvailability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecgAppAvailability, 0);
  objc_storeStrong((id *)&self->_currentCountryCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, 0);
  objc_storeStrong((id *)&self->_onboardingKeysReadSet, 0);
  objc_storeStrong((id *)&self->_electrocardiogramAvailabilityDataSource, 0);
  objc_storeStrong((id *)&self->_heartRhythmAvailabilityObservers, 0);
  objc_storeStrong((id *)&self->_heartRhythmUserDefaults, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_electrocardiogramRescindedStatusCache, 0);
}

- (void)isHeartAgeGatingEnabledOnWatch:currentDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "[%{public}@.%{public}s] Failed to get date of birth with error: %@");
  OUTLINED_FUNCTION_4_4();
}

- (void)_meetsMinimumAgeRequirementWithMinimumRequiredAge:currentDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "[%{public}@.%{public}s] Failed to get date of birth with error: %@");
  OUTLINED_FUNCTION_4_4();
}

- (void)_getOnboardingVersionForKey:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v1, (uint64_t)v1, "Couldn't read heart rhythm onboarding completion state for key [%@]: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_onboardingHistoryKeyFromCompletedKey:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_3_0(v3);
  OUTLINED_FUNCTION_7_0(&dword_19A0E6000, v5, v6, "[%{public}@ Mapping failed. Unexpected onboarding completion key.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_4();
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "Couldn't set heart rhythm onboarding completion state %ld for key [%@]: %@");
  OUTLINED_FUNCTION_4_4();
}

void __95__HKHeartRhythmAvailability__setOnboardingVersionCompleted_forKey_additionalValues_completion___block_invoke_85_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "Failed to force nano sync to set heart rhythm onboarding completion version %ld for key [%@]: %@");
  OUTLINED_FUNCTION_4_4();
}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "Couldn't set heart rhythm first onboarding completed date %@ for key [%@]: %@");
  OUTLINED_FUNCTION_4_4();
}

void __80__HKHeartRhythmAvailability__setFirstOnboardingCompletedDate_forKey_completion___block_invoke_87_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "Failed to force nano sync to set heart rhythm first onboarding completed date %@ for key [%@]: %@");
  OUTLINED_FUNCTION_4_4();
}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v2, (uint64_t)v2, "Couldn't remove heart rhythm first onboarding completed dates for key [%@]: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __83__HKHeartRhythmAvailability__removeFirstOnboardingCompletedDatesForKey_completion___block_invoke_88_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v2, (uint64_t)v2, "Failed to force nano sync to set heart rhythm first onboarding completed dates for key [%@]: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)electrocardiogramOnboardingCountryCode
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, v1, "[%{public}s] Failed to read onboarding country code: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

- (void)_electrocardiogramFirstOnboardingCompletedDate
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, v1, "[%{public}s] Failed to read first onboarding completed date: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

- (void)isElectrocardiogramAppInstallAllowedForWatch:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyCurrentUserLocale(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKHeartRhythmAvailability.m"), 73, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)installElectrocardiogramAppOnActiveWatch:(const char *)a3 .cold.1(uint64_t a1, void *a2, const char *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v5, v7, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch due to no active device", (uint8_t *)&v8);

}

void __70__HKHeartRhythmAvailability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(const char **)(a1 + 48);
  v6 = a2;
  NSStringFromSelector(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = a3;
  _os_log_error_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch with error: %{public}@", (uint8_t *)&v8, 0x20u);

}

+ (void)_onboardingHistoryWithVersionCompletedKey:keyValueDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, v1, "[%{public}s] Failed to fetch onboarding history: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_onboardingHistoryWithVersionCompletedKey:keyValueDomain:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, v1, "[%{public}s] Failed to fetch country code: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_onboardingHistoryWithVersionCompletedKey:keyValueDomain:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v0, v1, "[%{public}s] Failed to fetch current version: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

@end
