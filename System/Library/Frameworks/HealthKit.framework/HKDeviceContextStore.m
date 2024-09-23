@implementation HKDeviceContextStore

- (HKDeviceContextStore)initWithHealthStore:(id)a3
{
  id v5;
  HKDeviceContextStore *v6;
  HKDeviceContextStore *v7;
  HKTaskServerProxyProvider *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKDeviceContextStore;
  v6 = -[HKDeviceContextStore init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = [HKTaskServerProxyProvider alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, CFSTR("HKDeviceContextStoreServerIdentifier"), v7, v9);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

  }
  return v7;
}

- (void)fetchEntriesWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
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
  v10[2] = __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke;
  v10[3] = &unk_1E37EEA98;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchEntriesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__HKDeviceContextStore_fetchEntriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)numberOfDeviceContextsPerDeviceType:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
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
  v10[2] = __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke;
  v10[3] = &unk_1E37EEA98;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberOfDeviceContextsPerDeviceType:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__HKDeviceContextStore_numberOfDeviceContextsPerDeviceType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EFE8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_fetchEntriesWithCompletion_, 0, 1);

  return v2;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F048);
}

- (id)remoteInterface
{
  return +[HKDeviceContextStore serverInterface](HKDeviceContextStore, "serverInterface");
}

- (id)exportedInterface
{
  return +[HKDeviceContextStore clientInterface](HKDeviceContextStore, "clientInterface");
}

+ (id)taskIdentifier
{
  return CFSTR("HKDeviceContextStoreServerIdentifier");
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
