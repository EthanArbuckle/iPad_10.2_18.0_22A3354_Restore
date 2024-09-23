@implementation HDHRCardioFitnessFeatureStatusManagerServer

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)remote_onboardingStatusWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:](self, "_getOnboardingStatusWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)_getOnboardingStatusWithError:(id *)a3
{
  HKFeatureStatusProviding *featureStatusProvider;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  featureStatusProvider = self->_featureStatusProvider;
  v11 = 0;
  -[HKFeatureStatusProviding featureStatusWithError:](featureStatusProvider, "featureStatusWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (!v6)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E8];
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:].cold.2();
      if (a3)
      {
        v8 = 0;
        *a3 = objc_retainAutorelease(v7);
        goto LABEL_12;
      }
      _HKLogDroppedError();
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:].cold.1();
    }
    v8 = 0;
    goto LABEL_12;
  }
  -[HDHRCardioFitnessFeatureStatusManagerServer _determineOnboardingStatusWithFeatureStatus:](self, "_determineOnboardingStatusWithFeatureStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HDHRCardioFitnessFeatureStatusManagerServer *v21;
  id v22;
  void *v23;
  HDHRCardioFitnessFeatureStatusManagerServer *v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB5000];
  objc_msgSend(v15, "featureAvailabilityProvidingForFeatureIdentifier:", *MEMORY[0x1E0CB5000]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("No profile extension providing feature availability for %@"), v16);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v25;
    if (v25)
    {
      if (a7)
      {
        v22 = objc_retainAutorelease(v25);
        v24 = 0;
        *a7 = v22;
        v20 = v22;
        goto LABEL_8;
      }
      _HKLogDroppedError();
    }
    v24 = 0;
    v20 = v22;
    goto LABEL_8;
  }
  v18 = objc_alloc(MEMORY[0x1E0CB6730]);
  objc_msgSend(v13, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v17, v19, 1);

  v21 = [HDHRCardioFitnessFeatureStatusManagerServer alloc];
  objc_msgSend(v13, "profile");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "featureSettingsManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HDHRCardioFitnessFeatureStatusManagerServer initWithUUID:configuration:client:delegate:featureAvailabilityProvider:featureStatusProvider:featureSettingsManager:](v21, "initWithUUID:configuration:client:delegate:featureAvailabilityProvider:featureStatusProvider:featureSettingsManager:", v11, v12, v13, v14, v17, v20, v23);

LABEL_8:
  return v24;
}

- (HDHRCardioFitnessFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 featureAvailabilityProvider:(id)a7 featureStatusProvider:(id)a8 featureSettingsManager:(id)a9
{
  id v16;
  id v17;
  HDHRCardioFitnessFeatureStatusManagerServer *v18;
  HDHRCardioFitnessFeatureStatusManagerServer *v19;
  uint64_t v20;
  OS_dispatch_queue *queue;
  id v23;
  objc_super v24;

  v23 = a7;
  v16 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HDHRCardioFitnessFeatureStatusManagerServer;
  v18 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v24, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_featureAvailabilityProvider, a7);
    HKCreateSerialDispatchQueue();
    v20 = objc_claimAutoreleasedReturnValue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v19->_featureStatusProvider, a8);
    objc_storeStrong((id *)&v19->_featureSettingsManager, a9);
    v19->_observing = 0;
    v19->_lock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[HDHRCardioFitnessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:](self, "_stopObservingChangesAndExpectToBeObserving:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HDHRCardioFitnessFeatureStatusManagerServer;
  -[HDHRCardioFitnessFeatureStatusManagerServer dealloc](&v3, sel_dealloc);
}

- (id)_determineOnboardingStatusWithFeatureStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  char v21;
  os_log_t *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  int v37;
  HDHRCardioFitnessFeatureStatusManagerServer *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D2FA08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "areAllRequirementsSatisfied"))
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138543362;
      v38 = self;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Classification context satisfied, reporting back clean onboarding status", (uint8_t *)&v37, 0xCu);
    }
    v7 = objc_alloc(MEMORY[0x1E0D2FBF0]);
    objc_msgSend(v4, "onboardingRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "earliestDateOfAnyOnboardingCompletion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11 = 1;
    v12 = 0;
    v13 = v9;
    v14 = 0;
    v15 = 1;
    v16 = 1;
  }
  else
  {
    v17 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FA8]);
    v18 = (_QWORD *)MEMORY[0x1E0CB4F38];
    if (v17 && objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F38]))
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138543362;
        v38 = self;
        _os_log_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has valid onboarding but their age is either present or gated", (uint8_t *)&v37, 0xCu);
      }
      v20 = objc_alloc(MEMORY[0x1E0D2FBF0]);
      objc_msgSend(v4, "onboardingRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "earliestDateOfAnyOnboardingCompletion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20;
      v11 = 1;
      v12 = 0;
      v13 = v9;
      v14 = 0;
      v15 = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E70]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F80]);
      v22 = (os_log_t *)MEMORY[0x1E0CB52E8];
      if ((v21 & 1) != 0)
      {
        v23 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v24 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 = 1;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F28]) & 1) == 0)
      {
        _HKInitializeLogging();
        v25 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 2uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F70]) & 1) == 0)
      {
        _HKInitializeLogging();
        v26 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate disabled, marking onboarding unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 4uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F68]) & 1) == 0)
      {
        _HKInitializeLogging();
        v27 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking onboarding unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 8uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FC8]) & 1) == 0)
      {
        _HKInitializeLogging();
        v28 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate app uninstalled, marking onboarding unavailability reason", (uint8_t *)&v37, 0xCu);
        }
        v23 |= 0x10uLL;
      }
      v29 = objc_msgSend(v8, "areAllRequirementsSatisfied");
      _HKInitializeLogging();
      v30 = *v22;
      v31 = os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v31)
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but no reason why they couldn't onboard", (uint8_t *)&v37, 0xCu);
        }
        v32 = 2;
      }
      else
      {
        if (v31)
        {
          v37 = 138543362;
          v38 = self;
          _os_log_impl(&dword_1CC29C000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but onboarding unavailable", (uint8_t *)&v37, 0xCu);
        }
        v32 = 0;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E88]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc(MEMORY[0x1E0D2FBF0]);
      v34 = objc_msgSend(v9, "areAllRequirementsSatisfied");
      v15 = objc_msgSend(v9, "isRequirementSatisfiedWithIdentifier:", *v18);
      v10 = v33;
      v11 = v32;
      v12 = v23;
      v13 = 0;
      v14 = v34;
    }
    v16 = 0;
  }
  v35 = (void *)objc_msgSend(v10, "initWithState:unavailableReasons:dateOnboarded:shouldOnboardingTileBeAdvertised:isLocaleValidOnLocalDevice:isClassificationAvailable:", v11, v12, v13, v14, v15, v16);

  return v35;
}

- (void)remote_notificationStatusWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRCardioFitnessFeatureStatusManagerServer _getNotificationStatusWithError:](self, "_getNotificationStatusWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)_getNotificationStatusWithError:(id *)a3
{
  HKFeatureStatusProviding *featureStatusProvider;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  featureStatusProvider = self->_featureStatusProvider;
  v11 = 0;
  -[HKFeatureStatusProviding featureStatusWithError:](featureStatusProvider, "featureStatusWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (!v6)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E8];
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:].cold.2();
      if (a3)
      {
        v8 = 0;
        *a3 = objc_retainAutorelease(v7);
        goto LABEL_12;
      }
      _HKLogDroppedError();
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[HDHRCardioFitnessFeatureStatusManagerServer _getOnboardingStatusWithError:].cold.1();
    }
    v8 = 0;
    goto LABEL_12;
  }
  -[HDHRCardioFitnessFeatureStatusManagerServer _determineNotificationStatusWithFeatureStatus:](self, "_determineNotificationStatusWithFeatureStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

- (id)_determineNotificationStatusWithFeatureStatus:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  os_log_t *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v31;
  uint8_t buf[4];
  HDHRCardioFitnessFeatureStatusManagerServer *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D2FA18];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D2FA10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FD0]);
  v9 = objc_msgSend(v6, "areAllRequirementsSatisfied");
  v10 = (os_log_t *)MEMORY[0x1E0CB52E8];
  if (v9)
  {
    _HKInitializeLogging();
    v11 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications enabled, sending back enabled notification status", buf, 0xCu);
    }
    v12 = objc_alloc(MEMORY[0x1E0D2FBE8]);
    v13 = 1;
LABEL_9:
    v18 = 0;
    goto LABEL_49;
  }
  objc_msgSend(v6, "unsatisfiedRequirementIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0CB4F58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToArray:", v15);

  if (v16)
  {
    _HKInitializeLogging();
    v17 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications disabled but otherwise clear, sending back disabled notification status", buf, 0xCu);
    }
    v12 = objc_alloc(MEMORY[0x1E0D2FBE8]);
    v13 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F80]) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v20 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", buf, 0xCu);
    }
    v19 = 1;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F18]) & 1) == 0)
  {
    _HKInitializeLogging();
    v21 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Age is not present, marking unavailability reason", buf, 0xCu);
    }
    v19 |= 2uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F28]) & 1) == 0)
  {
    _HKInitializeLogging();
    v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Active paired device not supported, marking unavailability reason", buf, 0xCu);
    }
    v19 |= 4uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F70]) & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate disabled, marking unavailability reason", buf, 0xCu);
    }
    v19 |= 0x10uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F68]) & 1) == 0)
  {
    _HKInitializeLogging();
    v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x20uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FC8]) & 1) == 0)
  {
    _HKInitializeLogging();
    v25 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has heart rate app uninstalled, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x100uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F98]) & 1) == 0)
  {
    _HKInitializeLogging();
    v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] User needs to confirm medication details, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x80uLL;
  }
  if (!objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F30])
    || (objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F38]) & 1) == 0)
  {
    _HKInitializeLogging();
    v27 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cardio Fitness not allowed for region in on either local or remote device, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 8uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FA8]) & 1) == 0)
  {
    _HKInitializeLogging();
    v28 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1CC29C000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has not onboarded, marking notification unavailability reason", buf, 0xCu);
    }
    v19 |= 0x40uLL;
  }
  v12 = objc_alloc(MEMORY[0x1E0D2FBE8]);
  v13 = 0;
  v18 = v19;
LABEL_49:
  v29 = (void *)objc_msgSend(v12, "initWithState:unavailableReasons:wristDetectEnabled:", v13, v18, v8);

  return v29;
}

- (void)remote_setNotificationsEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  HKFeatureAvailabilityProviding *featureAvailabilityProvider;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  featureAvailabilityProvider = self->_featureAvailabilityProvider;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB50C8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke;
  v11[3] = &unk_1E87F0288;
  objc_copyWeak(&v13, &location);
  v10 = v6;
  v12 = v10;
  -[HKFeatureAvailabilityProviding setFeatureSettingNumber:forKey:completion:](featureAvailabilityProvider, "setFeatureSettingNumber:forKey:completion:", v8, v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = (void *)WeakRetained[5];
    v8 = *MEMORY[0x1E0D2F9F0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_190;
    v10[3] = &unk_1E87F0288;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v7, "setFeatureSettingNumber:forKey:completion:", MEMORY[0x1E0C9AAB0], v8, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_cold_1(a1, v9, (uint64_t)v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_190(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_190_cold_1(a1, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)remote_resetOnboardingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKFeatureAvailabilityProviding *featureAvailabilityProvider;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", buf, 0xCu);

  }
  featureAvailabilityProvider = self->_featureAvailabilityProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke;
  v10[3] = &unk_1E87EF6C8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HKFeatureAvailabilityProviding resetOnboardingWithCompletion:](featureAvailabilityProvider, "resetOnboardingWithCompletion:", v10);

}

void __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v7 = *MEMORY[0x1E0CB5000];
    v10 = v5;
    objc_msgSend(v6, "resetFeatureSettingsForFeatureIdentifier:suppressNotificationsToObserver:error:", v7, 0, &v10);
    v8 = v10;

    (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8 == 0, v8);
    v5 = v8;
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(a1, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  int v6;
  HDHRCardioFitnessFeatureStatusManagerServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_observing)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHRCardioFitnessFeatureStatusManagerServer remote_startObservingChangesWithCompletion:].cold.1();
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_observing = 1;
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation of changes", (uint8_t *)&v6, 0xCu);
    }
    -[HKFeatureStatusProviding registerObserver:queue:](self->_featureStatusProvider, "registerObserver:queue:", self, self->_queue);
    os_unfair_lock_unlock(&self->_lock);
    v4[2](v4, 1, 0);
  }

}

- (void)remote_stopObservingChanges
{
  -[HDHRCardioFitnessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:](self, "_stopObservingChangesAndExpectToBeObserving:", 1);
}

- (void)_stopObservingChangesAndExpectToBeObserving:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_observing)
  {
    self->_observing = 0;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
      -[HDHRCardioFitnessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:].cold.2();
    -[HKFeatureStatusProviding unregisterObserver:](self->_featureStatusProvider, "unregisterObserver:", self);
  }
  else if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHRCardioFitnessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:].cold.1();
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[HDHRCardioFitnessFeatureStatusManagerServer _determineOnboardingStatusWithFeatureStatus:](self, "_determineOnboardingStatusWithFeatureStatus:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHRCardioFitnessFeatureStatusManagerServer _clientRemoteObjectProxy](self, "_clientRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client_didUpdateOnboardingStatus:", v9);

  -[HDHRCardioFitnessFeatureStatusManagerServer _determineNotificationStatusWithFeatureStatus:](self, "_determineNotificationStatusWithFeatureStatus:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHRCardioFitnessFeatureStatusManagerServer _clientRemoteObjectProxy](self, "_clientRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "client_didUpdateNotificationStatus:", v7);

}

- (id)_clientRemoteObjectProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[HDStandardTaskServer client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0D2FBE0], "taskIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSettingsManager, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
}

- (void)_getOnboardingStatusWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_1CC29C000, v0, v1, "[%{public}@] Nil feature status given without error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getOnboardingStatusWithError:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v0, (uint64_t)v0, "[%{public}@] Error when retrieving feature status: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v9 = 138543618;
  v10 = (id)objc_opt_class();
  v11 = 2114;
  v12 = a3;
  v7 = v10;
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v5, v8, "[%{public}@] Error when setting enablement key: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_2_0();
}

void __93__HDHRCardioFitnessFeatureStatusManagerServer_remote_setNotificationsEnabled_withCompletion___block_invoke_190_cold_1(uint64_t a1, void *a2)
{
  id *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_opt_class();
  v6 = OUTLINED_FUNCTION_0_0(v5);
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v3, v7, "[%{public}@] Error when setting notification details entered key: %{public}@", v8);

  OUTLINED_FUNCTION_2_0();
}

void __84__HDHRCardioFitnessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v2, v5, "[%{public}@] Error resetting onboarding: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)remote_startObservingChangesWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, v0, v1, "[%{public}@] Asked to start observation of changes but we already started.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stopObservingChangesAndExpectToBeObserving:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, v0, v1, "[%{public}@] Asked to stop observation of changes but we are not observing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stopObservingChangesAndExpectToBeObserving:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_1CC29C000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Stopping observation of changes", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
