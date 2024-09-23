@implementation BMComputeSourceServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  BMComputeSourceServerConnection *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BMComputeSourceServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0D01D18], "processWithXPCConnection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "executableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v11;
    v29 = 1024;
    v30 = objc_msgSend(v9, "pid");
    _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_INFO, "BMComputeSourceServer received new connection request from %@(%d)", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0D01CD0], "policyForProcess:connectionFlags:useCase:", v9, 0, *MEMORY[0x1E0D01CA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowsConnectionToComputeSourceService");
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (BMComputeSourceServerConnection *)v14;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BMComputeSourceServer listener:shouldAcceptNewConnection:].cold.1(v9, &v15->super);

    v15 = -[BMComputeSourceServerConnection initWithServer:clientProcess:]([BMComputeSourceServerConnection alloc], "initWithServer:clientProcess:", self, v9);
    -[BMComputeSourceServer connections](self, "connections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v7);
    -[BMComputeSourceServer queue](self, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v17);

    objc_initWeak((id *)buf, v7);
    v18 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke;
    v25[3] = &unk_1E2648630;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", v25);
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke_130;
    v22[3] = &unk_1E2649920;
    objc_copyWeak(&v24, (id *)buf);
    v19 = v16;
    v23 = v19;
    objc_msgSend(v7, "setInvalidationHandler:", v22);
    -[BMComputeSourceServer interface](self, "interface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v20);

    objc_msgSend(v7, "setExportedObject:", v15);
    objc_msgSend(v7, "resume");

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[BMComputeSourceServer listener:shouldAcceptNewConnection:].cold.2(v9, &v15->super);
  }

  return v13;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMComputeSource)source
{
  return (BMComputeSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (NSMapTable)connections
{
  return self->_connections;
}

- (BMComputeSourceServer)initWithQueue:(id)a3 machServiceName:(id)a4 source:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  BMComputeSourceServer *v13;

  v8 = (objc_class *)MEMORY[0x1E0CB3B58];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithMachServiceName:", v10);

  v13 = -[BMComputeSourceServer initWithQueue:source:listener:](self, "initWithQueue:source:listener:", v11, v9, v12);
  return v13;
}

- (BMComputeSourceServer)initWithQueue:(id)a3 source:(id)a4 listener:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  BMComputeSourceServer *v12;
  BMComputeSourceServer *v13;
  uint64_t v14;
  NSMapTable *connections;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  dispatch_assert_queue_V2(v9);
  v17.receiver = self;
  v17.super_class = (Class)BMComputeSourceServer;
  v12 = -[BMComputeSourceServer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeWeak((id *)&v13->_source, v10);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    connections = v13->_connections;
    v13->_connections = (NSMapTable *)v14;

    objc_storeStrong((id *)&v13->_interface, (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0E5DB8));
    objc_storeStrong((id *)&v13->_listener, a5);
    -[NSXPCListener _setQueue:](v13->_listener, "_setQueue:", v9);
    -[NSXPCListener setDelegate:](v13->_listener, "setDelegate:", v13);
  }

  return v13;
}

- (void)activate
{
  NSObject *v3;
  id v4;

  -[BMComputeSourceServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[BMComputeSourceServer listener](self, "listener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

void __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_18D810000, v2, OS_LOG_TYPE_DEFAULT, "BMComputeSourceServer connection %@ interrupted", (uint8_t *)&v4, 0xCu);

  }
}

void __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke_130(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_xpcConnection");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "_xpcConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)xpc_connection_copy_invalidation_reason();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = CFSTR("<unknown>");
      }
      free(v7);
    }
  }
  else
  {
    v5 = 0;
  }
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_INFO, "BMComputeSourceServer connection %@ invalidated because %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 32);
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "removeObjectForKey:", v10);

}

- (NSString)description
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<source: %@ listener: %@ queue: %@ connectionCount: %lu>"), WeakRetained, self->_listener, self->_queue, -[NSMapTable count](self->_connections, "count"));

  return (NSString *)v5;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16();
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "BMComputeSourceServer accepting connection from %{public}@(%d)", v4, 0x12u);

  OUTLINED_FUNCTION_1_0();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMComputeSourceServer refusing connection from %{public}@(%d), process lacks write entitlements", v4, 0x12u);

  OUTLINED_FUNCTION_1_0();
}

@end
