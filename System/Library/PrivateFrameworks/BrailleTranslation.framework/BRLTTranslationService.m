@implementation BRLTTranslationService

+ (id)serviceForIdentifier:(id)a3 input:(BOOL)a4
{
  return (id)objc_msgSend(a1, "serviceForIdentifier:input:loopback:", a3, a4, 0);
}

+ (id)serviceForIdentifier:(id)a3 input:(BOOL)a4 loopback:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRLTSLoopbackTranslationService *v16;
  uint64_t v17;
  BRLTLoopbackTranslationService *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    v11 = v10;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.input"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "connectionsLock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lock");

    objc_msgSend(a1, "connections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "connectionsLock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlock");

    if (!v14 || objc_msgSend(v14, "isInvalid"))
    {
      if (a5)
      {
        v16 = objc_alloc_init(BRLTSLoopbackTranslationService);
        objc_msgSend(a1, "connectionForLoopbackService:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = -[BRLTLoopbackTranslationService initWithServiceIdentifier:connection:loopbackService:]([BRLTLoopbackTranslationService alloc], "initWithServiceIdentifier:connection:loopbackService:", v10, v17, v16);

        v14 = (void *)v17;
      }
      else
      {
        objc_msgSend(a1, "connectionForServiceIdentifier:", v10);
        v16 = (BRLTSLoopbackTranslationService *)objc_claimAutoreleasedReturnValue();
        v18 = (BRLTLoopbackTranslationService *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceIdentifier:connection:", v10, v16);
      }

      objc_msgSend(a1, "connectionsLock");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lock");

      objc_msgSend(a1, "connections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, v11);

      objc_msgSend(a1, "connectionsLock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "unlock");

      v14 = v18;
    }

  }
  else
  {
    BRLTLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[BRLTTranslationService serviceForIdentifier:input:loopback:].cold.1(v19);

    v14 = 0;
  }

  return v14;
}

+ (id)connectionForServiceIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.accessibility.BrailleTranslation.BrailleTranslationService"));
  BRLTTranslationServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  BRLTTranslationServiceClientInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  objc_msgSend(v4, "setExportedObject:", a1);
  return v4;
}

+ (id)connectionForLoopbackService:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x24BDD1988];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithListenerEndpoint:", v8);

  +[BRLTSTranslationService exportedInterface](BRLTSTranslationService, "exportedInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v10);

  BRLTTranslationServiceClientInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExportedInterface:", v11);

  objc_msgSend(v9, "setExportedObject:", a1);
  return v9;
}

+ (NSMutableDictionary)connections
{
  if (connections_onceToken != -1)
    dispatch_once(&connections_onceToken, &__block_literal_global_0);
  return (NSMutableDictionary *)(id)connections__Connections;
}

void __37__BRLTTranslationService_connections__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)connections__Connections;
  connections__Connections = v0;

}

+ (id)connectionsLock
{
  if (connectionsLock_onceToken != -1)
    dispatch_once(&connectionsLock_onceToken, &__block_literal_global_11);
  return (id)connectionsLock__connectionsLock;
}

void __41__BRLTTranslationService_connectionsLock__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)connectionsLock__connectionsLock;
  connectionsLock__connectionsLock = v0;

}

- (BRLTTranslationService)initWithServiceIdentifier:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  BRLTTranslationService *v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  _QWORD block[4];
  BRLTTranslationService *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BRLTTranslationService;
  v9 = -[BRLTTranslationService init](&v19, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.serviceQueue"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v10);
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v9->_queue_connection, a4);
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    v15 = v9->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__BRLTTranslationService_initWithServiceIdentifier_connection___block_invoke;
    block[3] = &unk_24CBF0F20;
    v18 = v9;
    dispatch_async(v15, block);

  }
  return v9;
}

uint64_t __63__BRLTTranslationService_initWithServiceIdentifier_connection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_resume");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadBundle");
}

- (BOOL)isLoopback
{
  return 0;
}

- (void)_queue_resume
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint8_t buf[4];
  BRLTTranslationService *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[BRLTTranslationService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__BRLTTranslationService__queue_resume__block_invoke;
  v11[3] = &unk_24CBF0F48;
  objc_copyWeak(&v12, &location);
  -[BRLTTranslationService queue_connection](self, "queue_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v11);

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __39__BRLTTranslationService__queue_resume__block_invoke_15;
  v9[3] = &unk_24CBF0F48;
  objc_copyWeak(&v10, &location);
  -[BRLTTranslationService queue_connection](self, "queue_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v9);

  BRLTLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_2114B8000, v7, OS_LOG_TYPE_DEFAULT, "Resuming connection to BrailleTranslationService. service:%@", buf, 0xCu);
  }

  -[BRLTTranslationService queue_connection](self, "queue_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __39__BRLTTranslationService__queue_resume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  BRLTLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_2114B8000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. service:%@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "setInterrupted:", 1);

}

void __39__BRLTTranslationService__queue_resume__block_invoke_15(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id to;

  v1 = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  BRLTLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __39__BRLTTranslationService__queue_resume__block_invoke_15_cold_1(&to, v2);

  v3 = objc_loadWeakRetained(&to);
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__BRLTTranslationService__queue_resume__block_invoke_16;
  v5[3] = &unk_24CBF0F48;
  objc_copyWeak(&v6, v1);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&to);
}

void __39__BRLTTranslationService__queue_resume__block_invoke_16(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidate");

}

- (void)_queue_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  -[BRLTTranslationService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[BRLTTranslationService queue_connection](self, "queue_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[BRLTTranslationService setQueue_connection:](self, "setQueue_connection:", 0);
  -[BRLTTranslationService setInvalid:](self, "setInvalid:", 1);
  -[BRLTTranslationService invalidationHandler](self, "invalidationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BRLTTranslationService invalidationHandler](self, "invalidationHandler");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (id)_queue_serviceProxy
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BRLTTranslationService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[BRLTTranslationService interrupted](self, "interrupted"))
  {
    -[BRLTTranslationService setInterrupted:](self, "setInterrupted:", 0);
    -[BRLTTranslationService _queue_loadBundle](self, "_queue_loadBundle");
  }
  -[BRLTTranslationService queue_connection](self, "queue_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__BRLTTranslationService__queue_serviceProxy__block_invoke;
  v7[3] = &unk_24CBF0F70;
  v7[4] = self;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __45__BRLTTranslationService__queue_serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  BRLTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__BRLTTranslationService__queue_serviceProxy__block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

- (void)_queue_loadBundle
{
  NSObject *v3;
  void *v4;
  id v5;

  -[BRLTTranslationService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[BRLTTranslationService _queue_serviceProxy](self, "_queue_serviceProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BRLTTranslationService serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadBrailleBundleForIdentifier:", v4);

}

- (void)brailleForText:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRLTTranslationService queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke;
  v15[3] = &unk_24CBF0FC0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_queue_serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke_2;
  v5[3] = &unk_24CBF0F98;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "brailleForText:parameters:withReply:", v3, v4, v5);

}

uint64_t __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)textForBraille:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRLTTranslationService queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke;
  v15[3] = &unk_24CBF0FC0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_queue_serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke_2;
  v5[3] = &unk_24CBF0F98;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "textForBraille:parameters:withReply:", v3, v4, v5);

}

uint64_t __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v8.receiver = self;
  v8.super_class = (Class)BRLTTranslationService;
  -[BRLTTranslationService description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTranslationService serviceIdentifier](self, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ service:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BRLTTranslationService isInvalid](self, "isInvalid"))
    objc_msgSend(v6, "appendString:", CFSTR(" INVALID"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSXPCConnection)queue_connection
{
  return self->_queue_connection;
}

- (void)setQueue_connection:(id)a3
{
  objc_storeStrong((id *)&self->_queue_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

+ (void)serviceForIdentifier:(os_log_t)log input:loopback:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2114B8000, log, OS_LOG_TYPE_ERROR, "Attempted to load service with nil identifier.", v1, 2u);
}

void __39__BRLTTranslationService__queue_resume__block_invoke_15_cold_1(id *a1, NSObject *a2)
{
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  v4 = 138412290;
  v5 = WeakRetained;
  _os_log_error_impl(&dword_2114B8000, a2, OS_LOG_TYPE_ERROR, "Connection to service invalidated. service:%@", (uint8_t *)&v4, 0xCu);

}

void __45__BRLTTranslationService__queue_serviceProxy__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2114B8000, log, OS_LOG_TYPE_ERROR, "Couldn't get remote object proxy. service:%@ / %@", (uint8_t *)&v4, 0x16u);
}

@end
