@implementation CRSUIVolumeNotificationService

- (CRSUIVolumeNotificationService)init
{
  CRSUIVolumeNotificationService *v2;
  uint64_t v3;
  CARObserverHashTable *observers;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *connectionQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *connections;
  uint64_t v10;
  NSMutableArray *lock_assertions;
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
  v21.super_class = (Class)CRSUIVolumeNotificationService;
  v2 = -[CRSUIVolumeNotificationService init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_2549E29C8);
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    connections = v2->_connections;
    v2->_connections = v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_opt_new();
    lock_assertions = v2->_lock_assertions;
    v2->_lock_assertions = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x24BE383C8];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __38__CRSUIVolumeNotificationService_init__block_invoke;
    v19[3] = &unk_24C7697F8;
    v13 = v2;
    v20 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[3];
    v13[3] = (id)v14;

    CRSUILogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v13[3];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_20D6CC000, v16, OS_LOG_TYPE_DEFAULT, "Volume notification activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v13[3], "activate");
  }
  return v2;
}

void __38__CRSUIVolumeNotificationService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay.VolumeNotification"));
  +[CRSUIVolumeNotificationSpecification identifier](CRSUIVolumeNotificationSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isNotificationBlockedForBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *lock_assertions;
  uint64_t v11;
  char v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[CRSUIVolumeNotificationService connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "instance");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    lock_assertions = self->_lock_assertions;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__CRSUIVolumeNotificationService_isNotificationBlockedForBundleIdentifier___block_invoke;
    v15[3] = &unk_24C769EC0;
    v16 = v7;
    v11 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](lock_assertions, "indexOfObjectWithOptions:passingTest:", 2, v15);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      os_unfair_lock_unlock(p_lock);
      v12 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_lock_assertions, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "blockNotification");
      os_unfair_lock_unlock(p_lock);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v12 = 0;
  }

  return v12;
}

uint64_t __75__CRSUIVolumeNotificationService_isNotificationBlockedForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIVolumeNotificationService observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIVolumeNotificationService observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)invalidate
{
  void *v3;
  id v4;

  -[CRSUIVolumeNotificationService connections](self, "connections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CRSUIVolumeNotificationService listener](self, "listener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CRSUILogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_20D6CC000, v7, OS_LOG_TYPE_INFO, "Volume notification received connection! %@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.CarPlayUIServices.volume-notification"));

  if ((v9 & 1) != 0)
  {
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke;
    v17[3] = &unk_24C769E48;
    v17[4] = self;
    objc_msgSend(v6, "configureConnection:", v17);
    CRSUILogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_20D6CC000, v11, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    -[CRSUIVolumeNotificationService connectionQueue](self, "connectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_89;
    block[3] = &unk_24C7699F8;
    block[4] = self;
    v13 = v6;
    v16 = v13;
    dispatch_async(v12, block);

    objc_msgSend(v13, "activate");
  }
  else
  {
    CRSUILogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CRSUIStatusBarStyleService listener:didReceiveConnection:withContext:].cold.1(v6, v14);

    objc_msgSend(v6, "invalidate");
  }

}

void __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  +[CRSUIVolumeNotificationSpecification serviceQuality](CRSUIVolumeNotificationSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIVolumeNotificationSpecification interface](CRSUIVolumeNotificationSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_24C769E20;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

}

void __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CRSUILogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_89(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)clientSuspendNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *lock_assertions;
  id v10;
  uint64_t v11;
  CRSUIVolumeNotificationAssertionData *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  -[CRSUIVolumeNotificationService connectionQueue](self, "connectionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  CRSUILogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Volume notification received override request!", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = MEMORY[0x24BDAC760];
  if (v6)
  {
    lock_assertions = self->_lock_assertions;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke;
    v14[3] = &unk_24C769EC0;
    v10 = v6;
    v15 = v10;
    v11 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v14);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v11);
    v12 = objc_alloc_init(CRSUIVolumeNotificationAssertionData);
    -[CRSUIVolumeNotificationAssertionData setIdentifier:](v12, "setIdentifier:", v10);
    -[CRSUIVolumeNotificationAssertionData setBlockNotification:](v12, "setBlockNotification:", 1);
    -[NSMutableArray addObject:](self->_lock_assertions, "addObject:", v12);

  }
  os_unfair_lock_unlock(&self->_lock);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke_2;
  v13[3] = &unk_24C769C98;
  v13[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeNotificationServiceUpdated:", *(_QWORD *)(a1 + 32));

}

- (BOOL)hasConnectionForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRSUIVolumeNotificationService connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)clientCancelSuspension
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *lock_assertions;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  CRSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6CC000, v3, OS_LOG_TYPE_DEFAULT, "Volume notification client relinquish received", buf, 2u);
  }

  -[CRSUIVolumeNotificationService connectionQueue](self, "connectionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = MEMORY[0x24BDAC760];
  if (v6)
  {
    lock_assertions = self->_lock_assertions;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke;
    v12[3] = &unk_24C769EC0;
    v13 = v6;
    v10 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v12);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v10);

  }
  os_unfair_lock_unlock(&self->_lock);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke_2;
  v11[3] = &unk_24C769C98;
  v11[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeNotificationServiceUpdated:", *(_QWORD *)(a1 + 32));

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRSUIVolumeNotificationService connections](self, "connections");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v6);

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *lock_assertions;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[CRSUIVolumeNotificationService connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    lock_assertions = self->_lock_assertions;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke;
    v13[3] = &unk_24C769EC0;
    v14 = v8;
    v11 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v13);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v11);

  }
  os_unfair_lock_unlock(&self->_lock);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke_2;
  v12[3] = &unk_24C769C98;
  v12[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

uint64_t __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeNotificationServiceUpdated:", *(_QWORD *)(a1 + 32));

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

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_lock_assertions, 0);
}

@end
