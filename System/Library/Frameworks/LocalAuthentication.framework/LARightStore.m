@implementation LARightStore

- (LARightStore)init
{
  LARightStore *v2;
  uint64_t v3;
  LAKeyStore *keyStore;
  uint64_t v5;
  OS_dispatch_queue *workQueue;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LARightStore;
  v2 = -[LARightStore init](&v16, sel_init);
  if (v2)
  {
    +[LAKeyStoreBuilder buildKeyStore](LAKeyStoreBuilder, "buildKeyStore");
    v3 = objc_claimAutoreleasedReturnValue();
    keyStore = v2->_keyStore;
    v2->_keyStore = (LAKeyStore *)v3;

    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LARightStore"));
    v5 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CC1318], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_instanceID = objc_msgSend(v7, "nextInstanceIDInDomain:", CFSTR("LARightStore"));

    LA_LOG_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[LARightStore init].cold.1((uint64_t)v2, v8, v9, v10, v11, v12, v13, v14);

  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0(&dword_1B971E000, a2, a3, "%{public}@ deallocated", a5, a6, a7, a8, 2u);
}

+ (LARightStore)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_2);
  return (LARightStore *)(id)sharedStore_sharedInstance;
}

void __27__LARightStore_sharedStore__block_invoke()
{
  LARightStore *v0;
  void *v1;

  v0 = objc_alloc_init(LARightStore);
  v1 = (void *)sharedStore_sharedInstance;
  sharedStore_sharedInstance = (uint64_t)v0;

}

- (void)rightForIdentifier:(NSString *)identifier completion:(void *)handler
{
  NSString *v6;
  void *v7;
  NSObject *workQueue;
  NSString *v9;
  id v10;
  _QWORD block[5];
  NSString *v12;
  id v13;
  id v14;
  id location;

  v6 = identifier;
  v7 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke;
  block[3] = &unk_1E70796B8;
  block[4] = self;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  os_activity_t v6;
  id v7;
  id v8;

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.rightForIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E7079690;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = v2;
  v3 = v2;
  os_activity_apply(v3, block);

  objc_destroyWeak(&v8);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v20 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ rightForIdentifier started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = (id *)(a1 + 40);
    +[LAKeyIdentifier defaultAccessKeyIdentifierForRightWithIdentifier:](LAKeyIdentifier, "defaultAccessKeyIdentifierForRightWithIdentifier:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAKeyIdentifier domainForRightWithIdentifier:](LAKeyIdentifier, "domainForRightWithIdentifier:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)WeakRetained[1];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_11;
    v13[3] = &unk_1E7079668;
    v14 = *(id *)(a1 + 48);
    objc_copyWeak(&v18, (id *)(a1 + 64));
    v17 = *(id *)(a1 + 56);
    v9 = v7;
    v15 = v9;
    v16 = *v5;
    objc_msgSend(v8, "fetchKeyWithIdentifier:domain:completion:", v6, v9, v13);

    objc_destroyWeak(&v18);
  }
  else
  {
    LA_LOG_0();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = LALogTypeForInternalError();
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v10, v11, "Operation interrupted", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 56);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v6);
  }

}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_11(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2_12;
  block[3] = &unk_1E70795F0;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_copyWeak(&v17, a1 + 8);
  v16 = a1[7];
  v13 = a1[5];
  v14 = a1[4];
  v15 = a1[6];
  os_activity_apply(v7, block);

  objc_destroyWeak(&v17);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_12(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  LAAccessKey *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  LAAccessKey *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    LA_LOG_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
      v3 = LALogTypeForInternalError();
    else
      v3 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v2, v3))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("successfully");
      }
      *(_DWORD *)buf = 138543618;
      v24 = WeakRetained;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1B971E000, v2, v3, "%{public}@ rightForIdentifier finished %{public}@", buf, 0x16u);
      if (v11)

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      __46__LARightStore_rightForIdentifier_completion___block_invoke_2_12_cold_1();
    v4 = -[LAAccessKey initWithKey:]([LAAccessKey alloc], "initWithKey:", *(_QWORD *)(a1 + 40));
    v5 = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 1);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_21;
      v16[3] = &unk_1E7079618;
      v8 = *(_QWORD *)(a1 + 48);
      v17 = *(id *)(a1 + 56);
      objc_copyWeak(&v22, (id *)(a1 + 80));
      v21 = *(id *)(a1 + 72);
      v18 = *(id *)(a1 + 48);
      v19 = *(id *)(a1 + 64);
      v20 = v4;
      objc_msgSend(v7, "fetchGenericPasswordsWithDomain:completion:", v8, v16);

      objc_destroyWeak(&v22);
      v9 = v17;
    }
    else
    {
      LA_LOG_0();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = LALogTypeForInternalError();
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B971E000, v13, v14, "Operation interrupted", buf, 2u);
      }

      v15 = *(_QWORD *)(a1 + 72);
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v9);
    }

  }
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_21(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2_22;
  v10[3] = &unk_1E7079640;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_copyWeak(&v18, a1 + 9);
  v17 = a1[8];
  v13 = a1[5];
  v14 = a1[4];
  v15 = a1[6];
  v16 = a1[7];
  os_activity_apply(v7, v10);

  objc_destroyWeak(&v18);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_22(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  LASecret *v8;
  void *v9;
  LASecret *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  id WeakRetained;
  uint64_t v20;
  __CFString *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!+[LAAuthorizationError isResourceNotFoundError:](LAAuthorizationError, "isResourceNotFoundError:"))
    {
      LA_LOG_0();
      v2 = objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 32))
        v3 = LALogTypeForInternalError();
      else
        v3 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v2, v3))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
        v20 = *(_QWORD *)(a1 + 32);
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = CFSTR("successfully");
        }
        *(_DWORD *)buf = 138543618;
        v32 = WeakRetained;
        v33 = 2114;
        v34 = v21;
        _os_log_impl(&dword_1B971E000, v2, v3, "%{public}@ rightForIdentifier finished %{public}@", buf, 0x16u);
        if (v20)

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      return;
    }
  }
  else if (!*(_QWORD *)(a1 + 40))
  {
    __46__LARightStore_rightForIdentifier_completion___block_invoke_2_22_cold_1();
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_24;
  v29[3] = &unk_1E70795A0;
  v7 = v4;
  v30 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v29);
  if (!objc_msgSend(v7, "count"))
  {
    v8 = [LASecret alloc];
    +[LAKeyStoreItemBuilder buildNullGenericPassword](LAKeyStoreItemBuilder, "buildNullGenericPassword");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LASecret initWithGenericPassword:](v8, "initWithGenericPassword:", v9);
    objc_msgSend(v7, "addObject:", v10);

  }
  v11 = objc_loadWeakRetained((id *)(a1 + 88));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)*((_QWORD *)v11 + 1);
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_28;
    v22[3] = &unk_1E7079618;
    v14 = *(_QWORD *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    objc_copyWeak(&v28, (id *)(a1 + 88));
    v27 = *(id *)(a1 + 80);
    v24 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 72);
    v26 = v7;
    objc_msgSend(v13, "fetchKeysWithDomain:completion:", v14, v22);

    objc_destroyWeak(&v28);
    v15 = v23;
  }
  else
  {
    LA_LOG_0();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = LALogTypeForInternalError();
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v16, v17, "Operation interrupted", buf, 2u);
    }

    v18 = *(_QWORD *)(a1 + 80);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v15);
  }

}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_24(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  LASecret *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[LASecret initWithGenericPassword:]([LASecret alloc], "initWithGenericPassword:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2_29;
  block[3] = &unk_1E70795F0;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_copyWeak(&v17, (id *)(a1 + 72));
  v16 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  os_activity_apply(v7, block);

  objc_destroyWeak(&v17);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_29(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  LAPersistedRight *v10;
  id WeakRetained;
  uint64_t v12;
  __CFString *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    LA_LOG_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
      v3 = LALogTypeForInternalError();
    else
      v3 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v2, v3))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = CFSTR("successfully");
      }
      *(_DWORD *)buf = 138543618;
      v17 = WeakRetained;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1B971E000, v2, v3, "%{public}@ rightForIdentifier finished %{public}@", buf, 0x16u);
      if (v12)

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      __46__LARightStore_rightForIdentifier_completion___block_invoke_2_29_cold_1();
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v5 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_31;
    v14[3] = &unk_1E70795C8;
    v15 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
    LA_LOG_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 80));
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rightForIdentifier finished successfully", buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 72);
    v10 = -[LAPersistedRight initWithIdentifier:accessKey:privateKeys:secrets:]([LAPersistedRight alloc], "initWithIdentifier:accessKey:privateKeys:secrets:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6, *(_QWORD *)(a1 + 64));
    (*(void (**)(uint64_t, LAPersistedRight *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  LAPrivateKey *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[LAPrivateKey initWithKey:]([LAPrivateKey alloc], "initWithKey:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

- (void)saveRight:(LARight *)right identifier:(NSString *)identifier completion:(void *)handler
{
  LARight *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSString *v12;
  LARight *v13;
  NSObject *activity;
  _QWORD block[5];
  LARight *v16;
  NSString *v17;
  id v18;

  v8 = right;
  v9 = identifier;
  v10 = handler;
  activity = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.saveRight", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__LARightStore_saveRight_identifier_completion___block_invoke;
  block[3] = &unk_1E70794E0;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  os_activity_apply(activity, block);

}

void __48__LARightStore_saveRight_identifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ saveRight started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__LARightStore_saveRight_identifier_completion___block_invoke_37;
  v7[3] = &unk_1E70796E0;
  objc_copyWeak(&v9, (id *)buf);
  v8 = *(id *)(a1 + 56);
  -[LARightStore _saveRight:identifier:secret:completion:](v4, v5, v6, 0, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __48__LARightStore_saveRight_identifier_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), v5);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = OS_LOG_TYPE_DEFAULT;
    v11 = CFSTR("successfully");
  }
  *(_DWORD *)buf = 138543618;
  v13 = WeakRetained;
  v14 = 2114;
  v15 = v11;
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ saveRight finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_saveRight:(void *)a3 identifier:(void *)a4 secret:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v13 = a1[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke;
    block[3] = &unk_1E7079848;
    block[4] = a1;
    objc_copyWeak(&v19, &location);
    v18 = v12;
    v15 = v10;
    v16 = v9;
    v17 = v11;
    dispatch_async(v13, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

- (void)saveRight:(LARight *)right identifier:(NSString *)identifier secret:(NSData *)secret completion:(void *)handler
{
  LARight *v10;
  NSString *v11;
  NSData *v12;
  void *v13;
  id v14;
  NSData *v15;
  NSString *v16;
  LARight *v17;
  NSObject *activity;
  _QWORD block[5];
  LARight *v20;
  NSString *v21;
  NSData *v22;
  id v23;

  v10 = right;
  v11 = identifier;
  v12 = secret;
  v13 = handler;
  activity = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.saveRightWithSecret", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__LARightStore_saveRight_identifier_secret_completion___block_invoke;
  block[3] = &unk_1E7079708;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  os_activity_apply(activity, block);

}

void __55__LARightStore_saveRight_identifier_secret_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ saveRightWithSecret started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__LARightStore_saveRight_identifier_secret_completion___block_invoke_39;
  v8[3] = &unk_1E70796E0;
  objc_copyWeak(&v10, (id *)buf);
  v9 = *(id *)(a1 + 64);
  -[LARightStore _saveRight:identifier:secret:completion:](v4, v5, v6, v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __55__LARightStore_saveRight_identifier_secret_completion___block_invoke_39(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), v5);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = OS_LOG_TYPE_DEFAULT;
    v11 = CFSTR("successfully");
  }
  *(_DWORD *)buf = 138543618;
  v13 = WeakRetained;
  v14 = 2114;
  v15 = v11;
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ saveRightWithSecret finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)removeRight:(LAPersistedRight *)right completion:(void *)handler
{
  LAPersistedRight *v6;
  void *v7;
  id v8;
  LAPersistedRight *v9;
  NSObject *activity;
  _QWORD block[5];
  LAPersistedRight *v12;
  id v13;

  v6 = right;
  v7 = handler;
  activity = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.removeRight", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__LARightStore_removeRight_completion___block_invoke;
  block[3] = &unk_1E7079730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

void __39__LARightStore_removeRight_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRight started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  v4 = a1[4];
  objc_msgSend(a1[5], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__LARightStore_removeRight_completion___block_invoke_40;
  v6[3] = &unk_1E7079220;
  objc_copyWeak(&v8, (id *)buf);
  v7 = a1[6];
  objc_msgSend(v4, "removeRightForIdentifier:completion:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __39__LARightStore_removeRight_completion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  id WeakRetained;
  __CFString *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LA_LOG_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), v3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = OS_LOG_TYPE_DEFAULT;
    v8 = CFSTR("successfully");
  }
  *(_DWORD *)buf = 138543618;
  v10 = WeakRetained;
  v11 = 2114;
  v12 = v8;
  _os_log_impl(&dword_1B971E000, v5, v6, "%{public}@ removeRight finished %{public}@", buf, 0x16u);
  if (v3)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)removeRightForIdentifier:(NSString *)identifier completion:(void *)handler
{
  NSString *v6;
  void *v7;
  NSObject *workQueue;
  NSString *v9;
  id v10;
  _QWORD block[5];
  NSString *v12;
  id v13;
  id v14;
  id location;

  v6 = identifier;
  v7 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__LARightStore_removeRightForIdentifier_completion___block_invoke;
  block[3] = &unk_1E70796B8;
  block[4] = self;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__LARightStore_removeRightForIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.removeRightForIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__LARightStore_removeRightForIdentifier_completion___block_invoke_2;
  v3[3] = &unk_1E70796B8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, v3);

  objc_destroyWeak(&v6);
}

void __52__LARightStore_removeRightForIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRightForIdentifier started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    +[LAKeyIdentifier domainForRightWithIdentifier:](LAKeyIdentifier, "domainForRightWithIdentifier:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)WeakRetained[1];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__LARightStore_removeRightForIdentifier_completion___block_invoke_42;
    v10[3] = &unk_1E7079220;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "removeItemsWithDomain:completion:", v5, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    LA_LOG_0();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = LALogTypeForInternalError();
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v7, v8, "Operation interrupted", buf, 2u);
    }

    v9 = *(_QWORD *)(a1 + 48);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v5);
  }

}

void __52__LARightStore_removeRightForIdentifier_completion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  id WeakRetained;
  __CFString *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LA_LOG_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), v3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = OS_LOG_TYPE_DEFAULT;
    v8 = CFSTR("successfully");
  }
  *(_DWORD *)buf = 138543618;
  v10 = WeakRetained;
  v11 = 2114;
  v12 = v8;
  _os_log_impl(&dword_1B971E000, v5, v6, "%{public}@ removeRightForIdentifier finished %{public}@", buf, 0x16u);
  if (v3)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)removeAllRightsWithCompletion:(void *)handler
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
  v7[2] = __46__LARightStore_removeAllRightsWithCompletion___block_invoke;
  v7[3] = &unk_1E7079490;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__LARightStore_removeAllRightsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4;
  id v5;

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.removeAllRights", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_removeAllRightsWithCompletion___block_invoke_2;
  block[3] = &unk_1E7079490;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, block);

  objc_destroyWeak(&v5);
}

void __46__LARightStore_removeAllRightsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ removeAllRights started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__LARightStore_removeAllRightsWithCompletion___block_invoke_43;
    v11[3] = &unk_1E7079220;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "removeItemsWithCompletion:", v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    LA_LOG_0();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = LALogTypeForInternalError();
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v7, v8, "Operation interrupted", buf, 2u);
    }

    v9 = *(_QWORD *)(a1 + 40);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __46__LARightStore_removeAllRightsWithCompletion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  id WeakRetained;
  __CFString *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LA_LOG_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), v3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = OS_LOG_TYPE_DEFAULT;
    v8 = CFSTR("successfully");
  }
  *(_DWORD *)buf = 138543618;
  v10 = WeakRetained;
  v11 = 2114;
  v12 = v8;
  _os_log_impl(&dword_1B971E000, v5, v6, "%{public}@ removeAllRights finished %{public}@", buf, 0x16u);
  if (v3)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)keyStore
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (void)setKeyStore:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);

}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;
  os_activity_t v7;
  id v8;
  id v9;
  id v10;

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization._saveRight", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2;
  block[3] = &unk_1E7079820;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v10, (id *)(a1 + 72));
  v9 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = *(id *)(a1 + 56);
  v3 = v2;
  os_activity_apply(v3, block);

  objc_destroyWeak(&v10);
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  LA_LOG_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v23 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ _saveRight started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    +[LAKeyIdentifier defaultAccessKeyIdentifierForRightWithIdentifier:](LAKeyIdentifier, "defaultAccessKeyIdentifierForRightWithIdentifier:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAKeyIdentifier domainForRightWithIdentifier:](LAKeyIdentifier, "domainForRightWithIdentifier:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)WeakRetained[1];
    objc_msgSend(*(id *)(a1 + 48), "accessKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_44;
    v15[3] = &unk_1E70797F8;
    v16 = *(id *)(a1 + 56);
    objc_copyWeak(&v21, (id *)(a1 + 80));
    v20 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 40);
    v10 = v6;
    v19 = v10;
    objc_msgSend(v14, "storeKeyWithIdentifier:domain:protectedBy:completion:", v5, v10, v9, v15);

    objc_destroyWeak(&v21);
  }
  else
  {
    LA_LOG_0();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = LALogTypeForInternalError();
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v11, v12, "Operation interrupted", buf, 2u);
    }

    v13 = *(_QWORD *)(a1 + 72);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v5);
  }

}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_44(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_45;
  v10[3] = &unk_1E70797D0;
  v11 = v6;
  v8 = v6;
  objc_copyWeak(&v18, a1 + 9);
  v17 = a1[8];
  v12 = a1[5];
  v13 = a1[6];
  v14 = a1[7];
  v15 = v5;
  v16 = a1[4];
  v9 = v5;
  os_activity_apply(v7, v10);

  objc_destroyWeak(&v18);
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_45(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    LA_LOG_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
      v3 = LALogTypeForInternalError();
    else
      v3 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v2, v3))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("successfully");
      }
      *(_DWORD *)buf = 138543618;
      v26 = WeakRetained;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_1B971E000, v2, v3, "%{public}@ _saveRight finished %{public}@", buf, 0x16u);
      if (v11)

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 88));
    v5 = v4;
    if (v4)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        +[LAKeyIdentifier defaultSecretIdentifierForRightWithIdentifier:](LAKeyIdentifier, "defaultSecretIdentifierForRightWithIdentifier:", *(_QWORD *)(a1 + 48));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)v5[1];
        v7 = *(_QWORD *)(a1 + 56);
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 64), "publicKeyHash");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_46;
        v18[3] = &unk_1E70797A8;
        v19 = *(id *)(a1 + 72);
        objc_copyWeak(&v24, (id *)(a1 + 88));
        v23 = *(id *)(a1 + 80);
        v20 = *(id *)(a1 + 32);
        v21 = *(id *)(a1 + 56);
        v22 = *(id *)(a1 + 48);
        objc_msgSend(v6, "storeGenericPassword:identifier:domain:protectedBy:completion:", v8, v17, v7, v9, v18);

        objc_destroyWeak(&v24);
      }
      else
      {
        objc_msgSend(v4, "rightForIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
      }
    }
    else
    {
      LA_LOG_0();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = LALogTypeForInternalError();
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B971E000, v13, v14, "Operation interrupted", buf, 2u);
      }

      v15 = *(_QWORD *)(a1 + 80);
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    }
  }
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_46(id *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = a1[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_47;
  block[3] = &unk_1E7079780;
  objc_copyWeak(&v14, a1 + 9);
  v13 = a1[8];
  v8 = v4;
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[4];
  v6 = v4;
  os_activity_apply(v5, block);

  objc_destroyWeak(&v14);
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_47(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      LA_LOG_0();
      v4 = objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 40))
        v5 = LALogTypeForInternalError();
      else
        v5 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v4, v5))
      {
        v11 = objc_loadWeakRetained(v2);
        v12 = *(_QWORD *)(a1 + 40);
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 40));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = CFSTR("successfully");
        }
        *(_DWORD *)buf = 138543618;
        v24 = v11;
        v25 = 2114;
        v26 = v13;
        _os_log_impl(&dword_1B971E000, v4, v5, "%{public}@ _saveRight finished %{public}@", buf, 0x16u);
        if (v12)

      }
      v14 = (void *)WeakRetained[1];
      v15 = *(_QWORD *)(a1 + 48);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_48;
      v20[3] = &unk_1E7079468;
      v22 = *(id *)(a1 + 72);
      v21 = *(id *)(a1 + 32);
      objc_msgSend(v14, "removeItemsWithDomain:completion:", v15, v20);

      v9 = v22;
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_52;
      v16[3] = &unk_1E7079758;
      v10 = *(_QWORD *)(a1 + 56);
      v17 = *(id *)(a1 + 64);
      objc_copyWeak(&v19, v2);
      v18 = *(id *)(a1 + 72);
      objc_msgSend(WeakRetained, "rightForIdentifier:completion:", v10, v16);

      objc_destroyWeak(&v19);
      v9 = v17;
    }
  }
  else
  {
    LA_LOG_0();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = LALogTypeForInternalError();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v6, v7, "Operation interrupted", buf, 2u);
    }

    v8 = *(_QWORD *)(a1 + 72);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }

}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CC1310];
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v7;
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithCode:withUnderlyingErrors:", -1008, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v10);

  if (!v3)
  {

    if (v6)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_9;
LABEL_7:

}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_3;
  v11[3] = &unk_1E70796B8;
  v12 = v6;
  v8 = v6;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v9 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v9;
  v10 = v5;
  os_activity_apply(v7, v11);

  objc_destroyWeak(&v15);
}

uint64_t __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  __CFString *v9;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  LA_LOG_0();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (*(_QWORD *)(a1 + 32))
      v5 = LALogTypeForInternalError();
    else
      v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, v5))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = CFSTR("successfully");
      }
      *(_DWORD *)buf = 138543618;
      v12 = WeakRetained;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1B971E000, v4, v5, "%{public}@ _saveRight finished %{public}@", buf, 0x16u);
      if (v8)

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1B971E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ _saveRight finished successfully", buf, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LARightStore[%u]"), self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_1B971E000, a2, a3, "%{public}@ initialized", a5, a6, a7, a8, 2u);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_12_cold_1()
{
  __assert_rtn("-[LARightStore rightForIdentifier:completion:]_block_invoke_2", "LARightStore.m", 85, "err != nil || key != nil");
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_22_cold_1()
{
  __assert_rtn("-[LARightStore rightForIdentifier:completion:]_block_invoke_2", "LARightStore.m", 101, "err != nil || genps != nil");
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_29_cold_1()
{
  __assert_rtn("-[LARightStore rightForIdentifier:completion:]_block_invoke_2", "LARightStore.m", 125, "err != nil || keys != nil");
}

@end
