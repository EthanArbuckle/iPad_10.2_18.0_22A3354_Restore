@implementation HDProtectedDataOperationScheduler

- (HDProtectedDataOperationScheduler)initWithProfile:(id)a3
{
  id v4;
  HDProtectedDataOperationScheduler *v5;
  HDProtectedDataOperationScheduler *v6;
  uint64_t v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKSynchronousObserverSet *clientQueue_allClients;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HKSynchronousObserverSet *clientQueue_clientsAwaitingProtectedDataAvailable;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDProtectedDataOperationScheduler;
  v5 = -[HDProtectedDataOperationScheduler init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v7;

    v6->_queue_hasNotifiedForProfileReady = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-all"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithName:loggingCategory:", v10, v11);
    clientQueue_allClients = v6->_clientQueue_allClients;
    v6->_clientQueue_allClients = (HKSynchronousObserverSet *)v12;

    v14 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-awaiting-protected-data-available"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithName:loggingCategory:", v15, v16);
    clientQueue_clientsAwaitingProtectedDataAvailable = v6->_clientQueue_clientsAwaitingProtectedDataAvailable;
    v6->_clientQueue_clientsAwaitingProtectedDataAvailable = (HKSynchronousObserverSet *)v17;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v6);

  }
  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HDProtectedDataOperationScheduler_registerObserver___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __54__HDProtectedDataOperationScheduler_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "registerObserver:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "protectedDataOperationSchedulerProfileIsReady:");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HDProtectedDataOperationScheduler_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

uint64_t __56__HDProtectedDataOperationScheduler_unregisterObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unregisterObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unregisterObserver:", *(_QWORD *)(a1 + 40));
}

- (void)registerProtectedDataAvailableObserver:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HDProtectedDataOperationScheduler_registerProtectedDataAvailableObserver___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

uint64_t __76__HDProtectedDataOperationScheduler_registerProtectedDataAvailableObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addProtectedDataObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isProtectedDataAvailable");

  if (v6)
    return objc_msgSend(*(id *)(a1 + 40), "protectedDataOperationSchedulerProtectedDataIsAvailable:", *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "registerObserver:", *(_QWORD *)(a1 + 40));
}

- (void)startWorkNow:(BOOL)a3 name:(id)a4 asynchronousBlock:(id)a5
{
  _BOOL4 v6;
  HDProfile **p_profile;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  p_profile = &self->_profile;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMaintenanceOperation maintenanceOperationWithName:database:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:database:asynchronousBlock:", v9, v11, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v12, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maintenanceWorkCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
    objc_msgSend(v14, "startOperationImmediately:", v16);
  else
    objc_msgSend(v14, "enqueueMaintenanceOperation:", v16);

}

- (void)startEnqueuedWorkWithName:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maintenanceWorkCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "startNextOperationWithNameImmediately:", v4);

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v4;
      v10 = v12;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not find a pending operation with name: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (void)profileDidBecomeReady:(id)a3
{
  HKSynchronousObserverSet *clientQueue_allClients;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_queue_hasNotifiedForProfileReady = 1;
  clientQueue_allClients = self->_clientQueue_allClients;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HDProtectedDataOperationScheduler_profileDidBecomeReady___block_invoke;
  v5[3] = &unk_1E6CF78C8;
  v5[4] = self;
  -[HKSynchronousObserverSet notifyObservers:](clientQueue_allClients, "notifyObservers:", v5);
}

uint64_t __59__HDProtectedDataOperationScheduler_profileDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protectedDataOperationSchedulerProfileIsReady:", *(_QWORD *)(a1 + 32));
}

- (id)diagnosticDescription
{
  void *v3;
  NSObject *clientQueue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  HDProtectedDataOperationScheduler *v12;
  id v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E6DF8F90);
  clientQueue = self->_clientQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke;
  v11 = &unk_1E6CE8080;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_async_and_wait(clientQueue, &v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"), v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke_2;
  v3[3] = &unk_1E6CF78C8;
  v4 = v1;
  objc_msgSend(v2, "notifyObservers:", v3);

}

void __58__HDProtectedDataOperationScheduler_diagnosticDescription__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HKSynchronousObserverSet *clientQueue_clientsAwaitingProtectedDataAvailable;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clientQueue_clientsAwaitingProtectedDataAvailable = self->_clientQueue_clientsAwaitingProtectedDataAvailable;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__HDProtectedDataOperationScheduler_database_protectedDataDidBecomeAvailable___block_invoke;
    v20[3] = &unk_1E6CF78F0;
    v20[4] = self;
    v8 = v6;
    v21 = v8;
    -[HKSynchronousObserverSet notifyObservers:](clientQueue_clientsAwaitingProtectedDataAvailable, "notifyObservers:", v20);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          -[HKSynchronousObserverSet unregisterObserver:](self->_clientQueue_clientsAwaitingProtectedDataAvailable, "unregisterObserver:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), (_QWORD)v16);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v11);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeProtectedDataObserver:", self);

  }
}

void __78__HDProtectedDataOperationScheduler_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "protectedDataOperationSchedulerProtectedDataIsAvailable:", v3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue_clientsAwaitingProtectedDataAvailable, 0);
  objc_storeStrong((id *)&self->_clientQueue_allClients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
