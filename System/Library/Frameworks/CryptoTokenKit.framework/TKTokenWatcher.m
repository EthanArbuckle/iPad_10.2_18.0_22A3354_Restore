@implementation TKTokenWatcher

- (void)startWatching
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9768000, log, OS_LOG_TYPE_ERROR, "Failed to get TKTokenWatcher endpoint, watcher will be mute.", v1, 2u);
  OUTLINED_FUNCTION_8();
}

void __31__TKTokenWatcher_startWatching__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 2);
    *((_QWORD *)WeakRetained + 2) = 0;

    objc_msgSend(v2, "removeAllTokens");
  }
  TK_LOG_watcher();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __31__TKTokenWatcher_startWatching__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

}

void __31__TKTokenWatcher_startWatching__block_invoke_39(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TK_LOG_watcher();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __31__TKTokenWatcher_startWatching__block_invoke_39_cold_1((uint64_t)v2, v3);

}

void __31__TKTokenWatcher_startWatching__block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "firstObject", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
          objc_msgSend(v9, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = v13 == 0;

          if ((_DWORD)v11)
            objc_msgSend(*(id *)(a1 + 32), "insertedToken:", v9);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (TKTokenWatcher)initWithClient:(id)a3
{
  id v4;
  TKTokenWatcher *v5;
  TKClientToken *v6;
  TKClientToken *client;
  uint64_t v8;
  NSMutableDictionary *removalHandlers;
  uint64_t v10;
  NSMutableDictionary *tokenInfos;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TKTokenWatcher;
  v5 = -[TKTokenWatcher init](&v20, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (TKClientToken *)v4;
    else
      v6 = -[TKClientToken initWithTokenID:]([TKClientToken alloc], "initWithTokenID:", &stru_1E708AD68);
    client = v5->_client;
    v5->_client = v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    removalHandlers = v5->_removalHandlers;
    v5->_removalHandlers = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    tokenInfos = v5->_tokenInfos;
    v5->_tokenInfos = (NSMutableDictionary *)v10;

    -[TKTokenWatcher startWatching](v5, "startWatching");
    objc_initWeak(&location, v5);
    v12 = (const char *)objc_msgSend(CFSTR("com.apple.ctkd.watcher-started"), "UTF8String");
    v13 = dispatch_queue_create("server-start-notify-q", 0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __33__TKTokenWatcher_initWithClient___block_invoke;
    v17[3] = &unk_1E708A880;
    objc_copyWeak(&v18, &location);
    v14 = notify_register_dispatch(v12, &v5->_notifyToken, v13, v17);

    if (v14)
    {
      TK_LOG_watcher();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TKTokenWatcher initWithClient:].cold.1(v14, v15);

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __33__TKTokenWatcher_initWithClient___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startWatching");

}

- (TKTokenWatcher)init
{
  return -[TKTokenWatcher initWithClient:](self, "initWithClient:", 0);
}

- (TKTokenWatcher)initWithEndpoint:(id)a3
{
  id v4;
  TKClientToken *v5;
  TKTokenWatcher *v6;

  v4 = a3;
  v5 = -[TKClientToken initWithTokenID:serverEndpoint:targetUID:]([TKClientToken alloc], "initWithTokenID:serverEndpoint:targetUID:", &stru_1E708AD68, v4, 0);

  v6 = -[TKTokenWatcher initWithClient:](self, "initWithClient:", v5);
  return v6;
}

- (NSXPCListenerEndpoint)endpoint
{
  void *v2;
  void *v3;

  -[TKTokenWatcher client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TKTokenWatcher;
  -[TKTokenWatcher dealloc](&v3, sel_dealloc);
}

- (TKTokenWatcher)initWithInsertionHandler:(void *)insertionHandler
{
  void *v4;
  TKTokenWatcher *v5;
  TKTokenWatcher *v6;
  NSObject *v7;
  _QWORD v9[4];
  TKTokenWatcher *v10;
  id v11;

  v4 = insertionHandler;
  v5 = -[TKTokenWatcher init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[NSXPCConnection _queue](v5->_connection, "_queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__TKTokenWatcher_initWithInsertionHandler___block_invoke;
    v9[3] = &unk_1E70894A8;
    v10 = v6;
    v11 = v4;
    dispatch_async(v7, v9);

  }
  return v6;
}

uint64_t __43__TKTokenWatcher_initWithInsertionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInsertionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)setInsertionHandler:(void *)insertionHandler
{
  void *v4;
  TKTokenWatcher *v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = insertionHandler;
  v5 = self;
  objc_sync_enter(v5);
  v6 = MEMORY[0x1BCCC4AEC](v4);
  v7 = v5->_insertionHandler;
  v5->_insertionHandler = (id)v6;

  if (v5->_insertionHandler)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v5->_tokenInfos;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          (*((void (**)(id))v5->_insertionHandler + 2))(v5->_insertionHandler);
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  objc_sync_exit(v5);

}

- (void)addRemovalHandler:(void *)removalHandler forTokenID:(NSString *)tokenID
{
  NSString *v6;
  TKTokenWatcher *v7;
  void *v8;
  NSMutableDictionary *removalHandlers;
  void *v10;
  void (**v11)(id, NSString *);

  v11 = removalHandler;
  v6 = tokenID;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_tokenInfos, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    removalHandlers = v7->_removalHandlers;
    v10 = (void *)MEMORY[0x1BCCC4AEC](v11);
    -[NSMutableDictionary setObject:forKey:](removalHandlers, "setObject:forKey:", v10, v6);

  }
  else
  {
    v11[2](v11, v6);
  }
  objc_sync_exit(v7);

}

- (void)insertedToken:(id)a3
{
  TKTokenWatcher *v4;
  TKTokenWatcherTokenInfo *v5;
  void *v6;
  NSMutableDictionary *tokenInfos;
  void *v8;
  void *v9;
  void (**insertionHandler)(id, void *);
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[TKTokenWatcherTokenInfo initWithTokenInfo:]([TKTokenWatcherTokenInfo alloc], "initWithTokenInfo:", v12);
  NSStringFromSelector(sel_tokenIDs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenWatcher willChangeValueForKey:](v4, "willChangeValueForKey:", v6);

  tokenInfos = v4->_tokenInfos;
  -[TKTokenWatcherTokenInfo tokenID](v5, "tokenID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](tokenInfos, "setObject:forKeyedSubscript:", v5, v8);

  NSStringFromSelector(sel_tokenIDs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenWatcher didChangeValueForKey:](v4, "didChangeValueForKey:", v9);

  insertionHandler = (void (**)(id, void *))v4->_insertionHandler;
  if (insertionHandler)
  {
    -[TKTokenWatcherTokenInfo tokenID](v5, "tokenID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    insertionHandler[2](insertionHandler, v11);

  }
  objc_sync_exit(v4);

}

- (void)removedToken:(id)a3
{
  TKTokenWatcher *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_tokenInfos, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    NSStringFromSelector(sel_tokenIDs);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenWatcher willChangeValueForKey:](v4, "willChangeValueForKey:", v6);

    -[NSMutableDictionary removeObjectForKey:](v4->_tokenInfos, "removeObjectForKey:", v10);
    NSStringFromSelector(sel_tokenIDs);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenWatcher didChangeValueForKey:](v4, "didChangeValueForKey:", v7);

    -[NSMutableDictionary objectForKey:](v4->_removalHandlers, "objectForKey:", v10);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
      -[NSMutableDictionary removeObjectForKey:](v4->_removalHandlers, "removeObjectForKey:", v10);
    }

  }
  objc_sync_exit(v4);

}

- (void)removeAllTokens
{
  OUTLINED_FUNCTION_3(&dword_1B9768000, a1, a3, "all tokens removed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (NSArray)tokenIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_tokenInfos, "allKeys");
}

- (TKTokenWatcherTokenInfo)tokenInfoForTokenID:(NSString *)tokenID
{
  NSString *v4;
  TKTokenWatcher *v5;
  void *v6;

  v4 = tokenID;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_tokenInfos, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return (TKTokenWatcherTokenInfo *)v6;
}

- (TKClientToken)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_insertionHandler, 0);
  objc_storeStrong((id *)&self->_removalHandlers, 0);
  objc_storeStrong((id *)&self->_tokenInfos, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __31__TKTokenWatcher_startWatching__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B9768000, a1, a3, "connection to the watcher endpoint invalidated/interrupted!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __31__TKTokenWatcher_startWatching__block_invoke_39_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "failed to register TKTokenWatcher, error %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithClient:(int)a1 .cold.1(int a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("com.apple.ctkd.watcher-started");
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "registering notification '%@' failed with status %u", (uint8_t *)&v2, 0x12u);
}

@end
