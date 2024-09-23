@implementation _HKWatchAppInstallationManagerObserverBridge

- (_HKWatchAppInstallationManagerObserverBridge)initWithHandle:(id)a3
{
  id v5;
  _HKWatchAppInstallationManagerObserverBridge *v6;
  _HKWatchAppInstallationManagerObserverBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWatchAppInstallationManagerObserverBridge;
  v6 = -[_HKWatchAppInstallationManagerObserverBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (void)watchAppInstallationManagerDidObserveChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  HKObserverBridgeHandle *handle;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = (id)objc_opt_class();
    v6 = v16;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed change in watch app installation, notifying observers", buf, 0xCu);

  }
  v14 = 0;
  objc_msgSend(v4, "isWatchAppInstalledWithError:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v8)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      objc_msgSend(v4, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v8;
      _os_log_error_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Error retrieving value for watch app installation for %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    handle = self->_handle;
    objc_msgSend(v4, "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    -[HKObserverBridgeHandle notifyObserversOfChangeForKey:newValue:](handle, "notifyObserversOfChangeForKey:newValue:", v9, v7);
  }

}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
