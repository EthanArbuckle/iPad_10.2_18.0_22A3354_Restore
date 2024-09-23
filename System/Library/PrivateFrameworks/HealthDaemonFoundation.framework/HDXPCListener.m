@implementation HDXPCListener

- (void)setQueue:(id)a3
{
  -[NSXPCListener _setQueue:](self->_underlyingListener, "_setQueue:", a3);
}

- (void)resume
{
  -[NSXPCListener resume](self->_underlyingListener, "resume");
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_underlyingListener, "endpoint");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void)setClientProvider:(id)a3
{
  objc_storeWeak((id *)&self->_clientProvider, a3);
}

uint64_t __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInvalidationWithClient:exportedObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  block[0] = MEMORY[0x24BDAC760];
  block[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_3;
  block[3] = &unk_24CB184E8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v3 = listener_shouldAcceptNewConnection__sharedQueue;
  block[1] = 3221225472;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_clientProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exportedObjectsByClient, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_underlyingListener, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSMapTable *exportedObjectsByClient;
  NSMapTable *v30;
  NSMapTable *v31;
  void *v32;
  NSObject *v33;
  NSString *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSString *label;
  id v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD block[5];
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  NSString *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "processIdentifier");
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD2FE8];
  v8 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEBUG))
    -[HDXPCListener listener:shouldAcceptNewConnection:].cold.2((uint64_t)self, v6, v8);
  -[HDXPCListener delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HDXPCListener clientProvider](self, "clientProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v51 = 0;
      v12 = (id *)&v51;
      objc_msgSend(v10, "clientForListener:connection:error:", self, v5, &v51);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
      v12 = (id *)&v50;
      +[HDXPCClient clientWithConnection:error:](HDXPCClient, "clientWithConnection:error:", v5, &v50);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v13;
    v17 = *v12;
    if (v16)
    {
      v41 = v11;
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v16, "process");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ (%d)"), v20, v6);
      v40 = objc_claimAutoreleasedReturnValue();

      v49 = v17;
      objc_msgSend(v9, "exportObjectForListener:client:error:", self, v16, &v49);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v49;

      v15 = v21 != 0;
      if (v21)
      {
        if (self->_connectionQueue)
          objc_msgSend(v5, "_setQueue:");
        objc_msgSend(v21, "remoteInterface");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setRemoteObjectInterface:", v22);

        objc_msgSend(v21, "exportedInterface");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setExportedInterface:", v23);

        objc_msgSend(v5, "setExportedObject:", v21);
        v24 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke;
        block[3] = &unk_24CB18348;
        block[4] = self;
        if (listener_shouldAcceptNewConnection__onceToken != -1)
          dispatch_once(&listener_shouldAcceptNewConnection__onceToken, block);
        v45[0] = v24;
        v45[1] = 3221225472;
        v45[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_2;
        v45[3] = &unk_24CB184E8;
        v45[4] = self;
        v25 = v16;
        v46 = v25;
        v26 = v21;
        v47 = v26;
        objc_msgSend(v5, "setInvalidationHandler:", v45);
        v42[0] = v24;
        v42[1] = 3221225472;
        v42[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_4;
        v42[3] = &unk_24CB184E8;
        v42[4] = self;
        v27 = v25;
        v43 = v27;
        v28 = v26;
        v44 = v28;
        objc_msgSend(v5, "setInterruptionHandler:", v42);
        os_unfair_lock_lock(&self->_lock);
        exportedObjectsByClient = self->_exportedObjectsByClient;
        if (!exportedObjectsByClient)
        {
          objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
          v30 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          v31 = self->_exportedObjectsByClient;
          self->_exportedObjectsByClient = v30;

          exportedObjectsByClient = self->_exportedObjectsByClient;
        }
        -[NSMapTable setObject:forKey:](exportedObjectsByClient, "setObject:forKey:", v28, v27);
        os_unfair_lock_unlock(&self->_lock);
        v32 = (void *)v40;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v28, "connectionConfigured");
        v11 = v41;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "connectionConfiguredForListener:client:exportedObject:", self, v27, v28);
        objc_msgSend(v5, "resume");

        v17 = v39;
      }
      else
      {
        _HKInitializeLogging();
        v35 = *v7;
        v36 = os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR);
        v32 = (void *)v40;
        v11 = v41;
        v17 = v39;
        if (v36)
        {
          label = self->_label;
          *(_DWORD *)buf = 138543874;
          v53 = label;
          v54 = 2114;
          v55 = v40;
          v56 = 2114;
          v57 = v39;
          _os_log_error_impl(&dword_210F9A000, v35, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting connection from %{public}@: %{public}@", buf, 0x20u);
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v33 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v34 = self->_label;
        *(_DWORD *)buf = 138543874;
        v53 = v34;
        v54 = 2114;
        v55 = (uint64_t)v5;
        v56 = 2114;
        v57 = v17;
        _os_log_impl(&dword_210F9A000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to create client for connection %{public}@: %{public}@", buf, 0x20u);
      }
      v15 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v14 = *v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HDXPCListener listener:shouldAcceptNewConnection:].cold.1((uint64_t)self, (uint64_t)v5, v14);
    v15 = 0;
  }

  return v15;
}

- (HDXPCListenerDelegate)delegate
{
  return (HDXPCListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HDXPCListenerClientProvider)clientProvider
{
  return (HDXPCListenerClientProvider *)objc_loadWeakRetained((id *)&self->_clientProvider);
}

- (void)_handleInvalidationWithClient:(id)a3 exportedObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *label;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_INFO))
  {
    label = self->_label;
    v10 = v8;
    objc_msgSend(v6, "process");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "process");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = label;
    v16 = 2114;
    v17 = v12;
    v18 = 1024;
    v19 = objc_msgSend(v13, "processIdentifier");
    _os_log_impl(&dword_210F9A000, v10, OS_LOG_TYPE_INFO, "%{public}@: Connection to %{public}@ (%d) invalidated", (uint8_t *)&v14, 0x1Cu);

  }
  objc_msgSend(v7, "connectionInvalidated");
  -[HDXPCListener _handleConnectionInvalidationForClient:exportedObject:](self, "_handleConnectionInvalidationForClient:exportedObject:", v6, v7);

  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable removeObjectForKey:](self->_exportedObjectsByClient, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_handleConnectionInvalidationForClient:(id)a3 exportedObject:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[HDXPCListener delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "connectionInvalidatedForListener:client:exportedObject:", self, v8, v6);

}

- (void)dealloc
{
  objc_super v3;

  -[HDXPCListener invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDXPCListener;
  -[HDXPCListener dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[NSXPCListener invalidate](self->_underlyingListener, "invalidate");
  -[NSXPCListener setDelegate:](self->_underlyingListener, "setDelegate:", 0);
}

- (HDXPCListener)initWithLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HDXPCListener *v7;

  v4 = (void *)MEMORY[0x24BDD1998];
  v5 = a3;
  objc_msgSend(v4, "anonymousListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDXPCListener initWithUnderlyingListener:label:](self, "initWithUnderlyingListener:label:", v6, v5);

  return v7;
}

- (HDXPCListener)initWithUnderlyingListener:(id)a3 label:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HDXPCListener *v11;
  HDXPCListener *v12;
  uint64_t v13;
  NSString *label;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCListener.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("listener != nil"));

  }
  objc_msgSend(v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCListener.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[listener delegate] == nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HDXPCListener;
  v11 = -[HDXPCListener init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_underlyingListener, a3);
    -[NSXPCListener setDelegate:](v12->_underlyingListener, "setDelegate:", v12);
    v13 = objc_msgSend(v9, "copy");
    label = v12->_label;
    v12->_label = (NSString *)v13;

    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (HDXPCListener)init
{
  void *v3;
  objc_class *v4;
  void *v5;
  HDXPCListener *v6;

  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDXPCListener initWithUnderlyingListener:label:](self, "initWithUnderlyingListener:label:", v3, v5);

  return v6;
}

- (HDXPCListener)initWithMachServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  HDXPCListener *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:", v5);
  v7 = -[HDXPCListener initWithUnderlyingListener:label:](self, "initWithUnderlyingListener:label:", v6, v5);

  return v7;
}

+ (id)serviceListener
{
  if (serviceListener_onceToken != -1)
    dispatch_once(&serviceListener_onceToken, &__block_literal_global_0);
  return (id)serviceListener_serviceListener;
}

void __32__HDXPCListener_serviceListener__block_invoke()
{
  HDXPCListener *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1998], "serviceListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[HDXPCListener initWithUnderlyingListener:label:]([HDXPCListener alloc], "initWithUnderlyingListener:label:", v2, CFSTR("ServiceListener"));
  v1 = (void *)serviceListener_serviceListener;
  serviceListener_serviceListener = (uint64_t)v0;

}

- (NSArray)allClients
{
  id v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable keyEnumerator](self->_exportedObjectsByClient, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

void __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  HKCreateSerialDispatchQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)listener_shouldAcceptNewConnection__sharedQueue;
  listener_shouldAcceptNewConnection__sharedQueue = v0;

}

void __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  block[0] = MEMORY[0x24BDAC760];
  block[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_5;
  block[3] = &unk_24CB184E8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v3 = listener_shouldAcceptNewConnection__sharedQueue;
  block[1] = 3221225472;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

}

uint64_t __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInterruptionWithClient:exportedObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleInterruptionWithClient:(id)a3 exportedObject:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
    -[HDXPCListener _handleInterruptionWithClient:exportedObject:].cold.1((uint64_t)self, v8, v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "connectionInterrupted");
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable removeObjectForKey:](self->_exportedObjectsByClient, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_210F9A000, log, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting connection %{public}@: delegate is nil", (uint8_t *)&v4, 0x16u);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543618;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_debug_impl(&dword_210F9A000, log, OS_LOG_TYPE_DEBUG, "%{public}@: New connection from pid %d", (uint8_t *)&v4, 0x12u);
}

- (void)_handleInterruptionWithClient:(void *)a3 exportedObject:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = a2;
  objc_msgSend(a3, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v4;
  v11 = 2114;
  v12 = v7;
  v13 = 1024;
  v14 = objc_msgSend(v8, "processIdentifier");
  _os_log_error_impl(&dword_210F9A000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected interruption on connection to %{public}@ (%d)", (uint8_t *)&v9, 0x1Cu);

}

@end
