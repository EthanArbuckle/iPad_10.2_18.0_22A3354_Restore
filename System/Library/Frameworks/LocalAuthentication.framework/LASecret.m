@implementation LASecret

- (LASecret)initWithGenericPassword:(id)a3
{
  id v5;
  LASecret *v6;
  LASecret *v7;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)LASecret;
  v6 = -[LASecret init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_genp, a3);
    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LASecret"));
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CC1318], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_instanceID = objc_msgSend(v10, "nextInstanceIDInDomain:", CFSTR("LASecret"));

    LA_LOG_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[LARightStore init].cold.1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  LA_LOG_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LARightStore dealloc].cold.1((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)LASecret;
  -[LASecret dealloc](&v10, sel_dealloc);
}

- (id)identifier
{
  return (id)-[LAKeyStoreGenericPassword identifier](self->_genp, "identifier");
}

- (id)right
{
  return objc_loadWeakRetained((id *)&self->_right);
}

- (void)setRight:(id)a3
{
  objc_storeWeak((id *)&self->_right, a3);
}

- (void)loadDataWithCompletion:(void *)handler
{
  void *v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__LASecret_loadDataWithCompletion___block_invoke;
  v7[3] = &unk_1E7079490;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__LASecret_loadDataWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4;
  id v5;

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.fetchData", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__LASecret_loadDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E7079490;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, block);

  objc_destroyWeak(&v5);
}

void __35__LASecret_loadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *WeakRetained;
  id *v5;
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  LA_LOG_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v23 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_INFO, "%{public}@ fetchData", buf, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 1);
    v7 = v6 == 0;

    if (v7)
    {
      LA_LOG_2();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = LALogTypeForInternalError();
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B971E000, v15, v16, "The right associated with this secret was deallocated", buf, 2u);
      }

      v17 = *(_QWORD *)(a1 + 40);
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("The right associated with this secret was deallocated"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

    }
    else
    {
      v8 = v5[2];
      v9 = objc_loadWeakRetained(v5 + 1);
      objc_msgSend(v9, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __35__LASecret_loadDataWithCompletion___block_invoke_9;
      v19[3] = &unk_1E7079BD0;
      objc_copyWeak(&v21, (id *)(a1 + 48));
      v20 = *(id *)(a1 + 40);
      objc_msgSend(v8, "fetchDataWithContext:completion:", v10, v19);

      objc_destroyWeak(&v21);
    }
  }
  else
  {
    LA_LOG_2();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = LALogTypeForInternalError();
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v11, v12, "Operation interrupted", buf, 2u);
    }

    v13 = *(_QWORD *)(a1 + 40);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
}

void __35__LASecret_loadDataWithCompletion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  id WeakRetained;
  __CFString *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  LA_LOG_2();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err=%@)"), v5);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = &stru_1E707B3F8;
    v9 = OS_LOG_TYPE_INFO;
  }
  *(_DWORD *)buf = 138543618;
  v13 = WeakRetained;
  v14 = 2114;
  v15 = v11;
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ fetchData finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LASecret[%u]"), self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_genp, 0);
  objc_destroyWeak((id *)&self->_right);
}

@end
