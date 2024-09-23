@implementation HKUserDomainConceptStore

- (HKUserDomainConceptStore)init
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

- (HKUserDomainConceptStore)initWithHealthStore:(id)a3
{
  id v4;
  HKUserDomainConceptStore *v5;
  uint64_t v6;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKUserDomainConceptStore;
  v5 = -[HKUserDomainConceptStore init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("HKUserDomainConceptStoreServerIdentifier"), v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = v8;

    objc_initWeak(&location, v5);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __48__HKUserDomainConceptStore_initWithHealthStore___block_invoke;
    v14 = &unk_1E37E95B8;
    objc_copyWeak(&v15, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v5->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v11);
    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 1, v11, v12, v13, v14);
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __48__HKUserDomainConceptStore_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)saveOrUpdateUserDomainConcepts:(id)a3 completion:(id)a4
{
  -[HKUserDomainConceptStore _storeUserDomainConcepts:method:completion:](self, "_storeUserDomainConcepts:method:completion:", a3, 1, a4);
}

- (void)saveOrUpdateUserDomainConcept:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUserDomainConceptStore saveOrUpdateUserDomainConcepts:completion:](self, "saveOrUpdateUserDomainConcepts:completion:", v9, v7, v10, v11);
}

- (void)deleteUserDomainConcept:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUserDomainConceptStore _storeUserDomainConcepts:method:completion:](self, "_storeUserDomainConcepts:method:completion:", v9, 3, v7, v10, v11);
}

- (void)deleteUserDomainConcepts:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  HKUserDomainConceptStore *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: deleteUserDomainConcepts: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[HKUserDomainConceptStore _storeUserDomainConcepts:method:completion:](self, "_storeUserDomainConcepts:method:completion:", v6, 3, v7);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__HKUserDomainConceptStore_setDelegate___block_invoke;
  v6[3] = &unk_1E37E6BD8;
  v7 = v4;
  v5 = v4;
  -[HKUserDomainConceptStore setDelegate:completion:](self, "setDelegate:completion:", v5, v6);

}

void __40__HKUserDomainConceptStore_setDelegate___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      HKStringFromBool(*(_QWORD *)(a1 + 32) != 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Error changing shouldObserve to '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (HKUserDomainConceptStoreDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HKUserDomainConceptStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3 completion:(id)a4
{
  os_unfair_lock_s *p_lock;
  void (**v7)(id, uint64_t, _QWORD);
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  id obj;

  p_lock = &self->_lock;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  obj = a3;
  os_unfair_lock_lock(p_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (obj != 0) ^ (WeakRetained == 0);

  v10 = objc_storeWeak((id *)&self->_delegate, obj);
  v11 = v10;
  os_unfair_lock_unlock(p_lock);
  if ((v9 & 1) != 0)
    v7[2](v7, 1, 0);
  else
    -[HKUserDomainConceptStore _observeUserDomainConceptChanges:completion:](self, "_observeUserDomainConceptChanges:completion:", obj != 0, v7);

}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void)client_notifyForChangesToUserDomainConcepts:(id)a3 changeType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HKUserDomainConceptStore_client_notifyForChangesToUserDomainConcepts_changeType___block_invoke;
  block[3] = &unk_1E37E69A8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

uint64_t __83__HKUserDomainConceptStore_client_notifyForChangesToUserDomainConcepts_changeType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_notifyForChangesToUserDomainConcepts:changeType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EA48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_storeUserDomainConcepts_method_completion_, 0, 0);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_createAndStoreUserDomainConceptWithConceptIdentifier_additionalProperties_userDomainConceptTypeIdentifier_completion_, 1, 0);
  return v2;
}

+ (id)clientInterface
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B95F0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_notifyForChangesToUserDomainConcepts_changeType_, 0, 0);
  return v2;
}

- (void)_handleAutomaticProxyReconnection
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_storeUserDomainConcepts:(id)a3 method:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke;
  v16[3] = &unk_1E37EB548;
  v16[4] = self;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke_75;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

void __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(*(id *)(a1 + 40), "count");
      HKStringFromUserDomainConceptStoreMethod(*(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2048;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "%{public}@: Store %ld concepts with method '%@'", (uint8_t *)&v10, 0x20u);

    }
  }
  objc_msgSend(v3, "remote_storeUserDomainConcepts:method:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

uint64_t __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_observeUserDomainConceptChanges:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke;
  v12[3] = &unk_1E37EB570;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeUserDomainConceptChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_synchronouslyObserveUserDomainConceptChanges:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  char v7;
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
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke;
  v10[3] = &unk_1E37EB598;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_2;
  v3[3] = &unk_1E37E9020;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeUserDomainConceptChanges:completion:", 1, v3);
}

void __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_clientQueue_notifyForChangesToUserDomainConcepts:(id)a3 changeType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  HKUserDomainConceptStore *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HKUserDomainConceptStore delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogHealthOntology();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v6, "count");
      HKStringFromUserDomainConceptStoreChangeType(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = self;
      v16 = 2048;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_INFO, "%{public}@: Received %ld changes of type %@", (uint8_t *)&v14, 0x20u);

    }
  }
  switch(a4)
  {
    case 3:
      objc_msgSend(v8, "userDomainConceptStore:didDeleteUserDomainConcepts:", self, v6);
      break;
    case 2:
      objc_msgSend(v8, "userDomainConceptStore:didUpdateUserDomainConcepts:", self, v6);
      break;
    case 1:
      objc_msgSend(v8, "userDomainConceptStore:didAddUserDomainConcepts:", self, v6);
      break;
  }

}

- (void)_createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier:(id)a3 supplementaryProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HKTaskServerProxyProvider *proxyProvider;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke;
  v23[3] = &unk_1E37EB5C0;
  v23[4] = self;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke_77;
  v21[3] = &unk_1E37E6B38;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v23, v21);

}

void __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(*(id *)(a1 + 40), "rawIdentifier");
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "%{public}@: creating and storing user domain concept with identifier %lld", (uint8_t *)&v9, 0x16u);
    }

  }
  objc_msgSend(v3, "remote_createAndStoreUserDomainConceptWithConceptIdentifier:additionalProperties:userDomainConceptTypeIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
