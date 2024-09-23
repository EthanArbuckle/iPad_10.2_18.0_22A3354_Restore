@implementation CRSInCallAssertionService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance___sharedInstance;
}

void __43__CRSInCallAssertionService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CRSInCallAssertionService _init]([CRSInCallAssertionService alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  CRSInCallAssertionService *v2;
  void *v3;
  uint64_t v4;
  OS_dispatch_queue *connectionQueue;
  uint64_t v6;
  NSMutableDictionary *connections;
  uint64_t v8;
  NSHashTable *activatedConnections;
  uint64_t v10;
  NSHashTable *bannersAllowedConnections;
  void *v12;
  id *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)CRSInCallAssertionService;
  v2 = -[CRSInCallAssertionService init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v8 = objc_claimAutoreleasedReturnValue();
    activatedConnections = v2->_activatedConnections;
    v2->_activatedConnections = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v10 = objc_claimAutoreleasedReturnValue();
    bannersAllowedConnections = v2->_bannersAllowedConnections;
    v2->_bannersAllowedConnections = (NSHashTable *)v10;

    v12 = (void *)MEMORY[0x24BE0FA28];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __34__CRSInCallAssertionService__init__block_invoke;
    v19[3] = &unk_24CD388E8;
    v13 = v2;
    v20 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[2];
    v13[2] = (id)v14;

    CRSLogForCategory(2uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = v13[2];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_212138000, v16, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v13[2], "activate");
  }
  return v2;
}

void __34__CRSInCallAssertionService__init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay.non-launching"));
  +[CRSInCallAssertionSpecification identifier](CRSInCallAssertionSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  -[CRSInCallAssertionService addObserver:notifyIfNeeded:](self, "addObserver:notifyIfNeeded:", a3, 0);
}

- (void)addObserver:(id)a3 notifyIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CARObserverHashTable *observers;
  CARObserverHashTable *v8;
  CARObserverHashTable *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    observers = self->_observers;
    if (!observers)
    {
      v8 = (CARObserverHashTable *)objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_254B4BA30);
      v9 = self->_observers;
      self->_observers = v8;

      observers = self->_observers;
    }
    -[CARObserverHashTable addObserver:](observers, "addObserver:", v6);
  }
  if (v4)
  {
    -[CRSInCallAssertionService activatedConnections](self, "activatedConnections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      CRSLogForCategory(2uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_212138000, v12, OS_LOG_TYPE_INFO, "Notifying new observer of activation request!", v13, 2u);
      }

      objc_msgSend(v6, "inCallAssertionServiceDidPresent:", self);
    }
  }

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[CARObserverHashTable removeObserver:](self->_observers, "removeObserver:");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CRSLogForCategory(2uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "instance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_212138000, v7, OS_LOG_TYPE_INFO, "Received connection! %@, reason: %@", buf, 0x16u);

  }
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke;
  v15[3] = &unk_24CD38938;
  v15[4] = self;
  objc_msgSend(v6, "configureConnection:", v15);
  CRSLogForCategory(2uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_212138000, v10, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
  }

  -[CRSInCallAssertionService connectionQueue](self, "connectionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_75;
  block[3] = &unk_24CD38960;
  block[4] = self;
  v14 = v6;
  v12 = v6;
  dispatch_async(v11, block);

  objc_msgSend(v12, "activate");
}

void __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  +[CRSInCallAssertionSpecification serviceQuality](CRSInCallAssertionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSInCallAssertionSpecification interface](CRSInCallAssertionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_24CD38910;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

}

void __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_212138000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_75(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)presentInCallService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  BOOL v15;
  uint8_t buf[16];

  -[CRSInCallAssertionService connectionQueue](self, "connectionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[CRSInCallAssertionService connections](self, "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRSInCallAssertionService activatedConnections](self, "activatedConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

  -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[CRSInCallAssertionService connections](self, "connections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  CRSLogForCategory(2uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212138000, v13, OS_LOG_TYPE_DEFAULT, "Received presentation request!", buf, 2u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__CRSInCallAssertionService_presentInCallService__block_invoke;
  v14[3] = &unk_24CD38898;
  v14[4] = self;
  v15 = v10 == v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __49__CRSInCallAssertionService_presentInCallService__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inCallAssertionServiceDidPresent:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inCallAssertionService:didSetBannersEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)setAllowsBanners:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  BOOL v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRSInCallAssertionService connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[CRSInCallAssertionService connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[CRSInCallAssertionService connections](self, "connections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "instance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend(v4, "BOOLValue");
  -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v10)
    objc_msgSend(v14, "addObject:", v13);
  else
    objc_msgSend(v14, "removeObject:", v13);

  CRSLogForCategory(2uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[CRSInCallAssertionService connections](self, "connections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v28 = v18 - objc_msgSend(v19, "count");
    _os_log_impl(&dword_212138000, v16, OS_LOG_TYPE_DEFAULT, "Number of assertions preventing banners: %ld", buf, 0xCu);

  }
  v20 = v7 != v9;

  -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  -[CRSInCallAssertionService connections](self, "connections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (((v20 ^ (v22 == v24)) & 1) == 0)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __46__CRSInCallAssertionService_setAllowsBanners___block_invoke;
    v25[3] = &unk_24CD38898;
    v25[4] = self;
    v26 = v22 == v24;
    dispatch_async(MEMORY[0x24BDAC9B8], v25);
  }

}

void __46__CRSInCallAssertionService_setAllowsBanners___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inCallAssertionService:didSetBannersEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRSInCallAssertionService connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[CRSInCallAssertionService connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v7);

  CRSLogForCategory(2uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[CRSInCallAssertionService connections](self, "connections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134217984;
    v11 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_212138000, v8, OS_LOG_TYPE_INFO, "Connection count: %ld", (uint8_t *)&v10, 0xCu);

  }
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRSInCallAssertionService connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[CRSInCallAssertionService activatedConnections](self, "activatedConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    -[CRSInCallAssertionService activatedConnections](self, "activatedConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v4);

  }
  -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if (v10)
  {
    -[CRSInCallAssertionService bannersAllowedConnections](self, "bannersAllowedConnections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v4);

  }
  -[CRSInCallAssertionService connections](self, "connections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v13);

  CRSLogForCategory(2uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    -[CRSInCallAssertionService connections](self, "connections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_212138000, v14, OS_LOG_TYPE_INFO, "Connection count: %ld", buf, 0xCu);

  }
  -[CRSInCallAssertionService connections](self, "connections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17)
  {
    CRSLogForCategory(2uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212138000, v18, OS_LOG_TYPE_DEFAULT, "No more connections, requesting dismissal", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__CRSInCallAssertionService__connectionQueue_removeConnection___block_invoke;
    block[3] = &unk_24CD38C98;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __63__CRSInCallAssertionService__connectionQueue_removeConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inCallAssertionServiceDidDismiss:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inCallAssertionService:didSetBannersEnabled:", *(_QWORD *)(a1 + 32), 1);

}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (NSHashTable)activatedConnections
{
  return self->_activatedConnections;
}

- (void)setActivatedConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConnections, a3);
}

- (NSHashTable)bannersAllowedConnections
{
  return self->_bannersAllowedConnections;
}

- (void)setBannersAllowedConnections:(id)a3
{
  objc_storeStrong((id *)&self->_bannersAllowedConnections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannersAllowedConnections, 0);
  objc_storeStrong((id *)&self->_activatedConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
