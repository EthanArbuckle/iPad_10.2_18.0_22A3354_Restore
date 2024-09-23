@implementation FCFetchedValueManager

uint64_t __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDependentManagersPromiseWithQualityOfService:", *(_QWORD *)(a1 + 40));
}

uint64_t __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__FCFetchedValueManager_initWithDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "isValue:equalToValue:", a2, a3);
}

uint64_t __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "observable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v3);

  return 0;
}

void __79__FCFetchedValueManager_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "valueWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (FCFetchedValueManager)initWithDescriptor:(id)a3
{
  id v4;
  FCFetchedValueManager *v5;
  uint64_t v6;
  FCFetchedValueDescriptor *descriptor;
  FCBoostableOperationThrottler *v8;
  FCBoostableOperationThrottler *operationThrottler;
  FCFetchedValueObservable *v10;
  void *v11;
  id v12;
  uint64_t v13;
  FCFetchedValueObservable *observable;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "descriptor");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCFetchedValueManager initWithDescriptor:]";
    v32 = 2080;
    v33 = "FCFetchedValueManager.m";
    v34 = 1024;
    v35 = 43;
    v36 = 2114;
    v37 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v28.receiver = self;
  v28.super_class = (Class)FCFetchedValueManager;
  v5 = -[FCFetchedValueManager init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    descriptor = v5->_descriptor;
    v5->_descriptor = (FCFetchedValueDescriptor *)v6;

    v8 = -[FCBoostableOperationThrottler initWithDelegate:]([FCBoostableOperationThrottler alloc], "initWithDelegate:", v5);
    operationThrottler = v5->_operationThrottler;
    v5->_operationThrottler = v8;

    v10 = [FCFetchedValueObservable alloc];
    objc_msgSend(v4, "fastCachedValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __44__FCFetchedValueManager_initWithDescriptor___block_invoke;
    v26[3] = &unk_1E4644288;
    v12 = v4;
    v27 = v12;
    v13 = -[FCFetchedValueObservable initWithManager:initialValue:equalityTest:](v10, "initWithManager:initialValue:equalityTest:", v5, v11, v26);
    observable = v5->_observable;
    v5->_observable = (FCFetchedValueObservable *)v13;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v12, "inputManagers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "addObserver:", v5);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(v12, "setObserver:", v5);
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueManager addObserver:]";
    v9 = 2080;
    v10 = "FCFetchedValueManager.m";
    v11 = 1024;
    v12 = 97;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFetchedValueManager observable](self, "observable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NFCopying)value
{
  void *v2;
  void *v3;

  -[FCFetchedValueManager observable](self, "observable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NFCopying *)v3;
}

- (FCFetchedValueObservable)observable
{
  return self->_observable;
}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  objc_msgSend(*(id *)(a1 + 40), "addObserver:", *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

id __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_cachePolicyForOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valuePromiseWithCachePolicy:qualityOfService:", v2, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id obj;
  _QWORD block[4];
  void *v24;
  id v25;
  id v26;
  _QWORD v27[7];
  _QWORD v28[4];
  id v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v20 = a3;
  v5 = (void *)objc_opt_new();
  v6 = dispatch_group_create();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v13, "removeObserver:", *(_QWORD *)(a1 + 32));
        dispatch_group_enter(v6);
        v14 = *(_QWORD *)(a1 + 40);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_2;
        v28[3] = &unk_1E4644328;
        v29 = v5;
        v30 = v13;
        v31 = *(_QWORD *)(a1 + 32);
        v32 = v6;
        objc_msgSend(v13, "fetchValueWithQualityOfService:completion:", v14, v28);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  if (FCDispatchGroupIsEmpty(v6))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_3;
    v27[3] = &unk_1E463CD80;
    v16 = v20;
    v15 = v21;
    v27[4] = v5;
    v27[5] = v20;
    v27[6] = v21;
    v17 = v5;
    __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_3((uint64_t)v27);
  }
  else
  {
    FCDispatchQueueForQualityOfService(*(_QWORD *)(a1 + 40));
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_4;
    block[3] = &unk_1E463CD80;
    v24 = v5;
    v16 = v20;
    v25 = v20;
    v15 = v21;
    v26 = v21;
    v19 = v5;
    dispatch_group_notify(v6, v18, block);

    v17 = v24;
  }

}

- (FCFetchedValueDescriptor)descriptor
{
  return self->_descriptor;
}

- (unint64_t)_cachePolicyForOptions:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (void)fetchValueWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  -[FCFetchedValueManager fetchValueWithCachePolicy:qualityOfService:completion:](self, "fetchValueWithCachePolicy:qualityOfService:completion:", 0, a3, a4);
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueManager removeObserver:]";
    v9 = 2080;
    v10 = "FCFetchedValueManager.m";
    v11 = 1024;
    v12 = 103;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFetchedValueManager observable](self, "observable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "readOnlyArray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
      objc_msgSend(v3, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 16, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "readOnlyArray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
      objc_msgSend(v3, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 16, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)operationThrottler:(id)a3 performAsyncOperationWithQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[7];
  _QWORD v28[6];

  v7 = a5;
  -[FCFetchedValueManager operationThrottler](self, "operationThrottler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mergedData");

  objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) == 0)
  {
    zalgo();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke;
    v28[3] = &unk_1E46442B0;
    v28[4] = self;
    v28[5] = a4;
    objc_msgSend(v10, "thenOn:then:", v12, v28);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_2;
  v27[3] = &unk_1E46442D8;
  v27[4] = self;
  v27[5] = v9;
  v27[6] = a4;
  objc_msgSend(v10, "thenOn:then:", v14, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_3;
  v26[3] = &unk_1E4644300;
  v26[4] = self;
  objc_msgSend(v15, "thenOn:then:", v16, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_4;
  v25[3] = &unk_1E463EA38;
  v25[4] = self;
  objc_msgSend(v17, "errorOn:error:", v18, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_5;
  v23[3] = &unk_1E463B598;
  v24 = v7;
  v21 = v7;
  v22 = (id)objc_msgSend(v19, "alwaysOn:always:", v20, v23);

}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  v9 = -[FCFetchedValueManager _optionsForCachePolicy:](self, "_optionsForCachePolicy:", a3);
  -[FCFetchedValueManager operationThrottler](self, "operationThrottler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__FCFetchedValueManager_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke;
  v12[3] = &unk_1E463B790;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "tickleWithQualityOfService:data:completion:", a4, v9, v12);

}

- (FCBoostableOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (unint64_t)_optionsForCachePolicy:(unint64_t)a3
{
  return 2 * (a3 == 1);
}

- (id)_updateDependentManagersPromiseWithQualityOfService:(int64_t)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke;
  v7[3] = &unk_1E4644350;
  v7[4] = self;
  v7[5] = a3;
  return (id)objc_msgSend(v5, "initWithResolver:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_operationThrottler, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (FCFetchedValueManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueManager init]";
    v9 = 2080;
    v10 = "FCFetchedValueManager.m";
    v11 = 1024;
    v12 = 38;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFetchedValueManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)fetchedValueDescriptorValueIsDirty:(id)a3
{
  id v3;

  -[FCFetchedValueManager operationThrottler](self, "operationThrottler", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tickleWithQualityOfService:data:completion:", 17, 1, 0);

}

- (void)fetchedObjectManager:(id)a3 valueDidChange:(id)a4
{
  id v4;

  -[FCFetchedValueManager operationThrottler](self, "operationThrottler", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tickleWithQualityOfService:data:completion:", 17, 1, 0);

}

void __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "observable");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (id)valuePromiseWithQualityOfService:(int64_t)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke;
  v7[3] = &unk_1E4644350;
  v7[4] = self;
  v7[5] = a3;
  return (id)objc_msgSend(v5, "initWithResolver:", v7);
}

void __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke_2;
  v11[3] = &unk_1E4644378;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "fetchValueWithQualityOfService:completion:", v7, v11);

}

uint64_t __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
