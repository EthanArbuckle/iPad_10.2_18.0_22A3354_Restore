@implementation HKMobilityWalkingSteadinessFeatureStatusManager

- (HKMobilityWalkingSteadinessFeatureStatusManager)initWithHealthStore:(id)a3
{
  id v4;
  HKMobilityWalkingSteadinessFeatureStatusManager *v5;
  id v6;
  uint64_t v7;
  HKObserverSet *observers;
  id v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  id v13;
  HKMobilityWalkingSteadinessFeatureStatusManager *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMobilityWalkingSteadinessFeatureStatusManager;
  v5 = -[HKMobilityWalkingSteadinessFeatureStatusManager init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB6988]);
    v7 = objc_msgSend(v6, "initWithName:loggingCategory:", CFSTR("HKMobilityWalkingSteadinessFeatureStatusManager"), *MEMORY[0x1E0CB5328]);
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v7;

    v9 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("HKMobilityWalkingSteadinessFeatureStatusManagerServer"), v5, v10);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v13 = objc_alloc_init(MEMORY[0x1E0CB6CB8]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v5->_proxyProvider, "setTaskConfiguration:", v13);

    v14 = v5;
  }

  return v5;
}

- (id)onboardingStatusWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke;
  v10[3] = &unk_1E9C36640;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_3;
  v9[3] = &unk_1E9C36668;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_2;
  v3[3] = &unk_1E9C36618;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_onboardingStatusWithCompletion:", v3);
}

void __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)resetOnboarding
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7804000, v0, v1, "[%{public}@] Error while resetting onboarding: %{public}@");
  OUTLINED_FUNCTION_2();
}

uint64_t __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke_2;
  v3[3] = &unk_1E9C36690;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_resetOnboardingWithCompletion:", v3);
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)notificationStatusWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke;
  v10[3] = &unk_1E9C36640;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_3;
  v9[3] = &unk_1E9C36668;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_2;
  v3[3] = &unk_1E9C366B8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_notificationStatusWithCompletion:", v3);
}

void __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v4[5];
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[3];
  char v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke;
  v5[3] = &unk_1E9C366E0;
  v6 = a3;
  v5[4] = v13;
  v5[5] = &v7;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_3;
  v4[3] = &unk_1E9C36668;
  v4[4] = &v7;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v5, v4);
  if (v8[5])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_ERROR))
      -[HKMobilityWalkingSteadinessFeatureStatusManager setNotificationsEnabled:].cold.1();
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
}

uint64_t __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_2;
  v4[3] = &unk_1E9C36690;
  v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_setNotificationsEnabled:withCompletion:", v2, v4);
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isFitnessTrackingEnabled
{
  HKTaskServerProxyProvider *proxyProvider;
  char v3;
  _QWORD v5[5];
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  proxyProvider = self->_proxyProvider;
  v5[4] = &v7;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke;
  v6[3] = &unk_1E9C36640;
  v6[4] = &v13;
  v6[5] = &v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_3;
  v5[3] = &unk_1E9C36668;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v6, v5);
  if (v8[5])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
      -[HKMobilityWalkingSteadinessFeatureStatusManager isFitnessTrackingEnabled].cold.1();
  }
  v3 = objc_msgSend((id)v14[5], "BOOLValue");
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

uint64_t __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_2;
  v3[3] = &unk_1E9C36690;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fitnessTrackingEnabledWithCompletion:", v3);
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke;
  v5[3] = &unk_1E9C36758;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

void __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientQueueActionHandlerWithCompletion:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  v6[4] = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_2;
  v7[3] = &unk_1E9C36708;
  v8 = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3;
  v6[3] = &unk_1E9C36730;
  v5 = v2;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v7, v6);

}

uint64_t __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_ERROR))
    __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3_cold_1();

}

- (void)removeObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke;
  v4[3] = &unk_1E9C36758;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3;
  v4[3] = &unk_1E9C36730;
  v4[4] = v1;
  return objc_msgSend(v2, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_0, v4);
}

uint64_t __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_ERROR))
    __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3_cold_1();

}

- (void)client_didUpdateOnboardingStatus:(id)a3
{
  id v4;
  NSObject *v5;
  HKObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKMobilityWalkingSteadinessFeatureStatusManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5328];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_1D7804000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers that onboarding status changed", buf, 0xCu);
  }
  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke;
  v8[3] = &unk_1E9C367C0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

}

void __84__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureStatusManager:didUpdateOnboardingStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client_didUpdateNotificationStatus:(id)a3
{
  id v4;
  NSObject *v5;
  HKObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  HKMobilityWalkingSteadinessFeatureStatusManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5328];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_1D7804000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers that notification status changed", buf, 0xCu);
  }
  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke;
  v8[3] = &unk_1E9C367C0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

}

void __86__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureStatusManager:didUpdateNotificationStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client_didUpdateFitnessTrackingEnabled:(BOOL)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];
  BOOL v5;

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateFitnessTrackingEnabled___block_invoke;
  v4[3] = &unk_1E9C367E8;
  v4[4] = self;
  v5 = a3;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

void __90__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateFitnessTrackingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureStatusManager:didUpdateFitnessTrackingEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)connectionInvalidated
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D7804000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Connection invalidated", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setNotificationsEnabled:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7804000, v0, v1, "[%{public}@] Error while setting notification enabled: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)isFitnessTrackingEnabled
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D7804000, v0, OS_LOG_TYPE_FAULT, "[%{public}@] Error while reading fitness tracking enabled setting: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D7804000, v0, v1, "[%{public}@] Failed to communicate with task server for observation start: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D7804000, v0, v1, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
