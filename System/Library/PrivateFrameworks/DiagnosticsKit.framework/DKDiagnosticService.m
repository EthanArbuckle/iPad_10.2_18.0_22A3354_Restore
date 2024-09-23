@implementation DKDiagnosticService

- (DKDiagnosticService)init
{
  DKDiagnosticService *v2;
  uint64_t v3;
  NSXPCListener *listener;
  void *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  Class principalClass;
  NSObject *v10;
  Class v11;
  uint64_t v12;
  NSMutableArray *connections;
  objc_super v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  Class v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)DKDiagnosticService;
  v2 = -[DKDiagnosticService init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "serviceListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSPrincipalClass"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    principalClass = v2->_principalClass;
    v2->_principalClass = (Class)v8;

    DiagnosticsKitLogHandleForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v2->_principalClass;
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_22DE4C000, v10, OS_LOG_TYPE_DEFAULT, "Principal class: %@ => %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v12;

  }
  return v2;
}

- (void)resume
{
  id v2;

  -[DKDiagnosticService listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  DKDiagnosticContext *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[DKDiagnosticService listener:shouldAcceptNewConnection:]";
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.DiagnosticsKit.diagnosticmanager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
  {
    v10 = -[DKDiagnosticContext initWithConnection:]([DKDiagnosticContext alloc], "initWithConnection:", v7);
    -[DKDiagnosticService principalClass](self, "principalClass");
    v11 = (char *)objc_opt_new();
    DiagnosticsKitLogHandleForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v11;
      _os_log_impl(&dword_22DE4C000, v12, OS_LOG_TYPE_DEFAULT, "Instantiated controller: %@", buf, 0xCu);
    }

    -[DKDiagnosticContext setXpcPrincipalObject:](v10, "setXpcPrincipalObject:", v11);
    objc_msgSend(v7, "setExportedObject:", v10);
    +[DKDiagnosticContext _extensionAuxiliaryVendorProtocol](DKDiagnosticContext, "_extensionAuxiliaryVendorProtocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v13);

    +[DKDiagnosticHostContext _extensionAuxiliaryHostProtocol](DKDiagnosticHostContext, "_extensionAuxiliaryHostProtocol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v14);

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v15 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke;
    v24[3] = &unk_24F99AE08;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v24);
    v19 = v15;
    v20 = 3221225472;
    v21 = __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_9;
    v22 = &unk_24F99AE30;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v7, "setInterruptionHandler:", &v19);
    -[DKDiagnosticService connections](self, "connections", v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v7);

    objc_msgSend(v7, "resume");
    objc_msgSend(v11, "beginRequestWithDiagnosticContext:", v10);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_cold_1((uint64_t)WeakRetained, v3, v4);

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", WeakRetained);

}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_9(uint64_t a1)
{
  NSObject *v2;

  DiagnosticsKitLogHandleForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_9_cold_1(a1, v2);

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (Class)principalClass
{
  return self->_principalClass;
}

- (void)setPrincipalClass:(Class)a3
{
  objc_storeStrong((id *)&self->_principalClass, a3);
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_principalClass, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22DE4C000, a2, a3, "Connection invalidated: %@", (uint8_t *)&v3);
}

void __58__DKDiagnosticService_listener_shouldAcceptNewConnection___block_invoke_9_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = 138412290;
  v6 = WeakRetained;
  OUTLINED_FUNCTION_0_0(&dword_22DE4C000, a2, v4, "Connection interrupted: %@", (uint8_t *)&v5);

}

@end
