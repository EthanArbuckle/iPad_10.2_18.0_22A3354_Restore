@implementation HKNanoSyncControl

- (HKNanoSyncControl)initWithHealthStore:(id)a3
{
  id v4;
  HKNanoSyncControl *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKNanoSyncControl;
  v5 = -[HKNanoSyncControl init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)fetchNanoSyncPairedDevicesWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke;
  v10[3] = &unk_1E37E8760;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchNanoSyncPairedDevicesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceNanoSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke;
  v12[3] = &unk_1E37E8788;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_forceNanoSyncWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceNanoSyncWithPullRequest:(BOOL)a3 completion:(id)a4
{
  -[HKNanoSyncControl forceNanoSyncWithOptions:completion:](self, "forceNanoSyncWithOptions:completion:", a3, a4);
}

- (void)forceLastChanceNanoSyncWithCompletion:(id)a3
{
  -[HKNanoSyncControl forceNanoSyncWithOptions:completion:](self, "forceNanoSyncWithOptions:completion:", 3, a3);
}

- (void)resetNanoSyncWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
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
  v10[2] = __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke;
  v10[3] = &unk_1E37E8760;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetNanoSyncWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HKProxyProvider *proxyProvider;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  double v21;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "pairingID");
    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke;
  v18[3] = &unk_1E37E87B0;
  v19 = v8;
  v21 = a4;
  v20 = v11;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_waitForLastChanceSyncWithDevicePairingID:timeout:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
