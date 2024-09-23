@implementation LARight

- (LARight)init
{
  void *v3;
  LARight *v4;

  +[LAAuthenticationRequirement defaultRequirement](LAAuthenticationRequirement, "defaultRequirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LARight initWithRequirement:](self, "initWithRequirement:", v3);

  return v4;
}

- (LARight)initWithRequirement:(LAAuthenticationRequirement *)requirement
{
  void *v4;
  LARight *v5;

  -[LAAuthenticationRequirement key](requirement, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LARight initWithAccessKey:](self, "initWithAccessKey:", v4);

  return v5;
}

- (LARight)initWithAccessKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  LARight *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LARight initWithIdentifier:accessKey:](self, "initWithIdentifier:accessKey:", v7, v5);

  return v8;
}

- (LARight)initWithIdentifier:(id)a3 accessKey:(id)a4
{
  id v7;
  id v8;
  LARight *v9;
  LARight *v10;
  LARightContextHandler *v11;
  LARightContextHandler *contextHandler;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  void *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  LARight *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LARight;
  v9 = -[LARight init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_accessKey, a4);
    v11 = -[LARightContextHandler initWithDelegate:]([LARightContextHandler alloc], "initWithDelegate:", v10);
    contextHandler = v10->_contextHandler;
    v10->_contextHandler = v11;

    v10->_state = 0;
    objc_msgSend(MEMORY[0x1E0D443B8], "createDefaultSerialQueueWithIdentifier:", CFSTR("LARight"));
    v13 = objc_claimAutoreleasedReturnValue();
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0CC1318], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_instanceID = objc_msgSend(v15, "nextInstanceIDInDomain:", CFSTR("LARight"));

    LA_LOG();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1B971E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  LARight *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LA_LOG();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)LARight;
  -[LARight dealloc](&v4, sel_dealloc);
}

- (void)authorizeWithLocalizedReason:(NSString *)localizedReason completion:(void *)handler
{
  NSString *v6;
  void *v7;
  os_activity_t v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  _QWORD block[5];
  NSString *v13;
  os_activity_t v14;
  id v15;

  v6 = localizedReason;
  v7 = handler;
  v8 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.authorizeWithLocalizedReason", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__LARight_authorizeWithLocalizedReason_completion___block_invoke;
  block[3] = &unk_1E70794E0;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  os_activity_apply(v10, block);

}

void __51__LARight_authorizeWithLocalizedReason_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  LA_LOG();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v15 = v3;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ authorizeWithLocalizedReason '%{public}@' started", buf, 0x16u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = &unk_1E7087EE8;
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_74;
  v8[3] = &unk_1E70794B8;
  v9 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, (id *)buf);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v5, "authorizeWithOptions:completion:", v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_2;
  block[3] = &unk_1E7079490;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  os_activity_apply(v4, block);

  objc_destroyWeak(&v9);
}

uint64_t __51__LARight_authorizeWithLocalizedReason_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id WeakRetained;
  uint64_t v5;
  __CFString *v6;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LA_LOG();
  v2 = objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
    v3 = LALogTypeForInternalError();
  else
    v3 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v2, v3))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("successfully");
    }
    *(_DWORD *)buf = 138543618;
    v9 = WeakRetained;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1B971E000, v2, v3, "%{public}@ authorizeWithLocalizedReason finished %{public}@", buf, 0x16u);
    if (v5)

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkCanAuthorizeWithCompletion:(void *)handler
{
  void *v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = handler;
  activity = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.checkCanAuthorizeWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LARight_checkCanAuthorizeWithCompletion___block_invoke;
  block[3] = &unk_1E7079508;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

void __43__LARight_checkCanAuthorizeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LA_LOG();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ checkCanAuthorizeWithCompletion started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4 = *(_QWORD **)(a1 + 32);
  v9 = &unk_1E7087F00;
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__LARight_checkCanAuthorizeWithCompletion___block_invoke_83;
  v6[3] = &unk_1E7079220;
  objc_copyWeak(&v8, (id *)buf);
  v7 = *(id *)(a1 + 40);
  -[LARight _authorizeWithOptions:completionHandler:](v4, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __43__LARight_checkCanAuthorizeWithCompletion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  os_log_type_t v9;
  __CFString *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    LA_LOG();
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v4 = objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v3, -1004);
  LA_LOG();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
LABEL_6:
    v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v6, v9))
      goto LABEL_12;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), v3);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
    goto LABEL_8;
  }
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    goto LABEL_12;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = 0;
  v9 = OS_LOG_TYPE_DEFAULT;
  v10 = CFSTR("successfully");
LABEL_8:
  *(_DWORD *)buf = 138543618;
  v12 = WeakRetained;
  v13 = 2114;
  v14 = v10;
  _os_log_impl(&dword_1B971E000, v6, v9, "%{public}@ checkCanAuthorizeWithCompletion finished %{public}@", buf, 0x16u);
  if (v8)
  {

  }
  else
  {

  }
LABEL_12:

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_authorizeWithOptions:(void *)a3 completionHandler:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v7 = a1[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__LARight__authorizeWithOptions_completionHandler___block_invoke;
    v8[3] = &unk_1E7079558;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    v9 = v5;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)deauthorizeWithCompletion:(void *)handler
{
  void *v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = handler;
  activity = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.deauthorizeWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__LARight_deauthorizeWithCompletion___block_invoke;
  block[3] = &unk_1E7079508;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

uint64_t __37__LARight_deauthorizeWithCompletion___block_invoke(uint64_t a1)
{
  LAContext *v2;

  v2 = objc_alloc_init(LAContext);
  objc_msgSend(*(id *)(a1 + 32), "setContext:", v2);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) != 3)
    __37__LARight_deauthorizeWithCompletion___block_invoke_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)authorizeWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_activity_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  os_activity_t v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.authorizeWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LARight_authorizeWithOptions_completion___block_invoke;
  block[3] = &unk_1E7079530;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  os_activity_apply(v9, block);

}

void __43__LARight_authorizeWithOptions_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _QWORD *v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  LA_LOG();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    v21 = v3;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ authorizeWithOptions %{public}@ started", buf, 0x16u);
  }

  objc_msgSend(a1[5], "objectForKeyedSubscript:", &unk_1E7087EE8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  objc_msgSend(a1[5], "objectForKeyedSubscript:", &unk_1E7087EE8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  objc_msgSend(a1[5], "objectForKeyedSubscript:", &unk_1E7087EE8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") == 0;

  if (!v11)
  {
    objc_initWeak((id *)buf, a1[4]);
    objc_msgSend(a1[4], "setState:", 1);
    v12 = a1[4];
    v13 = a1[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__LARight_authorizeWithOptions_completion___block_invoke_91;
    v16[3] = &unk_1E70794B8;
    v17 = a1[6];
    objc_copyWeak(&v19, (id *)buf);
    v18 = a1[7];
    -[LARight _authorizeWithOptions:completionHandler:](v12, v13, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_7:
    v14 = (void (**)(id, void *))a1[7];
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Missing required 'LAOptionAuthenticationReason' option"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15);

  }
}

void __43__LARight_authorizeWithOptions_completion___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LARight_authorizeWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E7079490;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  os_activity_apply(v4, block);

  objc_destroyWeak(&v9);
}

void __43__LARight_authorizeWithOptions_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id WeakRetained;
  uint64_t v5;
  __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  LA_LOG();
  v2 = objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
    v3 = LALogTypeForInternalError();
  else
    v3 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v2, v3))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(err:%@)"), *(_QWORD *)(a1 + 32));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("successfully");
    }
    *(_DWORD *)buf = 138543618;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B971E000, v2, v3, "%{public}@ authorizeWithOptions finished %{public}@", buf, 0x16u);
    if (v5)

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = v7;
  if (v7)
  {
    if (*(_QWORD *)(a1 + 32))
      v9 = 3;
    else
      v9 = 2;
    objc_msgSend(v7, "setState:", v9);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setState:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_state != a3)
  {
    NSStringFromSelector(sel_state);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LARight willChangeValueForKey:](self, "willChangeValueForKey:", v5);

    self->_state = a3;
    NSStringFromSelector(sel_state);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[LARight didChangeValueForKey:](self, "didChangeValueForKey:", v6);

  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  NSStringFromSelector(sel_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___LARight;
    v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setContext:(id)a3
{
  -[LARightContextHandler setContext:](self->_contextHandler, "setContext:", a3);
  -[LARight setState:](self, "setState:", 3);
}

- (id)context
{
  return -[LARightContextHandler context](self->_contextHandler, "context");
}

- (id)accessKey
{
  return self->_accessKey;
}

- (void)rightContextDidBecomeInvalid
{
  -[LARight deauthorizeWithCompletion:](self, "deauthorizeWithCompletion:", &__block_literal_global_1);
}

void __51__LARight__authorizeWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[2];
    objc_msgSend(WeakRetained, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "armInContext:options:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    LA_LOG();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = LALogTypeForInternalError();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B971E000, v6, v7, "Operation interrupted", v10, 2u);
    }

    v8 = *(_QWORD *)(a1 + 40);
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Operation interrupted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "accessKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LARight accessKey](self, "accessKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(v5, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LARight context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LARight[%u]"), self->_instanceID);
}

- (LARightState)state
{
  return self->_state;
}

- (NSInteger)tag
{
  return self->_tag;
}

- (void)setTag:(NSInteger)tag
{
  self->_tag = tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_contextHandler, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __37__LARight_deauthorizeWithCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[LARight deauthorizeWithCompletion:]_block_invoke", "LARight.m", 168, "_state == LARightStateNotAuthorized");
}

@end
