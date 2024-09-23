@implementation CCDaemon

- (CCDaemon)initWithQueue:(id)a3
{
  id v5;
  CCDaemon *v6;
  CCDaemon *v7;
  CCSetChangeRelayServer *v8;
  CCSetChangeRelayServer *relayServer;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCDaemon;
  v6 = -[CCDaemon init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[CCSetChangeRelayServer initWithQueue:]([CCSetChangeRelayServer alloc], "initWithQueue:", v5);
    relayServer = v7->_relayServer;
    v7->_relayServer = v8;

  }
  -[CCSetChangeRelayServer activate](v7->_relayServer, "activate");
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_237B25000, v10, OS_LOG_TYPE_DEFAULT, "Initialized CCDaemon", v12, 2u);
  }

  return v7;
}

+ (void)registerXPCActivities
{
  xpc_activity_register("com.apple.cascade.database-maintenance", (xpc_object_t)*MEMORY[0x24BDAC5A0], &__block_literal_global_0);
}

void __33__CCDaemon_registerXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_237B25000, v3, OS_LOG_TYPE_DEFAULT, "running activity \"com.apple.cascade.database-maintenance\", v5, 2u);
    }

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C0C0]), "initWithActivity:activityName:", v2, CFSTR("com.apple.cascade.database-maintenance"));
    +[CCAdminXPCClient triggerMaintenanceActivity:completion:](CCAdminXPCClient, "triggerMaintenanceActivity:completion:", v4, &__block_literal_global_7);

  }
}

void __33__CCDaemon_registerXPCActivities__block_invoke_5()
{
  NSObject *v0;
  uint8_t v1[16];

  __biome_log_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_237B25000, v0, OS_LOG_TYPE_DEFAULT, "finished running activity \"com.apple.cascade.database-maintenance\", v1, 2u);
  }

}

+ (void)resetRootDirectoryIfNecessary
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, a3, "Cannot invoke resetRootDirectoryIfNecessary from non-primary daemon: %@", (uint8_t *)&v3);
}

void __41__CCDaemon_resetRootDirectoryIfNecessary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __biome_log_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_237B25000, v0, OS_LOG_TYPE_DEFAULT, "Finished removing the root directory", v1, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
