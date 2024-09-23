@implementation HKElectrocardiogramSession

+ (BOOL)isElectrocardiogramSessionAvailable
{
  return MGGetBoolAnswer();
}

- (HKElectrocardiogramSession)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKElectrocardiogramSession)initWithHealthStore:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  HKElectrocardiogramSession *v9;
  HKElectrocardiogramSession *v10;
  HKElectrocardiogramSessionTaskConfiguration *v11;
  HKTaskServerProxyProvider *v12;
  HKHealthStore *healthStore;
  void *v14;
  uint64_t v15;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKElectrocardiogramSession;
  v9 = -[HKElectrocardiogramSession init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_sessionConfiguration, a4);
    v11 = objc_alloc_init(HKElectrocardiogramSessionTaskConfiguration);
    -[HKElectrocardiogramSessionTaskConfiguration setSessionConfiguration:](v11, "setSessionConfiguration:", v8);
    v12 = [HKTaskServerProxyProvider alloc];
    healthStore = v10->_healthStore;
    objc_msgSend(v8, "sessionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v12, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HDElectrocardiogramSessionServerIdentifier"), v10, v14);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v15;

    -[HKProxyProvider setShouldRetryOnInterruption:](v10->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v11);

  }
  return v10;
}

- (void)startWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HKElectrocardiogramSession_startWithCompletion___block_invoke;
  v10[3] = &unk_1E37F0340;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __50__HKElectrocardiogramSession_startWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __50__HKElectrocardiogramSession_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKElectrocardiogramSession_startWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)abortWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke;
  v10[3] = &unk_1E37F0340;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_abortWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_didDetectContactAtDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HKElectrocardiogramSession_clientRemote_didDetectContactAtDate___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__HKElectrocardiogramSession_clientRemote_didDetectContactAtDate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v4, "electrocardiogramSession:didDetectContactAtDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)clientRemote_didEndWithReason:(int64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKElectrocardiogramSession_clientRemote_didEndWithReason_error___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __66__HKElectrocardiogramSession_clientRemote_didEndWithReason_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  objc_msgSend(WeakRetained, "electrocardiogramSession:didEndWithReason:error:", a1[4], a1[6], a1[5]);

}

- (void)clientRemote_didDetectEmergencyCallbackModeWithEndDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__HKElectrocardiogramSession_clientRemote_didDetectEmergencyCallbackModeWithEndDate___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __85__HKElectrocardiogramSession_clientRemote_didDetectEmergencyCallbackModeWithEndDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "electrocardiogramSession:didDetectEmergencyCallbackModeWithEndDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3CA800);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F528);
}

- (id)exportedInterface
{
  return +[HKElectrocardiogramSession clientInterface](HKElectrocardiogramSession, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKElectrocardiogramSession serverInterface](HKElectrocardiogramSession, "serverInterface");
}

- (void)connectionInterrupted
{
  NSObject *v3;
  _QWORD block[5];

  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HKElectrocardiogramSession_connectionInterrupted__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(v3, block);

}

void __51__HKElectrocardiogramSession_connectionInterrupted__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Connection interrupted"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "electrocardiogramSession:didEndWithReason:error:", *(_QWORD *)(a1 + 32), 0, v3);

}

- (HKElectrocardiogramSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (HKElectrocardiogramSessionDelegate)delegate
{
  return (HKElectrocardiogramSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
