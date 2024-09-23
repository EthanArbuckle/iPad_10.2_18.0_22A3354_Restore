@implementation HKHRCardioFitnessFeatureStatusManager

uint64_t __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_2;
  v3[3] = &unk_1E9C26020;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_onboardingStatusWithCompletion:", v3);
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_2;
  v9[3] = &unk_1E9C26110;
  objc_copyWeak(&v10, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomaticProxyReconnectionHandler:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setShouldRetryOnInterruption:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientQueueActionHandlerWithCompletion:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_3;
  v7[3] = &unk_1E9C26138;
  v5 = v3;
  v8 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4;
  v6[3] = &unk_1E9C26160;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v7, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (HKHRCardioFitnessFeatureStatusManager)initWithHealthStore:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HKHRCardioFitnessFeatureStatusManager *v11;

  v4 = (objc_class *)MEMORY[0x1E0CB6CC0];
  v5 = a3;
  v6 = [v4 alloc];
  +[HKHRCardioFitnessFeatureStatusManager taskIdentifier](HKHRCardioFitnessFeatureStatusManager, "taskIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v7, self, v8);

  objc_msgSend(v9, "setShouldRetryOnInterruption:", 0);
  v10 = objc_alloc_init(MEMORY[0x1E0CB6CB8]);
  objc_msgSend(v9, "setTaskConfiguration:", v10);

  v11 = -[HKHRCardioFitnessFeatureStatusManager initWithProxyProvider:](self, "initWithProxyProvider:", v9);
  return v11;
}

- (HKHRCardioFitnessFeatureStatusManager)initWithProxyProvider:(id)a3
{
  id v5;
  HKHRCardioFitnessFeatureStatusManager *v6;
  id v7;
  uint64_t v8;
  HKObserverSet *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRCardioFitnessFeatureStatusManager;
  v6 = -[HKHRCardioFitnessFeatureStatusManager init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    v8 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("HKHRCardioFitnessFeatureStatusManager"), *MEMORY[0x1E0CB52E8]);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v8;

    objc_storeStrong((id *)&v6->_proxyProvider, a3);
  }

  return v6;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke;
  v5[3] = &unk_1E9C26188;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

void __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)onboardingStatusWithError:(id *)a3
{
  HKProxyProvider *proxyProvider;
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
  v10[2] = __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke;
  v10[3] = &unk_1E9C26048;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_3;
  v9[3] = &unk_1E9C26070;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
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

void __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)resetOnboarding
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%{public}@] Error while resetting onboarding: %{public}@");
  OUTLINED_FUNCTION_1();
}

uint64_t __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke_2;
  v3[3] = &unk_1E9C26098;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_resetOnboardingWithCompletion:", v3);
}

void __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)notificationStatusWithError:(id *)a3
{
  HKProxyProvider *proxyProvider;
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
  v10[2] = __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke;
  v10[3] = &unk_1E9C26048;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_3;
  v9[3] = &unk_1E9C26070;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
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

uint64_t __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_2;
  v3[3] = &unk_1E9C260C0;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_notificationStatusWithCompletion:", v3);
}

void __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  HKProxyProvider *proxyProvider;
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
  v5[2] = __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke;
  v5[3] = &unk_1E9C260E8;
  v6 = a3;
  v5[4] = v13;
  v5[5] = &v7;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_3;
  v4[3] = &unk_1E9C26070;
  v4[4] = &v7;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v5, v4);
  if (v8[5])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HKHRCardioFitnessFeatureStatusManager setNotificationsEnabled:].cold.1();
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
}

uint64_t __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_2;
  v4[3] = &unk_1E9C26098;
  v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_setNotificationsEnabled:withCompletion:", v2, v4);
}

void __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

uint64_t __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4_cold_1(a1);

}

- (void)removeObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke;
  v4[3] = &unk_1E9C26188;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomaticProxyReconnectionHandler:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3;
  v5[3] = &unk_1E9C26160;
  v5[4] = v2;
  return objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_2, v5);
}

uint64_t __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3_cold_1(a1);

}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  HKProxyProvider *proxyProvider;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[6];
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
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_1E9C26048;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_1E9C261F0;
  v9[4] = self;
  v9[5] = &v11;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_1E9C26098;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)_handleAutomaticProxyReconnection
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v1, v2, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)client_didUpdateNotificationStatus:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HKHRCardioFitnessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke;
  v7[3] = &unk_1E9C26218;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

void __76__HKHRCardioFitnessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureStatusManager:didUpdateNotificationStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client_didUpdateOnboardingStatus:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HKHRCardioFitnessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke;
  v7[3] = &unk_1E9C26218;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

void __74__HKHRCardioFitnessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureStatusManager:didUpdateOnboardingStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionInvalidated
{
  OUTLINED_FUNCTION_2(&dword_1D7781000, a2, a3, "[%{public}@] Connection invalidated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%{public}@] Error while setting notification enabled: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v1, v2, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v1, v2, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1D7781000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
