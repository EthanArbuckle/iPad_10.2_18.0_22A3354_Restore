@implementation HDMobilityWalkingSteadinessFeatureStatusManagerServer

- (HDMobilityWalkingSteadinessFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 classificationsFeatureAvailabilityExtension:(id)a7 mobilitySettingsDefaults:(id)a8 featureStatusProvider:(id)a9
{
  id v16;
  id v17;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v18;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v19;
  uint64_t v20;
  OS_dispatch_queue *queue;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v22;
  id v24;
  objc_super v25;

  v24 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HDMobilityWalkingSteadinessFeatureStatusManagerServer;
  v18 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v25, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_classificationsFeatureAvailabilityExtension, a7);
    HKCreateSerialDispatchQueue();
    v20 = objc_claimAutoreleasedReturnValue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v19->_mobilitySettingsDefaults, a8);
    v19->_observing = 0;
    objc_storeStrong((id *)&v19->_featureStatusProvider, a9);
    v22 = v19;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:](self, "_stopObservingChangesAndExpectToBeObserving:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HDMobilityWalkingSteadinessFeatureStatusManagerServer;
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer dealloc](&v3, sel_dealloc);
}

- (void)remote_onboardingStatusWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _getOnboardingStatusWithError:](self, "_getOnboardingStatusWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_notificationStatusWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _getNotificationStatusWithError:](self, "_getNotificationStatusWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_fitnessTrackingEnabledWithCompletion:(id)a3
{
  HKFeatureStatusProviding *featureStatusProvider;
  void (**v4)(id, uint64_t, id);
  void *v5;
  id v6;
  void *v7;
  id v8;

  featureStatusProvider = self->_featureStatusProvider;
  v8 = 0;
  v4 = (void (**)(id, uint64_t, id))a3;
  -[HKFeatureStatusProviding featureStatusWithError:](featureStatusProvider, "featureStatusWithError:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE46D10]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v7, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D18]), v6);

    v4 = (void (**)(id, uint64_t, id))v7;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_fitnessTrackingEnabledWithCompletion:].cold.1();
    v4[2](v4, 0, v6);
  }

}

+ (BOOL)_hasWriteEntitlement:(id)a3 withError:(id *)a4
{
  char v5;
  id v6;

  v5 = objc_msgSend(a3, "hasEntitlement:", *MEMORY[0x24BDD3310]);
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 4, CFSTR("Unauthorized access to modify Walking Steadiness feature status"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError();
    }

  }
  return v5;
}

- (void)remote_setNotificationsEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)objc_opt_class();
  -[HDStandardTaskServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v7, "_hasWriteEntitlement:withError:", v9, &v28);
  v11 = v28;

  if ((v10 & 1) != 0)
  {
    -[NSUserDefaults setBool:forKey:](self->_mobilitySettingsDefaults, "setBool:forKey:", v4, CFSTR("EnableWalkingSteadinessNotifications"));
    -[HDStandardTaskServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureSettingsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDD2EB0];
    v17 = *MEMORY[0x24BDD2EA0];
    v27 = v11;
    v18 = objc_msgSend(v14, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v15, v16, v17, 0, &v27);
    v19 = v27;

    _HKInitializeLogging();
    v20 = *MEMORY[0x24BDD3040];
    v21 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT);
    if ((v18 & 1) != 0)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543362;
        v30 = self;
        _os_log_impl(&dword_2160FB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification defaults written", buf, 0xCu);
      }
      v6[2](v6, 1, 0);
    }
    else
    {
      if (v21)
      {
        v25 = v20;
        v26 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = (HDMobilityWalkingSteadinessFeatureStatusManagerServer *)v26;
        v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_2160FB000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to set feature setting with error: %{public}@", buf, 0x16u);

      }
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v19);
    }
    v11 = v19;
  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v30 = (HDMobilityWalkingSteadinessFeatureStatusManagerServer *)v24;
      v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_2160FB000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unauthorized call to set notifications enabled with error: %{public}@", buf, 0x16u);

    }
    ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v11);
  }

}

- (void)remote_resetOnboardingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id v14;
  HDFeatureAvailabilityExtension *classificationsFeatureAvailabilityExtension;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HDStandardTaskServer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v5, "_hasWriteEntitlement:withError:", v7, &v20);
  v9 = v20;

  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3040];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      v12 = v10;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v22 = (uint64_t)v13;
      v14 = v13;
      _os_log_impl(&dword_2160FB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", buf, 0xCu);

    }
    classificationsFeatureAvailabilityExtension = self->_classificationsFeatureAvailabilityExtension;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke;
    v18[3] = &unk_24D4DFA10;
    v18[4] = self;
    v19 = v4;
    -[HDFeatureAvailabilityExtension resetOnboardingWithCompletion:](classificationsFeatureAvailabilityExtension, "resetOnboardingWithCompletion:", v18);

  }
  else
  {
    if (v11)
    {
      v16 = v10;
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_2160FB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unauthorized call to reset onboarding", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v9);
  }

}

void __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", CFSTR("EnableWalkingSteadinessNotifications"));
    objc_msgSend(*(id *)(a1 + 32), "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "featureSettingsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD2EA0];
    v12 = 0;
    objc_msgSend(v8, "resetFeatureSettingsForFeatureIdentifier:suppressNotificationsToObserver:error:", v9, 0, &v12);
    v10 = v12;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(a1, v11, (uint64_t)v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  int v6;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (self->_observing)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_startObservingChangesWithCompletion:].cold.1();
  }
  else
  {
    self->_observing = 1;
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_2160FB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation of changes", (uint8_t *)&v6, 0xCu);
    }
    -[HKFeatureStatusProviding registerObserver:queue:](self->_featureStatusProvider, "registerObserver:queue:", self, self->_queue);
    v4[2](v4, 1, 0);
  }

}

- (void)remote_stopObservingChanges
{
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:](self, "_stopObservingChangesAndExpectToBeObserving:", 1);
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
    v9 = *MEMORY[0x24BDD3040];
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_fitnessTrackingEnabledWithCompletion:].cold.1();
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
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _getOnboardingStatusWithError:].cold.1();
    }
    v8 = 0;
    goto LABEL_12;
  }
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _determineOnboardingStatusWithFeatureStatus:](self, "_determineOnboardingStatusWithFeatureStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

- (id)_determineOnboardingStatusWithFeatureStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE46D08]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD2C50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE46D10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  if (objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D70]))
  {
    v7 = v5;
    objc_msgSend(v4, "onboardingRecord", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "earliestDateOfAnyOnboardingCompletion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v11 = 1;
    goto LABEL_27;
  }
  v12 = objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D48], v6);
  v13 = (os_log_t *)MEMORY[0x24BDD3040];
  if ((v12 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v14 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_2160FB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking unavailability reason", buf, 0xCu);
    }
    v10 = 1;
  }
  if ((objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2DA8]) & 1) == 0)
  {
    _HKInitializeLogging();
    v15 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_2160FB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Local device cannot support walking steadiness, marking unavailability reason", buf, 0xCu);
    }
    v10 |= 2uLL;
  }
  if ((objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D18]) & 1) == 0)
  {
    _HKInitializeLogging();
    v16 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_2160FB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has motion & fitness disabled, marking onboarding unavailability reason", buf, 0xCu);
    }
    v10 |= 4uLL;
  }
  if ((objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D20]) & 1) != 0)
  {
    if (!v10)
    {
      v7 = v5;
      _HKInitializeLogging();
      v17 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = self;
        _os_log_impl(&dword_2160FB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but no reason why they couldn't onboard", buf, 0xCu);
      }
      v9 = 0;
      v10 = 0;
      v11 = 2;
      goto LABEL_27;
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_2160FB000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking onboarding unavailability reason", buf, 0xCu);
    }
    v10 |= 8uLL;
  }
  v7 = v5;
  _HKInitializeLogging();
  v19 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_2160FB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] User not onboarded but onboarding unavailable", buf, 0xCu);
  }
  v9 = 0;
  v11 = 0;
LABEL_27:
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD2C58]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x24BE46DC0]);
  v22 = objc_msgSend(v20, "areAllRequirementsSatisfied");
  v23 = (void *)objc_msgSend(v21, "initWithState:unavailableReasons:dateOnboarded:shouldOnboardingTileBeAdvertised:isLocaleValidOnLocalDevice:isClassificationAvailable:", v11, v10, v9, v22, objc_msgSend(v20, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2CF8]), objc_msgSend(v27, "areAllRequirementsSatisfied"));

  return v23;
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
    v9 = *MEMORY[0x24BDD3040];
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HDMobilityWalkingSteadinessFeatureStatusManagerServer remote_fitnessTrackingEnabledWithCompletion:].cold.1();
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
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _getOnboardingStatusWithError:].cold.1();
    }
    v8 = 0;
    goto LABEL_12;
  }
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _determineNotificationStatusWithFeatureStatus:](self, "_determineNotificationStatusWithFeatureStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

- (id)_determineNotificationStatusWithFeatureStatus:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  os_log_t *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  os_log_t *v26;
  uint64_t v27;
  uint64_t v28;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  void *v41;
  uint64_t v42;
  uint8_t buf[4];
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE46D10]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE46D20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D18]);
    v11 = *MEMORY[0x24BDD2D60];
    v12 = objc_msgSend(v9, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D60]);
    v13 = objc_msgSend(v8, "areAllRequirementsSatisfied");
    v14 = (os_log_t *)MEMORY[0x24BDD3040];
    if (v13)
    {
      _HKInitializeLogging();
      v15 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = self;
        _os_log_impl(&dword_2160FB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications enabled, sending back enabled notification status", buf, 0xCu);
      }
      v16 = objc_alloc(MEMORY[0x24BE46DB8]);
      v17 = v12 ^ 1u;
      v18 = 1;
      v19 = 0;
      v20 = v10;
    }
    else
    {
      v41 = v9;
      v21 = self;
      objc_msgSend(v8, "unsatisfiedRequirementIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x24BDD2D10];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToArray:", v23);

      if (v24)
      {
        _HKInitializeLogging();
        v25 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v21;
          _os_log_impl(&dword_2160FB000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications disabled but otherwise clear, sending back disabled notification status", buf, 0xCu);
        }
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE46DB8]), "initWithState:unavailableReasons:fitnessTrackingEnabled:healthNotificationsDisabled:", 2, 0, v10, v12 ^ 1u);
        v9 = v41;
        goto LABEL_46;
      }
      v26 = v14;
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D48]) & 1) != 0)
      {
        v27 = 0;
        v28 = v10;
        v29 = v21;
      }
      else
      {
        _HKInitializeLogging();
        v30 = *v14;
        v31 = os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT);
        v28 = v10;
        v29 = v21;
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          v44 = v21;
          _os_log_impl(&dword_2160FB000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] User is age gated, marking notification unavailability reason", buf, 0xCu);
        }
        v27 = 1;
      }
      v9 = v41;
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2CD0]) & 1) == 0)
      {
        _HKInitializeLogging();
        v32 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Age is not present, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 2uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2DA8]) & 1) == 0)
      {
        _HKInitializeLogging();
        v33 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device not capable of walking steadiness, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 4uLL;
      }
      if ((v28 & 1) == 0)
      {
        _HKInitializeLogging();
        v34 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has fitness tracking disabled, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 8uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D20]) & 1) == 0)
      {
        _HKInitializeLogging();
        v35 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has health app hidden, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 0x10uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D30]) & 1) == 0)
      {
        _HKInitializeLogging();
        v36 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] User no longer has any values for Height set, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 0x40uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D78]) & 1) == 0)
      {
        _HKInitializeLogging();
        v37 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has not onboarded, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 0x20uLL;
      }
      if ((objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D70]) & 1) == 0)
      {
        _HKInitializeLogging();
        v38 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v29;
          _os_log_impl(&dword_2160FB000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] User has not onboarded, marking notification unavailability reason", buf, 0xCu);
        }
        v27 |= 0x20uLL;
      }
      v39 = objc_msgSend(v41, "isRequirementSatisfiedWithIdentifier:", v11) ^ 1;
      v16 = objc_alloc(MEMORY[0x24BE46DB8]);
      v18 = 0;
      v19 = v27;
      v20 = v28;
      v17 = v39;
    }
    v7 = (void *)objc_msgSend(v16, "initWithState:unavailableReasons:fitnessTrackingEnabled:healthNotificationsDisabled:", v18, v19, v20, v17);
LABEL_46:

    goto LABEL_47;
  }
  v7 = 0;
LABEL_47:

  return v7;
}

- (void)_stopObservingChangesAndExpectToBeObserving:(BOOL)a3
{
  NSObject *v4;
  int v5;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_observing)
  {
    -[HKFeatureStatusProviding unregisterObserver:](self->_featureStatusProvider, "unregisterObserver:", self);
    self->_observing = 0;
    _HKInitializeLogging();
    v4 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_2160FB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation of changes", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (a3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _stopObservingChangesAndExpectToBeObserving:].cold.1();
  }
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _determineOnboardingStatusWithFeatureStatus:](self, "_determineOnboardingStatusWithFeatureStatus:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _clientRemoteObjectProxy](self, "_clientRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client_didUpdateOnboardingStatus:", v9);

  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _determineNotificationStatusWithFeatureStatus:](self, "_determineNotificationStatusWithFeatureStatus:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMobilityWalkingSteadinessFeatureStatusManagerServer _clientRemoteObjectProxy](self, "_clientRemoteObjectProxy");
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

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HDMobilityWalkingSteadinessFeatureStatusManagerServer *v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileExtensionWithIdentifier:", *MEMORY[0x24BE46D58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "featureAvailabilityExtensionForFeatureIdentifier:", *MEMORY[0x24BDD2EA0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Mobility.notifications"));
  v18 = objc_alloc(MEMORY[0x24BDD3BF8]);
  objc_msgSend(v11, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v16, v19, 1);

  v21 = -[HDMobilityWalkingSteadinessFeatureStatusManagerServer initWithUUID:configuration:client:delegate:classificationsFeatureAvailabilityExtension:mobilitySettingsDefaults:featureStatusProvider:]([HDMobilityWalkingSteadinessFeatureStatusManagerServer alloc], "initWithUUID:configuration:client:delegate:classificationsFeatureAvailabilityExtension:mobilitySettingsDefaults:featureStatusProvider:", v13, v12, v11, v10, v16, v17, v20);
  return v21;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  id v12;

  v7 = a4;
  objc_msgSend(v7, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_hasWriteEntitlement:withError:", v8, 0);

  if ((a1 & 1) != 0
    || (objc_msgSend(v7, "entitlements"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hasEntitlement:", *MEMORY[0x24BDD3258]),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 4, CFSTR("Unauthorized access of Walking Steadiness feature status"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v11 = 0;
  }

  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE46D70];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobilitySettingsDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_storeStrong((id *)&self->_classificationsFeatureAvailabilityExtension, 0);
}

- (void)remote_fitnessTrackingEnabledWithCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Error when retrieving feature status: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __94__HDMobilityWalkingSteadinessFeatureStatusManagerServer_remote_resetOnboardingWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = 138543618;
  v6 = objc_opt_class();
  v7 = 2114;
  v8 = a3;
  _os_log_error_impl(&dword_2160FB000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error resetting onboarding: %{public}@", (uint8_t *)&v5, 0x16u);

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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_2160FB000, v0, v1, "[%{public}@] Asked to start observation of changes but we already started.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2160FB000, v0, v1, "[%{public}@] Nil feature status given without error", v2, v3, v4, v5, v6);
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_2160FB000, v0, v1, "[%{public}@] Asked to stop observation of changes but we are not observing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
