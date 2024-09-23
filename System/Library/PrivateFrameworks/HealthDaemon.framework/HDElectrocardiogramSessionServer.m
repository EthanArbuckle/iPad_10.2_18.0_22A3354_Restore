@implementation HDElectrocardiogramSessionServer

- (HDElectrocardiogramSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDElectrocardiogramSessionServer *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  HKElectrocardiogramSessionConfiguration *sessionConfiguration;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDElectrocardiogramSessionServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    objc_msgSend(v10, "sessionConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    sessionConfiguration = v11->_sessionConfiguration;
    v11->_sessionConfiguration = (HKElectrocardiogramSessionConfiguration *)v14;

  }
  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB7088];
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
  void *v6;

  objc_msgSend(a3, "sessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("Session configuration is nil"));
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6670], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6670], "clientInterface");
}

- (void)connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDElectrocardiogramSessionServer_connectionInvalidated__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connectionInterrupted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDElectrocardiogramSessionServer_connectionInterrupted__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)remote_startWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDElectrocardiogramSessionServer_remote_startWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__HDElectrocardiogramSessionServer_remote_startWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(id, _QWORD, void *);
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(id, _QWORD, void *))*(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 48));
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      v11 = (id)objc_opt_class();
      v5 = v11;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session start", buf, 0xCu);

    }
    v6 = *(_QWORD *)(v1 + 56);
    if (v6)
    {
      v7 = CFSTR("Not Started");
      if (v6 == 1)
        v7 = CFSTR("Started");
      if (v6 == 2)
        v8 = CFSTR("Ended");
      else
        v8 = v7;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Cannot start session in state: %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v2[2](v2, 0, v9);

    }
    else
    {
      *(_QWORD *)(v1 + 56) = 1;
      v2[2](v2, 1, 0);
    }
  }

}

- (void)remote_abortWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDElectrocardiogramSessionServer_remote_abortWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__HDElectrocardiogramSessionServer_remote_abortWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(id, uint64_t, _QWORD);
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(id, uint64_t, _QWORD))*(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 48));
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      v11 = (id)objc_opt_class();
      v5 = v11;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session abort", buf, 0xCu);

    }
    v6 = *(_QWORD *)(v1 + 56);
    if (v6 == 1)
    {
      *(_QWORD *)(v1 + 56) = 2;
      objc_msgSend((id)v1, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_202_1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientRemote_didEndWithReason:error:", 2, 0);

      v2[2](v2, 1, 0);
    }
    else
    {
      v8 = CFSTR("Not Started");
      if (v6 == 2)
        v8 = CFSTR("Ended");
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Cannot abort session in state: %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v2)[2](v2, 0, v9);

    }
  }

}

void __81__HDElectrocardiogramSessionServer__queue_notifyClientDidEndWithEndReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Error notifiying ECG Session client of session end: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
}

@end
