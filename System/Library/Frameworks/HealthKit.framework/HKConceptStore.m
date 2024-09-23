@implementation HKConceptStore

+ (id)taskServerIdentifier
{
  return CFSTR("HDOntologyTaskServerIdentifier");
}

- (HKConceptStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKConceptStore)initWithHealthStore:(id)a3
{
  id v5;
  HKConceptStore *v6;
  HKConceptStore *v7;
  uint64_t v8;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v10;
  HKTaskServerProxyProvider *proxyProvider;
  HKConceptStoreServerConfiguration *v12;
  HKObserverSet *v13;
  uint64_t v14;
  HKObserverSet *conceptObservers;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKConceptStore;
  v6 = -[HKConceptStore init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_conceptIndexManagerStateLock._os_unfair_lock_opaque = 0;
    v6->_lastKnownConceptIndexManagerState = 0;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v7->_healthStore, CFSTR("HDOntologyTaskServerIdentifier"), v7, v7->_identifier);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = v10;

    -[HKProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v12 = objc_alloc_init(HKConceptStoreServerConfiguration);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v7->_proxyProvider, "setTaskConfiguration:", v12);

    v13 = [HKObserverSet alloc];
    v14 = -[HKObserverSet initWithName:loggingCategory:](v13, "initWithName:loggingCategory:", CFSTR("Concept Store Observers"), HKLogHealthRecords);
    conceptObservers = v7->_conceptObservers;
    v7->_conceptObservers = (HKObserverSet *)v14;

  }
  return v7;
}

- (void)_startObservingConceptIndexManager
{
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HKConceptStore__startObservingConceptIndexManager__block_invoke;
  aBlock[3] = &unk_1E37E6BD8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[HKConceptStore startObservingConceptIndexManagerWithCompletion:](self, "startObservingConceptIndexManagerWithCompletion:", v3);

}

void __52__HKConceptStore__startObservingConceptIndexManager__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      __52__HKConceptStore__startObservingConceptIndexManager__block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (void)startObservingConceptIndexManagerWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke;
  v10[3] = &unk_1E37F4D58;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingConceptIndexManagerWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__HKConceptStore_startObservingConceptIndexManagerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchConceptForIdentifier:(id)a3 loadRelationships:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke;
  v16[3] = &unk_1E37F4DA8;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_3;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

void __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_2;
  v5[3] = &unk_1E37F4D80;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_queryConceptByIdentifier:loadRelationships:completion:", v4, v3, v5);

}

uint64_t __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__HKConceptStore_fetchConceptForIdentifier_loadRelationships_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)countOfConceptsAssociatedToUserRecordsWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[6];
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__46;
  v26 = __Block_byref_object_dispose__46;
  v27 = 0;
  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__46;
  v20[3] = __Block_byref_object_dispose__46;
  v21 = 0;
  proxyProvider = self->_proxyProvider;
  v17[4] = &v19;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke;
  v18[3] = &unk_1E37F1898;
  v18[4] = &v22;
  v18[5] = &v19;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_3;
  v17[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v18, v17);
  v5 = (void *)v23[5];
  if (!v5)
  {
    v6 = *(id *)(v20[0] + 40);
    v7 = v6;
    if (v6)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError(v6);
    }

    _HKInitializeLogging();
    v8 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      -[HKConceptStore countOfConceptsAssociatedToUserRecordsWithError:].cold.1((uint64_t)v20, v8, v9, v10, v11, v12, v13, v14);
    v5 = (void *)v23[5];
  }
  v15 = v5;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v22, 8);
  return v15;
}

uint64_t __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_2;
  v3[3] = &unk_1E37F1870;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_queryCountOfConceptsAssociatedToUserRecordsWithCompletion:", v3);
}

void __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __66__HKConceptStore_countOfConceptsAssociatedToUserRecordsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)currentConceptIndexerState
{
  uint64_t v3;
  HKTaskServerProxyProvider *proxyProvider;
  unint64_t v5;
  _QWORD v7[6];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HKConceptStore_currentConceptIndexerState__block_invoke;
  v8[3] = &unk_1E37F4DF8;
  v8[4] = &v9;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v8, &__block_literal_global_106);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __44__HKConceptStore_currentConceptIndexerState__block_invoke_24;
  v7[3] = &unk_1E37E6958;
  v7[4] = self;
  v7[5] = &v9;
  HKWithUnfairLock(&self->_conceptIndexManagerStateLock, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __44__HKConceptStore_currentConceptIndexerState__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HKConceptStore_currentConceptIndexerState__block_invoke_2;
  v3[3] = &unk_1E37F4DD0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_currentIndexingState:", v3);
}

uint64_t __44__HKConceptStore_currentConceptIndexerState__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__HKConceptStore_currentConceptIndexerState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogHealthRecords;
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    __44__HKConceptStore_currentConceptIndexerState__block_invoke_3_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __44__HKConceptStore_currentConceptIndexerState__block_invoke_24(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (void)registerAsConceptObserver:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_conceptIndexManagerStateLock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  p_conceptIndexManagerStateLock = &self->_conceptIndexManagerStateLock;
  v11[2] = __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke;
  v11[3] = &unk_1E37E6738;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  HKWithUnfairLock(p_conceptIndexManagerStateLock, v11);

}

uint64_t __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];

  v3 = a1[4];
  v2 = a1[5];
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(void **)(v3 + 8);
  v6 = MEMORY[0x1E0C809B0];
  v7 = a1[6];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_2;
  v13[3] = &unk_1E37E6770;
  v13[4] = v3;
  objc_msgSend(v5, "registerObserver:queue:runIfFirstObserver:", v2, v7, v13);
  v9 = a1[4];
  v8 = a1[5];
  v10 = *(void **)(v9 + 8);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_3;
  v12[3] = &unk_1E37F4E40;
  v12[4] = v9;
  v12[5] = v4;
  return objc_msgSend(v10, "notifyObserver:handler:", v8, v12);
}

uint64_t __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingConceptIndexManager");
}

uint64_t __52__HKConceptStore_registerAsConceptObserver_onQueue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conceptStore:indexManagerDidChangeState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)unregisterAsConceptObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_conceptObservers, "unregisterObserver:", a3);
}

- (void)clientRemote_conceptIndexManagerDidChangeState:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke;
  v3[3] = &unk_1E37E8940;
  v3[4] = self;
  v3[5] = a3;
  HKWithUnfairLock(&self->_conceptIndexManagerStateLock, v3);
}

uint64_t __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 24) != v2)
  {
    *(_QWORD *)(v1 + 24) = v2;
    v3 = *(_QWORD *)(result + 32);
    v4 = *(_QWORD *)(result + 40);
    v5 = *(void **)(v3 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke_2;
    v6[3] = &unk_1E37F4E40;
    v6[4] = v3;
    v6[5] = v4;
    return objc_msgSend(v5, "notifyObservers:", v6);
  }
  return result;
}

uint64_t __65__HKConceptStore_clientRemote_conceptIndexManagerDidChangeState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conceptStore:indexManagerDidChangeState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FF48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_queryRelationshipsForNodeWithID_completion_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remote_queryRelationshipsForNodeWithID_completion_, 0, 1);

  return v2;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3DF0A8);
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void)connectionInvalidated
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Connection Invalidated", v1, 2u);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_conceptObservers, 0);
}

void __52__HKConceptStore__startObservingConceptIndexManager__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Unable to fetch ontology task server %@ proxy after interrupted connection with error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)countOfConceptsAssociatedToUserRecordsWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error getting count of concepts associated to user records: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __44__HKConceptStore_currentConceptIndexerState__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error fetching proxy attempting to get current concept indexer state: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
