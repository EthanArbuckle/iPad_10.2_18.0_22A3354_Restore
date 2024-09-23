@implementation HKNotificationStore

- (HKNotificationStore)initWithHealthStore:(id)a3
{
  id v4;
  HKNotificationStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKNotificationStore;
  v5 = -[HKNotificationStore init](&v12, sel_init);
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

- (void)fetchBadgeForDomain:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HKNotificationStore_fetchBadgeForDomain_completion___block_invoke;
  v12[3] = &unk_1E37F6EF8;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __54__HKNotificationStore_fetchBadgeForDomain_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __54__HKNotificationStore_fetchBadgeForDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchBadgeForDomain:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __54__HKNotificationStore_fetchBadgeForDomain_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__HKNotificationStore_setBadge_forDomain_completion___block_invoke;
  v16[3] = &unk_1E37F6F20;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __53__HKNotificationStore_setBadge_forDomain_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __53__HKNotificationStore_setBadge_forDomain_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setBadge:forDomain:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __53__HKNotificationStore_setBadge_forDomain_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HKNotificationStore_postCompanionUserNotificationOfType_completion___block_invoke;
  v12[3] = &unk_1E37F6EF8;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __70__HKNotificationStore_postCompanionUserNotificationOfType_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __70__HKNotificationStore_postCompanionUserNotificationOfType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_postCompanionUserNotificationOfType:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70__HKNotificationStore_postCompanionUserNotificationOfType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__HKNotificationStore_postNotificationWithRequest_completion___block_invoke;
  v14[3] = &unk_1E37F6F48;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __62__HKNotificationStore_postNotificationWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __62__HKNotificationStore_postNotificationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_postNotificationWithRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __62__HKNotificationStore_postNotificationWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
