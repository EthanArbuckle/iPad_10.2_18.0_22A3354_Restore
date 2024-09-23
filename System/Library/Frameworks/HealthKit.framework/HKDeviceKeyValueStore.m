@implementation HKDeviceKeyValueStore

- (HKDeviceKeyValueStore)initWithProtectionCategory:(int64_t)a3 domain:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  HKDeviceKeyValueStore *v10;
  HKTaskServerProxyProvider *v11;
  void *v12;
  uint64_t v13;
  HKTaskServerProxyProvider *proxyProvider;
  HKDeviceKeyValueStoreTaskConfiguration *v15;
  void *v16;
  uint64_t v17;
  NSString *domain;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKDeviceKeyValueStore;
  v10 = -[HKDeviceKeyValueStore init](&v20, sel_init);
  if (v10)
  {
    v11 = [HKTaskServerProxyProvider alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v11, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9, CFSTR("HKDeviceKeyValueStoreServerIdentifier"), v10, v12);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v13;

    v15 = objc_alloc_init(HKDeviceKeyValueStoreTaskConfiguration);
    v16 = (void *)objc_msgSend(v8, "copy");
    -[HKDeviceKeyValueStoreTaskConfiguration setDomain:](v15, "setDomain:", v16);

    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v15);
    v10->_protectionCategory = a3;
    v17 = objc_msgSend(v8, "copy");
    domain = v10->_domain;
    v10->_domain = (NSString *)v17;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)fetchEntriesForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke;
  v14[3] = &unk_1E37EC550;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchEntriesForDomain:key:protectionCategory:completion:", *(_QWORD *)(a1[4] + 40), a1[5], *(_QWORD *)(a1[4] + 32), a1[6]);
}

uint64_t __55__HKDeviceKeyValueStore_fetchEntriesForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)mostRecentEntryForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke;
  v14[3] = &unk_1E37EC550;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_mostRecentEntryForDomain:key:protectionCategory:completion:", *(_QWORD *)(a1[4] + 40), a1[5], *(_QWORD *)(a1[4] + 32), a1[6]);
}

uint64_t __58__HKDeviceKeyValueStore_mostRecentEntryForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HKDeviceKeyValueStore *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke;
  v18[3] = &unk_1E37EC578;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v22;
  v13 = v22;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setData:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(_QWORD *)(a1[6] + 40), *(_QWORD *)(a1[6] + 32), a1[7]);
}

uint64_t __51__HKDeviceKeyValueStore_setData_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HKDeviceKeyValueStore *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke;
  v18[3] = &unk_1E37EC578;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v22;
  v13 = v22;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDate:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(_QWORD *)(a1[6] + 40), *(_QWORD *)(a1[6] + 32), a1[7]);
}

uint64_t __51__HKDeviceKeyValueStore_setDate_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HKDeviceKeyValueStore *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke;
  v18[3] = &unk_1E37EC578;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v22;
  v13 = v22;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setNumber:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(_QWORD *)(a1[6] + 40), *(_QWORD *)(a1[6] + 32), a1[7]);
}

uint64_t __53__HKDeviceKeyValueStore_setNumber_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HKDeviceKeyValueStore *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke;
  v18[3] = &unk_1E37EC578;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v22;
  v13 = v22;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setString:forKey:domainName:protectionCategory:completion:", a1[4], a1[5], *(_QWORD *)(a1[6] + 40), *(_QWORD *)(a1[6] + 32), a1[7]);
}

uint64_t __53__HKDeviceKeyValueStore_setString_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startObservingDeviceKeyValueStoreWithCompletion:(id)a3
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
  v10[2] = __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke;
  v10[3] = &unk_1E37EC5A0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingDeviceKeyValueStoreWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__HKDeviceKeyValueStore_startObservingDeviceKeyValueStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HKDeviceKeyValueStoreDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HKDeviceKeyValueStoreDelegate *)WeakRetained;
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EB68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_fetchEntriesForDomain_key_protectionCategory_completion_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_mostRecentEntryForDomain_key_protectionCategory_completion_, 0, 1);

  return v2;
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3BD6A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup_, 0, 0);

  return v2;
}

- (id)remoteInterface
{
  return +[HKDeviceKeyValueStore serverInterface](HKDeviceKeyValueStore, "serverInterface");
}

- (id)exportedInterface
{
  return +[HKDeviceKeyValueStore clientInterface](HKDeviceKeyValueStore, "clientInterface");
}

+ (id)taskIdentifier
{
  return CFSTR("HKDeviceKeyValueStoreServerIdentifier");
}

- (void)clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3
{
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__HKDeviceKeyValueStore_clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup___block_invoke;
    block[3] = &unk_1E37E6980;
    v8 = WeakRetained;
    v9 = v6;
    dispatch_sync(v5, block);

  }
}

uint64_t __82__HKDeviceKeyValueStore_clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "deviceKeyValueStoreDidUpdateForStorageGroup:", *(_QWORD *)(a1 + 40));
  return result;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (int64_t)protectionCategory
{
  return self->_protectionCategory;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
