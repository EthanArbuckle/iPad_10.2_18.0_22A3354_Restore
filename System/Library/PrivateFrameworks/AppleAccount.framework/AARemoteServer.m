@implementation AARemoteServer

+ (AARemoteServer)sharedServerWithNoUrlCache
{
  if (sharedServerWithNoUrlCache_onceToken != -1)
    dispatch_once(&sharedServerWithNoUrlCache_onceToken, &__block_literal_global_24);
  return (AARemoteServer *)(id)sharedServerWithNoUrlCache_sharedServer;
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_configurationCacheInvalidatingIfNecessary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v4 + 16))(v4, v5, v6, 0);

  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3;
    v8[3] = &unk_1E416E6B0;
    v7 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    objc_msgSend(v9, "_fetchConfigurationAndResponseWithCompletion:", v8);

  }
}

void __44__AARemoteServer_sharedServerWithNoUrlCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AARemoteServer _initRequiringUrlCache:]([AARemoteServer alloc], "_initRequiringUrlCache:", 0);
  v1 = (void *)sharedServerWithNoUrlCache_sharedServer;
  sharedServerWithNoUrlCache_sharedServer = (uint64_t)v0;

}

- (AAURLSession)session
{
  return self->_session;
}

- (void)configurationWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (_os_feature_enabled_impl())
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AARemoteServer configurationWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__AARemoteServer_configurationWithCompletion___block_invoke;
    v20[3] = &unk_1E416E6B0;
    v20[4] = self;
    v21 = v5;
    v14 = v5;
    -[AARemoteServer urlConfigurationWithCompletion:](self, "urlConfigurationWithCompletion:", v20);
    v15 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__AARemoteServer_configurationWithCompletion___block_invoke_2;
    v18[3] = &unk_1E4171130;
    v19 = v5;
    v16 = v5;
    -[AARemoteServer _configurationAndResponseWithCompletion:](self, "_configurationAndResponseWithCompletion:", v18);
    v15 = v19;
  }

}

- (id)_initRequiringUrlCache:(BOOL)a3
{
  _BOOL4 v3;
  AARemoteServer *v4;
  uint64_t v5;
  AAURLSession *session;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *configurationQueue;
  AARemoteServerConfigurationCache *configurationCache;
  NSObject *v11;
  const __CFString *v12;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AARemoteServer;
  v4 = -[AARemoteServer init](&v14, sel_init);
  if (v4)
  {
    if (v3)
      +[AAURLSession sharedSession](AAURLSession, "sharedSession");
    else
      +[AAURLSession sharedSessionWithNoUrlCache](AAURLSession, "sharedSessionWithNoUrlCache");
    v5 = objc_claimAutoreleasedReturnValue();
    session = v4->_session;
    v4->_session = (AAURLSession *)v5;

    v4->_configurationLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.AppleAccount.RemoteServer", v7);
    configurationQueue = v4->_configurationQueue;
    v4->_configurationQueue = (OS_dispatch_queue *)v8;

    configurationCache = v4->_configurationCache;
    v4->_configurationCache = 0;

    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if (v3)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AARemoteServer initiated with requiresUrlCache: %@", buf, 0xCu);
    }

  }
  return v4;
}

- (void)_fetchConfigurationAndResponseWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke;
  v18[3] = &unk_1E4171158;
  v19 = v5;
  v7 = v5;
  v8 = (void *)MEMORY[0x1A1AED7A0](v18);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", CFSTR("https://setup.icloud.com"));
  objc_msgSend(v9, "setPath:", CFSTR("/configurations/init"));
  objc_msgSend(v9, "setQuery:", CFSTR("context=settings"));
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AARemoteServer session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke_2;
  v16[3] = &unk_1E416E9B0;
  v17 = v8;
  v13 = v8;
  objc_msgSend(v12, "bodyTaskWithRequest:completion:", v11, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resume");

}

- (id)_configurationLock_configurationCacheInvalidatingIfNecessary
{
  void *v3;
  double v4;
  double v5;
  AARemoteServerConfigurationCache *configurationCache;

  os_unfair_lock_assert_owner(&self->_configurationLock);
  -[AARemoteServerConfigurationCache creationDate](self->_configurationCache, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  if (v5 < -600.0)
  {
    configurationCache = self->_configurationCache;
    self->_configurationCache = 0;

  }
  return self->_configurationCache;
}

- (id)_configurationCacheInvalidatingIfNecessary
{
  os_unfair_lock_s *p_configurationLock;
  void *v4;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  -[AARemoteServer _configurationLock_configurationCacheInvalidatingIfNecessary](self, "_configurationLock_configurationCacheInvalidatingIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_configurationLock);
  return v4;
}

- (void)_configurationAndResponseWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *configurationQueue;
  _QWORD block[5];
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke;
  v15[3] = &unk_1E4171158;
  v6 = v4;
  v16 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AED7A0](v15);
  -[AARemoteServer _configurationCacheInvalidatingIfNecessary](self, "_configurationCacheInvalidatingIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD))v7)[2](v7, v10, v11, 0);

  }
  else
  {
    configurationQueue = self->_configurationQueue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_2;
    block[3] = &unk_1E416E4C8;
    block[4] = self;
    v14 = v7;
    dispatch_async(configurationQueue, block);

  }
}

+ (AARemoteServer)sharedServer
{
  if (sharedServer_onceToken != -1)
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_29);
  return (AARemoteServer *)(id)sharedServer_sharedServer;
}

void __30__AARemoteServer_sharedServer__block_invoke()
{
  AARemoteServer *v0;
  void *v1;

  v0 = objc_alloc_init(AARemoteServer);
  v1 = (void *)sharedServer_sharedServer;
  sharedServer_sharedServer = (uint64_t)v0;

}

- (AAURLSession)signingSession
{
  return +[AAURLSession sharedSigningSession](AAURLSession, "sharedSigningSession");
}

- (AARemoteServer)init
{
  return (AARemoteServer *)-[AARemoteServer _initRequiringUrlCache:](self, "_initRequiringUrlCache:", 1);
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v11 = v9;
  if ((v10 == 0) != (v11 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: configuration ^ error"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v12 = v11;

  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_2((uint64_t)v10, (uint64_t)v12, v13);

  if (v12)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_1(v14);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__AARemoteServer_configurationWithCompletion___block_invoke_43;
    v17[3] = &unk_1E4171130;
    v15 = *(void **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v15, "_configurationAndResponseWithCompletion:", v17);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v7;
  v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: configuration ^ error"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v7;
  v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: configuration ^ error"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AADaemonController *v12;

  v3 = a3;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AARemoteServer urlConfigurationWithCompletion:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = objc_alloc_init(AADaemonController);
  -[AADaemonController urlConfigurationWithCompletion:](v12, "urlConfigurationWithCompletion:", v3);

}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v7;
  v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: configuration ^ error"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

    v18 = *(void **)(a1 + 32);
    +[AARemoteServerConfigurationCache cacheWithConfiguration:response:](AARemoteServerConfigurationCache, "cacheWithConfiguration:response:", v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setConfigurationCache:", v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_2((uint64_t)v9, v11);
  }

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_setConfigurationCache:(id)a3
{
  AARemoteServerConfigurationCache *v4;
  AARemoteServerConfigurationCache *configurationCache;

  v4 = (AARemoteServerConfigurationCache *)a3;
  os_unfair_lock_lock(&self->_configurationLock);
  configurationCache = self->_configurationCache;
  self->_configurationCache = v4;

  os_unfair_lock_unlock(&self->_configurationLock);
}

void __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v7;
  v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: configuration ^ error"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  AAURLConfiguration *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (v13)
  {
    objc_opt_class();
    v9 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[AAURLConfiguration initWithDictionary:]([AAURLConfiguration alloc], "initWithDictionary:", v9);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_9:
      goto LABEL_10;
    }

    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, v8);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (id)v12;
    (*(void (**)(uint64_t, _QWORD, id, uint64_t))(v11 + 16))(v11, 0, v7, v12);
    goto LABEL_9;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4402);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  (*(void (**)(uint64_t, _QWORD, id, id))(v11 + 16))(v11, 0, v7, v8);
LABEL_10:

}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
  objc_storeStrong((id *)&self->_configurationQueue, 0);
}

- (void)authenticateAccount:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  AAAuthenticateRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  AAAuthenticateRequest *v15;
  AARequester *v16;
  id v17;
  id v18;
  AARequester *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99E98], "aa_URLWithEndpoint:", CFSTR("authenticate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [AAAuthenticateRequest alloc];
  objc_msgSend(v10, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_password");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AAAuthenticateRequest initWithURLString:username:password:](v11, "initWithURLString:username:password:", v12, v13, v14);

  v16 = [AARequester alloc];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__AARemoteServer_Deprecated__authenticateAccount_completion___block_invoke;
  v23[3] = &unk_1E4171180;
  v24 = v7;
  v25 = v9;
  v17 = v9;
  v18 = v7;
  v19 = -[AARequester initWithRequest:handler:](v16, "initWithRequest:handler:", v15, v23);
  v20 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v20, "addOperation:", v19);

}

void __61__AARemoteServer_Deprecated__authenticateAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v5, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "stringValue");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    objc_msgSend(*(id *)(a1 + 32), "setAccountProperty:forKey:", v10, CFSTR("personID"));
    if (v6)
    {
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      _AALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "authToken");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "authenticate Succeeded. Token is %@", (uint8_t *)&v17, 0xCu);

      }
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v5, "authToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "aa_setAuthToken:", v16);

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v12();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)registerAccount:(id)a3 withHSA:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  os_signpost_id_t v39;
  uint64_t v40;
  uint8_t buf[4];
  os_signpost_id_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "registerAccount", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "aa_URLWithEndpoint:", CFSTR("loginOrCreateAccount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AARemoteServer _newURLRequestWithURLString:](self, "_newURLRequestWithURLString:", v14);

  if (v6)
  {
    objc_msgSend(v9, "aa_personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "aa_addDeviceProvisioningInfoHeadersWithDSID:sendEmptyValues:", v16, 1);

  }
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v17, CFSTR("Device-UDID"));

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", v9, 1);
  -[AARemoteServer _bodyDictionaryWithProtocolVersion:](self, "_bodyDictionaryWithProtocolVersion:", CFSTR("1.0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v15, "aa_setXMLBodyWithParameters:", v18);

  objc_msgSend(v15, "aa_addMultiUserDeviceHeaderIfEnabled");
  _AASignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = _AASignpostCreate(v20);
  v23 = v22;

  _AASignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    objc_msgSend(v9, "accountType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = (os_signpost_id_t)v27;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v21, "LoginOrCreateAccount", " AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0xCu);

  }
  _AASignpostLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "accountType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v42 = v21;
    v43 = 2114;
    v44 = v30;
    _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginOrCreateAccount  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

  }
  v31 = objc_opt_class();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __65__AARemoteServer_Deprecated__registerAccount_withHSA_completion___block_invoke;
  v36[3] = &unk_1E41711A8;
  v39 = v21;
  v40 = v23;
  v37 = v9;
  v38 = v11;
  v32 = v11;
  v33 = v9;
  -[AARemoteServer _startRequest:responseClass:mainThread:completion:](self, "_startRequest:responseClass:mainThread:completion:", v15, v31, 0, v36);

}

void __65__AARemoteServer_Deprecated__registerAccount_withHSA_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  double v14;
  const __CFString *v15;
  void *v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const __CFString *v27;
  int v28;
  const __CFString *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    _AAErrorUnderlyingError(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 67240192;
    LODWORD(v29) = objc_msgSend(v12, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v10, OS_SIGNPOST_INTERVAL_END, v11, "LoginOrCreateAccount", " error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v28, 8u);

  }
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = *(const __CFString **)(a1 + 48);
    _AAErrorUnderlyingError(v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "code");
    v28 = 134218496;
    v29 = v15;
    v30 = 2048;
    v31 = v14;
    v32 = 1026;
    v33 = v17;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LoginOrCreateAccount  error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v28, 0x1Cu);

  }
  _AALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("YES");
    if (!v7)
      v19 = CFSTR("NO");
    v28 = 138412290;
    v29 = v19;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "Register Completed - Response: %@", (uint8_t *)&v28, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(v7, "personID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(*(id *)(a1 + 32), "aa_personID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v23 = *(void **)(a1 + 32);
        objc_msgSend(v7, "personID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAccountProperty:forKey:", v24, CFSTR("personID"));

      }
    }
    objc_msgSend(v7, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = CFSTR("NO");
      if (!v25)
        v27 = CFSTR("YES");
      v28 = 138412290;
      v29 = v27;
      _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Account Authenticated: %@", (uint8_t *)&v28, 0xCu);
    }

    if (!v25)
      objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)loginDelegates:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v31 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARemoteServer.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

LABEL_3:
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "loginDelegates called", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "aa_URLWithEndpoint:", CFSTR("loginDelegates"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AARemoteServer _newURLRequestWithURLString:](self, "_newURLRequestWithURLString:", v13);

  objc_msgSend(v9, "aa_personID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v9, "aa_personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v16);

  }
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v17, "setValue:forKey:", v10, CFSTR("delegates"));
  objc_msgSend(v9, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v18, CFSTR("apple-id"));

  objc_msgSend(v9, "credential");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "password");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v20, CFSTR("password"));

  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v21, CFSTR("client-id"));

  objc_msgSend(v14, "aa_setBodyWithParameters:", v17);
  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[AARemoteServer _redactedBodyStringWithPropertyList:](self, "_redactedBodyStringWithPropertyList:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v23;
    _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  objc_msgSend(v14, "addValue:forHTTPHeaderField:", CFSTR("text/plist"), CFSTR("Content-Type"));
  objc_msgSend(v14, "aa_addAltDSIDAndRepairStateWithAccount:", v9);
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v24, CFSTR("Device-UDID"));

  _AALogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v26;
    _os_log_impl(&dword_19EACA000, v25, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);

  }
  v27 = objc_opt_class();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __67__AARemoteServer_Deprecated__loginDelegates_parameters_completion___block_invoke;
  v32[3] = &unk_1E41711D0;
  v33 = v31;
  v28 = v31;
  -[AARemoteServer _startRequest:responseClass:mainThread:completion:](self, "_startRequest:responseClass:mainThread:completion:", v14, v27, 0, v32);

}

uint64_t __67__AARemoteServer_Deprecated__loginDelegates_parameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_bodyDictionaryWithProtocolVersion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("protocolVersion"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("timezone"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("en");
  objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("language"));
  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("client-id"));

  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("userInfo"));
  return v5;
}

- (id)_redactedBodyStringWithPropertyList:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(&unk_1E41A6978, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(&unk_1E41A6978);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "unredactedSuffixOfLength:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("...%@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v12, v8);

        }
      }
      v5 = objc_msgSend(&unk_1E41A6978, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 100, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = objc_retainAutorelease(v13);
  v16 = (void *)objc_msgSend(v14, "initWithBytes:length:encoding:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 4);

  return v16;
}

- (id)_redactedHeadersFromHTTPHeaders:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(&unk_1E41A6990, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(&unk_1E41A6990);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "unredactedSuffixOfLength:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("...%@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v12, v8);

        }
      }
      v5 = objc_msgSend(&unk_1E41A6990, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  return v3;
}

- (void)_startRequest:(id)a3 responseClass:(Class)a4 mainThread:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  Class v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Sending request...", buf, 2u);
  }

  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "HTTP Request: %@", buf, 0xCu);

  }
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "allHTTPHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AARemoteServer _redactedHeadersFromHTTPHeaders:](self, "_redactedHeadersFromHTTPHeaders:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "HTTP Headers:\n%@", buf, 0xCu);

  }
  -[AARemoteServer signingSession](self, "signingSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke;
  v21[3] = &unk_1E4171220;
  v24 = a5;
  v22 = v11;
  v23 = a4;
  v19 = v11;
  objc_msgSend(v18, "dataTaskWithRequest:completion:", v10, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resume");

}

void __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Remote request completed with error %@", buf, 0xCu);
  }

  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithHTTPResponse:data:", v8, v7);
    objc_msgSend(v11, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "_aa_userReadableError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke_179;
    block[3] = &unk_1E41711F8;
    v16 = *(id *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke_179(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_newURLRequestWithURLString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  v6 = (void *)MEMORY[0x1E0C92C28];
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)configurationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a1, a3, "%s iCloudConfigurationBagDaemonCache FF is enabled. Going through the new flow.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "XPC connection failed. Continuing fetching urlConfiguration in process", v1, 2u);
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[AARemoteServer configurationWithCompletion:]_block_invoke";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "%s completion: %@, error: %@", (uint8_t *)&v3, 0x20u);
}

- (void)urlConfigurationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a1, a3, "%s called.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a2, a3, "Successfully fetched URL configuration: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch URL configuration, error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
