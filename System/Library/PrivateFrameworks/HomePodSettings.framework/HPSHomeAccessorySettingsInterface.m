@implementation HPSHomeAccessorySettingsInterface

- (HPSHomeAccessorySettingsInterface)initWithDelegate:(id)a3
{
  id v4;
  HPSHomeAccessorySettingsInterface *v5;
  HPSHomeAccessorySettingsInterface *v6;
  uint64_t v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSXPCConnection *v19;
  uint64_t v20;
  NSXPCConnection *v21;
  HPSHomeAccessoryInterfaceMediator *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HPSHomeAccessorySettingsInterface;
  v5 = -[HPSHomeAccessorySettingsInterface init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    v24 = v4;
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.homeaccessorysettings.server"), 4096);
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E01940);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DF39D8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_sendFetchSettingForEndpointIdentifier_keyPath_completionHandler_, 0, 1);
    objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_sendSubscribeRequestToSettingForEndpointIdentifier_keypath_completionHandler_, 0, 1);
    objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_sendUnsubscribeRequestToSettingForEndpointIdentifier_keypath_completionHandler_, 0, 1);
    objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_homekitaccessoryDidUpdateValueForEndpointIdentifier_keyPath_value_, 0, 0);
    objc_initWeak(&location, v6);
    v19 = v6->_xpcConnection;
    v20 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke;
    v30[3] = &unk_24F9AF630;
    objc_copyWeak(&v31, &location);
    -[NSXPCConnection setInterruptionHandler:](v19, "setInterruptionHandler:", v30);
    v21 = v6->_xpcConnection;
    v28[0] = v20;
    v28[1] = 3221225472;
    v28[2] = __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_243;
    v28[3] = &unk_24F9AF630;
    objc_copyWeak(&v29, &location);
    -[NSXPCConnection setInvalidationHandler:](v21, "setInvalidationHandler:", v28);
    v6->_isValidConnection = v6->_xpcConnection != 0;
    v22 = -[HPSHomeAccessoryInterfaceMediator initWithInterface:]([HPSHomeAccessoryInterfaceMediator alloc], "initWithInterface:", v6);
    -[NSXPCConnection setExportedObject:](v6->_xpcConnection, "setExportedObject:", v22);
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v27);
    -[NSXPCConnection setExportedInterface:](v6->_xpcConnection, "setExportedInterface:", v25);
    -[NSXPCConnection resume](v6->_xpcConnection, "resume");

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

    v4 = v24;
  }

  return v6;
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke(uint64_t a1)
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
    __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInterrupted");

}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_243(uint64_t a1)
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
    __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_243_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleConnectionInvalidated");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[HPSHomeAccessorySettingsInterface xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HPSHomeAccessorySettingsInterface;
  -[HPSHomeAccessorySettingsInterface dealloc](&v4, sel_dealloc);
}

- (void)fetchSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[HPSHomeAccessorySettingsInterface fetchSettingForEndpointIdentifier:keyPath:completionHandler:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@", (uint8_t *)&v13, 0x20u);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendFetchSettingForEndpointIdentifier:keyPath:completionHandler:", v8, v9, v10);

}

void __97__HPSHomeAccessorySettingsInterface_fetchSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __97__HPSHomeAccessorySettingsInterface_fetchSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(v2);

}

- (void)subscribeToSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[HPSHomeAccessorySettingsInterface subscribeToSettingForEndpointIdentifier:keyPath:completionHandler:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@", (uint8_t *)&v13, 0x20u);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_248);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSubscribeRequestToSettingForEndpointIdentifier:keypath:completionHandler:", v8, v9, v10);

}

void __103__HPSHomeAccessorySettingsInterface_subscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __103__HPSHomeAccessorySettingsInterface_subscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(v2);

}

- (void)unsubscribeToSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[HPSHomeAccessorySettingsInterface unsubscribeToSettingForEndpointIdentifier:keyPath:completionHandler:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@", (uint8_t *)&v13, 0x20u);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_249);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendUnsubscribeRequestToSettingForEndpointIdentifier:keypath:completionHandler:", v8, v9, v10);

}

void __105__HPSHomeAccessorySettingsInterface_unsubscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __105__HPSHomeAccessorySettingsInterface_unsubscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(v2);

}

- (void)handleConnectionInvalidated
{
  OUTLINED_FUNCTION_2(&dword_22DF16000, a1, a3, "Connection delegate is nil", a5, a6, a7, a8, 0);
}

- (void)handleConnectionInterrupted
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "settingsConnectionInterrupted");
  }
  else
  {
    _HPSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[HPSHomeAccessorySettingsInterface handleConnectionInvalidated].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)accessoryDidUpdateValueForEndpointIdentifier:(id)a3 keyPath:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315906;
    v14 = "-[HPSHomeAccessorySettingsInterface accessoryDidUpdateValueForEndpointIdentifier:keyPath:value:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_DEFAULT, "%s Notify Client endpointID %@ keyPath %@ settingValue %@", (uint8_t *)&v13, 0x2Au);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didUpdateSettingForEndpointIdentifier:keyPath:value:", v8, v9, v10);

}

- (HPSHomeAccessorySettingsConnectionInterfaceDelegate)delegate
{
  return (HPSHomeAccessorySettingsConnectionInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HPSHomeAccessoryInterfaceMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
  objc_storeStrong((id *)&self->_mediator, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)isValidConnection
{
  return self->_isValidConnection;
}

- (void)setIsValidConnection:(BOOL)a3
{
  self->_isValidConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Connection to HomePodSettings server was interrupted!", a5, a6, a7, a8, 2u);
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_243_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22DF16000, a1, a3, "%s Connection to HomePodSettings server was invalidated!", a5, a6, a7, a8, 2u);
}

void __97__HPSHomeAccessorySettingsInterface_fetchSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(void *a1)
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

void __103__HPSHomeAccessorySettingsInterface_subscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(void *a1)
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

void __105__HPSHomeAccessorySettingsInterface_unsubscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(void *a1)
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

@end
