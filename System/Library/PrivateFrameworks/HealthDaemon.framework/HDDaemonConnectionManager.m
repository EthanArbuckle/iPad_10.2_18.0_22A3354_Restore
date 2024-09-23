@implementation HDDaemonConnectionManager

- (HDDaemonConnectionManager)initWithMachServiceName:(id)a3 daemon:(id)a4
{
  id v6;
  id v7;
  HDDaemonConnectionManager *v8;
  HDDaemonConnectionManager *v9;
  uint64_t v10;
  OS_dispatch_queue *listenerQueue;
  NSMutableSet *v12;
  NSMutableSet *endpoints;
  uint64_t v14;
  void *serviceListener;
  objc_class *v16;
  uint64_t v17;
  HDXPCListener *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDDaemonConnectionManager;
  v8 = -[HDDaemonConnectionManager init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_daemon, v7);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    listenerQueue = v9->_listenerQueue;
    v9->_listenerQueue = (OS_dispatch_queue *)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    endpoints = v9->_endpoints;
    v9->_endpoints = v12;

    if (v6)
    {
      -[HDDaemonConnectionManager createListenerWithMachServiceName:](v9, "createListenerWithMachServiceName:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      serviceListener = v9->_serviceListener;
      v9->_serviceListener = (HDXPCListener *)v14;
    }
    else
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      serviceListener = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDaemonConnectionManager createAnonymousListenerWithLabel:](v9, "createAnonymousListenerWithLabel:", serviceListener);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v9->_serviceListener;
      v9->_serviceListener = (HDXPCListener *)v17;

    }
    -[HDXPCListener setDelegate:](v9->_serviceListener, "setDelegate:", v9);
  }

  return v9;
}

- (NSArray)clientProcesses
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_endpoints, "count"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_endpoints;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "client", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "process");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v12;
}

- (void)resume
{
  -[HDXPCListener resume](self->_serviceListener, "resume");
}

- (void)invalidate
{
  NSMutableSet *v3;
  NSMutableSet *endpoints;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HDXPCListener invalidate](self->_serviceListener, "invalidate");
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_endpoints;
  endpoints = self->_endpoints;
  self->_endpoints = 0;

  os_unfair_lock_unlock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "invalidate", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)createListenerWithMachServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0D29900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:", v5);

  -[HDDaemonConnectionManager _configureListener:]((uint64_t)self, v6);
  return v6;
}

- (void)_configureListener:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "setClientProvider:", a1);
    objc_msgSend(v3, "setQueue:", *(_QWORD *)(a1 + 16));

  }
}

- (id)createAnonymousListenerWithLabel:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0D29900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithLabel:", v5);

  -[HDDaemonConnectionManager _configureListener:]((uint64_t)self, v6);
  return v6;
}

- (void)invalidateAllServersForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableSet copy](self->_endpoints, "copy");
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v4, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "profileIdentifier", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v6);

        if (v14)
          objc_msgSend(v12, "invalidate");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)endpointInvalidated:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_endpoints, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)clientForListener:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSMapTable *processesByAuditToken;
  NSMapTable *v12;
  NSMapTable *v13;
  void *v14;
  void (**processCreationHandler)(id, void *, id *);
  __int128 v17;
  __int128 v18;

  v7 = a4;
  v8 = v7;
  if (self)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB7078]);
    if (v8)
    {
      objc_msgSend(v8, "auditToken");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    v10 = (void *)objc_msgSend(v9, "initWithAuditToken:", &v17);
    os_unfair_lock_lock(&self->_lock);
    processesByAuditToken = self->_processesByAuditToken;
    if (!processesByAuditToken)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_processesByAuditToken;
      self->_processesByAuditToken = v12;

      processesByAuditToken = self->_processesByAuditToken;
    }
    -[NSMapTable objectForKey:](processesByAuditToken, "objectForKey:", v10, v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      processCreationHandler = (void (**)(id, void *, id *))self->_processCreationHandler;
      if (processCreationHandler)
        processCreationHandler[2](processCreationHandler, v8, a5);
      else
        objc_msgSend(MEMORY[0x1E0D29910], "processWithConnection:error:", v8, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[NSMapTable setObject:forKey:](self->_processesByAuditToken, "setObject:forKey:", v14, v10);
    }
    os_unfair_lock_unlock(&self->_lock);

    if (v14)
      self = (HDDaemonConnectionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D298E8]), "initWithConnection:process:", v8, v14);
    else
      self = 0;
  }
  else
  {

    v14 = 0;
  }

  return self;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  id WeakRetained;
  id v9;
  void *v10;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_daemon);
    +[HDHealthStoreEndpoint endpointWithClient:healthDaemon:](HDHealthStoreEndpoint, "endpointWithClient:healthDaemon:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableSet addObject:](self->_endpoints, "addObject:", v10);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 100, CFSTR("Daemon became nil"));
    v10 = 0;
  }

  return v10;
}

- (HDXPCListener)serviceListener
{
  return self->_serviceListener;
}

- (id)processCreationHandler
{
  return self->_processCreationHandler;
}

- (void)setProcessCreationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processCreationHandler, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_processesByAuditToken, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
