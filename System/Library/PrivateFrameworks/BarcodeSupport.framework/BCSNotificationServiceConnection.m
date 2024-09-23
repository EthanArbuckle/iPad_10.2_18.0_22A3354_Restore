@implementation BCSNotificationServiceConnection

- (void)notifyParsedCodeWithData:(id)a3 codePayload:(id)a4 shouldReplacePreviousNotifications:(BOOL)a5 withReply:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[BCSNotificationServiceConnection serviceConnection](self, "serviceConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:reply:", v12, v11, v6, v10);

}

void __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(a2);
}

- (void)cancelNotificationsForCodeType:(int64_t)a3
{
  void *v4;
  id v5;

  -[BCSNotificationServiceConnection serviceConnection](self, "serviceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelNotificationsForCodeType:", a3);

}

void __67__BCSNotificationServiceConnection_cancelNotificationsForCodeType___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(a2);
}

- (void)didReceiveNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BCSNotificationServiceConnection serviceConnection](self, "serviceConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveNotificationResponse:", v4);

}

void __67__BCSNotificationServiceConnection_didReceiveNotificationResponse___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(a2);
}

- (void)startNFCReaderWithDelegate:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[BCSNotificationServiceConnection serviceConnection](self, "serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__BCSNotificationServiceConnection_startNFCReaderWithDelegate_errorHandler___block_invoke;
  v11[3] = &unk_24D787850;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startNFCReaderWithDelegate:", v7);

}

void __76__BCSNotificationServiceConnection_startNFCReaderWithDelegate_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

- (void)stopNFCReaderWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[BCSNotificationServiceConnection serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__BCSNotificationServiceConnection_stopNFCReaderWithErrorHandler___block_invoke;
  v8[3] = &unk_24D787850;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopNFCReader");

}

void __66__BCSNotificationServiceConnection_stopNFCReaderWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BCSNotificationServiceConnection;
  -[BCSNotificationServiceConnection dealloc](&v3, sel_dealloc);
}

- (void)setInterruptionHandler:(id)a3
{
  void *v4;
  id interruptionHandler;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x219A0C7F8]();
  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = v4;

  -[NSXPCConnection setInterruptionHandler:](self->_serviceConnection, "setInterruptionHandler:", v6);
}

- (NSXPCConnection)serviceConnection
{
  NSXPCConnection *serviceConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  serviceConnection = self->_serviceConnection;
  if (serviceConnection)
    return serviceConnection;
  v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.BarcodeSupport.BarcodeNotificationService"), 4096);
  v6 = self->_serviceConnection;
  self->_serviceConnection = v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFA040);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00B48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_startNFCReaderWithDelegate_, 0, 0);

  -[NSXPCConnection setRemoteObjectInterface:](self->_serviceConnection, "setRemoteObjectInterface:", v7);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __53__BCSNotificationServiceConnection_serviceConnection__block_invoke;
  v13 = &unk_24D787578;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_serviceConnection, "setInvalidationHandler:", &v10);
  -[NSXPCConnection setInterruptionHandler:](self->_serviceConnection, "setInterruptionHandler:", self->_interruptionHandler, v10, v11, v12, v13);
  -[NSXPCConnection resume](self->_serviceConnection, "resume");
  v9 = self->_serviceConnection;
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __53__BCSNotificationServiceConnection_serviceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setServiceConnection:", 0);

}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

void __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "Cannot connect to remote service with error: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
