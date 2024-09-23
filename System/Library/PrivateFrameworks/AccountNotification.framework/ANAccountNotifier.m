@implementation ANAccountNotifier

- (ANAccountNotifier)init
{
  return -[ANAccountNotifier initWithCallbackMachService:](self, "initWithCallbackMachService:", 0);
}

- (ANAccountNotifier)initWithCallbackMachService:(id)a3
{
  id v4;
  ANAccountNotifier *v5;
  ANAccountNotifier *v6;
  uint64_t v7;
  NSString *callbackMachService;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ANAccountNotifier;
  v5 = -[ANAccountNotifier init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "copy");
    callbackMachService = v6->_callbackMachService;
    v6->_callbackMachService = (NSString *)v7;

    -[ANAccountNotifier _startNotificationCallbackListenerWithMachServiceName:](v6, "_startNotificationCallbackListenerWithMachServiceName:", v4);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ANAccountNotifier _stopNotificationCallbackListener](self, "_stopNotificationCallbackListener");
  -[ANAccountNotifier _disconnectFromDaemon](self, "_disconnectFromDaemon");
  v3.receiver = self;
  v3.super_class = (Class)ANAccountNotifier;
  -[ANAccountNotifier dealloc](&v3, sel_dealloc);
}

- (void)addNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ANAccountNotifier addNotification:].cold.2();

  if (self->_callbackMachService)
  {
    _ANLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ANAccountNotifier addNotification:].cold.1();

    objc_msgSend(v4, "setCallbackMachService:", self->_callbackMachService);
  }
  -[ANAccountNotifier _daemonConnection](self, "_daemonConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__ANAccountNotifier_addNotification___block_invoke_3;
  v10[3] = &unk_24D4730D0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "addNotification:withCompletion:", v9, v10);

}

void __37__ANAccountNotifier_addNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _ANLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__ANAccountNotifier_addNotification___block_invoke_cold_1();

  }
}

void __37__ANAccountNotifier_addNotification___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[ANAccountNotifier addNotification:]_block_invoke";
      v9 = 1024;
      v10 = 79;
      _os_log_impl(&dword_215D17000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification added successfully!\", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __37__ANAccountNotifier_addNotification___block_invoke_3_cold_1();
  }

}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ANAccountNotifier removeNotificationWithIdentifier:].cold.1();

  -[ANAccountNotifier _daemonConnection](self, "_daemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_6;
  v9[3] = &unk_24D4730D0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "removeNotificationWithID:completion:", v8, v9);

}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _ANLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_cold_1();

  }
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[ANAccountNotifier removeNotificationWithIdentifier:]_block_invoke";
      v9 = 1024;
      v10 = 98;
      _os_log_impl(&dword_215D17000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification removed successfully!\", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_6_cold_1();
  }

}

- (void)removeNotificationsWithEventIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ANAccountNotifier removeNotificationsWithEventIdentifier:].cold.1();

  -[ANAccountNotifier _daemonConnection](self, "_daemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_8;
  v9[3] = &unk_24D4730D0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "removeNotificationsWithEventID:completion:", v8, v9);

}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _ANLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_cold_1();

  }
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[ANAccountNotifier removeNotificationsWithEventIdentifier:]_block_invoke";
      v9 = 1024;
      v10 = 117;
      _os_log_impl(&dword_215D17000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notifications removed successfully!\", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_8_cold_1();
  }

}

- (id)_daemonConnection
{
  NSXPCConnection *daemonConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;

  daemonConnection = self->_daemonConnection;
  if (!daemonConnection)
  {
    -[ANAccountNotifier _createDaemonConnection](self, "_createDaemonConnection");
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_daemonConnection;
    self->_daemonConnection = v4;

    daemonConnection = self->_daemonConnection;
  }
  return daemonConnection;
}

- (id)_createDaemonConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  _ANLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[ANAccountNotifier _createDaemonConnection]";
    v17 = 1024;
    v18 = 137;
    _os_log_impl(&dword_215D17000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Starting new connection...\", buf, 0x12u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.and.xpc"), 0);
  +[ANDaemonInterface XPCInterface](ANDaemonInterface, "XPCInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_initWeak((id *)buf, self);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__ANAccountNotifier__createDaemonConnection__block_invoke;
  v13[3] = &unk_24D473138;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v4, "setInvalidationHandler:", v13);
  v8 = v6;
  v9 = 3221225472;
  v10 = __44__ANAccountNotifier__createDaemonConnection__block_invoke_2;
  v11 = &unk_24D473138;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v4, "setInterruptionHandler:", &v8);
  objc_msgSend(v4, "resume", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
  return v4;
}

void __44__ANAccountNotifier__createDaemonConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_daemonConnectionWasInvalidated");
    WeakRetained = v2;
  }

}

void __44__ANAccountNotifier__createDaemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_daemonConnectionWasInterrupted");
    WeakRetained = v2;
  }

}

- (void)_disconnectFromDaemon
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_215D17000, v0, v1, "%s (%d) \"called\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)_daemonConnectionWasInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_215D17000, v0, v1, "%s (%d) \"Interrupted!\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)_daemonConnectionWasInvalidated
{
  NSObject *v3;
  NSXPCConnection *daemonConnection;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ANLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ANAccountNotifier _daemonConnectionWasInvalidated]";
    v7 = 1024;
    v8 = 179;
    _os_log_impl(&dword_215D17000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v5, 0x12u);
  }

  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = 0;

}

- (void)_startNotificationCallbackListenerWithMachServiceName:(id)a3
{
  id v4;
  NSXPCListener *bulletinResponseListener;
  NSObject *v6;
  NSObject *v7;
  NSXPCListener *v8;
  NSXPCListener *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  bulletinResponseListener = self->_bulletinResponseListener;
  _ANLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (bulletinResponseListener)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[ANAccountNotifier _startNotificationCallbackListenerWithMachServiceName:]";
      v12 = 1024;
      v13 = 190;
      _os_log_impl(&dword_215D17000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification response listener is already running!\", (uint8_t *)&v10, 0x12u);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ANAccountNotifier _startNotificationCallbackListenerWithMachServiceName:].cold.1();

    v8 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v4);
    v9 = self->_bulletinResponseListener;
    self->_bulletinResponseListener = v8;

    -[NSXPCListener setDelegate:](self->_bulletinResponseListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_bulletinResponseListener, "resume");
  }

}

- (void)_stopNotificationCallbackListener
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_215D17000, v0, v1, "%s (%d) \"called\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.and.manager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ANLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ANAccountNotifier listener:shouldAcceptNewConnection:].cold.2();
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    _ANLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ANAccountNotifier listener:shouldAcceptNewConnection:].cold.1();
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  +[ANClientCallbackInterface XPCInterface](ANClientCallbackInterface, "XPCInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");
  _ANLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[ANAccountNotifier listener:shouldAcceptNewConnection:]";
    v13 = 1024;
    v14 = 227;
    _os_log_impl(&dword_215D17000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Accepted new connection.\", (uint8_t *)&v11, 0x12u);
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)notificationWasActivated:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ANAccountNotifier notificationWasActivated:]";
    v11 = 1024;
    v12 = 234;
    _os_log_impl(&dword_215D17000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v9, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "accountNotifier:didActivateNotification:", self, v4);

  }
}

- (void)notificationWasDismissed:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ANAccountNotifier notificationWasDismissed:]";
    v11 = 1024;
    v12 = 243;
    _os_log_impl(&dword_215D17000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v9, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "accountNotifier:didDismissNotification:", self, v4);

  }
}

- (void)notificationWasCleared:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ANLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ANAccountNotifier notificationWasCleared:]";
    v11 = 1024;
    v12 = 252;
    _os_log_impl(&dword_215D17000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\", (uint8_t *)&v9, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "accountNotifier:didClearNotification:", self, v4);

  }
}

- (ANAccountNotifierDelegate)delegate
{
  return (ANAccountNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackMachService, 0);
  objc_storeStrong((id *)&self->_bulletinResponseListener, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (void)addNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_215D17000, v0, v1, "%s (%d) \"Setting callback Mach service for notification to %@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)addNotification:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_215D17000, v0, v1, "%s (%d) \"%@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __37__ANAccountNotifier_addNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_215D17000, v0, v1, "%s (%d) \"XPC error while calling addNotification! %@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __37__ANAccountNotifier_addNotification___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_215D17000, v0, v1, "%s (%d) \"Failed to add notification %@! Error: %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)removeNotificationWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_215D17000, v0, v1, "%s (%d) \"%@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_215D17000, v0, v1, "%s (%d) \"XPC error while calling removeNotificationWithID! %@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_6_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_215D17000, v0, v1, "%s (%d) \"Failed to remove notification %@! Error: %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)removeNotificationsWithEventIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_215D17000, v0, v1, "%s (%d) \"%@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_215D17000, v0, v1, "%s (%d) \"XPC error while calling removeNotificationsWithEventID! %@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_8_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_215D17000, v0, v1, "%s (%d) \"Failed to remove notifications with event ID %@! Error: %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_startNotificationCallbackListenerWithMachServiceName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_215D17000, v0, v1, "%s (%d) \"Starting Notification response listener...\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_215D17000, v0, v1, "%s (%d) \"Rejecting connection because of bad/missing entitlement.\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_215D17000, v0, v1, "%s (%d) \"Rejecting connection because of bad/missing entitlement.\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

@end
