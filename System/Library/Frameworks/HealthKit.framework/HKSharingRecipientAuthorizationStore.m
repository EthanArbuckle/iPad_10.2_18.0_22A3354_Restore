@implementation HKSharingRecipientAuthorizationStore

- (HKSharingRecipientAuthorizationStore)initWithHealthStore:(id)a3 recipientIdentifier:(id)a4
{
  id v7;
  id v8;
  HKSharingRecipientAuthorizationStore *v9;
  HKSharingRecipientAuthorizationStore *v10;
  uint64_t v11;
  HKSharingRecipientIdentifier *recipientIdentifier;
  HKTaskServerProxyProvider *v13;
  HKHealthStore *healthStore;
  void *v15;
  uint64_t v16;
  HKTaskServerProxyProvider *proxyProvider;
  HKSharingRecipientAuthorizationStoreTaskConfiguration *v18;
  HKObserverSet *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HKObserverSet *observers;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HKSharingRecipientAuthorizationStore;
  v9 = -[HKSharingRecipientAuthorizationStore init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v11 = objc_msgSend(v8, "copy");
    recipientIdentifier = v10->_recipientIdentifier;
    v10->_recipientIdentifier = (HKSharingRecipientIdentifier *)v11;

    v13 = [HKTaskServerProxyProvider alloc];
    healthStore = v10->_healthStore;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v13, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HKSharingRecipientAuthorizationStoreServerIdentifier"), v10, v15);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v16;

    v18 = objc_alloc_init(HKSharingRecipientAuthorizationStoreTaskConfiguration);
    -[HKSharingRecipientAuthorizationStoreTaskConfiguration setRecipientIdentifier:](v18, "setRecipientIdentifier:", v10->_recipientIdentifier);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v18);
    v19 = [HKObserverSet alloc];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogSharing();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HKObserverSet initWithName:loggingCategory:](v19, "initWithName:loggingCategory:", v21, v22);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v23;

  }
  return v10;
}

- (void)fetchSharingAuthorizationsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke;
  v10[3] = &unk_1E37F31D8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingAuthorizationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchSharingAuthorizationsMarkedForDeletionWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke;
  v10[3] = &unk_1E37F31D8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingAuthorizationsMarkedForDeletionWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addSharingAuthorizations:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke;
  v14[3] = &unk_1E37F3200;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addSharingAuthorizations:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeSharingAuthorizations:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke;
  v14[3] = &unk_1E37F3200;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeSharingAuthorizations:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)revokeWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke;
  v10[3] = &unk_1E37F31D8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_revokeWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addObserver:(id)a3
{
  HKObserverSet *observers;
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  void *v7;
  _QWORD v8[5];

  proxyProvider = self->_proxyProvider;
  observers = self->_observers;
  v6 = a3;
  -[HKProxyProvider clientQueue](proxyProvider, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke;
  v8[3] = &unk_1E37E6770;
  v8[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v6, v7, v8);

}

void __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void *v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v3 = 3221225472;
  v4 = __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke_2;
  v5 = &unk_1E37E95B8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutomaticProxyReconnectionHandler:", &v2);
  objc_msgSend(*(id *)(a1 + 32), "_registerRemoteObservers", v2, v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__HKSharingRecipientAuthorizationStore_addObserver___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_registerRemoteObservers");

}

- (void)removeObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutomaticProxyReconnectionHandler:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3;
  v5[3] = &unk_1E37E6A70;
  v5[4] = v2;
  return objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_96, v5);
}

uint64_t __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unregisterObservers");
}

void __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3_cold_1();

}

+ (id)clientInterface
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FD08);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didAddSharingAuthorizations_, 0, 0);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didRemoveSharingAuthorizations_, 0, 0);
  return v2;
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FD68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchSharingAuthorizationsWithCompletion_, 0, 1);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addSharingAuthorizations_completion_, 0, 0);
  v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_removeSharingAuthorizations_completion_, 0, 0);
  return v2;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void)clientRemote_didAddSharingAuthorizations:(id)a3
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
  v7[2] = __81__HKSharingRecipientAuthorizationStore_clientRemote_didAddSharingAuthorizations___block_invoke;
  v7[3] = &unk_1E37F3268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __81__HKSharingRecipientAuthorizationStore_clientRemote_didAddSharingAuthorizations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingRecipientAuthorizationStore:didAddSharingAuthorizations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)clientRemote_didRemoveSharingAuthorizations:(id)a3
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
  v7[2] = __84__HKSharingRecipientAuthorizationStore_clientRemote_didRemoveSharingAuthorizations___block_invoke;
  v7[3] = &unk_1E37F3268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __84__HKSharingRecipientAuthorizationStore_clientRemote_didRemoveSharingAuthorizations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingRecipientAuthorizationStore:didRemoveSharingAuthorizations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)clientRemote_wasRevoked
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__HKSharingRecipientAuthorizationStore_clientRemote_wasRevoked__block_invoke;
  v3[3] = &unk_1E37F3290;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __63__HKSharingRecipientAuthorizationStore_clientRemote_wasRevoked__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingRecipientAuthorizationWasRevokedForStore:", *(_QWORD *)(a1 + 32));
}

- (void)_registerRemoteObservers
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];

  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2;
  v3[3] = &unk_1E37E6A70;
  v3[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_80_0, v3);
}

uint64_t __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerObservers");
}

void __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2_cold_1();

}

- (HKSharingRecipientIdentifier)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
}

void __81__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error fetching sharing authorizations %{public}@");
  OUTLINED_FUNCTION_3();
}

void __98__HKSharingRecipientAuthorizationStore_fetchSharingAuthorizationsMarkedForDeletionWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error fetching sharing authorizations marked for deletion %{public}@");
  OUTLINED_FUNCTION_3();
}

void __76__HKSharingRecipientAuthorizationStore_addSharingAuthorizations_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Error adding sharing authorizations %{public}@");
  OUTLINED_FUNCTION_3();
}

void __79__HKSharingRecipientAuthorizationStore_removeSharingAuthorizations_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Error removing sharing authorizations %{public}@");
  OUTLINED_FUNCTION_3();
}

void __61__HKSharingRecipientAuthorizationStore_revokeWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Error revoking sharing authorizations %{public}@");
  OUTLINED_FUNCTION_3();
}

void __55__HKSharingRecipientAuthorizationStore_removeObserver___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error unregistering observers %{public}@");
  OUTLINED_FUNCTION_3();
}

void __64__HKSharingRecipientAuthorizationStore__registerRemoteObservers__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error registering observers %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
