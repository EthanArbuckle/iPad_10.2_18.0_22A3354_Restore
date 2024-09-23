@implementation AAFService

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[AAFService preConnectEntitlements](self, "preConnectEntitlements", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v9 = (void *)MEMORY[0x1E0C9AAB0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v4, "valueForEntitlement:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_msgSend(v9, "isEqual:", v12) & 1) == 0)
        {
          _AAFLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[AAFService shouldAcceptNewConnection:].cold.3(v11, v19);

          goto LABEL_16;
        }

      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[AAFService exportedProtocol](self, "exportedProtocol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _AAFLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[AAFService shouldAcceptNewConnection:].cold.1(v5, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_16;
  }
  v14 = (void *)MEMORY[0x1E0CB3B50];
  -[AAFService exportedProtocol](self, "exportedProtocol");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "interfaceWithProtocol:", v15);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setExportedInterface:", v5);
  -[AAFService exportedObject](self, "exportedObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    _AAFLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[AAFService shouldAcceptNewConnection:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  -[AAFService exportedObject](self, "exportedObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedObject:", v17);

  -[AAFService configureExportedInterface:](self, "configureExportedInterface:", v5);
  objc_msgSend(v4, "resume");
  v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return -[AAFService shouldAcceptNewConnection:](self, "shouldAcceptNewConnection:", a4);
}

- (AAFService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAFService;
  return -[AAFService init](&v3, sel_init);
}

- (void)startup
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _AAFLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[AAFService serviceName](self, "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D51A2000, v3, OS_LOG_TYPE_DEFAULT, "Service: starting up xpc service - %@", (uint8_t *)&v5, 0xCu);

  }
  -[AAFService _configureListener](self, "_configureListener");
}

- (void)_configureListener
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D51A2000, log, OS_LOG_TYPE_ERROR, "Fatal Error: nil service name is not allowed.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)preConnectEntitlements
{
  return self->_preConnectEntitlements;
}

- (Protocol)exportedProtocol
{
  return self->_exportedProtocol;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCListener)serviceListener
{
  return self->_serviceListener;
}

- (void)setServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_serviceListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedProtocol, 0);
  objc_storeStrong((id *)&self->_preConnectEntitlements, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)shouldAcceptNewConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D51A2000, a1, a3, "\"Fatal Error: There is no protol to expose.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)shouldAcceptNewConnection:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D51A2000, a1, a3, "\"Fatal Error: There is no exported object to handle incoming messages.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)shouldAcceptNewConnection:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D51A2000, a2, OS_LOG_TYPE_ERROR, "Client doesn't have entitlement - %@. Terminating connection!", (uint8_t *)&v2, 0xCu);
}

@end
