@implementation HKSharingAuthorizationRecipientStore

- (HKSharingAuthorizationRecipientStore)initWithHealthStore:(id)a3 sharingAuthorizations:(id)a4
{
  id v7;
  id v8;
  HKSharingAuthorizationRecipientStore *v9;
  HKSharingAuthorizationRecipientStore *v10;
  uint64_t v11;
  NSArray *sharingAuthorizations;
  uint64_t v13;
  NSArray *authorizationIdentifiers;
  HKTaskServerProxyProvider *v15;
  HKHealthStore *healthStore;
  void *v17;
  uint64_t v18;
  HKTaskServerProxyProvider *proxyProvider;
  HKSharingAuthorizationRecipientStoreTaskConfiguration *v20;
  HKObserverSet *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HKObserverSet *observers;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HKSharingAuthorizationRecipientStore;
  v9 = -[HKSharingAuthorizationRecipientStore init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v11 = objc_msgSend(v8, "copy");
    sharingAuthorizations = v10->_sharingAuthorizations;
    v10->_sharingAuthorizations = (NSArray *)v11;

    HKAuthorizationIdentifiersFromSharingAuthorizations(v8);
    v13 = objc_claimAutoreleasedReturnValue();
    authorizationIdentifiers = v10->_authorizationIdentifiers;
    v10->_authorizationIdentifiers = (NSArray *)v13;

    v15 = [HKTaskServerProxyProvider alloc];
    healthStore = v10->_healthStore;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v15, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HKSharingAuthorizationRecipientStoreServerIdentifier"), v10, v17);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v18;

    v20 = objc_alloc_init(HKSharingAuthorizationRecipientStoreTaskConfiguration);
    -[HKSharingAuthorizationRecipientStoreTaskConfiguration setSharingAuthorizations:](v20, "setSharingAuthorizations:", v10->_sharingAuthorizations);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v20);
    v21 = [HKObserverSet alloc];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogSharing();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HKObserverSet initWithName:loggingCategory:](v21, "initWithName:loggingCategory:", v23, v24);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v25;

  }
  return v10;
}

- (void)fetchRecipientIdentifiersByAuthorizationWithCompletion:(id)a3
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
  v10[2] = __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke;
  v10[3] = &unk_1E37EA780;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRecipientIdentifiersWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2_cold_1();

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
  v8[2] = __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke;
  v8[3] = &unk_1E37E6770;
  v8[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v6, v7, v8);

}

void __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke(uint64_t a1)
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
  v4 = __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke_2;
  v5 = &unk_1E37E95B8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAutomaticProxyReconnectionHandler:", &v2);
  objc_msgSend(*(id *)(a1 + 32), "_registerRemoteObservers", v2, v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__HKSharingAuthorizationRecipientStore_addObserver___block_invoke_2(uint64_t a1)
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
  v4[2] = __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAutomaticProxyReconnectionHandler:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3;
  v5[3] = &unk_1E37E6A70;
  v5[4] = v2;
  return objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_17, v5);
}

uint64_t __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unregisterObservers");
}

void __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3_cold_1();

}

- (void)clientRemote_didAddRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4
{
  id v6;
  id v7;
  HKObserverSet *observers;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  observers = self->_observers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__HKSharingAuthorizationRecipientStore_clientRemote_didAddRecipientIdentifier_sharingAuthorizations___block_invoke;
  v11[3] = &unk_1E37EA7E8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v11);

}

uint64_t __101__HKSharingAuthorizationRecipientStore_clientRemote_didAddRecipientIdentifier_sharingAuthorizations___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sharingAuthorizationRecipientStore:didAddRecipientIdentifier:sharingAuthorizations:", a1[4], a1[5], a1[6]);
}

- (void)clientRemote_didRemoveRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4
{
  id v6;
  id v7;
  HKObserverSet *observers;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  observers = self->_observers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__HKSharingAuthorizationRecipientStore_clientRemote_didRemoveRecipientIdentifier_sharingAuthorizations___block_invoke;
  v11[3] = &unk_1E37EA7E8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v11);

}

uint64_t __104__HKSharingAuthorizationRecipientStore_clientRemote_didRemoveRecipientIdentifier_sharingAuthorizations___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sharingAuthorizationRecipientStore:didRemoveRecipientIdentifier:sharingAuthorizations:", a1[4], a1[5], a1[6]);
}

- (void)clientRemote_didRevokeRecipientIdentifier:(id)a3
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
  v7[2] = __82__HKSharingAuthorizationRecipientStore_clientRemote_didRevokeRecipientIdentifier___block_invoke;
  v7[3] = &unk_1E37EA810;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __82__HKSharingAuthorizationRecipientStore_clientRemote_didRevokeRecipientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharingAuthorizationRecipientStore:didRevokeRecipientIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_registerRemoteObservers
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];

  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2;
  v3[3] = &unk_1E37E6A70;
  v3[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_13, v3);
}

uint64_t __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerObservers");
}

void __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2_cold_1();

}

+ (id)clientInterface
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E748);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didAddRecipientIdentifier_sharingAuthorizations_, 1, 0);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didRemoveRecipientIdentifier_sharingAuthorizations_, 1, 0);
  return v2;
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E7A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remote_fetchRecipientIdentifiersWithCompletion_, 0, 1);

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

- (NSArray)authorizationIdentifiers
{
  return self->_authorizationIdentifiers;
}

- (NSArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
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
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
}

void __95__HKSharingAuthorizationRecipientStore_fetchRecipientIdentifiersByAuthorizationWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error fetching recipient identifiers %{public}@");
  OUTLINED_FUNCTION_3();
}

void __55__HKSharingAuthorizationRecipientStore_removeObserver___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error unregistering observers %{public}@");
  OUTLINED_FUNCTION_3();
}

void __64__HKSharingAuthorizationRecipientStore__registerRemoteObservers__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error registering observers %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
