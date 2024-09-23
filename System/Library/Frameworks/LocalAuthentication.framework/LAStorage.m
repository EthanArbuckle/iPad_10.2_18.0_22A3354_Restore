@implementation LAStorage

- (LAStorage)initWithDomain:(int64_t)a3 authenticationContext:(id)a4
{
  id v7;
  LAStorage *v8;
  LAStorage *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  LAStorage *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAStorage;
  v8 = -[LAStorage init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_domain = a3;
    objc_storeStrong((id *)&v8->_authenticationContext, a4);
    v9->_instanceId = +[LAStorage newInstanceId](LAStorage, "newInstanceId");
    LA_LOG_3();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1B971E000, v10, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[LAStorage connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)LAStorage;
  -[LAStorage dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[LAStorage authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[LAStorage instanceId](self, "instanceId");
  v6 = v5;
  if (v3)
  {
    -[LAStorage authenticationContext](self, "authenticationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("LAStorage[%u] bound with %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("LAStorage[%u]"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (unsigned)newInstanceId
{
  return ++_instanceCounter;
}

+ (id)objectDescription:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "description");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data[%d]"), objc_msgSend(v3, "length"));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported object: %@"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setObject:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  LAStorage *v29;
  int64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  int64_t v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[LAStorage objectDescription:](LAStorage, "objectDescription:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAStorage description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG_3();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v37 = a4;
    v38 = 2114;
    v39 = v10;
    v40 = 2114;
    v41 = v11;
    _os_log_impl(&dword_1B971E000, v12, OS_LOG_TYPE_INFO, "Setting key %d with %{public}@ on %{public}@", buf, 0x1Cu);
  }

  v13 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __48__LAStorage_setObject_forKey_completionHandler___block_invoke;
  v31[3] = &unk_1E707A310;
  v35 = a4;
  v14 = v10;
  v32 = v14;
  v15 = v11;
  v33 = v15;
  v16 = v9;
  v34 = v16;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC41F8](v31);
  v18 = (objc_class *)objc_msgSend(MEMORY[0x1E0D44420], "classForKey:", a4);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CC1310], "storageErrorWithCode:message:", 1, CFSTR("Expected NSData or NSNumber."));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, id))v17)[2](v17, 0, v22);
        goto LABEL_11;
      }
      buf[0] = objc_msgSend(v8, "BOOLValue");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v19;
    v26 = objc_msgSend(MEMORY[0x1E0D44420], "policyForKey:operation:value:", a4, 2, v8);
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __48__LAStorage_setObject_forKey_completionHandler___block_invoke_19;
    v27[3] = &unk_1E707A338;
    v28 = v25;
    v29 = self;
    v30 = a4;
    v22 = v25;
    -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:](self, "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:", v26, v27, v17);

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CC1310];
    v21 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(v18);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ value expected"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storageErrorWithCode:message:", 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v24);

  }
LABEL_11:

}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LA_LOG_3();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[7];
      v9 = a1[4];
      v10 = a1[5];
      v11[0] = 67109634;
      v11[1] = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_DEFAULT, "Key %d set successfully with %{public}@ on %{public}@", (uint8_t *)v11, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__LAStorage_setObject_forKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  v9 = objc_msgSend(v6, "accessControl");
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "accessControl");
    v13 = (id)SecAccessControlCopyData();
  }
  else
  {
    v13 = 0;
  }
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "authenticationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:acl:forKey:contextUUID:completionHandler:", v5, v13, v10, v12, v7);

  if (v9)
}

- (void)objectForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[LAStorage description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v19 = a3;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_INFO, "Querying key %d on %{public}@", buf, 0x12u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__LAStorage_objectForKey_completionHandler___block_invoke;
  v14[3] = &unk_1E707A360;
  v16 = v6;
  v17 = a3;
  v15 = v7;
  v10 = v6;
  v11 = v7;
  v12 = (void *)MEMORY[0x1BCCC41F8](v14);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __44__LAStorage_objectForKey_completionHandler___block_invoke_21;
  v13[3] = &unk_1E707A388;
  v13[4] = self;
  v13[5] = a3;
  -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:](self, "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:", objc_msgSend(MEMORY[0x1E0D44420], "policyForKey:operation:value:", a3, 1, 0), v13, v12);

}

void __44__LAStorage_objectForKey_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LA_LOG_3();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 || !a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[6];
      +[LAStorage objectDescription:](LAStorage, "objectDescription:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      v12[0] = 67109634;
      v12[1] = v9;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_DEFAULT, "Query of key %d returned %{public}@ on %{public}@", (uint8_t *)v12, 0x1Cu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __44__LAStorage_objectForKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "authenticationContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:contextUUID:completionHandler:", v4, v8, v6);

}

- (void)removeObjectForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[LAStorage description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v19 = a3;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_INFO, "Removing key %d on %{public}@", buf, 0x12u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__LAStorage_removeObjectForKey_completionHandler___block_invoke;
  v14[3] = &unk_1E707A360;
  v16 = v6;
  v17 = a3;
  v15 = v7;
  v10 = v6;
  v11 = v7;
  v12 = (void *)MEMORY[0x1BCCC41F8](v14);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_22;
  v13[3] = &unk_1E707A388;
  v13[4] = self;
  v13[5] = a3;
  -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:](self, "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:", objc_msgSend(MEMORY[0x1E0D44420], "policyForKey:operation:value:", a3, 3, 0), v13, v12);

}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LA_LOG_3();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[6];
      v9 = a1[4];
      v10[0] = 67109378;
      v10[1] = v8;
      v11 = 2114;
      v12 = v9;
      _os_log_impl(&dword_1B971E000, v7, OS_LOG_TYPE_DEFAULT, "Removed key %d on %{public}@", (uint8_t *)v10, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "authenticationContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:contextUUID:completionHandler:", v4, v8, v6);

}

- (void)exchangeData:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  int64_t v27;
  id buf;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[LAStorage objectDescription:](LAStorage, "objectDescription:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAStorage description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG_3();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = a4;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_1B971E000, v12, OS_LOG_TYPE_INFO, "Exchanging data with key %d with %{public}@ on %{public}@", (uint8_t *)&buf, 0x1Cu);
  }

  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke;
  v23[3] = &unk_1E707A310;
  v27 = a4;
  v14 = v10;
  v24 = v14;
  v15 = v11;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC41F8](v23);
  if ((objc_msgSend(MEMORY[0x1E0D44420], "isKeyAvailableForDataExchange:", a4) & 1) != 0)
  {
    v18 = objc_msgSend(MEMORY[0x1E0D44420], "policyForKey:operation:value:", a4, 4, v8);
    objc_initWeak(&buf, self);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_25;
    v20[3] = &unk_1E707A3B0;
    objc_copyWeak(v22, &buf);
    v21 = v8;
    v22[1] = (id)a4;
    -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:](self, "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:", v18, v20, v17);

    objc_destroyWeak(v22);
    objc_destroyWeak(&buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC1310], "storageErrorWithCode:message:", 4, CFSTR("key does not support data exchange"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v19);

  }
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  LA_LOG_3();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[7];
      v10 = a1[4];
      v11 = a1[5];
      v12[0] = 67109634;
      v12[1] = v9;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_DEFAULT, "Key %d data exchanged successfully with %{public}@ on %{public}@", (uint8_t *)v12, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(WeakRetained, "accessControl");
    if (v9)
    {
      objc_msgSend(v7, "accessControl");
      v10 = (void *)SecAccessControlCopyData();
    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v7, "authenticationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:acl:forKey:contextUUID:completionHandler:", v8, v10, v11, v13, v5);

    if (v9)
  }

}

- (__SecAccessControl)accessControlForKey:(int64_t)a3 error:(id *)a4
{
  __SecAccessControl *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__LAStorage_accessControlForKey_error___block_invoke;
  v9[3] = &unk_1E707A388;
  v9[4] = self;
  v9[5] = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__LAStorage_accessControlForKey_error___block_invoke_2;
  v8[3] = &unk_1E707A170;
  v8[4] = &v16;
  v8[5] = &v10;
  -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:](self, "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:", 0, v9, v8);
  if (!v17[5])
  {
    v5 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = (__SecAccessControl *)SecAccessControlCreateFromData();
  if (v5)
  {
    v6 = (void *)v11[5];
    v11[5] = 0;

  }
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease((id)v11[5]);
LABEL_6:
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __39__LAStorage_accessControlForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "authenticationContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aclForKey:contextUUID:completionHandler:", v4, v8, v6);

}

void __39__LAStorage_accessControlForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)setBool:(BOOL)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  objc_msgSend(v8, "numberWithBool:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[LAStorage setObject:forKey:completionHandler:](self, "setObject:forKey:completionHandler:", v10, a4, v9);

}

- (void)BOOLForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__LAStorage_BOOLForKey_completionHandler___block_invoke;
  v9[3] = &unk_1E707A3D8;
  v10 = v6;
  v8 = v6;
  -[LAStorage _class:forKey:completionHandler:](self, "_class:forKey:completionHandler:", v7, a3, v9);

}

void __42__LAStorage_BOOLForKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

- (void)dataForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6;

  v6 = a4;
  -[LAStorage _class:forKey:completionHandler:](self, "_class:forKey:completionHandler:", objc_opt_class(), a3, v6);

}

- (void)_class:(Class)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  Class v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__LAStorage__class_forKey_completionHandler___block_invoke;
  v10[3] = &unk_1E707A400;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  -[LAStorage objectForKey:completionHandler:](self, "objectForKey:completionHandler:", a4, v10);

}

void __45__LAStorage__class_forKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = *(_QWORD *)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CC1310], "storageErrorWithCode:message:suberror:", 2, CFSTR("Internal error - unexpected data type"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v5);
  }

}

- (BOOL)setBool:(BOOL)a3 forKey:(int64_t)a4 error:(id *)a5
{
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__LAStorage_setBool_forKey_error___block_invoke;
  v8[3] = &unk_1E707A428;
  v8[4] = &v9;
  -[LAStorage setBool:forKey:completionHandler:](self, "setBool:forKey:completionHandler:", a3, a4, v8);
  if (a5)
    *a5 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __34__LAStorage_setBool_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)setData:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v8 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__LAStorage_setData_forKey_error___block_invoke;
  v11[3] = &unk_1E707A428;
  v11[4] = &v12;
  -[LAStorage setData:forKey:completionHandler:](self, "setData:forKey:completionHandler:", v8, a4, v11);
  if (a5)
    *a5 = objc_retainAutorelease((id)v13[5]);
  v9 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __34__LAStorage_setData_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)BOOLForKey:(int64_t)a3
{
  return -[LAStorage BOOLForKey:error:](self, "BOOLForKey:error:", a3, 0);
}

- (BOOL)BOOLForKey:(int64_t)a3 error:(id *)a4
{
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__LAStorage_BOOLForKey_error___block_invoke;
  v7[3] = &unk_1E707A198;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAStorage BOOLForKey:completionHandler:](self, "BOOLForKey:completionHandler:", a3, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __30__LAStorage_BOOLForKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)dataForKey:(int64_t)a3
{
  return -[LAStorage dataForKey:error:](self, "dataForKey:error:", a3, 0);
}

- (id)dataForKey:(int64_t)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__LAStorage_dataForKey_error___block_invoke;
  v7[3] = &unk_1E707A1C0;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAStorage dataForKey:completionHandler:](self, "dataForKey:completionHandler:", a3, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __30__LAStorage_dataForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)numberForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6;

  v6 = a4;
  -[LAStorage _class:forKey:completionHandler:](self, "_class:forKey:completionHandler:", objc_opt_class(), a3, v6);

}

- (id)numberForKey:(int64_t)a3
{
  return -[LAStorage numberForKey:error:](self, "numberForKey:error:", a3, 0);
}

- (id)numberForKey:(int64_t)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__LAStorage_numberForKey_error___block_invoke;
  v7[3] = &unk_1E707A450;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAStorage numberForKey:completionHandler:](self, "numberForKey:completionHandler:", a3, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __32__LAStorage_numberForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)exchangeData:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__LAStorage_exchangeData_forKey_error___block_invoke;
  v11[3] = &unk_1E707A1C0;
  v11[4] = &v18;
  v11[5] = &v12;
  -[LAStorage exchangeData:forKey:completionHandler:](self, "exchangeData:forKey:completionHandler:", v8, a4, v11);
  if (a5)
    *a5 = objc_retainAutorelease((id)v13[5]);
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __39__LAStorage_exchangeData_forKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)_bootstrapServiceWithAuthenticationPolicy:(int64_t)a3 proxyBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  int64_t v14;

  v8 = a4;
  v9 = a5;
  -[LAStorage remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LAStorage _callProxyBlock:authenticationPolicy:completionHandler:](self, "_callProxyBlock:authenticationPolicy:completionHandler:", v8, a3, v9);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __84__LAStorage__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler___block_invoke;
    v11[3] = &unk_1E707A478;
    v11[4] = self;
    v12 = v8;
    v14 = a3;
    v13 = v9;
    -[LAStorage _bootstrapServiceType:completionHandler:](self, "_bootstrapServiceType:completionHandler:", CFSTR("kLAServiceTypeSecureStorage"), v11);

  }
}

uint64_t __84__LAStorage__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_connectToEndpoint:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_callProxyBlock:authenticationPolicy:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_connectToEndpoint:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  LASecureStorageService *v14;
  LASecureStorageService *remoteObjectProxy;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
  connection = self->_connection;
  self->_connection = v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF2372A8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAStorage connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v7);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__LAStorage__connectToEndpoint___block_invoke;
  v20[3] = &unk_1E7079CC0;
  objc_copyWeak(&v21, &location);
  -[LAStorage connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterruptionHandler:", v20);

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __32__LAStorage__connectToEndpoint___block_invoke_2;
  v18[3] = &unk_1E7079CC0;
  objc_copyWeak(&v19, &location);
  -[LAStorage connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInvalidationHandler:", v18);

  -[LAStorage connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  -[LAStorage connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __32__LAStorage__connectToEndpoint___block_invoke_3;
  v16[3] = &unk_1E707A4A0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v14 = (LASecureStorageService *)objc_claimAutoreleasedReturnValue();
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __32__LAStorage__connectToEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnection");

}

void __32__LAStorage__connectToEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnection");

}

void __32__LAStorage__connectToEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  LA_LOG_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __32__LAStorage__connectToEndpoint___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnection");

}

- (void)_resetConnection
{
  LASecureStorageService *remoteObjectProxy;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = 0;

}

- (void)_bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[LAStorage authenticationContext](self, "authenticationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_opt_new();

  -[LAStorage authenticationContext](self, "authenticationContext");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__LAStorage__bootstrapServiceType_completionHandler___block_invoke;
  v15[3] = &unk_1E707A4C8;
  v16 = v9;
  v17 = v6;
  v13 = v9;
  v14 = v6;
  objc_msgSend(v12, "bootstrapServiceType:completionHandler:", v7, v15);

}

uint64_t __53__LAStorage__bootstrapServiceType_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_callProxyBlock:(id)a3 authenticationPolicy:(int64_t)a4 completionHandler:(id)a5
{
  _QWORD *v8;
  id v9;
  void *v10;
  void (*v11)(_QWORD *, void *, _QWORD *);
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  -[LAStorage remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke;
  v14[3] = &unk_1E707A518;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = a4;
  v11 = (void (*)(_QWORD *, void *, _QWORD *))v8[2];
  v12 = v8;
  v13 = v9;
  v11(v12, v10, v14);

}

void __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5
    && objc_msgSend(MEMORY[0x1E0CC1310], "storageError:hasCode:", v6, 0)
    && (objc_msgSend(*(id *)(a1 + 32), "authenticationContext"),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v8 = *(_QWORD *)(a1 + 56), v7, v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uiDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (LA_LOG_INTERACTIVE_once != -1)
        dispatch_once(&LA_LOG_INTERACTIVE_once, &__block_literal_global_192);
      v11 = LA_LOG_INTERACTIVE_log;
      if (os_log_type_enabled((os_log_t)LA_LOG_INTERACTIVE_log, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        v23 = 1024;
        v24 = v13;
        _os_log_impl(&dword_1B971E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will invoke authentication using policy %d", buf, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "authenticationContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke_101;
      v18[3] = &unk_1E707A4F0;
      v18[4] = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 56);
      v19 = *(id *)(a1 + 48);
      v20 = *(id *)(a1 + 40);
      objc_msgSend(v14, "evaluatePolicy:options:reply:", v15, 0, v18);

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CC1310], "storageErrorWithCode:message:", 0, CFSTR("Policy can't be satisfied without UI delegate."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke_101(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_callProxyBlock:authenticationPolicy:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (int64_t)domain
{
  return self->_domain;
}

- (__SecAccessControl)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(__SecAccessControl *)a3
{
  self->_accessControl = a3;
}

- (LAContext)authenticationContext
{
  return self->_authenticationContext;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (LASecureStorageService)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1B971E000, v0, v1, "Failed to set key %d with %{public}@ on %{public}@: %{public}@");
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1B971E000, v0, v1, "Failed to query key %d on %{public}@", v2, v3, v4, v5, v6);
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1B971E000, v0, v1, "Failed to remove key %d on %{public}@", v2, v3, v4, v5, v6);
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1B971E000, v0, v1, "Failed to exchange data for key %d with %{public}@ on %{public}@: %{public}@");
}

void __32__LAStorage__connectToEndpoint___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = 138543618;
  v7 = WeakRetained;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1B971E000, a3, OS_LOG_TYPE_ERROR, "%{public}@ has encountered XPC error on remote proxy: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
