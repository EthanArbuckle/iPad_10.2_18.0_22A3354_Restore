@implementation TKSmartCardSlotEngine

+ (void)set_testing_stateDelay:(id)a3
{
  objc_storeStrong((id *)&_stateDelay, a3);
}

+ (NSNumber)_testing_stateDelay
{
  return (NSNumber *)(id)_stateDelay;
}

- (TKSmartCardSlotEngine)initWithSlotParameters:(id)a3
{
  id v5;
  TKSmartCardSlotEngine *v6;
  TKSmartCardSlotEngine *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardSlotEngine;
  v6 = -[TKSmartCardSlotEngine init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lastId = 0;
    v6->_powerDownIdleTimeout = 5.0;
    objc_storeStrong((id *)&v6->_slotParameters, a3);
  }

  return v7;
}

- (void)logWithBytes:(id)a3 handler:(id)a4
{
  void (**v6)(id, OS_os_log *, uint64_t);
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  OS_os_log *log;
  id v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, OS_os_log *, uint64_t))a4;
  if (self->_log)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v13);
    v9 = objc_msgSend(v8, "bytes");
    if (objc_msgSend(v8, "length"))
    {
      v10 = 0;
      do
        objc_msgSend(v7, "appendFormat:", CFSTR(" %02x"), *(unsigned __int8 *)(v9 + v10++));
      while (v10 < objc_msgSend(v8, "length"));
    }
    log = self->_log;
    v12 = objc_retainAutorelease(v7);
    v6[2](v6, log, objc_msgSend(v12, "UTF8String"));

  }
}

- (BOOL)setupWithName:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  TK_LOG_token_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotEngine setupWithName:delegate:].cold.1();

  -[TKSlotParameters setDelegateWithEscapeMethod:](self->_slotParameters, "setDelegateWithEscapeMethod:", objc_opt_respondsToSelector() & 1);
  -[TKSlotParameters setDelegateWithControlMethod:](self->_slotParameters, "setDelegateWithControlMethod:", objc_opt_respondsToSelector() & 1);
  v9 = -[TKSmartCardSlotEngine _setupWithName:delegate:](self, "_setupWithName:delegate:", v6, v7);

  return v9;
}

- (id)slotRegistryWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_registrationConnection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)_setupWithName:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSMutableArray *v20;
  NSMutableArray *sessionRequests;
  NSMapTable *v22;
  NSMapTable *stateRequests;
  NSObject *v24;
  qos_class_t v25;
  NSObject *v26;
  id v27;
  OS_dispatch_queue *v28;
  OS_dispatch_queue *queue;
  id v30;
  OS_dispatch_queue *v31;
  OS_dispatch_queue *powerRequestsQueue;
  NSHashTable *v33;
  NSHashTable *clients;
  NSMapTable *v35;
  NSMapTable *reservations;
  TKPowerMonitor *v37;
  TKPowerMonitor *powerMonitor;
  TKPowerMonitor *v39;
  void *v40;
  NSXPCListener *v41;
  NSXPCListener *listener;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSXPCConnection *v47;
  NSXPCConnection *registrationConnection;
  NSXPCConnection *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  uint8_t v55;
  _QWORD v57[6];
  _QWORD v58[4];
  id v59;
  TKSmartCardSlotEngine *v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  char v64;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectoryForUser(CFSTR("root"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, 0);

  if ((v11 & 1) == 0)
  {
    TK_LOG_token_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9768000, v12, OS_LOG_TYPE_INFO, "Call 'setupWithName' was postponed, because root's home directory does not exist", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectoryForUser(CFSTR("root"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v14, 0);

    if ((v15 & 1) == 0)
    {
      do
      {
        sleep(1u);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSHomeDirectoryForUser(CFSTR("root"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v17, 0);

      }
      while (!v18);
    }
    TK_LOG_token_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9768000, v19, OS_LOG_TYPE_INFO, "Method 'setupWithName' continues", buf, 2u);
    }

  }
  objc_storeWeak((id *)&self->_delegate, v8);
  objc_storeStrong((id *)&self->_name, a3);
  self->_previousState = 1;
  *(_OWORD *)&self->_state = xmmword_1B97AABB0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  sessionRequests = self->_sessionRequests;
  self->_sessionRequests = v20;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
  v22 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  stateRequests = self->_stateRequests;
  self->_stateRequests = v22;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = qos_class_main();
  dispatch_queue_attr_make_with_qos_class(v24, v25, 0);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.scslot:%@"), v7);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v27, "UTF8String"), v26);
  queue = self->_queue;
  self->_queue = v28;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.scpwr:%@"), v7);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v30, "UTF8String"), v26);
  powerRequestsQueue = self->_powerRequestsQueue;
  self->_powerRequestsQueue = v31;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
  v33 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  clients = self->_clients;
  self->_clients = v33;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
  v35 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  reservations = self->_reservations;
  self->_reservations = v35;

  +[TKPowerMonitor defaultMonitor](TKPowerMonitor, "defaultMonitor");
  v37 = (TKPowerMonitor *)objc_claimAutoreleasedReturnValue();
  powerMonitor = self->_powerMonitor;
  self->_powerMonitor = v37;

  v39 = self->_powerMonitor;
  NSStringFromSelector(sel_awaken);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKPowerMonitor addObserver:forKeyPath:options:context:](v39, "addObserver:forKeyPath:options:context:", self, v40, 5, 0);

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v41 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  self->_listener = v41;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", self->_queue);
  -[NSXPCListener resume](self->_listener, "resume");
  -[TKSmartCardSlotEngine serverEndpoint](self, "serverEndpoint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v45 = v44;
  if (v43)
  {
    -[TKSmartCardSlotEngine serverEndpoint](self, "serverEndpoint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (NSXPCConnection *)objc_msgSend(v45, "initWithListenerEndpoint:", v46);
    registrationConnection = self->_registrationConnection;
    self->_registrationConnection = v47;

  }
  else
  {
    v49 = (NSXPCConnection *)objc_msgSend(v44, "initWithMachServiceName:options:", CFSTR("com.apple.ctkd.slot-registry"), 4096);
    v46 = self->_registrationConnection;
    self->_registrationConnection = v49;
  }

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF237C98);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_registrationConnection, "setRemoteObjectInterface:", v50);

  -[NSXPCConnection resume](self->_registrationConnection, "resume");
  *(_QWORD *)buf = 0;
  v62 = buf;
  v63 = 0x2020000000;
  v64 = 0;
  v51 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke;
  v58[3] = &unk_1E7089980;
  v52 = v7;
  v59 = v52;
  v60 = self;
  -[TKSmartCardSlotEngine slotRegistryWithErrorHandler:](self, "slotRegistryWithErrorHandler:", v58);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCListener endpoint](self->_listener, "endpoint");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v51;
  v57[1] = 3221225472;
  v57[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118;
  v57[3] = &unk_1E70899D0;
  v57[4] = self;
  v57[5] = buf;
  objc_msgSend(v53, "addSlotWithEndpoint:name:type:reply:", v54, v52, CFSTR("smartcard"), v57);

  v55 = v62[24];
  _Block_object_dispose(buf, 8);

  return v55;
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TK_LOG_token_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "terminate");
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  os_log_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), a2);
  TK_LOG_token_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118_cold_1();

  v6 = os_log_create("com.apple.CryptoTokenKit.APDU", "APDULog");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 120);
  *(_QWORD *)(v7 + 120) = v6;

  v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121;
  v10[3] = &unk_1E70899A8;
  v10[4] = v9;
  objc_msgSend(v9, "logWithBytes:handler:", 0, v10);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121(uint64_t a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121_cold_1(a1, oslog);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSHashTable *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF232E10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF233260);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_sessionWithParameters_reply_, 0, 1);

  objc_msgSend(v7, "setExportedInterface:", v8);
  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF230988);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v10);

  v11 = self->_clients;
  objc_sync_enter(v11);
  -[NSHashTable addObject:](self->_clients, "addObject:", v7);
  objc_sync_exit(v11);

  objc_msgSend(v7, "_setQueue:", self->_queue);
  TK_LOG_token_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotEngine listener:shouldAcceptNewConnection:].cold.1();

  objc_msgSend(v7, "resume");
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  id WeakRetained;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  char v20;

  v8 = a5;
  v9 = a3;
  NSStringFromSelector(sel_awaken);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      if (self->_listener)
      {
        TK_LOG_token_0();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[TKSmartCardSlotEngine observeValueForKeyPath:ofObject:change:context:].cold.1();

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          v17 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v17, "didWakeUpOnEngine:", self);
LABEL_12:

        }
      }
    }
    else
    {
      TK_LOG_token_0();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[TKSmartCardSlotEngine observeValueForKeyPath:ofObject:change:context:].cold.2();

      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v17, "willSleepOnEngine:", self);
        goto LABEL_12;
      }
    }
  }

}

- (id)dictionaryForState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  TKSmartCardATR *atr;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_previousState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("prevstate"));

  if (a3 == 4 || a3 == 2)
  {
    atr = self->_atr;
    if (atr)
    {
      -[TKSmartCardATR bytes](atr, "bytes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("atr"));

    }
    -[NSMapTable objectEnumerator](self->_reservations, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v13, "exclusive"))
        v14 = 2;
      else
        v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("share"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_powerState);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("power"));

  }
  return v5;
}

- (void)_changeStateTo:(id)a3 forClient:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke;
  v12[3] = &unk_1E70899F8;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "notifyWithParameters:reply:", v10, v12);

}

void __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(void);
  void *v12;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (!objc_msgSend(v3, "activeStateNotifications"))
    {
      if (!objc_msgSend(v4, "activeStateNotifications"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TKSmartCardSlotEngine.m"), 382, CFSTR("Mismatch in active state notifications count"));

      }
      TK_LOG_token_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke_cold_1();

    }
    objc_msgSend(v4, "setActiveStateNotifications:", objc_msgSend(v4, "activeStateNotifications") - 1);
    objc_msgSend(v4, "replyNextState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "replyNextState");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("state"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, objc_msgSend(v8, "integerValue"));

      objc_msgSend(v4, "setReplyNextState:", 0);
    }
    objc_msgSend(v4, "replyFlushedState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(v4, "activeStateNotifications");

      if (!v10)
      {
        objc_msgSend(v4, "replyFlushedState");
        v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v11[2]();

        objc_msgSend(v4, "setReplyFlushedState:", 0);
      }
    }
  }

  objc_sync_exit(v2);
}

- (void)changeStateTo:(int64_t)a3 powerState:(int64_t)a4
{
  int64_t state;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMapTable *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  float v17;
  dispatch_time_t v18;
  NSObject *powerRequestsQueue;
  NSMapTable *v20;
  NSHashTable *v22;
  NSHashTable *obj;
  _QWORD block[5];
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  self->_powerState = a4;
  self->_previousState = state;
  -[TKSmartCardSlotEngine dictionaryForState:](self, "dictionaryForState:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TK_LOG_token_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotEngine changeStateTo:powerState:].cold.1((uint64_t)self, v6, v7);

  v22 = self->_clients;
  objc_sync_enter(v22);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_clients;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v12 = self->_stateRequests;
        objc_sync_enter(v12);
        -[NSMapTable objectForKey:](self->_stateRequests, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = (void *)objc_opt_new();
          -[NSMapTable setObject:forKey:](self->_stateRequests, "setObject:forKey:", v13, v11);
        }
        objc_msgSend(v13, "setActiveStateNotifications:", objc_msgSend(v13, "activeStateNotifications") + 1);

        objc_sync_exit(v12);
        +[TKSmartCardSlotEngine _testing_stateDelay](TKSmartCardSlotEngine, "_testing_stateDelay");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
        {
          -[TKSmartCardSlotEngine _changeStateTo:forClient:](self, "_changeStateTo:forClient:", v6, v11);
        }
        else
        {
          +[TKSmartCardSlotEngine _testing_stateDelay](TKSmartCardSlotEngine, "_testing_stateDelay");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          v18 = dispatch_time(0, (uint64_t)(float)(v17 * 1000000000.0));
          powerRequestsQueue = self->_powerRequestsQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__TKSmartCardSlotEngine_changeStateTo_powerState___block_invoke;
          block[3] = &unk_1E7089510;
          block[4] = self;
          v25 = v6;
          v26 = v11;
          dispatch_after(v18, powerRequestsQueue, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  objc_sync_exit(v22);
  v20 = self->_stateRequests;
  objc_sync_enter(v20);
  self->_state = a3;
  objc_sync_exit(v20);

}

uint64_t __50__TKSmartCardSlotEngine_changeStateTo_powerState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeStateTo:forClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)waitForNextState:(int64_t)a3 reply:(id)a4
{
  NSMapTable *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  v6 = self->_stateRequests;
  objc_sync_enter(v6);
  if (self->_state == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_stateRequests, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_opt_new();

      -[NSMapTable setObject:forKey:](self->_stateRequests, "setObject:forKey:", v9, v7);
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v9, "setStateWhenRequested:", a3);
    objc_msgSend(v9, "setReplyNextState:", v10);

  }
  else
  {
    v10[2]();
  }
  objc_sync_exit(v6);

}

- (void)waitForStateFlushedWithReply:(id)a3
{
  NSMapTable *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = self->_stateRequests;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_stateRequests, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "activeStateNotifications"))
    objc_msgSend(v7, "setReplyFlushedState:", v8);
  else
    v8[2]();

  objc_sync_exit(v4);
}

- (BOOL)reset
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSString *name;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    TK_LOG_token_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[TKSmartCardSlotEngine reset].cold.2();

    -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 2, 0);
    objc_msgSend(WeakRetained, "engineResetCard:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TK_LOG_token_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TKSmartCardSlotEngine reset].cold.1();

    if (self->_state == 2)
    {
      objc_storeStrong((id *)&self->_atr, v5);
      if (v5)
      {
        objc_msgSend(v5, "bytes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", v7, &__block_literal_global_178);

        v8 = 1;
        -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 4, 1);
        self->_apduSentSinceLastReset = 0;
        self->_protocol = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0, &__block_literal_global_180);
      TK_LOG_token_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        v12 = 138543362;
        v13 = name;
        _os_log_impl(&dword_1B9768000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to reset the card", (uint8_t *)&v12, 0xCu);
      }

      -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 3, 0);
    }
    v8 = 0;
    goto LABEL_14;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

void __30__TKSmartCardSlotEngine_reset__block_invoke(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __30__TKSmartCardSlotEngine_reset__block_invoke_cold_1();
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_179(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __30__TKSmartCardSlotEngine_reset__block_invoke_179_cold_1();
}

- (BOOL)setProtocol:(unint64_t)a3
{
  NSObject *v5;
  id WeakRetained;
  id v7;
  unint64_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  _QWORD v13[5];

  TK_LOG_token_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotEngine setProtocol:].cold.3();

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_msgSend(v7, "engine:setProtocol:", self, a3);

      if (self->_state == 4)
      {
        TK_LOG_token_0();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[TKSmartCardSlotEngine setProtocol:].cold.2();

        self->_protocol = v8;
        if (v8)
        {
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __37__TKSmartCardSlotEngine_setProtocol___block_invoke;
          v13[3] = &__block_descriptor_40_e33_v24__0__NSObject_OS_os_log__8r_16l;
          v13[4] = v8;
          -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0, v13);
          -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 4, 2);
          v10 = 1;
LABEL_15:

          return v10;
        }
        -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0, &__block_literal_global_183);
        TK_LOG_token_0();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[TKSmartCardSlotEngine setProtocol:].cold.1();

      }
    }
    v10 = 0;
    goto LABEL_15;
  }
  return 1;
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke(uint64_t a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __37__TKSmartCardSlotEngine_setProtocol___block_invoke_cold_1(a1, oslog);
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_182(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __37__TKSmartCardSlotEngine_setProtocol___block_invoke_182_cold_1();
}

- (void)powerDownWithEject:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  NSObject *v6;
  char v7;
  NSObject *v8;
  _QWORD v9[4];
  char v10;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    TK_LOG_token_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TKSmartCardSlotEngine powerDownWithEject:].cold.2();

    v7 = objc_msgSend(WeakRetained, "engine:powerDownWithEject:", self, v3);
    TK_LOG_token_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[TKSmartCardSlotEngine powerDownWithEject:].cold.1();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke;
    v9[3] = &__block_descriptor_33_e33_v24__0__NSObject_OS_os_log__8r_16l;
    v10 = v7;
    -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0, v9);
    -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", self->_state, 0);
  }

}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _BOOL4 v4;

  v3 = a2;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 32);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)a1)
  {
    if (v4)
      __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_2();
  }
  else if (v4)
  {
    __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_1();
  }

}

- (void)scheduleIdlePowerDown
{
  double v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *idlePowerDownSource;
  double v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[5];

  if (!-[NSMapTable count](self->_reservations, "count"))
  {
    -[TKSmartCardSlotEngine powerDownIdleTimeout](self, "powerDownIdleTimeout");
    if (v3 > 0.0)
    {
      v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
      idlePowerDownSource = self->_idlePowerDownSource;
      self->_idlePowerDownSource = v4;

      -[TKSmartCardSlotEngine powerDownIdleTimeout](self, "powerDownIdleTimeout");
      v7 = (uint64_t)(v6 * 1000000000.0);
      v8 = self->_idlePowerDownSource;
      v9 = dispatch_time(0, v7);
      dispatch_source_set_timer(v8, v9, v7, v7);
      v10 = self->_idlePowerDownSource;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke;
      handler[3] = &unk_1E70891E8;
      handler[4] = self;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume((dispatch_object_t)self->_idlePowerDownSource);
    }
  }
}

void __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  TK_LOG_token_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_cold_1();

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_185;
  block[3] = &unk_1E70891E8;
  block[4] = v5;
  dispatch_sync(v6, block);
}

uint64_t __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_185(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "powerDownWithEject:", 0);
}

- (void)cardPresent:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke;
  v4[3] = &unk_1E7089B20;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[5];
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
  v5 = *(unsigned __int8 *)(a1 + 40);
  TK_LOG_token_0();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_1B9768000, v6, OS_LOG_TYPE_INFO, "%{public}@: card inserted", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "logWithBytes:handler:", 0, &__block_literal_global_187);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 184);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke_188;
    block[3] = &unk_1E70891E8;
    block[4] = v9;
    dispatch_async(v10, block);
  }
  else
  {
    if (v7)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_impl(&dword_1B9768000, v6, OS_LOG_TYPE_INFO, "%{public}@: card removed", buf, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 32), "logWithBytes:handler:", 0, &__block_literal_global_190);
    objc_msgSend(*(id *)(a1 + 32), "changeStateTo:powerState:", 1, 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(WeakRetained, "setValid:", 0);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "reply", (_QWORD)v22);
          v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, _QWORD, void *))v20)[2](v20, 0, 0, v21);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  }
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_186(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __37__TKSmartCardSlotEngine_cardPresent___block_invoke_186_cold_1();
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_188(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "reset"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 176);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke_2;
    block[3] = &unk_1E70891E8;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __37__TKSmartCardSlotEngine_cardPresent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleIdlePowerDown");
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_189(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __37__TKSmartCardSlotEngine_cardPresent___block_invoke_189_cold_1();
}

- (void)setupSlotWithReply:(id)a3
{
  int64_t state;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  state = self->_state;
  v5 = (void (**)(id, void *))a3;
  -[TKSmartCardSlotEngine dictionaryForState:](self, "dictionaryForState:", state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", self->_name, CFSTR("name"));
  -[TKSmartCardSlotEngine slotParameters](self, "slotParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getDictionaryParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("params"));

  TK_LOG_token_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotEngine setupSlotWithReply:].cold.1();

  v5[2](v5, v6);
}

- (BOOL)connectCardSessionWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *powerRequestsQueue;
  NSObject *v12;
  NSObject *v13;
  unint64_t protocol;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  NSString *name;
  _QWORD v22[6];
  id v23[2];
  _QWORD v24[6];
  id v25[2];
  _QWORD block[5];
  id location;
  _BYTE v28[16];
  _BYTE buf[28];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sensitive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0xFFFFLL;
  TK_LOG_token_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = name;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v5;
    _os_log_debug_impl(&dword_1B9768000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: connectCardSession:proto=%04x, sensitive=%@", buf, 0x1Cu);
  }

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  powerRequestsQueue = self->_powerRequestsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke;
  block[3] = &unk_1E70891E8;
  block[4] = self;
  dispatch_sync(powerRequestsQueue, block);
  TK_LOG_token_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotEngine connectCardSessionWithParameters:].cold.2();

  if (!self->_powerState || objc_msgSend(v5, "BOOLValue") && self->_apduSentSinceLastReset)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 0;
LABEL_12:
    v13 = self->_powerRequestsQueue;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192;
    v24[3] = &unk_1E7089B48;
    v24[4] = self;
    v24[5] = buf;
    v25[1] = (id)v8;
    objc_copyWeak(v25, &location);
    dispatch_sync(v13, v24);
    objc_destroyWeak(v25);
    goto LABEL_19;
  }
  if (self->_powerState != 2)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 0;
    v18 = self->_powerRequestsQueue;
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193;
    v22[3] = &unk_1E7089B70;
    v22[4] = self;
    v22[5] = buf;
    v23[1] = (id)v8;
    objc_copyWeak(v23, &location);
    dispatch_sync(v18, v22);
    objc_destroyWeak(v23);
    goto LABEL_19;
  }
  protocol = self->_protocol;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  if ((protocol & ~v8) != 0)
    goto LABEL_12;
  TK_LOG_token_0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_loadWeakRetained(&location);
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardSlotEngine connectCardSessionWithParameters:].cold.1(v17, (uint64_t)v28, v15, v16);
  }

  *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;
LABEL_19:
  v19 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v19;
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "reset"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setProtocol:", *(_QWORD *)(a1 + 56));
    TK_LOG_token_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_1(a1, v2);

  }
  else
  {
    TK_LOG_token_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_2(a1, v3);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193(uint64_t a1)
{
  NSObject *v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setProtocol:", *(_QWORD *)(a1 + 56));
  TK_LOG_token_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193_cold_1(a1, v2);

}

- (void)leaveSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  NSObject *powerRequestsQueue;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  TKSmartCardSessionEngine *v15;
  void *v16;
  TKSmartCardSessionEngine *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v29;
  _QWORD v30[5];
  BOOL v31;
  _QWORD block[5];
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "endPolicy");
  if ((unint64_t)(v6 - 2) < 2)
  {
    TK_LOG_token_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[TKSmartCardSlotEngine leaveSession:].cold.3();

    v10 = objc_msgSend(v5, "endPolicy") == 3;
    powerRequestsQueue = self->_powerRequestsQueue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __38__TKSmartCardSlotEngine_leaveSession___block_invoke_194;
    v30[3] = &unk_1E7089B20;
    v30[4] = self;
    v31 = v10;
    dispatch_sync(powerRequestsQueue, v30);
  }
  else
  {
    if (v6 == 1)
    {
      TK_LOG_token_0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[TKSmartCardSlotEngine leaveSession:].cold.2();

      v13 = self->_powerRequestsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__TKSmartCardSlotEngine_leaveSession___block_invoke;
      block[3] = &unk_1E70891E8;
      block[4] = self;
      dispatch_sync(v13, block);
      goto LABEL_16;
    }
    if (!v6)
    {
      TK_LOG_token_0();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[TKSmartCardSlotEngine leaveSession:].cold.1();

LABEL_16:
      v8 = 1;
      goto LABEL_17;
    }
  }
  v8 = 0;
LABEL_17:
  objc_msgSend(v5, "setActive:", 0);
LABEL_18:
  objc_storeWeak((id *)&self->_session, 0);
  if (-[NSMutableArray count](self->_sessionRequests, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sessionRequests, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_sessionRequests, "removeObjectAtIndex:", 0);
    v15 = [TKSmartCardSessionEngine alloc];
    objc_msgSend(v14, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TKSmartCardSessionEngine initWithSlot:connection:](v15, "initWithSlot:connection:", self, v16);

    objc_storeWeak((id *)&self->_session, v17);
    objc_msgSend(v14, "parameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("endpolicy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
    else
      v20 = 0;
    -[TKSmartCardSessionEngine setEndPolicy:](v17, "setEndPolicy:", v20);
    objc_msgSend(v14, "parameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TKSmartCardSlotEngine connectCardSessionWithParameters:](self, "connectCardSessionWithParameters:", v21);

    if (v22)
    {
      -[TKSmartCardSessionEngine setActive:](v17, "setActive:", 1);
      objc_msgSend(v14, "reply");
      v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("protocol");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_protocol);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, TKSmartCardSessionEngine *, void *, _QWORD))v23)[2](v23, v17, v25, 0);

      if (-[NSMutableArray count](self->_sessionRequests, "count"))
      {
        -[TKSmartCardSessionEngine connection](v17, "connection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "remoteObjectProxy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "cardSessionRequested");
      }
    }
    else
    {
      objc_msgSend(v14, "reply");
      v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v28)[2](v28, 0, 0, v29);

      -[TKSmartCardSlotEngine leaveSession:](self, "leaveSession:", 0);
    }

  }
  else if (v8 && self->_atr)
  {
    -[TKSmartCardSlotEngine scheduleIdlePowerDown](self, "scheduleIdlePowerDown");
  }

}

uint64_t __38__TKSmartCardSlotEngine_leaveSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __38__TKSmartCardSlotEngine_leaveSession___block_invoke_194(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "powerDownWithEject:", *(unsigned __int8 *)(a1 + 40));
}

- (void)sessionWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  TKSmartCardSessionRequest *v13;

  v6 = a4;
  v7 = a3;
  v13 = objc_alloc_init(TKSmartCardSessionRequest);
  -[TKSmartCardSessionRequest setParameters:](v13, "setParameters:", v7);

  -[TKSmartCardSessionRequest setReply:](v13, "setReply:", v6);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSessionRequest setConnection:](v13, "setConnection:", v8);

  -[NSMutableArray addObject:](self->_sessionRequests, "addObject:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "cardSessionRequested");
  }
  else
  {
    -[TKSmartCardSlotEngine leaveSession:](self, "leaveSession:", 0);
  }

}

- (id)_findReservation:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_reservations;
    v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v8 = 0;
      v14 = *(_QWORD *)v20;
LABEL_5:
      v15 = 0;
      v16 = v8;
      while (1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v8 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v15);

        -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v8, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          break;
        ++v15;
        v16 = v8;
        if (v13 == v15)
        {
          v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            goto LABEL_5;

          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v8 = 0;
      v10 = 0;
    }

  }
  return v10;
}

- (id)_getReservationId
{
  void *v3;
  void *v4;
  void *v5;

  do
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    ++self->_lastId;
    objc_msgSend(v3, "numberWithUnsignedInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardSlotEngine _findReservation:connection:](self, "_findReservation:connection:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v5);
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastId);
}

- (void)reserveProtocols:(id)a3 reservationId:(id)a4 exclusive:(BOOL)a5 reply:(id)a6
{
  _TKSmartCardSlotReservation *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *powerRequestsQueue;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v29;
  _TKSmartCardSlotReservation *v30;
  NSMapTable *obj;
  id v33;
  _QWORD block[5];
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _BYTE v56[128];
  uint64_t v57;

  v26 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v33 = a4;
  v28 = a6;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[TKSmartCardSlotEngine _findReservation:connection:](self, "_findReservation:connection:", v33, v27);
    v30 = (_TKSmartCardSlotReservation *)objc_claimAutoreleasedReturnValue();
    v8 = v30;
    if (!v30)
    {
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v28 + 2))(v28, 0, 0, 3);
      v30 = 0;
      goto LABEL_38;
    }
    if (!v29)
    {
      -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v33);
      if (!objc_msgSend(v9, "count"))
        -[NSMapTable removeObjectForKey:](self->_reservations, "removeObjectForKey:", v27);

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v28 + 2))(v28, 0, 0, 0);
      goto LABEL_37;
    }
  }
  else
  {
    if (!v29)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v28 + 2))(v28, 0, 0, 0);
      v30 = 0;
      v33 = 0;
      goto LABEL_38;
    }
    v8 = 0;
  }
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0xFFFFLL;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = self->_reservations;
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  v30 = v8;
  if (v10)
  {
    v11 = *(_QWORD *)v41;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v12;
        v35[1] = 3221225472;
        v35[2] = __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke;
        v35[3] = &unk_1E7089B98;
        v36 = v33;
        v37 = &v44;
        v38 = &v48;
        v39 = &v52;
        objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v35);

      }
      v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v10);
  }

  if (!v26)
  {
    if (!*((_BYTE *)v49 + 24))
    {
      v17 = v45[3];
      if ((objc_msgSend(v29, "unsignedIntegerValue") & v17) != 0)
        goto LABEL_25;
      if (!*((_BYTE *)v49 + 24))
      {
        v25 = v45[3];
        if ((objc_msgSend(v29, "unsignedIntegerValue") & v25) != 0)
          v15 = 3;
        else
          v15 = 1;
        goto LABEL_21;
      }
    }
LABEL_20:
    v15 = 2;
LABEL_21:
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v28 + 2))(v28, 0, 0, v15);
    v16 = 0;
    goto LABEL_36;
  }
  if (*((_BYTE *)v53 + 24))
    goto LABEL_20;
LABEL_25:
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_reservations, "setObject:forKey:", v22, v21);
    }
    v30 = objc_alloc_init(_TKSmartCardSlotReservation);
    -[_TKSmartCardSlotReservation setProtocols:](v30, "setProtocols:", v29);
    -[_TKSmartCardSlotReservation setExclusive:](v30, "setExclusive:", v26);
    -[TKSmartCardSlotEngine _getReservationId](self, "_getReservationId");
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setObject:forKey:", v30, v20);
    goto LABEL_34;
  }
  -[_TKSmartCardSlotReservation protocols](v30, "protocols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqual:", v29))
  {

    goto LABEL_33;
  }
  v19 = -[_TKSmartCardSlotReservation exclusive](v30, "exclusive");

  if (((v19 ^ v26) & 1) != 0)
  {
LABEL_33:
    -[_TKSmartCardSlotReservation setProtocols:](v30, "setProtocols:", v29);
    v20 = (uint64_t)v33;
    -[_TKSmartCardSlotReservation setExclusive:](v30, "setExclusive:", v26);
LABEL_34:
    v16 = 1;
    goto LABEL_35;
  }
  v16 = 0;
  v20 = (uint64_t)v33;
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue") & v45[3]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, uint64_t, _QWORD))v28 + 2))(v28, v23, v20, 0);

  v33 = (id)v20;
LABEL_36:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  if (v16)
  {
LABEL_37:
    powerRequestsQueue = self->_powerRequestsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke_2;
    block[3] = &unk_1E70891E8;
    block[4] = self;
    dispatch_sync(powerRequestsQueue, block);
  }
LABEL_38:

}

void __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  if (a1[4] != a2)
  {
    v4 = a3;
    objc_msgSend(v4, "protocols");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) &= objc_msgSend(v5, "unsignedIntegerValue");

    LOBYTE(v5) = objc_msgSend(v4, "exclusive");
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v5;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
}

uint64_t __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeStateTo:powerState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)sendControl:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6
{
  uint64_t v7;
  id v10;
  void (**v11)(id, void *);
  id WeakRetained;
  char v13;
  id v14;
  void *v15;
  id v16;

  v7 = *(_QWORD *)&a5;
  v16 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "engine:control:data:expectedLength:", self, v16, v10, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  v11[2](v11, v15);

}

- (void)getAttrib:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4;
  void (**v6)(id, void *, uint64_t);
  uint64_t v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, void *, uint64_t))a4;
  v7 = 600;
  v12 = 600;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "engine:getAttrib:error:", self, v4, &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v12;
  }
  else
  {
    v11 = 0;
  }
  v6[2](v6, v11, v7);

}

- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, uint64_t, _BOOL8);
  _BOOL8 v10;
  id WeakRetained;
  char v12;
  id v13;
  uint64_t v14;
  char v15;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _BOOL8))a5;
  v10 = 1;
  v15 = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_msgSend(v13, "engine:setAttrib:data:attribNotSupported:", self, v6, v8, &v15);

    v10 = v15 != 0;
  }
  else
  {
    v14 = 0;
  }
  v9[2](v9, v14, v10);

}

- (void)runUserInteraction:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = 0;
    objc_msgSend(v10, "engine:runUserInteraction:error:", self, v6, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  v7[2](v7, v11, v12);

}

- (void)terminate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__TKSmartCardSlotEngine_terminate__block_invoke;
  block[3] = &unk_1E70891E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__TKSmartCardSlotEngine_terminate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_source_t *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  TK_LOG_token_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __34__TKSmartCardSlotEngine_terminate__block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "invalidate", (_QWORD)v12);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = 0;

  v10 = *(dispatch_source_t **)(a1 + 32);
  if (v10[7])
  {
    dispatch_source_cancel(v10[7]);
    v10 = *(dispatch_source_t **)(a1 + 32);
  }
  return -[dispatch_source_t logWithBytes:handler:](v10, "logWithBytes:handler:", 0, &__block_literal_global_207, (_QWORD)v12);
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_206(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __34__TKSmartCardSlotEngine_terminate__block_invoke_206_cold_1();
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (double)powerDownIdleTimeout
{
  return self->_powerDownIdleTimeout;
}

- (void)setPowerDownIdleTimeout:(double)a3
{
  self->_powerDownIdleTimeout = a3;
}

- (TKSlotParameters)slotParameters
{
  return (TKSlotParameters *)objc_getProperty(self, a2, 144, 1);
}

- (NSXPCListenerEndpoint)serverEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 152, 1);
}

- (void)setServerEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (TKSmartCardSlotEngineDelegate)delegate
{
  return (TKSmartCardSlotEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (OS_dispatch_queue)powerRequestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPowerRequestsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (BOOL)apduSentSinceLastReset
{
  return self->_apduSentSinceLastReset;
}

- (void)setApduSentSinceLastReset:(BOOL)a3
{
  self->_apduSentSinceLastReset = a3;
}

- (TKSmartCardSessionEngine)session
{
  return (TKSmartCardSessionEngine *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_powerRequestsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
  objc_storeStrong((id *)&self->_slotParameters, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);
  objc_storeStrong((id *)&self->_reservations, 0);
  objc_storeStrong((id *)&self->_stateRequests, 0);
  objc_storeStrong((id *)&self->_sessionRequests, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_registrationConnection, 0);
  objc_storeStrong((id *)&self->_idlePowerDownSource, 0);
  objc_storeStrong((id *)&self->_atr, 0);
}

- (void)setupWithName:delegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "setupWithName:'%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16_0();
  _os_log_error_impl(&dword_1B9768000, v0, OS_LOG_TYPE_ERROR, "%{public}@: failed to register, error:%{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "initWithName:'%{public}@' successfully registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v3 = a2;
  objc_msgSend(v2, "UTF8String");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, v3, v4, "logging slot %{public}s", v5);

  OUTLINED_FUNCTION_12_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: new client connection established", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: wakeup notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: sleep notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_1B9768000, v0, OS_LOG_TYPE_ERROR, "Mismatch in active state notifications count", v1, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)changeStateTo:(NSObject *)a3 powerState:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 168);
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E708AD68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, a3, v7, "%{public}@: broadcasting state change %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: card reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "ATR:%{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_179_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Reset FAILED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)setProtocol:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(&dword_1B9768000, v0, OS_LOG_TYPE_ERROR, "%{public}@: failed to set protocol for the card", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)setProtocol:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_1(&dword_1B9768000, v0, v1, "%{public}@: used protocol %04x");
  OUTLINED_FUNCTION_4();
}

- (void)setProtocol:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_1(&dword_1B9768000, v0, v1, "%{public}@: set protocol %04x");
  OUTLINED_FUNCTION_4();
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 32) - 1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1B9768000, a2, OS_LOG_TYPE_DEBUG, "T=%d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_8();
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_182_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "PPS FAILED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)powerDownWithEject:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_5_1(&dword_1B9768000, v0, v1, "%{public}@: unpower done (%d)");
  OUTLINED_FUNCTION_4();
}

- (void)powerDownWithEject:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_5_1(&dword_1B9768000, v0, v1, "%{public}@: unpowerCard(eject=%d)");
  OUTLINED_FUNCTION_4();
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "unpower FAILED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "unpower", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: going to idle-unpower card", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_186_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "card in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_189_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "card out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)setupSlotWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: slot was set up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)connectCardSessionWithParameters:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_1B9768000, a3, (uint64_t)a3, "%{public}@: connectCardSession already in nego state", (uint8_t *)a2);

}

- (void)connectCardSessionWithParameters:.cold.2()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[6];
  v6 = 138544130;
  v7 = v4;
  v8 = 1024;
  v9 = v1;
  v10 = 1024;
  v11 = v2;
  v12 = 1024;
  v13 = v3;
  _os_log_debug_impl(&dword_1B9768000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: connect:_state=%d,_power=%d,_proto=%d", (uint8_t *)&v6, 0x1Eu);
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_13_0(a1);
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, a2, v5, "%{public}@: connectCardSession did RESET & PPS", v6);

  OUTLINED_FUNCTION_2();
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_2(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_13_0(a1);
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, a2, v5, "%{public}@: connectCardSession RESET failed", v6);

  OUTLINED_FUNCTION_2();
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_13_0(a1);
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, a2, v5, "%{public}@: connectCardSession did only PPS", v6);

  OUTLINED_FUNCTION_2();
}

- (void)leaveSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: leaving session, policyLeave", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)leaveSession:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: leaving session, policyReset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)leaveSession:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: leaving session, policyPowerDown/Eject", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: terminate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_206_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "slot gone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
