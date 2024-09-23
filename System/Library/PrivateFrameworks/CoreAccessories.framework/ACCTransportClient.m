@implementation ACCTransportClient

- (ACCTransportClient)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedClient);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  ACCTransportClient *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  os_signpost_id_t v9;
  NSXPCConnection *serverConnection;
  NSMutableDictionary *v11;
  NSMutableDictionary *endpointDataOutHandlers;
  NSMutableDictionary *v13;
  NSMutableDictionary *connectionPropertyChangeHandlers;
  NSMutableDictionary *v15;
  NSMutableDictionary *endpointPropertyChangeHandlers;
  NSMutableDictionary *v17;
  NSMutableDictionary *endpointSecureTunnelDataHandlers;
  dispatch_queue_t v19;
  OS_dispatch_queue *endpointEventHandlerQueue;
  uint8_t v22[16];
  objc_super v23;

  init_logging();
  v23.receiver = self;
  v23.super_class = (Class)ACCTransportClient;
  v3 = -[ACCTransportClient init](&v23, sel_init);
  if (v3)
  {
    if (gLogSignpostObjects)
      v4 = gNumLogSignpostObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportClient _init].cold.1();
      v6 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    else
    {
      v6 = *(id *)(gLogSignpostObjects + 24);
    }
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      v7 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportClient _init].cold.1();
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v9 = os_signpost_id_make_with_pointer(v7, v3);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF649000, v6, OS_SIGNPOST_EVENT, v9, "TransportClient", "Create shared ACCTransportClient", v22, 2u);
    }

    objc_storeWeak((id *)&v3->_delegate, 0);
    serverConnection = v3->_serverConnection;
    v3->_serverConnection = 0;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointDataOutHandlers = v3->_endpointDataOutHandlers;
    v3->_endpointDataOutHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    connectionPropertyChangeHandlers = v3->_connectionPropertyChangeHandlers;
    v3->_connectionPropertyChangeHandlers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointPropertyChangeHandlers = v3->_endpointPropertyChangeHandlers;
    v3->_endpointPropertyChangeHandlers = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointSecureTunnelDataHandlers = v3->_endpointSecureTunnelDataHandlers;
    v3->_endpointSecureTunnelDataHandlers = v17;

    v19 = dispatch_queue_create("TransportClientEndpointEventHandlerQ", 0);
    endpointEventHandlerQueue = v3->_endpointEventHandlerQueue;
    v3->_endpointEventHandlerQueue = (OS_dispatch_queue *)v19;

    -[ACCTransportClient connectToServer](v3, "connectToServer");
  }
  return v3;
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  objc_super v11;
  uint8_t buf[16];

  if (gLogSignpostObjects)
    v3 = gNumLogSignpostObjects < 4;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogSignpostObjects + 24);
  }
  if (gLogSignpostObjects)
    v6 = gNumLogSignpostObjects < 4;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v8 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  else
  {
    v8 = *(id *)(gLogSignpostObjects + 24);
  }
  v9 = os_signpost_id_make_with_pointer(v8, self);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v5, OS_SIGNPOST_EVENT, v9, "TransportClient", "Destroy shared ACCTransportClient", buf, 2u);
  }

  -[ACCTransportClient serverConnection](self, "serverConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  v11.receiver = self;
  v11.super_class = (Class)ACCTransportClient;
  -[ACCTransportClient dealloc](&v11, sel_dealloc);
}

- (void)connectToServer
{
  ACCTransportClient *v2;
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[8];

  v2 = self;
  objc_sync_enter(v2);
  -[ACCTransportClient serverConnection](v2, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
    }

    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      v6 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportClient _init].cold.1();
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      v8 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportClient _init].cold.1();
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    v10 = os_signpost_id_make_with_pointer(v8, v2);

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF649000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v10, "TransportClient SERVER", "Connect to server", buf, 2u);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.accessories.transport-server"), 4096);
    -[ACCTransportClient setServerConnection:](v2, "setServerConnection:", v11);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4C150);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCTransportClient serverConnection](v2, "serverConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRemoteObjectInterface:", v12);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4A308);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCTransportClient serverConnection](v2, "serverConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExportedInterface:", v14);

    -[ACCTransportClient serverConnection](v2, "serverConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setExportedObject:", v2);

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v2);
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __37__ACCTransportClient_connectToServer__block_invoke;
    v23[3] = &unk_1E5FB2CE0;
    objc_copyWeak(&v24, (id *)buf);
    -[ACCTransportClient serverConnection](v2, "serverConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInvalidationHandler:", v23);

    objc_copyWeak(&v22, (id *)buf);
    -[ACCTransportClient serverConnection](v2, "serverConnection", v17, 3221225472, __37__ACCTransportClient_connectToServer__block_invoke_118, &unk_1E5FB2CE0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInterruptionHandler:", &v21);

    -[ACCTransportClient serverConnection](v2, "serverConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);

}

void __37__ACCTransportClient_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  os_signpost_id_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t v27[16];
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF649000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", buf, 2u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v7 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v9 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = objc_loadWeakRetained(v1);
  v12 = os_signpost_id_make_with_pointer(v9, v11);

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v7, OS_SIGNPOST_INTERVAL_END, v12, "TransportClient SERVER", "Server connection invalidated!", v27, 2u);
  }

  v13 = objc_loadWeakRetained(v1);
  objc_msgSend(v13, "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_27;
  v15 = (void *)v14;
  v16 = objc_loadWeakRetained(v1);
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v13 = objc_loadWeakRetained(v1);
    objc_msgSend(v13, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v1);
    objc_msgSend(v19, "transportClientServerDisconnected:", v20);

LABEL_27:
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = objc_loadWeakRetained(v1);
  objc_msgSend(v22, "setEndpointDataOutHandlers:", v21);

  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = objc_loadWeakRetained(v1);
  objc_msgSend(v24, "setConnectionPropertyChangeHandlers:", v23);

  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = objc_loadWeakRetained(v1);
  objc_msgSend(v26, "setEndpointPropertyChangeHandlers:", v25);

}

void __37__ACCTransportClient_connectToServer__block_invoke_118(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id *v8;
  id WeakRetained;
  os_signpost_id_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t v16[16];
  uint8_t buf[16];

  if (gLogSignpostObjects)
    v2 = gNumLogSignpostObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v4 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  else
  {
    v4 = *(id *)(gLogSignpostObjects + 24);
  }
  if (gLogSignpostObjects)
    v5 = gNumLogSignpostObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogSignpostObjects + 24);
  }
  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v8);
  v10 = os_signpost_id_make_with_pointer(v7, WeakRetained);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v4, OS_SIGNPOST_EVENT, v10, "TransportClient SERVER", "Server connection interrupted!", buf, 2u);
  }

  v11 = objc_loadWeakRetained(v8);
  objc_msgSend(v11, "serverConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  v13 = objc_loadWeakRetained(v8);
  objc_msgSend(v13, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v16, 2u);
  }

}

- (void)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, BOOL);
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, BOOL))a6;
  -[ACCTransportClient endpointDataOutHandlers](self, "endpointDataOutHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v10);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v14)
    ((void (**)(_QWORD, id, id, id))v14)[2](v14, v11, v10, v15);
  if (v12)
    v12[2](v12, v14 != 0);

}

- (void)authStateDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthState:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v8 = a7;
  v15 = a4;
  -[ACCTransportClient delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ACCTransportClient delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[ACCTransportClient delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transportClient:authStatusDidChange:forConnectionWithUUID:", self, v8, v15);

    }
  }

}

- (void)propertiesDidChange:(id)a3 forConnectionWithUUID:(id)a4 previousProperties:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v46;
  id v47;
  ACCTransportClient *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a4;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = (uint64_t)v47;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "Connection properties did change! (connectionUUID: %@)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v57 = (uint64_t)v8;
    v58 = 2112;
    v59 = (uint64_t)v9;
    _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_INFO, "properties: %@, previousProperties: %@", buf, 0x16u);
  }
  v50 = v9;

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v17 = *(id *)(gLogSignpostObjects + 24);
    v18 = v9;
  }
  else
  {
    v18 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v17 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  v20 = os_signpost_id_make_with_pointer(v17, self);

  v49 = v8;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v21 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v18, "count");
    objc_msgSend(v18, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v57 = (uint64_t)v47;
    v58 = 2048;
    v59 = v21;
    v60 = 2112;
    v61 = v22;
    v62 = 2048;
    v63 = v23;
    v64 = 2112;
    v65 = v24;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v15, OS_SIGNPOST_EVENT, v20, "Endpoint PROPERTY", "Connection PropertiesDidChange! %@, %lu properties: %@, previous %lu properties: %@", buf, 0x34u);

    v8 = v49;
  }

  -[ACCTransportClient delegate](self, "delegate");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[ACCTransportClient delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) != 0)
    {
      -[ACCTransportClient delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "transportClient:propertiesDidChange:forConnectionWithUUID:previousProperties:", self, v8, v47, v18);

    }
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v48 = self;
  -[ACCTransportClient connectionPropertyChangeHandlers](self, "connectionPropertyChangeHandlers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v52;
    *(_QWORD *)&v33 = 134218240;
    v46 = v33;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v52 != v35)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v37, v46);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isNSObjectEqual((unint64_t)v38, (uint64_t)v39) & 1) == 0)
        {
          v40 = gLogObjects;
          v41 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v42 = *(id *)gLogObjects;
          }
          else
          {
            v42 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v46;
              v57 = v40;
              v58 = 1024;
              LODWORD(v59) = v41;
              _os_log_error_impl(&dword_1AF649000, v42, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v43 = v42;
          }
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v57 = (uint64_t)v37;
            v58 = 2112;
            v59 = (uint64_t)v38;
            v60 = 2112;
            v61 = v39;
            _os_log_debug_impl(&dword_1AF649000, v42, OS_LOG_TYPE_DEBUG, "Calling connection property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
          }

          -[ACCTransportClient connectionPropertyChangeHandlers](v48, "connectionPropertyChangeHandlers");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKey:", v37);
          v45 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          if (v45)
            ((void (**)(_QWORD, id, void *, void *, void *))v45)[2](v45, v47, v37, v38, v39);

          v8 = v49;
          v18 = v50;
        }

      }
      v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v34);
  }

}

- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6
{
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  os_signpost_id_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *endpointEventHandlerQueue;
  id obj;
  id v45;
  id v46;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v46 = a4;
  v48 = a5;
  v45 = a6;
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v11 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v63 = (uint64_t)v46;
    v64 = 2112;
    v65 = (uint64_t)v45;
    _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "Endpoint properties did change! (endpointUUID: %@, connectionUUID: %@)", buf, 0x16u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v63 = (uint64_t)v49;
    v64 = 2112;
    v65 = (uint64_t)v48;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_INFO, "properties: %@, previousProperties: %@", buf, 0x16u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v14 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v16 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  v18 = os_signpost_id_make_with_pointer(v16, self);

  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v19 = objc_msgSend(v49, "count");
    objc_msgSend(v49, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v48, "count");
    objc_msgSend(v48, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v63 = (uint64_t)v46;
    v64 = 2048;
    v65 = v19;
    v66 = 2112;
    v67 = v20;
    v68 = 2048;
    v69 = v21;
    v70 = 2112;
    v71 = v22;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v14, OS_SIGNPOST_EVENT, v18, "Endpoint PROPERTY", "Endpoint PropertiesDidChange! %@, %lu properties: %@, previous %lu properties: %@", buf, 0x34u);

  }
  -[ACCTransportClient delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ACCTransportClient delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[ACCTransportClient delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transportClient:propertiesDidChange:forEndpointWithUUID:previousProperties:connectionUUID:", self, v49, v46, v48, v45);

    }
  }
  -[ACCTransportClient endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[ACCTransportClient endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v58 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v49, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKey:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isNSObjectEqual((unint64_t)v33, (uint64_t)v34) & 1) == 0)
        {
          v35 = gLogObjects;
          v36 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v37 = *(id *)gLogObjects;
          }
          else
          {
            v38 = v28;
            v39 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v63 = v35;
              v64 = 1024;
              LODWORD(v65) = v36;
              _os_log_error_impl(&dword_1AF649000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v40 = v39;
            v37 = v39;
            v28 = v38;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v63 = (uint64_t)v32;
            v64 = 2112;
            v65 = (uint64_t)v33;
            v66 = 2112;
            v67 = v34;
            _os_log_debug_impl(&dword_1AF649000, v37, OS_LOG_TYPE_DEBUG, "Calling endpoint property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
          }

          -[ACCTransportClient endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKey:", v32);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            endpointEventHandlerQueue = self->_endpointEventHandlerQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __96__ACCTransportClient_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke;
            block[3] = &unk_1E5FB3B00;
            v56 = v42;
            v51 = v46;
            v52 = v32;
            v53 = v33;
            v54 = v34;
            v55 = v45;
            dispatch_async(endpointEventHandlerQueue, block);

          }
        }

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v29);
  }

  objc_sync_exit(obj);
}

uint64_t __96__ACCTransportClient_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)receivedSecureTunnelData:(id)a3 forEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  BOOL v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ACCTransportClient endpointSecureTunnelDataHandlers](self, "endpointSecureTunnelDataHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v10 = gNumLogObjects < 3;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACCTransportClient receivedSecureTunnelData:forEndpoint:].cold.3();

  if (gLogObjects)
    v13 = gNumLogObjects <= 2;
  else
    v13 = 1;
  v14 = !v13;
  if (v9)
  {
    if (v14)
    {
      v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "SecureTunnelData: call dataInHandler, endpoint: %@, data:%@", (uint8_t *)&v19, 0x16u);
    }

    ((void (**)(_QWORD, id, id))v9)[2](v9, v7, v6);
  }
  else
  {
    if (v14)
    {
      v16 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v16 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1AF649000, v16, OS_LOG_TYPE_DEFAULT, "SecureTunnelData: No dataInHandler! endpoint: %@, data:%@", (uint8_t *)&v19, 0x16u);
    }

  }
}

- (void)launchServer
{
  void *v3;
  id v4;

  kdebug_trace();
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchServer");

}

void __34__ACCTransportClient_launchServer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v9 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v22 = v4;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "Creating connection... (type: %{coreacc:ACCConnection_Type_t}d, identifier: %@)", buf, 0x12u);
  }

  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_126);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__ACCTransportClient_createConnectionWithType_andIdentifier___block_invoke_127;
  v14[3] = &unk_1E5FB3B48;
  v14[4] = &v15;
  objc_msgSend(v11, "createConnectionWithType:andIdentifier:withReply:", v4, v6, v14);

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __61__ACCTransportClient_createConnectionWithType_andIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __61__ACCTransportClient_createConnectionWithType_andIdentifier___block_invoke_127(uint64_t a1, int a2, void *a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v8 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 1024;
    v14 = a2;
    _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "Created new accessory connection with UUID: %@, result: %d", (uint8_t *)&v11, 0x12u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  ACCTransportClient *v30;
  id v31;
  uint64_t *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Setting properties for connection: %@", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_INFO, "properties: %@", buf, 0xCu);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v13 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  v17 = os_signpost_id_make_with_pointer(v15, self);

  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v18 = objc_msgSend(v6, "count");
    objc_msgSend(v6, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v7;
    v42 = 2048;
    v43 = v18;
    v44 = 2112;
    v45 = v19;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Connection PROPERTY", "Connection SetProperties! %@, %lu properties: %@", buf, 0x20u);

  }
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke;
  v33[3] = &unk_1E5FB3B70;
  v33[4] = self;
  v22 = v7;
  v34 = v22;
  v23 = v6;
  v35 = v23;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke_129;
  v28[3] = &unk_1E5FB3B98;
  v25 = v22;
  v29 = v25;
  v30 = self;
  v26 = v23;
  v31 = v26;
  v32 = &v36;
  objc_msgSend(v24, "setProperties:forConnectionWithUUID:withReply:", v26, v25, v28);

  LOBYTE(v24) = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v36, 8);

  return (char)v24;
}

void __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v7 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v9 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v3, "localizedFailureReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v7, OS_SIGNPOST_INTERVAL_END, v11, "Connection PROPERTY", "ERROR (%@) handling Connection SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x2Au);

  }
}

void __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke_129(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v7;
    v18 = 1024;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "Set properties for connection: %@, result: %d", (uint8_t *)&v16, 0x12u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v8 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 40));

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v13;
    v18 = 2048;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Connection PROPERTY", "Connection SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 forConnectionWithUUID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15[0] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = -[ACCTransportClient setProperties:forConnectionWithUUID:](self, "setProperties:forConnectionWithUUID:", v12, v9);
  return (char)v10;
}

- (BOOL)removeProperty:(id)a3 forConnectionWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_132);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__ACCTransportClient_removeProperty_forConnectionWithUUID___block_invoke_133;
  v12[3] = &unk_1E5FB3BE0;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v9, "removeProperty:forConnectionWithUUID:withReply:", v6, v10, v12);

  LOBYTE(v8) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __59__ACCTransportClient_removeProperty_forConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __59__ACCTransportClient_removeProperty_forConnectionWithUUID___block_invoke_133(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "Remove property for connection: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 andDataOutHandler:(id)a6 forConnectionWithUUID:(id)a7 publishConnection:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, int, void *);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  const char *v50;
  uint64_t v51;

  v8 = a8;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v51 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1;
  v39 = __Block_byref_object_dispose__1;
  v40 = 0;
  if (gLogObjects)
    v17 = gNumLogObjects < 1;
  else
    v17 = 1;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v19 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  else
  {
    v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = "NO";
    *(_DWORD *)buf = 67110146;
    v43 = 1024;
    v42 = v12;
    if (v8)
      v20 = "YES";
    v44 = v11;
    v45 = 2112;
    v46 = v14;
    v47 = 2112;
    v48 = v16;
    v49 = 2080;
    v50 = v20;
    _os_log_impl(&dword_1AF649000, v19, OS_LOG_TYPE_DEFAULT, "Creating endpoint... (transportType: %{coreacc:ACCEndpoint_TransportType_t}d, protocol: %{coreacc:ACCEndpoint_Protocol_t}d, identifier: %@, connectionUUID: %@, publishConnection: %s)", buf, 0x2Cu);
  }

  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_136);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __138__ACCTransportClient_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection___block_invoke_137;
  v32 = &unk_1E5FB3C28;
  v23 = v16;
  v33 = v23;
  v34 = &v35;
  objc_msgSend(v22, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:withReply:", v12, v11, v14, v23, &v29);

  v24 = (void *)v36[5];
  if (v15 && v24)
  {
    -[ACCTransportClient endpointDataOutHandlers](self, "endpointDataOutHandlers", v29, v30, v31, v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = _Block_copy(v15);
    objc_msgSend(v25, "setObject:forKey:", v26, v36[5]);

    v24 = (void *)v36[5];
  }
  if (v24 && v8)
  {
    -[ACCTransportClient publishConnectionWithUUID:](self, "publishConnectionWithUUID:", v23);
    v24 = (void *)v36[5];
  }
  v27 = v24;

  _Block_object_dispose(&v35, 8);
  return v27;
}

void __138__ACCTransportClient_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __138__ACCTransportClient_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection___block_invoke_137(uint64_t a1, int a2, void *a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v8 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v9;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "Created new endpoint %@ for connection %@, result: %d", (uint8_t *)&v12, 0x1Cu);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_138);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__ACCTransportClient_setAccessoryInfo_forEndpointWithUUID___block_invoke_139;
  v12[3] = &unk_1E5FB3BE0;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v9, "setAccessoryInfo:forEndpointWithUUID:withReply:", v6, v10, v12);

  LOBYTE(v8) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __59__ACCTransportClient_setAccessoryInfo_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __59__ACCTransportClient_setAccessoryInfo_forEndpointWithUUID___block_invoke_139(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "Set accessory info for endpoint: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  ACCTransportClient *v30;
  id v31;
  uint64_t *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Setting properties for endpoint: %@", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_INFO, "properties: %@", buf, 0xCu);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v13 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  v17 = os_signpost_id_make_with_pointer(v15, self);

  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v18 = objc_msgSend(v6, "count");
    objc_msgSend(v6, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v7;
    v42 = 2048;
    v43 = v18;
    v44 = 2112;
    v45 = v19;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Endpoint PROPERTY", "Endpoint SetProperties! %@, %lu properties: %@", buf, 0x20u);

  }
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke;
  v33[3] = &unk_1E5FB3B70;
  v33[4] = self;
  v22 = v7;
  v34 = v22;
  v23 = v6;
  v35 = v23;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke_140;
  v28[3] = &unk_1E5FB3B98;
  v25 = v22;
  v29 = v25;
  v30 = self;
  v26 = v23;
  v31 = v26;
  v32 = &v36;
  objc_msgSend(v24, "setProperties:forEndpointWithUUID:withReply:", v26, v25, v28);

  LOBYTE(v24) = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v36, 8);

  return (char)v24;
}

void __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v7 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v9 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v3, "localizedFailureReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v7, OS_SIGNPOST_INTERVAL_END, v11, "Endpoint PROPERTY", "ERROR (%@) handling Endpoint SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x2Au);

  }
}

void __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke_140(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v7;
    v18 = 1024;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "Set properties for endpoint: %@, result: %d", (uint8_t *)&v16, 0x12u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v8 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportClient _init].cold.1();
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 40));

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v13;
    v18 = 2048;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_signpost_emit_with_name_impl(&dword_1AF649000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Endpoint PROPERTY", "Endpoint SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 forEndpointWithUUID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15[0] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = -[ACCTransportClient setProperties:forEndpointWithUUID:](self, "setProperties:forEndpointWithUUID:", v12, v9);
  return (char)v10;
}

- (BOOL)removeProperty:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_141);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__ACCTransportClient_removeProperty_forEndpointWithUUID___block_invoke_142;
  v12[3] = &unk_1E5FB3BE0;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v9, "removeProperty:forEndpointWithUUID:withReply:", v6, v10, v12);

  LOBYTE(v8) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __57__ACCTransportClient_removeProperty_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __57__ACCTransportClient_removeProperty_forEndpointWithUUID___block_invoke_142(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "Remove property for endpoint: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)publishConnectionWithUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "Publishing connection... (connectionUUID: %@)", buf, 0xCu);
  }

  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_143);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__ACCTransportClient_publishConnectionWithUUID___block_invoke_144;
  v12[3] = &unk_1E5FB3BE0;
  v10 = v4;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v9, "publishConnectionWithUUID:withReply:", v10, v12);

  LOBYTE(v8) = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __48__ACCTransportClient_publishConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __48__ACCTransportClient_publishConnectionWithUUID___block_invoke_144(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "Published connection: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)destroyEndpointWithUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "Destroying endpoint... (endpointUUID: %@)", buf, 0xCu);
  }

  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_145);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __46__ACCTransportClient_destroyEndpointWithUUID___block_invoke_146;
  v16 = &unk_1E5FB3BE0;
  v10 = v4;
  v17 = v10;
  v18 = &v19;
  objc_msgSend(v9, "destroyEndpointWithUUID:withReply:", v10, &v13);

  -[ACCTransportClient endpointDataOutHandlers](self, "endpointDataOutHandlers", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v10);

  LOBYTE(v11) = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return (char)v11;
}

void __46__ACCTransportClient_destroyEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __46__ACCTransportClient_destroyEndpointWithUUID___block_invoke_146(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "Destroyed endpoint: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)destroyConnectionWithUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "Destroying connection... (connectionUUID: %@)", buf, 0xCu);
  }

  if (v4)
  {
    -[ACCTransportClient connectToServer](self, "connectToServer");
    -[ACCTransportClient endpointUUIDsForConnectionWithUUID:](self, "endpointUUIDsForConnectionWithUUID:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    -[ACCTransportClient serverConnection](self, "serverConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_147);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __48__ACCTransportClient_destroyConnectionWithUUID___block_invoke_148;
    v19 = &unk_1E5FB3BE0;
    v20 = v4;
    v21 = &v22;
    objc_msgSend(v10, "destroyConnectionWithUUID:withReply:", v20, &v16);

    -[ACCTransportClient endpointDataOutHandlers](self, "endpointDataOutHandlers", v16, v17, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject allObjects](v8, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsForKeys:", v12);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ACCTransportClient destroyConnectionWithUUID:].cold.1(v8);
  }

  v14 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __48__ACCTransportClient_destroyConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __48__ACCTransportClient_destroyConnectionWithUUID___block_invoke_148(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "Destroyed connection: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (id)connectionUUIDForEndpointWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_149);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ACCTransportClient_connectionUUIDForEndpointWithUUID___block_invoke_150;
  v9[3] = &unk_1E5FB3CB0;
  v9[4] = &v10;
  objc_msgSend(v6, "connectionUUIDForEndpointWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __56__ACCTransportClient_connectionUUIDForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __56__ACCTransportClient_connectionUUIDForEndpointWithUUID___block_invoke_150(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)endpointUUIDsForConnectionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_152);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ACCTransportClient_endpointUUIDsForConnectionWithUUID___block_invoke_153;
  v9[3] = &unk_1E5FB3CD8;
  v9[4] = &v10;
  objc_msgSend(v6, "endpointUUIDsForConnectionWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__ACCTransportClient_endpointUUIDsForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __57__ACCTransportClient_endpointUUIDsForConnectionWithUUID___block_invoke_153(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_156);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ACCTransportClient_authStatusForConnectionWithUUID_authType___block_invoke_157;
  v10[3] = &unk_1E5FB3D00;
  v10[4] = &v11;
  objc_msgSend(v8, "authStatusForConnectionWithUUID:authType:withReply:", v6, v4, v10);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __63__ACCTransportClient_authStatusForConnectionWithUUID_authType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

uint64_t __63__ACCTransportClient_authStatusForConnectionWithUUID_authType___block_invoke_157(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isConnectionAuthenticated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_159);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ACCTransportClient_isConnectionAuthenticated___block_invoke_160;
  v8[3] = &unk_1E5FB3D28;
  v8[4] = &v9;
  objc_msgSend(v6, "isConnectionAuthenticatedForUUID:withReply:", v4, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __48__ACCTransportClient_isConnectionAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

uint64_t __48__ACCTransportClient_isConnectionAuthenticated___block_invoke_160(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setConnectionAuthenticated:(id)a3 state:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v9 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "setConnectionAuthenticated: %@ state: %d", (uint8_t *)&v12, 0x12u);
  }

  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_161);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConnectionAuthenticated:state:", v6, v4);

}

void __55__ACCTransportClient_setConnectionAuthenticated_state___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (id)accessoryInfoForConnectionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_162);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ACCTransportClient_accessoryInfoForConnectionWithUUID___block_invoke_163;
  v9[3] = &unk_1E5FB3D70;
  v9[4] = &v10;
  objc_msgSend(v6, "accessoryInfoForConnectionWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__ACCTransportClient_accessoryInfoForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __57__ACCTransportClient_accessoryInfoForConnectionWithUUID___block_invoke_163(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)accessoryInfoForEndpointWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_165);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ACCTransportClient_accessoryInfoForEndpointWithUUID___block_invoke_166;
  v9[3] = &unk_1E5FB3D70;
  v9[4] = &v10;
  objc_msgSend(v6, "accessoryInfoForEndpointWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__ACCTransportClient_accessoryInfoForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __55__ACCTransportClient_accessoryInfoForEndpointWithUUID___block_invoke_166(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)propertiesForConnectionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_167_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ACCTransportClient_propertiesForConnectionWithUUID___block_invoke_168;
  v9[3] = &unk_1E5FB3D70;
  v9[4] = &v10;
  objc_msgSend(v6, "propertiesForConnectionWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__ACCTransportClient_propertiesForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __54__ACCTransportClient_propertiesForConnectionWithUUID___block_invoke_168(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)propertiesForEndpointWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_169_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ACCTransportClient_propertiesForEndpointWithUUID___block_invoke_170;
  v9[3] = &unk_1E5FB3D70;
  v9[4] = &v10;
  objc_msgSend(v6, "propertiesForEndpointWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__ACCTransportClient_propertiesForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __52__ACCTransportClient_propertiesForEndpointWithUUID___block_invoke_170(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)identifierForConnectionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_171_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ACCTransportClient_identifierForConnectionWithUUID___block_invoke_172;
  v9[3] = &unk_1E5FB3CB0;
  v9[4] = &v10;
  objc_msgSend(v6, "identifierForConnectionWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__ACCTransportClient_identifierForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __54__ACCTransportClient_identifierForConnectionWithUUID___block_invoke_172(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)identifierForEndpointWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_173);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ACCTransportClient_identifierForEndpointWithUUID___block_invoke_174;
  v9[3] = &unk_1E5FB3CB0;
  v9[4] = &v10;
  objc_msgSend(v6, "identifierForEndpointWithUUID:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__ACCTransportClient_identifierForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __52__ACCTransportClient_identifierForEndpointWithUUID___block_invoke_174(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setHandler:(id)a3 forConnectionProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id aBlock;

  aBlock = a3;
  v6 = a4;
  if (v6)
  {
    -[ACCTransportClient connectionPropertyChangeHandlers](self, "connectionPropertyChangeHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (aBlock)
    {
      v8 = _Block_copy(aBlock);
      objc_msgSend(v7, "setObject:forKey:", v8, v6);

    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", v6);
    }

  }
}

- (void)setHandler:(id)a3 forEndpointProperty:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "set";
    v16 = "-[ACCTransportClient setHandler:forEndpointProperty:]";
    v15 = 136315650;
    if (!v6)
      v11 = "reset";
    v17 = 2080;
    v18 = v11;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s eventHandler for property %@", (uint8_t *)&v15, 0x20u);
  }

  if (v7)
  {
    -[ACCTransportClient endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v12);
    -[ACCTransportClient endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v14 = _Block_copy(v6);
      objc_msgSend(v13, "setObject:forKey:", v14, v7);

    }
    else
    {
      objc_msgSend(v13, "removeObjectForKey:", v7);
    }

    objc_sync_exit(v12);
  }

}

- (void)setSecureTunnelDataReceiveHandler:(id)a3 forEndpoint:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "set";
    v18 = "-[ACCTransportClient setSecureTunnelDataReceiveHandler:forEndpoint:]";
    v17 = 136315650;
    if (!v6)
      v11 = "reset";
    v19 = 2080;
    v20 = v11;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s eventHandler for endpoint %@", (uint8_t *)&v17, 0x20u);
  }

  if (v7)
  {
    -[ACCTransportClient endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v12);
    -[ACCTransportClient endpointSecureTunnelDataHandlers](self, "endpointSecureTunnelDataHandlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v14 = _Block_copy(v6);
      objc_msgSend(v13, "setObject:forKey:", v14, v7);

    }
    else
    {
      objc_msgSend(v13, "removeObjectForKey:", v7);
    }

    objc_sync_exit(v12);
    -[ACCTransportClient connectToServer](self, "connectToServer");
    -[ACCTransportClient serverConnection](self, "serverConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_177);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enableSecureTunnelDataReceiveHandlerForEndpoint:", v7);

  }
}

void __68__ACCTransportClient_setSecureTunnelDataReceiveHandler_forEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (BOOL)processOutgoingSecureTunnelData:(id)a3 forEndpoint:(id)a4 forType:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "-[ACCTransportClient processOutgoingSecureTunnelData:forEndpoint:forType:]";
    v28 = 2112;
    v29 = v9;
    v30 = 1024;
    v31 = v5;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "%s: Endpoint (%@) received secure data (type %d): %@", buf, 0x26u);
  }

  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_178);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_179;
  v18[3] = &unk_1E5FB3DF8;
  v21 = v5;
  v15 = v9;
  v19 = v15;
  v20 = &v22;
  objc_msgSend(v14, "sendOutgoingSecureTunnelData:forEndpointWithUUID:forType:withResult:", v8, v15, v5, v18);

  v16 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_179(uint64_t a1, char a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;

  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_179_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  kdebug_trace();
  -[ACCTransportClient connectToServer](self, "connectToServer");
  -[ACCTransportClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_180);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_181;
  v12[3] = &unk_1E5FB3BE0;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v9, "processIncomingData:forEndpointWithUUID:withReply:", v6, v10, v12);

  LOBYTE(v8) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_181(uint64_t a1, char a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;

  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_181_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

+ (id)sharedClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ACCTransportClient_sharedClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedClient_once != -1)
    dispatch_once(&sharedClient_once, block);
  return (id)sharedClient_sharedInstance;
}

void __34__ACCTransportClient_sharedClient__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedClient_sharedInstance;
  sharedClient_sharedInstance = v1;

}

- (ACCTransportClientDelegate)delegate
{
  return (ACCTransportClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (NSMutableDictionary)endpointDataOutHandlers
{
  return self->_endpointDataOutHandlers;
}

- (void)setEndpointDataOutHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_endpointDataOutHandlers, a3);
}

- (NSMutableDictionary)connectionPropertyChangeHandlers
{
  return self->_connectionPropertyChangeHandlers;
}

- (void)setConnectionPropertyChangeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_connectionPropertyChangeHandlers, a3);
}

- (NSMutableDictionary)endpointPropertyChangeHandlers
{
  return self->_endpointPropertyChangeHandlers;
}

- (void)setEndpointPropertyChangeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_endpointPropertyChangeHandlers, a3);
}

- (NSMutableDictionary)endpointSecureTunnelDataHandlers
{
  return self->_endpointSecureTunnelDataHandlers;
}

- (void)setEndpointSecureTunnelDataHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_endpointSecureTunnelDataHandlers, a3);
}

- (OS_dispatch_queue)endpointEventHandlerQueue
{
  return self->_endpointEventHandlerQueue;
}

- (void)setEndpointEventHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_endpointEventHandlerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointEventHandlerQueue, 0);
  objc_storeStrong((id *)&self->_endpointSecureTunnelDataHandlers, 0);
  objc_storeStrong((id *)&self->_endpointPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_connectionPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_endpointDataOutHandlers, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_1(&dword_1AF649000, MEMORY[0x1E0C81028], v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)receivedSecureTunnelData:forEndpoint:.cold.3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)destroyConnectionWithUUID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AF649000, log, OS_LOG_TYPE_FAULT, "destroyConnectionWithUUID(): connectionUUID == nil", v1, 2u);
}

void __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_179_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x18u);
  OUTLINED_FUNCTION_3();
}

void __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_181_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_3();
}

@end
