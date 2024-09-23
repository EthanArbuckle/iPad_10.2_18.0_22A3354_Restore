@implementation GEODaemon

- (NSSet)peers
{
  return &self->_peers->super;
}

- (void)peerDidConnect:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_servers, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "serverClass"), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isForServerIdentifier:", v11);

        if (v12)
        {
          objc_msgSend(v10, "server");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            objc_msgSend(v10, "startServerWithDaemon:", self);
          objc_msgSend(v10, "server");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "peerDidConnect:", v4);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)peerDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeObject:](self->_peers, "removeObject:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_servers, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "server");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "peerDidDisconnect:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __49__GEODaemon_initWithPort_createXPCListenerBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *WeakRetained;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x18D765A14]();
  if (v4 != MEMORY[0x1E0C81310])
  {
    v5 = v4;
    if (v4 != MEMORY[0x1E0C812E0])
    {
      GEOGetGEODaemonLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 134217984;
        v12 = v5;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Unexpected event type: %p", (uint8_t *)&v11, 0xCu);
      }

      abort();
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _handleNewConnection:](WeakRetained, "_handleNewConnection:", v3);
    goto LABEL_11;
  }
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    GEOGetGEODaemonLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    LOWORD(v11) = 0;
    v9 = "Listener connection went invalid";
LABEL_10:
    _os_log_impl(&dword_1885A9000, WeakRetained, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v11, 2u);
    goto LABEL_11;
  }
  v7 = (id)MEMORY[0x1E0C81288];
  GEOGetGEODaemonLog();
  v8 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v8;
  if (v3 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 134217984;
      v12 = (uint64_t)v3;
      _os_log_impl(&dword_1885A9000, WeakRetained, OS_LOG_TYPE_ERROR, "Unexpected error event: %p", (uint8_t *)&v11, 0xCu);
    }

    abort();
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    v9 = "Idle exiting";
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_handleNewConnection:(id)a3
{
  _xpc_connection_s *v4;
  void *v5;
  NSMutableSet *peers;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = (_xpc_connection_s *)a3;
  if (-[GEODaemon shouldAllowIncomingConnection:](self, "shouldAllowIncomingConnection:", v4))
  {
    -[GEODaemon _createPeerForConnection:](self, "_createPeerForConnection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    peers = self->_peers;
    if (!peers)
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = self->_peers;
      self->_peers = v7;

      peers = self->_peers;
    }
    -[NSMutableSet addObject:](peers, "addObject:", v5);

  }
  else
  {
    GEOGetGEODaemonLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Rejecting incoming connection", v10, 2u);
    }

    xpc_connection_cancel(v4);
  }

}

- (BOOL)shouldAllowIncomingConnection:(id)a3
{
  return 1;
}

- (id)_createPeerForConnection:(id)a3
{
  id v4;
  GEOPeer *v5;

  v4 = a3;
  v5 = -[GEOPeer initWithConnection:daemon:]([GEOPeer alloc], "initWithConnection:daemon:", v4, self);

  return v5;
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (id)startServerClassIfNecessary:(Class)a3
{
  NSObject *serverQueue;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__104;
  v13 = __Block_byref_object_dispose__104;
  v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverQueue);
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEODaemon_startServerClassIfNecessary___block_invoke;
  block[3] = &unk_1E1C219D8;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_async_and_wait(serverQueue, block);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __41__GEODaemon_startServerClassIfNecessary___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "serverClass"), "isEqual:", a1[6]))
        {
          objc_msgSend(v7, "server");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
            objc_msgSend(v7, "startServerWithDaemon:", a1[4]);
          objc_msgSend(v7, "server");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(a1[5] + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

- (BOOL)isOfflineService
{
  return 0;
}

- (id)initPrimaryDaemon
{
  GEODaemon *v2;
  void *v3;
  uint64_t v4;
  NSString *knownLocale;
  void *v6;
  void *v7;
  GEODaemon *v8;

  v2 = -[GEODaemon initWithPort:createXPCListenerBlock:](self, "initWithPort:createXPCListenerBlock:", "com.apple.geod", &__block_literal_global_9_2);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_geo_languageAndLocale");
    v4 = objc_claimAutoreleasedReturnValue();
    knownLocale = v2->_knownLocale;
    v2->_knownLocale = (NSString *)v4;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:directoryURL:", 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB3990], "setSharedURLCache:", v6);
    -[GEODaemon installSignalHandlers](v2, "installSignalHandlers");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

    v8 = v2;
  }

  return v2;
}

xpc_connection_t __30__GEODaemon_initPrimaryDaemon__block_invoke(int a1, NSObject *a2, char *name)
{
  return xpc_connection_create_mach_service(name, a2, 1uLL);
}

- (GEODaemon)initWithPort:(const char *)a3 createXPCListenerBlock:(id)a4
{
  void (**v6)(id, _QWORD, const char *);
  GEODaemon *v7;
  uint64_t v8;
  OS_dispatch_queue *serverQueue;
  uint64_t v10;
  OS_xpc_object *listener;
  _xpc_connection_s *v12;
  GEODaemon *v13;
  _QWORD handler[4];
  id v16;
  id location;
  objc_super v18;

  v6 = (void (**)(id, _QWORD, const char *))a4;
  v18.receiver = self;
  v18.super_class = (Class)GEODaemon;
  v7 = -[GEODaemon init](&v18, sel_init);
  if (v7)
  {
    v8 = geo_dispatch_workloop_create_with_format();
    serverQueue = v7->_serverQueue;
    v7->_serverQueue = (OS_dispatch_queue *)v8;

    ((void (**)(id, OS_dispatch_queue *, const char *))v6)[2](v6, v7->_serverQueue, a3);
    v10 = objc_claimAutoreleasedReturnValue();
    listener = v7->_listener;
    v7->_listener = (OS_xpc_object *)v10;

    objc_initWeak(&location, v7);
    v12 = v7->_listener;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__GEODaemon_initWithPort_createXPCListenerBlock___block_invoke;
    handler[3] = &unk_1E1C07998;
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler(v12, handler);
    v13 = v7;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)installSignalHandlers
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigInfoSrc;
  NSObject *v5;
  uint64_t v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *sigTermSrc;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *sigUsr1Src;
  NSObject *v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *sigUsr2Src;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD handler[4];
  id v23;
  id location;

  signal(29, (void (__cdecl *)(int))1);
  objc_initWeak(&location, self);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1DuLL, 0, MEMORY[0x1E0C80D38]);
  sigInfoSrc = self->_sigInfoSrc;
  self->_sigInfoSrc = v3;

  v5 = self->_sigInfoSrc;
  v6 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__GEODaemon_installSignalHandlers__block_invoke;
  handler[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v23, &location);
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigInfoSrc);
  signal(15, (void (__cdecl *)(int))1);
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, (dispatch_queue_t)self->_serverQueue);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = v7;

  v9 = self->_sigTermSrc;
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __34__GEODaemon_installSignalHandlers__block_invoke_16;
  v20[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v21, &location);
  dispatch_source_set_event_handler(v9, v20);
  dispatch_activate((dispatch_object_t)self->_sigTermSrc);
  signal(30, (void (__cdecl *)(int))1);
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1EuLL, 0, (dispatch_queue_t)self->_serverQueue);
  sigUsr1Src = self->_sigUsr1Src;
  self->_sigUsr1Src = v10;

  v12 = self->_sigUsr1Src;
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __34__GEODaemon_installSignalHandlers__block_invoke_17;
  v18[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v19, &location);
  dispatch_source_set_event_handler(v12, v18);
  dispatch_activate((dispatch_object_t)self->_sigUsr1Src);
  signal(31, (void (__cdecl *)(int))1);
  v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1FuLL, 0, (dispatch_queue_t)self->_serverQueue);
  sigUsr2Src = self->_sigUsr2Src;
  self->_sigUsr2Src = v13;

  v15 = self->_sigUsr2Src;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __34__GEODaemon_installSignalHandlers__block_invoke_18;
  v16[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v15, v16);
  dispatch_activate((dispatch_object_t)self->_sigUsr2Src);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __34__GEODaemon_installSignalHandlers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOGetGEODaemonLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "SIGINFO received: %@", (uint8_t *)&v4, 0xCu);

  }
}

void __34__GEODaemon_installSignalHandlers__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOGetGEODaemonLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "SIGTERM received: %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_shutdown");

}

void __34__GEODaemon_installSignalHandlers__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOGetGEODaemonLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "SIGUSR1 received: %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_shutdown");

}

void __34__GEODaemon_installSignalHandlers__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOGetGEODaemonLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "SIGUSR2 received: %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_logState");

}

- (void)initializeAndStartPairedDeviceConnectionIfNecessary
{
  GEOPairedDeviceConnection *v3;
  GEOPairedDeviceConnection *devConnection;

  if (PairedDeviceRegistryLibraryCore())
  {
    if (objc_msgSend(getPDRRegistryClass(), "supportsPairedDevice"))
    {
      +[GEOPairedDeviceConnection sharedInstance](GEOPairedDeviceConnection, "sharedInstance");
      v3 = (GEOPairedDeviceConnection *)objc_claimAutoreleasedReturnValue();
      devConnection = self->_devConnection;
      self->_devConnection = v3;

      -[GEOPairedDeviceConnection setDelegateQueue:](self->_devConnection, "setDelegateQueue:", self->_serverQueue);
      -[GEOPairedDeviceConnection setDelegate:](self->_devConnection, "setDelegate:", self);
      -[GEOPairedDeviceConnection start](self->_devConnection, "start");
    }
  }
}

- (void)start
{
  uint64_t v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *serverQueue;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *submitBGSTQueue;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _QWORD v22[5];
  _QWORD v23[6];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id location;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  GEORegisterPListStateCaptureLegacy();
  xpc_connection_activate(self->_listener);
  v3 = -[NSMutableArray count](self->_serversToStart, "count");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = dispatch_time(0, 100000000);
    serverQueue = self->_serverQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __18__GEODaemon_start__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_after(v5, serverQueue, block);
  }
  objc_initWeak(&location, self);
  if (BackgroundSystemTasksLibraryCore())
  {
    v7 = (OS_dispatch_queue *)geo_dispatch_queue_create();
    submitBGSTQueue = self->_submitBGSTQueue;
    self->_submitBGSTQueue = v7;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSMutableDictionary allValues](self->_servers, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend((id)objc_msgSend(v9, "serverClass", obj), "possibleBackgroundTaskIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
                GEOGetGEODaemonLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v36 = v14;
                  _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Registering handler for background task identifier '%{public}@'", buf, 0xCu);
                }

                objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v23[0] = MEMORY[0x1E0C809B0];
                v23[1] = 3221225472;
                v23[2] = __18__GEODaemon_start__block_invoke_23;
                v23[3] = &unk_1E1C21960;
                objc_copyWeak(&v24, &location);
                v23[4] = v9;
                v23[5] = self;
                objc_msgSend(v16, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v14, 0, v23);

                objc_destroyWeak(&v24);
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            }
            while (v11);
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v20);
    }

    v17 = self->_submitBGSTQueue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __18__GEODaemon_start__block_invoke_3;
    v22[3] = &unk_1E1BFF6F8;
    v22[4] = self;
    dispatch_async(v17, v22);
  }
  objc_destroyWeak(&location);
}

void __18__GEODaemon_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  GEOGetLaunchLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  GEOGetLaunchLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StartServers", (const char *)&unk_189D97683, buf, 2u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "startServerWithDaemon:", *(_QWORD *)(a1 + 32), (_QWORD)v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 16);
  *(_QWORD *)(v11 + 16) = 0;

  GEOGetLaunchLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v14, OS_SIGNPOST_INTERVAL_END, v3, "StartServers", (const char *)&unk_189D97683, buf, 2u);
  }

}

void __18__GEODaemon_start__block_invoke_23(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  __int128 v9;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "serverQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __18__GEODaemon_start__block_invoke_2;
    block[3] = &unk_1E1C00738;
    v9 = *(_OWORD *)(a1 + 32);
    dispatch_async_and_wait(v5, block);

    objc_msgSend(*(id *)(a1 + 32), "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runBackgroundTask:", v7);

  }
  else
  {
    objc_msgSend(v7, "setTaskCompleted");
  }

}

void __18__GEODaemon_start__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "startServerWithDaemon:", *(_QWORD *)(a1 + 40));
}

void __18__GEODaemon_start__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v6, "serverClass"), "possibleBackgroundTaskIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
          objc_msgSend((id)objc_msgSend(v6, "serverClass"), "submitBackgroundTasksNeededDuringDaemonStart");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void)shutdown
{
  NSObject *serverQueue;
  _QWORD block[5];

  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__GEODaemon_shutdown__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async_and_wait(serverQueue, block);
}

uint64_t __21__GEODaemon_shutdown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdown");
}

- (void)_shutdown
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  GEOGetGEODaemonLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Shutdown requested", buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("GEODaemonShouldTerminateNotification"), self);

  GEOGetGEODaemonLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Shutdown complete", v6, 2u);
  }

  xpc_transaction_exit_clean();
}

- (void)_withServerProxyForIncomingPairedDeviceMessage:(id)a3 perform:(id)a4
{
  NSMutableDictionary *pairedDeviceMessageTypeToServerIdentifier;
  void *v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  pairedDeviceMessageTypeToServerIdentifier = self->_pairedDeviceMessageTypeToServerIdentifier;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void (**)(id, void *))a4;
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(a3, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pairedDeviceMessageTypeToServerIdentifier, "objectForKey:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSMutableDictionary objectForKey:](self->_servers, "objectForKey:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v10, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v10, "startServerWithDaemon:", self);
  objc_msgSend(v10, "server");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v12);

}

- (void)pairedDeviceConnection:(id)a3 handleIncomingMessage:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__GEODaemon_pairedDeviceConnection_handleIncomingMessage___block_invoke;
  v7[3] = &unk_1E1C21988;
  v8 = v5;
  v6 = v5;
  -[GEODaemon _withServerProxyForIncomingPairedDeviceMessage:perform:](self, "_withServerProxyForIncomingPairedDeviceMessage:perform:", v6, v7);

}

void __58__GEODaemon_pairedDeviceConnection_handleIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  const char *v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    GEOGetGEODaemonLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "type");
      if ((int)v8 <= 99)
      {
        if ((_DWORD)v8)
        {
          if ((_DWORD)v8 == 1)
          {
            v7 = CFSTR("PING");
          }
          else if ((_DWORD)v8 == 2)
          {
            v7 = CFSTR("GET_STORAGE_INFO");
          }
          else
          {
LABEL_26:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v7 = CFSTR("INVALID");
        }
      }
      else
      {
        switch((int)v8)
        {
          case 'd':
            v7 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
            break;
          case 'e':
            v7 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
            break;
          case 'f':
            v7 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'g':
            v7 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'h':
            v7 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
            break;
          case 'i':
            v7 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
            break;
          default:
            goto LABEL_26;
        }
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      v9 = "No handler is registered for paired device message %{public}@";
      goto LABEL_37;
    }
LABEL_38:

    goto LABEL_39;
  }
  if ((objc_msgSend(v3, "handleIncomingPairedDeviceMessage:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    GEOGetGEODaemonLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "type");
      if ((int)v6 <= 99)
      {
        if ((_DWORD)v6)
        {
          if ((_DWORD)v6 == 1)
          {
            v7 = CFSTR("PING");
          }
          else if ((_DWORD)v6 == 2)
          {
            v7 = CFSTR("GET_STORAGE_INFO");
          }
          else
          {
LABEL_35:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v7 = CFSTR("INVALID");
        }
      }
      else
      {
        switch((int)v6)
        {
          case 'd':
            v7 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
            break;
          case 'e':
            v7 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
            break;
          case 'f':
            v7 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'g':
            v7 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'h':
            v7 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
            break;
          case 'i':
            v7 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
            break;
          default:
            goto LABEL_35;
        }
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      v9 = "Unhandled message: %{public}@";
LABEL_37:
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_FAULT, v9, buf, 0xCu);

      goto LABEL_38;
    }
    goto LABEL_38;
  }
LABEL_39:

}

- (void)pairedDeviceConnection:(id)a3 handleIncomingMessage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__GEODaemon_pairedDeviceConnection_handleIncomingMessage_completionHandler___block_invoke;
  v14[3] = &unk_1E1C219B0;
  v11 = v9;
  v15 = v11;
  v17 = &v18;
  v12 = v10;
  v16 = v12;
  -[GEODaemon _withServerProxyForIncomingPairedDeviceMessage:perform:](self, "_withServerProxyForIncomingPairedDeviceMessage:perform:", v11, v14);
  if (!*((_BYTE *)v19 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GEOPairedDeviceConnectionErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v13);

  }
  _Block_object_dispose(&v18, 8);

}

void __76__GEODaemon_pairedDeviceConnection_handleIncomingMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  const char *v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    GEOGetGEODaemonLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "type");
      if ((int)v8 <= 99)
      {
        if ((_DWORD)v8)
        {
          if ((_DWORD)v8 == 1)
          {
            v7 = CFSTR("PING");
          }
          else if ((_DWORD)v8 == 2)
          {
            v7 = CFSTR("GET_STORAGE_INFO");
          }
          else
          {
LABEL_26:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v7 = CFSTR("INVALID");
        }
      }
      else
      {
        switch((int)v8)
        {
          case 'd':
            v7 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
            break;
          case 'e':
            v7 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
            break;
          case 'f':
            v7 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'g':
            v7 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'h':
            v7 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
            break;
          case 'i':
            v7 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
            break;
          default:
            goto LABEL_26;
        }
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      v9 = "No handler is registered for paired device message %{public}@";
      goto LABEL_37;
    }
LABEL_38:

    goto LABEL_39;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "handleIncomingPairedDeviceMessage:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    GEOGetGEODaemonLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "type");
      if ((int)v6 <= 99)
      {
        if ((_DWORD)v6)
        {
          if ((_DWORD)v6 == 1)
          {
            v7 = CFSTR("PING");
          }
          else if ((_DWORD)v6 == 2)
          {
            v7 = CFSTR("GET_STORAGE_INFO");
          }
          else
          {
LABEL_35:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v7 = CFSTR("INVALID");
        }
      }
      else
      {
        switch((int)v6)
        {
          case 'd':
            v7 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
            break;
          case 'e':
            v7 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
            break;
          case 'f':
            v7 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'g':
            v7 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'h':
            v7 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
            break;
          case 'i':
            v7 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
            break;
          default:
            goto LABEL_35;
        }
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      v9 = "Unhandled message: %{public}@";
LABEL_37:
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_FAULT, v9, buf, 0xCu);

      goto LABEL_38;
    }
    goto LABEL_38;
  }
LABEL_39:

}

- (void)pairedDeviceConnectionNeedsStateSynchronization:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  GEOGetGEODaemonLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Requested paired device state synchronization", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_servers, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "serverClass"), "performsPairedDeviceSynchronization"))
        {
          objc_msgSend(v10, "server");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            objc_msgSend(v10, "startServerWithDaemon:", self);
          objc_msgSend(v10, "server");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNeedsPairedDeviceSynchronization");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

}

- (void)addServerClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSMutableArray *serversToStart;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableDictionary *servers;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *pairedDeviceMessageTypeToServerIdentifier;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[objc_class identifier](a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_servers, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_servers objectForKey:identifier] == ((void *)0)", buf, 2u);
    }
  }
  else
  {
    +[_GEOServerProxy proxyForClass:](_GEOServerProxy, "proxyForClass:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isGUIUser");

    if (v9)
    {
      v10 = -[objc_class launchMode](a3, "launchMode");
      if (v10 == 2)
      {
        objc_msgSend(v7, "startServerWithDaemon:", self);
      }
      else if (v10 == 1)
      {
        serversToStart = self->_serversToStart;
        if (!serversToStart)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          v13 = self->_serversToStart;
          self->_serversToStart = v12;

          serversToStart = self->_serversToStart;
        }
        -[NSMutableArray addObject:](serversToStart, "addObject:", v7);
      }
    }
    servers = self->_servers;
    if (!servers)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = self->_servers;
      self->_servers = v15;

      servers = self->_servers;
    }
    -[NSMutableDictionary setObject:forKey:](servers, "setObject:forKey:", v7, v5);
    -[objc_class handledPairedDeviceMessageTypes](a3, "handledPairedDeviceMessageTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      if (!self->_pairedDeviceMessageTypeToServerIdentifier)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        pairedDeviceMessageTypeToServerIdentifier = self->_pairedDeviceMessageTypeToServerIdentifier;
        self->_pairedDeviceMessageTypeToServerIdentifier = v18;

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = v17;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24);
            -[NSMutableDictionary objectForKey:](self->_pairedDeviceMessageTypeToServerIdentifier, "objectForKey:", v25, (_QWORD)v28);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_pairedDeviceMessageTypeToServerIdentifier objectForKey:messageType] == nil", buf, 2u);
            }
            -[NSMutableDictionary setObject:forKey:](self->_pairedDeviceMessageTypeToServerIdentifier, "setObject:forKey:", v5, v25);
            ++v24;
          }
          while (v22 != v24);
          v27 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          v22 = v27;
        }
        while (v27);
      }

    }
  }

}

- (void)addServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GEODaemon *v7;
  void *v8;
  NSMutableDictionary *servers;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *pairedDeviceMessageTypeToServerIdentifier;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_servers, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E0C81028];
    v24 = "Assertion failed: [_servers objectForKey:identifier] == ((void *)0)";
LABEL_26:
    _os_log_fault_impl(&dword_1885A9000, v23, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_21;
  }
  objc_msgSend(v4, "daemon");
  v7 = (GEODaemon *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E0C81028];
    v24 = "Assertion failed: server.daemon == self";
    goto LABEL_26;
  }
  +[_GEOServerProxy proxyForServer:daemon:](_GEOServerProxy, "proxyForServer:daemon:", v4, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  servers = self->_servers;
  if (!servers)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_servers;
    self->_servers = v10;

    servers = self->_servers;
  }
  -[NSMutableDictionary setObject:forKey:](servers, "setObject:forKey:", v8, v5);
  objc_msgSend((id)objc_opt_class(), "handledPairedDeviceMessageTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v25 = v8;
    if (!self->_pairedDeviceMessageTypeToServerIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      pairedDeviceMessageTypeToServerIdentifier = self->_pairedDeviceMessageTypeToServerIdentifier;
      self->_pairedDeviceMessageTypeToServerIdentifier = v13;

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
          -[NSMutableDictionary objectForKey:](self->_pairedDeviceMessageTypeToServerIdentifier, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_pairedDeviceMessageTypeToServerIdentifier objectForKey:messageType] == nil", buf, 2u);
          }
          -[NSMutableDictionary setObject:forKey:](self->_pairedDeviceMessageTypeToServerIdentifier, "setObject:forKey:", v5, v20);
          ++v19;
        }
        while (v17 != v19);
        v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v17 = v22;
      }
      while (v22);
    }

    v8 = v25;
  }

LABEL_21:
}

- (void)dealloc
{
  NSObject *sigInfoSrc;
  void *v4;
  void *v5;
  objc_super v6;

  sigInfoSrc = self->_sigInfoSrc;
  if (sigInfoSrc)
    dispatch_source_set_event_handler(sigInfoSrc, &__block_literal_global_38_2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("GEODaemomDidTerminateNotification"), 0);

  GEOUnregisterStateCaptureLegacy();
  v6.receiver = self;
  v6.super_class = (Class)GEODaemon;
  -[GEODaemon dealloc](&v6, sel_dealloc);
}

- (void)_localeChanged:(id)a3
{
  void *v4;
  NSString *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSString *knownLocale;
  int v10;
  NSString *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geo_languageAndLocale");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  v6 = -[NSString isEqual:](self->_knownLocale, "isEqual:", v5);
  GEOGetGEODaemonLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Locale changed but identifier is still \"%@\", not exiting", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    if (v8)
    {
      knownLocale = self->_knownLocale;
      v10 = 138412546;
      v11 = knownLocale;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Locale changed from \"%@\" -> \"%@\", exiting soon ...", (uint8_t *)&v10, 0x16u);
    }

    -[GEODaemon shutdown](self, "shutdown");
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, servers: %@> peers: %@"), objc_opt_class(), self, self->_servers, self->_peers);
}

- (void)_logState
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOGetGEODaemonLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[GEODaemon captureStatePlistWithHints:](self, "captureStatePlistWithHints:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);

  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v3;
  id *p_isa;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  p_isa = (id *)&self->super.isa;
  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("servers");
  v5 = -[NSMutableDictionary count](self->_servers, "count", a3);
  if (v5)
  {
    objc_msgSend(p_isa[1], "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_geo_map:", &__block_literal_global_47_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  v11[1] = CFSTR("peers");
  v12[0] = v6;
  v7 = objc_msgSend(p_isa[3], "count");
  if (v7)
  {
    objc_msgSend(p_isa[3], "allObjects");
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "_geo_map:", &__block_literal_global_56_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  if (v5)
  {

  }
  return v9;
}

id __40__GEODaemon_captureStatePlistWithHints___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("class");
  v2 = a2;
  NSStringFromClass((Class)objc_msgSend(v2, "serverClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("identifier");
  v9[0] = v3;
  v4 = (void *)objc_msgSend(v2, "serverClass");

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__GEODaemon_captureStatePlistWithHints___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v11[0] = CFSTR("id");
  objc_msgSend(v2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "peerID");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("nil");
  }
  v12[0] = v4;
  v11[1] = CFSTR("bundleIdentifier");
  objc_msgSend(v2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("nil");
  }
  v12[1] = v6;
  v11[2] = CFSTR("debugIdentifier");
  objc_msgSend(v2, "debugIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v2, "debugIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("nil");
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)

  if (v5)
  if (v3)

  return v9;
}

- (OS_dispatch_queue)submitBGSTQueue
{
  return self->_submitBGSTQueue;
}

- (GEOPairedDeviceConnection)devConnection
{
  return (GEOPairedDeviceConnection *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceMessageTypeToServerIdentifier, 0);
  objc_storeStrong((id *)&self->_devConnection, 0);
  objc_storeStrong((id *)&self->_submitBGSTQueue, 0);
  objc_storeStrong((id *)&self->_knownLocale, 0);
  objc_storeStrong((id *)&self->_offlineServiceConenction, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_sigUsr2Src, 0);
  objc_storeStrong((id *)&self->_sigUsr1Src, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_sigInfoSrc, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_serversToStart, 0);
  objc_storeStrong((id *)&self->_servers, 0);
}

@end
