@implementation HKMCExperienceStore

- (HKMCExperienceStore)initWithHealthStore:(id)a3
{
  id v4;
  HKMCExperienceStore *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  id v11;
  id v12;
  uint64_t v13;
  HKObserverSet *observers;
  uint64_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMCExperienceStore;
  v5 = -[HKMCExperienceStore init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v11 = objc_alloc_init(MEMORY[0x24BDD4030]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v5->_proxyProvider, "setTaskConfiguration:", v11);

    v12 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v13 = objc_msgSend(v12, "initWithName:loggingCategory:", CFSTR("HKMCExperienceStoreObservers"), *MEMORY[0x24BDD3030]);
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v13;

    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)registerObserver:(id)a3 completionHandler:(id)a4
{
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  void *v8;
  HKObserverSet *observers;
  OS_dispatch_queue *queue;
  id v11;
  _QWORD v12[5];
  id v13;

  proxyProvider = self->_proxyProvider;
  v7 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke;
  v12[3] = &unk_24D99D8C0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v7, queue, v12);

}

void __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_218A9C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning observation", buf, 0xCu);
  }
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_190;
  v10[3] = &unk_24D99DC00;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2;
  v8[3] = &unk_24D99DC28;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_190(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HKMCExperienceStore_unregisterObserver___block_invoke;
  v4[3] = &unk_24D99DA00;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __42__HKMCExperienceStore_unregisterObserver___block_invoke(uint64_t a1)
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
  v2 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_218A9C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HKMCExperienceStore_unregisterObserver___block_invoke_2;
  v7[3] = &unk_24D99DC90;
  v7[4] = v4;
  return objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_1, v7);
}

uint64_t __42__HKMCExperienceStore_unregisterObserver___block_invoke_194(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __42__HKMCExperienceStore_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __42__HKMCExperienceStore_unregisterObserver___block_invoke_2_cold_1();

}

- (void)fetchExperienceModelWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  HKMCExperienceStore *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_218A9C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will begin fetching experience model", buf, 0xCu);
  }
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke;
  v12[3] = &unk_24D99DC00;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke_2;
  v10[3] = &unk_24D99DC28;
  v10[4] = self;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getExperienceModelWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __58__HKMCExperienceStore_fetchExperienceModelWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __42__HKMCExperienceStore_unregisterObserver___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)persistSetupRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  HKMCExperienceStore *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received a persist record request", buf, 0xCu);
  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke;
  v16[3] = &unk_24D99DCB8;
  v17 = v6;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2;
  v14[3] = &unk_24D99DC28;
  v14[4] = self;
  v15 = v18;
  v12 = v18;
  v13 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_persistSetupRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)deleteAllPregnancySetupRecordsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  HKMCExperienceStore *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_218A9C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting all setup records", buf, 0xCu);
  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke;
  v12[3] = &unk_24D99DC00;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2;
  v10[3] = &unk_24D99DC28;
  v10[4] = self;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAllPregnancySetupRecordsWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)getCachedPregnancyModelWithError:(id *)a3
{
  NSObject *v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_218A9C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting cached model", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke;
  v12[3] = &unk_24D99DD08;
  v12[4] = &v13;
  v12[5] = &buf;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3;
  v11[3] = &unk_24D99DD30;
  v11[4] = self;
  v11[5] = &buf;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v12, v11);
  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&buf, 8);
  return v9;
}

uint64_t __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_2;
  v3[3] = &unk_24D99DCE0;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getCachedPregnancyModelWithCompletion:", v3);
}

void __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3_cold_1();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)client_experienceModelDidUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKObserverSet *observers;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of an updated experience model", buf, 0xCu);

  }
  observers = self->_observers;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__HKMCExperienceStore_client_experienceModelDidUpdate___block_invoke;
  v10[3] = &unk_24D99DD58;
  v11 = v4;
  v9 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v10);

}

uint64_t __55__HKMCExperienceStore_client_experienceModelDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "experienceModelDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __58__HKMCExperienceStore_registerObserver_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_218A9C000, v0, v1, "[%{public}@] Failed to communicate with task server when starting observation: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __42__HKMCExperienceStore_unregisterObserver___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_218A9C000, v0, v1, "[%{public}@] Failed to communicate with task server when ending observation: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __53__HKMCExperienceStore_persistSetupRecord_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_218A9C000, v0, v1, "[%{public}@] Failed to communicate with task server when writing record: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __68__HKMCExperienceStore_deleteAllPregnancySetupRecordsWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_218A9C000, v0, v1, "[%{public}@] Failed to communicate with task server when deleting records: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __56__HKMCExperienceStore_getCachedPregnancyModelWithError___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_218A9C000, v0, v1, "[%{public}@] Failed to communicate with task server when fetching cached model: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

@end
