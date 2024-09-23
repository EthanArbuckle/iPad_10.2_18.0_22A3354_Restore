@implementation MTStopwatchServer

- (MTStopwatchServer)init
{
  void *v3;
  id v4;
  void *v5;
  MTStopwatchServer *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMTStopwatchStorageClass_softClass;
  v12 = getMTStopwatchStorageClass_softClass;
  if (!getMTStopwatchStorageClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getMTStopwatchStorageClass_block_invoke;
    v8[3] = &unk_1E39CB690;
    v8[4] = &v9;
    __getMTStopwatchStorageClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v5 = (void *)objc_opt_new();
  v6 = -[MTStopwatchServer initWithStorage:](self, "initWithStorage:", v5);

  return v6;
}

- (MTStopwatchServer)initWithStorage:(id)a3
{
  id v4;
  MTStopwatchServer *v5;
  MTStopwatchServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MTXPCConnectionListenerProvider *connectionListenerProvider;
  dispatch_queue_t v13;
  objc_super v15;
  uint8_t buf[4];
  MTStopwatchServer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTStopwatchServer;
  v5 = -[MTStopwatchServer init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MTStopwatchServer setStorage:](v5, "setStorage:", v4);
    MTLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%{public}@ initialized with storage: %{public}@ ", buf, 0x16u);
    }

    MTStopwatchClientInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MTStopwatchServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.stopwatchserver"), v8, v6, v9, CFSTR("com.apple.MTStopwatchServer.wakeup"), CFSTR("com.apple.private.mobiletimerd"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[MTXPCConnectionListenerProvider providerWithConnectionInfo:errorHandler:](MTXPCConnectionListenerProvider, "providerWithConnectionInfo:errorHandler:", v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    connectionListenerProvider = v6->_connectionListenerProvider;
    v6->_connectionListenerProvider = (MTXPCConnectionListenerProvider *)v11;

    v13 = dispatch_queue_create("com.apple.mobiletimer.stopwatchserver.serializer", 0);
    -[MTStopwatchServer setSerializerQueue:](v6, "setSerializerQueue:", v13);

    objc_msgSend(v4, "registerObserver:", v6);
  }

  return v6;
}

- (void)startListening
{
  NSObject *v3;
  int v4;
  MTStopwatchServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_INFO, "%{public}@ startListening", (uint8_t *)&v4, 0xCu);
  }

  -[MTXPCConnectionListenerProvider startListening](self->_connectionListenerProvider, "startListening");
}

- (void)stopListening
{
  NSObject *v3;
  int v4;
  MTStopwatchServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_INFO, "%{public}@ stopListening", (uint8_t *)&v4, 0xCu);
  }

  -[MTXPCConnectionListenerProvider stopListening](self->_connectionListenerProvider, "stopListening");
}

- (void)handleSystemReady
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  MTStopwatchServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_INFO, "%{public}@ handleSystemReady", buf, 0xCu);
  }

  -[MTStopwatchServer serializerQueue](self, "serializerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MTStopwatchServer_handleSystemReady__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __38__MTStopwatchServer_handleSystemReady__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSystemReady");

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.MTStopwatchServer.ready"), 0, 0, 1);

}

- (void)testStopwatchWrite
{
  MTStopwatch *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = objc_alloc_init(MTStopwatch);
  v4 = (void *)-[MTStopwatch mutableCopy](v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartDate:", v5);

  -[MTStopwatchServer storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__MTStopwatchServer_testStopwatchWrite__block_invoke;
  v8[3] = &unk_1E39CC2D8;
  v8[4] = self;
  -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createStopWatch:withCompletion:source:", v4, v8, v7);

}

void __39__MTStopwatchServer_testStopwatchWrite__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__MTStopwatchServer_testStopwatchWrite__block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ wrote to stopwatch store successfully supposedly", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)_isSystemReady
{
  MTStopwatchServer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MTStopwatchServer serializerQueue](self, "serializerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MTStopwatchServer__isSystemReady__block_invoke;
  v5[3] = &unk_1E39CBB50;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__MTStopwatchServer__isSystemReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (id)_systemNotReadyError
{
  NSObject *v3;

  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[MTStopwatchServer _systemNotReadyError].cold.1((uint64_t)self, v3);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTStopwatchServer.wakeup"), 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getStopwatchesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  int v7;
  MTStopwatchServer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  MTLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ getStopwatchesWithCompletion", (uint8_t *)&v7, 0xCu);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getStopwatchesWitchCompletion:", v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)createStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  MTStopwatchServer *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ createStopwatch with id: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createStopWatch:withCompletion:source:", v6, v7, v11);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  MTStopwatchServer *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ updateStopwatch with id: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateStopwatch:withCompletion:source:", v6, v7, v11);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  MTStopwatchServer *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ deleteStopwatch with id: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteStopwatch:withCompletion:source:", v6, v7, v11);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  MTStopwatchServer *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  MTLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_INFO, "%{public}@ didAddLap lap: %{public}@ for stopwatch: %{public}@", (uint8_t *)&v14, 0x20u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didAddLap:forStopwatch:withCompletion:source:", v8, v9, v10, v13);

LABEL_7:
    goto LABEL_8;
  }
  if (v10)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTStopwatchServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didClearAllLapsForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didClearAllLapsForStopwatch:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTStopwatchServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didStartLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didStartLapTimerForStopwatch:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTStopwatchServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didPauseLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didPauseLapTimerForStopwatch:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTStopwatchServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didLapLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didLapLapTimerForStopwatch:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTStopwatchServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didResetLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didResetLapTimerForStopwatch:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTStopwatchServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  MTLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didResumeLapTimerForStopwatch for stopwatch: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (-[MTStopwatchServer _isSystemReady](self, "_isSystemReady"))
  {
    -[MTStopwatchServer storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionListenerProvider currentClient](self->_connectionListenerProvider, "currentClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didResumeLapTimerForStopwatch:withCompletion:source:", v6, v7, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    -[MTStopwatchServer _systemNotReadyError](self, "_systemNotReadyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didCreateStopWatch:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__MTStopwatchServer_didCreateStopWatch_source___block_invoke;
  v10[3] = &unk_1E39CE9A8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __47__MTStopwatchServer_didCreateStopWatch_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCreateStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didDeleteStopwatch:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__MTStopwatchServer_didDeleteStopwatch_source___block_invoke;
  v10[3] = &unk_1E39CE9A8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __47__MTStopwatchServer_didDeleteStopwatch_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didUpdateStopwatch:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__MTStopwatchServer_didUpdateStopwatch_source___block_invoke;
  v10[3] = &unk_1E39CE9A8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnAllClients:excludingClient:", v10, v7);

}

uint64_t __47__MTStopwatchServer_didUpdateStopwatch_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didDeleteStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__MTStopwatchServer_didAddLap_forStopwatch_source___block_invoke;
  v14[3] = &unk_1E39CE9D0;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "performBlockOnAllClients:excludingClient:", v14, v10);

}

uint64_t __51__MTStopwatchServer_didAddLap_forStopwatch_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didAddLap:forStopwatch:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__MTStopwatchServer_didClearAllLapsForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E39CE9A8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBlockOnAllClients:excludingClient:", v11, v8);

}

uint64_t __71__MTStopwatchServer_didClearAllLapsForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didClearAllLapsForStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MTStopwatchServer_didStartLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E39CE9A8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBlockOnAllClients:excludingClient:", v11, v8);

}

uint64_t __72__MTStopwatchServer_didStartLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStartLapTimerForStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MTStopwatchServer_didPauseLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E39CE9A8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBlockOnAllClients:excludingClient:", v11, v8);

}

uint64_t __72__MTStopwatchServer_didPauseLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didPauseLapTimerForStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__MTStopwatchServer_didLapLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E39CE9A8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBlockOnAllClients:excludingClient:", v11, v8);

}

uint64_t __70__MTStopwatchServer_didLapLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didLapLapTimerForStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MTStopwatchServer_didResetLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E39CE9A8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBlockOnAllClients:excludingClient:", v11, v8);

}

uint64_t __72__MTStopwatchServer_didResetLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didResetLapTimerForStopwatch:", *(_QWORD *)(a1 + 32));
}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  -[MTStopwatchServer connectionListenerProvider](self, "connectionListenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__MTStopwatchServer_didResumeLapTimerForStopwatch_withCompletion_source___block_invoke;
  v11[3] = &unk_1E39CE9A8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBlockOnAllClients:excludingClient:", v11, v8);

}

uint64_t __73__MTStopwatchServer_didResumeLapTimerForStopwatch_withCompletion_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didResumeLapTimerForStopwatch:", *(_QWORD *)(a1 + 32));
}

- (MTStopwatchStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (MTXPCConnectionListenerProvider)connectionListenerProvider
{
  return self->_connectionListenerProvider;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serializerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializerQueue, 0);
  objc_storeStrong((id *)&self->_connectionListenerProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __39__MTStopwatchServer_testStopwatchWrite__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ recieved stopwatch write error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_systemNotReadyError
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ System isn't ready...", (uint8_t *)&v2, 0xCu);
}

@end
