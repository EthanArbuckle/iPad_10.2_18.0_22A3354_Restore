@implementation HKHealthStoreProvider

- (HKHealthStoreProvider)init
{
  HKHealthStore *v3;
  HKHealthStoreProvider *v4;

  v3 = objc_alloc_init(HKHealthStore);
  v4 = -[HKHealthStoreProvider initWithHealthStore:](self, "initWithHealthStore:", v3);

  return v4;
}

- (HKHealthStoreProvider)initWithHealthStore:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *v5;
  void *v6;
  void *v7;
  HKTaskServerProxyProvider *v8;
  HKHealthStoreProvider *v9;

  v4 = a3;
  v5 = [HKTaskServerProxyProvider alloc];
  objc_msgSend((id)objc_opt_class(), "taskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v5, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v6, self, v7);

  -[HKProxyProvider setShouldRetryOnInterruption:](v8, "setShouldRetryOnInterruption:", 0);
  v9 = -[HKHealthStoreProvider initWithProxyProvider:](self, "initWithProxyProvider:", v8);

  return v9;
}

- (HKHealthStoreProvider)initWithProxyProvider:(id)a3
{
  id v5;
  HKHealthStoreProvider *v6;
  HKHealthStoreProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthStoreProvider;
  v6 = -[HKHealthStoreProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxyProvider, a3);

  return v7;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)fetchStoreForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E37E9540;
  v9 = v7;
  v23 = v9;
  v10 = v6;
  v22 = v10;
  v11 = _Block_copy(aBlock);
  -[HKHealthStoreProviderProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v9;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E37F0570;
  v19 = v10;
  v20 = v12;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_3;
  v16[3] = &unk_1E37E6B38;
  v13 = v9;
  v14 = v12;
  v15 = v10;
  -[HKHealthStoreProvider _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v3 = -[HKHealthStore _initWithIdentifier:]([HKHealthStore alloc], "_initWithIdentifier:", *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

uint64_t __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchForIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __60__HKHealthStoreProvider_fetchStoreForIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAvailableIdentifiersWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKHealthStoreProviderProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke;
  v9[3] = &unk_1E37F0598;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthStoreProvider _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAvailableIdentifiersWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__HKHealthStoreProvider_fetchAvailableIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationToNewStoreWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37F05C0;
  v6 = v4;
  v16 = v6;
  v7 = _Block_copy(aBlock);
  -[HKHealthStoreProviderProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v6;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_2;
  v13[3] = &unk_1E37F0598;
  v14 = v8;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_3;
  v11[3] = &unk_1E37E6B38;
  v9 = v6;
  v10 = v8;
  -[HKHealthStoreProvider _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

void __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = -[HKHealthStore _initWithIdentifier:]([HKHealthStore alloc], "_initWithIdentifier:", v5);
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

uint64_t __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestAuthorizationToNewIdentifierWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__HKHealthStoreProvider_requestAuthorizationToNewStoreWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationToNewStoreToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke;
  aBlock[3] = &unk_1E37F05C0;
  v12 = v10;
  v26 = v12;
  v13 = _Block_copy(aBlock);
  -[HKHealthStoreProviderProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v12;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_2;
  v21[3] = &unk_1E37F05E8;
  v22 = v8;
  v23 = v9;
  v24 = v14;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_3;
  v19[3] = &unk_1E37E6B38;
  v15 = v12;
  v16 = v14;
  v17 = v9;
  v18 = v8;
  -[HKHealthStoreProvider _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v21, v19);

}

void __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = -[HKHealthStore _initWithIdentifier:]([HKHealthStore alloc], "_initWithIdentifier:", v5);
    (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

uint64_t __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestAuthorizationToNewIdentifierToShareTypes:readTypes:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKHealthStoreProvider_requestAuthorizationToNewStoreToShareTypes_readTypes_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKHealthStoreProviderProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
