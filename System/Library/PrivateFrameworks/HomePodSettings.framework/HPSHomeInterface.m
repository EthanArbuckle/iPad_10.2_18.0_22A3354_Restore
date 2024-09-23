@implementation HPSHomeInterface

- (HPSHomeInterface)initWithDelegate:(id)a3
{
  HPSHomeInterface *v4;
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *hpsConnection;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSXPCConnection *v20;
  uint64_t v21;
  NSXPCConnection *v22;
  HPSHomeInterfaceMediator *v23;
  uint64_t v25;
  void *v26;
  id obj;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v32.receiver = self;
  v32.super_class = (Class)HPSHomeInterface;
  v4 = -[HPSHomeInterface init](&v32, sel_init);
  if (v4)
  {
    _HPSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[HPSHomeInterface initWithDelegate:]";
      _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v4->_delegate, obj);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.homepodsettings.server"), 4096);
    hpsConnection = v4->_hpsConnection;
    v4->_hpsConnection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E018E0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v4->_hpsConnection, "setRemoteObjectInterface:", v8);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DF4BA8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v4->_hpsConnection, "setExportedInterface:", v9);

    v26 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v25, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v4->_hpsConnection, "remoteObjectInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getHomeKitCachedSettings_, 0, 1);

    objc_initWeak((id *)buf, v4);
    v20 = v4->_hpsConnection;
    v21 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __37__HPSHomeInterface_initWithDelegate___block_invoke;
    v30[3] = &unk_24F9AF630;
    objc_copyWeak(&v31, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v20, "setInterruptionHandler:", v30);
    v22 = v4->_hpsConnection;
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __37__HPSHomeInterface_initWithDelegate___block_invoke_251;
    v28[3] = &unk_24F9AF630;
    objc_copyWeak(&v29, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v22, "setInvalidationHandler:", v28);
    v4->_connectionValid = v4->_hpsConnection != 0;
    v23 = -[HPSHomeInterfaceMediator initWithInterface:]([HPSHomeInterfaceMediator alloc], "initWithInterface:", v4);
    -[NSXPCConnection setExportedObject:](v4->_hpsConnection, "setExportedObject:", v23);
    -[NSXPCConnection resume](v4->_hpsConnection, "resume");
    -[HPSHomeInterface startConnection](v4, "startConnection");

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

  }
  return v4;
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  _HPSLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __37__HPSHomeInterface_initWithDelegate___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInterrupted");

}

void __37__HPSHomeInterface_initWithDelegate___block_invoke_251(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  _HPSLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __37__HPSHomeInterface_initWithDelegate___block_invoke_251_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInvalidated");

}

- (void)startConnection
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HPSHomeInterface startConnection]";
    _os_log_impl(&dword_22DF16000, v3, OS_LOG_TYPE_DEFAULT, "%s Invoked on HPSHomeInterface XPCClient!", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_hpsConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startConnection");

}

void __35__HPSHomeInterface_startConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _HPSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __35__HPSHomeInterface_startConnection__block_invoke_cold_1(v2);

  }
}

- (void)getHomeAccessoryAttribute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *hpsConnection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    hpsConnection = self->_hpsConnection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke;
    v23[3] = &unk_24F9AF698;
    v11 = v7;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](hpsConnection, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_254;
    v21[3] = &unk_24F9AF6C0;
    v22 = v11;
    objc_msgSend(v12, "getHomeAccessoryAttribute:completion:", v6, v21);

    v13 = v24;
  }
  else
  {
    _HPSLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface getHomeAccessoryAttribute:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

void __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_cold_1(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAirPlaySettings:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *hpsConnection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __39__HPSHomeInterface_getAirPlaySettings___block_invoke;
    v20[3] = &unk_24F9AF698;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](hpsConnection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __39__HPSHomeInterface_getAirPlaySettings___block_invoke_256;
    v18[3] = &unk_24F9AF6E8;
    v19 = v8;
    objc_msgSend(v9, "getAirPlaySettings:", v18);

    v10 = v21;
  }
  else
  {
    _HPSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface getAirPlaySettings:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __39__HPSHomeInterface_getAirPlaySettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__HPSHomeInterface_getAirPlaySettings___block_invoke_cold_1(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __39__HPSHomeInterface_getAirPlaySettings___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getHomeKitCachedSettings:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *hpsConnection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke;
    v20[3] = &unk_24F9AF698;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](hpsConnection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_258;
    v18[3] = &unk_24F9AF6E8;
    v19 = v8;
    objc_msgSend(v9, "getHomeKitCachedSettings:", v18);

    v10 = v21;
  }
  else
  {
    _HPSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface getHomeKitCachedSettings:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_cold_1(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_258(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isHomeKitSyncComplete:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *hpsConnection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke;
    v20[3] = &unk_24F9AF698;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](hpsConnection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_259;
    v18[3] = &unk_24F9AF710;
    v19 = v8;
    objc_msgSend(v9, "isHomeKitSyncComplete:", v18);

    v10 = v21;
  }
  else
  {
    _HPSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface isHomeKitSyncComplete:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_cold_1(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isAutomaticSoftwareUpdateEnabled:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *hpsConnection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke;
    v20[3] = &unk_24F9AF698;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](hpsConnection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_261;
    v18[3] = &unk_24F9AF710;
    v19 = v8;
    objc_msgSend(v9, "isAutomaticSoftwareUpdateEnabled:", v18);

    v10 = v21;
  }
  else
  {
    _HPSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface isAutomaticSoftwareUpdateEnabled:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_cold_1(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_261(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCurrentHomeAttribute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *hpsConnection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    hpsConnection = self->_hpsConnection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke;
    v23[3] = &unk_24F9AF698;
    v11 = v7;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](hpsConnection, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_262;
    v21[3] = &unk_24F9AF6C0;
    v22 = v11;
    objc_msgSend(v12, "getCurrentHomeAttribute:completion:", v6, v21);

    v13 = v24;
  }
  else
  {
    _HPSLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface getCurrentHomeAttribute:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

void __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_cold_1(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_262(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)connectionError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("Connection Error");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.homepodsettings"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleConnectionInvalidated
{
  OUTLINED_FUNCTION_2(&dword_22DF16000, a1, a3, "Connection delegate is null", a5, a6, a7, a8, 0);
}

- (void)handleConnectionInterrupted
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  -[HPSHomeInterface delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HPSHomeInterface delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectionInterrupted");

  }
  else
  {
    _HPSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSHomeInterface handleConnectionInvalidated].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)_accessoryDidUpdateAttribute:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  const __CFString *v28;
  void *v29;
  __CFString **v30;
  const __CFString **v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  const __CFString *v53;
  __CFString *v54;
  const __CFString *v55;
  __CFString *v56;
  const __CFString *v57;
  __CFString *v58;
  const __CFString *v59;
  __CFString *v60;
  const __CFString *v61;
  __CFString *v62;
  const __CFString *v63;
  __CFString *v64;
  _QWORD v65[4];
  _QWORD v66[6];

  v66[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.HPHomeKitSetupComplete")))
  {
    v52 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v52);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v52;
    if (v8)
    {
      _HPSLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HPSHomeInterface _accessoryDidUpdateAttribute:withContext:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = objc_claimAutoreleasedReturnValue();
      v65[0] = CFSTR("hasValidHome");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[__CFString hasValidHomeLoaded](v7, "hasValidHomeLoaded"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v32;
      v65[1] = CFSTR("OTAEnabled");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[__CFString isAutoSUEnabled](v7, "isAutoSUEnabled"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v33;
      v65[2] = CFSTR("mediaPeerToPeerEnabled");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[__CFString isMediaPeerToPeerEnabled](v7, "isMediaPeerToPeerEnabled"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v34;
      v65[3] = CFSTR("minimumMediaUserPrivilege");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[__CFString minimumMediaUserPrivilege](v7, "minimumMediaUserPrivilege"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v66[3] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:userInfo:](v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.homepodsettings.HPHomeKitSetupComplete"), 0, v36);

    }
    goto LABEL_50;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.deviceReset")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.airplayP2PAccess")))
    {
      objc_opt_class();
      v23 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
      v25 = v24;

      v26 = (void *)MEMORY[0x24BDBD1C0];
      if (v25)
        v26 = v25;
      v27 = v26;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("com.apple.homepodsettings.airplayP2PAccess");
      v61 = CFSTR("mediaPeerToPeerEnabled");
      v62 = v27;
      v29 = (void *)MEMORY[0x24BDBCE70];
      v30 = &v62;
      v31 = &v61;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.accessoryMoved")))
    {
      objc_opt_class();
      v37 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
      v39 = v38;

      v40 = &stru_24F9BAC78;
      if (v39)
        v40 = v39;
      v27 = v40;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("com.apple.homepodsettings.accessoryMoved");
      v59 = CFSTR("roomName");
      v60 = v27;
      v29 = (void *)MEMORY[0x24BDBCE70];
      v30 = &v60;
      v31 = &v59;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.airplaySetPassword")))
    {
      objc_opt_class();
      v43 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v44 = v43;
      else
        v44 = 0;
      v45 = v44;

      v46 = &stru_24F9BAC78;
      if (v45)
        v46 = v45;
      v27 = v46;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("com.apple.homepodsettings.airplaySetPassword");
      v57 = CFSTR("airplayPassword");
      v58 = v27;
      v29 = (void *)MEMORY[0x24BDBCE70];
      v30 = &v58;
      v31 = &v57;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.airplayMinUserPrivilege")))
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.homepodsettings.autoSUModified")))
          goto LABEL_51;
        v51 = objc_msgSend(v6, "BOOLValue");
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v53 = CFSTR("OTAEnabled");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v51);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v54 = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("com.apple.homepodsettings.autoSUModified"), 0, v41);
        goto LABEL_34;
      }
      objc_opt_class();
      v47 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v48 = v47;
      else
        v48 = 0;
      v49 = v48;

      v50 = &unk_24F9C4558;
      if (v49)
        v50 = v49;
      v27 = v50;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("com.apple.homepodsettings.airplayMinUserPrivilege");
      v55 = CFSTR("minimumMediaUserPrivilege");
      v56 = v27;
      v29 = (void *)MEMORY[0x24BDBCE70];
      v30 = &v56;
      v31 = &v55;
    }
    objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "postNotificationName:object:userInfo:", v28, 0, v7);
    goto LABEL_50;
  }
  objc_opt_class();
  v16 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v8 = v17;

  if (v8)
  {
    objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("device_reset_method"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
    v21 = v20;
    v22 = &stru_24F9BAC78;
    if (v20)
      v22 = v20;
    v7 = v22;

  }
  else
  {
    v7 = &stru_24F9BAC78;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = CFSTR("device_reset_method");
  v64 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "postNotificationName:object:userInfo:", CFSTR("com.apple.homepodsettings.deviceReset"), 0, v42);

LABEL_34:
LABEL_50:

LABEL_51:
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[HPSHomeInterface hpsConnection](self, "hpsConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HPSHomeInterface;
  -[HPSHomeInterface dealloc](&v4, sel_dealloc);
}

- (HPSettingsConnectionInterfaceDelegate)delegate
{
  return (HPSettingsConnectionInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)hpsConnection
{
  return self->_hpsConnection;
}

- (void)setHpsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_hpsConnection, a3);
}

- (BOOL)connectionValid
{
  return self->_connectionValid;
}

- (void)setConnectionValid:(BOOL)a3
{
  self->_connectionValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpsConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Connection to HomePodSettings server was interrupted!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke_251_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Connection to HomePodSettings server was invalidated!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __35__HPSHomeInterface_startConnection__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)getHomeAccessoryAttribute:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)getAirPlaySettings:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __39__HPSHomeInterface_getAirPlaySettings___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)getHomeKitCachedSettings:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)isHomeKitSyncComplete:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)isAutomaticSoftwareUpdateEnabled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)getCurrentHomeAttribute:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_22DF16000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_accessoryDidUpdateAttribute:(uint64_t)a3 withContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a2, a3, "Error while unarchiving HPSHomeProxy object %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
