@implementation ML3AccountStore

- (ACAccount)activeAccount
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  _BYTE buf[24];
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C8F170];
  v10 = 0;
  -[ML3AccountStore _accountsWithAccountTypeIdentifier:options:error:](self, "_accountsWithAccountTypeIdentifier:options:error:", v3, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve active itunes account type. err=%{public}@", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__ML3AccountStore_activeAccount__block_invoke;
    v9[3] = &unk_1E5B5C290;
    v9[4] = buf;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v7 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  return (ACAccount *)v7;
}

- (id)altDSIDForAccountWithDSID:(int64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  ML3AccountStore *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[ML3AccountStore _accountsWithAccountTypeIdentifier:options:error:](self, "_accountsWithAccountTypeIdentifier:options:error:", *MEMORY[0x1E0C8F170], a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*a5)
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *a5;
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve active itunes account type. err=%{public}@", buf, 0x16u);
    }

    v12 = 0;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__ML3AccountStore_altDSIDForAccountWithDSID_options_error___block_invoke;
    v14[3] = &unk_1E5B5C2B8;
    v14[4] = &v15;
    v14[5] = a3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    v12 = (id)v16[5];
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (NSString)accountDSID
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ML3AccountStore activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", CFSTR("dsid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = CFSTR("dsid");
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "accountPropertyForKey %{public}@ is nil. Proceeding without dsid", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      goto LABEL_8;
    }
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543874;
      v10 = CFSTR("dsid");
      v11 = 2114;
      v12 = v3;
      v13 = 2114;
      v14 = (id)objc_opt_class();
      v7 = v14;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "accountPropertyForKey %{public}@ is %{public}@. It should be an NSString or NSNumber instead of %{public}@", (uint8_t *)&v9, 0x20u);

    }
LABEL_11:

    v6 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v6 = v4;
LABEL_12:

  return (NSString *)v6;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ML3AccountStore;
  return -[ML3AccountStore init](&v3, sel_init);
}

- (id)_accountsWithAccountTypeIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  int v19;
  ML3AccountStore *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C8F2B8];
  v9 = a3;
  objc_msgSend(v8, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountTypeWithAccountTypeIdentifier:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a5)
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a5;
      v19 = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve itunes account type. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v10, "accountsWithAccountType:options:error:", v11, a4, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = v14;
    if (!*a5)
    {
      v12 = v14;
      v17 = v12;
      goto LABEL_9;
    }
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *a5;
      v19 = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve accounts for itunes account type. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }

  }
  v17 = MEMORY[0x1E0C9AA60];
LABEL_9:

  return v17;
}

void __59__ML3AccountStore_altDSIDForAccountWithDSID_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "accountPropertyForKey:", CFSTR("dsid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "longLongValue") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v8, "accountPropertyForKey:", CFSTR("altDSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7);
    }

  }
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;

}

void __32__ML3AccountStore_activeAccount__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isActive"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = objc_msgSend(v7, "isActive");

}

+ (ML3AccountStore)defaultStore
{
  if (defaultStore_onceToken[0] != -1)
    dispatch_once(defaultStore_onceToken, &__block_literal_global);
  return (ML3AccountStore *)(id)defaultStore___defaultStore;
}

void __31__ML3AccountStore_defaultStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ML3AccountStore _init]([ML3AccountStore alloc], "_init");
  v1 = (void *)defaultStore___defaultStore;
  defaultStore___defaultStore = (uint64_t)v0;

}

@end
