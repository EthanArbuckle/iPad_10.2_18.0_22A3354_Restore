@implementation TKTokenConfigurationConnection

- (TKTokenConfigurationConnection)initWithEndpoint:(id)a3
{
  id v5;
  TKTokenConfigurationConnection *v6;
  TKTokenConfigurationConnection *v7;
  uint64_t v8;
  NSHashTable *configurationConnections;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TKTokenConfigurationConnection;
  v6 = -[TKTokenConfigurationConnection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    configurationConnections = v7->_configurationConnections;
    v7->_configurationConnections = (NSHashTable *)v8;

  }
  return v7;
}

- (id)configurationProtocol
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  TKTokenConfigurationConnectionProxy *v8;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_endpoint);
    v5 = self->_connection;
    self->_connection = v4;

    +[TKTokenConfiguration interfaceForProtocol](TKTokenConfiguration, "interfaceForProtocol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    +[TKTokenConfiguration interfaceForChangeProtocol](TKTokenConfiguration, "interfaceForChangeProtocol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v7);

    v8 = -[TKTokenConfigurationConnectionProxy initWithConnection:]([TKTokenConfigurationConnectionProxy alloc], "initWithConnection:", self);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v8);

    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
}

void __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TK_LOG_tokencfg();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)registerForConfigurationChange:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_configurationConnections;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_configurationConnections, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TKTokenConfigurationConnection;
  -[TKTokenConfigurationConnection dealloc](&v3, sel_dealloc);
}

- (void)tokenConfigurationChanged:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_configurationConnections;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_configurationConnections;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "tokenConfigurationChanged:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationConnections, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "Failed to send configuration request: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
