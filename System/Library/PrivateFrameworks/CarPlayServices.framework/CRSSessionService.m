@implementation CRSSessionService

- (CRSSessionService)initWithDelegate:(id)a3
{
  id v4;
  CRSSessionService *v5;
  CRSSessionService *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *connectionQueue;
  uint64_t v10;
  NSHashTable *lock_connections;
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
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRSSessionService;
  v5 = -[CRSSessionService init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSDispatchQueueCreate();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v10 = objc_claimAutoreleasedReturnValue();
    lock_connections = v6->_lock_connections;
    v6->_lock_connections = (NSHashTable *)v10;

    v12 = (void *)MEMORY[0x24BE0FA28];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __38__CRSSessionService_initWithDelegate___block_invoke;
    v19[3] = &unk_24CD388E8;
    v13 = v6;
    v20 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[3];
    v13[3] = (id)v14;

    CRSLogForCategory(3uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v13[3];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_212138000, v16, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v13[3], "activate");
  }

  return v6;
}

void __38__CRSSessionService_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay"));
  +[CRSSessionSpecification identifier](CRSSessionSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isActive
{
  CRSSessionService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSHashTable count](v2->_lock_connections, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CRSLogForCategory(3uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_212138000, v7, OS_LOG_TYPE_DEFAULT, "Received connection! %@", buf, 0xCu);
  }

  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke;
  v14[3] = &unk_24CD38938;
  v14[4] = self;
  objc_msgSend(v6, "configureConnection:", v14);
  CRSLogForCategory(3uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_212138000, v9, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
  }

  -[CRSSessionService connectionQueue](self, "connectionQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_9;
  block[3] = &unk_24CD38960;
  block[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(v10, block);

  objc_msgSend(v11, "activate");
}

void __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  +[CRSSessionSpecification serviceQuality](CRSSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSSessionSpecification interface](CRSSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_24CD38910;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

}

void __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSLogForCategory(3uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_212138000, v4, OS_LOG_TYPE_DEFAULT, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_connectionQueue_addConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSObject *v6;
  NSUInteger v7;
  _QWORD block[5];
  uint8_t buf[4];
  NSUInteger v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_connections, "addObject:", v5);

  CRSLogForCategory(3uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSHashTable count](self->_lock_connections, "count");
    *(_DWORD *)buf = 134217984;
    v10 = v7;
    _os_log_impl(&dword_212138000, v6, OS_LOG_TYPE_DEFAULT, "Connection count: %ld", buf, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CRSSessionService__connectionQueue_addConnection___block_invoke;
  block[3] = &unk_24CD38C98;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __52__CRSSessionService__connectionQueue_addConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionServiceBecameActive:", *(_QWORD *)(a1 + 32));

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSObject *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  NSUInteger v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_connections, "removeObject:", v5);

  CRSLogForCategory(3uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSHashTable count](self->_lock_connections, "count");
    *(_DWORD *)buf = 134217984;
    v12 = v7;
    _os_log_impl(&dword_212138000, v6, OS_LOG_TYPE_DEFAULT, "Connection count: %ld", buf, 0xCu);
  }

  v8 = -[NSHashTable count](self->_lock_connections, "count");
  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    CRSLogForCategory(3uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212138000, v9, OS_LOG_TYPE_DEFAULT, "No more connections!", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__CRSSessionService__connectionQueue_removeConnection___block_invoke;
    block[3] = &unk_24CD38C98;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __55__CRSSessionService__connectionQueue_removeConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionServiceBecameInactive:", *(_QWORD *)(a1 + 32));

}

- (CRSSessionServiceDelegate)delegate
{
  return (CRSSessionServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (NSHashTable)lock_connections
{
  return self->_lock_connections;
}

- (void)setLock_connections:(id)a3
{
  objc_storeStrong((id *)&self->_lock_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
