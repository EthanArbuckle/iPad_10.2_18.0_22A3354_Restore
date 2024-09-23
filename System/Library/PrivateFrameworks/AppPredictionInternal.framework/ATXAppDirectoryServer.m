@implementation ATXAppDirectoryServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_31 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_31, &__block_literal_global_176);
  return (id)sharedInstance__pasExprOnceResult_41;
}

void __39__ATXAppDirectoryServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_41;
  sharedInstance__pasExprOnceResult_41 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXAppDirectoryServer)init
{
  ATXAppDirectoryServer *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  NSXPCListener *listener;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXAppDirectoryServer;
  v2 = -[ATXAppDirectoryServer init](&v9, sel_init);
  if (v2)
  {
    __atxlog_handle_app_library();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryServer launched", v8, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v5 = objc_msgSend(v4, "initWithMachServiceName:", *MEMORY[0x1E0CF92A8]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (void)categoriesWithReply:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoriesWithReply:", v3);

}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLaunchDatesWithReply:", v3);

}

- (void)notifyBookmarksDidChange
{
  id v2;

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyBookmarksDidChange");

}

- (void)requestNotificationWhenCategoriesAreReady
{
  id v2;

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestNotificationWhenCategoriesAreReady");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[16];

  v5 = a4;
  __atxlog_handle_app_library();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryServer connection attempted", v13, 2u);
  }

  v7 = *MEMORY[0x1E0CF92A8];
  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0CF92A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    ATXAppDirectoryInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v9);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_14_1);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_16);
    objc_msgSend(v5, "resume");
    v10 = 1;
  }
  else
  {
    __atxlog_handle_app_library();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v7, v11);

    v10 = 0;
  }

  return v10;
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_app_library();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_app_library();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_15_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXAppDirectoryServer: Rejecting connection %@ without entitlement %@", (uint8_t *)&v3, 0x16u);
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXAppDirectoryServer: Unexpected interruption on App Directory interface", a5, a6, a7, a8, 0);
}

void __60__ATXAppDirectoryServer_listener_shouldAcceptNewConnection___block_invoke_15_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXAppDirectoryServer: Connection invalidated on App Directory interface. Client went away.", a5, a6, a7, a8, 0);
}

@end
