@implementation CXNetworkExtensionMessageControllerHost

- (CXNetworkExtensionMessageControllerHost)init
{
  CXNetworkExtensionMessageControllerHost *v2;
  CXNetworkExtensionMessageControllerHost *v3;
  NSMutableSet *v4;
  NSMutableSet *connections;
  uint64_t v6;
  NSMapTable *delegateToQueue;
  uint64_t v8;
  NSXPCListener *xpcListener;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CXNetworkExtensionMessageControllerHost;
  v2 = -[CXNetworkExtensionMessageControllerHost init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v3->_connections;
    v3->_connections = v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.callkit.networkextension.messagecontrollerhost"));
    xpcListener = v3->_xpcListener;
    v3->_xpcListener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v3->_xpcListener, "setDelegate:", v3);
    -[NSXPCListener resume](v3->_xpcListener, "resume");
  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  os_unfair_lock_s *p_accessorLock;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  p_accessorLock = &self->_accessorLock;
  v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXNetworkExtensionMessageControllerHost delegateToQueue](self, "delegateToQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v9 = v10;
  else
    v9 = (id)MEMORY[0x1E0C80D38];
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  void *v6;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  -[CXNetworkExtensionMessageControllerHost delegateToQueue](self, "delegateToQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)networkExtensionMessageControllerHostConnectionInvalidated:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  void *v6;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  -[CXNetworkExtensionMessageControllerHost connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)networkExtensionMessageControllerHostConnection:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_unfair_lock_t lock;
  id obj;
  _QWORD block[6];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  lock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CXNetworkExtensionMessageControllerHost delegateToQueue](self, "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        -[CXNetworkExtensionMessageControllerHost delegateToQueue](self, "delegateToQueue", lock);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __137__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingMessage_forBundleIdentifier___block_invoke;
        block[3] = &unk_1E4B88DF0;
        block[4] = v13;
        block[5] = self;
        v19 = v7;
        v20 = v8;
        dispatch_async(v15, block);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(lock);
}

uint64_t __137__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingMessage_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkExtensionMessageControllerHost:didReceiveIncomingMessage:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)networkExtensionMessageControllerHostConnection:(id)a3 didReceiveIncomingPushToTalkMessage:(id)a4 forBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_unfair_lock_t lock;
  id obj;
  _QWORD block[6];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  lock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CXNetworkExtensionMessageControllerHost delegateToQueue](self, "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        -[CXNetworkExtensionMessageControllerHost delegateToQueue](self, "delegateToQueue", lock);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __147__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingPushToTalkMessage_forBundleIdentifier___block_invoke;
        block[3] = &unk_1E4B88DF0;
        block[4] = v13;
        block[5] = self;
        v19 = v7;
        v20 = v8;
        dispatch_async(v15, block);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(lock);
}

uint64_t __147__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingPushToTalkMessage_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkExtensionMessageControllerHost:didReceiveIncomingPushToTalkMessage:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  CXNetworkExtensionMessageControllerHostConnection *v7;
  os_unfair_lock_s *p_accessorLock;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = -[CXNetworkExtensionMessageControllerHostConnection initWithConnection:]([CXNetworkExtensionMessageControllerHostConnection alloc], "initWithConnection:", v5);
  -[CXNetworkExtensionMessageControllerHostConnection setDelegate:](v7, "setDelegate:", self);
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXNetworkExtensionMessageControllerHost connections](self, "connections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);

  os_unfair_lock_unlock(p_accessorLock);
  return 1;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
