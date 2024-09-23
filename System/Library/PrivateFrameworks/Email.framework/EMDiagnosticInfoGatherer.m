@implementation EMDiagnosticInfoGatherer

+ (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FE50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23EB98);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_registerDiagnosticInfoProvider_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF242DC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_provideDiagnosticsAt_options_completion_, 0, 1);

  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_registerDiagnosticInfoProvider_completionHandler_, 0, 0);
  return v2;
}

- (EMDiagnosticInfoGatherer)initWithRemoteConnection:(id)a3
{
  id v5;
  EMDiagnosticInfoGatherer *v6;
  EMDiagnosticInfoGatherer *v7;
  uint64_t v8;
  EFScheduler *providerQueue;
  id v10;
  void *v11;
  uint64_t v12;
  EFLocked *providers;
  EMRemoteConnection *connection;
  uint64_t v15;
  EMRemoteConnection *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EMDiagnosticInfoGatherer;
  v6 = -[EMDiagnosticInfoGatherer init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.EMDiagnosticInfoGatherer.queue"));
    v8 = objc_claimAutoreleasedReturnValue();
    providerQueue = v7->_providerQueue;
    v7->_providerQueue = (EFScheduler *)v8;

    v10 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithObject:", v11);
    providers = v7->_providers;
    v7->_providers = (EFLocked *)v12;

    v7->_providerCancelableLock._os_unfair_lock_opaque = 0;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke;
    v20[3] = &unk_1E70F1F78;
    objc_copyWeak(&v21, &location);
    -[EMRemoteConnection addResetHandler:](connection, "addResetHandler:", v20);
    v16 = v7->_connection;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke_2;
    v18[3] = &unk_1E70F1F78;
    objc_copyWeak(&v19, &location);
    -[EMRemoteConnection addRecoveryHandler:](v16, "addRecoveryHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__EMDiagnosticInfoGatherer__registerSelfAsProviderIfRequired__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setProviderCancelable:", a2);
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12));
  return result;
}

- (void)setProviderCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_providerCancelable, a3);
}

- (id)registerDiagnosticInfoProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMDiagnosticInfoGatherer _registerSelfAsProviderIfRequired](self, "_registerSelfAsProviderIfRequired");
  -[EMDiagnosticInfoGatherer providers](self, "providers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke;
  v20[3] = &unk_1E70F2BB8;
  v7 = v4;
  v21 = v7;
  objc_msgSend(v5, "performWhileLocked:", v20);

  v8 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13 = v6;
  v14 = 3221225472;
  v15 = __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_2;
  v16 = &unk_1E70F2BE0;
  objc_copyWeak(&v18, &location);
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "addCancelationBlock:", &v13);
  +[EMDiagnosticInfoGatherer log](EMDiagnosticInfoGatherer, "log", v13, v14, v15, v16);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "providerObjectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v23 = v9;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "Registerd EMDiagnosticInfoProviding: %p, objectID: %{public}@", buf, 0x16u);

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v8;
}

- (EFLocked)providers
{
  return self->_providers;
}

- (void)_registerSelfAsProviderIfRequired
{
  os_unfair_lock_s *p_providerCancelableLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  p_providerCancelableLock = &self->_providerCancelableLock;
  os_unfair_lock_lock(&self->_providerCancelableLock);
  if (!self->_providerCancelable)
  {
    -[EMDiagnosticInfoGatherer connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reattemptingRemoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMDiagnosticInfoGatherer providerQueue](self, "providerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMDiagnosticInfoGatherer ef_onScheduler:](self, "ef_onScheduler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__EMDiagnosticInfoGatherer__registerSelfAsProviderIfRequired__block_invoke;
    v8[3] = &unk_1E70F2B90;
    v8[4] = self;
    objc_msgSend(v5, "registerDiagnosticInfoProvider:completionHandler:", v7, v8);

  }
  os_unfair_lock_unlock(p_providerCancelableLock);
}

- (EFScheduler)providerQueue
{
  return self->_providerQueue;
}

- (EMRemoteConnection)connection
{
  return self->_connection;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EMDiagnosticInfoGatherer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1)
    dispatch_once(&log_onceToken_12, block);
  return (OS_os_log *)(id)log_log_12;
}

void __31__EMDiagnosticInfoGatherer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;

}

+ (id)localDiagnosticsDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("DiagnosticLogs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 2;
    v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    -[os_unfair_lock_s setProviderCancelable:](v3, "setProviderCancelable:", 0);
    os_unfair_lock_unlock(v2);
    WeakRetained = v3;
  }

}

void __53__EMDiagnosticInfoGatherer_initWithRemoteConnection___block_invoke_2(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  NSObject *v4;
  int v5;
  unsigned __int8 *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  v3 = atomic_load(WeakRetained + 12);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_registerSelfAsProviderIfRequired");
  }
  else
  {
    +[EMDiagnosticInfoGatherer log](EMDiagnosticInfoGatherer, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "EMDiagnosticInfoProviding: %p, Not registered as provider - Skipping recovery", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)dealloc
{
  os_unfair_lock_s *p_providerCancelableLock;
  void *v4;
  objc_super v5;

  p_providerCancelableLock = &self->_providerCancelableLock;
  os_unfair_lock_lock(&self->_providerCancelableLock);
  -[EMDiagnosticInfoGatherer providerCancelable](self, "providerCancelable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  os_unfair_lock_unlock(p_providerCancelableLock);
  v5.receiver = self;
  v5.super_class = (Class)EMDiagnosticInfoGatherer;
  -[EMDiagnosticInfoGatherer dealloc](&v5, sel_dealloc);
}

void __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "providers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_3;
    v5[3] = &unk_1E70F2BB8;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "performWhileLocked:", v5);

    WeakRetained = v4;
  }

}

uint64_t __59__EMDiagnosticInfoGatherer_registerDiagnosticInfoProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)fetchControllerStatusWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMDiagnosticInfoGatherer connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattemptingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchControllerStatusWithCompletionHandler:", v6);

}

- (void)gatherDiagnosticsWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[EMDiagnosticInfoGatherer connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reattemptingRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__EMDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E70F2C08;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "gatherDiagnosticsWithOptions:completionHandler:", a3, v10);

}

void __75__EMDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "url");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (void)databaseStatisticsWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMDiagnosticInfoGatherer connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattemptingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseStatisticsWithCompletionHandler:", v6);

}

- (void)searchableIndexDatabaseStatisticsWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMDiagnosticInfoGatherer connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattemptingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchableIndexDatabaseStatisticsWithCompletionHandler:", v6);

}

- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  char v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v23 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMDiagnosticInfoGatherer providers](self, "providers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "url");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v29, "startAccessingSecurityScopedResource");
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__3;
  v47[4] = __Block_byref_object_dispose__3;
  v48 = (id)0xAAAAAAAAAAAAAAAALL;
  v8 = objc_alloc(MEMORY[0x1E0D1EEF0]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v48 = (id)objc_msgSend(v8, "initWithObject:", v9);

  -[EMDiagnosticInfoGatherer _moveLocalDiagnosticsTo:](self, "_moveLocalDiagnosticsTo:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v25;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke;
        v40[3] = &unk_1E70F2C30;
        v42 = v47;
        v40[4] = self;
        v15 = v14;
        v41 = v15;
        objc_msgSend(v13, "provideDiagnosticsAt:options:completion:", v29, a4, v40);
        objc_msgSend(v15, "future");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0D1EEC0], "combine:", v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_3;
  v37[3] = &unk_1E70F2C58;
  v19 = v23;
  v38 = v19;
  v39 = v47;
  objc_msgSend(v17, "addSuccessBlock:", v37);
  v34[0] = v18;
  v34[1] = 3221225472;
  v34[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_4;
  v34[3] = &unk_1E70F2C80;
  v20 = v19;
  v35 = v20;
  v36 = v47;
  objc_msgSend(v17, "addFailureBlock:", v34);
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_5;
  v31[3] = &unk_1E70F2CA8;
  v33 = v22;
  v21 = v29;
  v32 = v21;
  objc_msgSend(v17, "always:", v31);

  _Block_object_dispose(v47, 8);
}

void __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v12, "count"))
  {
    v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_2;
    v17 = &unk_1E70F2BB8;
    v7 = v12;
    v18 = v7;
    objc_msgSend(v6, "performWhileLocked:", &v14);
    if (_os_feature_enabled_impl())
    {
      v8 = (void *)a1[4];
      objc_msgSend(v7, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_logCategoryMetadataForMessageObjectIDs:", v9);

    }
  }
  v10 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithResult:error:", v11, v5);

}

uint64_t __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unionSet:", *(_QWORD *)(a1 + 32));
}

void __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v4, v5);

}

uint64_t __68__EMDiagnosticInfoGatherer_provideDiagnosticsAt_options_completion___block_invoke_5(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

- (void)_logCategoryMetadataForMessageObjectIDs:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_10);
}

void __68__EMDiagnosticInfoGatherer__logCategoryMetadataForMessageObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[EMDiagnosticInfoGatherer log](EMDiagnosticInfoGatherer, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134218242;
    v5 = objc_msgSend(v2, "globalMessageID");
    v6 = 2112;
    v7 = MEMORY[0x1E0C9AA70];
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Recategorization metadata ID:%lld metadata:%@", (uint8_t *)&v4, 0x16u);
  }

}

- (id)_moveLocalDiagnosticsTo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "localDiagnosticsDirectoryURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v31 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v24, 0, 0, &v31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v31;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v13, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "URLByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v8;
          objc_msgSend(v4, "moveItemAtURL:toURL:error:", v13, v15, &v26);
          v16 = v26;

          if (v16)
          {
            +[EMDiagnosticInfoGatherer log](EMDiagnosticInfoGatherer, "log");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "path");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "path");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v33 = v22;
              v34 = 2114;
              v35 = v23;
              v36 = 2112;
              v37 = v16;
              _os_log_error_impl(&dword_1B99BB000, v18, OS_LOG_TYPE_ERROR, "Error moving file from %{public}@ to %{public}@, error: %{error}@", buf, 0x20u);

            }
            goto LABEL_16;
          }

          v8 = 0;
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        v8 = 0;
        v16 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v16 = v8;
    }
LABEL_16:

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "finishWithResult:error:", v19, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "finishWithResult:", v17);

  }
  objc_msgSend(v25, "future");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setProviderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_providerQueue, a3);
}

- (EFCancelable)providerCancelable
{
  return self->_providerCancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCancelable, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
