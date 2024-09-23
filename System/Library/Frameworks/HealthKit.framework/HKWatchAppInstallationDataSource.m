@implementation HKWatchAppInstallationDataSource

- (HKWatchAppInstallationDataSource)init
{
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *v3;
  HKWatchAppInstallationDataSource *v4;

  v3 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  v4 = -[HKWatchAppInstallationDataSource initWithDevicePairingAndSwitchingNotificationDataSource:](self, "initWithDevicePairingAndSwitchingNotificationDataSource:", v3);

  return v4;
}

- (HKWatchAppInstallationDataSource)initWithDevicePairingAndSwitchingNotificationDataSource:(id)a3
{
  id v5;
  HKWatchAppInstallationDataSource *v6;
  HKWatchAppInstallationDataSource *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *watchAppInstallationManagersByBundleIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKWatchAppInstallationDataSource;
  v6 = -[HKObserverBridge init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_devicePairingAndSwitchingDataSource, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    watchAppInstallationManagersByBundleIdentifier = v7->_watchAppInstallationManagersByBundleIdentifier;
    v7->_watchAppInstallationManagersByBundleIdentifier = v8;

  }
  return v7;
}

- (void)_populateManagersDictionaryForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __objc2_class **v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if ((v6 & 1) != 0)
  {
    v7 = off_1E37E4D48;
  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCompanionCapable");

    if (!v9)
      goto LABEL_7;
    v7 = off_1E37E4F28;
  }
  v10 = objc_msgSend(objc_alloc(*v7), "initWithBundleIdentifier:", v4);
  if (v10)
  {
    v11 = v10;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchAppInstallationManagersByBundleIdentifier, "setObject:forKeyedSubscript:", v10, v4);
    goto LABEL_9;
  }
LABEL_7:
  _HKInitializeLogging();
  HKLogInfrastructure();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = (id)objc_opt_class();
    v12 = v14;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Device does not support HKWatchAppInstallationManager", (uint8_t *)&v13, 0xCu);

  }
LABEL_9:

}

- (id)watchAppInstallationManagerForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_watchAppInstallationManagersByBundleIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[HKWatchAppInstallationDataSource _populateManagersDictionaryForBundleIdentifier:](self, "_populateManagersDictionaryForBundleIdentifier:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_watchAppInstallationManagersByBundleIdentifier, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6;
  void *v7;
  _HKWatchAppInstallationManagerObserverBridge *v8;
  void *v9;
  char v10;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *devicePairingAndSwitchingDataSource;
  _QWORD v13[4];
  _HKWatchAppInstallationManagerObserverBridge *v14;
  id v15;

  v6 = a4;
  -[HKWatchAppInstallationDataSource watchAppInstallationManagerForBundleIdentifier:](self, "watchAppInstallationManagerForBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_HKWatchAppInstallationManagerObserverBridge initWithHandle:]([_HKWatchAppInstallationManagerObserverBridge alloc], "initWithHandle:", v6);

  objc_msgSend(v7, "registerObserver:", v8);
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAppleWatch");

  if ((v10 & 1) == 0)
  {
    devicePairingAndSwitchingDataSource = self->_devicePairingAndSwitchingDataSource;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__HKWatchAppInstallationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
    v13[3] = &unk_1E37F8488;
    v14 = v8;
    v15 = v7;
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource registerObserverForDevicePairingChanges:block:](devicePairingAndSwitchingDataSource, "registerObserverForDevicePairingChanges:block:", self, v13);

  }
  return v8;
}

uint64_t __80__HKWatchAppInstallationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchAppInstallationManagerDidObserveChange:", *(_QWORD *)(a1 + 40));
}

- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HKWatchAppInstallationDataSource watchAppInstallationManagerForBundleIdentifier:](self, "watchAppInstallationManagerForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v17 = 0;
    objc_msgSend(v7, "isWatchAppInstalledWithError:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
      _HKInitializeLogging();
      HKLogInfrastructure();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v19 = v15;
        v20 = 2114;
        v21 = v6;
        v22 = 2114;
        v23 = v11;
        v16 = v15;
        _os_log_error_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Error retrieving value for watch app installation from data source for %{public}@: %{public}@", buf, 0x20u);

      }
      v12 = 0;
    }
    else
    {
      v12 = v9;
    }

  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AAA0];
  }

  return v12;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HKWatchAppInstallationDataSource watchAppInstallationManagerForBundleIdentifier:](self, "watchAppInstallationManagerForBundleIdentifier:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterObserver:", v6);

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "isAppleWatch");

  if ((v6 & 1) == 0)
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource unregisterObserverForDevicePairingChanges:](self->_devicePairingAndSwitchingDataSource, "unregisterObserverForDevicePairingChanges:", self);

}

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingDataSource
{
  return self->_devicePairingAndSwitchingDataSource;
}

- (NSMutableDictionary)watchAppInstallationManagersByBundleIdentifier
{
  return self->_watchAppInstallationManagersByBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAppInstallationManagersByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_devicePairingAndSwitchingDataSource, 0);
}

@end
