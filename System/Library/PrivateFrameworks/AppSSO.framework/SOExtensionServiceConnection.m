@implementation SOExtensionServiceConnection

- (SOExtensionServiceConnection)initWithListenerEndpoint:(id)a3
{
  id v4;
  SOExtensionServiceConnection *v5;
  SOExtensionServiceConnection *v6;
  SOExtensionServiceConnection *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SOExtensionServiceConnection;
  v5 = -[SOExtensionServiceConnection init](&v17, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  if (v4)
  {
    -[SOExtensionServiceConnection setServiceXpcEndpoint:](v5, "setServiceXpcEndpoint:", v4);
    -[SOExtensionServiceConnection _connectToService](v6, "_connectToService");
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  SO_LOG_SOExtensionServiceConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SOExtensionServiceConnection initWithListenerEndpoint:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)_connectToService
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  id *p_location;
  uint64_t v26;
  uint64_t v27;
  __int128 buf;
  Class (*v29)(uint64_t);
  void *v30;
  id *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    SO_LOG_SOExtensionServiceConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SOExtensionServiceConnection _connectToService].cold.2();

    return 1;
  }
  v5 = objc_alloc(MEMORY[0x24BDD1988]);
  -[SOExtensionServiceConnection serviceXpcEndpoint](self, "serviceXpcEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithListenerEndpoint:", v6);
  -[SOExtensionServiceConnection setXpcConnection:](self, "setXpcConnection:", v7);

  -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    location = 0;
    p_location = &location;
    v26 = 0x2050000000;
    v9 = (id)getSOInternalProtocolsClass_softClass;
    v27 = getSOInternalProtocolsClass_softClass;
    v10 = MEMORY[0x24BDAC760];
    if (!getSOInternalProtocolsClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v29 = __getSOInternalProtocolsClass_block_invoke;
      v30 = &unk_24C80C0B8;
      v31 = &location;
      __getSOInternalProtocolsClass_block_invoke((uint64_t)&buf);
      v9 = p_location[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&location, 8);
    objc_msgSend(v11, "interfaceWithInternalProtocol:", &unk_2549D9850);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, self);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __49__SOExtensionServiceConnection__connectToService__block_invoke;
    v22[3] = &unk_24C80C0F8;
    objc_copyWeak(&v23, &location);
    -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInvalidationHandler:", v22);

    objc_copyWeak(&v21, &location);
    -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection", v10, 3221225472, __49__SOExtensionServiceConnection__connectToService__block_invoke_46, &unk_24C80C0F8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInterruptionHandler:", &v20);

    -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resume");

    SO_LOG_SOExtensionServiceConnection();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_20DABC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: new XPC connection", (uint8_t *)&buf, 0xCu);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    return 1;
  }
  SO_LOG_SOExtensionServiceConnection();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[SOExtensionServiceConnection _connectToService].cold.1();

  return 0;
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SO_LOG_SOExtensionServiceConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __49__SOExtensionServiceConnection__connectToService__block_invoke_cold_1();

  }
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke_46(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SO_LOG_SOExtensionServiceConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __49__SOExtensionServiceConnection__connectToService__block_invoke_46_cold_1();

  }
}

- (void)beginAuthorizationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  if (-[SOExtensionServiceConnection _connectToService](self, "_connectToService"))
  {
    -[SOExtensionServiceConnection xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke;
    v29 = &unk_24C80C120;
    v6 = v4;
    v30 = v6;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginAuthorizationWithCompletion:", v6, v26, v27, v28, v29);

    v8 = v30;
LABEL_9:

    goto LABEL_10;
  }
  SO_LOG_SOExtensionServiceConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[SOExtensionServiceConnection beginAuthorizationWithCompletion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  if (v4)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v24 = (void *)getSOErrorHelperClass_softClass;
    v35 = getSOErrorHelperClass_softClass;
    if (!getSOErrorHelperClass_softClass)
    {
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __getSOErrorHelperClass_block_invoke;
      v31[3] = &unk_24C80C0B8;
      v31[4] = &v32;
      __getSOErrorHelperClass_block_invoke((uint64_t)v31, v17, v18, v19, v20, v21, v22, v23, v26);
      v24 = (void *)v33[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v32, 8);
    objc_msgSend(v25, "silentInternalErrorWithMessage:", CFSTR("Failed to connect to AppSSO service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
    goto LABEL_9;
  }
LABEL_10:

}

void __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SO_LOG_SOExtensionServiceConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCListenerEndpoint)serviceXpcEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceXpcEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceXpcEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithListenerEndpoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DABC000, a1, a3, "missing XPC endpoint", a5, a6, a7, a8, 0);
}

- (void)_connectToService
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__SOExtensionServiceConnection__connectToService__block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beginAuthorizationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DABC000, a1, a3, "Failed to connect to AppSSO service", a5, a6, a7, a8, 0);
}

void __65__SOExtensionServiceConnection_beginAuthorizationWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "AppSSO service XPC error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
