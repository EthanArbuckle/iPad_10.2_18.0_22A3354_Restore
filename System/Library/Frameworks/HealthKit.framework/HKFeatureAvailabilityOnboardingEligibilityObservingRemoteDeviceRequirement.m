@implementation HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v7);
  objc_msgSend(v7, "devicePairingAndSwitchingNotificationDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E37EA350;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v8, "registerObserverForDevicePairingChanges:block:", v6, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (_QWORD *)(a1 + 32);
    v10 = 0;
    objc_msgSend(v6, "isSatisfiedWithDataSource:error:", WeakRetained, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v7)
    {
      objc_msgSend(v3, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v5, objc_msgSend(v7, "BOOLValue"));
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);

    }
  }

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "devicePairingAndSwitchingNotificationDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterObserverForDevicePairingChanges:", v5);

}

void __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error determining satisfaction in response to change in device pairing state: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
