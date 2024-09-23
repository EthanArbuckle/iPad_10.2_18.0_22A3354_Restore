@implementation MTCompanionSyncService

- (MTCompanionSyncService)initWithSyncStatusProvider:(id)a3
{
  id v5;
  MTCompanionSyncService *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  uint64_t v10;
  NAScheduler *serializer;
  id v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  SYService *service;
  uint64_t v25;
  NSMutableDictionary *pendingRequests;
  uint64_t v27;
  MTExponentialBackOffTimer *retryTimer;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  id location;
  id *p_location;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD v40[2];
  __int128 buf;
  uint64_t v42;
  void *v43;
  id *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MTCompanionSyncService;
  v6 = -[MTCompanionSyncService init](&v33, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority](MTScheduler, "defaultPriority"), -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MTCompanionSyncService.serialqueue", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", v6->_serialQueue);
    v10 = objc_claimAutoreleasedReturnValue();
    serializer = v6->_serializer;
    v6->_serializer = (NAScheduler *)v10;

    objc_storeStrong((id *)&v6->_syncStatusProvider, a3);
    location = 0;
    p_location = &location;
    v36 = 0x2050000000;
    v12 = (id)getSYServiceClass_softClass;
    v37 = getSYServiceClass_softClass;
    v13 = MEMORY[0x1E0C809B0];
    if (!getSYServiceClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v42 = (uint64_t)__getSYServiceClass_block_invoke;
      v43 = &unk_1E39CB690;
      v44 = &location;
      __getSYServiceClass_block_invoke((uint64_t)&buf);
      v12 = p_location[3];
    }
    v14 = (objc_class *)objc_retainAutorelease(v12);
    _Block_object_dispose(&location, 8);
    v15 = [v14 alloc];
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x2020000000;
    v16 = (id *)getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr;
    v43 = (void *)getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr;
    if (!getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr)
    {
      v17 = (void *)CompanionSyncLibrary();
      v16 = (id *)dlsym(v17, "SYServiceOptionDiskBufferProtectionClass");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v16;
      getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(&buf, 8);
    if (!v16)
      -[MTCompanionSyncService initWithSyncStatusProvider:].cold.1();
    v18 = *v16;
    v38 = v18;
    v40[0] = &unk_1E3A05E10;
    location = 0;
    p_location = &location;
    v36 = 0x2020000000;
    v19 = (id *)getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr;
    v37 = getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr;
    if (!getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr)
    {
      *(_QWORD *)&buf = v13;
      *((_QWORD *)&buf + 1) = 3221225472;
      v42 = (uint64_t)__getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke;
      v43 = &unk_1E39CB690;
      v44 = &location;
      __getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke((uint64_t)&buf);
      v19 = (id *)p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (!v19)
      -[MTCompanionSyncService initWithSyncStatusProvider:].cold.2();
    v39 = *v19;
    v40[1] = MEMORY[0x1E0C9AAB0];
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v39;
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v40, &v38, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v15, "initWithService:priority:asMasterStore:options:", CFSTR("com.apple.private.alloy.mobiletimersync"), 0, 1, v22);
    service = v6->_service;
    v6->_service = (SYService *)v23;

    -[SYService setDelegate:queue:](v6->_service, "setDelegate:queue:", v6, v6->_serialQueue);
    v25 = objc_opt_new();
    pendingRequests = v6->_pendingRequests;
    v6->_pendingRequests = (NSMutableDictionary *)v25;

    objc_initWeak(&location, v6);
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __53__MTCompanionSyncService_initWithSyncStatusProvider___block_invoke;
    v31[3] = &unk_1E39CBC38;
    objc_copyWeak(&v32, &location);
    +[MTExponentialBackOffTimer timerWithInitialTime:backoffFactor:fireBlock:queue:](MTExponentialBackOffTimer, "timerWithInitialTime:backoffFactor:fireBlock:queue:", 2, v31, v6->_serialQueue, 2.0);
    v27 = objc_claimAutoreleasedReturnValue();
    retryTimer = v6->_retryTimer;
    v6->_retryTimer = (MTExponentialBackOffTimer *)v27;

    MTLogForCategory(6);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "Initialized %{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __53__MTCompanionSyncService_initWithSyncStatusProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MTLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "retryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543618;
    v5 = WeakRetained;
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ retry timer fired (%{public}@)", (uint8_t *)&v4, 0x16u);

  }
  objc_msgSend(WeakRetained, "_retryRequest");

}

- (BOOL)resume:(id *)a3
{
  NSObject *v5;
  int v7;
  MTCompanionSyncService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming service", (uint8_t *)&v7, 0xCu);
  }

  return -[SYService resume:](self->_service, "resume:", a3);
}

- (void)suspend
{
  NSObject *v3;
  void *v4;
  int v5;
  MTCompanionSyncService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending service", (uint8_t *)&v5, 0xCu);
  }

  -[SYService suspend](self->_service, "suspend");
  -[MTCompanionSyncService retryTimer](self, "retryTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

- (id)requestSync:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  NAScheduler *serializer;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  MTCompanionSyncService *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[MTCompanionSyncRequest requestWithType:](MTCompanionSyncRequest, "requestWithType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ requests sync %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__MTCompanionSyncService_requestSync___block_invoke;
  v12[3] = &unk_1E39CBA08;
  v12[4] = self;
  v14 = a3;
  v8 = v5;
  v13 = v8;
  -[NAScheduler performBlock:](serializer, "performBlock:", v12);
  -[MTCompanionSyncService _requestSync:](self, "_requestSync:", a3);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __38__MTCompanionSyncService_requestSync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__MTCompanionSyncService_requestSync___block_invoke_2;
    v8[3] = &unk_1E39CC2D8;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "addCompletionBlock:", v8);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
}

uint64_t __38__MTCompanionSyncService_requestSync___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete:", a2);
}

- (void)_requestSync:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  MTCompanionSyncService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    MTLogForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ setHasChangesAvailable", (uint8_t *)&v7, 0xCu);
    }

    -[MTCompanionSyncService service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasChangesAvailable");

  }
  -[MTCompanionSyncService retryTimer](self, "retryTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  NSObject *serialQueue;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;

  serialQueue = self->_serialQueue;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(serialQueue);
  objc_msgSend(v9, "setTargetQueue:", self->_serialQueue);
  if (objc_msgSend(v9, "isSending"))
    v11 = -[MTCompanionSyncService service:startSendingSession:error:](self, "service:startSendingSession:error:", v10, v9, a5);
  else
    v11 = -[MTCompanionSyncService service:startReceivingSession:error:](self, "service:startReceivingSession:error:", v10, v9, a5);
  v12 = v11;

  return v12;
}

- (BOOL)service:(id)a3 startSendingSession:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  MTCompanionSyncSession *v9;
  id WeakRetained;
  MTCompanionSyncSession *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int v17;
  MTCompanionSyncService *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequests, "objectForKeyedSubscript:", &unk_1E3A05E28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ wants to start sending session %{public}@ for request %{public}@", (uint8_t *)&v17, 0x20u);
  }

  v9 = [MTCompanionSyncSession alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = -[MTCompanionSyncSession initWithSession:request:delegate:](v9, "initWithSession:request:delegate:", v6, v7, WeakRetained);
  -[MTCompanionSyncService setSendingSession:](self, "setSendingSession:", v11);

  v12 = -[MTSyncStatusProvider syncStatus](self->_syncStatusProvider, "syncStatus");
  MTLogForCategory(6);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 == 1)
  {
    if (v14)
    {
      -[MTCompanionSyncService sendingSession](self, "sendingSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v15;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ starting sending session %{public}@", (uint8_t *)&v17, 0x16u);

    }
  }
  else if (v14)
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ not ok to sync yet", (uint8_t *)&v17, 0xCu);
  }

  return v12 == 1;
}

- (BOOL)service:(id)a3 startReceivingSession:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  MTCompanionSyncSession *v8;
  id WeakRetained;
  MTCompanionSyncSession *v10;
  int v12;
  MTCompanionSyncService *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MTLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ starting receiving session %{public}@", (uint8_t *)&v12, 0x16u);
  }

  v8 = [MTCompanionSyncSession alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = -[MTCompanionSyncSession initWithSession:delegate:](v8, "initWithSession:delegate:", v6, WeakRetained);
  -[MTCompanionSyncService setReceivingSession:](self, "setReceivingSession:", v10);

  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  NSObject *serialQueue;
  id v9;
  id v10;
  id v11;

  serialQueue = self->_serialQueue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(serialQueue);
  if (objc_msgSend(v10, "isSending"))
    -[MTCompanionSyncService service:sendingSessionEnded:error:](self, "service:sendingSessionEnded:error:", v11, v10, v9);
  else
    -[MTCompanionSyncService service:receivingSessionEnded:error:](self, "service:receivingSessionEnded:error:", v11, v10, v9);

}

- (void)service:(id)a3 sendingSessionEnded:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *pendingRequests;
  void *v18;
  void *v19;
  int v20;
  MTCompanionSyncService *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = 138543874;
      v21 = self;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_ERROR, "%{public}@ finished sending session %{public}@ with error %{public}@", (uint8_t *)&v20, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Companion sync sending session failed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", v13);

    if ((objc_msgSend((id)objc_opt_class(), "shouldRetryForError:", v10) & 1) != 0)
    {
      -[MTCompanionSyncService retryTimer](self, "retryTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "start");
      goto LABEL_12;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ finished sending session %{public}@", (uint8_t *)&v20, 0x16u);
    }

  }
  -[MTCompanionSyncService sendingSession](self, "sendingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543874;
    v21 = self;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ finished request %{public}@ with error %{public}@", (uint8_t *)&v20, 0x20u);
  }

  objc_msgSend(v14, "complete:", v10);
  pendingRequests = self->_pendingRequests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "requestType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](pendingRequests, "removeObjectForKey:", v18);

  -[MTCompanionSyncService setSendingSession:](self, "setSendingSession:", 0);
  -[MTCompanionSyncService retryTimer](self, "retryTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reset");

LABEL_12:
}

+ (BOOL)shouldRetryForError:(id)a3
{
  return 1;
}

- (void)service:(id)a3 receivingSessionEnded:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  MTCompanionSyncService *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  MTLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543874;
      v12 = self;
      v13 = 2114;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ finished receiving session %{public}@ with error %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ finished receiving session %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MTCompanionSyncService setReceivingSession:](self, "setReceivingSession:", 0);
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v11;
  MTCompanionSyncService *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  MTLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543874;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ had a conflict between %{public}@ (preferred) and %{public}@ (rejected)", (uint8_t *)&v11, 0x20u);
  }

  return v7;
}

- (void)_retryRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  MTCompanionSyncService *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[MTCompanionSyncService sendingSession](self, "sendingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MTLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ retrying %{public}@", (uint8_t *)&v6, 0x16u);
    }

    -[MTCompanionSyncService _requestSync:](self, "_requestSync:", objc_msgSend(v4, "requestType"));
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p master: %d >"), objc_opt_class(), self, -[SYService isMasterStore](self->_service, "isMasterStore"));
}

- (void)syncStatusProvider:(id)a3 didChangeSyncStatus:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NAScheduler *serializer;
  _QWORD v9[5];
  uint8_t buf[4];
  MTCompanionSyncService *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 1)
  {
    MTLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told it's ok to sync from %{public}@.", buf, 0x16u);
    }

    serializer = self->_serializer;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__MTCompanionSyncService_syncStatusProvider_didChangeSyncStatus___block_invoke;
    v9[3] = &unk_1E39CB858;
    v9[4] = self;
    -[NAScheduler performBlock:](serializer, "performBlock:", v9);
  }

}

uint64_t __65__MTCompanionSyncService_syncStatusProvider_didChangeSyncStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryRequest");
}

- (MTSyncServiceDelegate)delegate
{
  return (MTSyncServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (SYService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (MTSyncStatusProvider)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (void)setSyncStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusProvider, a3);
}

- (MTCompanionSyncSession)sendingSession
{
  return self->_sendingSession;
}

- (void)setSendingSession:(id)a3
{
  objc_storeStrong((id *)&self->_sendingSession, a3);
}

- (MTCompanionSyncSession)receivingSession
{
  return self->_receivingSession;
}

- (void)setReceivingSession:(id)a3
{
  objc_storeStrong((id *)&self->_receivingSession, a3);
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (MTExponentialBackOffTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_receivingSession, 0);
  objc_storeStrong((id *)&self->_sendingSession, 0);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithSyncStatusProvider:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SYServiceOption getSYServiceOptionDiskBufferProtectionClass(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTCompanionSyncService.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)initWithSyncStatusProvider:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIDSSendMessageOptionBypassDuetKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTCompanionSyncService.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
