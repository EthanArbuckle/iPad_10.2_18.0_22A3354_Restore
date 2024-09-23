@implementation CRSUIPunchThroughService

- (CRSUIPunchThroughService)initWithDelegate:(id)a3
{
  id v4;
  CRSUIPunchThroughService *v5;
  CRSUIPunchThroughService *v6;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  uint64_t v9;
  NSHashTable *connections;
  uint64_t v11;
  NSMapTable *connectionToPunchThroughIdentifierMap;
  void *v13;
  id *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v20[4];
  id *v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRSUIPunchThroughService;
  v5 = -[CRSUIPunchThroughService init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)Serial;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v9 = objc_claimAutoreleasedReturnValue();
    connections = v6->_connections;
    v6->_connections = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    connectionToPunchThroughIdentifierMap = v6->_connectionToPunchThroughIdentifierMap;
    v6->_connectionToPunchThroughIdentifierMap = (NSMapTable *)v11;

    v13 = (void *)MEMORY[0x24BE383C8];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __45__CRSUIPunchThroughService_initWithDelegate___block_invoke;
    v20[3] = &unk_24C7697F8;
    v14 = v6;
    v21 = v14;
    objc_msgSend(v13, "listenerWithConfigurator:", v20);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v14[3];
    v14[3] = (id)v15;

    CRSUILogForCategory(5uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v14[3];
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_20D6CC000, v17, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v14[3], "activate");
  }

  return v6;
}

void __45__CRSUIPunchThroughService_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay.PunchThrough"));
  +[CRSUIPunchThroughSpecification identifier](CRSUIPunchThroughSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)punchThroughIdentifierDidDismiss:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_connectionToPunchThroughIdentifierMap;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_connectionToPunchThroughIdentifierMap, "objectForKey:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v4))
        {
          v13 = v11;

          goto LABEL_11;
        }

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  if (v13)
  {
    CRSUILogForCategory(5uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v4;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_20D6CC000, v14, OS_LOG_TYPE_DEFAULT, "Punch through %{public}@ dismissed by server, informing client %{public}@", buf, 0x16u);
    }

    objc_msgSend(v13, "remoteTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverDismissedPunchThroughIdentifier:", v4);

  }
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  CRSUILogForCategory(5uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D6CC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating service", v5, 2u);
  }

  -[CRSUIPunchThroughService listener](self, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  CRSUIPunchThroughService *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CRSUILogForCategory(5uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_20D6CC000, v11, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  objc_msgSend(v9, "remoteProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.private.CarPlayUIServices.punch-through"));

  if ((v13 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke;
    v25[3] = &unk_24C7699D0;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v9, "configureConnection:", v25);
    CRSUILogForCategory(5uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_20D6CC000, v15, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    -[CRSUIPunchThroughService connectionQueue](self, "connectionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v19 = v14;
    v20 = 3221225472;
    v21 = __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_11;
    v22 = &unk_24C7699F8;
    v23 = self;
    v17 = v9;
    v24 = v17;
    dispatch_async(v16, &v19);

    objc_msgSend(v17, "activate", v19, v20, v21, v22, v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    CRSUILogForCategory(5uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CRSUIPunchThroughService listener:didReceiveConnection:withContext:].cold.1(v9, v18);

    objc_msgSend(v9, "invalidate");
  }

}

void __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  +[CRSUIPunchThroughSpecification serviceQuality](CRSUIPunchThroughSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIPunchThroughSpecification interface](CRSUIPunchThroughSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", WeakRetained);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_24C769820;
  objc_copyWeak(&v11, v6);
  objc_msgSend(v3, "setInvalidationHandler:", v10);
  v8 = objc_loadWeakRetained(v6);
  objc_msgSend(v8, "connectionQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v9);

  objc_destroyWeak(&v11);
}

void __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;

  v3 = a2;
  CRSUILogForCategory(5uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionQueue_removeConnection:", v3);

}

uint64_t __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)clientRequestPresentationForPunchThroughIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[CRSUIPunchThroughService connectionQueue](self, "connectionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIPunchThroughService connectionToPunchThroughIdentifierMap](self, "connectionToPunchThroughIdentifierMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v6, v9);

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__CRSUIPunchThroughService_clientRequestPresentationForPunchThroughIdentifier_completion___block_invoke;
  v12[3] = &unk_24C7699F8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);
  v7[2](v7, 0);

}

void __90__CRSUIPunchThroughService_clientRequestPresentationForPunchThroughIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchThroughService:presentPunchThroughWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)clientRequestDismissalForPunchThroughIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[CRSUIPunchThroughService connectionQueue](self, "connectionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIPunchThroughService connectionToPunchThroughIdentifierMap](self, "connectionToPunchThroughIdentifierMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__CRSUIPunchThroughService_clientRequestDismissalForPunchThroughIdentifier_completion___block_invoke;
  v12[3] = &unk_24C7699F8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);
  v7[2](v7, 0);

}

void __87__CRSUIPunchThroughService_clientRequestDismissalForPunchThroughIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchThroughService:dismissPunchThroughWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIPunchThroughService connections](self, "connections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CRSUIPunchThroughService connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIPunchThroughService connectionToPunchThroughIdentifierMap](self, "connectionToPunchThroughIdentifierMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62__CRSUIPunchThroughService__connectionQueue_removeConnection___block_invoke;
    v9[3] = &unk_24C7699F8;
    v9[4] = self;
    v10 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
  os_unfair_lock_unlock(&self->_lock);

}

void __62__CRSUIPunchThroughService__connectionQueue_removeConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchThroughService:dismissPunchThroughWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (CRSUIPunchThroughServiceDelegate)delegate
{
  return (CRSUIPunchThroughServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (NSMapTable)connectionToPunchThroughIdentifierMap
{
  return self->_connectionToPunchThroughIdentifierMap;
}

- (void)setConnectionToPunchThroughIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToPunchThroughIdentifierMap, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionToPunchThroughIdentifierMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_20D6CC000, a2, v4, "Process does not have the required entitlement: %@", (uint8_t *)&v5);

}

@end
