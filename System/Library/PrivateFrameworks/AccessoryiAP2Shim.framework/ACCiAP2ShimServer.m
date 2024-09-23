@implementation ACCiAP2ShimServer

- (ACCiAP2ShimServer)init
{
  ACCiAP2ShimServer *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *delegateList;
  NSMutableDictionary *v6;
  NSMutableDictionary *accessoryViaKeyUIDList;
  NSMutableDictionary *v8;
  NSMutableDictionary *accessoryViaConnectionIDList;
  NSMutableDictionary *v10;
  NSMutableDictionary *clients;
  NSLock *v12;
  NSLock *clientLock;
  NSObject *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *internalListenerQueue;
  dispatch_queue_t v18;
  OS_dispatch_queue *listQueue;
  objc_super v21;

  init_logging();
  v21.receiver = self;
  v21.super_class = (Class)ACCiAP2ShimServer;
  v3 = -[ACCiAP2ShimServer init](&v21, sel_init);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    delegateList = v3->_delegateList;
    v3->_delegateList = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessoryViaKeyUIDList = v3->_accessoryViaKeyUIDList;
    v3->_accessoryViaKeyUIDList = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessoryViaConnectionIDList = v3->_accessoryViaConnectionIDList;
    v3->_accessoryViaConnectionIDList = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clients = v3->_clients;
    v3->_clients = v10;

    v12 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    clientLock = v3->_clientLock;
    v3->_clientLock = v12;

    v3->_iap2AvailableNotifyToken = -1;
    v3->_isShuttingDown = 0;
    if (notify_register_check(MEMORY[0x24BE4F928], &v3->_iap2AvailableNotifyToken))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v14 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ACCiAP2ShimServer init].cold.1();

    }
    -[ACCiAP2ShimServer _resetServerState](v3, "_resetServerState");
    pthread_mutex_lock(&__sharedIAP2ServerLock);
    v16 = dispatch_queue_create("IAP2ServerListenerQueue", 0);
    internalListenerQueue = v3->_internalListenerQueue;
    v3->_internalListenerQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_create("com.apple.acciap2shimserver.listQ", 0);
    listQueue = v3->_listQueue;
    v3->_listQueue = (OS_dispatch_queue *)v18;

    pthread_mutex_unlock(&__sharedIAP2ServerLock);
  }
  return v3;
}

- (void)dealloc
{
  int iap2AvailableNotifyToken;
  NSMutableDictionary *clients;
  NSLock *clientLock;
  NSMutableDictionary *delegateList;
  NSMutableDictionary *accessoryViaKeyUIDList;
  NSMutableDictionary *accessoryViaConnectionIDList;
  OS_dispatch_queue *internalListenerQueue;
  OS_dispatch_queue *listQueue;
  objc_super v11;

  -[NSMutableDictionary removeAllObjects](self->_delegateList, "removeAllObjects");
  -[ACCiAP2ShimServer stopServer](self, "stopServer");
  iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
  if (iap2AvailableNotifyToken != -1)
  {
    notify_cancel(iap2AvailableNotifyToken);
    self->_iap2AvailableNotifyToken = -1;
  }
  clients = self->_clients;
  self->_clients = 0;

  clientLock = self->_clientLock;
  self->_clientLock = 0;

  delegateList = self->_delegateList;
  self->_delegateList = 0;

  accessoryViaKeyUIDList = self->_accessoryViaKeyUIDList;
  self->_accessoryViaKeyUIDList = 0;

  accessoryViaConnectionIDList = self->_accessoryViaConnectionIDList;
  self->_accessoryViaConnectionIDList = 0;

  internalListenerQueue = self->_internalListenerQueue;
  self->_internalListenerQueue = 0;

  listQueue = self->_listQueue;
  self->_listQueue = 0;

  v11.receiver = self;
  v11.super_class = (Class)ACCiAP2ShimServer;
  -[ACCiAP2ShimServer dealloc](&v11, sel_dealloc);
}

- (void)_startServer
{
  int iap2AvailableNotifyToken;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *internalListenerQueue;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v24[5];
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
  if (iap2AvailableNotifyToken == -1)
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v13 = "[#Server] IAPServer: startServer: invalid notifyToken!";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_38;
  }
  notify_get_state(iap2AvailableNotifyToken, &state64);
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v27 = state64;
    _os_log_impl(&dword_217DCB000, v8, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: isIap2dLoaded=%llu", buf, 0xCu);
  }

  if (gLogObjects)
    v9 = gNumLogObjects <= 0;
  else
    v9 = 1;
  v10 = !v9;
  if (state64 == 1)
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v13 = "[#Server] IAPServer: startServer: Already loaded!";
    v14 = v12;
    v15 = OS_LOG_TYPE_INFO;
LABEL_38:
    _os_log_impl(&dword_217DCB000, v14, v15, v13, buf, 2u);
LABEL_39:

    return;
  }
  if (v10)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217DCB000, v11, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: init listener queue and start runloop", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE4F938], 0, 0, 1u);
  internalListenerQueue = self->_internalListenerQueue;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __33__ACCiAP2ShimServer__startServer__block_invoke;
  v24[3] = &unk_24D9060B8;
  v24[4] = self;
  dispatch_sync(internalListenerQueue, v24);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = 1;
    _os_log_impl(&dword_217DCB000, v20, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: set kIAP2AvailableNotification state: %d", buf, 8u);
  }

  notify_set_state(self->_iap2AvailableNotifyToken, 1uLL);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217DCB000, v22, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: post kIAP2AvailableNotification notification: ", buf, 2u);
  }

  notify_post(MEMORY[0x24BE4F928]);
}

void __33__ACCiAP2ShimServer__startServer__block_invoke(uint64_t a1)
{
  xpc_connection_t mach_service;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  id v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  _QWORD handler[5];
  uint8_t buf[16];
  uint8_t v14[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  mach_service = xpc_connection_create_mach_service("com.apple.iap2d.xpc", *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72), 1uLL);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = mach_service;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 56))
  {
    *(_QWORD *)v14 = 0;
    v15 = v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = (id)0xAAAAAAAAAAAAAAAALL;
    v19 = *(id *)(v5 + 72);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217DCB000, v6, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: set_event_handler and resume _listener", buf, 2u);
    }

    v10 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 56);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __33__ACCiAP2ShimServer__startServer__block_invoke_19;
    handler[3] = &unk_24D9067E0;
    handler[4] = v14;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 56));
    _Block_object_dispose(v14, 8);

  }
  else
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_217DCB000, v11, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: _listener is not valid!\n", v14, 2u);
    }

  }
}

void __33__ACCiAP2ShimServer__startServer__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  id v13;
  id v14;
  const char *string;
  __int128 v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  _xpc_connection_s *v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = (_xpc_connection_s *)v3;
  v6 = v4;
  v7 = MEMORY[0x219A176E4](v5);
  +[ACCiAP2ShimServer sharedInstance](ACCiAP2ShimServer, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == MEMORY[0x24BDACF88])
  {
    xpc_connection_set_target_queue(v5, v6);
    *(_QWORD *)&v16 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v16 + 1) = 3221225472;
    v17 = ___xpc_iap2d_handle_incoming_request_block_invoke;
    v18 = &unk_24D906A08;
    v11 = v5;
    v19 = v11;
    v20 = v8;
    xpc_connection_set_event_handler(v11, &v16);
    xpc_connection_resume(v11);

  }
  else if (v7 == MEMORY[0x24BDACFB8])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x24BDACF40]);
      LODWORD(v16) = 136315138;
      *(_QWORD *)((char *)&v16 + 4) = string;
      _os_log_impl(&dword_217DCB000, v12, OS_LOG_TYPE_INFO, "[#Server] _xpc_iap2d_handle_incoming_request connection error: %s\n", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x219A17648](v5);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 136315138;
      *(_QWORD *)((char *)&v16 + 4) = v9;
      _os_log_impl(&dword_217DCB000, v10, OS_LOG_TYPE_INFO, "[#Server] _xpc_iap2d_handle_incoming_request unexpected event: %s\n", (uint8_t *)&v16, 0xCu);
    }

    free(v9);
  }

}

- (void)startServer
{
  NSObject *listQueue;
  _QWORD block[5];

  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ACCiAP2ShimServer_startServer__block_invoke;
  block[3] = &unk_24D9060B8;
  block[4] = self;
  dispatch_async(listQueue, block);
}

uint64_t __32__ACCiAP2ShimServer_startServer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startServer");
}

- (void)_pollForDeathAfterPromptCompletes
{
  *(_DWORD *)&self->_serverFlags |= 1u;
}

- (void)_stopServer
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *internalListenerQueue;
  int iap2AvailableNotifyToken;
  BOOL v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v32;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allValues](self->_delegateList, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (gLogObjects)
    v5 = gNumLogObjects <= 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v4)
  {
    if (v6)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217DCB000, v8, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer", buf, 2u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[NSMutableDictionary allValues](self->_delegateList, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134217984;
      v35 = v15;
      _os_log_impl(&dword_217DCB000, v12, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer, _delegateList count %lu", buf, 0xCu);

    }
    if (self->_listener)
    {
      internalListenerQueue = self->_internalListenerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __32__ACCiAP2ShimServer__stopServer__block_invoke;
      block[3] = &unk_24D9060B8;
      block[4] = self;
      dispatch_sync(internalListenerQueue, block);
    }
    iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
    if (iap2AvailableNotifyToken == -1)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_67;
      *(_WORD *)buf = 0;
      v23 = "[#Server] IAPServer: stopServer: invalid notifyToken!";
      v24 = v21;
      v25 = OS_LOG_TYPE_DEFAULT;
      v26 = 2;
    }
    else
    {
      v32 = 0;
      notify_get_state(iap2AvailableNotifyToken, (uint64_t *)&v32);
      if (gLogObjects)
        v18 = gNumLogObjects <= 0;
      else
        v18 = 1;
      v19 = !v18;
      if (v32 == 1)
      {
        if (v19)
        {
          v20 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
          v20 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = 0;
          _os_log_impl(&dword_217DCB000, v20, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer: set kIAP2AvailableNotification state: %d", buf, 8u);
        }

        notify_set_state(self->_iap2AvailableNotifyToken, 0);
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v28 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
          v28 = MEMORY[0x24BDACB70];
          v30 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217DCB000, v28, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer: post kIAP2AvailableNotification notification: ", buf, 2u);
        }

        notify_post(MEMORY[0x24BE4F928]);
        goto LABEL_74;
      }
      if (v19)
      {
        v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v29 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_67:

LABEL_74:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE4F930], 0, 0, 1u);
        -[ACCiAP2ShimServer performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__pollForDeathAfterPromptCompletes, 0, 0);
        return;
      }
      *(_DWORD *)buf = 134217984;
      v35 = v32;
      v23 = "[#Server] IAPServer: stopServer: kIAP2AvailableNotification state %llu, skip post";
      v24 = v21;
      v25 = OS_LOG_TYPE_INFO;
      v26 = 12;
    }
    _os_log_impl(&dword_217DCB000, v24, v25, v23, buf, v26);
    goto LABEL_67;
  }
  if (v6)
  {
    v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v35 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_217DCB000, v7, OS_LOG_TYPE_INFO, "[#Server] IAPServer: Skip stopServer, there are still %lu delegates registered", buf, 0xCu);

  }
}

void __32__ACCiAP2ShimServer__stopServer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

}

- (void)stopServer
{
  NSObject *listQueue;
  _QWORD block[5];

  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ACCiAP2ShimServer_stopServer__block_invoke;
  block[3] = &unk_24D9060B8;
  block[4] = self;
  dispatch_async(listQueue, block);
}

uint64_t __31__ACCiAP2ShimServer_stopServer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopServer");
}

- (void)_addDelegate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *delegateList;
  void *v10;
  NSObject *v11;
  id v12;
  NSMutableDictionary *v13;
  int v14;
  id v15;
  __int16 v16;
  NSMutableDictionary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "getUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    delegateList = self->_delegateList;
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = delegateList;
    _os_log_impl(&dword_217DCB000, v8, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer before addDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_delegateList, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[NSMutableDictionary setObject:forKey:](self->_delegateList, "setObject:forKey:", v4, v5);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = self->_delegateList;
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_217DCB000, v11, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer after addDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }

}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__ACCiAP2ShimServer_addDelegate___block_invoke;
  v7[3] = &unk_24D906808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listQueue, v7);

}

uint64_t __33__ACCiAP2ShimServer_addDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)_removeDelegate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *delegateList;
  void *v10;
  NSObject *v11;
  id v12;
  NSMutableDictionary *v13;
  int v14;
  id v15;
  __int16 v16;
  NSMutableDictionary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "getUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    delegateList = self->_delegateList;
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = delegateList;
    _os_log_impl(&dword_217DCB000, v8, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer before removeDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_delegateList, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[NSMutableDictionary removeObjectForKey:](self->_delegateList, "removeObjectForKey:", v5);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = self->_delegateList;
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_217DCB000, v11, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer after removeDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ACCiAP2ShimServer_removeDelegate___block_invoke;
  v7[3] = &unk_24D906808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listQueue, v7);

}

uint64_t __36__ACCiAP2ShimServer_removeDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)_iterateDelegates:(id)a3
{
  void (**v4)(id, _QWORD, uint8_t *);
  NSMutableDictionary **p_delegateList;
  NSMutableDictionary *delegateList;
  uint64_t v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSMutableDictionary *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  NSMutableDictionary *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, uint8_t *))a3;
  delegateList = self->_delegateList;
  p_delegateList = &self->_delegateList;
  v7 = -[NSMutableDictionary count](delegateList, "count");
  if (gLogObjects)
    v8 = gNumLogObjects <= 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v7)
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ACCiAP2ShimServer _iterateDelegates:].cold.2((uint64_t)p_delegateList, v10, v13, v14, v15, v16, v17, v18);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary allValues](*p_delegateList, "allValues", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
LABEL_19:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v11);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22);
        buf[0] = 1;
        v4[2](v4, v23, buf);
        if (!buf[0])
          break;
        if (v20 == ++v22)
        {
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v20)
            goto LABEL_19;
          break;
        }
      }
    }
  }
  else
  {
    if (v9)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v25 = *p_delegateList;
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_impl(&dword_217DCB000, v11, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer iterateDelegates, no registered delegate! _delegateList=%@", buf, 0xCu);
    }
  }

}

- (void)iterateDelegatesAsync:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ACCiAP2ShimServer_iterateDelegatesAsync___block_invoke;
  v7[3] = &unk_24D906830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listQueue, v7);

}

uint64_t __43__ACCiAP2ShimServer_iterateDelegatesAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_iterateDelegates:", *(_QWORD *)(a1 + 40));
}

- (void)iterateDelegatesSync:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ACCiAP2ShimServer_iterateDelegatesSync___block_invoke;
  block[3] = &unk_24D906830;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(listQueue, block);

}

uint64_t __42__ACCiAP2ShimServer_iterateDelegatesSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_iterateDelegates:", *(_QWORD *)(a1 + 40));
}

- (void)_addAccessory:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_217DCB000, v7, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer addAccessory %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v4, "keyAccessoryUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyConnectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_accessoryViaKeyUIDList, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[NSMutableDictionary setObject:forKey:](self->_accessoryViaKeyUIDList, "setObject:forKey:", v4, v8);
  -[NSMutableDictionary objectForKey:](self->_accessoryViaConnectionIDList, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    -[NSMutableDictionary setObject:forKey:](self->_accessoryViaConnectionIDList, "setObject:forKey:", v4, v9);
  -[ACCiAP2ShimServer _attachAccessory:](self, "_attachAccessory:", v4);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer _addAccessory:].cold.1();

}

- (void)addAccessory:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__ACCiAP2ShimServer_addAccessory___block_invoke;
  v7[3] = &unk_24D906808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listQueue, v7);

}

uint64_t __34__ACCiAP2ShimServer_addAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAccessory:", *(_QWORD *)(a1 + 40));
}

- (void)_removeAccessory:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_217DCB000, v7, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer removeAccessory %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v4, "keyAccessoryUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyConnectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_accessoryViaKeyUIDList, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[NSMutableDictionary removeObjectForKey:](self->_accessoryViaKeyUIDList, "removeObjectForKey:", v8);
  }
  if (v9)
  {
    -[NSMutableDictionary objectForKey:](self->_accessoryViaConnectionIDList, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[NSMutableDictionary removeObjectForKey:](self->_accessoryViaConnectionIDList, "removeObjectForKey:", v9);
  }
  -[ACCiAP2ShimServer _detachAccessory:](self, "_detachAccessory:", v4);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer _removeAccessory:].cold.1();

}

- (void)removeAccessory:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__ACCiAP2ShimServer_removeAccessory___block_invoke;
  v7[3] = &unk_24D906808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listQueue, v7);

}

uint64_t __37__ACCiAP2ShimServer_removeAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAccessory:", *(_QWORD *)(a1 + 40));
}

- (void)_iterateAccessories:(id)a3
{
  void (**v4)(id, _QWORD, uint8_t *);
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, uint8_t *))a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer _iterateAccessories:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSMutableDictionary allValues](self->_accessoryViaKeyUIDList, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    v18 = MEMORY[0x24BDACB70];
LABEL_13:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v17)
        objc_enumerationMutation(v14);
      v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
      v21 = gLogObjects;
      v22 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 1)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v32 = v21;
          v33 = 1024;
          v34 = v22;
          _os_log_error_impl(&dword_217DCB000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v24 = v18;
        v25 = v18;
      }
      else
      {
        v25 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        _os_log_debug_impl(&dword_217DCB000, v25, OS_LOG_TYPE_DEBUG, "[#Server] ACCiAP2ShimServer iterateAccessories, accessory=%@", buf, 0xCu);
      }

      buf[0] = 1;
      v4[2](v4, v20, buf);
      if (!buf[0])
        break;
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
          goto LABEL_13;
        break;
      }
    }
  }

}

- (void)iterateAccessoriesAsync:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__ACCiAP2ShimServer_iterateAccessoriesAsync___block_invoke;
  v7[3] = &unk_24D906830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listQueue, v7);

}

uint64_t __45__ACCiAP2ShimServer_iterateAccessoriesAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_iterateAccessories:", *(_QWORD *)(a1 + 40));
}

- (void)iterateAccessoriesSync:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ACCiAP2ShimServer_iterateAccessoriesSync___block_invoke;
  block[3] = &unk_24D906830;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(listQueue, block);

}

uint64_t __44__ACCiAP2ShimServer_iterateAccessoriesSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_iterateAccessories:", *(_QWORD *)(a1 + 40));
}

- (id)_findAccessoryForConnectionID:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_accessoryViaConnectionIDList, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "connectionID") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)findAccessoryForConnectionID:(unsigned int)a3
{
  NSObject *listQueue;
  id v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ACCiAP2ShimServer_findAccessoryForConnectionID___block_invoke;
  block[3] = &unk_24D906858;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(listQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __50__ACCiAP2ShimServer_findAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_findAccessoryForConnectionID:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_findAccessoryForConnectionID:(unsigned int)a3 andKeyTag:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%u"), a4, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_accessoryViaConnectionIDList, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)findAccessoryForConnectionID:(unsigned int)a3 andKeyTag:(id)a4
{
  id v6;
  NSObject *listQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  listQueue = self->_listQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__ACCiAP2ShimServer_findAccessoryForConnectionID_andKeyTag___block_invoke;
  v11[3] = &unk_24D906880;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  dispatch_sync(listQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __60__ACCiAP2ShimServer_findAccessoryForConnectionID_andKeyTag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_findAccessoryForConnectionID:andKeyTag:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_findAccessoryForAccessoryUID:(id)a3 andKeyTag:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_accessoryViaKeyUIDList, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)findAccessoryForAccessoryUID:(id)a3 andKeyTag:(id)a4
{
  id v6;
  id v7;
  NSObject *listQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  listQueue = self->_listQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__ACCiAP2ShimServer_findAccessoryForAccessoryUID_andKeyTag___block_invoke;
  v13[3] = &unk_24D9068A8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(listQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __60__ACCiAP2ShimServer_findAccessoryForAccessoryUID_andKeyTag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)processXPCMessage:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  const char *string;
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  id v13;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  ACCiAP2ShimServer *v19;
  uint64_t *v20;
  const char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  string = xpc_dictionary_get_string(v6, "requestType");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke;
  v16[3] = &unk_24D9068D0;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  v19 = self;
  v20 = &v22;
  v21 = string;
  -[ACCiAP2ShimServer iterateDelegatesSync:](self, "iterateDelegatesSync:", v16);
  if (*((_BYTE *)v23 + 24))
  {
    v11 = 1;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = "<nil>";
      *(_DWORD *)buf = 138412802;
      if (string)
        v15 = string;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      v30 = 2080;
      v31 = v15;
      _os_log_debug_impl(&dword_217DCB000, v12, OS_LOG_TYPE_DEBUG, "[#Server] processXPCMessage: %@ connection: %@, None of the delegates processed the message! requestType=%s", buf, 0x20u);
    }

    v11 = *((_BYTE *)v23 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  return v11;
}

void __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  char v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = objc_opt_respondsToSelector();
  if (gLogObjects)
    v7 = gNumLogObjects <= 0;
  else
    v7 = 1;
  v8 = !v7;
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_1();

    v12 = objc_msgSend(v5, "tryProcessXPCMessage:connection:server:", a1[4], a1[5], a1[6]);
    *a3 = v12 ^ 1;
    if (((v12 ^ 1) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    if (v8)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_3();

  }
}

- (void)processDetachXPCConnection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[ACCiAP2ShimServer removeClientForXPCConnection:](self, "removeClientForXPCConnection:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__ACCiAP2ShimServer_processDetachXPCConnection___block_invoke;
  v6[3] = &unk_24D9068F8;
  v7 = v4;
  v5 = v4;
  -[ACCiAP2ShimServer iterateDelegatesSync:](self, "iterateDelegatesSync:", v6);

}

void __48__ACCiAP2ShimServer_processDetachXPCConnection___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *a3 = objc_msgSend(v5, "detachXPCConnection:", *(_QWORD *)(a1 + 32)) ^ 1;

}

- (void)_attachAccessory:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  ACCiAP2ShimServer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int shouldHideAccessoryWithModelNumber;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  timeval v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v4;
    _os_log_impl(&dword_217DCB000, v7, OS_LOG_TYPE_DEFAULT, "[#Server] ACCiAP2ShimServer _attachAccessory %@", buf, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x24BE4F908]);

  objc_msgSend(v4, "manufacturer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, *MEMORY[0x24BE4F8F8]);

  objc_msgSend(v4, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, *MEMORY[0x24BE4F900]);

  objc_msgSend(v4, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v13, *MEMORY[0x24BE4F918]);

  objc_msgSend(v4, "firmwareVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v14, *MEMORY[0x24BE4F8E8]);

  objc_msgSend(v4, "hardwareVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v15, *MEMORY[0x24BE4F8F0]);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manufacturer");
    v34 = v9;
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firmwareVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v37 = v18;
    v38 = 2112;
    v39 = v20;
    v40 = 2112;
    v41 = v21;
    v42 = 2112;
    v43 = v22;
    v44 = 2112;
    v45 = v23;
    v46 = 2112;
    v47 = v24;
    v48 = 2112;
    v49 = CFSTR("---");
    _os_log_impl(&dword_217DCB000, v16, OS_LOG_TYPE_DEFAULT, "[#Server] ACCiAP2ShimServer _attachAccessory: AccName=%@, AccManufacturer=%@, AccModel=%@, AccSerialNumber=%@, AccFWVersion=%@, AccHWVersion=%@, AccDockType=%@", buf, 0x48u);

    self = v19;
    v9 = v34;

  }
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x24BE4F920]);
  objc_msgSend(v4, "model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  shouldHideAccessoryWithModelNumber = acc_policies_shouldHideAccessoryWithModelNumber((uint64_t)v25);

  if (shouldHideAccessoryWithModelNumber)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v27 = MEMORY[0x24BDACB70];
      v29 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217DCB000, v27, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer _attachAccessory: should be hiding accessory from settings", buf, 2u);
    }

    v28 = 256;
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v30, *MEMORY[0x24BE4F8D8]);

  -[ACCiAP2ShimServer _takeClientAssertionsForAccessoryConnection](self, "_takeClientAssertionsForAccessoryConnection");
  v35.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v35.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v35, 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v35.tv_sec);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v31, *MEMORY[0x24BE4F8E0]);

  if ((objc_msgSend(v4, "dontPublish") & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v32 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v32 = MEMORY[0x24BDACB70];
      v33 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v4;
      v38 = 2112;
      v39 = v8;
      _os_log_impl(&dword_217DCB000, v32, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer _attachAccessory: %@, dontPublish set! accessoryDict=%@", buf, 0x16u);
    }

  }
  else
  {
    -[ACCiAP2ShimServer notifyEAClientsOfAccessoryConnection:](self, "notifyEAClientsOfAccessoryConnection:", v8);
  }

}

- (void)_detachAccessory:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  int v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryInfoDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_217DCB000, v8, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer _detachAccessory: %@, accessoryDict=%@", (uint8_t *)&v17, 0x16u);
  }

  if (objc_msgSend(v5, "count"))
  {
    if ((objc_msgSend(v4, "dontPublish") & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      v11 = objc_msgSend(v4, "connectionID");
      v17 = 138412546;
      v18 = v4;
      v19 = 1024;
      LODWORD(v20) = v11;
      v12 = "[#Server] ACCiAP2ShimServer _detachAccessory: %@, dontPublish set! connectionID=%d";
      v13 = v9;
      v14 = 18;
    }
    else
    {
      -[ACCiAP2ShimServer _takeClientAssertionsForAccessoryDisconnection](self, "_takeClientAssertionsForAccessoryDisconnection");
      -[ACCiAP2ShimServer notifyEAClientsOfAccessoryDisconnection:](self, "notifyEAClientsOfAccessoryDisconnection:", v5);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      v16 = objc_msgSend(v4, "connectionID");
      v17 = 67109120;
      LODWORD(v18) = v16;
      v12 = "[#Server] ACCiAP2ShimServer _detachAccessory: accessory with connectionID=%d detached";
      v13 = v9;
      v14 = 8;
    }
    _os_log_impl(&dword_217DCB000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, v14);
LABEL_30:

  }
}

- (void)_takeClientAssertionsForAccessoryDisconnection
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_clients;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "takeProcessAssertion:", CFSTR("external-accessory.disconnect"));
        objc_msgSend(v8, "setClientRequiresAccReset:", 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (unsigned)addClientWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9
{
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  NSObject *v20;
  id v21;
  NSMutableDictionary *clients;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  ACCiAP2ShimServerClient *v35;
  __int128 v36;
  ACCiAP2ShimServerClient *v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *v40;
  void *v41;
  NSObject *v42;
  id v43;
  int v44;
  id v45;
  NSMutableDictionary *v46;
  void *v47;
  BOOL v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  id v53;
  uint64_t v55;
  _BOOL4 v56;
  id v57;
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  ACCiAP2ShimServer *v61;
  _OWORD v62[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  _BYTE v69[10];
  __int16 v70;
  int v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  _BOOL4 v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v56 = a8;
  v10 = *(_QWORD *)&a5;
  LODWORD(v55) = a3;
  v80 = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  v14 = a7;
  v15 = a9;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = a4->var0[0];
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v69 = v55;
    *(_WORD *)&v69[4] = 1024;
    *(_DWORD *)&v69[6] = v19;
    v70 = 1024;
    v71 = v10;
    v72 = 2112;
    v73 = v13;
    v74 = 2112;
    v75 = v14;
    v76 = 1024;
    v77 = v56;
    v78 = 2112;
    v79 = v15;
    _os_log_impl(&dword_217DCB000, v18, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities:%u auditToken:%xh currentClienID:%u xpcConnection:%@ eaProtocols:%@ notifyOfAlreadyConnectedAccessories:%d andBundleId:%@", buf, 0x38u);
  }

  -[NSLock lock](self->_clientLock, "lock");
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  v57 = v15;
  v58 = v14;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v69 = clients;
    _os_log_impl(&dword_217DCB000, v20, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: _clients=%@", buf, 0xCu);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[NSMutableDictionary allKeys](self->_clients, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v24)
  {
    v25 = v24;
    v26 = v13;
    v27 = *(_QWORD *)v64;
LABEL_21:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v27)
        objc_enumerationMutation(v23);
      -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v28), v55);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "clientID") == (_DWORD)v10)
        break;

      if (v25 == ++v28)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        if (v25)
          goto LABEL_21;
        v29 = 0;
        break;
      }
    }
    v13 = v26;
  }
  else
  {
    v29 = 0;
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v30 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v30 = MEMORY[0x24BDACB70];
    v31 = MEMORY[0x24BDACB70];
  }
  v33 = v57;
  v32 = v58;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v69 = v29;
    _os_log_impl(&dword_217DCB000, v30, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: client=%@", buf, 0xCu);
  }

  if (v29)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v34 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v34 = MEMORY[0x24BDACB70];
      v43 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_msgSend(v29, "clientID");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v69 = v44;
      _os_log_impl(&dword_217DCB000, v34, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - already have client for clientID 0x%08x", buf, 8u);
    }
    LODWORD(v10) = 0;
  }
  else
  {
    v35 = [ACCiAP2ShimServerClient alloc];
    v36 = *(_OWORD *)&a4->var0[4];
    v62[0] = *(_OWORD *)a4->var0;
    v62[1] = v36;
    v37 = -[ACCiAP2ShimServerClient initWithCapabilities:auditToken:xpcConnection:eaProtocols:andBundleId:](v35, "initWithCapabilities:auditToken:xpcConnection:eaProtocols:andBundleId:", v55, v62, v13, v58, v57);
    v38 = self->_clients;
    if (!v38)
    {
      v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v40 = self->_clients;
      self->_clients = v39;

      v38 = self->_clients;
    }
    +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", v10);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v38, "objectForKey:", v41);
    v34 = objc_claimAutoreleasedReturnValue();

    if (!(_DWORD)v10 || v34)
      v10 = -[ACCiAP2ShimServer generateClientID](self, "generateClientID");
    -[ACCiAP2ShimServerClient setClientID:](v37, "setClientID:", v10);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v42 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v42 = MEMORY[0x24BDACB70];
      v45 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v69 = v37;
      _os_log_impl(&dword_217DCB000, v42, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: add to _clients, client=%@", buf, 0xCu);
    }

    v46 = self->_clients;
    +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", -[ACCiAP2ShimServerClient clientID](v37, "clientID"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v46, "setObject:forKey:", v37, v47);

    if (gLogObjects)
      v48 = gNumLogObjects <= 0;
    else
      v48 = 1;
    v49 = !v48;
    if (v56)
    {
      if (v49)
      {
        v50 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v50 = MEMORY[0x24BDACB70];
        v52 = MEMORY[0x24BDACB70];
      }
      v33 = v57;
      v32 = v58;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v69 = v37;
        _os_log_impl(&dword_217DCB000, v50, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: notifying of connected accessories, client=%@", buf, 0xCu);
      }

      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __148__ACCiAP2ShimServer_addClientWithCapabilities_auditToken_currentClientID_xpcConnection_eaProtocols_notifyOfAlreadyConnectedAccessories_andBundleId___block_invoke;
      v59[3] = &unk_24D906920;
      v60 = v37;
      v61 = self;
      -[ACCiAP2ShimServer iterateAccessoriesAsync:](self, "iterateAccessoriesAsync:", v59);
      v51 = v60;
    }
    else
    {
      if (v49)
      {
        v51 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v51 = MEMORY[0x24BDACB70];
        v53 = MEMORY[0x24BDACB70];
      }
      v33 = v57;
      v32 = v58;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v69 = v37;
        _os_log_impl(&dword_217DCB000, v51, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: skip notifying of connected accessories, client=%@", buf, 0xCu);
      }
    }

  }
  -[NSLock unlock](self->_clientLock, "unlock");

  return v10;
}

void __148__ACCiAP2ShimServer_addClientWithCapabilities_auditToken_currentClientID_xpcConnection_eaProtocols_notifyOfAlreadyConnectedAccessories_andBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "accessoryInfoDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_217DCB000, v6, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: notify connected: client=%@ accessory=%@ accessoryInfoDict=%@", (uint8_t *)&v13, 0x20u);

  }
  v11 = a1 + 32;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v11 + 8);
  objc_msgSend(v3, "accessoryInfoDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyEAClient:ofAccessoryEvent:accessory:", v9, "EAProtocolAccessoryConnected", v12);

}

- (id)findClientWithID:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSMutableDictionary *clients;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v3 = *(_QWORD *)&a3;
  -[NSLock lock](self->_clientLock, "lock");
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer findClientWithID:].cold.3((uint64_t)self, v3, v7);

  clients = self->_clients;
  +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer findClientWithID:].cold.1();

  -[NSLock unlock](self->_clientLock, "unlock");
  return v10;
}

- (id)findClientWithXPCConnection:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_clientLock, "lock");
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer findClientWithXPCConnection:].cold.3();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_clients, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "xpcConnection");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          v9 = v12;
          goto LABEL_21;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_21:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACCiAP2ShimServer findClientWithID:].cold.1();

  -[NSLock unlock](self->_clientLock, "unlock");
  return v9;
}

- (void)removeClientWithID:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSMutableDictionary *clients;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  _BYTE v27[14];
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_clientLock, "lock");
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v27 = v3;
    *(_WORD *)&v27[4] = 2112;
    *(_QWORD *)&v27[6] = clients;
    _os_log_impl(&dword_217DCB000, v7, OS_LOG_TYPE_DEFAULT, "[#Server] removeClientWithID: clientID=%u _clients=%@", buf, 0x12u);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](self->_clients, "allKeys", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
LABEL_13:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v9);
      -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "clientID") == (_DWORD)v3)
        break;

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v14 = 0;
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v27 = v14;
    _os_log_impl(&dword_217DCB000, v15, OS_LOG_TYPE_DEFAULT, "[#Server] removeClientWithID: client=%@", buf, 0xCu);
  }

  if (!v14)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = (NSMutableDictionary *)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v19 = (NSMutableDictionary *)MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v27 = v3;
      _os_log_impl(&dword_217DCB000, &v19->super.super, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - couldn't find client for clientID 0x%08x", buf, 8u);
    }
    goto LABEL_39;
  }
  v17 = self->_clients;
  +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

  if (!-[NSMutableDictionary count](self->_clients, "count"))
  {
    v19 = self->_clients;
    self->_clients = 0;
LABEL_39:

  }
  -[NSLock unlock](self->_clientLock, "unlock");

}

- (void)removeClientForXPCConnection:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSMutableDictionary *clients;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  NSMutableDictionary *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_clientLock, "lock");
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    *(_DWORD *)buf = 138412546;
    v31 = v4;
    v32 = 2112;
    v33 = clients;
    _os_log_impl(&dword_217DCB000, v7, OS_LOG_TYPE_DEFAULT, "[#Server] removeClientForXPCConnection: clientConnection=%@ _clients=%@", buf, 0x16u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary allKeys](self->_clients, "allKeys", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
LABEL_13:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "xpcConnection");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v4)
        break;

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
    v16 = v14;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "bundleId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v19;
      _os_log_impl(&dword_217DCB000, v17, OS_LOG_TYPE_INFO, "[#Server] Found client to remove, client bundleID is %@", buf, 0xCu);

    }
    if (!v16)
      goto LABEL_31;
    v20 = objc_msgSend(v16, "clientID");
    v21 = self->_clients;
    +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", v22);

    if (-[NSMutableDictionary count](self->_clients, "count"))
      goto LABEL_41;
    v23 = self->_clients;
    self->_clients = 0;
  }
  else
  {
LABEL_19:

LABEL_31:
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v23 = (NSMutableDictionary *)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v23 = (NSMutableDictionary *)MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      _os_log_impl(&dword_217DCB000, &v23->super.super, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - couldn't find client for xpc client %@", buf, 0xCu);
    }
    v16 = 0;
  }

LABEL_41:
  -[NSLock unlock](self->_clientLock, "unlock");

}

- (void)removeAllClients
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSMutableDictionary *obj;
  _QWORD block[5];
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_clientLock, "lock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_clients;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = 0;
      v9 = v5;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v5, "clientID");
        dispatch_get_global_queue(0, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __37__ACCiAP2ShimServer_removeAllClients__block_invoke;
        block[3] = &unk_24D906948;
        block[4] = self;
        v14 = v10;
        dispatch_async(v11, block);

        ++v8;
        v9 = v5;
      }
      while (v4 != v8);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);

  }
  -[NSLock unlock](self->_clientLock, "unlock");
}

uint64_t __37__ACCiAP2ShimServer_removeAllClients__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lock");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "unlock");
}

- (unsigned)generateClientID
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *clients;
  void *v7;

  v3 = 0;
  do
  {
    do
    {
      v4 = (void *)v3;
      v5 = arc4random_uniform(0xFFFFFFFF);
      clients = self->_clients;
      +[ACCiAP2ShimServer stringForClientID:](ACCiAP2ShimServer, "stringForClientID:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v7);
      v3 = objc_claimAutoreleasedReturnValue();

    }
    while (!(_DWORD)v5);
  }
  while (v3);
  return v5;
}

- (void)_takeClientAssertionsForAccessoryConnection
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_clientLock, "lock");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_clients;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = gLogObjects;
        v10 = gNumLogObjects;
        if (gLogObjects)
          v11 = gNumLogObjects < 1;
        else
          v11 = 1;
        if (v11)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v24 = v9;
            v25 = 1024;
            v26 = v10;
            _os_log_error_impl(&dword_217DCB000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v12 = v6;
          v13 = v6;
        }
        else
        {
          v13 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = (uint64_t)v15;
          _os_log_impl(&dword_217DCB000, v13, OS_LOG_TYPE_INFO, "[#Server] client %@\n", buf, 0xCu);

        }
        -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "takeProcessAssertion:", CFSTR("external-accessory.connect"));

      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  -[NSLock unlock](self->_clientLock, "unlock");
}

- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5
{
  id v7;
  id v8;
  int v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  xpc_object_t v15;
  id v16;
  _xpc_connection_s *v17;
  int v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "canSendConnectionEventForAccessory:", v8);
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v13;
    v20 = 2080;
    v21 = a4;
    v22 = 1024;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_217DCB000, v12, OS_LOG_TYPE_INFO, "[#Server] clientToNotify bundle = %@, request = %s, canSendConnectionEvent = %d, accessory=%@", (uint8_t *)&v18, 0x26u);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "requestType", a4);
    v16 = objc_retainAutorelease(v14);
    xpc_dictionary_set_data(v15, "EAProtocolAccessoryPlistData", (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
    objc_msgSend(v7, "xpcConnection");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v17, v15);

  }
}

- (void)sendToClient:(id)a3 notification:(const char *)a4 withPayload:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  char *v16;
  void *v17;
  xpc_object_t v18;
  _xpc_connection_s *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v7 && a4 && v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "bundleId");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      v20 = 138413058;
      v21 = v16;
      v22 = 2080;
      v23 = "kXPCACCNotificationKey";
      v24 = 2080;
      v25 = a4;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_217DCB000, v12, OS_LOG_TYPE_DEFAULT, "[#Server] clientToNotify bundle = %@, request = %s, notificationName = %s, notificationPayload=%@", (uint8_t *)&v20, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "requestType", "kXPCACCNotificationKey");
    xpc_dictionary_set_string(v18, "kXPCACCNotificationNameKey", a4);
    v13 = objc_retainAutorelease(v17);
    xpc_dictionary_set_data(v18, "kXPCACCNotificationPlistData", (const void *)-[NSObject bytes](v13, "bytes"), -[NSObject length](v13, "length"));
    objc_msgSend(v7, "xpcConnection");
    v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v19, v18);

  }
  else
  {
    if (v11)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315906;
      v21 = "-[ACCiAP2ShimServer sendToClient:notification:withPayload:]";
      v22 = 2112;
      v23 = (const char *)v7;
      v24 = 2080;
      v25 = a4;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_217DCB000, v13, OS_LOG_TYPE_ERROR, "[#Server] %s: Received nil param. clientToNotify %@ notificationName %s notificationPayload %@", (uint8_t *)&v20, 0x2Au);
    }
  }

}

- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  const char *v11;

  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ACCiAP2ShimServer_notifyEAClientsOfAccessoryEvent_accessory___block_invoke;
  block[3] = &unk_24D906970;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __63__ACCiAP2ShimServer_notifyEAClientsOfAccessoryEvent_accessory___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "notifyEAClient:ofAccessoryEvent:accessory:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "unlock");
}

- (void)sendToInterestedClientsACCBLENotification:(id)a3 withPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__ACCiAP2ShimServer_sendToInterestedClientsACCBLENotification_withPayload___block_invoke;
    block[3] = &unk_24D906998;
    block[4] = self;
    v14 = v6;
    v15 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServer sendToInterestedClientsACCBLENotification:withPayload:].cold.1();

  }
}

uint64_t __75__ACCiAP2ShimServer_sendToInterestedClientsACCBLENotification_withPayload___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "interestedInBLENotifications"))
          objc_msgSend(*(id *)(a1 + 32), "sendToClient:notification:withPayload:", v7, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "cStringUsingEncoding:", 4), *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "unlock");
}

- (void)notifyEAClientsOfAccessoryConnection:(id)a3
{
  -[ACCiAP2ShimServer notifyEAClientsOfAccessoryEvent:accessory:](self, "notifyEAClientsOfAccessoryEvent:accessory:", "EAProtocolAccessoryConnected", a3);
}

- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3
{
  -[ACCiAP2ShimServer notifyEAClientsOfAccessoryEvent:accessory:](self, "notifyEAClientsOfAccessoryEvent:accessory:", "EAProtocolAccessoryDisconnected", a3);
}

- (void)notifyEAClientsOfAccessoryReconnection:(id)a3
{
  -[ACCiAP2ShimServer notifyEAClientsOfAccessoryEvent:accessory:](self, "notifyEAClientsOfAccessoryEvent:accessory:", "EAProtocolAccessoryReconnected", a3);
}

+ (void)notifyInterestedClientsOfACCBLEAccessoryEvent:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[ACCiAP2ShimServer sharedInstance](ACCiAP2ShimServer, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendToInterestedClientsACCBLENotification:withPayload:](v8, "sendToInterestedClientsACCBLENotification:withPayload:", v5, v7);
  }
  else
  {
    if (gLogObjects)
      v9 = gNumLogObjects < 1;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ACCiAP2ShimServer notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:].cold.1();
  }

}

- (void)_resetServerState
{
  int iap2AvailableNotifyToken;
  BOOL v4;
  int v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
  if (iap2AvailableNotifyToken == -1)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "[#Server] IAPServer: resetServerState: invalid notifyToken!";
      v12 = v10;
      v13 = OS_LOG_TYPE_DEFAULT;
LABEL_51:
      _os_log_impl(&dword_217DCB000, v12, v13, v11, buf, 2u);
    }
  }
  else
  {
    state64 = 0;
    notify_get_state(iap2AvailableNotifyToken, &state64);
    if (gLogObjects)
      v4 = gNumLogObjects <= 0;
    else
      v4 = 1;
    v5 = !v4;
    if (state64 == 1)
    {
      if (v5)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v6 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = 0;
        _os_log_impl(&dword_217DCB000, v6, OS_LOG_TYPE_INFO, "[#Server] IAPServer: resetServerState: set kIAP2AvailableNotification state: %d", buf, 8u);
      }

      notify_set_state(self->_iap2AvailableNotifyToken, 0);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217DCB000, v15, OS_LOG_TYPE_INFO, "[#Server] IAPServer: resetServerState: post kIAP2AvailableNotification notification: ", buf, 2u);
      }

      notify_post(MEMORY[0x24BE4F928]);
    }
    else
    {
      if (v5)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v21 = state64;
        _os_log_impl(&dword_217DCB000, v9, OS_LOG_TYPE_INFO, "[#Server] IAPServer: resetServerState: kIAP2AvailableNotification state %llu, skip post", buf, 0xCu);
      }

    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "[#Server] IAPServer: resetServerState: cancel notify token";
      v12 = v10;
      v13 = OS_LOG_TYPE_INFO;
      goto LABEL_51;
    }
  }

}

+ (void)resetServerState
{
  id v2;

  v2 = +[ACCiAP2ShimServer sharedInstance](ACCiAP2ShimServer, "sharedInstance");
}

+ (void)postNotifydNotificationType:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_217DCB000, v6, OS_LOG_TYPE_INFO, "[#Server] post darwin notification %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = objc_retainAutorelease(v3);
  notify_post((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4));

}

+ (void)postNSDistributeNotificationType:(id)a3 notifyDict:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_217DCB000, v9, OS_LOG_TYPE_INFO, "[#Server] post distributed notification %@, userInfo %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
    objc_msgSend(v10, "postNotificationName:object:userInfo:", v5, 0, v6);
  else
    objc_msgSend(v10, "postNotificationName:object:", v5, 0);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance___sharedIAP2Server;
}

void __35__ACCiAP2ShimServer_sharedInstance__block_invoke()
{
  ACCiAP2ShimServer *v0;
  void *v1;

  v0 = objc_alloc_init(ACCiAP2ShimServer);
  v1 = (void *)sharedInstance___sharedIAP2Server;
  sharedInstance___sharedIAP2Server = (uint64_t)v0;

}

+ (id)stringForClientID:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
}

+ (void)markClientAsInterestedInBleNotifications:(id)a3
{
  id v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  id obj;
  xpc_object_t object2;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  _BYTE v50[14];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects <= 0;
  else
    v4 = 1;
  v5 = !v4;
  object2 = v3;
  if (v3)
  {
    if (v5)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v50 = "+[ACCiAP2ShimServer markClientAsInterestedInBleNotifications:]";
      _os_log_impl(&dword_217DCB000, v6, OS_LOG_TYPE_DEFAULT, "[#Server] %s: iterating clients to find matching xpc_connection object", buf, 0xCu);
    }

    +[ACCiAP2ShimServer sharedInstance](ACCiAP2ShimServer, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject clientLock](v7, "clientLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lock");

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[NSObject clients](v7, "clients");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v45;
      v14 = MEMORY[0x24BDACB70];
      *(_QWORD *)&v11 = 134218240;
      v41 = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          -[NSObject clients](v7, "clients", v41);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "xpcConnection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v17) = xpc_equal(v19, object2);

          if ((_DWORD)v17)
          {
            v20 = gLogObjects;
            v21 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v22 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v41;
                *(_QWORD *)v50 = v20;
                *(_WORD *)&v50[8] = 1024;
                *(_DWORD *)&v50[10] = v21;
                _os_log_error_impl(&dword_217DCB000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v23 = v14;
              v22 = v14;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v24 = objc_msgSend(v18, "clientID");
              objc_msgSend(v18, "bundleId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v50 = v24;
              *(_WORD *)&v50[4] = 2112;
              *(_QWORD *)&v50[6] = v25;
              _os_log_impl(&dword_217DCB000, v22, OS_LOG_TYPE_DEFAULT, "[#Server] xpc_connection object interested in BLE notifications matches the one for clientID = %u, bundleID = %@", buf, 0x12u);

            }
            v26 = objc_msgSend(v18, "hasEntitlementForAllAccessories");
            v27 = v26;
            v28 = gLogObjects;
            v29 = gNumLogObjects;
            if (gLogObjects)
              v30 = gNumLogObjects <= 0;
            else
              v30 = 1;
            v31 = !v30;
            if ((_DWORD)v26)
            {
              if (v31)
              {
                v32 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v41;
                  *(_QWORD *)v50 = v28;
                  *(_WORD *)&v50[8] = 1024;
                  *(_DWORD *)&v50[10] = v29;
                  _os_log_error_impl(&dword_217DCB000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v33 = v14;
                v32 = v14;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v34 = objc_msgSend(v18, "clientID");
                objc_msgSend(v18, "bundleId");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v50 = v34;
                *(_WORD *)&v50[4] = 2112;
                *(_QWORD *)&v50[6] = v35;
                _os_log_impl(&dword_217DCB000, v32, OS_LOG_TYPE_DEFAULT, "[#Server] client has required entitlement. marking as interested for BLE notifications. clientID = %u, bundleID = %@", buf, 0x12u);

              }
            }
            else
            {
              if (v31)
              {
                v32 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v41;
                  *(_QWORD *)v50 = v28;
                  *(_WORD *)&v50[8] = 1024;
                  *(_DWORD *)&v50[10] = v29;
                  _os_log_error_impl(&dword_217DCB000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v36 = v14;
                v32 = v14;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v37 = objc_msgSend(v18, "clientID");
                objc_msgSend(v18, "bundleId");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v50 = v37;
                *(_WORD *)&v50[4] = 2112;
                *(_QWORD *)&v50[6] = v38;
                _os_log_error_impl(&dword_217DCB000, v32, OS_LOG_TYPE_ERROR, "[#Server] interested client does not have entitlement! not marking as interested for BLE notifications. clientID = %u, bundleID = %@", buf, 0x12u);

              }
            }

            objc_msgSend(v18, "setInterestedInBLENotifications:", v27);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v12);
    }

    -[NSObject clientLock](v7, "clientLock");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "unlock");

  }
  else
  {
    if (v5)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v40 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ACCiAP2ShimServer markClientAsInterestedInBleNotifications:].cold.1(v7);
  }

}

- (NSMutableDictionary)delegateList
{
  return self->_delegateList;
}

- (void)setDelegateList:(id)a3
{
  objc_storeStrong((id *)&self->_delegateList, a3);
}

- (NSMutableDictionary)accessoryViaKeyUIDList
{
  return self->_accessoryViaKeyUIDList;
}

- (void)setAccessoryViaKeyUIDList:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViaKeyUIDList, a3);
}

- (NSMutableDictionary)accessoryViaConnectionIDList
{
  return self->_accessoryViaConnectionIDList;
}

- (void)setAccessoryViaConnectionIDList:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViaConnectionIDList, a3);
}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (OS_dispatch_queue)iap2dhighPriorityRootQueue
{
  return self->_iap2dhighPriorityRootQueue;
}

- (OS_dispatch_queue)internalListenerQueue
{
  return self->_internalListenerQueue;
}

- (__serverFlags)serverFlags
{
  return self->_serverFlags;
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSLock)clientLock
{
  return (NSLock *)objc_getProperty(self, a2, 88, 1);
}

- (int)iap2AvailableNotifyToken
{
  return self->_iap2AvailableNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLock, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_internalListenerQueue, 0);
  objc_storeStrong((id *)&self->_iap2dhighPriorityRootQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_listQueue, 0);
  objc_storeStrong((id *)&self->_accessoryViaConnectionIDList, 0);
  objc_storeStrong((id *)&self->_accessoryViaKeyUIDList, 0);
  objc_storeStrong((id *)&self->_delegateList, 0);
}

- (void)init
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_13();
  _os_log_fault_impl(&dword_217DCB000, v0, OS_LOG_TYPE_FAULT, "[#Server] IAPServer: init: failed to register notify token!", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)_iterateDelegates:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_217DCB000, a2, a3, "[#Server] ACCiAP2ShimServer iterateDelegates, _delegateList=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccessory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_217DCB000, v0, v1, "[#Server] ACCiAP2ShimServer addAccessory %@, after add _accessoryViaKeyUIDList=%@");
  OUTLINED_FUNCTION_2();
}

- (void)_removeAccessory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_217DCB000, v0, v1, "[#Server] ACCiAP2ShimServer removeAccessory %@, after remove _accessoryViaKeyUIDList=%@");
  OUTLINED_FUNCTION_2();
}

- (void)_iterateAccessories:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_217DCB000, a2, a3, "[#Server] ACCiAP2ShimServer iterateAccessories, _accessoryViaKeyUIDList=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_217DCB000, v0, v1, "[#Server] processXPCMessage: %@ connection: %@, requestType=%s, try delegate %@");
}

void __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_217DCB000, v0, v1, "[#Server] processXPCMessage: %@ connection: %@, requestType=%s, delegate does not response to selector , delegate=%@");
}

- (void)findClientWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_217DCB000, v0, v1, "[#Server] findClientWithID: client=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)findClientWithID:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 80);
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2112;
  v6 = v3;
  _os_log_debug_impl(&dword_217DCB000, log, OS_LOG_TYPE_DEBUG, "[#Server] findClientWithID: clientID=%u _clients=%@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)findClientWithXPCConnection:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_217DCB000, v0, v1, "[#Server] findClientWithID: xpcConnection=%@ _clients=%@");
  OUTLINED_FUNCTION_2();
}

- (void)sendToInterestedClientsACCBLENotification:withPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_217DCB000, v0, v1, "[#Server] %s: Received nil param. notificationName %@ notificationPayload %@", v2);
}

+ (void)notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_217DCB000, v0, v1, "[#Server] %s: Received nil param. notificationName %@ notificationPayload %@", v2);
}

+ (void)markClientAsInterestedInBleNotifications:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "+[ACCiAP2ShimServer markClientAsInterestedInBleNotifications:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_217DCB000, log, OS_LOG_TYPE_ERROR, "[#Server] %s: Received nil param. xpc_connection %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
