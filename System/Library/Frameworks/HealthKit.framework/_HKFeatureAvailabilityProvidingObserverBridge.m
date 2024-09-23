@implementation _HKFeatureAvailabilityProvidingObserverBridge

- (_HKFeatureAvailabilityProvidingObserverBridge)initWithHandle:(id)a3
{
  id v5;
  _HKFeatureAvailabilityProvidingObserverBridge *v6;
  _HKFeatureAvailabilityProvidingObserverBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKFeatureAvailabilityProvidingObserverBridge;
  v6 = -[_HKFeatureAvailabilityProvidingObserverBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (void)_notifyObserversWithFeatureAvailabilityProviding:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HKObserverBridgeHandle *handle;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  objc_msgSend(v4, "featureOnboardingRecordWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    handle = self->_handle;
    objc_msgSend(v4, "featureIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    -[HKObserverBridgeHandle notifyObserversOfChangeForKey:newValue:](handle, "notifyObserversOfChangeForKey:newValue:", v8, v5);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      objc_msgSend(v4, "featureIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Error retrieving onboarding record for %{public}@: %{public}@", buf, 0x20u);

    }
  }

}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "featureIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed setting update for %{public}@, notifying observers", (uint8_t *)&v9, 0x16u);

  }
  -[_HKFeatureAvailabilityProvidingObserverBridge _notifyObserversWithFeatureAvailabilityProviding:](self, "_notifyObserversWithFeatureAvailabilityProviding:", v4);

}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "featureIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed onboarding completion update for %{public}@, notifying observers", (uint8_t *)&v9, 0x16u);

  }
  -[_HKFeatureAvailabilityProvidingObserverBridge _notifyObserversWithFeatureAvailabilityProviding:](self, "_notifyObserversWithFeatureAvailabilityProviding:", v4);

}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "featureIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed paired device capability update for %{public}@, notifying observers", (uint8_t *)&v9, 0x16u);

  }
  -[_HKFeatureAvailabilityProvidingObserverBridge _notifyObserversWithFeatureAvailabilityProviding:](self, "_notifyObserversWithFeatureAvailabilityProviding:", v4);

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
