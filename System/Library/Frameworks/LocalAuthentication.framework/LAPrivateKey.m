@implementation LAPrivateKey

- (LAPrivateKey)initWithKey:(id)a3
{
  id v5;
  LAPrivateKey *v6;
  LAPrivateKey *v7;
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
  v19.super_class = (Class)LAPrivateKey;
  v6 = -[LAPrivateKey init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LAPrivateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CC1318], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_instanceID = objc_msgSend(v10, "nextInstanceIDInDomain:", CFSTR("LAPrivateKey"));

    LA_LOG_5();
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

  LA_LOG_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LARightStore dealloc].cold.1((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)LAPrivateKey;
  -[LAPrivateKey dealloc](&v10, sel_dealloc);
}

- (id)identifier
{
  return (id)-[LAKeyStoreKey identifier](self->_key, "identifier");
}

- (id)right
{
  return objc_loadWeakRetained((id *)&self->_right);
}

- (void)setRight:(id)a3
{
  objc_storeWeak((id *)&self->_right, a3);
}

- (LAPublicKey)publicKey
{
  LAPublicKey *v3;
  id WeakRetained;

  v3 = -[LAPublicKey initWithKey:]([LAPublicKey alloc], "initWithKey:", self->_key);
  WeakRetained = objc_loadWeakRetained((id *)&self->_right);
  -[LAPublicKey setRight:](v3, "setRight:", WeakRetained);

  return v3;
}

- (void)signData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  NSData *v8;
  void *v9;
  NSObject *workQueue;
  NSData *v11;
  id v12;
  _QWORD v13[5];
  NSData *v14;
  id v15;
  id v16[2];
  id location;

  v8 = data;
  v9 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke;
  v13[3] = &unk_1E707A9D8;
  v13[4] = self;
  objc_copyWeak(v16, &location);
  v14 = v8;
  v15 = v9;
  v16[1] = (id)algorithm;
  v11 = v8;
  v12 = v9;
  dispatch_async(workQueue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8[2];

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.sign", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_2;
  block[3] = &unk_1E707A9D8;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(void **)(a1 + 64);
  v6 = v3;
  v8[1] = v4;
  os_activity_apply(v2, block);

  objc_destroyWeak(v8);
}

void __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD *v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  LA_LOG_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ sign started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)WeakRetained + 1);
    v7 = v6 == 0;

    if (v7)
    {
      LA_LOG_5();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = LALogTypeForInternalError();
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B971E000, v16, v17, "The right associated with this key was deallocated", buf, 2u);
      }

      v18 = *(_QWORD *)(a1 + 48);
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("The right associated with this key was deallocated"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

    }
    else
    {
      v8 = (void *)v5[2];
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 64);
      -[LAPrivateKey context]((uint64_t)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_10;
      v20[3] = &unk_1E7079BD0;
      objc_copyWeak(&v22, (id *)(a1 + 56));
      v21 = *(id *)(a1 + 48);
      objc_msgSend(v8, "signData:secKeyAlgorithm:context:completion:", v9, v10, v11, v20);

      objc_destroyWeak(&v22);
    }
  }
  else
  {
    LA_LOG_5();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = LALogTypeForInternalError();
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v12, v13, "Operation interrupted", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 48);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

  }
}

- (id)context
{
  id WeakRetained;
  void *v2;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __52__LAPrivateKey_signData_secKeyAlgorithm_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_5();
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
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ sign finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)canSignUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.canSign", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__LAPrivateKey_canSignUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E707AA00;
  block[4] = self;
  block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __44__LAPrivateKey_canSignUsingSecKeyAlgorithm___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "canSignUsingSecKeyAlgorithm:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)decryptData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  NSData *v8;
  void *v9;
  NSObject *workQueue;
  NSData *v11;
  id v12;
  _QWORD v13[5];
  NSData *v14;
  id v15;
  id v16[2];
  id location;

  v8 = data;
  v9 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke;
  v13[3] = &unk_1E707A9D8;
  v13[4] = self;
  objc_copyWeak(v16, &location);
  v14 = v8;
  v15 = v9;
  v16[1] = (id)algorithm;
  v11 = v8;
  v12 = v9;
  dispatch_async(workQueue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8[2];

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.decrypt", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_2;
  block[3] = &unk_1E707A9D8;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(void **)(a1 + 64);
  v6 = v3;
  v8[1] = v4;
  os_activity_apply(v2, block);

  objc_destroyWeak(v8);
}

void __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD *v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  LA_LOG_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ decrypt started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)WeakRetained + 1);
    v7 = v6 == 0;

    if (v7)
    {
      LA_LOG_5();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = LALogTypeForInternalError();
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B971E000, v16, v17, "The right associated with this key was deallocated", buf, 2u);
      }

      v18 = *(_QWORD *)(a1 + 48);
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("The right associated with this key was deallocated"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

    }
    else
    {
      v8 = (void *)v5[2];
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 64);
      -[LAPrivateKey context]((uint64_t)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_18;
      v20[3] = &unk_1E7079BD0;
      objc_copyWeak(&v22, (id *)(a1 + 56));
      v21 = *(id *)(a1 + 48);
      objc_msgSend(v8, "decryptData:secKeyAlgorithm:context:completion:", v9, v10, v11, v20);

      objc_destroyWeak(&v22);
    }
  }
  else
  {
    LA_LOG_5();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = LALogTypeForInternalError();
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v12, v13, "Operation interrupted", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 48);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

  }
}

void __55__LAPrivateKey_decryptData_secKeyAlgorithm_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_5();
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
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ decrypt finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)canDecryptUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.canDecrypt", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__LAPrivateKey_canDecryptUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E707AA00;
  block[4] = self;
  block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __47__LAPrivateKey_canDecryptUsingSecKeyAlgorithm___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "canDecryptUsingSecKeyAlgorithm:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)exchangeKeysWithPublicKey:(NSData *)publicKey secKeyAlgorithm:(SecKeyAlgorithm)algorithm secKeyParameters:(NSDictionary *)parameters completion:(void *)handler
{
  NSData *v10;
  NSDictionary *v11;
  void *v12;
  NSObject *workQueue;
  NSDictionary *v14;
  NSData *v15;
  id v16;
  _QWORD block[5];
  NSData *v18;
  NSDictionary *v19;
  id v20;
  id v21[2];
  id location;

  v10 = publicKey;
  v11 = parameters;
  v12 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke;
  block[3] = &unk_1E707AA28;
  block[4] = self;
  objc_copyWeak(v21, &location);
  v19 = v11;
  v20 = v12;
  v21[1] = (id)algorithm;
  v18 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(workQueue, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9[2];

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.exchangeKeys", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_2;
  v5[3] = &unk_1E707AA28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(v9, (id *)(a1 + 64));
  v8 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 40);
  v4 = *(void **)(a1 + 72);
  v6 = v3;
  v9[1] = v4;
  v7 = *(id *)(a1 + 48);
  os_activity_apply(v2, v5);

  objc_destroyWeak(v9);
}

void __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD *v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  LA_LOG_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ exchangeKeys started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)WeakRetained + 1);
    v7 = v6 == 0;

    if (v7)
    {
      LA_LOG_5();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = LALogTypeForInternalError();
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B971E000, v17, v18, "The right associated with this key was deallocated", buf, 2u);
      }

      v19 = *(_QWORD *)(a1 + 56);
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("The right associated with this key was deallocated"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

    }
    else
    {
      v8 = (void *)v5[2];
      v9 = *(_QWORD *)(a1 + 72);
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      -[LAPrivateKey context]((uint64_t)v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_19;
      v21[3] = &unk_1E7079BD0;
      objc_copyWeak(&v23, (id *)(a1 + 64));
      v22 = *(id *)(a1 + 56);
      objc_msgSend(v8, "exchangeKeysWithPublicKey:secKeyAlgorithm:secKeyParameters:context:completion:", v11, v9, v10, v12, v21);

      objc_destroyWeak(&v23);
    }
  }
  else
  {
    LA_LOG_5();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = LALogTypeForInternalError();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v13, v14, "Operation interrupted", buf, 2u);
    }

    v15 = *(_QWORD *)(a1 + 56);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

  }
}

void __86__LAPrivateKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_5();
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
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ exchangeKeys finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.canExchangeKeys", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__LAPrivateKey_canExchangeKeysUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E707AA00;
  block[4] = self;
  block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __52__LAPrivateKey_canExchangeKeysUsingSecKeyAlgorithm___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "canExchangeKeysUsingSecKeyAlgorithm:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LAPrivateKey[%u]"), self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_right);
}

@end
