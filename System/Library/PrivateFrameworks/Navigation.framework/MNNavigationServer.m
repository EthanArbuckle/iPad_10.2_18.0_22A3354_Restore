@implementation MNNavigationServer

+ (id)sharedServer
{
  if (qword_1ED0C3E38 != -1)
    dispatch_once(&qword_1ED0C3E38, &__block_literal_global_4);
  return (id)_MergedGlobals_18;
}

void __34__MNNavigationServer_sharedServer__block_invoke()
{
  MNNavigationServer *v0;
  void *v1;

  v0 = objc_alloc_init(MNNavigationServer);
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = (uint64_t)v0;

}

- (MNNavigationServer)init
{
  MNNavigationServer *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSXPCListener *listener;
  void *v7;
  id v8;
  void *v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MNNavigationServer;
  v2 = -[MNNavigationServer init](&v12, sel_init);
  if (v2)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "Starting MNNavigationServer", v11, 2u);
    }

    NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)_MNNavigationServerExceptionHandler);
    -[MNNavigationServer _resetDetails](v2, "_resetDetails");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__defaultsDidChange, *MEMORY[0x1E0C99720], 0);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.navigationService"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0D276B0]);
    objc_msgSend(v7, "registerTileDecoder:", v8);
    MNRunAsynchronouslyOnMainThread(&__block_literal_global_16);
    dispatch_get_global_queue(21, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

  }
  return v2;
}

void __26__MNNavigationServer_init__block_invoke()
{
  id v0;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "start");

}

- (void)dealloc
{
  void *v3;
  NSXPCListener *listener;
  objc_super v5;

  GEOUnregisterStateCaptureLegacy();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  -[MNNavigationServiceLocalProxy stopNavigationWithReason:](self->_localProxy, "stopNavigationWithReason:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  listener = self->_listener;
  self->_listener = 0;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServer;
  -[MNNavigationServer dealloc](&v5, sel_dealloc);
}

- (void)_resetDetails
{
  MNNavigationDetails *v3;
  MNNavigationDetails *details;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = -[MNNavigationDetails initForServer:]([MNNavigationDetails alloc], "initForServer:", 1);
  details = self->_details;
  self->_details = v3;

  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "Resetting navigation details.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MNNavigationServer__resetDetails__block_invoke;
  v6[3] = &unk_1E61D1CC0;
  v6[4] = self;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v6);
}

uint64_t __35__MNNavigationServer__resetDetails__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateNavigationDetails:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_defaultsDidChange
{
  NSObject *v2;
  uint8_t v3[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "Locale changed. Killing navd.", v3, 2u);
  }

  exit(0);
}

- (void)_enumerateRemoteObjectsWithHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__MNNavigationServer__enumerateRemoteObjectsWithHandler___block_invoke;
    v6[3] = &unk_1E61D1CE8;
    v6[4] = self;
    v7 = v4;
    MNRunAsynchronouslyOnMainThread(v6);

  }
}

void __57__MNNavigationServer__enumerateRemoteObjectsWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0x1E0CB3000uLL;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 136316162;
    v15 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "connection", v15, (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "remoteObjectProxy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v11 = v6;
          objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("No remote object found on connection"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v21 = "-[MNNavigationServer _enumerateRemoteObjectsWithHandler:]_block_invoke";
            v22 = 2080;
            v23 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
            v24 = 1024;
            v25 = 142;
            v26 = 2080;
            v27 = "remoteObject != nil";
            v28 = 2112;
            v29 = v12;
            _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

          v6 = v11;
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        ++v8;
      }
      while (v5 != v8);
      v14 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
      v5 = v14;
    }
    while (v14);
  }

}

- (id)_peerDescriptions
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableSet count](self->_peers, "count"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_peers, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_peers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_peerDidDisconnect:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__MNNavigationServer__peerDidDisconnect___block_invoke;
  v6[3] = &unk_1E61D1D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  MNRunAsynchronouslyOnMainThread(v6);

}

uint64_t __41__MNNavigationServer__peerDidDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t result;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "clearConnection");
  objc_msgSend(*(id *)(a1 + 40), "peerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Maps")))
  {

LABEL_5:
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    if (result)
      return result;
    goto LABEL_6;
  }
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "state");

  if (v3 <= 2)
    goto LABEL_5;
LABEL_6:
  v5 = -[MNNavigationDetails initForServer:]([MNNavigationDetails alloc], "initForServer:", 1);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "reset");
  return objc_msgSend(*(id *)(a1 + 32), "_resetDetails");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  MNNavigationServer *v10;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke;
  v8[3] = &unk_1E61D1D10;
  v9 = v5;
  v10 = self;
  v6 = v5;
  MNRunAsynchronouslyOnMainThread(v8);

  return 1;
}

void __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  MNNavigationServicePeer *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MNNavigationServiceLocalProxy *v18;
  uint64_t v19;
  void *v20;
  MNNavigationServiceEmptyProxy *v21;
  uint64_t v22;
  MNNavigationServicePeer *v23;
  MNNavigationServicePeer *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  MNNavigationServicePeer *v42;
  id v43;
  _QWORD v44[4];
  MNNavigationServicePeer *v45;
  id v46;
  uint8_t buf[4];
  MNNavigationServicePeer *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = -[MNNavigationServicePeer initWithConnection:]([MNNavigationServicePeer alloc], "initWithConnection:", *(_QWORD *)(a1 + 32));
  v3 = -[GEONavdPeer hasEntitlement:](v2, "hasEntitlement:", CFSTR("com.apple.navigation.spi"));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "currentStateType");
      if (v7 > 6)
        v8 = CFSTR("MNNavigationStateTypeInvalid");
      else
        v8 = (const __CFString *)*((_QWORD *)&off_1E61D1FB0 + v7);
      *(_DWORD *)buf = 138412546;
      v48 = v2;
      v49 = 2112;
      v50 = v8;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Peer %@ connected to navd. Current navigation service state: %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v2;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Peer %@ connected to navd, but doesn't have the proper entitlement.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEED5B90);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setRoutesForPreview_selectedRouteIndex_, 0, 0);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_rerouteWithWaypoints_, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "setExportedInterface:", v9);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEED23B0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectInterface:", v16);

  if (-[MNNavigationServicePeer isEntitled](v2, "isEntitled"))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (!v17)
    {
      v18 = objc_alloc_init(MNNavigationServiceLocalProxy);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "start");
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    }
    objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", v17);
  }
  else
  {
    v21 = -[MNNavigationServiceEmptyProxy initWithPeer:]([MNNavigationServiceEmptyProxy alloc], "initWithPeer:", v2);
    objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", v21);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v22 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_264;
  v44[3] = &unk_1E61D1D38;
  v23 = v2;
  v45 = v23;
  objc_copyWeak(&v46, (id *)buf);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", v44);
  v41[0] = v22;
  v41[1] = 3221225472;
  v41[2] = __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_265;
  v41[3] = &unk_1E61D1D38;
  v24 = v23;
  v42 = v24;
  objc_copyWeak(&v43, (id *)buf);
  objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", v41);
  objc_msgSend(*(id *)(a1 + 32), "resume");
  v25 = -[MNNavigationServicePeer isEntitled](v24, "isEntitled");
  v26 = *(_QWORD *)(a1 + 40);
  if (v25)
  {
    v27 = *(void **)(v26 + 16);
    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(void **)(v29 + 16);
      *(_QWORD *)(v29 + 16) = v28;

      v27 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    }
    objc_msgSend(v27, "addObject:", v24);
    -[GEONavdPeer connection](v24, "connection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "remoteObjectProxy");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationServiceProxy:didUpdateNavigationDetails:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  }
  else
  {
    v33 = *(void **)(v26 + 24);
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(a1 + 40);
      v36 = *(void **)(v35 + 24);
      *(_QWORD *)(v35 + 24) = v34;

      v33 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    }
    objc_msgSend(v33, "addObject:", v24);
    v37 = (void *)MEMORY[0x1E0CB3940];
    -[MNNavigationServicePeer peerIdentifier](v24, "peerIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%@ is missing the navigation service entitlement."), v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", 1, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavdPeer connection](v24, "connection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "remoteObjectProxy");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "navigationServiceProxy:didFailWithError:", 0, v32);

  }
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);

}

void __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_264(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "Peer invalidated: %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_peerDidDisconnect:", *(_QWORD *)(a1 + 32));

}

void __57__MNNavigationServer_listener_shouldAcceptNewConnection___block_invoke_265(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Peer interrupted: %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_peerDidDisconnect:", *(_QWORD *)(a1 + 32));

}

- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__MNNavigationServer_navigationServiceProxy_willChangeFromState_toState___block_invoke;
  v5[3] = &unk_1E61D1D60;
  v5[5] = a4;
  v5[6] = a5;
  v5[4] = self;
  MNRunAsynchronouslyOnMainThread(v5);
}

void __73__MNNavigationServer_navigationServiceProxy_willChangeFromState_toState___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  char *v3;
  char *v4;
  int v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    MNNavigationServiceStateAsString(a1[5]);
    v3 = (char *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(a1[6]);
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1[4] + 16), "count");
    *(_DWORD *)buf = 138412802;
    v22 = v3;
    v23 = 2112;
    v24 = v4;
    v25 = 1024;
    v26 = v5;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "MNNavigationServer sending willChangeFromState: '%@' toState: '%@' to %d peers.", buf, 0x1Cu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *(id *)(a1[4] + 16);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    *(_QWORD *)&v8 = 136315650;
    v15 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "connection", v15, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "remoteObjectProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "navigationServiceProxy:willChangeFromState:toState:", 0, a1[5], a1[6]);
        }
        else
        {
          GEOFindOrCreateLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v22 = "-[MNNavigationServer navigationServiceProxy:willChangeFromState:toState:]_block_invoke";
            v23 = 2080;
            v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
            v25 = 1024;
            v26 = 268;
            _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  _QWORD v8[7];

  -[MNNavigationDetails setState:](self->_details, "setState:", a5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MNNavigationServer_navigationServiceProxy_didChangeFromState_toState___block_invoke;
  v8[3] = &unk_1E61D1D60;
  v8[5] = a4;
  v8[6] = a5;
  v8[4] = self;
  MNRunAsynchronouslyOnMainThread(v8);
  if (!a5)
    -[MNNavigationServer _resetDetails](self, "_resetDetails");
}

void __72__MNNavigationServer_navigationServiceProxy_didChangeFromState_toState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  char *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationXPCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    MNNavigationServiceStateAsString(*(_QWORD *)(a1 + 40));
    v3 = (char *)objc_claimAutoreleasedReturnValue();
    MNNavigationServiceStateAsString(*(_QWORD *)(a1 + 48));
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    objc_msgSend(*(id *)(a1 + 32), "_peerDescriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n\t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v3;
    v25 = 2112;
    v26 = v4;
    v27 = 1024;
    v28 = v5;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "MNNavigationServer sending didChangeFromState: '%@' toState: '%@' to %d peers:\n\t%@", buf, 0x26u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    *(_QWORD *)&v10 = 136315650;
    v17 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "connection", v17, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "remoteObjectProxy");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "navigationServiceProxy:didChangeFromState:toState:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
        else
        {
          GEOFindOrCreateLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = "-[MNNavigationServer navigationServiceProxy:didChangeFromState:toState:]_block_invoke";
            v25 = 2080;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
            v27 = 1024;
            v28 = 288;
            _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315650;
    v6 = "-[MNNavigationServer navigationServiceProxy:didUpdateNavigationDetails:]";
    v7 = 2080;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationServer.m";
    v9 = 1024;
    v10 = 300;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v5, 0x1Cu);
  }

}

- (void)navigationServiceProxyWillPauseNavigation:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_272);
}

uint64_t __64__MNNavigationServer_navigationServiceProxyWillPauseNavigation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyWillPauseNavigation:", 0);
}

- (void)navigationServiceProxyWillResumeFromPauseNavigation:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_273);
}

uint64_t __74__MNNavigationServer_navigationServiceProxyWillResumeFromPauseNavigation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyWillResumeFromPauseNavigation:", 0);
}

- (void)navigationServiceProxy:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MNNavigationServer_navigationServiceProxy_didFailWithError___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __62__MNNavigationServer_navigationServiceProxy_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didFailWithError:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didChangeNavigationState:(int)a4
{
  _QWORD v6[4];
  int v7;

  -[MNNavigationDetails setNavigationState:](self->_details, "setNavigationState:", *(_QWORD *)&a4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__MNNavigationServer_navigationServiceProxy_didChangeNavigationState___block_invoke;
  v6[3] = &__block_descriptor_36_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v7 = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v6);
}

uint64_t __70__MNNavigationServer_navigationServiceProxy_didChangeNavigationState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didChangeNavigationState:", 0, *(unsigned int *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  _QWORD v8[6];

  -[MNNavigationDetails setDisplayedStepIndex:](self->_details, "setDisplayedStepIndex:", a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__MNNavigationServer_navigationServiceProxy_didUpdateDisplayedStepIndex_segmentIndex___block_invoke;
  v8[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v8[4] = a4;
  v8[5] = a5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v8);
}

uint64_t __86__MNNavigationServer_navigationServiceProxy_didUpdateDisplayedStepIndex_segmentIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateDisplayedStepIndex:segmentIndex:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  _QWORD v10[7];

  -[MNNavigationDetails setDistanceUntilManeuver:](self->_details, "setDistanceUntilManeuver:", a3);
  -[MNNavigationDetails setTimeUntilManeuver:](self->_details, "setTimeUntilManeuver:", a5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilManeuver_timeUntilManeuver_forStepIndex___block_invoke;
  v10[3] = &__block_descriptor_56_e46_v16__0___MNNavigationServiceClientInterface__8l;
  *(double *)&v10[4] = a4;
  *(double *)&v10[5] = a5;
  v10[6] = a6;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v10);
}

uint64_t __107__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilManeuver_timeUntilManeuver_forStepIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:", 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)navigationServiceProxyDidFinishLocationUpdate:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_277);
}

uint64_t __68__MNNavigationServer_navigationServiceProxyDidFinishLocationUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyDidFinishLocationUpdate:", 0);
}

- (void)navigationServiceProxy:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__MNNavigationServer_navigationServiceProxy_isApproachingEndOfLeg___block_invoke;
  v4[3] = &__block_descriptor_40_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v4[4] = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v4);
}

uint64_t __67__MNNavigationServer_navigationServiceProxy_isApproachingEndOfLeg___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:isApproachingEndOfLeg:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__MNNavigationServer_navigationServiceProxy_didEnterPreArrivalStateForWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E61D1E68;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v9);

}

uint64_t __94__MNNavigationServer_navigationServiceProxy_didEnterPreArrivalStateForWaypoint_endOfLegIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didEnterPreArrivalStateForWaypoint:endOfLegIndex:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__MNNavigationServer_navigationServiceProxy_didArriveAtWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E61D1E68;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v9);

}

uint64_t __79__MNNavigationServer_navigationServiceProxy_didArriveAtWaypoint_endOfLegIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didArriveAtWaypoint:endOfLegIndex:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__MNNavigationServer_navigationServiceProxy_didResumeNavigatingFromWaypoint_endOfLegIndex_reason___block_invoke;
  v11[3] = &unk_1E61D1E90;
  v12 = v9;
  v13 = a5;
  v14 = a6;
  v10 = v9;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v11);

}

uint64_t __98__MNNavigationServer_navigationServiceProxy_didResumeNavigatingFromWaypoint_endOfLegIndex_reason___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", 0, a1[4], a1[5], a1[6]);
}

- (void)navigationServiceProxyDidEnterPreArrivalState:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_279);
}

uint64_t __68__MNNavigationServer_navigationServiceProxyDidEnterPreArrivalState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyDidEnterPreArrivalState:", 0);
}

- (void)navigationServiceProxyDidArrive:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_280);
}

uint64_t __54__MNNavigationServer_navigationServiceProxyDidArrive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyDidArrive:", 0);
}

- (void)navigationServiceProxy:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;
  unint64_t v14;

  v9 = a5;
  -[MNNavigationDetails setProceedToRouteDistance:](self->_details, "setProceedToRouteDistance:", a4);
  -[MNNavigationDetails setDisplayString:](self->_details, "setDisplayString:", v9);
  -[MNNavigationDetails setClosestStepIndex:](self->_details, "setClosestStepIndex:", a6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__MNNavigationServer_navigationServiceProxy_didUpdateProceedToRouteDistance_displayString_closestStepIndex___block_invoke;
  v11[3] = &unk_1E61D1E90;
  v13 = a4;
  v12 = v9;
  v14 = a6;
  v10 = v9;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v11);

}

uint64_t __108__MNNavigationServer_navigationServiceProxy_didUpdateProceedToRouteDistance_displayString_closestStepIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateProceedToRouteDistance:displayString:closestStepIndex:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  _QWORD v10[7];

  -[MNNavigationDetails setDistanceUntilSign:](self->_details, "setDistanceUntilSign:", a3);
  -[MNNavigationDetails setTimeUntilSign:](self->_details, "setTimeUntilSign:", a5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilSign_timeUntilSign_forStepIndex___block_invoke;
  v10[3] = &__block_descriptor_56_e46_v16__0___MNNavigationServiceClientInterface__8l;
  *(double *)&v10[4] = a4;
  *(double *)&v10[5] = a5;
  v10[6] = a6;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v10);
}

uint64_t __99__MNNavigationServer_navigationServiceProxy_didUpdateDistanceUntilSign_timeUntilSign_forStepIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateDistanceUntilSign:timeUntilSign:forStepIndex:", 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MNNavigationServer_navigationServiceProxy_willAnnounce_inSeconds___block_invoke;
  v5[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5[4] = a4;
  *(double *)&v5[5] = a5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v5);
}

uint64_t __68__MNNavigationServer_navigationServiceProxy_willAnnounce_inSeconds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:willAnnounce:inSeconds:", 0, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  int v26;
  int v27;
  BOOL v28;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __141__MNNavigationServer_navigationServiceProxy_displayPrimaryStep_instructions_shieldType_shieldText_drivingSide_maneuverStepIndex_isSynthetic___block_invoke;
  v21[3] = &unk_1E61D1ED8;
  v22 = v15;
  v23 = v16;
  v26 = a6;
  v27 = a8;
  v24 = v17;
  v25 = a9;
  v28 = a10;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v21);

}

uint64_t __141__MNNavigationServer_navigationServiceProxy_displayPrimaryStep_instructions_shieldType_shieldText_drivingSide_maneuverStepIndex_isSynthetic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  LOBYTE(v3) = *(_BYTE *)(a1 + 72);
  return objc_msgSend(a2, "navigationServiceProxy:displayPrimaryStep:instructions:shieldType:shieldText:drivingSide:maneuverStepIndex:isSynthetic:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 56), v3);
}

- (void)navigationServiceProxy:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__MNNavigationServer_navigationServiceProxy_displayManeuverAlertForAnnouncementStage___block_invoke;
  v4[3] = &__block_descriptor_40_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v4[4] = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v4);
}

uint64_t __86__MNNavigationServer_navigationServiceProxy_displayManeuverAlertForAnnouncementStage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:displayManeuverAlertForAnnouncementStage:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int v23;
  int v24;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__MNNavigationServer_navigationServiceProxy_displaySecondaryStep_instructions_shieldType_shieldText_drivingSide___block_invoke;
  v19[3] = &unk_1E61D1F00;
  v20 = v13;
  v21 = v14;
  v22 = v15;
  v23 = a6;
  v24 = a8;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v19);

}

uint64_t __113__MNNavigationServer_navigationServiceProxy_displaySecondaryStep_instructions_shieldType_shieldText_drivingSide___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:displaySecondaryStep:instructions:shieldType:shieldText:drivingSide:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 60));
}

- (void)navigationServiceProxyHideSecondaryStep:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_281);
}

uint64_t __62__MNNavigationServer_navigationServiceProxyHideSecondaryStep___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyHideSecondaryStep:", 0);
}

- (void)navigationServiceProxyBeginGuidanceUpdate:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_282);
}

uint64_t __64__MNNavigationServer_navigationServiceProxyBeginGuidanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyBeginGuidanceUpdate:", 0);
}

- (void)navigationServiceProxyEndGuidanceUpdate:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_283);
}

uint64_t __62__MNNavigationServer_navigationServiceProxyEndGuidanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyEndGuidanceUpdate:", 0);
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MNNavigationServer_navigationServiceProxy_updateSignsWithInfo___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __65__MNNavigationServer_navigationServiceProxy_updateSignsWithInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:updateSignsWithInfo:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MNNavigationServer_navigationServiceProxy_updateSignsWithARInfo___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __67__MNNavigationServer_navigationServiceProxy_updateSignsWithARInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:updateSignsWithARInfo:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 usePersistentDisplay:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MNNavigationServer_navigationServiceProxy_usePersistentDisplay___block_invoke;
  v4[3] = &__block_descriptor_33_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5 = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v4);
}

uint64_t __66__MNNavigationServer_navigationServiceProxy_usePersistentDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:usePersistentDisplay:", 0, *(unsigned __int8 *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 showLaneDirections:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MNNavigationServer_navigationServiceProxy_showLaneDirections___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __64__MNNavigationServer_navigationServiceProxy_showLaneDirections___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:showLaneDirections:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 hideLaneDirectionsForId:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MNNavigationServer_navigationServiceProxy_hideLaneDirectionsForId___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __69__MNNavigationServer_navigationServiceProxy_hideLaneDirectionsForId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:hideLaneDirectionsForId:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 showJunctionView:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MNNavigationServer_navigationServiceProxy_showJunctionView___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __62__MNNavigationServer_navigationServiceProxy_showJunctionView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:showJunctionView:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 hideJunctionViewForId:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MNNavigationServer_navigationServiceProxy_hideJunctionViewForId___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __67__MNNavigationServer_navigationServiceProxy_hideJunctionViewForId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:hideJunctionViewForId:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  _QWORD v6[4];
  BOOL v7;

  -[MNNavigationDetails setGuidancePromptsEnabled:](self->_details, "setGuidancePromptsEnabled:", a4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__MNNavigationServer_navigationServiceProxy_didEnableGuidancePrompts___block_invoke;
  v6[3] = &__block_descriptor_33_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v7 = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v6);
}

uint64_t __70__MNNavigationServer_navigationServiceProxy_didEnableGuidancePrompts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didEnableGuidancePrompts:", 0, *(unsigned __int8 *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 newGuidanceEventFeedback:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__MNNavigationServer_navigationServiceProxy_newGuidanceEventFeedback___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __70__MNNavigationServer_navigationServiceProxy_newGuidanceEventFeedback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:newGuidanceEventFeedback:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__MNNavigationServer_navigationServiceProxy_updatedGuidanceEventFeedback___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __74__MNNavigationServer_navigationServiceProxy_updatedGuidanceEventFeedback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:updatedGuidanceEventFeedback:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__MNNavigationServer_navigationServiceProxy_didReceiveRouteSignalStrength___block_invoke;
  v4[3] = &__block_descriptor_40_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v4[4] = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v4);
}

uint64_t __75__MNNavigationServer_navigationServiceProxy_didReceiveRouteSignalStrength___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didReceiveRouteSignalStrength:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  -[MNNavigationDetails updateETATrafficForRoute:](self->_details, "updateETATrafficForRoute:", v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__MNNavigationServer_navigationServiceProxy_didUpdateETAResponseForRoute___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __74__MNNavigationServer_navigationServiceProxy_didUpdateETAResponseForRoute___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateETAResponseForRoute:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__MNNavigationServer_navigationServiceProxy_didUpdateHeading_accuracy___block_invoke;
  v5[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  *(double *)&v5[4] = a4;
  *(double *)&v5[5] = a5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v5);
}

uint64_t __71__MNNavigationServer_navigationServiceProxy_didUpdateHeading_accuracy___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateHeading:accuracy:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__MNNavigationServer_navigationServiceProxy_didUpdateMotionType_confidence___block_invoke;
  v5[3] = &__block_descriptor_48_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5[4] = a4;
  v5[5] = a5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v5);
}

uint64_t __76__MNNavigationServer_navigationServiceProxy_didUpdateMotionType_confidence___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateMotionType:confidence:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)navigationServiceProxy:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v7 = a4;
  -[MNNavigationDetails setPreviewRoutes:withSelectedRouteIndex:](self->_details, "setPreviewRoutes:withSelectedRouteIndex:", v7, a5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__MNNavigationServer_navigationServiceProxy_didUpdatePreviewRoutes_withSelectedRouteIndex___block_invoke;
  v9[3] = &unk_1E61D1E68;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v9);

}

uint64_t __91__MNNavigationServer_navigationServiceProxy_didUpdatePreviewRoutes_withSelectedRouteIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdatePreviewRoutes:withSelectedRouteIndex:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)navigationServiceProxyWillReroute:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_285);
}

uint64_t __56__MNNavigationServer_navigationServiceProxyWillReroute___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyWillReroute:", 0);
}

- (void)navigationServiceProxy:(id)a3 didRerouteWithRoute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MNNavigationDetails setCurrentRoute:withAlternateRoutes:](self->_details, "setCurrentRoute:withAlternateRoutes:", v11, v13);
  -[MNNavigationDetails setLocation:](self->_details, "setLocation:", v12);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __112__MNNavigationServer_navigationServiceProxy_didRerouteWithRoute_withLocation_withAlternateRoutes_rerouteReason___block_invoke;
  v17[3] = &unk_1E61D1F00;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v21 = a7;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v17);

}

uint64_t __112__MNNavigationServer_navigationServiceProxy_didRerouteWithRoute_withLocation_withAlternateRoutes_rerouteReason___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didRerouteWithRoute:withLocation:withAlternateRoutes:rerouteReason:", 0, a1[4], a1[5], a1[6], a1[7]);
}

- (void)navigationServiceProxyDidCancelReroute:(id)a3
{
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", &__block_literal_global_286);
}

uint64_t __61__MNNavigationServer_navigationServiceProxyDidCancelReroute___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxyDidCancelReroute:", 0);
}

- (void)navigationServiceProxy:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__MNNavigationServer_navigationServiceProxy_didUpdateRouteWithNewRideSelection___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __80__MNNavigationServer_navigationServiceProxy_didUpdateRouteWithNewRideSelection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateRouteWithNewRideSelection:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int v11;

  v7 = a5;
  -[MNNavigationDetails setCurrentRoute:withAlternateRoutes:](self->_details, "setCurrentRoute:withAlternateRoutes:", v7, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__MNNavigationServer_navigationServiceProxy_didSwitchToNewTransportType_newRoute___block_invoke;
  v9[3] = &unk_1E61D1F68;
  v11 = a4;
  v10 = v7;
  v8 = v7;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v9);

}

uint64_t __82__MNNavigationServer_navigationServiceProxy_didSwitchToNewTransportType_newRoute___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didSwitchToNewTransportType:newRoute:", 0, *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didFailRerouteWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MNNavigationServer_navigationServiceProxy_didFailRerouteWithError___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __69__MNNavigationServer_navigationServiceProxy_didFailRerouteWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didFailRerouteWithError:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  -[MNNavigationDetails setAlternateRoutes:](self->_details, "setAlternateRoutes:", v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__MNNavigationServer_navigationServiceProxy_didUpdateAlternateRoutes___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __70__MNNavigationServer_navigationServiceProxy_didUpdateAlternateRoutes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateAlternateRoutes:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didReceiveTrafficIncidentAlert:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__MNNavigationServer_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __76__MNNavigationServer_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didReceiveTrafficIncidentAlert:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = -[MNNavigationDetails updateWithTrafficIncidentAlert:](self->_details, "updateWithTrafficIncidentAlert:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__MNNavigationServer_navigationServiceProxy_didUpdateTrafficIncidentAlert___block_invoke;
  v8[3] = &unk_1E61D1CC0;
  v9 = v5;
  v7 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v8);

}

uint64_t __75__MNNavigationServer_navigationServiceProxy_didUpdateTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateTrafficIncidentAlert:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = -[MNNavigationDetails removeTrafficIncidentAlert:](self->_details, "removeTrafficIncidentAlert:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__MNNavigationServer_navigationServiceProxy_didInvalidateTrafficIncidentAlert___block_invoke;
  v8[3] = &unk_1E61D1CC0;
  v9 = v5;
  v7 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v8);

}

uint64_t __79__MNNavigationServer_navigationServiceProxy_didInvalidateTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didInvalidateTrafficIncidentAlert:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__MNNavigationServer_navigationServiceProxy_didDismissTrafficIncidentAlert___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __76__MNNavigationServer_navigationServiceProxy_didDismissTrafficIncidentAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didDismissTrafficIncidentAlert:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  MNNavigationDetails *details;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  switch(objc_msgSend(v5, "eventType"))
  {
    case 1:
      objc_msgSend(v5, "tracePath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails setTracePath:](self->_details, "setTracePath:", v6);

      objc_msgSend(v5, "traceDuration");
      -[MNNavigationDetails setTraceDuration:](self->_details, "setTraceDuration:");
      objc_msgSend(v5, "bookmarks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails setTraceBookmarks:](self->_details, "setTraceBookmarks:", v7);

      goto LABEL_4;
    case 2:
LABEL_4:
      details = self->_details;
      v9 = 1;
      goto LABEL_6;
    case 3:
      details = self->_details;
      v9 = 0;
LABEL_6:
      -[MNNavigationDetails setTraceIsPlaying:](details, "setTraceIsPlaying:", v9);
      break;
    case 4:
    case 5:
      objc_msgSend(v5, "currentPosition");
      -[MNNavigationDetails setTracePosition:](self->_details, "setTracePosition:");
      break;
    case 6:
      objc_msgSend(v5, "bookmarks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails setTraceBookmarks:](self->_details, "setTraceBookmarks:", v10);
      goto LABEL_9;
    case 7:
      objc_msgSend(v5, "tracePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails setTracePath:](self->_details, "setTracePath:", v10);
LABEL_9:

      break;
    default:
      break;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__MNNavigationServer_navigationServiceProxy_didUpdateTracePlaybackDetails___block_invoke;
  v12[3] = &unk_1E61D1CC0;
  v13 = v5;
  v11 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v12);

}

uint64_t __75__MNNavigationServer_navigationServiceProxy_didUpdateTracePlaybackDetails___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didUpdateTracePlaybackDetails:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didActivateAudioSession:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MNNavigationServer_navigationServiceProxy_didActivateAudioSession___block_invoke;
  v4[3] = &__block_descriptor_33_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5 = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v4);
}

uint64_t __69__MNNavigationServer_navigationServiceProxy_didActivateAudioSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didActivateAudioSession:", 0, *(unsigned __int8 *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didStartSpeakingPrompt:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServer_navigationServiceProxy_didStartSpeakingPrompt___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __68__MNNavigationServer_navigationServiceProxy_didStartSpeakingPrompt___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didStartSpeakingPrompt:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 willProcessSpeechEvent:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServer_navigationServiceProxy_willProcessSpeechEvent___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __68__MNNavigationServer_navigationServiceProxy_willProcessSpeechEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:willProcessSpeechEvent:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didProcessSpeechEvent:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MNNavigationServer_navigationServiceProxy_didProcessSpeechEvent___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __67__MNNavigationServer_navigationServiceProxy_didProcessSpeechEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didProcessSpeechEvent:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 triggerHaptics:(int)a4
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__MNNavigationServer_navigationServiceProxy_triggerHaptics___block_invoke;
  v4[3] = &__block_descriptor_36_e46_v16__0___MNNavigationServiceClientInterface__8l;
  v5 = a4;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v4);
}

uint64_t __60__MNNavigationServer_navigationServiceProxy_triggerHaptics___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:triggerHaptics:", 0, *(unsigned int *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 willRequestRealtimeUpdatesForRouteIDs:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__MNNavigationServer_navigationServiceProxy_willRequestRealtimeUpdatesForRouteIDs___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __83__MNNavigationServer_navigationServiceProxy_willRequestRealtimeUpdatesForRouteIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:willRequestRealtimeUpdatesForRouteIDs:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MNNavigationServer_navigationServiceProxy_didReceiveRealtimeUpdates___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __71__MNNavigationServer_navigationServiceProxy_didReceiveRealtimeUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didReceiveRealtimeUpdates:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didReceiveTransitAlert:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MNNavigationServer_navigationServiceProxy_didReceiveTransitAlert___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __68__MNNavigationServer_navigationServiceProxy_didReceiveTransitAlert___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didReceiveTransitAlert:", 0, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  -[MNNavigationDetails updateWithNavigationServiceCallbackParameters:](self->_details, "updateWithNavigationServiceCallbackParameters:", v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__MNNavigationServer_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke;
  v7[3] = &unk_1E61D1CC0;
  v8 = v5;
  v6 = v5;
  -[MNNavigationServer _enumerateRemoteObjectsWithHandler:](self, "_enumerateRemoteObjectsWithHandler:", v7);

}

uint64_t __78__MNNavigationServer_navigationServiceProxy_didSendNavigationServiceCallback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationServiceProxy:didSendNavigationServiceCallback:", 0, *(_QWORD *)(a1 + 32));
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[7];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  _QWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __49__MNNavigationServer_captureStatePlistWithHints___block_invoke;
  v35[3] = &unk_1E61D1F90;
  v35[4] = self;
  v35[5] = &v42;
  v35[6] = &v36;
  MNRunSynchronouslyOnMainThread(v35);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = (id)v43[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v55, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v6);
        v53[0] = CFSTR("name");
        objc_msgSend(v7, "peerIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = &stru_1E61D9090;
        if (v8)
          v10 = (const __CFString *)v8;
        v53[1] = CFSTR("processID");
        v54[0] = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v12);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v55, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = (id)v37[5];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v52, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        v50[0] = CFSTR("name");
        objc_msgSend(v18, "peerIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = &stru_1E61D9090;
        if (v19)
          v21 = (const __CFString *)v19;
        v50[1] = CFSTR("processID");
        v51[0] = v21;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "processIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v23);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v52, 16);
    }
    while (v15);
  }

  v48[0] = CFSTR("peers");
  v48[1] = CFSTR("unEntitledPeers");
  v49[0] = v26;
  v49[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v24;
}

void __49__MNNavigationServer_captureStatePlistWithHints___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProxy, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_unEntitledPeers, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
