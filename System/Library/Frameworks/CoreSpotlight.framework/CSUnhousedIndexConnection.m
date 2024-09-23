@implementation CSUnhousedIndexConnection

+ (id)connectionUUID:(id)a3
{
  return 0;
}

+ (id)serviceName
{
  return 0;
}

+ (id)unhousedIndexConnectionForToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[CSUnhousedIndexConnection unhousedIndexConnectionForToken:].cold.1();

  if (unhousedIndexConnectionForToken__onceToken != -1)
    dispatch_once(&unhousedIndexConnectionForToken__onceToken, &__block_literal_global_574);
  v6 = (id)sUnhousedConnections;
  objc_sync_enter(v6);
  objc_msgSend((id)sUnhousedConnections, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(a1, "connectionUUID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_18C42F000, v9, OS_LOG_TYPE_DEFAULT, "CSUnhousedIndexConnection uuid: %@", (uint8_t *)&v13, 0xCu);
    }

    v10 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(a1, "serviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v10, "initWithServiceName:machService:uuid:", v11, 1, v8);

    objc_msgSend((id)sUnhousedConnections, "setObject:forKey:", v7, v4);
  }
  objc_sync_exit(v6);

  return v7;
}

void __61__CSUnhousedIndexConnection_unhousedIndexConnectionForToken___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sUnhousedConnections;
  sUnhousedConnections = v0;

}

+ (void)removeUnhousedIndexConnectionForToken:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)sUnhousedConnections;
  objc_sync_enter(v3);
  objc_msgSend((id)sUnhousedConnections, "removeObjectForKey:", v4);
  objc_sync_exit(v3);

}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  objc_super v8;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (xpc_dictionary_get_int64(v6, "ee"))
  {
    v7[2](v7, 0);
  }
  else if (xpc_dictionary_get_int64(v6, "re"))
  {
    ((void (**)(id, id))v7)[2](v7, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSUnhousedIndexConnection;
    -[CSIndexConnection sendMessageAsync:completion:](&v8, sel_sendMessageAsync_completion_, v6, v7);
  }

}

+ (void)unhousedIndexConnectionForToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, v0, v1, "~~~ Finding unhousedIndexConnectionForToken: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
