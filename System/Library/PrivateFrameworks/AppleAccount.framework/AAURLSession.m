@implementation AAURLSession

+ (AAURLSession)sharedSession
{
  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_23);
  return (AAURLSession *)(id)sharedSession_sharedSession;
}

uint64_t __43__AAURLSession__enqueueRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_enqueueTask:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __43__AAURLSession_sharedSessionWithNoUrlCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AAURLSession _initRequiringSigning:requiresPinning:requiresUrlCache:]([AAURLSession alloc], "_initRequiringSigning:requiresPinning:requiresUrlCache:", 0, 0, 0);
  v1 = (void *)sharedSessionWithNoUrlCache_sharedSession;
  sharedSessionWithNoUrlCache_sharedSession = (uint64_t)v0;

}

- (NSURLSession)urlSession
{
  return self->_session;
}

- (id)dataTaskWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[AAURLSession _enqueueRequest:completion:](self, "_enqueueRequest:completion:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)bodyTaskWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__AAURLSession_bodyTaskWithRequest_completion___block_invoke;
  v15[3] = &unk_1E416E988;
  v16 = v9;
  v10 = v9;
  -[AAURLSession dataTaskWithRequest:completion:](self, "dataTaskWithRequest:completion:", v7, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_sessionQueue_enqueueTask:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  +[_AAURLSessionOperation operationWithCompletion:](_AAURLSessionOperation, "operationWithCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingSessionOperations, "setObject:forKeyedSubscript:", v10, v7);

  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AAURLSession _sessionQueue_enqueueTask:completion:].cold.1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

}

- (id)_initRequiringSigning:(BOOL)a3 requiresPinning:(BOOL)a4 requiresUrlCache:(BOOL)a5
{
  AAURLSession *v9;
  AAURLSession *v10;
  _AAURLSessionDelegate *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *sessionQueue;
  uint64_t v15;
  NSURLSession *session;
  NSMutableDictionary *v17;
  NSMutableDictionary *pendingSessionOperations;
  NSObject *v19;
  const __CFString *v20;
  _BOOL4 requiresSigning;
  const __CFString *v22;
  objc_super v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (_AAURLSessionRegisterProtocol_onceToken != -1)
    dispatch_once(&_AAURLSessionRegisterProtocol_onceToken, &__block_literal_global_217);
  v24.receiver = self;
  v24.super_class = (Class)AAURLSession;
  v9 = -[AAURLSession init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_requiresSigning = a3;
    v9->_requiresICSSPinning = a4;
    v9->_requiresUrlCache = a5;
    v11 = -[_AAURLSessionDelegate initWithDelegate:]([_AAURLSessionDelegate alloc], "initWithDelegate:", v9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.AppleAccount.SessionQ", v12);
    sessionQueue = v10->_sessionQueue;
    v10->_sessionQueue = (OS_dispatch_queue *)v13;

    _AAURLSessionCreateSession(v11, v10->_sessionQueue, v10->_requiresSigning, v10->_requiresUrlCache);
    v15 = objc_claimAutoreleasedReturnValue();
    session = v10->_session;
    v10->_session = (NSURLSession *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingSessionOperations = v10->_pendingSessionOperations;
    v10->_pendingSessionOperations = v17;

    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = CFSTR("YES");
      requiresSigning = v10->_requiresSigning;
      if (v10->_requiresUrlCache)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (!requiresSigning)
        v20 = CFSTR("NO");
      v26 = v22;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "AAURLSession initiated with _requiresUrlCache: %@, _requiresSigning: %@, _requiresICSSPinning: %@", buf, 0x20u);
    }

  }
  return v10;
}

- (id)_enqueueRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *sessionQueue;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AAURLSession__enqueueRequest_completion___block_invoke;
  block[3] = &unk_1E416E518;
  block[4] = self;
  v12 = v10;
  v20 = v12;
  v21 = v9;
  v13 = v9;
  dispatch_async(sessionQueue, block);
  v14 = v21;
  v15 = v12;

  return v15;
}

+ (AAURLSession)sharedSessionWithNoUrlCache
{
  if (sharedSessionWithNoUrlCache_onceToken != -1)
    dispatch_once(&sharedSessionWithNoUrlCache_onceToken, &__block_literal_global_124);
  return (AAURLSession *)(id)sharedSessionWithNoUrlCache_sharedSession;
}

void __29__AAURLSession_sharedSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AAURLSession _initRequiringSigning:]([AAURLSession alloc], "_initRequiringSigning:", 0);
  v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = (uint64_t)v0;

}

+ (AAURLSession)sharedSigningSession
{
  if (sharedSigningSession_onceToken != -1)
    dispatch_once(&sharedSigningSession_onceToken, &__block_literal_global_121);
  return (AAURLSession *)(id)sharedSigningSession_sharedSession;
}

void __36__AAURLSession_sharedSigningSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AAURLSession _initRequiringSigning:]([AAURLSession alloc], "_initRequiringSigning:", 1);
  v1 = (void *)sharedSigningSession_sharedSession;
  sharedSigningSession_sharedSession = (uint64_t)v0;

}

+ (AAURLSession)sharedPinningSession
{
  if (sharedPinningSession_onceToken != -1)
    dispatch_once(&sharedPinningSession_onceToken, &__block_literal_global_122);
  return (AAURLSession *)(id)sharedPinningSession_sharedSession;
}

void __36__AAURLSession_sharedPinningSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AAURLSession _initRequiringSigning:requiresPinning:]([AAURLSession alloc], "_initRequiringSigning:requiresPinning:", 1, 1);
  v1 = (void *)sharedPinningSession_sharedSession;
  sharedPinningSession_sharedSession = (uint64_t)v0;

}

+ (AAURLSession)sharedPinningOnlySession
{
  if (sharedPinningOnlySession_onceToken != -1)
    dispatch_once(&sharedPinningOnlySession_onceToken, &__block_literal_global_123);
  return (AAURLSession *)(id)sharedPinningOnlySession_sharedSession;
}

void __40__AAURLSession_sharedPinningOnlySession__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AAURLSession _initRequiringSigning:requiresPinning:]([AAURLSession alloc], "_initRequiringSigning:requiresPinning:", 0, 1);
  v1 = (void *)sharedPinningOnlySession_sharedSession;
  sharedPinningOnlySession_sharedSession = (uint64_t)v0;

}

- (AAURLSession)init
{
  return (AAURLSession *)-[AAURLSession _initRequiringSigning:](self, "_initRequiringSigning:", 0);
}

- (id)_initRequiringSigning:(BOOL)a3
{
  return -[AAURLSession _initRequiringSigning:requiresPinning:](self, "_initRequiringSigning:requiresPinning:", a3, 0);
}

- (id)_initRequiringSigning:(BOOL)a3 requiresPinning:(BOOL)a4
{
  return -[AAURLSession _initRequiringSigning:requiresPinning:requiresUrlCache:](self, "_initRequiringSigning:requiresPinning:requiresUrlCache:", a3, a4, 1);
}

- (id)initForProxiedDevice:(id)a3
{
  return -[AAURLSession initForProxiedDevice:anisetteDataProvider:](self, "initForProxiedDevice:anisetteDataProvider:", a3, 0);
}

- (id)initForProxiedDevice:(id)a3 anisetteDataProvider:(id)a4
{
  id v6;
  id v7;
  AAURLSession *v8;
  AAURLSession *v9;
  _AAURLSessionDelegate *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *sessionQueue;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSURLSession *session;
  NSMutableDictionary *v19;
  NSMutableDictionary *pendingSessionOperations;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (_AAURLSessionRegisterProtocol_onceToken != -1)
    dispatch_once(&_AAURLSessionRegisterProtocol_onceToken, &__block_literal_global_217);
  v22.receiver = self;
  v22.super_class = (Class)AAURLSession;
  v8 = -[AAURLSession init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_requiresSigning = 0;
    v10 = -[_AAURLSessionDelegate initWithDelegate:]([_AAURLSessionDelegate alloc], "initWithDelegate:", v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.AppleAccount.SessionQ", v11);
    sessionQueue = v9->_sessionQueue;
    v9->_sessionQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWaitsForConnectivity:", 1);
    objc_msgSend(v14, "setTimeoutIntervalForResource:", 60.0);
    v15 = objc_alloc_init(MEMORY[0x1E0D00140]);
    objc_msgSend(v15, "setPairedDevice:", v6);
    objc_msgSend(v15, "setAnisetteDataProvider:", v7);
    objc_msgSend(v14, "set_appleIDContext:", v15);
    objc_msgSend(MEMORY[0x1E0CB3828], "aa_operationQueueWithUnderlyingQueue:", v9->_sessionQueue);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v14, v10, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    session = v9->_session;
    v9->_session = (NSURLSession *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingSessionOperations = v9->_pendingSessionOperations;
    v9->_pendingSessionOperations = v19;

  }
  return v9;
}

- (void)resetSessionCache
{
  void *v3;
  dispatch_semaphore_t v4;
  NSURLSession *session;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;

  _AAURLSessionSharedCache(self->_requiresUrlCache);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllCachedResponses");
  v4 = dispatch_semaphore_create(0);
  session = self->_session;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__AAURLSession_resetSessionCache__block_invoke;
  v7[3] = &unk_1E416E3A8;
  v8 = v4;
  v6 = v4;
  -[NSURLSession resetWithCompletionHandler:](session, "resetWithCompletionHandler:", v7);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __33__AAURLSession_resetSessionCache__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)dataTaskWithURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAURLSession dataTaskWithRequest:completion:](self, "dataTaskWithRequest:completion:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)bodyTaskWithURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAURLSession bodyTaskWithRequest:completion:](self, "bodyTaskWithRequest:completion:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __47__AAURLSession_bodyTaskWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_opt_class();
    v9 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CF0EB8];
      objc_msgSend(v9, "MIMEType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryFromObject:ofType:", v17, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(objc_msgSend(v9, "statusCode") - 200) > 0x63)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v15 = *(_QWORD *)(a1 + 32);
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithServerResponse:", v12);
        else
          objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, id, void *))(v15 + 16))(v15, 0, v9, v16);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }

    }
    else
    {

      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, v9);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_sessionQueue_updateTask:(id)a3 withData:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingSessionOperations, "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v7);

}

- (void)_sessionQueue_dequeueTask:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

  }
  v12 = v10;
  v13 = v11;
  if ((v12 == 0) != (v13 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: response ^ error"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v14 = v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  -[NSMutableDictionary aaf_removeObjectForKey:](self->_pendingSessionOperations, "aaf_removeObjectForKey:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 403, CFSTR("Failed to find handler for task: %@"), v9);

  }
  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AAURLSession _sessionQueue_dequeueTask:withResponse:error:].cold.1((uint64_t)v9, v16, v17, v18, v19, v20, v21, v22);

  objc_msgSend(v15, "invokeCompletionWithResponse:error:", v12, v14);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  if (v14)
  {
    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  if (!v9)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  -[AAURLSession _sessionQueue_updateTask:withData:](self, "_sessionQueue_updateTask:withData:", v9, v10);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  _AAURLSessionDelegate *v8;
  NSURLSession *v9;
  NSURLSession *session;
  void *v11;
  void *v12;
  NSURLSession *v13;

  v13 = (NSURLSession *)a3;
  v7 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if (self->_session != v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 428, CFSTR("Received invalidation for unexpected session (%@)!"), v13);

  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_pendingSessionOperations, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_169);
  v8 = -[_AAURLSessionDelegate initWithDelegate:]([_AAURLSessionDelegate alloc], "initWithDelegate:", self);
  _AAURLSessionCreateSession(v8, self->_sessionQueue, self->_requiresSigning, self->_requiresUrlCache);
  v9 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v9;

}

uint64_t __53__AAURLSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, uint64_t, _QWORD);

  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (self->_requiresICSSPinning)
  {
    v7 = a4;
    v8 = (void *)objc_opt_new();
    v9 = objc_msgSend(v8, "validateCertificateTrustWithChallenge:type:", v7, 2);

  }
  else
  {
    v9 = 1;
  }
  v10[2](v10, v9, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  AAURLSession *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a4;
  v10 = a5;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

    if (v9)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSession.m"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_12;
LABEL_3:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  objc_msgSend(v9, "response");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 || !v11)
  {
    -[AAURLSession _sessionQueue_dequeueTask:withResponse:error:](self, "_sessionQueue_dequeueTask:withResponse:error:", v9, 0, v10);
  }
  else
  {
    objc_opt_class();
    v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = self;
      v15 = v9;
      v16 = v13;
      v17 = 0;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = self;
      v15 = v9;
      v16 = 0;
      v17 = v13;
    }
    -[AAURLSession _sessionQueue_dequeueTask:withResponse:error:](v14, "_sessionQueue_dequeueTask:withResponse:error:", v15, v16, v17);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionOperations, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_sessionQueue_enqueueTask:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a2, a3, "Enqueued dataTask %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_sessionQueue_dequeueTask:(uint64_t)a3 withResponse:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a2, a3, "Dequeued dataTask %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
