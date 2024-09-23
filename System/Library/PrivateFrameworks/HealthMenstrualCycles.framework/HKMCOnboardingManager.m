@implementation HKMCOnboardingManager

- (HKMCOnboardingManager)initWithHealthStore:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  HKMCOnboardingManager *v9;
  HKMCOnboardingManager *v10;
  id v11;
  uint64_t v12;
  HKObserverSet *observers;
  HKMenstrualCyclesStore *v14;
  HKMenstrualCyclesStore *menstrualCyclesStore;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *observerQueue;
  OS_dispatch_queue *v18;
  id v19;
  id v20;
  uint64_t v21;
  HKFeatureAvailabilityStore *featureAvailabilityStore;
  id v23;
  uint64_t v24;
  HKFeatureAvailabilityStore *heartRateInputFeatureAvailabilityStore;
  id v26;
  uint64_t v27;
  HKFeatureAvailabilityStore *deviationsFeatureAvailabilityStore;
  id v29;
  uint64_t v30;
  HKFeatureAvailabilityStore *wristTemperatureInputFeatureAvailabilityStore;
  uint64_t v32;
  HKKeyValueDomain *legacyOnboardingKeyValueDomain;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HKMCOnboardingManager;
  v9 = -[HKMCOnboardingManager init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v11 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v12 = objc_msgSend(v11, "initWithName:loggingCategory:", CFSTR("HKMCOnboardingManagerObserver"), *MEMORY[0x24BDD3030]);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v12;

    v14 = -[HKMenstrualCyclesStore initWithHealthStore:]([HKMenstrualCyclesStore alloc], "initWithHealthStore:", v10->_healthStore);
    menstrualCyclesStore = v10->_menstrualCyclesStore;
    v10->_menstrualCyclesStore = v14;

    if (v8)
    {
      v16 = (OS_dispatch_queue *)v8;
      observerQueue = v10->_observerQueue;
      v10->_observerQueue = v16;
    }
    else
    {
      v18 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v19 = MEMORY[0x24BDAC9B8];
      observerQueue = v10->_observerQueue;
      v10->_observerQueue = v18;
    }

    v20 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v21 = objc_msgSend(v20, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E28], v10->_healthStore);
    featureAvailabilityStore = v10->_featureAvailabilityStore;
    v10->_featureAvailabilityStore = (HKFeatureAvailabilityStore *)v21;

    -[HKFeatureAvailabilityStore registerObserver:queue:](v10->_featureAvailabilityStore, "registerObserver:queue:", v10, v10->_observerQueue);
    v23 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v24 = objc_msgSend(v23, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E38], v10->_healthStore);
    heartRateInputFeatureAvailabilityStore = v10->_heartRateInputFeatureAvailabilityStore;
    v10->_heartRateInputFeatureAvailabilityStore = (HKFeatureAvailabilityStore *)v24;

    -[HKFeatureAvailabilityStore registerObserver:queue:](v10->_heartRateInputFeatureAvailabilityStore, "registerObserver:queue:", v10, v10->_observerQueue);
    v26 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v27 = objc_msgSend(v26, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E30], v10->_healthStore);
    deviationsFeatureAvailabilityStore = v10->_deviationsFeatureAvailabilityStore;
    v10->_deviationsFeatureAvailabilityStore = (HKFeatureAvailabilityStore *)v27;

    -[HKFeatureAvailabilityStore registerObserver:queue:](v10->_deviationsFeatureAvailabilityStore, "registerObserver:queue:", v10, v10->_observerQueue);
    v29 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v30 = objc_msgSend(v29, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E40], v10->_healthStore);
    wristTemperatureInputFeatureAvailabilityStore = v10->_wristTemperatureInputFeatureAvailabilityStore;
    v10->_wristTemperatureInputFeatureAvailabilityStore = (HKFeatureAvailabilityStore *)v30;

    -[HKFeatureAvailabilityStore registerObserver:queue:](v10->_wristTemperatureInputFeatureAvailabilityStore, "registerObserver:queue:", v10, v10->_observerQueue);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3C98]), "initWithCategory:domainName:healthStore:", 0, CFSTR("com.apple.private.health.menstrual-cycles"), v7);
    legacyOnboardingKeyValueDomain = v10->_legacyOnboardingKeyValueDomain;
    v10->_legacyOnboardingKeyValueDomain = (HKKeyValueDomain *)v32;

  }
  return v10;
}

void __71__HKMCOnboardingManager_isAnyOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "onboardingState") == 2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

- (void)isAnyOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4;
  HKFeatureAvailabilityStore *featureAvailabilityStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  featureAvailabilityStore = self->_featureAvailabilityStore;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HKMCOnboardingManager_isAnyOnboardingVersionCompletedWithCompletion___block_invoke;
  v7[3] = &unk_24D99E1E8;
  v8 = v4;
  v6 = v4;
  -[HKFeatureAvailabilityStore getFeatureOnboardingRecordWithCompletion:](featureAvailabilityStore, "getFeatureOnboardingRecordWithCompletion:", v7);

}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (HKMCOnboardingManager)initWithHealthStore:(id)a3
{
  return -[HKMCOnboardingManager initWithHealthStore:queue:](self, "initWithHealthStore:queue:", a3, 0);
}

- (id)_featureAvailabilityStoreForFeatureWithIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityStore *deviationsFeatureAvailabilityStore;
  HKFeatureAvailabilityStore *heartRateInputFeatureAvailabilityStore;
  HKFeatureAvailabilityStore *wristTemperatureInputFeatureAvailabilityStore;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  deviationsFeatureAvailabilityStore = self->_deviationsFeatureAvailabilityStore;
  heartRateInputFeatureAvailabilityStore = self->_heartRateInputFeatureAvailabilityStore;
  wristTemperatureInputFeatureAvailabilityStore = self->_wristTemperatureInputFeatureAvailabilityStore;
  v14[0] = self->_featureAvailabilityStore;
  v14[1] = heartRateInputFeatureAvailabilityStore;
  v14[2] = deviationsFeatureAvailabilityStore;
  v14[3] = wristTemperatureInputFeatureAvailabilityStore;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__HKMCOnboardingManager__featureAvailabilityStoreForFeatureWithIdentifier___block_invoke;
  v12[3] = &unk_24D99E1C0;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "hk_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __75__HKMCOnboardingManager__featureAvailabilityStoreForFeatureWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (BOOL)isAnyOnboardingVersionCompleted
{
  void *v2;
  char v3;

  -[HKMCOnboardingManager onboardingRecordWithError:](self, "onboardingRecordWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnboardingPresent");

  return v3;
}

- (id)onboardingRecordWithError:(id *)a3
{
  return -[HKMCOnboardingManager _onboardingRecordForFeatureWithIdentifier:error:](self, "_onboardingRecordForFeatureWithIdentifier:error:", *MEMORY[0x24BDD2E28], a3);
}

- (id)_onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v6 = a3;
  -[HKMCOnboardingManager _featureAvailabilityStoreForFeatureWithIdentifier:](self, "_featureAvailabilityStoreForFeatureWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v14 = 0;
    objc_msgSend(v7, "featureOnboardingRecordWithError:", &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = v10;
    if (!v9)
    {
      v12 = v10;
      if (v12)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HKMCOnboardingManager _onboardingRecordForFeatureWithIdentifier:error:].cold.1();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 110, CFSTR("%@ is not a supported feature"), v6);
    v9 = 0;
  }

  return v9;
}

- (HKQuantity)userEnteredCycleLength
{
  HKHealthStore *healthStore;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  id v8;

  healthStore = self->_healthStore;
  v8 = 0;
  -[HKHealthStore _userEnteredMenstrualCycleLengthCharacteristicQuantityWithError:](healthStore, "_userEnteredMenstrualCycleLengthCharacteristicQuantityWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager userEnteredCycleLength].cold.1();
  }

  return (HKQuantity *)v3;
}

- (HKQuantity)userEnteredPeriodLength
{
  HKHealthStore *healthStore;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  id v8;

  healthStore = self->_healthStore;
  v8 = 0;
  -[HKHealthStore _userEnteredMenstrualPeriodLengthCharacteristicQuantityWithError:](healthStore, "_userEnteredMenstrualPeriodLengthCharacteristicQuantityWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager userEnteredPeriodLength].cold.1();
  }

  return (HKQuantity *)v3;
}

- (BOOL)_setLegacyOnboardingCompletedVersion:(int64_t)a3 error:(id *)a4
{
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HKKeyValueDomain *legacyOnboardingKeyValueDomain;
  void *v14;
  id v15;
  HKKeyValueDomain *v16;
  void *v17;
  id v18;
  BOOL v19;
  HKKeyValueDomain *v21;
  void *v22;
  char v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD3030];
  v7 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = v9;
    objc_msgSend(v10, "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting onboarding version %{public}@ and completion date in key value store", buf, 0x16u);

  }
  legacyOnboardingKeyValueDomain = self->_legacyOnboardingKeyValueDomain;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  LOBYTE(legacyOnboardingKeyValueDomain) = -[HKKeyValueDomain setNumber:forKey:error:](legacyOnboardingKeyValueDomain, "setNumber:forKey:error:", v14, CFSTR("OnboardingCompleted"), &v26);
  v15 = v26;

  if ((legacyOnboardingKeyValueDomain & 1) != 0)
  {
    v16 = self->_legacyOnboardingKeyValueDomain;
    v25 = v15;
    -[HKKeyValueDomain dateForKey:error:](v16, "dateForKey:error:", CFSTR("OnboardingFirstCompletedDate"), &v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v25;

    if (v17)
    {
      v19 = 1;
LABEL_13:
      v15 = v18;
      goto LABEL_14;
    }
    if (v18)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:].cold.2();
      v19 = 0;
      goto LABEL_13;
    }
    v21 = self->_legacyOnboardingKeyValueDomain;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v23 = -[HKKeyValueDomain setDate:forKey:error:](v21, "setDate:forKey:error:", v22, CFSTR("OnboardingFirstCompletedDate"), &v24);
    v15 = v24;

    if ((v23 & 1) != 0)
    {
      v19 = 1;
      goto LABEL_14;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:].cold.1();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:].cold.3();
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (void)_saveUserEnteredCycleLength:(id)a3 userEnteredPeriodLength:(id)a4 userEnteredLastPeriodStartDay:(id)a5 addedCycleFactors:(id)a6 deletedCycleFactors:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  HKHealthStore *healthStore;
  char v23;
  id v24;
  void *v25;
  HKHealthStore *v26;
  char v27;
  id v28;
  HKHealthStore *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v14 = a3;
  v15 = a4;
  v31 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke;
  v38[3] = &unk_24D99E210;
  v20 = v18;
  v39 = v20;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A1F070](v38);
  if (v14)
  {
    healthStore = self->_healthStore;
    v37 = 0;
    v23 = -[HKHealthStore _setUserEnteredMenstrualCycleLengthCharacteristicQuantity:error:](healthStore, "_setUserEnteredMenstrualCycleLengthCharacteristicQuantity:error:", v14, &v37);
    v24 = v37;
    v25 = v24;
    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HKMCOnboardingManager _saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:].cold.2();
      goto LABEL_12;
    }

  }
  if (v15)
  {
    v26 = self->_healthStore;
    v36 = 0;
    v27 = -[HKHealthStore _setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:error:](v26, "_setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:error:", v15, &v36);
    v28 = v36;
    v25 = v28;
    if ((v27 & 1) != 0)
    {

      goto LABEL_7;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:].cold.1();
LABEL_12:
    ((void (**)(_QWORD, _QWORD, void *))v21)[2](v21, 0, v25);

    v30 = v31;
    goto LABEL_13;
  }
LABEL_7:
  v29 = self->_healthStore;
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_272;
  v32[3] = &unk_24D99E238;
  v32[4] = self;
  v35 = v21;
  v30 = v31;
  v33 = v31;
  v34 = v15;
  -[HKHealthStore saveObjects:deleteObjects:associations:completion:](v29, "saveObjects:deleteObjects:associations:completion:", v16, v17, 0, v32);

LABEL_13:
}

uint64_t __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_272(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_272_cold_1((uint64_t)a1, v11);
    v12 = *(void (**)(void))(a1[7] + 16);
    goto LABEL_9;
  }
  v6 = (void *)a1[5];
  if (!v6)
  {
    v12 = *(void (**)(void))(a1[7] + 16);
LABEL_9:
    v12();
    goto LABEL_12;
  }
  v7 = (void *)a1[6];
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    v10 = (uint64_t)v9;

    v6 = (void *)a1[5];
  }
  else
  {
    v10 = 1;
  }
  v13 = objc_msgSend(v6, "integerValue");
  v14 = a1[4];
  v15 = *(void **)(v14 + 24);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_274;
  v17[3] = &unk_24D99D6A8;
  v16 = a1[7];
  v17[4] = v14;
  v17[5] = v16;
  objc_msgSend(v15, "saveLastMenstrualPeriodWithDayIndexRange:completion:", v13, v10, v17);
LABEL_12:

}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_274(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_274_cold_1(a1, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_setCurrentOnboardingVersionCompletedWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HKFeatureAvailabilityStore *featureAvailabilityStore;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v8 = -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:](self, "_setLegacyOnboardingCompletedVersion:error:", 2, &v18);
  v9 = v18;
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDD3DD8]);
    v11 = *MEMORY[0x24BDD2E28];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v11, 2, v12, 0, 0);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BE8]), "initWithMenstruationProjectionsEnabled:fertileWindowProjectionsEnabled:areFertilityTrackingDisplayTypesVisible:isSexualActivityDisplayTypeVisible:", objc_msgSend(v6, "menstruationProjectionsEnabled"), objc_msgSend(v6, "fertileWindowProjectionsEnabled"), objc_msgSend(v6, "fertilityTrackingDisplayTypesVisible"), objc_msgSend(v6, "sexualActivityDisplayTypeVisible"));
    featureAvailabilityStore = self->_featureAvailabilityStore;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke;
    v16[3] = &unk_24D99D6A8;
    v16[4] = self;
    v17 = v7;
    -[HKFeatureAvailabilityStore saveOnboardingCompletion:settings:completion:](featureAvailabilityStore, "saveOnboardingCompletion:settings:completion:", v13, v14, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
  }

}

void __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current onboarding version completed in the feature availability store", (uint8_t *)&v10, 0xCu);

    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke_cold_1(a1, v6);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }

}

- (void)setOnboardingCompletedWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKMCOnboardingManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  _QWORD *v22;
  id v23;
  void *v24;
  void *v25;
  HKFeatureAvailabilityStore *heartRateInputFeatureAvailabilityStore;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HKFeatureAvailabilityStore *deviationsFeatureAvailabilityStore;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  HKFeatureAvailabilityStore *wristTemperatureInputFeatureAvailabilityStore;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *log;
  id v56;
  id v57;
  id v58;
  _QWORD v59[5];
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  _QWORD v66[5];
  id v67;
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    v57 = v7;
    v9 = self;
    v10 = (void *)objc_opt_class();
    v11 = (void *)MEMORY[0x24BDD16E0];
    v56 = v10;
    objc_msgSend(v11, "numberWithInteger:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userEnteredCycleLength");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userEnteredPeriodLength");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userEnteredLastPeriodStartDay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v71 = v10;
    self = v9;
    v7 = v57;
    v72 = 2114;
    v73 = v12;
    v74 = 2112;
    v75 = v54;
    v76 = 2112;
    v77 = v15;
    v78 = 2112;
    v79 = v17;
    _os_log_impl(&dword_218A9C000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set onboarding completed (version: %{public}@), cycle length: %@, period length: %@, last period start: %@", buf, 0x34u);

  }
  v18 = MEMORY[0x24BDAC760];
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke;
  v66[3] = &unk_24D99E260;
  v66[4] = self;
  v19 = v7;
  v68 = v19;
  v20 = v6;
  v67 = v20;
  -[HKMCOnboardingManager _setCurrentOnboardingVersionCompletedWithInfo:completion:](self, "_setCurrentOnboardingVersionCompletedWithInfo:completion:", v20, v66);
  objc_msgSend(v20, "heartRateInputSupportedCountryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (_QWORD *)MEMORY[0x24BDD2EB0];
  if (v21)
  {
    v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v20, "heartRateInputEnabled");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *v22);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BE8]), "initWithDictionary:", v23);
    heartRateInputFeatureAvailabilityStore = self->_heartRateInputFeatureAvailabilityStore;
    objc_msgSend(v20, "heartRateInputSupportedCountryCode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ISOCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heartRateInputSupportedCountryCode");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v18;
    v65[1] = 3221225472;
    v65[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3;
    v65[3] = &unk_24D99E288;
    v65[4] = self;
    -[HKFeatureAvailabilityStore setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](heartRateInputFeatureAvailabilityStore, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v28, objc_msgSend(v29, "provenance"), 0, v25, v65);

    v22 = (_QWORD *)MEMORY[0x24BDD2EB0];
  }
  objc_msgSend(v20, "deviationDetectionSupportedCountryCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v58 = v19;
    v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    HKMCAllDeviationTypes();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v62 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v20, "deviationDetectionEnabled"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(objc_msgSend(v37, "integerValue"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, v39);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v34);
    }

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BE8]), "initWithDictionary:", v31);
    deviationsFeatureAvailabilityStore = self->_deviationsFeatureAvailabilityStore;
    objc_msgSend(v20, "deviationDetectionSupportedCountryCode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "ISOCode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deviationDetectionSupportedCountryCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "provenance");
    v18 = MEMORY[0x24BDAC760];
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_280;
    v60[3] = &unk_24D99E288;
    v60[4] = self;
    -[HKFeatureAvailabilityStore setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](deviationsFeatureAvailabilityStore, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v43, v45, 0, v40, v60);

    v19 = v58;
    v22 = (_QWORD *)MEMORY[0x24BDD2EB0];
  }
  objc_msgSend(v20, "wristTemperatureInputSupportedCountryCode");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v20, "wristTemperatureInputEnabled");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, *v22);

    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BE8]), "initWithDictionary:", v47);
    wristTemperatureInputFeatureAvailabilityStore = self->_wristTemperatureInputFeatureAvailabilityStore;
    objc_msgSend(v20, "wristTemperatureInputSupportedCountryCode");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "ISOCode");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wristTemperatureInputSupportedCountryCode");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v18;
    v59[1] = 3221225472;
    v59[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_281;
    v59[3] = &unk_24D99E288;
    v59[4] = self;
    -[HKFeatureAvailabilityStore setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](wristTemperatureInputFeatureAvailabilityStore, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v52, objc_msgSend(v53, "provenance"), 0, v49, v59);

  }
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_277;
    block[3] = &unk_24D99DBB0;
    v7 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v6, block);

  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_cold_1(a1, v8);
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_277(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userEnteredCycleLength");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userEnteredPeriodLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userEnteredLastPeriodStartDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addedCycleFactors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deletedCycleFactors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_2;
  v8[3] = &unk_24D99E210;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:", v3, v4, v5, v6, v7, v8);

}

uint64_t __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current heart rate input onboarding version completed", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3_cold_1(a1, v6);
  }

}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_280(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current deviation detection onboarding version completed", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_280_cold_1(a1, v6);
  }

}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_281(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current wrist temperature input onboarding version completed", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_281_cold_1(a1, v6);
  }

}

- (BOOL)_resetOnboardingKeyValueDomainWithError:(id *)a3
{
  HKKeyValueDomain *legacyOnboardingKeyValueDomain;
  char v6;
  id v7;
  os_log_t *v8;
  HKKeyValueDomain *v9;
  char v10;
  id v11;
  id v12;
  id v14;
  id v15;

  legacyOnboardingKeyValueDomain = self->_legacyOnboardingKeyValueDomain;
  v15 = 0;
  v6 = -[HKKeyValueDomain setNumber:forKey:error:](legacyOnboardingKeyValueDomain, "setNumber:forKey:error:", &unk_24D9AA468, CFSTR("OnboardingCompleted"), &v15);
  v7 = v15;
  v8 = (os_log_t *)MEMORY[0x24BDD3030];
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _resetOnboardingKeyValueDomainWithError:].cold.2();
  }
  v9 = self->_legacyOnboardingKeyValueDomain;
  v14 = v7;
  v10 = -[HKKeyValueDomain setDate:forKey:error:](v9, "setDate:forKey:error:", 0, CFSTR("OnboardingFirstCompletedDate"), &v14);
  v11 = v14;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _resetOnboardingKeyValueDomainWithError:].cold.1();
  }
  v12 = v11;
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  return v6;
}

- (BOOL)_resetOnboardingCharacteristicsWithError:(id *)a3
{
  HKHealthStore *healthStore;
  char v6;
  id v7;
  os_log_t *v8;
  HKHealthStore *v9;
  char v10;
  id v11;
  id v12;
  id v14;
  id v15;

  healthStore = self->_healthStore;
  v15 = 0;
  v6 = -[HKHealthStore _setUserEnteredMenstrualCycleLengthCharacteristicQuantity:error:](healthStore, "_setUserEnteredMenstrualCycleLengthCharacteristicQuantity:error:", 0, &v15);
  v7 = v15;
  v8 = (os_log_t *)MEMORY[0x24BDD3030];
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _resetOnboardingCharacteristicsWithError:].cold.2();
  }
  v9 = self->_healthStore;
  v14 = v7;
  v10 = -[HKHealthStore _setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:error:](v9, "_setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:error:", 0, &v14);
  v11 = v14;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[HKMCOnboardingManager _resetOnboardingCharacteristicsWithError:].cold.1();
  }
  v12 = v11;
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  return v10;
}

- (void)_triggerHealthKitSync
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D80]), "initWithHealthStore:", self->_healthStore);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke;
  v4[3] = &unk_24D99E288;
  v4[4] = self;
  objc_msgSend(v3, "forceNanoSyncWithOptions:completion:", 0, v4);

}

void __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forced HealthKit sync", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke_cold_1(a1, v6);
  }

}

- (void)resetOnboarding:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKFeatureAvailabilityStore *featureAvailabilityStore;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char, void *);
  void *v13;
  HKMCOnboardingManager *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v7 = v17;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", buf, 0xCu);

  }
  featureAvailabilityStore = self->_featureAvailabilityStore;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __41__HKMCOnboardingManager_resetOnboarding___block_invoke;
  v13 = &unk_24D99D6A8;
  v14 = self;
  v15 = v4;
  v9 = v4;
  -[HKFeatureAvailabilityStore resetOnboardingWithCompletion:](featureAvailabilityStore, "resetOnboardingWithCompletion:", &v10);
  -[HKFeatureAvailabilityStore resetOnboardingWithCompletion:](self->_heartRateInputFeatureAvailabilityStore, "resetOnboardingWithCompletion:", &__block_literal_global_4, v10, v11, v12, v13, v14);
  -[HKFeatureAvailabilityStore resetOnboardingWithCompletion:](self->_deviationsFeatureAvailabilityStore, "resetOnboardingWithCompletion:", &__block_literal_global_285);
  -[HKFeatureAvailabilityStore resetOnboardingWithCompletion:](self->_wristTemperatureInputFeatureAvailabilityStore, "resetOnboardingWithCompletion:", &__block_literal_global_286);

}

void __41__HKMCOnboardingManager_resetOnboarding___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__HKMCOnboardingManager_resetOnboarding___block_invoke_284;
    v10[3] = &unk_24D99D8C0;
    v7 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    dispatch_async(v6, v10);

  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __41__HKMCOnboardingManager_resetOnboarding___block_invoke_cold_1(a1, v8);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

void __41__HKMCOnboardingManager_resetOnboarding___block_invoke_284(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v9 = 0;
  v3 = objc_msgSend(v2, "_resetOnboardingKeyValueDomainWithError:", &v9);
  v4 = v9;
  if ((_DWORD)v3)
  {
    v5 = *(void **)(a1 + 32);
    v8 = v4;
    v3 = objc_msgSend(v5, "_resetOnboardingCharacteristicsWithError:", &v8);
    v6 = v8;

    v4 = v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_triggerHealthKitSync");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v3, v4);

}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  HKObserverSet *observers;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v4, "featureIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify observers that onboarding state did change for %{public}@", buf, 0x16u);

  }
  observers = self->_observers;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v11[3] = &unk_24D99E310;
  v11[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v11);

}

uint64_t __83__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "onboardingManagerDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  HKObserverSet *observers;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v4, "featureIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify observers of feature settings change for %{public}@", buf, 0x16u);

  }
  observers = self->_observers;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke;
  v12[3] = &unk_24D99E338;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v12);

}

void __71__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "featureIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onboardingManager:didUpdateFeatureSettingsForFeatureIdentifier:", v2, v5);

}

- (HKFeatureAvailabilityStore)featureAvailabilityStore
{
  return self->_featureAvailabilityStore;
}

- (HKFeatureAvailabilityStore)deviationsFeatureAvailabilityStore
{
  return self->_deviationsFeatureAvailabilityStore;
}

- (HKFeatureAvailabilityStore)heartRateInputFeatureAvailabilityStore
{
  return self->_heartRateInputFeatureAvailabilityStore;
}

- (HKFeatureAvailabilityStore)wristTemperatureInputFeatureAvailabilityStore
{
  return self->_wristTemperatureInputFeatureAvailabilityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristTemperatureInputFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_heartRateInputFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_deviationsFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_legacyOnboardingKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_menstrualCyclesStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_onboardingRecordForFeatureWithIdentifier:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error retrieving onboarding record: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)userEnteredCycleLength
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error retrieving user entered cycle length: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)userEnteredPeriodLength
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error retrieving user entered period length: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_setLegacyOnboardingCompletedVersion:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error setting onboarding completed date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_setLegacyOnboardingCompletedVersion:error:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error retrieving first onboarding completed date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_setLegacyOnboardingCompletedVersion:error:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error setting onboarding completed: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error setting user entered period length: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error setting user entered cycle length: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_272_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error saving added and removed cycle factors: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_274_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error saving user entered last period: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error setting saving current onboarding version completed to feature availability store: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error saving current onboarding version completed: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error setting current heart rate input onboarding version completed: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_280_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error setting current deviation detection onboarding version completed: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_281_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error setting current wrist temperature input onboarding version completed: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)_resetOnboardingKeyValueDomainWithError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error resetting onboarding completed date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_resetOnboardingKeyValueDomainWithError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error resetting onboarding completed: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_resetOnboardingCharacteristicsWithError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error clearing user entered period length: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_resetOnboardingCharacteristicsWithError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v4, v5, "[%{public}@] Error clearing user entered cycle length: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error forcing HealthKit sync: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __41__HKMCOnboardingManager_resetOnboarding___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_218A9C000, v5, v6, "[%{public}@] Error resetting onboarding in feature availability store: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
