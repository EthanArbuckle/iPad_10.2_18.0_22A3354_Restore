@implementation ACAccountStore(ContactsFoundation)

- (id)_cn_canSaveAccount:()ContactsFoundation
{
  id v4;
  CNPromise *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  -[CNPromise BOOLErrorCompletionHandlerAdapter](v5, "BOOLErrorCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "canSaveAccount:withCompletionHandler:", v4, v6);

  -[CNPromise future](v5, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_cn_saveVerifiedAccount:()ContactsFoundation
{
  id v4;
  CNPromise *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  -[CNPromise BOOLErrorCompletionHandlerAdapter](v5, "BOOLErrorCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "saveVerifiedAccount:withCompletionHandler:", v4, v6);

  -[CNPromise future](v5, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_cn_removeAccount:()ContactsFoundation
{
  id v4;
  CNPromise *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  -[CNPromise BOOLErrorCompletionHandlerAdapter](v5, "BOOLErrorCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeAccount:withCompletionHandler:", v4, v6);

  -[CNPromise future](v5, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F060]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "_cn_firstObjectPassingTest:", &__block_literal_global_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "parentAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cn_appleAccountAppleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v6);

      if (v14)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:].cold.3((uint64_t)v6, v7, v15, v16, v17, v18, v19, v20);
LABEL_14:
        v28 = v11;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v11, "parentAccount");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_cn_appleAccountAppleIDAliases");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "containsObject:", v6);

      if (v38)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:].cold.4((uint64_t)v6, v7, v39, v40, v41, v42, v43, v44);
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:].cold.2(v7, v29, v30, v31, v32, v33, v34, v35);
    }
    v28 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:].cold.1(v7, v21, v22, v23, v24, v25, v26, v27);
  v28 = 0;
LABEL_17:

  return v28;
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "No CardDAV ACAccounts found", a5, a6, a7, a8, 0);
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "No primary iCloud ACAccount found", a5, a6, a7, a8, 0);
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18F80C000, a2, a3, "Found primary iCloud ACAccount with appleID: %@", a5, a6, a7, a8, 2u);
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18F80C000, a2, a3, "Found primary iCloud ACAccount with alias appleID: %@", a5, a6, a7, a8, 2u);
}

@end
