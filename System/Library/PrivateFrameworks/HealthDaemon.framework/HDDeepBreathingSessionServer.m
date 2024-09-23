@implementation HDDeepBreathingSessionServer

- (HDDeepBreathingSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDDeepBreathingSessionServer *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  _HKDeepBreathingSessionConfiguration *sessionConfiguration;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDDeepBreathingSessionServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(v10, "copy");
    sessionConfiguration = v11->_sessionConfiguration;
    v11->_sessionConfiguration = (_HKDeepBreathingSessionConfiguration *)v14;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[HKDaemonTransaction invalidate](self->_daemonTransaction, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDDeepBreathingSessionServer;
  -[HDDeepBreathingSessionServer dealloc](&v3, sel_dealloc);
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6F70], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HDDeepBreathingSessionServer_connectionInvalidated__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__HDDeepBreathingSessionServer_connectionInvalidated__block_invoke(uint64_t a1)
{
  -[HDDeepBreathingSessionServer _queue_deactivate](*(_QWORD *)(a1 + 32));
}

- (void)_queue_deactivate
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB52B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B8], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      v6 = 138412290;
      v7 = (id)objc_opt_class();
      v4 = v7;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%@ deactivate", (uint8_t *)&v6, 0xCu);

    }
    if (*(_QWORD *)(a1 + 64) == 1)
    {
      *(_QWORD *)(a1 + 64) = 2;
      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v5 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

- (void)remote_startSessionWithStartDate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  id *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _HKDeepBreathingSessionConfiguration *sessionConfiguration;
  NSObject *queue;
  NSObject *v15;
  void *v16;
  _QWORD v17[6];
  uint8_t v18[4];
  void *v19;
  _BYTE buf[24];
  _HKDeepBreathingSessionConfiguration *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  _HKInitializeLogging();
  v9 = (id *)MEMORY[0x1E0CB52B8];
  v10 = (void *)*MEMORY[0x1E0CB52B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[HDStandardTaskServer taskUUID](self, "taskUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sessionConfiguration = self->_sessionConfiguration;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v21 = sessionConfiguration;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "start session %{public}@ with start date: %{public}@, configuration: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v21) = 0;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__HDDeepBreathingSessionServer_remote_startSessionWithStartDate_completion___block_invoke;
  v17[3] = &unk_1E6CED168;
  v17[4] = self;
  v17[5] = buf;
  dispatch_sync(queue, v17);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    _HKInitializeLogging();
    v15 = *v9;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%@ called on server that has already been started. Returning early.", v18, 0xCu);

    }
  }
  v8[2](v8, 1, 0);
  _Block_object_dispose(buf, 8);

}

void __76__HDDeepBreathingSessionServer_remote_startSessionWithStartDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && !*(_QWORD *)(v2 + 48))
  {
    +[HKDaemonTransaction transactionWithOwner:](HDDaemonTransaction, "transactionWithOwner:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 64))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  else
    *(_QWORD *)(v2 + 64) = 1;
}

- (void)remote_startGuiding
{
  NSObject *v2;
  uint8_t v3[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB52B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "start guiding", v3, 2u);
  }
}

- (void)remote_endSessionWithEndReason:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HDDeepBreathingSessionServer_remote_endSessionWithEndReason___block_invoke;
  v4[3] = &unk_1E6CE8058;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __63__HDDeepBreathingSessionServer_remote_endSessionWithEndReason___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int AppBooleanValue;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  double v16;
  void *v17;
  __int128 v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    _HKInitializeLogging();
    v3 = (os_log_t *)MEMORY[0x1E0CB52B8];
    v4 = (void *)*MEMORY[0x1E0CB52B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = v4;
      objc_msgSend(v5, "numberWithInteger:", v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = 138412290;
      *(_QWORD *)((char *)&v18 + 4) = v7;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "ending session with endReason=%@", (uint8_t *)&v18, 0xCu);

    }
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableDemoMode"), CFSTR("com.apple.DeepBreathing"), 0);
    v9 = 0;
    if ((objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode") & 1) == 0 && !AppBooleanValue)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistentDomainForName:", *MEMORY[0x1E0CB7790]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB77A0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v9 = objc_msgSend(v12, "BOOLValue");
      else
        v9 = 1;

    }
    _HKInitializeLogging();
    v14 = *v3;
    v15 = os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v15)
      {
        LOWORD(v18) = 0;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "returning fake heartrate for simulator", (uint8_t *)&v18, 2u);
      }
      v16 = 72.0;
    }
    else
    {
      v16 = 0.0;
      if (v15)
      {
        LOWORD(v18) = 0;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "not using healthlite, returning no heartrate", (uint8_t *)&v18, 2u);
      }
    }
    *(_QWORD *)&v18 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v18 + 1) = 3221225472;
    v19 = __77__HDDeepBreathingSessionServer__queue_alertClientSessionDidReceiveHeartRate___block_invoke;
    v20 = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v21 = sel__queue_alertClientSessionDidReceiveHeartRate_;
    objc_msgSend(v1, "remoteObjectProxyWithErrorHandler:", &v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientRemote_sessionDidReceiveHeartRate:", v16);

    -[HDDeepBreathingSessionServer _queue_deactivate]((uint64_t)v1);
  }
}

void __77__HDDeepBreathingSessionServer__queue_alertClientSessionDidReceiveHeartRate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B8], OS_LOG_TYPE_ERROR))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = v4;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "(%@) error fetching client proxy: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_daemonTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
