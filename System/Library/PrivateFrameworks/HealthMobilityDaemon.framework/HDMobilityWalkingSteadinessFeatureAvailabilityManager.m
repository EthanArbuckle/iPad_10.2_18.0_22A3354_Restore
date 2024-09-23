@implementation HDMobilityWalkingSteadinessFeatureAvailabilityManager

- (HDMobilityWalkingSteadinessFeatureAvailabilityManager)initWithProfile:(id)a3 regionAvailabilityProvider:(id)a4
{
  id v6;
  id v7;
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v8;
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  HDFeatureAvailabilityManager *manager;
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDMobilityWalkingSteadinessFeatureAvailabilityManager;
  v8 = -[HDMobilityWalkingSteadinessFeatureAvailabilityManager init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    v9->_currentOnboardingVersion = 1;
    objc_storeStrong((id *)&v9->_supportedRegionProvider, a4);
    v10 = objc_alloc(MEMORY[0x24BE40AB8]);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    v12 = objc_msgSend(v10, "initWithProfile:featureIdentifier:currentOnboardingVersion:loggingCategory:", WeakRetained, *MEMORY[0x24BDD2EA8], v9->_currentOnboardingVersion, *MEMORY[0x24BDD3040]);
    manager = v9->_manager;
    v9->_manager = (HDFeatureAvailabilityManager *)v12;

    v14 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HDFeatureAvailabilityManager featureIdentifier](self->_manager, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)canCompleteOnboardingWhileBypassingDeviceForDemoDataPurposesWithCountryCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HDRegionAvailabilityProviding onboardingEligibilityForCountryCode:](self->_supportedRegionProvider, "onboardingEligibilityForCountryCode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isEligible"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HDFeatureAvailabilityManager registerObserver:queue:](self->_manager, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[HDFeatureAvailabilityManager unregisterObserver:](self->_manager, "unregisterObserver:", a3);
}

- (NSString)featureIdentifier
{
  return (NSString *)-[HDFeatureAvailabilityManager featureIdentifier](self->_manager, "featureIdentifier");
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  id v4;

  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Walking Steadiness."));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  return 0;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _onboardingCompletionsForHighestVersionWithError:](self, "_onboardingCompletionsForHighestVersionWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithError___block_invoke;
      v11[3] = &unk_24D4DFAE0;
      v11[4] = self;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _determineIsSupportedWithOnboardingCompletions:regionCheckBlock:](self, "_determineIsSupportedWithOnboardingCompletions:regionCheckBlock:", v5, v11));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x24BDD3040];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = self;
        _os_log_impl(&dword_2160FB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
      }
      v7 = (void *)MEMORY[0x24BDBD1C0];
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:].cold.1();
    v8 = v6;
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v7 = 0;
  }

  return v7;
}

uint64_t __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_localRegionCheckWithCountryCode:", a2);
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:](self, "isCurrentOnboardingVersionCompletedWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _localRegionCheckWithCountryCode:](self, "_localRegionCheckWithCountryCode:", a3, a4));
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:].cold.1((uint64_t)self, v7, a2);
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ is not implemented for %@"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_error:description:", 110, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  return 0;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  return (id)-[HDFeatureAvailabilityManager isFeatureCapabilitySupportedOnActivePairedDeviceWithError:](self->_manager, "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", a3);
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  return (id)-[HDFeatureAvailabilityManager earliestDateLowestOnboardingVersionCompletedWithError:](self->_manager, "earliestDateLowestOnboardingVersionCompletedWithError:", a3);
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  return (id)-[HDFeatureAvailabilityManager pairedFeatureAttributesWithError:](self->_manager, "pairedFeatureAttributesWithError:", a3);
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:].cold.1((uint64_t)self, v6, a2);
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ is not implemented for %@"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_error:description:", 110, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();
  }

  return 0;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)-[HDRegionAvailabilityProviding regionAvailability](self->_supportedRegionProvider, "regionAvailability", a3);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x24BDD3DD8];
  v14 = a7;
  v15 = a6;
  v16 = [v13 alloc];
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _currentOnboardingVersion](self, "_currentOnboardingVersion");
  if (v12)
  {
    v19 = (void *)objc_msgSend(v16, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v17, v18, v12, v21, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v17, v18, v20, v21, a4);

  }
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:](self, "saveOnboardingCompletion:settings:completion:", v19, v15, v14);

}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, id);
  void *v9;
  void *WeakRetained;
  void *v11;
  uint64_t v12;
  void (**v13)(id, uint64_t, id);
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a5;
  objc_msgSend(v7, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "onboardingCompletionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v12 = objc_msgSend(v11, "insertOnboardingCompletion:error:", v7, &v17);
    v13 = (void (**)(id, uint64_t, id))v17;

    if ((v12 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "nanoSyncManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Onboarding completed"), self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke;
      v16[3] = &unk_24D4DF970;
      v16[4] = self;
      objc_msgSend(v14, "syncHealthDataWithOptions:reason:completion:", 0, v15, v16);

    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
        -[HDMobilityWalkingSteadinessFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.2();
    }
    v8[2](v8, v12, v13);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("Country code <nil> is not an allowed country code"));
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, WeakRetained);
    v13 = v8;
  }

}

void __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD3040];
  v7 = *MEMORY[0x24BDD3040];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2160FB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after onboarding completed", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;

  v5 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Walking Steadiness."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;

  v5 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Walking Steadiness."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;

  v5 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Walking Steadiness."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  void *v5;

  v4 = (void (**)(id, _QWORD, void *))a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, CFSTR("Feature settings is not implemented for Walking Steadiness."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v5);

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  -[HDFeatureAvailabilityManager resetOnboardingWithCompletion:](self->_manager, "resetOnboardingWithCompletion:", a3);
}

- (int64_t)_currentOnboardingVersion
{
  if (-[HDMobilityWalkingSteadinessFeatureAvailabilityManager _unitTest_currentOnboardingVersionOverride](self, "_unitTest_currentOnboardingVersionOverride"))
  {
    return -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _unitTest_currentOnboardingVersionOverride](self, "_unitTest_currentOnboardingVersionOverride");
  }
  else
  {
    return self->_currentOnboardingVersion;
  }
}

- (id)_onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _onboardingCompletionsForHighestVersionWithError:](self, "_onboardingCompletionsForHighestVersionWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager__onboardedCountryCodeSupportedStateWithError___block_invoke;
      v13[3] = &unk_24D4DFAE0;
      v13[4] = self;
      if (-[HDMobilityWalkingSteadinessFeatureAvailabilityManager _determineIsSupportedWithOnboardingCompletions:regionCheckBlock:](self, "_determineIsSupportedWithOnboardingCompletions:regionCheckBlock:", v5, v13))
      {
        v7 = 2;
      }
      else
      {
        v7 = 3;
      }
      _HKInitializeLogging();
      v8 = *MEMORY[0x24BDD3040];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 1026;
        v18 = v7;
        _os_log_impl(&dword_2160FB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarded country code state: %{public}i", buf, 0x12u);
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD3040];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = self;
        _os_log_impl(&dword_2160FB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
      }
      v9 = &unk_24D4E2308;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:].cold.1();
    v10 = v6;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = 0;
  }

  return v9;
}

uint64_t __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager__onboardedCountryCodeSupportedStateWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_localRegionCheckWithCountryCode:", a2);
}

- (BOOL)_determineIsSupportedWithOnboardingCompletions:(id)a3 regionCheckBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  id v8;
  uint64_t v9;
  __int128 v10;
  os_log_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  os_log_t v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  os_log_t v25;
  NSObject *v26;
  BOOL v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  v11 = (os_log_t *)MEMORY[0x24BDD3040];
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v31;
    *(_QWORD *)&v10 = 138543362;
    v29 = v10;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      v16 = objc_msgSend(v15, "version", v29, (_QWORD)v30);
      if (v16 >= -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _currentOnboardingVersion](self, "_currentOnboardingVersion"))
      {
        objc_msgSend(v15, "countryCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v15, "countryCode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v7[2](v7, v21);

          _HKInitializeLogging();
          v23 = *v11;
          v24 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = v29;
              v35 = self;
              _os_log_impl(&dword_2160FB000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found that satisfies region check", buf, 0xCu);
            }

            v27 = 1;
            goto LABEL_23;
          }
          if (!v24)
            goto LABEL_16;
          *(_DWORD *)buf = v29;
          v35 = self;
          v18 = v23;
          v19 = "[%{public}@] Onboarding completion found that does not satisfy region check";
          goto LABEL_15;
        }
        _HKInitializeLogging();
        v25 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v35 = self;
          v18 = v25;
          v19 = "[%{public}@] Onboarding completion found with no country code";
          goto LABEL_15;
        }
      }
      else
      {
        _HKInitializeLogging();
        v17 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v35 = self;
          v18 = v17;
          v19 = "[%{public}@] Onboarding completion found with older version than current";
LABEL_15:
          _os_log_impl(&dword_2160FB000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        }
      }
LABEL_16:
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  _HKInitializeLogging();
  v26 = *v11;
  v27 = 0;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl(&dword_2160FB000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completions meet the current requirements", buf, 0xCu);
    v27 = 0;
  }
LABEL_23:

  return v27;
}

- (id)_onboardingCompletionsForHighestVersionWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "onboardingCompletionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v8)
  {
    v10 = v8;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _onboardingCompletionsForHighestVersionWithError:].cold.1();
    v11 = v9;
    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  return v8;
}

- (BOOL)_localRegionCheckWithCountryCode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  int v11;
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDRegionAvailabilityProviding onboardingEligibilityForCountryCode:](self->_supportedRegionProvider, "onboardingEligibilityForCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEligible");

  _HKInitializeLogging();
  v7 = *MEMORY[0x24BDD3040];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v11 = 138543619;
      v12 = self;
      v13 = 2113;
      v14 = v4;
      v9 = "[%{public}@] Country code %{private}@ supported";
LABEL_6:
      _os_log_impl(&dword_2160FB000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v8)
  {
    v11 = 138543619;
    v12 = self;
    v13 = 2113;
    v14 = v4;
    v9 = "[%{public}@] Country code %{private}@ not supported";
    goto LABEL_6;
  }

  return v6;
}

- (int64_t)_unitTest_currentOnboardingVersionOverride
{
  return self->__unitTest_currentOnboardingVersionOverride;
}

- (void)set_unitTest_currentOnboardingVersionOverride:(int64_t)a3
{
  self->__unitTest_currentOnboardingVersionOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_supportedRegionProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_2160FB000, v0, v1, "[%{public}@] Feature settings is not implemented for Walking Steadiness.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isCurrentOnboardingVersionCompletedWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Error retrieving onboarding completions: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)onboardingEligibilityForCountryCode:(const char *)a3 error:.cold.1(uint64_t a1, void *a2, const char *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2160FB000, v4, v6, "[%{public}@] %{public}@ is not implemented", v7);

  OUTLINED_FUNCTION_7();
}

- (void)saveOnboardingCompletion:settings:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_2160FB000, v0, v1, "[%{public}@] Cannot save onboarding completion with nil country code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveOnboardingCompletion:settings:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Failed to set current onboarding version completed: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, a2, a3, "[%{public}@] NanoSync failed after onboarding completed: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_onboardingCompletionsForHighestVersionWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Failed to fetch highest version of onboarding completed: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
