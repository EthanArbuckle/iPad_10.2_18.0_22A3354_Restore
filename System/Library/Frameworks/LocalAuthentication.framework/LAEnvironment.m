@implementation LAEnvironment

+ (LAEnvironment)currentUser
{
  if (currentUser_onceToken != -1)
    dispatch_once(&currentUser_onceToken, &__block_literal_global_0);
  return (LAEnvironment *)(id)currentUser_currentUser;
}

void __28__LAEnvironment_currentUser__block_invoke()
{
  LAEnvironment *v0;
  void *v1;

  v0 = objc_alloc_init(LAEnvironment);
  v1 = (void *)currentUser_currentUser;
  currentUser_currentUser = (uint64_t)v0;

}

- (LAEnvironment)init
{
  LAEnvironment *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  uint64_t v5;
  NSHashTable *observers;
  uint64_t v7;
  OS_dispatch_queue *observerQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LAEnvironment;
  v2 = -[LAEnvironment init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LAEnvironment work queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LAEnvironment observer queue"));
    v7 = objc_claimAutoreleasedReturnValue();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v7;

    -[LAEnvironment _registerDarwinNotification](v2, "_registerDarwinNotification");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[LAEnvironment _unregisterDarwinNotification](self, "_unregisterDarwinNotification");
  v3.receiver = self;
  v3.super_class = (Class)LAEnvironment;
  -[LAEnvironment dealloc](&v3, sel_dealloc);
}

- (void)_registerDarwinNotification
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "com.apple.LocalAuthentication.environment.StateDidChange";
  v4 = 1024;
  v5 = a1;
  _os_log_fault_impl(&dword_1B971E000, a2, OS_LOG_TYPE_FAULT, "Failed to register %{public}s: %u", (uint8_t *)&v2, 0x12u);
}

void __44__LAEnvironment__registerDarwinNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateState");

}

- (void)_unregisterDarwinNotification
{
  int notifyToken;

  notifyToken = self->_notifyToken;
  if (notifyToken)
    notify_cancel(notifyToken);
}

- (LAEnvironmentState)state
{
  NSObject *workQueue;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__LAEnvironment_state__block_invoke;
  block[3] = &unk_1E7079378;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync(workQueue, block);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (LAEnvironmentState *)v4;
}

void __22__LAEnvironment_state__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    v4 = WeakRetained;
    if (!v3)
    {
      objc_msgSend(WeakRetained, "_updateState");
      v3 = (void *)v4[1];
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);
    WeakRetained = v4;
  }

}

- (void)_updateState
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__LAEnvironment__updateState__block_invoke;
  v3[3] = &unk_1E70793A0;
  objc_copyWeak(&v4, &location);
  -[LAEnvironment _synchronousProxyToEnvironmentServiceWithCompletion:](self, "_synchronousProxyToEnvironmentServiceWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __29__LAEnvironment__updateState__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  if (a2)
  {
    v2 = (id *)(a1 + 32);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "_updateStateWithSynchronousProxyToEnvironmentService:", v3);

  }
}

- (void)_updateStateWithSynchronousProxyToEnvironmentService:(id)a3
{
  id v4;
  void *v5;
  LAEnvironmentState *v6;
  LAEnvironmentState *v7;
  LAEnvironmentState *v8;
  LAEnvironmentState *state;
  uid_t v10;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uid_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", geteuid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__LAEnvironment__updateStateWithSynchronousProxyToEnvironmentService___block_invoke;
  v12[3] = &unk_1E70793C8;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v4, "environmentStateForUser:completion:", v5, v12);

  if (v20[5])
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v6 = self->_state;
    v7 = [LAEnvironmentState alloc];
    v8 = -[LAEnvironmentState initWithCoreState:](v7, "initWithCoreState:", v20[5]);
    state = self->_state;
    self->_state = v8;

    -[LAEnvironment _notifyObserversAboutUpdateFrom:](self, "_notifyObserversAboutUpdateFrom:", v6);
  }
  else
  {
    LACLogEnvironment();
    v6 = (LAEnvironmentState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      v10 = geteuid();
      v11 = v14[5];
      *(_DWORD *)buf = 67109378;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1B971E000, &v6->super, OS_LOG_TYPE_DEFAULT, "Failed to query environment state for user %u: %@", buf, 0x12u);
    }
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

void __70__LAEnvironment__updateStateWithSynchronousProxyToEnvironmentService___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_synchronousProxyToEnvironmentServiceWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__LAEnvironment__synchronousProxyToEnvironmentServiceWithCompletion___block_invoke;
  v6[3] = &unk_1E70793F0;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[LAEnvironment _environmentServiceEndpointWithCompletion:](self, "_environmentServiceEndpointWithCompletion:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __69__LAEnvironment__synchronousProxyToEnvironmentServiceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_synchronousProxyToEnvironmentServiceWithEndpoint:completion:", v4, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_synchronousProxyToEnvironmentServiceWithEndpoint:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3B38];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithListenerEndpoint:", v7);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF2370C8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_environmentStateForUser_completion_, 0, 1);

  objc_msgSend(v8, "activate");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__LAEnvironment__synchronousProxyToEnvironmentServiceWithEndpoint_completion___block_invoke;
  v22[3] = &unk_1E7079418;
  v20 = v5;
  v23 = v20;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    (*((void (**)(id, void *, _QWORD))v20 + 2))(v20, v21, 0);
  objc_msgSend(v8, "invalidate");

}

uint64_t __78__LAEnvironment__synchronousProxyToEnvironmentServiceWithEndpoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_environmentServiceEndpointWithCompletion:(id)a3
{
  NSXPCListenerEndpoint *environmentServiceEndpoint;

  environmentServiceEndpoint = self->_environmentServiceEndpoint;
  if (environmentServiceEndpoint)
    (*((void (**)(id, NSXPCListenerEndpoint *, _QWORD))a3 + 2))(a3, environmentServiceEndpoint, 0);
  else
    -[LAEnvironment _bootstrapServiceType:completion:](self, "_bootstrapServiceType:completion:", CFSTR("kLAServiceTypeEnvironment"), a3);
}

- (void)_bootstrapServiceType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[LAEnvironment _createConnectionToDaemon](self, "_createConnectionToDaemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __50__LAEnvironment__bootstrapServiceType_completion___block_invoke;
  v18 = &unk_1E7079418;
  v19 = v6;
  v9 = v6;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "processIdentifier");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%d"), v13, v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bootstrapSessionServiceType:serviceClientID:completionHandler:", v7, v14, v9);

  objc_msgSend(v8, "invalidate");
}

uint64_t __50__LAEnvironment__bootstrapServiceType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_createConnectionToDaemon
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.CoreAuthentication.daemon"), 0);
  objc_msgSend(MEMORY[0x1E0CC1320], "interfaceWithInternalProtocol:", &unk_1EF237248);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "_setQueue:", self->_workQueue);
  objc_msgSend(v3, "activate");
  return v3;
}

- (void)waitForStateUpdate
{
  sleep(1u);
}

- (void)addObserver:(id)a3
{
  void *v4;
  NSHashTable *v5;
  id v6;

  v6 = a3;
  -[LAEnvironment state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_observers;
  objc_sync_enter(v5);
  -[NSHashTable addObject:](self->_observers, "addObject:", v6);
  objc_sync_exit(v5);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_notifyObserversAboutUpdateFrom:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LAEnvironment *v14;
  NSObject *observerQueue;
  LAEnvironment *v16;
  _QWORD block[5];
  LAEnvironment *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[LAEnvironmentState isEqual:](self->_state, "isEqual:", v4))
  {
    v5 = self->_observers;
    objc_sync_enter(v5);
    v6 = (void *)MEMORY[0x1E0C99D20];
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v14 = self;
            observerQueue = self->_observerQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __49__LAEnvironment__notifyObserversAboutUpdateFrom___block_invoke;
            block[3] = &unk_1E7079440;
            block[4] = v13;
            v18 = v14;
            v19 = v4;
            v16 = v14;
            dispatch_async(observerQueue, block);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
}

uint64_t __49__LAEnvironment__notifyObserversAboutUpdateFrom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "environment:stateDidChangeFromOldState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentServiceEndpoint, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
