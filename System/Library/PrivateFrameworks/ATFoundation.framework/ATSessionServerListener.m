@implementation ATSessionServerListener

- (ATSessionServerListener)init
{
  ATSessionServerListener *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sessionProxiesBySessionID;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATSessionServerListener;
  v2 = -[ATSessionServerListener init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionProxiesBySessionID = v2->_sessionProxiesBySessionID;
    v2->_sessionProxiesBySessionID = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__dumpDebugInformation, *MEMORY[0x1E0CF7600], 0);

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  id v4;
  NSXPCListener *v5;
  NSXPCListener *listener;
  int v7;
  ATSessionServerListener *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v7, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v5 = (NSXPCListener *)objc_msgSend(v4, "initWithMachServiceName:", *MEMORY[0x1E0CF7630]);
  listener = self->_listener;
  self->_listener = v5;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)stop
{
  NSObject *v3;
  NSXPCListener *listener;
  NSXPCListener *v5;
  int v6;
  ATSessionServerListener *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
    v5 = self->_listener;
    self->_listener = 0;

  }
}

- (void)addSession:(id)a3
{
  id v4;
  ATSessionProxyListener *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *sessionProxiesBySessionID;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATSessionProxyListener initWithSession:]([ATSessionProxyListener alloc], "initWithSession:", v4);
  v6 = self->_sessionProxiesBySessionID;
  objc_sync_enter(v6);
  sessionProxiesBySessionID = self->_sessionProxiesBySessionID;
  objc_msgSend(v4, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sessionProxiesBySessionID, "setObject:forKey:", v5, v8);

  objc_sync_exit(v6);
  -[ATSessionProxyListener start](v5, "start");
  _ATLogCategoryFramework();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  v11 = (const __CFString *)*MEMORY[0x1E0CF7668];
  if (v10)
  {
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_DEFAULT, "posting %{public}@ notification for adding session %{public}@", (uint8_t *)&v13, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v11, 0, 0, 1u);

}

- (void)removeSession:(id)a3
{
  id v4;
  NSMutableDictionary *sessionProxiesBySessionID;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sessionProxiesBySessionID = self->_sessionProxiesBySessionID;
  objc_msgSend(v4, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sessionProxiesBySessionID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "stop");
    v8 = self->_sessionProxiesBySessionID;
    objc_sync_enter(v8);
    v9 = self->_sessionProxiesBySessionID;
    objc_msgSend(v4, "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    objc_sync_exit(v8);
  }
  _ATLogCategoryFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  v13 = (const __CFString *)*MEMORY[0x1E0CF7668];
  if (v12)
  {
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1D19F1000, v11, OS_LOG_TYPE_DEFAULT, "posting %{public}@ notification for removing session %{public}@", (uint8_t *)&v15, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v13, 0, 0, 1u);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  int v12;
  _QWORD v13[5];
  int v14;
  uint8_t buf[4];
  ATSessionServerListener *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "processIdentifier");
  _ATLogCategoryXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC6A9C0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v8);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_1E928CAA0;
  v13[4] = self;
  v14 = v6;
  objc_msgSend(v5, "setInterruptionHandler:", v13);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke_56;
  v11[3] = &unk_1E928CAA0;
  v11[4] = self;
  v12 = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v11);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)fetchSessionsWithTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableDictionary *sessionProxiesBySessionID;
  void *v17;
  void *v18;
  void (**v19)(id, void *, _QWORD);
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = (void (**)(id, void *, _QWORD))a4;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF76B0], "allSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "sessionTypeIdentifier", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v6) & 1) != 0)
        {
          sessionProxiesBySessionID = self->_sessionProxiesBySessionID;
          objc_msgSend(v14, "sessionIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](sessionProxiesBySessionID, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v20, "addObject:", v14);
        }
        else
        {

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v19[2](v19, v20, 0);
}

- (void)cancelSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  ATSessionServerListener *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling session. id=%{public}@", buf, 0x16u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sessionProxiesBySessionID, "objectEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "session");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sessionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v6);

        if (v17)
        {
          objc_msgSend(v14, "session");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "cancel");

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v7[2](v7, 0);
}

- (void)fetchActiveSessionCountForSessionTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  ATSessionServerListener *v21;
  void (**v22)(id, uint64_t, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  ATSessionServerListener *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = self;
  v22 = (void (**)(id, uint64_t, _QWORD))a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sessionProxiesBySessionID, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "session");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sessionTypeIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if (!v16)
            continue;
        }
        objc_msgSend(v13, "session");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isCancelled"))
        {

        }
        else
        {
          objc_msgSend(v13, "session");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isFinished") ^ 1;

          v10 += v19;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  _ATLogCategoryFramework();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v28 = v21;
    v29 = 2048;
    v30 = v10;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_1D19F1000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu active sessions for %{public}@", buf, 0x20u);
  }

  v22[2](v22, v10, 0);
}

- (void)_dumpDebugInformation
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  ATSessionServerListener *v12;
  NSMutableDictionary *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  ATSessionServerListener *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  obj = self->_sessionProxiesBySessionID;
  objc_sync_enter(obj);
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableDictionary count](self->_sessionProxiesBySessionID, "count");
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = v4;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ dumping info for %lu session proxies", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sessionProxiesBySessionID, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        _ATLogCategoryFramework_Oversize();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "session");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "debugDescription");
          v12 = (ATSessionServerListener *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v20 = v12;
          _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProxiesBySessionID, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }

}

void __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", (uint8_t *)&v5, 0x12u);
  }

}

+ (id)sharedSessionServer
{
  if (sharedSessionServer_onceToken != -1)
    dispatch_once(&sharedSessionServer_onceToken, &__block_literal_global_302);
  return (id)sharedSessionServer_server;
}

void __46__ATSessionServerListener_sharedSessionServer__block_invoke()
{
  ATSessionServerListener *v0;
  void *v1;

  v0 = objc_alloc_init(ATSessionServerListener);
  v1 = (void *)sharedSessionServer_server;
  sharedSessionServer_server = (uint64_t)v0;

}

@end
