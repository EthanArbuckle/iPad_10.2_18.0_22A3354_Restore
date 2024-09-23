@implementation FAFamilyNotifier

- (FAFamilyNotifier)initWithIdentifier:(id)a3 machServiceName:(id)a4
{
  id v7;
  id v8;
  FAFamilyNotifier *v9;
  NSLock *v10;
  NSLock *connLock;
  uint64_t v12;
  NSXPCListener *listener;
  FAFamilyNotifier *v14;

  v7 = a3;
  v8 = a4;
  v9 = -[FAFamilyNotifier init](self, "init");
  if (v9)
  {
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connLock = v9->_connLock;
    v9->_connLock = v10;

    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_serviceName, a4);
    if (v9->_serviceName)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v8);
      listener = v9->_listener;
      v9->_listener = (NSXPCListener *)v12;

      -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
      -[NSXPCListener resume](v9->_listener, "resume");
    }
    v14 = v9;
  }

  return v9;
}

- (void)deliverNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FAFamilyNotifier agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__FAFamilyNotifier_deliverNotification___block_invoke;
  v8[3] = &unk_24D3B5680;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deliverNotificaton:", v6);
}

void __40__FAFamilyNotifier_deliverNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[FAFamilyNotifier deliverNotification:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_215903000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error delivering notification %@ - %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FAFamilyNotifier agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__FAFamilyNotifier_removeNotificationWithIdentifier___block_invoke;
  v8[3] = &unk_24D3B5680;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeNotificationWithIdentifier:", v6);
}

void __53__FAFamilyNotifier_removeNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[FAFamilyNotifier removeNotificationWithIdentifier:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_215903000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error removing notification with identifier %@ - %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)removeAllNotifications
{
  void *v2;
  id v3;

  -[FAFamilyNotifier agentConnection](self, "agentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeAllNotifications");
}

void __42__FAFamilyNotifier_removeAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[FAFamilyNotifier removeAllNotifications]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_215903000, v3, OS_LOG_TYPE_DEFAULT, "%s: XPC error removing all notifications - %@", (uint8_t *)&v4, 0x16u);
  }

}

- (id)_pendingNotificationsWithClientIdentifier:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[4];
  NSObject *v23;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  -[FAFamilyNotifier agentConnection](self, "agentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke;
  v22[3] = &unk_24D3B5680;
  v8 = v5;
  v23 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke_2;
  v13[3] = &unk_24D3B56E8;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "pendingNotificationsWithIdentifier:replyBlock:", v4, v13);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[FAFamilyNotifier _pendingNotificationsWithClientIdentifier:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_215903000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error removing all notifications - %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)pendingNotifications
{
  void *v3;
  void *v4;

  -[FAFamilyNotifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyNotifier _pendingNotificationsWithClientIdentifier:](self, "_pendingNotificationsWithClientIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pendingNotificationsForAllClients
{
  return -[FAFamilyNotifier _pendingNotificationsWithClientIdentifier:](self, "_pendingNotificationsWithClientIdentifier:", 0);
}

- (id)agentConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *conn;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  FAFamilyNotifier *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  NSXPCConnection *v12;
  NSXPCConnection *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  FAFamilyNotifier *v22;

  -[NSLock lock](self->_connLock, "lock");
  if (!self->_conn)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.familynotification.agent"), 4096);
    conn = self->_conn;
    self->_conn = v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DEC528);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_pendingNotificationsWithIdentifier_replyBlock_, 0, 1);

    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    v21[4] = __Block_byref_object_dispose_;
    v9 = self;
    v22 = v9;
    v10 = MEMORY[0x24BDAC760];
    v11 = self->_conn;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __35__FAFamilyNotifier_agentConnection__block_invoke;
    v20[3] = &unk_24D3B5710;
    v20[4] = v21;
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v20);
    v12 = self->_conn;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __35__FAFamilyNotifier_agentConnection__block_invoke_2;
    v19[3] = &unk_24D3B5710;
    v19[4] = v21;
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v19);
    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v5);
    v13 = self->_conn;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __35__FAFamilyNotifier_agentConnection__block_invoke_3;
    v18[3] = &unk_24D3B5738;
    v18[4] = v21;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v13, "remoteObjectProxyWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyNotifier identifier](v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClientIdentifier:", v15);

    -[FAFamilyNotifier serviceName](v9, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegateMachServiceName:", v16);

    -[NSXPCConnection resume](self->_conn, "resume");
    _Block_object_dispose(v21, 8);

  }
  -[NSLock unlock](self->_connLock, "unlock");
  return self->_conn;
}

uint64_t __35__FAFamilyNotifier_agentConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_agentConnectionWasInterrupted");
}

uint64_t __35__FAFamilyNotifier_agentConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_agentConnectionWasInvalidated");
}

void __35__FAFamilyNotifier_agentConnection__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[FAFamilyNotifier agentConnection]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_215903000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error bootstrapping remote client interface - %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_agentConnectionFailedToBootstrap");
}

- (void)_agentConnectionWasInterrupted
{
  NSObject *v3;
  NSXPCConnection *conn;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_connLock, "lock");
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[FAFamilyNotifier _agentConnectionWasInterrupted]";
    _os_log_impl(&dword_215903000, v3, OS_LOG_TYPE_DEFAULT, "%s: agent connection interrupted. Disposing of connection.", (uint8_t *)&v5, 0xCu);
  }

  conn = self->_conn;
  self->_conn = 0;

  -[NSLock unlock](self->_connLock, "unlock");
}

- (void)_agentConnectionWasInvalidated
{
  NSObject *v3;
  NSXPCConnection *conn;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_connLock, "lock");
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[FAFamilyNotifier _agentConnectionWasInvalidated]";
    _os_log_impl(&dword_215903000, v3, OS_LOG_TYPE_DEFAULT, "%s: agent connection invalidated. Disposing of connection.", (uint8_t *)&v5, 0xCu);
  }

  conn = self->_conn;
  self->_conn = 0;

  -[NSLock unlock](self->_connLock, "unlock");
}

- (void)_agentConnectionFailedToBootstrap
{
  NSObject *v3;
  NSXPCConnection *conn;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_connLock, "lock");
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[FAFamilyNotifier _agentConnectionFailedToBootstrap]";
    _os_log_impl(&dword_215903000, v3, OS_LOG_TYPE_DEFAULT, "%s: agent connection failed to bootstrap. Disposing of connection.", (uint8_t *)&v5, 0xCu);
  }

  conn = self->_conn;
  self->_conn = 0;

  -[NSLock unlock](self->_connLock, "unlock");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_254DEB698);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)didActivateNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FAFamilyNotifier delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[FAFamilyNotifier delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didActivateFamilyNotification:", v7);

  }
}

- (void)didDismissNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FAFamilyNotifier delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[FAFamilyNotifier delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDismissFamilyNotification:", v7);

  }
}

- (void)didClearNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FAFamilyNotifier delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[FAFamilyNotifier delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didClearFamilyNotification:", v7);

  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (FAFamilyNotificationDelegate)delegate
{
  return (FAFamilyNotificationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connLock, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
