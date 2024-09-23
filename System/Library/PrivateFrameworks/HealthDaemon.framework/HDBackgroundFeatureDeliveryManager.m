@implementation HDBackgroundFeatureDeliveryManager

- (HDBackgroundFeatureDeliveryManager)initWithProfile:(id)a3 featureAvailabilityExtension:(id)a4 loggingCategory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HDBackgroundFeatureDeliveryManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "periodicCountryMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDBackgroundFeatureDeliveryManager _initWithProfile:periodicCountryMonitor:featureAvailabilityExtension:deliveryCriteria:settingsProvider:loggingCategory:](self, "_initWithProfile:periodicCountryMonitor:featureAvailabilityExtension:deliveryCriteria:settingsProvider:loggingCategory:", v10, v11, v9, 0, 0, v8);

  return v12;
}

- (HDBackgroundFeatureDeliveryManager)initWithProfile:(id)a3 featureAvailabilityExtension:(id)a4 deliveryCriteria:(id)a5 settingsProvider:(id)a6 loggingCategory:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HDBackgroundFeatureDeliveryManager *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "periodicCountryMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HDBackgroundFeatureDeliveryManager _initWithProfile:periodicCountryMonitor:featureAvailabilityExtension:deliveryCriteria:settingsProvider:loggingCategory:](self, "_initWithProfile:periodicCountryMonitor:featureAvailabilityExtension:deliveryCriteria:settingsProvider:loggingCategory:", v16, v17, v15, v14, v13, v12);

  return v18;
}

- (id)_initWithProfile:(id)a3 periodicCountryMonitor:(id)a4 featureAvailabilityExtension:(id)a5 deliveryCriteria:(id)a6 settingsProvider:(id)a7 loggingCategory:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDBackgroundFeatureDeliveryManager *v18;
  HDBackgroundFeatureDeliveryManager *v19;
  uint64_t v20;
  OS_dispatch_queue *queue;
  HDBackgroundFeatureDeliveryManager *v22;
  id v24;
  id obj;
  objc_super v26;

  obj = a3;
  v14 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v14)
  {
    v26.receiver = self;
    v26.super_class = (Class)HDBackgroundFeatureDeliveryManager;
    v18 = -[HDBackgroundFeatureDeliveryManager init](&v26, sel_init, v24);
    v19 = v18;
    if (v18)
    {
      objc_storeWeak((id *)&v18->_profile, obj);
      objc_storeStrong((id *)&v19->_periodicCountryMonitor, a4);
      objc_storeStrong((id *)&v19->_featureAvailabilityExtension, a5);
      objc_storeStrong((id *)&v19->_featureSpecificDeliveryCriteria, a6);
      objc_storeStrong((id *)&v19->_settingsProvider, a7);
      objc_storeStrong((id *)&v19->_loggingCategory, a8);
      v19->_state = 0;
      -[HDPeriodicCountryMonitor observerQueue](v19->_periodicCountryMonitor, "observerQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      queue = v19->_queue;
      v19->_queue = (OS_dispatch_queue *)v20;

      -[HDPeriodicCountryMonitor registerObserver:](v19->_periodicCountryMonitor, "registerObserver:", v19);
      -[HDFeatureAvailabilityExtension registerObserver:queue:](v19->_featureAvailabilityExtension, "registerObserver:queue:", v19, v19->_queue);
    }
    self = v19;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDFeatureAvailabilityExtension featureIdentifier](self->_featureAvailabilityExtension, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HDKeyValueDomain)_lastCountryAvailabilityVersionDomain
{
  HDKeyValueDomain *v2;
  id WeakRetained;
  HDKeyValueDomain *v4;

  v2 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v2, "initWithCategory:domainName:profile:", 0, CFSTR("HDBackgroundFeatureDeliveryManager_LastCountryAvailabilityVersion"), WeakRetained);

  return v4;
}

- (void)_setLastCountryAvailabilityVersion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = 0;
    v3 = a2;
    -[HDBackgroundFeatureDeliveryManager _lastCountryAvailabilityVersionDomain](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 24), "featureIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "setString:forKey:error:", v3, v5, &v9);

    v7 = v9;
    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      v8 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v11 = a1;
        v12 = 2114;
        v13 = v7;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting last country availability version: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (uint64_t)_queue_isEligibleForDeliveryMonitoringWithError:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v2 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    v4 = *(void **)(v2 + 24);
    v13 = 0;
    objc_msgSend(v4, "onboardedCountryCodeSupportedStateWithError:", &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    if (v5)
    {
      switch(objc_msgSend(v5, "integerValue"))
      {
        case 1:
          _HKInitializeLogging();
          v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 138543362;
          v15 = v2;
          v8 = "[%{public}@] We're not onboarded";
          break;
        case 2:
          _HKInitializeLogging();
          v11 = *(NSObject **)(v2 + 48);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v15 = v2;
            _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] We're already onboarded in a supported state", buf, 0xCu);
          }
          v2 = MEMORY[0x1E0C9AAA0];
          goto LABEL_24;
        case 3:
          _HKInitializeLogging();
          v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 138543362;
          v15 = v2;
          v8 = "[%{public}@] We're onboarded in an unsupported state";
          break;
        case 4:
          _HKInitializeLogging();
          v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 138543362;
          v15 = v2;
          v8 = "[%{public}@] We're onboarded in a disabled state";
          break;
        case 5:
          _HKInitializeLogging();
          v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 138543362;
          v15 = v2;
          v8 = "[%{public}@] We're onboarded in a expired state";
          break;
        default:
          goto LABEL_21;
      }
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_21:
      v2 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      _HKInitializeLogging();
      v9 = *(NSObject **)(v2 + 48);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v2;
        v16 = 2114;
        v17 = v6;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking onboarded state: %{public}@", buf, 0x16u);
      }
      v10 = v6;
      if (v10)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

      v2 = 0;
    }
LABEL_24:

  }
  return v2;
}

- (void)_queue_updatePeriodicCountryMonitorEligibility
{
  NSObject *v2;
  void *v3;
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (*(_QWORD *)(a1 + 64) == 2)
    {
      _HKInitializeLogging();
      v2 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = a1;
        _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Currently saving delivery, skipping registration update", buf, 0xCu);
      }
    }
    else
    {
      v24 = 0;
      -[HDBackgroundFeatureDeliveryManager _queue_isEligibleForDeliveryMonitoringWithError:](a1, &v24);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v24;
      if (v3)
      {
        v5 = objc_msgSend(v3, "BOOLValue");
        _HKInitializeLogging();
        v6 = *(NSObject **)(a1 + 48);
        v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (v7)
          {
            *(_DWORD *)buf = 138543362;
            v28 = a1;
            _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Eligible for delivery monitoring, registering for new country codes", buf, 0xCu);
          }
          *(_QWORD *)(a1 + 64) = 1;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
          v8 = *(void **)(a1 + 24);
          v26 = 0;
          objc_msgSend(v8, "regionAvailabilityWithError:", &v26);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v26;
          objc_msgSend(v9, "version");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            _HKInitializeLogging();
            v12 = *(NSObject **)(a1 + 48);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v21 = v12;
              v22 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v28 = (uint64_t)v22;
              v29 = 2114;
              v30 = v10;
              v23 = v22;
              _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving region availability version: %{public}@", buf, 0x16u);

            }
          }
          v25 = v10;
          -[HDBackgroundFeatureDeliveryManager _lastCountryAvailabilityVersionDomain](a1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 24), "featureIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringForKey:error:", v14, &v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v25;
          if (v15 || !v16)
          {
            if (v15 && objc_msgSend(v11, "isEqualToString:", v15))
            {
              _HKInitializeLogging();
              v19 = *(NSObject **)(a1 + 48);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v28 = a1;
                v29 = 2114;
                v30 = v11;
                _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for immediate background delivery check. Current: %{public}@", buf, 0x16u);
              }
            }
            else
            {
              _HKInitializeLogging();
              v20 = *(NSObject **)(a1 + 48);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v28 = a1;
                v29 = 2114;
                v30 = v15;
                v31 = 2114;
                v32 = v11;
                _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Eligible for immediate background delivery check. Last: %{public}@ Current: %{public}@", buf, 0x20u);
              }
              objc_msgSend(*(id *)(a1 + 16), "enqueueMaintenanceFetch");
            }
          }
          else
          {
            _HKInitializeLogging();
            v17 = *(NSObject **)(a1 + 48);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v28 = a1;
              v29 = 2114;
              v30 = v16;
              _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving last country availability version: %{public}@. Skipping immediate background check", buf, 0x16u);
            }
          }

        }
        else
        {
          if (v7)
          {
            *(_DWORD *)buf = 138543362;
            v28 = a1;
            _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery monitoring, unregistering for new country codes", buf, 0xCu);
          }
          *(_QWORD *)(a1 + 64) = 4;
        }
      }
      else
      {
        _HKInitializeLogging();
        v18 = *(NSObject **)(a1 + 48);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v28 = a1;
          v29 = 2114;
          v30 = v4;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining eligibility: %{public}@; skipping registration update",
            buf,
            0x16u);
        }
      }

    }
  }
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  NSObject *loggingCategory;
  int v5;
  HDBackgroundFeatureDeliveryManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received update of onboarding completion, updating registration status", (uint8_t *)&v5, 0xCu);
  }
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  NSObject *loggingCategory;
  int v5;
  HDBackgroundFeatureDeliveryManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received region availability update notification, updating registration status", (uint8_t *)&v5, 0xCu);
  }
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  NSObject *loggingCategory;
  int v5;
  HDBackgroundFeatureDeliveryManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received update of paired device availability, updating registration status", (uint8_t *)&v5, 0xCu);
  }
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
}

- (BOOL)isEligibleForFetchByPeriodicCountryMonitor:(id)a3
{
  NSObject *loggingCategory;
  int64_t state;
  int v7;
  HDBackgroundFeatureDeliveryManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking eligibility", (uint8_t *)&v7, 0xCu);
  }
  state = self->_state;
  if (!state)
  {
    -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
    state = self->_state;
  }
  return state == 1;
}

- (void)periodicCountryMonitor:(id)a3 didFetchISOCountryCode:(id)a4 countryCodeProvenance:(int64_t)a5
{
  id v7;
  NSObject *loggingCategory;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  HDFeatureAvailabilityExtension *featureAvailabilityExtension;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  __CFString *v26;
  HDBackgroundFeatureDeliveryCriteriaProviding *featureSpecificDeliveryCriteria;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  __CFString *v37;
  HDBackgroundFeatureDeliveryManager *v38;
  void *v39;
  int64_t v40;
  __CFString *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  id v55;
  uint64_t v56;
  void *v57;
  __CFString *v58;
  id v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  HDFeatureAvailabilityExtension *v75;
  void *v76;
  void *v77;
  void *v79;
  _QWORD v80[5];
  id v81;
  id v82;
  int64_t v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[2];
  uint8_t buf[4];
  HDBackgroundFeatureDeliveryManager *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v90 = self;
    v91 = 2114;
    v92 = v7;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received new country code: %{public}@", buf, 0x16u);
  }
  v9 = (void *)MEMORY[0x1E0CB66D8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6738]), "initWithCountryCode:", v7);
  objc_msgSend(v9, "dataSourceWithHealthDataSource:currentCountryCodeProvider:", WeakRetained, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB66B8];
  v14 = *MEMORY[0x1E0CB4E40];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB4E40]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "onlySomeContexts:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)v16;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6730]), "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:", self->_featureAvailabilityExtension, v12, v16);
  v87 = 0;
  objc_msgSend(v18, "featureStatusWithError:", &v87);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v87;
  v79 = (void *)v19;
  if (!v19)
  {
    _HKInitializeLogging();
    v35 = self->_loggingCategory;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v90 = self;
      v91 = 2114;
      v92 = v20;
      _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Error evaluating feature status: %{public}@", buf, 0x16u);
    }
    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v20, "domain");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "code"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%@_%@"), v28, v25);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v37 = CFSTR("feature_status");
    v38 = self;
    v39 = v7;
    v40 = a5;
    v41 = v26;
    goto LABEL_19;
  }
  v77 = v18;
  featureAvailabilityExtension = self->_featureAvailabilityExtension;
  v86 = v20;
  -[HDFeatureAvailabilityExtension regionAvailabilityWithError:](featureAvailabilityExtension, "regionAvailabilityWithError:", &v86);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v86;

  objc_msgSend(v22, "version");
  v24 = objc_claimAutoreleasedReturnValue();

  v76 = (void *)v24;
  if (!v24)
  {
    _HKInitializeLogging();
    v42 = self->_loggingCategory;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v90 = self;
      v91 = 2114;
      v92 = v23;
      _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "[%{public}@] Error accessing region availability: %{public}@", buf, 0x16u);
    }
    v43 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v23, "domain");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "code"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%@_%@"), v25, v26);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, CFSTR("error"), CFSTR("availability_version"), v44);

    v28 = 0;
    v20 = v23;
    goto LABEL_23;
  }
  if ((objc_msgSend(v79, "includesContext:", v14) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDBackgroundFeatureDeliveryManager.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[featureStatus includesContext:HKFeatureAvailabilityContextBackgroundDelivery]"));

  }
  objc_msgSend(v79, "objectForKeyedSubscript:", v14);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "areAllRequirementsSatisfied") & 1) == 0)
  {
    v72 = v17;
    _HKInitializeLogging();
    v45 = self->_loggingCategory;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      objc_msgSend(v25, "unsatisfiedRequirementIdentifiersDescription");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v90 = self;
      v91 = 2114;
      v92 = v7;
      v93 = 2114;
      v94 = v47;
      _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery in %{public}@, unsatisfied requirements: %{public}@", buf, 0x20u);

    }
    v74 = v12;
    v48 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v25, "unsatisfiedRequirementIdentifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setWithArray:", v49);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = *MEMORY[0x1E0CB4F40];
    v88[0] = *MEMORY[0x1E0CB4F48];
    v88[1] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[__CFString isSubsetOfSet:](v26, "isSubsetOfSet:", v53);

    if (v54)
      -[HDBackgroundFeatureDeliveryManager _setLastCountryAvailabilityVersion:]((uint64_t)self, v76);
    v25 = v25;
    v55 = v7;
    objc_msgSend(v25, "highestPriorityUnsatisfiedRequirement");
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v56;
    if (v56)
      v58 = (__CFString *)v56;
    else
      v58 = CFSTR("unexpected_requirements");
    objc_msgSend(v25, "unsatisfiedRequirementIdentifiers");
    v59 = v7;
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "componentsJoinedByString:", CFSTR(","));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v55, a5, CFSTR("error"), v58, v61);

    v7 = v59;
    v20 = v23;
    v17 = v72;
    v12 = v74;
    goto LABEL_35;
  }
  v85 = v23;
  -[HDBackgroundFeatureDeliveryManager _queue_isEligibleForDeliveryMonitoringWithError:]((uint64_t)self, &v85);
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v85;

  v18 = v77;
  if (!v26)
  {
    _HKInitializeLogging();
    v62 = self->_loggingCategory;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v90 = self;
      v91 = 2114;
      v92 = v20;
      v93 = 2114;
      v94 = v7;
      _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining eligibility: %{public}@; ignoring new country code: %{public}@",
        buf,
        0x20u);
    }
    v63 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v20, "domain");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "code"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringWithFormat:", CFSTR("%@_%@"), v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, CFSTR("error"), CFSTR("eligibility"), v66);

    v26 = 0;
    goto LABEL_35;
  }
  if ((-[__CFString BOOLValue](v26, "BOOLValue") & 1) == 0)
  {
    _HKInitializeLogging();
    v67 = self->_loggingCategory;
    v28 = v76;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v90 = self;
      v91 = 2114;
      v92 = v7;
      _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery; ignoring new country code: %{public}@",
        buf,
        0x16u);
    }
    v37 = CFSTR("eligibility");
    v41 = CFSTR("already_onboarded");
    v38 = self;
    v39 = v7;
    v40 = a5;
LABEL_19:
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)v38, v39, v40, CFSTR("error"), v37, v41);
    goto LABEL_36;
  }
  featureSpecificDeliveryCriteria = self->_featureSpecificDeliveryCriteria;
  v28 = v76;
  if (!featureSpecificDeliveryCriteria)
  {
LABEL_44:
    _HKInitializeLogging();
    v69 = self->_loggingCategory;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = self;
      _os_log_impl(&dword_1B7802000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving delivery", buf, 0xCu);
    }
    self->_state = 2;
    -[HDBackgroundFeatureDeliverySettingsProviding featureSettingsUponBackgroundDelivery](self->_settingsProvider, "featureSettingsUponBackgroundDelivery");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = self->_featureAvailabilityExtension;
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke;
    v80[3] = &unk_1E6CF8AF0;
    v80[4] = self;
    v81 = v7;
    v83 = a5;
    v28 = v76;
    v82 = v28;
    -[HDFeatureAvailabilityExtension setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](v75, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v81, a5, 0, v70, v80);

LABEL_23:
    v18 = v77;
    goto LABEL_36;
  }
  v84 = v20;
  v29 = -[HDBackgroundFeatureDeliveryCriteriaProviding isBackgroundDeliverySupportedWithError:](featureSpecificDeliveryCriteria, "isBackgroundDeliverySupportedWithError:", &v84);
  v73 = v84;

  if (v29 != 2)
  {
    if (!v29)
    {
      _HKInitializeLogging();
      v30 = self->_loggingCategory;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v90 = self;
        v91 = 2114;
        v92 = v73;
        v93 = 2114;
        v94 = v7;
        _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Error evaluating background delivery criteria: %{public}@; ignoring new country code: %{public}@",
          buf,
          0x20u);
      }
      v31 = (void *)MEMORY[0x1E0CB3940];
      v20 = v73;
      objc_msgSend(v73, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v73, "code"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@_%@"), v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, CFSTR("error"), CFSTR("legacy_criteria"), v34);

LABEL_35:
      v28 = v76;
      v18 = v77;
      goto LABEL_36;
    }
    v20 = v73;
    goto LABEL_44;
  }
  _HKInitializeLogging();
  v68 = self->_loggingCategory;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v90 = self;
    v91 = 2114;
    v92 = v7;
    _os_log_impl(&dword_1B7802000, v68, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery; ignoring new country code: %{public}@",
      buf,
      0x16u);
  }
  -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, CFSTR("error"), CFSTR("legacy_criteria"), CFSTR("unsupported"));
  v20 = v73;
LABEL_36:

}

void __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:](v6, *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), CFSTR("delivery"), 0, 0);
  }
  else
  {
    _HKInitializeLogging();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2114;
      v22 = v5;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error saving delivery: %{public}@", buf, 0x16u);
      v7 = *(_QWORD *)(a1 + 32);
    }
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:](v7, v9, v10, CFSTR("error"), CFSTR("save"), v14);

  }
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(NSObject **)(v15 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke_218;
  block[3] = &unk_1E6CE8080;
  block[4] = v15;
  v18 = *(id *)(a1 + 48);
  dispatch_async(v16, block);

}

void __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke_218(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 3;
  -[HDBackgroundFeatureDeliveryManager _setLastCountryAvailabilityVersion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility](*(_QWORD *)(a1 + 32));
}

- (void)_reportAnalyticsEventForCountryCode:(uint64_t)a3 countryCodeProvenance:(void *)a4 eventType:(void *)a5 errorCategory:(void *)a6 errorDetail:
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  if (a1)
  {
    v26[0] = a4;
    v25[0] = CFSTR("eventType");
    v25[1] = CFSTR("featureIdentifier");
    v11 = *(void **)(a1 + 24);
    v12 = a6;
    v13 = a5;
    v14 = a4;
    objc_msgSend(v11, "featureIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v15;
    v25[2] = CFSTR("provenance");
    NSStringFromHKOnboardingCompletionCountryCodeProvenance();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("errorCategory"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("errorDetail"));

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "daemon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "OTAFeatureAvailabilityManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "factorPackID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("OTAFactorPackID"));

    v23 = HKImproveHealthAndActivityAnalyticsAllowed();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("isImproveHealthAndActivityAllowed"));
    if ((_DWORD)v23)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("countryCode"));
    AnalyticsSendEvent();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_settingsProvider, 0);
  objc_storeStrong((id *)&self->_featureSpecificDeliveryCriteria, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityExtension, 0);
  objc_storeStrong((id *)&self->_periodicCountryMonitor, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
