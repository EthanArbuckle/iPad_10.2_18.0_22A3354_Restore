@implementation HKSeriesBuilder

- (HKSeriesBuilder)init
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

- (id)_initWithHealthStore:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSeriesBuilder *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  NSUUID *identifier;
  uint64_t v19;
  OS_dispatch_queue *completionQueue;
  uint64_t v21;
  OS_dispatch_queue *resourceQueue;
  uint64_t v23;
  HKSeriesBuilderConfiguration *configuration;
  HKRetryableOperation *v25;
  HKRetryableOperation *retryableOperation;
  void *v27;
  HKTaskServerProxyProvider *v28;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)HKSeriesBuilder;
  v12 = -[HKSeriesBuilder init](&v31, sel_init);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    objc_msgSend(v11, "device");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v11, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    }
    if (v10)
    {
      v17 = objc_msgSend(v10, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v17;

    HKCreateSerialDispatchQueue(v12, CFSTR("completionQueue"));
    v19 = objc_claimAutoreleasedReturnValue();
    completionQueue = v12->_completionQueue;
    v12->_completionQueue = (OS_dispatch_queue *)v19;

    HKCreateSerialDispatchQueue(v12, CFSTR("resourceQueue"));
    v21 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v12->_resourceQueue;
    v12->_resourceQueue = (OS_dispatch_queue *)v21;

    v23 = objc_msgSend(v11, "copy");
    configuration = v12->_configuration;
    v12->_configuration = (HKSeriesBuilderConfiguration *)v23;

    objc_storeStrong((id *)&v12->_store, a3);
    atomic_store(0, (unsigned int *)&v12->_state);
    v25 = -[HKRetryableOperation initWithQueue:retryCount:]([HKRetryableOperation alloc], "initWithQueue:retryCount:", v12->_resourceQueue, 5);
    retryableOperation = v12->_retryableOperation;
    v12->_retryableOperation = v25;

    objc_msgSend((id)objc_opt_class(), "taskServerIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9, v27, v12, v12->_identifier);
      proxyProvider = v12->_proxyProvider;
      v12->_proxyProvider = v28;

      -[HKTaskServerProxyProvider setTaskConfiguration:](v12->_proxyProvider, "setTaskConfiguration:", v11);
    }

  }
  return v12;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSeriesBuilderStateToString(-[HKSeriesBuilder state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)discard
{
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__31;
  v9 = __Block_byref_object_dispose__31;
  v10 = 0;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__HKSeriesBuilder_discard__block_invoke;
  v4[3] = &unk_1E37E6958;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  objc_msgSend((id)v6[5], "raise");
  _Block_object_dispose(&v5, 8);

}

uint64_t __26__HKSeriesBuilder_discard__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__HKSeriesBuilder_discard__block_invoke_2;
  v3[3] = &unk_1E37E6BD8;
  v3[4] = v1;
  return objc_msgSend(v1, "_resourceQueue_discardWithHandler:", v3);
}

void __26__HKSeriesBuilder_discard__block_invoke_2(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG))
    __26__HKSeriesBuilder_discard__block_invoke_2_cold_1(a1, v2);
}

- (void)freezeBuilderWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v12 = v4;
    v6 = _Block_copy(aBlock);

  }
  else
  {
    v6 = 0;
  }
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E66E8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_4;
  v5[3] = &unk_1E37F0BF8;
  v5[4] = v2;
  return objc_msgSend(v3, "_queue_performRetryableOperation:completion:", v5, v1);
}

void __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_5;
  v9[3] = &unk_1E37F0BD0;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_7;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v9, v7);

}

void __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_6;
  v3[3] = &unk_1E37E6AE8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_freezeWithCompletion:", v3);

}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__HKSeriesBuilder_freezeBuilderWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recoverWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v12 = v4;
    v6 = _Block_copy(aBlock);

  }
  else
  {
    v6 = 0;
  }
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E66E8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __41__HKSeriesBuilder_recoverWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_4;
  v5[3] = &unk_1E37F0BF8;
  v5[4] = v2;
  return objc_msgSend(v3, "_queue_performRetryableOperation:completion:", v5, v1);
}

void __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_5;
  v9[3] = &unk_1E37F0BD0;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_7;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v9, v7);

}

void __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_6;
  v3[3] = &unk_1E37E6AE8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_recoverWithCompletion:", v3);

}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__HKSeriesBuilder_recoverWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  HKRetryableOperation *retryableOperation;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6 && objc_msgSend(v6, "count"))
  {
    retryableOperation = self->_retryableOperation;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke;
    v10[3] = &unk_1E37E6B60;
    v10[4] = self;
    v11 = v6;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v10, v7);

  }
  else
  {
    v7[2](v7, 1, 0);
  }

}

void __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2;
  v10[3] = &unk_1E37F0C20;
  v11 = v4;
  v12 = v3;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_4;
  v8[3] = &unk_1E37E6B38;
  v9 = v12;
  v7 = v12;
  objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

void __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addMetadata:completion:", v3, v4);

}

uint64_t __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__HKSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_discardWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  HKRetryableOperation *retryableOperation;
  _QWORD v13[5];

  v4 = a3;
  -[HKSeriesBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HKSeriesBuilder state](self, "state");
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99750];
    v10 = objc_opt_class();
    v11 = "discarded";
    if (v7 == 2)
      v11 = "completed";
    objc_msgSend(v8, "raise:format:", v9, CFSTR("%@ series has been %s."), v10, v11);
  }
  if (!v4)
    v4 = &__block_literal_global_72;
  retryableOperation = self->_retryableOperation;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_2;
  v13[3] = &unk_1E37F0BF8;
  v13[4] = self;
  -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v13, v4);

}

void __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_3;
  v9[3] = &unk_1E37F0BD0;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_5;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v9, v7);

}

void __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_4;
  v3[3] = &unk_1E37E6AE8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_discardWithCompletion:", v3);

}

uint64_t __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__HKSeriesBuilder__resourceQueue_discardWithHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setState:(int64_t)a3
{
  atomic_store(a3, (unsigned int *)&self->_state);
}

- (int64_t)state
{
  return (int)atomic_load((unsigned int *)&self->_state);
}

- (void)clientRemote_didChangeToState:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[HKSeriesBuilder setState:](self, "setState:", a3);
  v6[2](v6, 1, 0);

}

+ (id)taskServerIdentifier
{
  return 0;
}

+ (id)clientInterface
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B6DB8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureClientInterface:", v3);
  return v3;
}

+ (id)serverInterface
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE408428);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureServerInterface:", v3);
  return v3;
}

+ (void)configureServerInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "hk_secureCodingClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_addMetadata_completion_, 0, 0);

}

- (id)exportedInterface
{
  return +[HKSeriesBuilder clientInterface](HKSeriesBuilder, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKSeriesBuilder serverInterface](HKSeriesBuilder, "serverInterface");
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (HKRetryableOperation)retryableOperation
{
  return self->_retryableOperation;
}

- (void)setRetryableOperation:(id)a3
{
  objc_storeStrong((id *)&self->_retryableOperation, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKSeriesBuilderConfiguration)configuration
{
  return self->_configuration;
}

- (HKHealthStore)store
{
  return self->_store;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_retryableOperation, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __26__HKSeriesBuilder_discard__block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = objc_begin_catch(a1);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_end_catch();
}

void __26__HKSeriesBuilder_discard__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_debug_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEBUG, "%@ series discarded", (uint8_t *)&v3, 0xCu);

}

@end
