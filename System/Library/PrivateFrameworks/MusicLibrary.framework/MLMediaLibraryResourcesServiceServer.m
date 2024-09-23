@implementation MLMediaLibraryResourcesServiceServer

- (void)libraryContainerPathWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryContainerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)musicContainerPathWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "musicAssetsContainerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MLMediaLibraryResourcesServiceServer *v17;
  id v18;
  _BYTE *v19;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - queued - newPath=%{public}@", buf, 0x16u);
  }

  -[MLMediaLibraryResourcesServiceServer _blockExecutionForOnGoingAccountChangeIfNeeded](self, "_blockExecutionForOnGoingAccountChangeIfNeeded");
  v9 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - started", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__15981;
  v23 = __Block_byref_object_dispose__15982;
  v24 = 0;
  -[MLMediaLibraryResourcesServiceServer accessQueue](self, "accessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke;
  block[3] = &unk_1E5B65E48;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(v10, block);

  -[MLMediaLibraryResourcesServiceServer workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_2;
  v15[3] = &unk_1E5B63D88;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v19 = buf;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, v15);

  _Block_object_dispose(buf, 8);
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int v28;
  id from;
  id location;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  MLMediaLibraryResourcesServiceServer *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v6 = a4;
  -[MLMediaLibraryResourcesServiceServer _MLMediaLibraryResourcesServiceServerExportedInterface](self, "_MLMediaLibraryResourcesServiceServerExportedInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(v6, "setExportedObject:", self);
  -[MLMediaLibraryResourcesServiceServer _MLMediaLibraryResourcesServiceServerRemoteObjectInterface](self, "_MLMediaLibraryResourcesServiceServerRemoteObjectInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v8);

  v9 = objc_msgSend(v6, "processIdentifier");
  if (v6)
  {
    objc_msgSend(v6, "auditToken");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  MSVBundleIDForAuditToken();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MLChangeObserver observerWithConnection:](_MLChangeObserver, "observerWithConnection:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke;
  v24[3] = &unk_1E5B63DB0;
  objc_copyWeak(&v26, &location);
  v13 = v10;
  v25 = v13;
  v28 = v9;
  objc_copyWeak(&v27, &from);
  objc_msgSend(v6, "setInterruptionHandler:", v24);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke_116;
  v19[3] = &unk_1E5B63DB0;
  objc_copyWeak(&v21, &location);
  v14 = v13;
  v20 = v14;
  v23 = v9;
  objc_copyWeak(&v22, &from);
  objc_msgSend(v6, "setInvalidationHandler:", v19);
  v15 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v34 = self;
    v35 = 2114;
    v36 = v14;
    v37 = 1024;
    v38 = v9;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Connecting to %{public}@[%d]", buf, 0x1Cu);
  }

  -[MLMediaLibraryResourcesServiceServer _addObserver:](self, "_addObserver:", v11);
  objc_msgSend(v11, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resume");

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (MLMediaLibraryResourcesServiceServer)initWithAccountChangeObserver:(id)a3
{
  MLMediaLibraryResourcesServiceServer *v4;
  MLMediaLibraryResourcesServiceServer *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  MLMediaLibraryResourcesServiceServer *v12;
  MLMediaLibraryResourcesServiceServer *v13;
  void *v14;
  objc_super v16;

  v4 = (MLMediaLibraryResourcesServiceServer *)a3;
  v16.receiver = self;
  v16.super_class = (Class)MLMediaLibraryResourcesServiceServer;
  v5 = -[MLMediaLibraryResourcesServiceServer init](&v16, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.medialibraryd.multi-user-resources-service.serialQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.medialibraryd.multi-user-resources-service.workQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.medialibraryd.multi-user-resources-service.calloutQueue", MEMORY[0x1E0C80D50]);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    if (v4)
      v12 = v4;
    else
      v12 = v5;
    v13 = v12;
    +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy](ML3MusicLibraryAccountChangeObserverProxy, "sharedProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAccountChangeObserver:", v13);

  }
  return v5;
}

- (NSMutableSet)observers
{
  NSObject *v3;
  NSMutableSet *observers;
  NSMutableSet *v5;
  NSMutableSet *v6;

  -[MLMediaLibraryResourcesServiceServer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  return observers;
}

- (void)_blockExecutionForOnGoingAccountChangeIfNeeded
{
  NSObject *v2;

  -[MLMediaLibraryResourcesServiceServer accountChangeSemaphore](self, "accountChangeSemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_unblockExecutionForFutureAccountChange
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[MLMediaLibraryResourcesServiceServer accountChangeSemaphore](self, "accountChangeSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

  -[MLMediaLibraryResourcesServiceServer accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MLMediaLibraryResourcesServiceServer__unblockExecutionForFutureAccountChange__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (OS_dispatch_semaphore)accountChangeSemaphore
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15981;
  v11 = __Block_byref_object_dispose__15982;
  v12 = 0;
  -[MLMediaLibraryResourcesServiceServer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__MLMediaLibraryResourcesServiceServer_accountChangeSemaphore__block_invoke;
  v6[3] = &unk_1E5B65E48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_semaphore *)v4;
}

- (void)_addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MLMediaLibraryResourcesServiceServer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MLMediaLibraryResourcesServiceServer__addObserver___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MLMediaLibraryResourcesServiceServer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MLMediaLibraryResourcesServiceServer__removeObserver___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)_MLMediaLibraryResourcesServiceServerExportedInterface
{
  if (_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterfaceOnceToken != -1)
    dispatch_once(&_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterfaceOnceToken, &__block_literal_global_123);
  return (id)_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterface;
}

- (id)_MLMediaLibraryResourcesServiceServerRemoteObjectInterface
{
  if (_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterfaceOnceToken != -1)
    dispatch_once(&_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterfaceOnceToken, &__block_literal_global_129);
  return (id)_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterface;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (void)setAccountChangeSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeSemaphore, a3);
}

- (NSXPCListener)xpcServiceListener
{
  return self->_xpcServiceListener;
}

- (void)setXpcServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcServiceListener, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcServiceListener, 0);
  objc_storeStrong((id *)&self->_accountChangeSemaphore, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __98__MLMediaLibraryResourcesServiceServer__MLMediaLibraryResourcesServiceServerRemoteObjectInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC8DF08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterface;
  _MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterface = v0;

}

void __94__MLMediaLibraryResourcesServiceServer__MLMediaLibraryResourcesServiceServerExportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC955F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterface;
  _MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterface = v0;

}

void __56__MLMediaLibraryResourcesServiceServer__removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __53__MLMediaLibraryResourcesServiceServer__addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __62__MLMediaLibraryResourcesServiceServer_accountChangeSemaphore__block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = dispatch_semaphore_create(1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __79__MLMediaLibraryResourcesServiceServer__unblockExecutionForFutureAccountChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

void __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_DWORD *)(a1 + 56);
      v10 = 138543874;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v4;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Connection interrupted for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
    }

    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v6)
    {
      v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_DWORD *)(a1 + 56);
        v10 = 138543874;
        v11 = WeakRetained;
        v12 = 2114;
        v13 = v8;
        v14 = 1024;
        v15 = v9;
        _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - Removing observer for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
      }

      objc_msgSend(WeakRetained, "_removeObserver:", v6);
    }

  }
}

void __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke_116(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_DWORD *)(a1 + 56);
      v10 = 138543874;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v4;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Connection invalidated for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
    }

    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v6)
    {
      v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_DWORD *)(a1 + 56);
        v10 = 138543874;
        v11 = WeakRetained;
        v12 = 2114;
        v13 = v8;
        v14 = 1024;
        v15 = v9;
        _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - Removing observer for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
      }

      objc_msgSend(WeakRetained, "_removeObserver:", v6);
    }

  }
}

void __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_3;
  v5[3] = &unk_1E5B63D60;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_unblockExecutionForFutureAccountChange");
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - Calling completion block", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performDatabasePathChange:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_114);
}

+ (MLMediaLibraryResourcesServiceServer)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_16000);
  return (MLMediaLibraryResourcesServiceServer *)(id)sharedInstance___sharedService;
}

void __54__MLMediaLibraryResourcesServiceServer_sharedInstance__block_invoke()
{
  MLMediaLibraryResourcesServiceServer *v0;
  void *v1;

  v0 = -[MLMediaLibraryResourcesServiceServer initWithAccountChangeObserver:]([MLMediaLibraryResourcesServiceServer alloc], "initWithAccountChangeObserver:", 0);
  v1 = (void *)sharedInstance___sharedService;
  sharedInstance___sharedService = (uint64_t)v0;

}

@end
