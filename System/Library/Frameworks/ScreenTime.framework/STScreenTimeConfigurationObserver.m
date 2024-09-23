@implementation STScreenTimeConfigurationObserver

- (STScreenTimeConfigurationObserver)initWithUpdateQueue:(dispatch_queue_t)updateQueue
{
  NSObject *v3;
  STScreenTimeConfigurationObserver *v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcConnection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STScreenTimeConfigurationObserver;
  v3 = updateQueue;
  v4 = -[STScreenTimeConfigurationObserver init](&v8, sel_init);
  v5 = +[STScreenTimeAgentConnection newConnection](STScreenTimeAgentConnection, "newConnection", v8.receiver, v8.super_class);
  xpcConnection = v4->_xpcConnection;
  v4->_xpcConnection = v5;

  -[NSXPCConnection _setQueue:](v4->_xpcConnection, "_setQueue:", v3);
  -[NSXPCConnection resume](v4->_xpcConnection, "resume");
  v4->_notificationToken = -1;
  return v4;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1(&dword_218A7F000, MEMORY[0x24BDACB70], a3, "Failed to cancel darwin notification, %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)startObserving
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl(&dword_218A7F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to register darwin notification %@, %u", buf, 0x12u);

}

void __51__STScreenTimeConfigurationObserver_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestConfiguration");

}

- (void)_requestConfiguration
{
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], a3, "Failed to retrieve ScreenTime Configuration %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_updateWithConfiguration:", v5);
    else
      objc_msgSend(v8, "setConfiguration:", v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_37;
    v14[3] = &unk_24D996C88;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "requestConfigurationWithReplyHandler:", v14);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_updateWithConfiguration:", v5);
    else
      objc_msgSend(v8, "setConfiguration:", v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)_updateWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[STScreenTimeConfigurationObserver configuration](self, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enforcesChildRestrictions");

  if ((_DWORD)v5 != objc_msgSend(v6, "enforcesChildRestrictions"))
    objc_msgSend(v6, "setEnforcesChildRestrictions:", v5);

}

- (void)stopObserving
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[STScreenTimeConfigurationObserver notificationToken](self, "notificationToken");
  if (v3 != -1)
  {
    v4 = notify_cancel(v3);
    if ((_DWORD)v4)
    {
      v5 = v4;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[STScreenTimeConfigurationObserver dealloc].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    -[STScreenTimeConfigurationObserver setNotificationToken:](self, "setNotificationToken:", 0xFFFFFFFFLL);
  }
}

- (STScreenTimeConfiguration)configuration
{
  return (STScreenTimeConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], a3, "Failed to retrieve Screen Time configuration %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
