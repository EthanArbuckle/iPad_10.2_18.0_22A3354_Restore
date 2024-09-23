@implementation HKClinicalIngestionStore

- (HKClinicalIngestionStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalIngestionStore)initWithHealthStore:(id)a3
{
  id v5;
  HKClinicalIngestionStore *v6;
  HKClinicalIngestionStore *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  id v13;
  void *v14;
  uint64_t v15;
  HKObserverSet *ingestionStateChangeObservers;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKClinicalIngestionStore;
  v6 = -[HKClinicalIngestionStore init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v9, v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    objc_initWeak(&location, v7);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __48__HKClinicalIngestionStore_initWithHealthStore___block_invoke;
    v21 = &unk_24D549C40;
    objc_copyWeak(&v22, &location);
    -[HKTaskServerProxyProvider setAutomaticProxyReconnectionHandler:](v7->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v18);
    v7->_lastKnownIngestionState = 0;
    v13 = objc_alloc(MEMORY[0x24BDD3DD0]);
    HKLogInfrastructure();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithName:loggingCategory:", CFSTR("HKClinicalIngestionStore-ingestionStateChangeObservers"), v14, v18, v19, v20, v21);
    ingestionStateChangeObservers = v7->_ingestionStateChangeObservers;
    v7->_ingestionStateChangeObservers = (HKObserverSet *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__HKClinicalIngestionStore_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:", v4);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)pingWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke;
  v9[3] = &unk_24D549C68;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __47__HKClinicalIngestionStore_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ingestHealthRecordsWithOptions:(unint64_t)a3 reason:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a4;
  v11 = a5;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke;
  v19[3] = &unk_24D549C90;
  v23 = a3;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke_2;
  v17[3] = &unk_24D549308;
  v18 = v22;
  v14 = v22;
  v15 = v11;
  v16 = v10;
  -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v19, v17);

}

uint64_t __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_ingestHealthRecordsWithOptions:reason:accountIdentifiers:completion:", a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __96__HKClinicalIngestionStore_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  -[HKClinicalIngestionStore ingestHealthRecordsWithFHIRDocumentHandle:accountIdentifier:options:completion:](self, "ingestHealthRecordsWithFHIRDocumentHandle:accountIdentifier:options:completion:", a3, a4, 0, a5);
}

- (void)ingestHealthRecordsWithFHIRDocumentHandle:(id)a3 accountIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a3;
  v11 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke;
  v19[3] = &unk_24D549C90;
  v20 = v10;
  v21 = v11;
  v23 = a5;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke_2;
  v17[3] = &unk_24D549308;
  v18 = v22;
  v14 = v22;
  v15 = v11;
  v16 = v10;
  -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v19, v17);

}

uint64_t __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_ingestHealthRecordsWithFHIRDocumentHandle:accountIdentifier:options:completion:", a1[4], a1[5], a1[7], a1[6]);
}

uint64_t __107__HKClinicalIngestionStore_ingestHealthRecordsWithFHIRDocumentHandle_accountIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)abortIngestionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueErrorHandlerWithCompletion:](self->_proxyProvider, "clientQueueErrorHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke;
  v9[3] = &unk_24D549C68;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_abortIngestionWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__HKClinicalIngestionStore_abortIngestionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetHealthRecordsLastExtractedRowIDWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke;
  v9[3] = &unk_24D549C68;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetHealthRecordsLastExtractedRowIDWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __79__HKClinicalIngestionStore_resetHealthRecordsLastExtractedRowIDWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addIngestionStateListener:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[HKClinicalIngestionStore _establishProxyConnectionIfNoObserversArePresent](self, "_establishProxyConnectionIfNoObserversArePresent");
  -[HKObserverSet registerObserver:](self->_ingestionStateChangeObservers, "registerObserver:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke;
  v6[3] = &unk_24D549CE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKClinicalIngestionStore currentIngestionStateWithCompletion:](self, "currentIngestionStateWithCompletion:", v6);

}

uint64_t __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  if (a2)
  {
    v3 = *(_QWORD *)(result + 32);
    v2 = *(_QWORD *)(result + 40);
    v4 = *(void **)(v3 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke_2;
    v5[3] = &unk_24D549CB8;
    v5[4] = v3;
    v5[5] = a2;
    return objc_msgSend(v4, "notifyObserver:handler:", v2, v5);
  }
  return result;
}

uint64_t __54__HKClinicalIngestionStore_addIngestionStateListener___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clinicalIngestionStore:ingestionStateDidUpdateTo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)removeIngestionStateListener:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_ingestionStateChangeObservers, "unregisterObserver:", a3);
}

- (void)currentIngestionStateWithCompletion:(id)a3
{
  void (**v4)(id, int64_t);
  int64_t lastKnownIngestionState;
  uint64_t v6;
  _QWORD v7[5];
  void (**v8)(id, int64_t);
  _QWORD v9[4];
  void (**v10)(id, int64_t);

  v4 = (void (**)(id, int64_t))a3;
  os_unfair_lock_lock(&self->_ivarLock);
  lastKnownIngestionState = self->_lastKnownIngestionState;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (lastKnownIngestionState)
  {
    v4[2](v4, lastKnownIngestionState);
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke;
    v9[3] = &unk_24D549C68;
    v10 = v4;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2;
    v7[3] = &unk_24D549AA8;
    v7[4] = self;
    v8 = v10;
    -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

  }
}

uint64_t __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ingestionStateWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2_cold_1(a1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)clientRemote_updateIngestionState:(int64_t)a3
{
  os_unfair_lock_s *p_ivarLock;
  HKObserverSet *ingestionStateChangeObservers;
  _QWORD v7[6];

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_lastKnownIngestionState == a3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_lastKnownIngestionState = a3;
    os_unfair_lock_unlock(p_ivarLock);
    ingestionStateChangeObservers = self->_ingestionStateChangeObservers;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__HKClinicalIngestionStore_clientRemote_updateIngestionState___block_invoke;
    v7[3] = &unk_24D549CB8;
    v7[4] = self;
    v7[5] = a3;
    -[HKObserverSet notifyObservers:](ingestionStateChangeObservers, "notifyObservers:", v7);
  }
}

uint64_t __62__HKClinicalIngestionStore_clientRemote_updateIngestionState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clinicalIngestionStore:ingestionStateDidUpdateTo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_fetchHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (id)_actionCompletionWithObjectOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke;
  v8[3] = &unk_24D549D30;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke_2;
  v14[3] = &unk_24D549D08;
  v11 = *(id *)(a1 + 40);
  v16 = v8;
  v17 = v11;
  v18 = a2;
  v15 = v7;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, v14);

}

uint64_t __69__HKClinicalIngestionStore__actionCompletionWithObjectOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_establishProxyConnectionIfNoObserversArePresent
{
  os_unfair_lock_s *p_ivarLock;
  uint64_t v4;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = -[HKObserverSet count](self->_ingestionStateChangeObservers, "count");
  os_unfair_lock_unlock(p_ivarLock);
  if (!v4)
    -[HKClinicalIngestionStore _establishProxyConnection](self, "_establishProxyConnection");
}

- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = -[HKObserverSet count](self->_ingestionStateChangeObservers, "count");
  os_unfair_lock_unlock(&self->_ivarLock);
  if (v4)
    -[HKClinicalIngestionStore _executeCheapCallOnPluginServerProxy:](self, "_executeCheapCallOnPluginServerProxy:", v5);

}

- (void)_establishProxyConnection
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke;
  v3[3] = &unk_24D549D58;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2;
  v2[3] = &unk_24D549448;
  -[HKClinicalIngestionStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v3, v2);
}

uint64_t __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeCheapCallOnPluginServerProxy:", a2);
}

void __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2_cold_1(a1);

}

- (void)_executeCheapCallOnPluginServerProxy:(id)a3
{
  id v4;

  v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
    -[HKClinicalIngestionStore _executeCheapCallOnPluginServerProxy:].cold.1((uint64_t)self);
  objc_msgSend(v4, "remote_pingWithCompletion:", &__block_literal_global_5);

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKObserverSet)ingestionStateChangeObservers
{
  return self->_ingestionStateChangeObservers;
}

- (void)setIngestionStateChangeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_ingestionStateChangeObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestionStateChangeObservers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __64__HKClinicalIngestionStore_currentIngestionStateWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_2163C4000, v1, v2, "%{public}@ failed to get current ingestion state: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __53__HKClinicalIngestionStore__establishProxyConnection__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_2163C4000, v1, v2, "%{public}@: error establishing proxy connection: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_executeCheapCallOnPluginServerProxy:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_2163C4000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: making cheap XCP call to establish connection on %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
