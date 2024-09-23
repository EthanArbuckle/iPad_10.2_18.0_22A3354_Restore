@implementation EMClientState

+ (id)remoteInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25F988);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_setVisibleMailboxObjectIDs_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setStateForDemoMode_, 1, 1);

  return v5;
}

- (EMClientState)initWithRemoteConnection:(id)a3
{
  id v5;
  EMClientState *v6;
  EMClientState *v7;
  EMRemoteConnection *connection;
  void *v9;
  uint64_t v10;
  EFObserver *foregroundObservable;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EMClientState;
  v6 = -[EMClientState init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __42__EMClientState_initWithRemoteConnection___block_invoke;
    v16 = &unk_1E70F1F78;
    objc_copyWeak(&v17, &location);
    -[EMRemoteConnection addRecoveryHandler:](connection, "addRecoveryHandler:", &v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__handleApplicationWillEnterForeground, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__handleApplicationDidEnterBackground, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v10 = objc_claimAutoreleasedReturnValue();
    foregroundObservable = v7->_foregroundObservable;
    v7->_foregroundObservable = (EFObserver *)v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)_handleApplicationWillEnterForeground
{
  -[EMClientState setIsForeground:](self, "setIsForeground:", 1);
}

- (void)setIsForeground:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;

  if (self->_isForeground != a3)
  {
    v3 = a3;
    v5 = MEMORY[0x1E0C809B0];
    self->_isForeground = a3;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __33__EMClientState_setIsForeground___block_invoke;
    v8[3] = &__block_descriptor_33_e34_v16__0___EMClientStateInterface__8l;
    v9 = a3;
    -[EMClientState _performAsyncUpdate:](self, "_performAsyncUpdate:", v8);
    -[EMClientState foregroundObservable](self, "foregroundObservable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "observerDidReceiveResult:", v7);

  }
}

- (EFObserver)foregroundObservable
{
  return self->_foregroundObservable;
}

- (void)setCurrentlyVisibleMailboxes:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ef_filter:", *MEMORY[0x1E0D1ED88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_compactMapSelector:", sel_objectID);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[EMClientState setCurrentlyVisibleMailboxObjectIDs:](self, "setCurrentlyVisibleMailboxObjectIDs:", v5);
}

- (void)setCurrentlyVisibleMailboxObjectIDs:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EMClientState_setCurrentlyVisibleMailboxObjectIDs___block_invoke;
  v6[3] = &unk_1E70F2508;
  v7 = v4;
  v5 = v4;
  -[EMClientState _performAsyncUpdate:](self, "_performAsyncUpdate:", v6);

}

- (void)_performAsyncUpdate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  EMClientState *v8;
  id v9;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = self;
  v5 = v4;
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v7, 3221225472, __37__EMClientState__performAsyncUpdate___block_invoke, &unk_1E70F21A0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:", &v7);

}

- (id)daemonBoosterWithDescription:(id)a3
{
  id v4;
  EMDaemonBooster *v5;
  void *v6;
  EMDaemonBooster *v7;

  v4 = a3;
  v5 = [EMDaemonBooster alloc];
  -[EMClientState connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMDaemonBooster initWithConnection:description:](v5, "initWithConnection:description:", v6, v4);

  return v7;
}

void __37__EMClientState__performAsyncUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __53__EMClientState_setCurrentlyVisibleMailboxObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleMailboxObjectIDs:", *(_QWORD *)(a1 + 32));
}

uint64_t __33__EMClientState_setIsForeground___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsForeground:", *(unsigned __int8 *)(a1 + 32));
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__EMClientState_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (OS_os_log *)(id)log_log_7;
}

void __20__EMClientState_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;

}

void __42__EMClientState_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__EMClientState_initWithRemoteConnection___block_invoke_2;
  v3[3] = &unk_1E70F2508;
  v4 = WeakRetained;
  v2 = WeakRetained;
  objc_msgSend(v2, "_performAsyncUpdate:", v3);

}

void __42__EMClientState_initWithRemoteConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setIsForeground:", objc_msgSend(*(id *)(a1 + 32), "isForeground"));
  objc_msgSend(v3, "setIsRunningTests:", objc_msgSend(*(id *)(a1 + 32), "isRunningTests"));

}

- (void)_handleApplicationDidEnterBackground
{
  -[EMClientState setIsForeground:](self, "setIsForeground:", 0);
}

- (void)test_handleApplicationWillEnterForeground
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMClientState.m"), 113, CFSTR("%s can only be called from unit tests"), "-[EMClientState test_handleApplicationWillEnterForeground]");

  }
  -[EMClientState _handleApplicationWillEnterForeground](self, "_handleApplicationWillEnterForeground");
}

- (void)test_handleApplicationDidEnterBackground
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMClientState.m"), 118, CFSTR("%s can only be called from unit tests"), "-[EMClientState test_handleApplicationDidEnterBackground]");

  }
  -[EMClientState _handleApplicationDidEnterBackground](self, "_handleApplicationDidEnterBackground");
}

- (void)setStateForDemoMode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  EMClientState *v8;
  id v9;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = self;
  v5 = v4;
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v7, 3221225472, __37__EMClientState_setStateForDemoMode___block_invoke, &unk_1E70F21A0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:", &v7);

}

void __37__EMClientState_setStateForDemoMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__EMClientState_setStateForDemoMode___block_invoke_2;
  v4[3] = &unk_1E70F2550;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setStateForDemoMode:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__EMClientState_setStateForDemoMode___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)exitDaemon
{
  void *v2;
  id v3;

  -[EMClientState connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "exitDaemon");
}

void __27__EMClientState_exitDaemon__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[EMClientState log](EMClientState, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __27__EMClientState_exitDaemon__block_invoke_cold_1(v4, v5, v3);
  }

}

- (void)setIsRunningTests:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x1E0C809B0];
  self->_isRunningTests = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __35__EMClientState_setIsRunningTests___block_invoke;
  v4[3] = &__block_descriptor_33_e34_v16__0___EMClientStateInterface__8l;
  v5 = a3;
  -[EMClientState _performAsyncUpdate:](self, "_performAsyncUpdate:", v4);
}

uint64_t __35__EMClientState_setIsRunningTests___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsRunningTests:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setForegroundObservable:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundObservable, a3);
}

- (BOOL)isRunningTests
{
  return self->_isRunningTests;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_foregroundObservable, 0);
}

void __27__EMClientState_exitDaemon__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Failed to establish XPC connection. Error: %{public}@", buf, 0xCu);

}

@end
