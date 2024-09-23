@implementation ATXSuggestedPagesServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_11 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_11, &__block_literal_global_85);
  return (id)sharedInstance__pasExprOnceResult_14;
}

void __41__ATXSuggestedPagesServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_14;
  sharedInstance__pasExprOnceResult_14 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXSuggestedPagesServer)init
{
  ATXSuggestedPagesServer *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCListener *listener;
  uint64_t v6;
  _ATXInternalUninstallNotification *uninstallNotification;
  uint64_t v8;
  ATXInternalLockedOrHiddenAppNotification *lockedOrHiddenAppNotification;
  uint64_t v10;
  ATXInternalUnLockedOrUnHiddenAppNotification *unlockedOrUnhiddenAppNotification;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXSuggestedPagesServer;
  v2 = -[ATXSuggestedPagesServer init](&v14, sel_init);
  if (v2)
  {
    __atxlog_handle_modes();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: launched", v13, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.SuggestedPages"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v6 = objc_opt_new();
    uninstallNotification = v2->_uninstallNotification;
    v2->_uninstallNotification = (_ATXInternalUninstallNotification *)v6;

    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v2->_uninstallNotification, "registerForNotificationsWithUninstallBlock:", &__block_literal_global_13_0);
    v8 = objc_opt_new();
    lockedOrHiddenAppNotification = v2->_lockedOrHiddenAppNotification;
    v2->_lockedOrHiddenAppNotification = (ATXInternalLockedOrHiddenAppNotification *)v8;

    -[ATXInternalLockedOrHiddenAppNotification registerForNotificationsWithLockedOrHiddenAppBlock:](v2->_lockedOrHiddenAppNotification, "registerForNotificationsWithLockedOrHiddenAppBlock:", &__block_literal_global_17_0);
    v10 = objc_opt_new();
    unlockedOrUnhiddenAppNotification = v2->_unlockedOrUnhiddenAppNotification;
    v2->_unlockedOrUnhiddenAppNotification = (ATXInternalUnLockedOrUnHiddenAppNotification *)v10;

    -[ATXInternalUnLockedOrUnHiddenAppNotification registerForNotificationsWithUnLockedOrUnHiddenAppBlock:](v2->_unlockedOrUnhiddenAppNotification, "registerForNotificationsWithUnLockedOrUnHiddenAppBlock:", &__block_literal_global_20);
  }
  return v2;
}

void __31__ATXSuggestedPagesServer_init__block_invoke()
{
  id v0;

  v0 = (id)objc_opt_new();
  objc_msgSend(v0, "evictCachedSuggestedPages");

}

void __31__ATXSuggestedPagesServer_init__block_invoke_2()
{
  id v0;

  v0 = (id)objc_opt_new();
  objc_msgSend(v0, "evictCachedSuggestedPages");

}

void __31__ATXSuggestedPagesServer_init__block_invoke_3()
{
  id v0;

  v0 = (id)objc_opt_new();
  objc_msgSend(v0, "evictCachedSuggestedPages");

}

- (void)suggestedPagesWithFilter:(id)a3 layoutOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  if (objc_msgSend(v8, "pageType") == 2 || !objc_msgSend(v8, "pageType"))
  {
    objc_msgSend(v8, "modeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_10:
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
      goto LABEL_11;
    }
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: looking up mode type via DND", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v8, "modeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ATXSuggestedPagesServer _fetchPageTypeForModeUUID:](self, "_fetchPageTypeForModeUUID:", v15);

  }
  else
  {
    v12 = objc_msgSend(v8, "pageType");
  }
  if (v12 < 4 || v12 == 12)
    goto LABEL_10;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "cachedSuggestedPagesForPageType:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  __atxlog_handle_modes();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      NSStringFromATXSuggestedPageType();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: using cached pages for page type: %{public}@", (uint8_t *)&v25, 0xCu);

    }
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v17, 0);
  }
  else
  {
    if (v20)
    {
      NSStringFromATXSuggestedPageType();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: generating pages for page type: %{public}@", (uint8_t *)&v25, 0xCu);

    }
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "generateSuggestedPagesForPageType:layoutOptions:", v12, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cacheSuggestedPages:forPageType:", v24, v12);
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v24, 0);

  }
LABEL_11:

}

- (void)updateSuggestedPagesWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[ATXSuggestedPagesServer prewarmCachedSuggestedPagesWithActivity:](self, "prewarmCachedSuggestedPagesWithActivity:", 0);
  v4[2](v4, 0);

}

- (void)prewarmCachedSuggestedPagesWithActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)os_transaction_create();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = 4;
  while (1)
  {
    v9 = (void *)MEMORY[0x1CAA48B6C]();
    if (objc_msgSend(v3, "didDefer"))
      break;
    objc_msgSend(v5, "generateSuggestedPagesForPageType:layoutOptions:", v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheSuggestedPages:forPageType:", v10, v8);

    objc_autoreleasePoolPop(v9);
    if (++v8 == 13)
      goto LABEL_8;
  }
  __atxlog_handle_modes();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v8;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Deferred caching suggested pages before processing: %ld", (uint8_t *)&v12, 0xCu);
  }

  objc_autoreleasePoolPop(v9);
LABEL_8:

}

- (int64_t)_fetchPageTypeForModeUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;

  v3 = (void *)MEMORY[0x1E0CF8D60];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);

  objc_msgSend(v5, "dndModeForDNDModeWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v7, "semanticType");
  if ((unint64_t)(v8 + 1) >= 0xB)
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXSuggestedPagesServer _fetchPageTypeForModeUUID:].cold.1(v7, v10);

    goto LABEL_7;
  }
  v9 = v8 + 3;
LABEL_8:

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v12[16];

  v5 = a4;
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesServer: connection attempted", v12, 2u);
  }

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.proactive.SuggestedPages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    ATXSuggestedPagesInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_29_0);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_31);
    objc_msgSend(v5, "resume");
    v9 = 1;
  }
  else
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXSuggestedPagesServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v10);

    v9 = 0;
  }

  return v9;
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_30_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedOrUnhiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_lockedOrHiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_fetchPageTypeForModeUUID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "semanticType");
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "fetchPageTypeForModeUUID: unhandled type: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = CFSTR("com.apple.proactive.SuggestedPages");
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesServer: rejecting connection %@ without entitlement %@", (uint8_t *)&v2, 0x16u);
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXSuggestedPagesServer: interruption", a5, a6, a7, a8, 0);
}

void __62__ATXSuggestedPagesServer_listener_shouldAcceptNewConnection___block_invoke_30_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXSuggestedPagesServer: invalidated", a5, a6, a7, a8, 0);
}

@end
