@implementation ML3MusicLibraryAccountChangeObserverProxy

+ (ML3MusicLibraryAccountChangeObserverProxy)sharedProxy
{
  if (sharedProxy_onceToken != -1)
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_20005);
  return (ML3MusicLibraryAccountChangeObserverProxy *)(id)sharedProxy___sharedProxy;
}

void __70__ML3MusicLibraryAccountChangeObserverProxy_addAccountChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "weakObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)addAccountChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  ML3MusicLibraryAccountChangeObserverProxy *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ - addAccountChangeObserver: %{public}@", buf, 0x16u);
  }

  -[ML3MusicLibraryAccountChangeObserverProxy serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ML3MusicLibraryAccountChangeObserverProxy_addAccountChangeObserver___block_invoke;
  v8[3] = &unk_1E5B65EB8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (NSHashTable)weakObservers
{
  NSObject *v3;
  NSHashTable *weakObservers;
  NSHashTable *v5;
  NSHashTable *v6;

  -[ML3MusicLibraryAccountChangeObserverProxy serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  weakObservers = self->_weakObservers;
  if (!weakObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_weakObservers;
    self->_weakObservers = v5;

    weakObservers = self->_weakObservers;
  }
  return weakObservers;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

void __56__ML3MusicLibraryAccountChangeObserverProxy_sharedProxy__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ML3MusicLibraryAccountChangeObserverProxy _init]([ML3MusicLibraryAccountChangeObserverProxy alloc], "_init");
  v1 = (void *)sharedProxy___sharedProxy;
  sharedProxy___sharedProxy = (uint64_t)v0;

}

- (id)_init
{
  ML3MusicLibraryAccountChangeObserverProxy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3MusicLibraryAccountChangeObserverProxy;
  v2 = -[ML3MusicLibraryAccountChangeObserverProxy init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.medialibrary.change-proxy-serial-queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.medialibrary.change-proxy-callout-queue", MEMORY[0x1E0C80D50]);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  _QWORD v23[5];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  ML3MusicLibraryAccountChangeObserverProxy *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ML3MusicLibraryAccountChangeObserverProxy readonlyObservers](self, "readonlyObservers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v31 = self;
    v32 = 2113;
    v33 = v6;
    v34 = 2114;
    v35 = v8;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - newPath=%{private}@ Observers=%{public}@", buf, 0x20u);

  }
  v9 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ML3MusicLibraryAccountChangeObserverProxy readonlyObservers](self, "readonlyObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
        dispatch_group_enter(v9);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke;
        v23[3] = &unk_1E5B65B40;
        v23[4] = self;
        v24 = v9;
        objc_msgSend(v15, "performDatabasePathChange:completion:", v6, v23);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  -[ML3MusicLibraryAccountChangeObserverProxy calloutQueue](self, "calloutQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_3;
  block[3] = &unk_1E5B656C0;
  block[4] = self;
  v21 = v6;
  v22 = v19;
  v17 = v19;
  v18 = v6;
  dispatch_group_notify(v9, v16, block);

}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v20;
  ML3MusicLibraryAccountChangeObserverProxy *v21;
  id v22;
  _QWORD v23[5];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  ML3MusicLibraryAccountChangeObserverProxy *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[ML3MusicLibraryAccountChangeObserverProxy readonlyObservers](self, "readonlyObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = self;
    v32 = 2114;
    v33 = v5;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - emergencyDisconnectWithCompletion - Observers: %{public}@", buf, 0x16u);

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D130]), "initWithName:", CFSTR("Emergency Disconnect"));
  objc_msgSend(v17, "beginTransaction");
  v6 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ML3MusicLibraryAccountChangeObserverProxy readonlyObservers](self, "readonlyObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        dispatch_group_enter(v6);
        v23[0] = v9;
        v23[1] = 3221225472;
        v23[2] = __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke;
        v23[3] = &unk_1E5B65B40;
        v23[4] = self;
        v24 = v6;
        objc_msgSend(v13, "emergencyDisconnectWithCompletion:", v23);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  -[ML3MusicLibraryAccountChangeObserverProxy calloutQueue](self, "calloutQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_3;
  block[3] = &unk_1E5B656C0;
  v20 = v17;
  v21 = self;
  v22 = v18;
  v15 = v18;
  v16 = v17;
  dispatch_group_notify(v6, v14, block);

}

- (void)terminateForFailureToPerformDatabasePathChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  ML3MusicLibraryAccountChangeObserverProxy *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[ML3MusicLibraryAccountChangeObserverProxy readonlyObservers](self, "readonlyObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - terminateForFailureToPrepareForAccountChange - Observers: %{public}@", buf, 0x16u);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ML3MusicLibraryAccountChangeObserverProxy readonlyObservers](self, "readonlyObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "terminateForFailureToPerformDatabasePathChange");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeAccountChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ML3MusicLibraryAccountChangeObserverProxy serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ML3MusicLibraryAccountChangeObserverProxy_removeAccountChangeObserver___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSHashTable)readonlyObservers
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
  v10 = __Block_byref_object_copy__19984;
  v11 = __Block_byref_object_dispose__19985;
  v12 = 0;
  -[ML3MusicLibraryAccountChangeObserverProxy serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ML3MusicLibraryAccountChangeObserverProxy_readonlyObservers__block_invoke;
  v6[3] = &unk_1E5B65E48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSHashTable *)v4;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
}

void __62__ML3MusicLibraryAccountChangeObserverProxy_readonlyObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "weakObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __73__ML3MusicLibraryAccountChangeObserverProxy_removeAccountChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "weakObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "calloutQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_2;
  block[3] = &unk_1E5B65D80;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endTransaction");
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ - emergencyDisconnectWithCompletion - Calling completion block", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __79__ML3MusicLibraryAccountChangeObserverProxy_emergencyDisconnectWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "calloutQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_2;
  block[3] = &unk_1E5B65D80;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - Calling completion block - newPath=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __82__ML3MusicLibraryAccountChangeObserverProxy_performDatabasePathChange_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
