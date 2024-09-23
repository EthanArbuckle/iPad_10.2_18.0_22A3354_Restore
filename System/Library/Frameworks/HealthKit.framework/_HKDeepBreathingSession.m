@implementation _HKDeepBreathingSession

- (_HKDeepBreathingSession)initWithHealthStore:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  _HKDeepBreathingSession *v8;
  _HKDeepBreathingSession *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  OS_dispatch_queue *clientQueue;
  HKTaskServerProxyProvider *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_HKDeepBreathingSession;
  v8 = -[_HKDeepBreathingSession init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    HKCreateSerialDispatchQueue(v8, CFSTR("queue"));
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    HKCreateSerialDispatchQueue(v9, CFSTR("client"));
    v12 = objc_claimAutoreleasedReturnValue();
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v12;

    v14 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v14, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v6, v15, v9, v16);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = (HKTaskServerProxyProvider *)v17;

    -[HKProxyProvider setShouldRetryOnInterruption:](v9->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v9->_proxyProvider, "setTaskConfiguration:", v7);
    v9->_serverState = 2;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_HKDeepBreathingSession sessionConfiguration](self, "sessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, configuration:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3CD7E0);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F648);
}

- (void)connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___HKDeepBreathingSession_connectionInvalidated__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startSessionWithStartDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _HKDeepBreathingSession *v16;
  id v17;
  _QWORD aBlock[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke;
  aBlock[3] = &unk_1E37E9540;
  aBlock[4] = self;
  v19 = v7;
  v9 = v7;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_3;
  v14[3] = &unk_1E37F0CA0;
  v15 = v6;
  v16 = self;
  v17 = _Block_copy(aBlock);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_14;
  v12[3] = &unk_1E37E6B38;
  v13 = v17;
  v10 = v17;
  v11 = v6;
  -[_HKDeepBreathingSession fetchProxyWithHandler:errorHandler:](self, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

- (void)startGuiding
{
  -[_HKDeepBreathingSession fetchProxyWithHandler:errorHandler:](self, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_73, &__block_literal_global_16);
}

- (void)endSessionWithEndReason:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51___HKDeepBreathingSession_endSessionWithEndReason___block_invoke;
  v3[3] = &__block_descriptor_40_e41_v16__0____HKDeepBreathingSessionServer__8l;
  v3[4] = a3;
  -[_HKDeepBreathingSession fetchProxyWithHandler:errorHandler:](self, "fetchProxyWithHandler:errorHandler:", v3, &__block_literal_global_17);
}

- (void)fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  void (**v7)(id, void *);
  void *v8;
  id v9;

  v9 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[_HKDeepBreathingSession _isServerAttached](self, "_isServerAttached"))
  {
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", v9, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("requested server proxy while server is not attached (%ld)"), -[_HKDeepBreathingSession serverState](self, "serverState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8);

  }
}

- (void)_queue_deactivate
{
  -[_HKDeepBreathingSession _queue_transitionToServerState:](self, "_queue_transitionToServerState:", 1);
  -[HKProxyProvider invalidate](self->_proxyProvider, "invalidate");
}

- (_HKDeepBreathingSessionConfiguration)sessionConfiguration
{
  return (_HKDeepBreathingSessionConfiguration *)-[HKTaskServerProxyProvider taskConfiguration](self->_proxyProvider, "taskConfiguration");
}

- (int64_t)serverState
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___HKDeepBreathingSession_serverState__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_queue_transitionToServerState:(int64_t)a3
{
  NSObject *v6;
  int64_t serverState;
  void *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v6 = HKLogDeepBreathing;
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    serverState = self->_serverState;
    v9 = 134218240;
    v10 = serverState;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "transitioning server state (%ld -> %ld)", (uint8_t *)&v9, 0x16u);
  }
  if (a3 == 3 && self->_serverState != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDeepBreathingSession.m"), 154, CFSTR("cannot move from detached -> started"));

  }
  self->_serverState = a3;
}

- (void)_connectionDidEncounterError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___HKDeepBreathingSession__connectionDidEncounterError___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)_isServerAttached
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44___HKDeepBreathingSession__isServerAttached__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_queue_isServerAttached
{
  return self->_serverState != 1;
}

- (void)clientRemote_sessionDidReceiveHeartRate:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67___HKDeepBreathingSession_clientRemote_sessionDidReceiveHeartRate___block_invoke;
  v4[3] = &unk_1E37E8940;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)clientRemote_sessionDidReceiveError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___HKDeepBreathingSession_clientRemote_sessionDidReceiveError___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_queue_alertDelegateDidReceiveHeartRate:(double)a3
{
  _QWORD v5[5];
  id v6[2];
  id to;

  objc_copyWeak(&to, (id *)&self->_delegate);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___HKDeepBreathingSession__queue_alertDelegateDidReceiveHeartRate___block_invoke;
  v5[3] = &unk_1E37F0D68;
  objc_copyWeak(v6, &to);
  v5[4] = self;
  v6[1] = *(id *)&a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&to);
}

- (void)_queue_alertDelegateDidEncounterError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___HKDeepBreathingSession__queue_alertDelegateDidEncounterError___block_invoke;
  v6[3] = &unk_1E37F0D90;
  objc_copyWeak(&v8, &to);
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&to);
}

- (_HKDeepBreathingSessionDelegate)delegate
{
  return (_HKDeepBreathingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
