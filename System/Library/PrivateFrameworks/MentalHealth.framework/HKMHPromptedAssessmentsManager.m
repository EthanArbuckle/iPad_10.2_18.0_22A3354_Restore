@implementation HKMHPromptedAssessmentsManager

- (HKMHPromptedAssessmentsManager)initWithHealthStore:(id)a3
{
  id v4;
  HKMHPromptedAssessmentsManager *v5;
  id v6;
  uint64_t v7;
  HKObserverSet *observers;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  id v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMHPromptedAssessmentsManager;
  v5 = -[HKMHPromptedAssessmentsManager init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v7 = objc_msgSend(v6, "initWithName:loggingCategory:", CFSTR("HKMHPromptedAssessmentsManager"), *MEMORY[0x24BDD3038]);
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v7;

    v9 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v10, v5, v11);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v12;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v14 = objc_alloc_init(MEMORY[0x24BDD4030]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v5->_proxyProvider, "setTaskConfiguration:", v14);

  }
  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)promptedAssessmentsWithError:(id *)a3
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
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke;
  v10[3] = &unk_25119D958;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_3;
  v9[3] = &unk_25119D980;
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

uint64_t __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_2;
  v3[3] = &unk_25119D930;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getPromptedAssessmentsWithCompletion:", v3);
}

void __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKMHPromptedAssessmentsManager registerObserver:queue:activationHandler:](self, "registerObserver:queue:activationHandler:", a3, a4, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKObserverSet *observers;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  observers = self->_observers;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke;
  v13[3] = &unk_25119D9D0;
  v13[4] = self;
  v15 = &v16;
  v12 = v10;
  v14 = v12;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v8, v9, v13);
  if (!*((_BYTE *)v17 + 24))
    (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);

  _Block_object_dispose(&v16, 8);
}

void __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v7 = v3;
    _os_log_impl(&dword_2416DD000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning observation", buf, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke_191;
  v4[3] = &unk_25119D9A8;
  objc_copyWeak(&v5, (id *)buf);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomaticProxyReconnectionHandler:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setShouldRetryOnInterruption:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_startObservingWithActivationHandler:", *(_QWORD *)(a1 + 40));
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke_191(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_25119DA60;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_2416DD000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending observation", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomaticProxyReconnectionHandler:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2;
  v7[3] = &unk_25119DA38;
  v7[4] = v4;
  return objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_0, v7);
}

uint64_t __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_194(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
    __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2_cold_1(a1);

}

- (void)_startObservingWithActivationHandler:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke;
  v10[3] = &unk_25119DA88;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2;
  v8[3] = &unk_25119DAB0;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
    __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2_cold_1(a1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
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
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_25119D958;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_25119DB00;
  v9[4] = self;
  v9[5] = &v11;
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

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_25119DAD8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
    __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2416DD000, v1, v2, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)client_promptedAssessmentsManagerDidUpdatePromptedAssessments
{
  NSObject *v3;
  int v4;
  HKMHPromptedAssessmentsManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_2416DD000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of prompted assessment update", (uint8_t *)&v4, 0xCu);
  }
  -[HKMHPromptedAssessmentsManager _notifyObserversForPromptedAssessmentUpdate](self, "_notifyObserversForPromptedAssessmentUpdate");
}

- (void)_notifyObserversForPromptedAssessmentUpdate
{
  void *v3;
  void *v4;
  HKObserverSet *observers;
  NSObject *v6;
  void *v7;
  HKObserverSet *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  HKMHPromptedAssessmentsManager *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    observers = self->_observers;
    v6 = v3;
    objc_msgSend(v4, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_2416DD000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of prompted assessment update", buf, 0x16u);

  }
  v8 = self->_observers;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__HKMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke;
  v9[3] = &unk_25119DB28;
  v9[4] = self;
  -[HKObserverSet notifyObservers:](v8, "notifyObservers:", v9);
}

uint64_t __77__HKMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "promptedAssessmentsProvidingDidUpdatePromptedAssessments:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2416DD000, v1, v2, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2416DD000, v1, v2, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_2416DD000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

@end
