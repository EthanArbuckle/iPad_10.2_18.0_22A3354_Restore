@implementation LAPublicKey

- (LAPublicKey)initWithKey:(id)a3
{
  id v5;
  LAPublicKey *v6;
  LAPublicKey *v7;
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
  v19.super_class = (Class)LAPublicKey;
  v6 = -[LAPublicKey init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LAPublicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CC1318], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_instanceID = objc_msgSend(v10, "nextInstanceIDInDomain:", CFSTR("LAPublicKey"));

    LA_LOG_4();
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

  LA_LOG_4();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LARightStore dealloc].cold.1((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)LAPublicKey;
  -[LAPublicKey dealloc](&v10, sel_dealloc);
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

- (void)exportBytesWithCompletion:(void *)handler
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
  v7[2] = __41__LAPublicKey_exportBytesWithCompletion___block_invoke;
  v7[3] = &unk_1E7079490;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__LAPublicKey_exportBytesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4;
  id v5;

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.exportBytes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__LAPublicKey_exportBytesWithCompletion___block_invoke_2;
  block[3] = &unk_1E7079490;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, block);

  objc_destroyWeak(&v5);
}

void __41__LAPublicKey_exportBytesWithCompletion___block_invoke_2(uint64_t a1)
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
  LA_LOG_4();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ exportBytes started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 2);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__LAPublicKey_exportBytesWithCompletion___block_invoke_7;
    v11[3] = &unk_1E7079BD0;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "exportBytesWithCompletion:", v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    LA_LOG_4();
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
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

void __41__LAPublicKey_exportBytesWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_4();
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
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ exportBytes finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)encryptData:(NSData *)data secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
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
  v13[2] = __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke;
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

void __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8[2];

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.encrypt", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_2;
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

void __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  LA_LOG_4();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ encrypt started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 2);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 64);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_15;
    v13[3] = &unk_1E7079BD0;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v6, "encryptData:secKeyAlgorithm:completion:", v7, v8, v13);

    objc_destroyWeak(&v15);
  }
  else
  {
    LA_LOG_4();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = LALogTypeForInternalError();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v9, v10, "Operation interrupted", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
}

void __54__LAPublicKey_encryptData_secKeyAlgorithm_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
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
  LA_LOG_4();
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
  _os_log_impl(&dword_1B971E000, v8, v9, "%{public}@ encrypt finished %{public}@", buf, 0x16u);
  if (v5)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)canEncryptUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
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
  v5 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.canEncrypt", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LAPublicKey_canEncryptUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E707AA00;
  block[4] = self;
  block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __46__LAPublicKey_canEncryptUsingSecKeyAlgorithm___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "canEncryptUsingSecKeyAlgorithm:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)verifyData:(NSData *)signedData signature:(NSData *)signature secKeyAlgorithm:(SecKeyAlgorithm)algorithm completion:(void *)handler
{
  NSData *v10;
  NSData *v11;
  void *v12;
  NSObject *workQueue;
  NSData *v14;
  NSData *v15;
  id v16;
  _QWORD block[5];
  NSData *v18;
  NSData *v19;
  id v20;
  id v21[2];
  id location;

  v10 = signedData;
  v11 = signature;
  v12 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke;
  block[3] = &unk_1E707AA28;
  block[4] = self;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = (id)algorithm;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(workQueue, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9[2];

  v2 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.verify", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_2;
  v5[3] = &unk_1E707AA28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(v9, (id *)(a1 + 64));
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(void **)(a1 + 72);
  v7 = v3;
  v9[1] = v4;
  os_activity_apply(v2, v5);

  objc_destroyWeak(v9);
}

void __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  LA_LOG_4();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ verify started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 2);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 72);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_16;
    v14[3] = &unk_1E7079220;
    objc_copyWeak(&v16, (id *)(a1 + 64));
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v6, "verifyData:signature:secKeyAlgorithm:completion:", v7, v8, v9, v14);

    objc_destroyWeak(&v16);
  }
  else
  {
    LA_LOG_4();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = LALogTypeForInternalError();
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B971E000, v10, v11, "Operation interrupted", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 56);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __63__LAPublicKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke_16(uint64_t a1, void *a2)
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
  LA_LOG_4();
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
  _os_log_impl(&dword_1B971E000, v5, v6, "%{public}@ verify finished %{public}@", buf, 0x16u);
  if (v3)

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)canVerifyUsingSecKeyAlgorithm:(SecKeyAlgorithm)algorithm
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
  v5 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.canVerify", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__LAPublicKey_canVerifyUsingSecKeyAlgorithm___block_invoke;
  block[3] = &unk_1E707AA00;
  block[4] = self;
  block[5] = &v8;
  block[6] = algorithm;
  os_activity_apply(v5, block);
  LOBYTE(algorithm) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)algorithm;
}

uint64_t __45__LAPublicKey_canVerifyUsingSecKeyAlgorithm___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "canVerifyUsingSecKeyAlgorithm:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LAPublicKey[%u]"), self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_right);
}

@end
