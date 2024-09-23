@implementation CNChildDelegateAccountsStore

+ (id)os_log
{
  if (os_log_cn_once_token_1_11 != -1)
    dispatch_once(&os_log_cn_once_token_1_11, &__block_literal_global_55);
  return (id)os_log_cn_once_object_1_11;
}

void __38__CNChildDelegateAccountsStore_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "child-delegate-accounts-store");
  v1 = (void *)os_log_cn_once_object_1_11;
  os_log_cn_once_object_1_11 = (uint64_t)v0;

}

- (CNChildDelegateAccountsStore)initWithParentAccount:(id)a3 accountStore:(id)a4
{
  id v7;
  id v8;
  CNChildDelegateAccountsStore *v9;
  CNChildDelegateAccountsStore *v10;
  CNChildDelegateAccountsStore *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNChildDelegateAccountsStore;
  v9 = -[CNChildDelegateAccountsStore init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentAccount, a3);
    objc_storeStrong((id *)&v10->_accountStore, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("parentAccount"), self->_parentAccount);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("accountStore"), self->_accountStore);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)delegateAccounts
{
  void *v2;
  void *v3;

  -[ACAccount childAccounts](self->_parentAccount, "childAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", CNCoreDelegateInfoFromACAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryAccount
{
  return (*((CNCoreDelegateInfo *(**)(uint64_t, void *))CNCoreDelegateInfoFromACAccount + 2))((uint64_t)CNCoreDelegateInfoFromACAccount, self->_parentAccount);
}

- (BOOL)updateAccounts:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  id v41;
  NSObject *v42;
  void *v43;
  id v45;
  id v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CNChildDelegateAccountsStore parentAccount](self, "parentAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cn_indexBy:", &__block_literal_global_9_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v45 = v6;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (!v12)
      goto LABEL_18;
    v13 = v12;
    v14 = *(_QWORD *)v58;
    v46 = v7;
    while (1)
    {
      v15 = 0;
      v47 = v13;
      do
      {
        if (*(_QWORD *)v58 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v15);
        objc_msgSend(v16, "principalPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v17);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            -[NSObject accountProperties](v18, "accountProperties");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v14;
            v22 = v11;
            v23 = (void *)objc_msgSend(v20, "copy");

            v24 = objc_opt_class();
            -[CNChildDelegateAccountsStore parentAccount](self, "parentAccount");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v24;
            v7 = v46;
            objc_msgSend(v26, "configureChildAccount:withSettingsFromDelegateInfo:parent:", v19, v16, v25);

            -[NSObject accountProperties](v19, "accountProperties");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v25) = objc_msgSend(v23, "isEqualToDictionary:", v27);

            v11 = v22;
            v14 = v21;
            v13 = v47;
            if ((v25 & 1) != 0)
              goto LABEL_15;
          }
          else
          {
            -[CNChildDelegateAccountsStore addChildWithDelegateInfo:](self, "addChildWithDelegateInfo:", v16);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          -[CNChildDelegateAccountsStore updateAccount:](self, "updateAccount:", v19);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v29);

LABEL_15:
          objc_msgSend(v11, "removeObjectForKey:", v17);
          goto LABEL_16;
        }
        objc_msgSend((id)objc_opt_class(), "os_log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "dsid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v64 = v28;
          v65 = 2112;
          v66 = v16;
          _os_log_error_impl(&dword_18F80C000, v19, OS_LOG_TYPE_ERROR, "Unexpected condition updating accounts - no principal path for delegateInfo: %{public}@ %@", buf, 0x16u);

          v7 = v46;
        }
LABEL_16:

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (!v13)
      {
LABEL_18:

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v11, "allValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v54 != v33)
                objc_enumerationMutation(v30);
              -[CNChildDelegateAccountsStore removeAccount:](self, "removeAccount:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v35);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          }
          while (v32);
        }

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v36 = v7;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v50 != v39)
                objc_enumerationMutation(v36);
              v41 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "result:", 0);
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          }
          while (v38);
        }

        v6 = v45;
        goto LABEL_37;
      }
    }
  }
  objc_msgSend((id)objc_opt_class(), "os_log");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    -[CNChildDelegateAccountsStore updateAccounts:error:].cold.1(v42);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 9, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v43;
  if (a4)
  {
    v36 = objc_retainAutorelease(v43);
    *a4 = v36;
  }
LABEL_37:

  return v6 != 0;
}

uint64_t __53__CNChildDelegateAccountsStore_updateAccounts_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_principalPath");
}

- (id)addChildWithDelegateInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CNChildDelegateAccountsStore accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F060]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v6);
  v8 = (void *)objc_opt_class();
  -[CNChildDelegateAccountsStore parentAccount](self, "parentAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureChildAccount:withSettingsFromDelegateInfo:parent:", v7, v4, v9);

  objc_msgSend(v7, "_cn_principalPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("serverRootPath"));

  -[CNChildDelegateAccountsStore parentAccount](self, "parentAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParentAccount:", v11);

  objc_msgSend(v7, "setAuthenticationType:", CFSTR("parent"));
  return v7;
}

+ (void)configureChildAccount:(id)a3 withSettingsFromDelegateInfo:(id)a4 parent:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "setPropertiesFromDelegateInfo:", a4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(&unk_1E29F0070, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(&unk_1E29F0070);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        }
      }
      v10 = objc_msgSend(&unk_1E29F0070, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (id)updateAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[CNChildDelegateAccountsStore accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_canSaveAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke;
  v17[3] = &unk_1E29B9508;
  v17[4] = self;
  v8 = v4;
  v18 = v8;
  objc_msgSend(v6, "addFailureBlock:", v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_20;
  v15[3] = &unk_1E29BA058;
  v15[4] = self;
  v9 = v8;
  v16 = v9;
  objc_msgSend(v6, "addSuccessBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_22;
  v13[3] = &unk_1E29BB948;
  v13[4] = self;
  v14 = v9;
  v10 = v9;
  objc_msgSend(v6, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_cold_1(a1);

}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_20(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_20_cold_1(a1);

}

id __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_saveVerifiedAccount:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2;
  v10[3] = &unk_1E29B9508;
  v5 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  objc_msgSend(v3, "addFailureBlock:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_23;
  v8[3] = &unk_1E29BA058;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v3, "addSuccessBlock:", v8);

  return v3;
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2_cold_1(a1);

}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_23(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_23_cold_1(a1);

}

- (id)removeAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[CNChildDelegateAccountsStore accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_removeAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__CNChildDelegateAccountsStore_removeAccount___block_invoke;
  v13[3] = &unk_1E29B9508;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "addFailureBlock:", v13);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_25;
  v11[3] = &unk_1E29BA058;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v11);

  return v6;
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_cold_1(a1);

}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_25(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_25_cold_1(a1);

}

- (ACAccount)parentAccount
{
  return self->_parentAccount;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_parentAccount, 0);
}

- (void)updateAccounts:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F80C000, log, OS_LOG_TYPE_ERROR, "Cannot update delegate accounts without a valid input set of delegates. Aborting -updateAcconuts:error:", v1, 2u);
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_2(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1(&dword_18F80C000, v2, v3, "Delegate with account ID %@ cannot be saved, error %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_20_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_2(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5(&dword_18F80C000, v2, v3, "Delegate with account ID %@ can be saved", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_2(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1(&dword_18F80C000, v2, v3, "Delegate with account ID %@ save failed, error %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_23_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_2(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5(&dword_18F80C000, v2, v3, "Delegate with account ID %@ saved", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_2(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1(&dword_18F80C000, v2, v3, "Delegate with account ID %@ failed to be removed, error %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_25_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_4_2(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5(&dword_18F80C000, v2, v3, "Delegate with account ID %@ was successfully removed", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
