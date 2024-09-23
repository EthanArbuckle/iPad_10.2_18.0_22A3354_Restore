@implementation VSIdentityProviderInfoCenter

+ (id)sharedCenter
{
  if (sharedCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedCenter___vs_lazy_init_predicate, &__block_literal_global_29);
  return (id)sharedCenter___vs_lazy_init_variable;
}

void __44__VSIdentityProviderInfoCenter_sharedCenter__block_invoke()
{
  VSIdentityProviderInfoCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSIdentityProviderInfoCenter);
  v1 = (void *)sharedCenter___vs_lazy_init_variable;
  sharedCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSIdentityProviderInfoCenter)init
{
  VSIdentityProviderInfoCenter *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  NSOperationQueue *v6;
  NSOperationQueue *privateQueue;
  VSPreferences *v8;
  VSPreferences *preferences;
  uint64_t v10;
  VSDevice *device;
  uint64_t v12;
  VSAccountStore *accountStore;
  id newIdentityProviderFetchAllOperationBlock;
  id newIdentityProviderFetchOperationBlock;
  VSRemoteNotifier *v16;
  VSRemoteNotifier *remoteNotifier;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VSIdentityProviderInfoCenter;
  v2 = -[VSIdentityProviderInfoCenter init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange, CFSTR("VSAccountStoreDidChangeNotification"), 0);

    v4 = dispatch_queue_create("IdentityProviderInfoCenter", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v6;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSIdentityProviderInfoCenter"));
    v8 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v8;

    +[VSDevice currentDevice](VSDevice, "currentDevice");
    v10 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (VSDevice *)v10;

    +[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore");
    v12 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (VSAccountStore *)v12;

    newIdentityProviderFetchAllOperationBlock = v2->_newIdentityProviderFetchAllOperationBlock;
    v2->_newIdentityProviderFetchAllOperationBlock = &__block_literal_global_45;

    newIdentityProviderFetchOperationBlock = v2->_newIdentityProviderFetchOperationBlock;
    v2->_newIdentityProviderFetchOperationBlock = &__block_literal_global_50;

    v16 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSDeveloperServiceDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v16;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
  }
  return v2;
}

id __36__VSIdentityProviderInfoCenter_init__block_invoke()
{
  int v0;
  id v1;
  id v2;
  NSObject *v3;
  id v5;

  v5 = 0;
  v0 = VSLoadInterfaceFramework((uint64_t)&v5);
  v1 = v5;
  if (v0)
  {
    v2 = objc_alloc_init(NSClassFromString((NSString *)CFSTR("VSIdentityProviderFetchAllOperation")));
  }
  else
  {
    VSErrorLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __36__VSIdentityProviderInfoCenter_init__block_invoke_cold_1();

    v2 = 0;
  }

  return v2;
}

id __36__VSIdentityProviderInfoCenter_init__block_invoke_48(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;

  v2 = a2;
  v8 = 0;
  v3 = VSLoadInterfaceFramework((uint64_t)&v8);
  v4 = v8;
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("VSIdentityProviderFetchOperation"))), "initWithIdentityProviderID:", v2);
  }
  else
  {
    VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __36__VSIdentityProviderInfoCenter_init__block_invoke_cold_1();

    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VSAccountStoreDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderInfoCenter;
  -[VSIdentityProviderInfoCenter dealloc](&v4, sel_dealloc);
}

- (void)enqueueInfoQueryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E939F3B0;
  aBlock[4] = self;
  v6 = v4;
  v12 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[VSIdentityProviderInfoCenter setupCompleted](self, "setupCompleted")
    && (-[VSIdentityProviderInfoCenter currentError](self, "currentError"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v7[2](v7);
  }
  else
  {
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke_2;
    v9[3] = &unk_1E939F3B0;
    v9[4] = self;
    v10 = v7;
    -[VSIdentityProviderInfoCenter _refresh:](self, "_refresh:", v9);

  }
}

void __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  VSIdentityProviderInfoQueryResult *v7;

  objc_msgSend(*(id *)(a1 + 32), "currentError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentError");
    v7 = (VSIdentityProviderInfoQueryResult *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, VSIdentityProviderInfoQueryResult *))(v3 + 16))(v3, 0, v7);
LABEL_5:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "cachedIdentityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = objc_alloc_init(VSIdentityProviderInfoQueryResult);
    objc_msgSend(*(id *)(a1 + 32), "cachedIdentityProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderInfoQueryResult setIdentityProvider:](v7, "setIdentityProvider:", v5);

    objc_msgSend(*(id *)(a1 + 32), "cachedDesignatedAppBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderInfoQueryResult setDesignatedAppBundleIdentifier:](v7, "setDesignatedAppBundleIdentifier:", v6);

    (*(void (**)(_QWORD, VSIdentityProviderInfoQueryResult *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, 0);
    goto LABEL_5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSetupCompleted:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)enqueueSetTopBoxProfileProviderQueryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSIdentityProviderInfoCenter device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke;
  v7[3] = &unk_1E93A00E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchSetTopBoxProfileWithCompletion:", v7);

}

void __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke_2;
    v5[3] = &unk_1E93A00C0;
    v4 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_identityProviderForSetTopBoxProfile:completion:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enqueueIdentityProviderAppsQueryWithCompletion:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v17 = 0;
  v5 = VSLoadInterfaceFramework((uint64_t)&v17);
  v6 = v17;
  if (v5)
  {
    v7 = objc_alloc_init(NSClassFromString((NSString *)CFSTR("VSIdentityProviderFetchAllOperation")));
    v8 = (void *)MEMORY[0x1E0CB34C8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke;
    v14[3] = &unk_1E939F3B0;
    v15 = v7;
    v16 = v4;
    v9 = v7;
    objc_msgSend(v8, "blockOperationWithBlock:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addDependency:", v9);
    -[VSIdentityProviderInfoCenter privateQueue](self, "privateQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v9);

    -[VSIdentityProviderInfoCenter privateQueue](self, "privateQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v10);

  }
  else
  {
    VSErrorLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VSIdentityProviderInfoCenter enqueueIdentityProviderAppsQueryWithCompletion:].cold.1();

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_2;
  v7[3] = &unk_1E939F388;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3;
  v5[3] = &unk_1E939F2C0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "unwrapObject:error:", v7, v5);

}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v16 = a1;
  v28 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v8, "nonChannelAppDescriptions", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "adamID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "stringValue");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
                objc_msgSend(v3, "addObject:", v15);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(v16 + 32) + 16))();
}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enqueueSetTopBoxInfoQueryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSIdentityProviderInfoCenter device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke;
  v7[3] = &unk_1E93A00E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchSetTopBoxProfileWithCompletion:", v7);

}

void __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = v5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke_2;
    v9[3] = &unk_1E93A0110;
    v10 = v7;
    v8 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_identityProviderForSetTopBoxProfile:completion:", v7, v9);

  }
}

void __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  VSSetTopBoxInfoQueryResult *v4;

  v3 = a2;
  v4 = objc_alloc_init(VSSetTopBoxInfoQueryResult);
  -[VSSetTopBoxInfoQueryResult setSetTopBoxProvider:](v4, "setSetTopBoxProvider:", v3);

  -[VSSetTopBoxInfoQueryResult setProfile:](v4, "setProfile:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enqueueManagedSetTopBoxInfoQueryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSIdentityProviderInfoCenter device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke;
  v7[3] = &unk_1E93A0138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchDeviceManagedSetTopBoxProfileWithCompletion:", v7);

}

void __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke_2;
    v7[3] = &unk_1E93A0110;
    v8 = v5;
    v6 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_identityProviderForSetTopBoxProfile:completion:", v5, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  VSSetTopBoxInfoQueryResult *v4;

  v3 = a2;
  v4 = objc_alloc_init(VSSetTopBoxInfoQueryResult);
  -[VSSetTopBoxInfoQueryResult setSetTopBoxProvider:](v4, "setSetTopBoxProvider:", v3);

  -[VSSetTopBoxInfoQueryResult setProfile:](v4, "setProfile:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_identityProviderForSetTopBoxProfile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderInfoCenter newIdentityProviderFetchAllOperationBlock](self, "newIdentityProviderFetchAllOperationBlock");
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v9[2]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke;
    v17 = &unk_1E93A0188;
    v18 = v11;
    v19 = v8;
    v20 = v6;
    v21 = v7;
    VSMainThreadOperationWithBlock(&v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addDependency:", v11, v14, v15, v16, v17);
    -[VSIdentityProviderInfoCenter privateQueue](self, "privateQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v11);

    VSEnqueueCompletionOperation(v12);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_2;
  v7[3] = &unk_1E93A0160;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_3;
  v5[3] = &unk_1E939F2C0;
  v6 = a1[7];
  objc_msgSend(v4, "unwrapObject:error:", v7, v5);

}

void __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "uniqueID", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "forceUnwrapObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

        if (v10)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (objc_msgSend(*(id *)(a1 + 40), "isDeveloper"))
    objc_msgSend(v4, "setIsSetTopBoxSupported:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_accountStoreDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__VSIdentityProviderInfoCenter__accountStoreDidChange__block_invoke;
  v2[3] = &unk_1E939EE88;
  v2[4] = self;
  -[VSIdentityProviderInfoCenter _refresh:](self, "_refresh:", v2);
}

uint64_t __54__VSIdentityProviderInfoCenter__accountStoreDidChange__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "ignoredFirstNotification");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "_postdentityProviderInfoDidChangeNotification");
  else
    return objc_msgSend(v3, "setIgnoredFirstNotification:", 1);
}

- (void)_developerSettingsDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__VSIdentityProviderInfoCenter__developerSettingsDidChange__block_invoke;
  v2[3] = &unk_1E939EE88;
  v2[4] = self;
  -[VSIdentityProviderInfoCenter _refresh:](self, "_refresh:", v2);
}

uint64_t __59__VSIdentityProviderInfoCenter__developerSettingsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postdentityProviderInfoDidChangeNotification");
}

- (void)_postdentityProviderInfoDidChangeNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VSIdentityProviderInfoDidChangeNotification"), 0);

}

- (void)_refresh:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__VSIdentityProviderInfoCenter__refresh___block_invoke;
  v6[3] = &unk_1E93A0200;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VSIdentityProviderInfoCenter fetchAccountAndIdentityProvider:](self, "fetchAccountAndIdentityProvider:", v6);

}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setCachedIdentityProvider:", v7);
    v8 = objc_msgSend(v7, "isDeveloper");
    objc_msgSend(*(id *)(a1 + 32), "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2;
    v14[3] = &unk_1E93A01D8;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v19 = v8;
    v18 = v10;
    v15 = v7;
    v16 = v6;
    v17 = v9;
    v11 = v9;
    v12 = v7;
    objc_msgSend(v11, "fetchSetTopBoxProfileWithCompletion:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedIdentityProvider:", 0);
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }

}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD aBlock[5];
  id v26;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedIsSetTopBox:", v5 != 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__VSIdentityProviderInfoCenter__refresh___block_invoke_74;
    aBlock[3] = &unk_1E93A01B0;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 64);
    v9 = _Block_copy(aBlock);
    if (*(_BYTE *)(a1 + 72))
    {
      v10 = *(void **)(a1 + 32);
      if (v5)
      {
        objc_msgSend(v10, "fetchIdentityProviderAppBundleIdFromDeveloperSettings:", v9);
        objc_msgSend(*(id *)(a1 + 32), "cachedIdentityProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIsSetTopBoxSupported:", 1);

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "nonChannelAppDescriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "nonChannelAppDescriptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [identityProvider nonChannelAppDescriptions] parameter must not be nil."));
        objc_msgSend(*(id *)(a1 + 40), "nonChannelAppDescriptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v15 = VSLoadInterfaceFramework((uint64_t)&v24);
        v16 = v24;
        v17 = v16;
        if (v15)
        {
          v18 = objc_alloc_init(NSClassFromString((NSString *)CFSTR("VSNonChannelAppDecider")));
          objc_msgSend(v18, "setAppDescriptions:", v14);
          objc_msgSend(v18, "setPreferredAppBundleOrAdamID:", *(_QWORD *)(a1 + 48));
          objc_msgSend(*(id *)(a1 + 56), "stringForAMSDeviceFamilies");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setPreferredDeviceFamily:", v19);

          objc_msgSend(v18, "decidedNonChannelApps");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bundleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (v16)
            (*((void (**)(void *, _QWORD, id))v9 + 2))(v9, 0, v16);
          v22 = 0;
        }
        (*((void (**)(void *, void *, _QWORD))v9 + 2))(v9, v22, 0);

        goto LABEL_21;
      }
      v10 = *(void **)(a1 + 32);
    }
    objc_msgSend(v10, "setCachedDesignatedAppBundleIdentifier:", 0);
    v23 = *(_QWORD *)(a1 + 64);
    if (v23)
      (*(void (**)(void))(v23 + 16))();
    goto LABEL_21;
  }
  VSErrorLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentError:", v6);
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(void))(v8 + 16))();
LABEL_22:

}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __41__VSIdentityProviderInfoCenter__refresh___block_invoke_74_cold_1();

    v8 = *(void **)(a1 + 32);
    v9 = v6;
    goto LABEL_7;
  }
  v10 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v10, "setCachedDesignatedAppBundleIdentifier:", v5);
    v8 = *(void **)(a1 + 32);
    v9 = 0;
LABEL_7:
    objc_msgSend(v8, "setCurrentError:", v9);
    goto LABEL_8;
  }
  objc_msgSend(v10, "setCachedDesignatedAppBundleIdentifier:", 0);
LABEL_8:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

- (void)fetchAccountAndIdentityProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSIdentityProviderInfoCenter accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke;
  v7[3] = &unk_1E939F338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAccountsWithCompletionHandler:", v7);

}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_2;
  v8[3] = &unk_1E939F310;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_88;
  v6[3] = &unk_1E939F2C0;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "unwrapObject:error:", v8, v6);

}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "preferredAppID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identityProviderID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3;
    v20[3] = &unk_1E93A0250;
    v9 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v6;
    v22 = v9;
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_87;
    v16[3] = &unk_1E939F1F8;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v17 = v5;
    v18 = v10;
    v19 = v11;
    v12 = v5;
    v13 = v6;
    objc_msgSend(v7, "conditionallyUnwrapObject:otherwise:", v20, v16);

  }
  else
  {
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D2419000, v14, OS_LOG_TYPE_DEFAULT, "Account store returned no accounts", v15, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v3, "newIdentityProviderFetchOperationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    objc_msgSend(v7, "start");
    objc_msgSend(v7, "waitUntilFinished");
    objc_msgSend(v7, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "forceUnwrapObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_4;
    v14[3] = &unk_1E93A0228;
    v16 = a1[6];
    v15 = a1[5];
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_5;
    v12[3] = &unk_1E939F2C0;
    v13 = a1[6];
    objc_msgSend(v9, "unwrapObject:error:", v14, v12);

  }
  else
  {
    VSErrorLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3_cold_1(v11);

    objc_msgSend(a1[4], "setCachedIdentityProvider:", 0);
    (*((void (**)(void))a1[6] + 2))();
  }

}

uint64_t __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  VSErrorLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_87_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "setCachedIdentityProvider:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_88_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchIdentityProviderAppBundleIdFromDeveloperSettings:(id)a3
{
  id v4;
  VSDeveloperSettingsFetchOperation *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(VSDeveloperSettingsFetchOperation);
  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke;
  v8[3] = &unk_1E93A02A0;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  -[VSDeveloperSettingsFetchOperation setCompletionBlock:](v5, "setCompletionBlock:", v8);
  -[VSIdentityProviderInfoCenter privateQueue](self, "privateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_2;
  v8[3] = &unk_1E93A0278;
  v9 = *(id *)(a1 + 32);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3;
  v6[3] = &unk_1E939F2C0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "unwrapObject:error:", v8, v6);

}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "setTopBoxBundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_value:(id)a3 withDefault:(id)a4
{
  if (a3)
    return a3;
  else
    return a4;
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSIdentityProvider)cachedIdentityProvider
{
  return self->_cachedIdentityProvider;
}

- (void)setCachedIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIdentityProvider, a3);
}

- (NSString)cachedDesignatedAppBundleIdentifier
{
  return self->_cachedDesignatedAppBundleIdentifier;
}

- (void)setCachedDesignatedAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDesignatedAppBundleIdentifier, a3);
}

- (BOOL)cachedIsSetTopBox
{
  return self->_cachedIsSetTopBox;
}

- (void)setCachedIsSetTopBox:(BOOL)a3
{
  self->_cachedIsSetTopBox = a3;
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)ignoredFirstNotification
{
  return self->_ignoredFirstNotification;
}

- (void)setIgnoredFirstNotification:(BOOL)a3
{
  self->_ignoredFirstNotification = a3;
}

- (NSError)currentError
{
  return self->_currentError;
}

- (void)setCurrentError:(id)a3
{
  objc_storeStrong((id *)&self->_currentError, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (VSDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (id)newIdentityProviderFetchAllOperationBlock
{
  return self->_newIdentityProviderFetchAllOperationBlock;
}

- (void)setNewIdentityProviderFetchAllOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)newIdentityProviderFetchOperationBlock
{
  return self->_newIdentityProviderFetchOperationBlock;
}

- (void)setNewIdentityProviderFetchOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_newIdentityProviderFetchOperationBlock, 0);
  objc_storeStrong(&self->_newIdentityProviderFetchAllOperationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_cachedDesignatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedIdentityProvider, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

void __36__VSIdentityProviderInfoCenter_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Failed to load interface framework: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueIdentityProviderAppsQueryWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error loading UI framework for apps query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching identity providers for apps query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching STB profile %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_74_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching bundle ID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Could not fetch identity provider.", v1, 2u);
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_87_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Account %@ did not have an identity provider id", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_88_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Account store returned error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching developer settings %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
