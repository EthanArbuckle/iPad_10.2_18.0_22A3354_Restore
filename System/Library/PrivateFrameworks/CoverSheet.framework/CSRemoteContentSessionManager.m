@implementation CSRemoteContentSessionManager

- (CSRemoteContentSessionManager)initWithAuthenticationStatusProvider:(id)a3
{
  id v5;
  CSRemoteContentSessionManager *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessSerialQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSRemoteContentSessionManager;
  v6 = -[CSRemoteContentSessionManager init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.SpringBoard.CSRemoteContentSessionManager.accessSerialQueue", v7);
    accessSerialQueue = v6->_accessSerialQueue;
    v6->_accessSerialQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_authenticationStatusProvider, a3);
  }

  return v6;
}

- (id)existingSessions
{
  NSObject *accessSerialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CSRemoteContentSessionManager_existingSessions__block_invoke;
  v5[3] = &unk_1E8E303F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__CSRemoteContentSessionManager_existingSessions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_existingSessions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)existingSessionsWithDefinition:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSRemoteContentSessionManager_existingSessionsWithDefinition___block_invoke;
  block[3] = &unk_1E8E30420;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__CSRemoteContentSessionManager_existingSessionsWithDefinition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_existingSessionsWithDefinition:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)createSessionWithDefinition:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSRemoteContentSessionManager_createSessionWithDefinition___block_invoke;
  block[3] = &unk_1E8E30420;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__CSRemoteContentSessionManager_createSessionWithDefinition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_createSessionWithDefinition:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didInvalidateSessionWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *accessSerialQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Remove session %{public}@", buf, 0xCu);
  }

  accessSerialQueue = self->_accessSerialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CSRemoteContentSessionManager_didInvalidateSessionWithSessionID___block_invoke;
  v8[3] = &unk_1E8E2DC00;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(accessSerialQueue, v8);

}

uint64_t __67__CSRemoteContentSessionManager_didInvalidateSessionWithSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)_queue_createSessionWithDefinition:(id)a3
{
  id v4;
  CSRemoteContentSession *v5;
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  NSMutableDictionary *sessionIDToSession;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  CSRemoteContentSession *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  v5 = -[CSRemoteContentSession initWithDefinition:authenticationStatusProvider:]([CSRemoteContentSession alloc], "initWithDefinition:authenticationStatusProvider:", v4, self->_authenticationStatusProvider);
  -[CSRemoteContentSession sessionID](v5, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingHostDelegate);
  -[CSRemoteContentSession setHostDelegate:](v5, "setHostDelegate:", WeakRetained);

  -[CSRemoteContentSession setPreferencesProvider:](v5, "setPreferencesProvider:", self);
  if (self->_sessionIDToSession)
  {
    v24 = v6;
    v25 = v5;
    v8 = v4;
    -[CSRemoteContentSessionManager _queue_existingSessionsWithDefinition:](self, "_queue_existingSessionsWithDefinition:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          SBLogDashBoard();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "sessionID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v16;
            v32 = 2114;
            v33 = v8;
            _os_log_impl(&dword_1D0337000, v15, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Removing stale session %{public}@ that matches incoming definition: %{public}@", buf, 0x16u);

          }
          sessionIDToSession = self->_sessionIDToSession;
          objc_msgSend(v14, "sessionID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](sessionIDToSession, "removeObjectForKey:", v18);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v11);
    }

    v4 = v8;
    v6 = v24;
    v5 = v25;
  }
  else
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = self->_sessionIDToSession;
    self->_sessionIDToSession = v19;

  }
  -[NSMutableDictionary setObject:forKey:](self->_sessionIDToSession, "setObject:forKey:", v5, v6);
  SBLogDashBoard();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[CSRemoteContentSession sessionID](v5, "sessionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v22;
    v32 = 2114;
    v33 = v4;
    _os_log_impl(&dword_1D0337000, v21, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Created session %{public}@ for definition: %{public}@", buf, 0x16u);

  }
  return v5;
}

- (id)_queue_existingSessions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sessionIDToSession, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!v6)
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        objc_msgSend(v6, "addObject:", v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_queue_existingSessionsWithDefinition:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sessionIDToSession, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "definition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v21;
        objc_msgSend(v10, "serviceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        objc_msgSend(v10, "viewControllerClassName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "viewControllerClassName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v15, "isEqualToString:", v16);
        if (v14)
          v18 = v17 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          if (!v6)
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)preferencesForRemoteContentSession:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSRemoteContentSessionManager_preferencesForRemoteContentSession___block_invoke;
  block[3] = &unk_1E8E30420;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __68__CSRemoteContentSessionManager_preferencesForRemoteContentSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "definition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)remoteContentSession:(id)a3 didUpdateWithPreferences:(id)a4
{
  id v6;
  id v7;
  NSObject *accessSerialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSRemoteContentSessionManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSRemoteContentSessionManager_remoteContentSession_didUpdateWithPreferences___block_invoke;
  block[3] = &unk_1E8E2DB88;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(accessSerialQueue, block);

}

void __79__CSRemoteContentSessionManager_remoteContentSession_didUpdateWithPreferences___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v1 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    }
    objc_msgSend(*(id *)(a1 + 48), "definition");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v1, v7);

  }
}

- (CSRemoteContentSessionHostDelegate)forwardingHostDelegate
{
  return (CSRemoteContentSessionHostDelegate *)objc_loadWeakRetained((id *)&self->_forwardingHostDelegate);
}

- (void)setForwardingHostDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forwardingHostDelegate, a3);
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_destroyWeak((id *)&self->_forwardingHostDelegate);
  objc_storeStrong((id *)&self->_serviceNameToPreferences, 0);
  objc_storeStrong((id *)&self->_sessionIDToSession, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end
