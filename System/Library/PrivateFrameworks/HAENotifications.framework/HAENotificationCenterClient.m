@implementation HAENotificationCenterClient

- (HAENotificationCenterClient)initWithBundleID:(id)a3
{
  id v4;
  HAENotificationCenterClient *v5;
  HAENotificationCenterClient *v6;
  uint64_t v7;
  NSXPCConnection *connection;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAENotificationCenterClient;
  v5 = -[HAENotificationCenterClient init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HAENotificationCenterClient setupConnection](v5, "setupConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    connection = v6->connection;
    v6->connection = (NSXPCConnection *)v7;

    -[HAENotificationCenterClient setBundleID:](v6, "setBundleID:", v4);
  }

  return v6;
}

- (void)addHAENotificationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *bundleID;
  void *v7;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->bundleID;
    v8 = 138412546;
    v9 = bundleID;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "Sending event from client %@, %@", (uint8_t *)&v8, 0x16u);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addHAENotificationEvent:", v4);

}

void __55__HAENotificationCenterClient_addHAENotificationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  HAENotificationsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__HAENotificationCenterClient_addHAENotificationEvent___block_invoke_cold_1((uint64_t)v2, v3);

}

- (id)setupConnection
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.coreaudio.adam.hae.notification"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D7A1D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_initWeak(&location, self);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_48);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __46__HAENotificationCenterClient_setupConnection__block_invoke_49;
  v9 = &unk_24D19F448;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  self->connectionDidInvalidate = 0;
  objc_msgSend(v3, "resume", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  HAENotificationsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __46__HAENotificationCenterClient_setupConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_49(uint64_t a1)
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
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  HAENotificationsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __46__HAENotificationCenterClient_setupConnection__block_invoke_49_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 16) = 1;
  }
  else
  {
    HAENotificationsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __46__HAENotificationCenterClient_setupConnection__block_invoke_49_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

void __55__HAENotificationCenterClient_addHAENotificationEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[HAENotificationCenterClient addHAENotificationEvent:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2144B3000, a2, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v2, 0x16u);
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2144B3000, a1, a3, "Connection to HAENotifications.framework interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_49_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2144B3000, a1, a3, "Client to HAENotifications.framework has been deallocated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_49_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2144B3000, a1, a3, "Connection to HAENotifications.framework invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
