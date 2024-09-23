@implementation VSServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  VSServiceConnectionHandler *v20;
  NSObject *v21;
  VSServiceListener *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v5;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Received request to open connection %@", buf, 0xCu);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = self;
  -[VSServiceListener entitlementNames](self, "entitlementNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v5, "valueForEntitlement:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
        {
          VSDefaultLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v12;
            _os_log_impl(&dword_1D2419000, v17, OS_LOG_TYPE_DEFAULT, "Will accept connection due to %@ entitlement.", buf, 0xCu);
          }

          -[VSServiceListener exportedInterface](v23, "exportedInterface");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setExportedInterface:", v18);

          -[VSServiceListener exportedObject](v23, "exportedObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setExportedObject:", v19);

          v20 = objc_alloc_init(VSServiceConnectionHandler);
          -[VSServiceConnectionHandler setDelegate:](v20, "setDelegate:", v23);
          -[VSServiceConnectionHandler setConnection:](v20, "setConnection:", v5);
          -[VSServiceListener _addConnectionHandler:](v23, "_addConnectionHandler:", v20);

          VSDefaultLogObject();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v5;
            _os_log_impl(&dword_1D2419000, v21, OS_LOG_TYPE_DEFAULT, "Will accept connection %@", buf, 0xCu);
          }

          objc_msgSend(v5, "resume");
          v16 = 1;
          goto LABEL_22;
        }
        VSDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v12;
          v30 = 2112;
          v31 = v13;
          _os_log_impl(&dword_1D2419000, v14, OS_LOG_TYPE_DEFAULT, "Value for %@ entitlement (%@) was inadequate.", buf, 0x16u);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v9)
        continue;
      break;
    }
  }

  VSErrorLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[VSServiceListener listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v15);

  v16 = 0;
LABEL_22:

  return v16;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSArray)entitlementNames
{
  return self->_entitlementNames;
}

- (NSMutableSet)connectionHandlers
{
  return self->_connectionHandlers;
}

- (void)_addConnectionHandler:(id)a3
{
  VSServiceListener *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VSServiceListener connectionHandlers](v4, "connectionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (VSServiceListener)init
{
  VSServiceListener *v2;
  NSMutableSet *v3;
  NSMutableSet *connectionHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSServiceListener;
  v2 = -[VSServiceListener init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connectionHandlers = v2->_connectionHandlers;
    v2->_connectionHandlers = v3;

  }
  return v2;
}

- (void)_removeConnectionHandler:(id)a3
{
  VSServiceListener *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VSServiceListener connectionHandlers](v4, "connectionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)setEntitlementNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong(&self->_exportedObject, a3);
}

- (void)setConnectionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_connectionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandlers, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_entitlementNames, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Will NOT accept connection %@", (uint8_t *)&v2, 0xCu);
}

@end
