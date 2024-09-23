@implementation CCSetChangeRelayServer

- (CCSetChangeRelayServer)initWithQueue:(id)a3
{
  id v4;
  CCSetChangeRelayServer *v5;
  uint64_t v6;
  CCSetChangeXPCNotifier *setChangeNotifier;
  uint64_t v8;
  BMXPCListener *listener;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCSetChangeRelayServer;
  v5 = -[CCSetChangeRelayServer init](&v11, sel_init);
  if (v5)
  {
    +[CCSetChangeXPCNotifier sharedInstance](CCSetChangeXPCNotifier, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    setChangeNotifier = v5->_setChangeNotifier;
    v5->_setChangeNotifier = (CCSetChangeXPCNotifier *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE0C0C8]), "initWithMachServiceName:queue:", CFSTR("com.apple.cascade.SetChangeRelayService"), v4);
    listener = v5->_listener;
    v5->_listener = (BMXPCListener *)v8;

    -[BMXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
  }

  return v5;
}

- (void)activate
{
  NSObject *v3;
  BMXPCListener *listener;
  int v5;
  BMXPCListener *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[BMXPCListener activate](self->_listener, "activate");
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    listener = self->_listener;
    v5 = 138412290;
    v6 = listener;
    _os_log_impl(&dword_237B25000, v3, OS_LOG_TYPE_DEFAULT, "CCSetChangeRelayServer activated with listener: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CCSetChangeRelayServer listener:shouldAcceptNewConnection:].cold.2(v6, v7);

  v8 = objc_msgSend(v6, "processType");
  if (v8 == 5)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25687B388);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_notifyChangeToSet_completion_, 0, 0);
    objc_msgSend(v5, "setExportedInterface:", v9);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");

  }
  else
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CCSetChangeRelayServer listener:shouldAcceptNewConnection:].cold.1(v6, v10);

    objc_msgSend(v5, "invalidate");
  }

  return v8 == 5;
}

- (void)notifyChangeToSet:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CCSetChangeRelayServer notifyChangeToSet:completion:].cold.1((uint64_t)v6, v8);

  -[CCSetChangeXPCNotifier notifyChangeToSet:](self->_setChangeNotifier, "notifyChangeToSet:", v6);
  v7[2](v7, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setChangeNotifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "CCSetChangeRelayServer refusing connection from %{public}@(%d), process is not SetStoreUpdateService", v4, 0x12u);

  OUTLINED_FUNCTION_0_4();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "CCSetChangeRelayServer received new connection request from %@(%d)", v4, 0x12u);

  OUTLINED_FUNCTION_0_4();
}

- (void)notifyChangeToSet:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "CCSetChangeRelayServer notifying change to Set: %@", (uint8_t *)&v2, 0xCu);
}

@end
