@implementation HKHealthRecordsStore

- (HKHealthRecordsStore)initWithHealthStore:(id)a3
{
  id v5;
  HKHealthRecordsStore *v6;
  HKHealthRecordsStore *v7;
  HKTaskServerProxyProvider *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  HKObserverSet *v14;
  uint64_t v15;
  HKObserverSet *chrSupportedStateChangeObservers;
  HKObserverSet *v17;
  uint64_t v18;
  HKObserverSet *accountsEventObservers;
  _QWORD v21[4];
  HKHealthRecordsStore *v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKHealthRecordsStore;
  v6 = -[HKHealthRecordsStore init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v9, v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v7->_lastKnownIngestionStatus = 0;
    objc_initWeak(&location, v7);
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __44__HKHealthRecordsStore_initWithHealthStore___block_invoke;
    v23[3] = &unk_1E37EDD90;
    objc_copyWeak(&v24, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v7->_proxyProvider, "setAutomaticProxyReconnectionHandler:", v23);
    v14 = [HKObserverSet alloc];
    v15 = -[HKObserverSet initWithName:loggingCategory:](v14, "initWithName:loggingCategory:", CFSTR("HKHealthRecordsStore-healthRecordsSupportedStateChangeObservers"), HKLogHealthRecords);
    chrSupportedStateChangeObservers = v7->_chrSupportedStateChangeObservers;
    v7->_chrSupportedStateChangeObservers = (HKObserverSet *)v15;

    v17 = [HKObserverSet alloc];
    v18 = -[HKObserverSet initWithName:loggingCategory:](v17, "initWithName:loggingCategory:", CFSTR("HKHealthRecordsStore-accountsEventObservers"), HKLogHealthRecords);
    accountsEventObservers = v7->_accountsEventObservers;
    v7->_accountsEventObservers = (HKObserverSet *)v18;

    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __44__HKHealthRecordsStore_initWithHealthStore___block_invoke_2;
    v21[3] = &unk_1E37EDDB8;
    v22 = v7;
    -[HKHealthRecordsStore fetchCurrentIngestionStatusWithCompletion:](v22, "fetchCurrentIngestionStatusWithCompletion:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __44__HKHealthRecordsStore_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:", v4);

}

void __44__HKHealthRecordsStore_initWithHealthStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 24))
  {
    *(_QWORD *)(v4 + 24) = a2;
    objc_msgSend(*(id *)(a1 + 32), "_withLock_notifyAccountsEventsListenerOfEvent:", a2);
    v4 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
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

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HKHealthRecordsStore_pingWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __43__HKHealthRecordsStore_pingWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __43__HKHealthRecordsStore_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__HKHealthRecordsStore_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchClinicalConnectedAccountsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchClinicalConnectedAccountsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLogoForBrand:(id)a3 scale:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke;
  v17[3] = &unk_1E37EDE08;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchLogoForBrand:scale:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerAccountsEventListener:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  id v5;

  p_ivarLock = &self->_ivarLock;
  v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  objc_msgSend(v5, "healthRecordsStore:observedAccountsEvent:", self, self->_lastKnownIngestionStatus);
  -[HKObserverSet registerObserver:queue:](self->_accountsEventObservers, "registerObserver:queue:", v5, 0);

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)removeAccountsEventListener:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_accountsEventObservers, "unregisterObserver:", a3);
}

- (void)_withLock_notifyAccountsEventsListenerOfEvent:(unint64_t)a3
{
  HKObserverSet *accountsEventObservers;
  _QWORD v6[6];

  os_unfair_lock_assert_owner(&self->_ivarLock);
  accountsEventObservers = self->_accountsEventObservers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HKHealthRecordsStore__withLock_notifyAccountsEventsListenerOfEvent___block_invoke;
  v6[3] = &unk_1E37EDE30;
  v6[4] = self;
  v6[5] = a3;
  -[HKObserverSet notifyObservers:](accountsEventObservers, "notifyObservers:", v6);
}

uint64_t __70__HKHealthRecordsStore__withLock_notifyAccountsEventsListenerOfEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "healthRecordsStore:observedAccountsEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fetchCurrentIngestionStatusWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke;
  v14[3] = &unk_1E37E8C88;
  v7 = v4;
  v15 = v7;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", v14);
  v11 = v7;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_2;
  v12[3] = &unk_1E37EDDE0;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3;
  v10[3] = &unk_1E37E69F8;
  v10[4] = self;
  v8 = v7;
  v9 = v13;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, void *, uint64_t);
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v4 = objc_msgSend(a2, "integerValue");
    if ((unint64_t)(v4 - 1) >= 5)
      a2 = 0;
    else
      a2 = (void *)v4;
    v5 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    v6 = v3;
    a3 = 0;
  }
  else
  {
    v5 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    v6 = *(_QWORD *)(a1 + 32);
  }
  return v5(v6, a2, a3);
}

uint64_t __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_currentIngestionStatusWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3_cold_1(a1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)clientRemote_healthRecordsAccountsEventObserved:(unint64_t)a3
{
  void *v5;

  _HKInitializeLogging();
  v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    -[HKHealthRecordsStore clientRemote_healthRecordsAccountsEventObserved:].cold.1((uint64_t)self, a3, v5);
  os_unfair_lock_lock(&self->_ivarLock);
  if (a3 - 1 <= 1)
    self->_lastKnownIngestionStatus = a3;
  -[HKHealthRecordsStore _withLock_notifyAccountsEventsListenerOfEvent:](self, "_withLock_notifyAccountsEventsListenerOfEvent:", a3);
  os_unfair_lock_unlock(&self->_ivarLock);
}

- (void)fetchRawSourceStringForHealthRecord:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke;
  v13[3] = &unk_1E37EDE58;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRawSourceStringForHealthRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchExportedPropertiesForHealthRecord:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke;
  v13[3] = &unk_1E37EDE58;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchExportedPropertiesForHealthRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchFHIRJSONDocumentWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke;
  v13[3] = &unk_1E37EDE58;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchFHIRJSONDocumentWithAccountIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stringifyExtractionFailureReasonsForRecord:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  _QWORD v9[4];
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall"))
  {
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke;
    v11[3] = &unk_1E37EDE58;
    v12 = v6;
    v13 = v7;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke_2;
    v9[3] = &unk_1E37E6B38;
    v10 = v13;
    -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v11, v9);

  }
  else
  {
    v7[2](v7, MEMORY[0x1E0C9AA60], 0);
  }

}

uint64_t __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stringifyExtractionFailureReasonsForRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke;
  v11[3] = &unk_1E37EDE80;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke_2;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerClinicalOptInDataCollectionForReason:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetClinicalOptInDataCollectionAnchorsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchClinicalOptInDataCollectionFilePathsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchClinicalOptInDataCollectionFilePathsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  unint64_t v16;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke;
  v13[3] = &unk_1E37EDEA8;
  v15 = a3;
  v16 = a4;
  v14 = v8;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v10 = v14;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerClinicalContentAnalyticsForReason:options:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerHealthCloudUploadWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKHealthRecordsStore _actionCompletionWithObjectOnClientQueue:](self, "_actionCompletionWithObjectOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerHealthCloudUploadWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke;
  v9[3] = &unk_1E37EDDE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetClinicalContentAnalyticsAnchorsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addHealthRecordsSupportedChangeListener:(id)a3
{
  -[HKObserverSet registerObserver:](self->_chrSupportedStateChangeObservers, "registerObserver:", a3);
}

- (void)removeHealthRecordsSupportedChangeListener:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_chrSupportedStateChangeObservers, "unregisterObserver:", a3);
}

- (void)clientRemote_healthRecordsSupportedDidChangeTo:(BOOL)a3
{
  NSObject *v5;
  HKObserverSet *chrSupportedStateChangeObservers;
  _QWORD v7[5];
  BOOL v8;

  _HKInitializeLogging();
  v5 = HKLogHealthRecords;
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    -[HKHealthRecordsStore clientRemote_healthRecordsSupportedDidChangeTo:].cold.1((uint64_t)self, a3, v5);
  chrSupportedStateChangeObservers = self->_chrSupportedStateChangeObservers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HKHealthRecordsStore_clientRemote_healthRecordsSupportedDidChangeTo___block_invoke;
  v7[3] = &unk_1E37EDED0;
  v7[4] = self;
  v8 = a3;
  -[HKObserverSet notifyObservers:](chrSupportedStateChangeObservers, "notifyObservers:", v7);
}

uint64_t __71__HKHealthRecordsStore_clientRemote_healthRecordsSupportedDidChangeTo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "healthRecordsStore:healthRecordsSupportedDidChangeTo:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "_isApplication") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthRecordsStore.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[source _isApplication]"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke;
  v16[3] = &unk_1E37EDE58;
  v17 = v7;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v11 = v18;
  v12 = v7;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "_isApplication") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthRecordsStore.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[source _isApplication]"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke;
  v16[3] = &unk_1E37EDE58;
  v17 = v7;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v11 = v18;
  v12 = v7;
  -[HKHealthRecordsStore _fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:](self, "_fetchHealthRecordsPluginServerProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_getSynchronousHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](self->_proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", a3, a4);
}

- (id)_actionCompletionWithObjectOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke;
  v8[3] = &unk_1E37EDEF8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
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
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke_2;
  v14[3] = &unk_1E37EA9C8;
  v11 = *(id *)(a1 + 40);
  v16 = v8;
  v17 = v11;
  v18 = a2;
  v15 = v7;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, v14);

}

uint64_t __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void (**unitTesting_didCallReestablishProxyConnectionIfObserversArePresent)(void);
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = -[HKObserverSet count](self->_chrSupportedStateChangeObservers, "count");
  v5 = -[HKObserverSet count](self->_accountsEventObservers, "count");
  os_unfair_lock_unlock(&self->_ivarLock);
  if (v4 + v5)
  {
    -[HKHealthRecordsStore _executeCheapCallOnPluginServerProxy:](self, "_executeCheapCallOnPluginServerProxy:", v7);
    unitTesting_didCallReestablishProxyConnectionIfObserversArePresent = (void (**)(void))self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
    if (unitTesting_didCallReestablishProxyConnectionIfObserversArePresent)
      unitTesting_didCallReestablishProxyConnectionIfObserversArePresent[2]();
  }

}

- (void)_executeCheapCallOnPluginServerProxy:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    -[HKHealthRecordsStore _executeCheapCallOnPluginServerProxy:].cold.1((uint64_t)self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke;
  v5[3] = &unk_1E37E6BD8;
  v5[4] = self;
  objc_msgSend(v4, "remote_pingWithCompletion:", v5);

}

void __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke_cold_1(a1);
  }

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKObserverSet)chrSupportedStateChangeObservers
{
  return self->_chrSupportedStateChangeObservers;
}

- (void)setChrSupportedStateChangeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_chrSupportedStateChangeObservers, a3);
}

- (HKObserverSet)accountsEventObservers
{
  return self->_accountsEventObservers;
}

- (void)setAccountsEventObservers:(id)a3
{
  objc_storeStrong((id *)&self->_accountsEventObservers, a3);
}

- (id)unitTesting_didCallReestablishProxyConnectionIfObserversArePresent
{
  return self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
}

- (void)setUnitTesting_didCallReestablishProxyConnectionIfObserversArePresent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent, 0);
  objc_storeStrong((id *)&self->_accountsEventObservers, 0);
  objc_storeStrong((id *)&self->_chrSupportedStateChangeObservers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "%{public}@: failed to fetch server proxy and determine current accounts ingestion status: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)clientRemote_healthRecordsAccountsEventObserved:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  const __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a2 - 1) > 4)
    v3 = CFSTR("unknown");
  else
    v3 = off_1E37EDF18[a2 - 1];
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  v4 = a3;
  OUTLINED_FUNCTION_3_2(&dword_19A0E6000, v4, v5, "%{public}@: health records accounts event observed: %{public}@", (uint8_t *)&v6);

}

- (void)clientRemote_healthRecordsSupportedDidChangeTo:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1026;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_19A0E6000, log, OS_LOG_TYPE_DEBUG, "%{public}@: health records supported did change to: %{public}d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)_executeCheapCallOnPluginServerProxy:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_2(&dword_19A0E6000, v1, (uint64_t)v1, "%{public}@: making cheap XCP call to establish connection on %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "%{public}@: cheap XPC call didn't return YES, error: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

@end
