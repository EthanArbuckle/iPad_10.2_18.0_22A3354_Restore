@implementation AKURLSession

+ (id)_createURLSessionUsesAppleIDContext:(BOOL)a3
{
  _BOOL8 v3;
  AKURLSession *v4;

  v3 = a3;
  v4 = objc_alloc_init(AKURLSession);
  -[AKURLSession set_usesAppleIDContext:](v4, "set_usesAppleIDContext:", v3);
  return v4;
}

+ (id)sharedURLSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AKURLSession_sharedURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedURLSession_onceToken != -1)
    dispatch_once(&sharedURLSession_onceToken, block);
  return (id)sharedURLSession_sharedURLSession;
}

void __32__AKURLSession_sharedURLSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionUsesAppleIDContext:", 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedURLSession_sharedURLSession;
  sharedURLSession_sharedURLSession = v1;

}

+ (id)sharedAnisetteFreeURLSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AKURLSession_sharedAnisetteFreeURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAnisetteFreeURLSession_onceToken != -1)
    dispatch_once(&sharedAnisetteFreeURLSession_onceToken, block);
  return (id)sharedAnisetteFreeURLSession_sharedAnisetteFreeURLSession;
}

void __44__AKURLSession_sharedAnisetteFreeURLSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionUsesAppleIDContext:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedAnisetteFreeURLSession_sharedAnisetteFreeURLSession;
  sharedAnisetteFreeURLSession_sharedAnisetteFreeURLSession = v1;

}

+ (id)sharedCacheEnabledURLSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AKURLSession_sharedCacheEnabledURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCacheEnabledURLSession_onceToken != -1)
    dispatch_once(&sharedCacheEnabledURLSession_onceToken, block);
  return (id)sharedCacheEnabledURLSession_session;
}

void __44__AKURLSession_sharedCacheEnabledURLSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  AKAppleIDSession *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionUsesAppleIDContext:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedCacheEnabledURLSession_session;
  sharedCacheEnabledURLSession_session = v2;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_urlBagCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURLCache:", v4);

  objc_msgSend(v8, "setWaitsForConnectivity:", 1);
  objc_msgSend(v8, "setTimeoutIntervalForResource:", 60.0);
  v5 = -[AKAppleIDSession initWithIdentifier:]([AKAppleIDSession alloc], "initWithIdentifier:", CFSTR("AuthKitURLSession"));
  objc_msgSend(v8, "set_appleIDContext:", v5);

  objc_msgSend((id)sharedCacheEnabledURLSession_session, "defaultSessionObjectWithConfiguration:", v8);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(sharedCacheEnabledURLSession_session + 8);
  *(_QWORD *)(sharedCacheEnabledURLSession_session + 8) = v6;

}

+ (id)sharedURLSessionWithDenyVirtualInterfaces
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedURLSessionWithDenyVirtualInterfaces_onceToken != -1)
    dispatch_once(&sharedURLSessionWithDenyVirtualInterfaces_onceToken, block);
  return (id)sharedURLSessionWithDenyVirtualInterfaces_session;
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  AKAppleIDSession *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_3();

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionUsesAppleIDContext:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sharedURLSessionWithDenyVirtualInterfaces_session;
  sharedURLSessionWithDenyVirtualInterfaces_session = v3;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWaitsForConnectivity:", 1);
  objc_msgSend(v5, "setTimeoutIntervalForResource:", 60.0);
  v6 = -[AKAppleIDSession initWithIdentifier:]([AKAppleIDSession alloc], "initWithIdentifier:", CFSTR("AuthKitURLSession"));
  objc_msgSend(v5, "set_appleIDContext:", v6);

  v7 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_1();

    objc_msgSend(v5, "set_allowsVirtualInterfaces:", 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_2();

  }
  objc_msgSend((id)sharedURLSessionWithDenyVirtualInterfaces_session, "defaultSessionObjectWithConfiguration:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(sharedURLSessionWithDenyVirtualInterfaces_session + 8);
  *(_QWORD *)(sharedURLSessionWithDenyVirtualInterfaces_session + 8) = v10;

}

+ (id)sharedCacheEnabledAnisetteFreeSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AKURLSession_sharedCacheEnabledAnisetteFreeSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCacheEnabledAnisetteFreeSession_onceToken != -1)
    dispatch_once(&sharedCacheEnabledAnisetteFreeSession_onceToken, block);
  return (id)sharedCacheEnabledAnisetteFreeSession_session;
}

void __53__AKURLSession_sharedCacheEnabledAnisetteFreeSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionUsesAppleIDContext:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedCacheEnabledAnisetteFreeSession_session;
  sharedCacheEnabledAnisetteFreeSession_session = v2;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_urlBagCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURLCache:", v4);

  objc_msgSend(v7, "setWaitsForConnectivity:", 1);
  objc_msgSend(v7, "setTimeoutIntervalForResource:", 60.0);
  objc_msgSend((id)sharedCacheEnabledAnisetteFreeSession_session, "defaultSessionObjectWithConfiguration:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(sharedCacheEnabledAnisetteFreeSession_session + 8);
  *(_QWORD *)(sharedCacheEnabledAnisetteFreeSession_session + 8) = v5;

}

+ (id)sharedCacheReliantAnisetteFreeSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AKURLSession_sharedCacheReliantAnisetteFreeSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCacheReliantAnisetteFreeSession_onceToken != -1)
    dispatch_once(&sharedCacheReliantAnisetteFreeSession_onceToken, block);
  return (id)sharedCacheReliantAnisetteFreeSession_session;
}

void __53__AKURLSession_sharedCacheReliantAnisetteFreeSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionUsesAppleIDContext:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedCacheReliantAnisetteFreeSession_session;
  sharedCacheReliantAnisetteFreeSession_session = v2;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_urlBagCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURLCache:", v4);

  objc_msgSend(v7, "setWaitsForConnectivity:", 0);
  objc_msgSend(v7, "setRequestCachePolicy:", 3);
  objc_msgSend((id)sharedCacheReliantAnisetteFreeSession_session, "defaultSessionObjectWithConfiguration:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(sharedCacheReliantAnisetteFreeSession_session + 8);
  *(_QWORD *)(sharedCacheReliantAnisetteFreeSession_session + 8) = v5;

}

+ (id)_urlBagCache
{
  if (_urlBagCache_onceToken != -1)
    dispatch_once(&_urlBagCache_onceToken, &__block_literal_global_5);
  return (id)_urlBagCache_cache;
}

void __28__AKURLSession__urlBagCache__block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[AKDevice systemContainerCacheURL](AKDevice, "systemContainerCacheURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v0;
    _os_log_impl(&dword_19202F000, v1, OS_LOG_TYPE_DEFAULT, "Initializing URL cache at URL: %@", (uint8_t *)&v4, 0xCu);
  }

  if (v0)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C50]), "initWithMemoryCapacity:diskCapacity:directoryURL:", 512000, 10000000, v0);
    v3 = _urlBagCache_cache;
    _urlBagCache_cache = v2;
  }
  else
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __28__AKURLSession__urlBagCache__block_invoke_cold_1();
  }

}

+ (void)removeAllCachedResponses
{
  id v2;

  objc_msgSend(a1, "_urlBagCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllCachedResponses");

}

- (AKURLSession)init
{
  AKURLSession *v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *tasksByIdentifier;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *sessionQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AKURLSession;
  v2 = -[AKURLSession init](&v10, sel_init);
  if (v2)
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[AKURLSession init].cold.1();

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tasksByIdentifier = v2->_tasksByIdentifier;
    v2->_tasksByIdentifier = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.authkit.url", v6);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSURLSession *urlSession;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AKURLSession URLSession:didBecomeInvalidWithError:].cold.1();

  -[NSMutableDictionary allValues](self->_tasksByIdentifier, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Calling all pending completions.", buf, 2u);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[AKURLSession _unsafe_completeTask:withError:](self, "_unsafe_completeTask:withError:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v5, (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
  urlSession = self->_urlSession;
  self->_urlSession = 0;

}

- (id)_URLSession
{
  NSURLSession *urlSession;
  NSObject *v4;
  void *v5;
  AKAppleIDSession *v6;
  NSURLSession *v7;
  NSURLSession *v8;
  uint8_t v10[16];

  urlSession = self->_urlSession;
  if (!urlSession)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Creating new NSURLSession with default config...", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWaitsForConnectivity:", 1);
    objc_msgSend(v5, "setTimeoutIntervalForResource:", 60.0);
    if (-[AKURLSession _usesAppleIDContext](self, "_usesAppleIDContext"))
    {
      v6 = -[AKAppleIDSession initWithIdentifier:]([AKAppleIDSession alloc], "initWithIdentifier:", CFSTR("AuthKitURLSession"));
      objc_msgSend(v5, "set_appleIDContext:", v6);

    }
    -[AKURLSession defaultSessionObjectWithConfiguration:](self, "defaultSessionObjectWithConfiguration:", v5);
    v7 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v8 = self->_urlSession;
    self->_urlSession = v7;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (id)defaultSessionObjectWithConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3828];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v6, "setUnderlyingQueue:", self->_sessionQueue);
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)beginDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AKURLDataTask *v9;
  NSObject *sessionQueue;
  AKURLDataTask *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  AKURLSession *v18;
  AKURLDataTask *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_alloc_init(AKURLDataTask);
    sessionQueue = self->_sessionQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__AKURLSession_beginDataTaskWithRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E2E5EC00;
    v17 = v6;
    v18 = self;
    v11 = v9;
    v19 = v11;
    v20 = v8;
    dispatch_async(sessionQueue, v16);
    v12 = v20;
    v13 = v11;

    v14 = v13;
  }
  else
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKURLSession beginDataTaskWithRequest:completionHandler:].cold.1((uint64_t)v6, (uint64_t)v8, v13);
    v14 = 0;
  }

  return v14;
}

void __59__AKURLSession_beginDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_URLSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTaskWithRequest:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Creating task %{public}@ for request at URL: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "setRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "setRetryCount:", 0);
  objc_msgSend(*(id *)(a1 + 48), "setCompletionHandler:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "setUnderlyingTask:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "taskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 48), v7);
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Resuming task %{public}@ for URL %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "resume");
}

- (void)cancelDataTask:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AKURLSession *v9;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__AKURLSession_cancelDataTask___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

void __31__AKURLSession_cancelDataTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __31__AKURLSession_cancelDataTask___block_invoke_cold_1(a1, v2);

  if ((objc_msgSend(*(id *)(a1 + 32), "canceledOrCompleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "underlyingTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "state"))
    {
      if (objc_msgSend(v3, "state") == 3)
      {
        v6 = a1 + 32;
        v4 = *(void **)(a1 + 32);
        v5 = *(void **)(v6 + 8);
        objc_msgSend(v4, "lastRetryError");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_unsafe_completeTask:withError:", v4, v7);

      }
    }
    else
    {
      objc_msgSend(v3, "cancel");
    }

  }
}

- (void)_unsafe_completeTask:(id)a3 withError:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "underlyingTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](self->_tasksByIdentifier, "removeObjectForKey:", v10);
  objc_msgSend(v8, "_completeWithError:", v7);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_tasksByIdentifier, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receivedData");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      objc_msgSend(v10, "setReceivedData:", v11);
    }
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AKURLSession URLSession:dataTask:didReceiveData:].cold.2();

    objc_msgSend(v11, "appendData:", v8);
  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKURLSession URLSession:dataTask:didReceiveData:].cold.1();
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Task %{public}@ completed! Error: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_tasksByIdentifier, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || !-[AKURLSession isRecoverableError:](self, "isRecoverableError:", v8))
    goto LABEL_8;
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Error is recoverable. Checking if retry is possible.", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(v11, "setLastRetryError:", v8);
  if (!-[AKURLSession _unsafe_retryTaskIfPossible:](self, "_unsafe_retryTaskIfPossible:", v11))
LABEL_8:
    -[AKURLSession _unsafe_completeTask:withError:](self, "_unsafe_completeTask:withError:", v11, v8);

}

- (BOOL)isRecoverableError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v5)
    v6 = objc_msgSend(v3, "code") == -997
      || objc_msgSend(v3, "code") == -1005
      || objc_msgSend(v3, "code") == -1001
      || objc_msgSend(v3, "code") == -1009;
  else
    v6 = 0;

  return v6;
}

- (BOOL)_unsafe_retryTaskIfPossible:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *sessionQueue;
  BOOL v15;
  NSObject *v16;
  _QWORD v18[4];
  NSObject *v19;
  AKURLSession *v20;
  id v21;
  unint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_unsafe_retryTaskIfPossible__onceToken != -1)
    dispatch_once(&_unsafe_retryTaskIfPossible__onceToken, &__block_literal_global_86);
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AKURLSession _unsafe_retryTaskIfPossible:].cold.1();
    goto LABEL_14;
  }
  v6 = objc_msgSend(v4, "retryCount");
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "This request has been retried %@ times.", buf, 0xCu);

  }
  if (v6 >= objc_msgSend((id)_unsafe_retryTaskIfPossible__retryIntervals, "count"))
  {
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AKURLSession _unsafe_retryTaskIfPossible:].cold.2();
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend((id)_unsafe_retryTaskIfPossible__retryIntervals, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)objc_msgSend(v9, "integerValue");

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Will retry in %@ second(s)...", buf, 0xCu);

  }
  v13 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  sessionQueue = self->_sessionQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__AKURLSession__unsafe_retryTaskIfPossible___block_invoke_89;
  v18[3] = &unk_1E2E5EC70;
  v19 = v4;
  v20 = self;
  v21 = v5;
  v22 = v6;
  dispatch_after(v13, sessionQueue, v18);

  v15 = 1;
  v16 = v19;
LABEL_15:

  return v15;
}

void __44__AKURLSession__unsafe_retryTaskIfPossible___block_invoke()
{
  void *v0;

  v0 = (void *)_unsafe_retryTaskIfPossible__retryIntervals;
  _unsafe_retryTaskIfPossible__retryIntervals = (uint64_t)&unk_1E2E9A5B0;

}

void __44__AKURLSession__unsafe_retryTaskIfPossible___block_invoke_89(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "canceledOrCompleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "underlyingTask");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v3);
    objc_msgSend(*(id *)(a1 + 40), "_URLSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataTaskWithRequest:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "taskIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUnderlyingTask:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 32), v6);
    v7 = *(_QWORD *)(a1 + 56) + 1;
    objc_msgSend(*(id *)(a1 + 32), "setRetryCount:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setReceivedData:", 0);
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Retry attempt #%@: resuming task %{public}@...", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v5, "resume");

  }
}

- (id)beginAuthenticationDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke;
  v12[3] = &unk_1E2E5EC98;
  v13 = v6;
  v14 = &v15;
  v7 = v6;
  -[AKURLSession beginDataTaskWithRequest:completionHandler:](self, "beginDataTaskWithRequest:completionHandler:", a3, v12);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v16[5];
  v16[5] = v8;

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v16 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_msgSend(v16, "statusCode");
      _AKLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v19;
        v35 = 2114;
        v36 = v20;
        _os_log_impl(&dword_19202F000, v18, OS_LOG_TYPE_DEFAULT, "Task %{public}@ Request completed with HTTP status code: %{public}@", (uint8_t *)&v33, 0x16u);

      }
      if (v17 == 200)
        goto LABEL_9;
      _AKLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 138412290;
        v34 = v16;
        _os_log_impl(&dword_19202F000, v28, OS_LOG_TYPE_DEFAULT, "Task response: %@", (uint8_t *)&v33, 0xCu);
      }

      _AKLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
        v33 = 138412290;
        v34 = v30;
        _os_log_impl(&dword_19202F000, v29, OS_LOG_TYPE_DEFAULT, "Task data: %@", (uint8_t *)&v33, 0xCu);

      }
      if (v17 > 408)
      {
        if (v17 == 409)
        {
          v32 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7052);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, id, void *))(v32 + 16))(v32, 0, v16, v25);
          goto LABEL_15;
        }
        if (v17 != 451 && v17 != 412)
          goto LABEL_13;
LABEL_9:
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = 0;

        goto LABEL_17;
      }
      if (v17 == 250)
        goto LABEL_9;
      if (v17 == 401)
      {
        _AKLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_1();

        v22 = *(_QWORD *)(a1 + 32);
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = -7026;
        goto LABEL_14;
      }
    }
    else
    {
      _AKLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_2();

    }
LABEL_13:
    v22 = *(_QWORD *)(a1 + 32);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = -7029;
LABEL_14:
    objc_msgSend(v23, "ak_errorWithCode:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v22 + 16))(v22, 0, 0, v25);
LABEL_15:

    goto LABEL_16;
  }
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_3();

  v11 = *(_QWORD *)(a1 + 32);
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v37 = *MEMORY[0x1E0CB3388];
  v38[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("AKAuthenticationError"), -7029, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v11 + 16))(v11, 0, 0, v14);

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(id *)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;
LABEL_17:

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint8_t v21[16];

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v6, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsString:", CFSTR("icloud.com"));

  if (v10)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Detected an iCloud URL request, will not perform IdMS cert validation.", v21, 2u);
    }

    goto LABEL_7;
  }
  objc_msgSend(v6, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C92B70]);

  if (!v14)
    goto LABEL_7;
  objc_msgSend(v6, "protectionSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "serverTrust");
  objc_msgSend(v6, "protectionSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[AKCertificatePinning isValidCertificateTrust:forHostname:](AKCertificatePinning, "isValidCertificateTrust:forHostname:", v16, v18);

  if (v19)
  {
LABEL_7:
    v7[2](v7, 1, 0);
    goto LABEL_8;
  }
  _AKLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[AKURLSession URLSession:didReceiveChallenge:completionHandler:].cold.1();

  v7[2](v7, 2, 0);
LABEL_8:

}

- (id)sessionConfiguration
{
  return -[NSURLSession configuration](self->_urlSession, "configuration");
}

- (BOOL)_usesAppleIDContext
{
  return self->__usesAppleIDContext;
}

- (void)set_usesAppleIDContext:(BOOL)a3
{
  self->__usesAppleIDContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasksByIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "URLSessionConfig disable virtual interfaces", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "URLSessionConfig doesn't respond to _allowsVirtualInterfaces!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __57__AKURLSession_sharedURLSessionWithDenyVirtualInterfaces__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Setting URLSessionConfig for the virtual interfaces", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __28__AKURLSession__urlBagCache__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to generate cache due to missing container path!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "AKURLSession %p is initializing...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:didBecomeInvalidWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "NSURLSession became invalid with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beginDataTaskWithRequest:(NSObject *)a3 completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x194022E4C](a2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_0(&dword_19202F000, a3, v5, "Asked to begin task with either nil request %@ or completion handler %@", v6);

  OUTLINED_FUNCTION_10_0();
}

void __31__AKURLSession_cancelDataTask___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_0(&dword_19202F000, a2, v4, "Cancelling task %{public}@ for request %@", v5);

  OUTLINED_FUNCTION_10_0();
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "The data parameter is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)URLSession:dataTask:didReceiveData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Aggregating received data for task: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_unsafe_retryTaskIfPossible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Cannot retry a nil request from task: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_unsafe_retryTaskIfPossible:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Retry count has been exceeded! %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Task %{public}@ Server responded with authentication error", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Task %{public}@ Request response not of expected class!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __73__AKURLSession_beginAuthenticationDataTaskWithRequest_completionHandler___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  v3 = 138543618;
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  OUTLINED_FUNCTION_3_0(&dword_19202F000, v2, (uint64_t)v2, "Request failed for task: %{public}@ error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Server cert validity check failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
