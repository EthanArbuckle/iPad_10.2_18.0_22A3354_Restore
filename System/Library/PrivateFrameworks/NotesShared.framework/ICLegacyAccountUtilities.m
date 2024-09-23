@implementation ICLegacyAccountUtilities

+ (id)legacyAccountForPrimaryICloudAccountWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D64180];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryICloudACAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "legacyAccountForICloudACAccount:context:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)legacyAccountForICloudACAccount:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "childAccountsWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F0E0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "accountForAccountIdentifier:context:", v12, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

+ (BOOL)didChooseToMigrateAccountsForContext:(id)a3 forAccountPassingTest:(id)a4
{
  unsigned int (**v6)(id, void *);
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  BOOL v11;

  v6 = (unsigned int (**)(id, void *))a4;
  v7 = 0;
  v8 = 1;
  while (1)
  {
    v9 = v8;
    objc_msgSend(a1, "legacyAccountForLegacyAccountType:context:", v7, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v6[2](v6, v10) && objc_msgSend(a1, "didChooseToMigrateLegacyAccountType:", v7))
        break;
    }

    v8 = 0;
    v11 = 0;
    v7 = 1;
    if ((v9 & 1) == 0)
      goto LABEL_8;
  }

  v11 = 1;
LABEL_8:

  return v11;
}

+ (BOOL)didChooseToMigrateAccount:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__ICLegacyAccountUtilities_didChooseToMigrateAccount_context___block_invoke;
  v9[3] = &unk_1E76C9708;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = objc_msgSend(a1, "didChooseToMigrateAccountsForContext:forAccountPassingTest:", a4, v9);

  return (char)a4;
}

uint64_t __62__ICLegacyAccountUtilities_didChooseToMigrateAccount_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2 == a2)
    return 1;
  v3 = a2;
  objc_msgSend(v2, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

+ (BOOL)didChooseToMigrateLegacyAccountType:(int64_t)a3
{
  void *v4;
  char v5;
  BOOL v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D643A0]);
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "didChooseToMigratePrimaryICloudAccount");
LABEL_5:
    v6 = v5;

    return v6;
  }
  v8 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[ICLegacyAccountUtilities didChooseToMigrateLegacyAccountType:].cold.1(a3, v8, v9, v10, v11, v12, v13, v14);

  return 0;
}

+ (id)legacyAccountForLegacyAccountType:(int64_t)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a4;
  if (a3 == 1)
  {
    objc_msgSend(a1, "legacyAccountForLocalAccountWithContext:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(a1, "legacyAccountForPrimaryICloudAccountWithContext:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  v9 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[ICLegacyAccountUtilities didChooseToMigrateLegacyAccountType:].cold.1(a3, v9, v10, v11, v12, v13, v14, v15);

  v8 = 0;
LABEL_9:

  return v8;
}

+ (id)legacyAccountForICloudAccount:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "accountType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iCloudACAccountWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "legacyAccountForICloudACAccount:context:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)isLegacyLocalAccount:(id)a3
{
  return objc_msgSend(a3, "legacyAccountType") == 0;
}

+ (id)accountForAccountIdentifier:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accountForAccountId:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)legacyAccountForLocalAccountWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)accountIdentifierForAccount:(id)a3
{
  return (id)objc_msgSend(a3, "accountIdentifier");
}

+ (id)accountForEmailAddress:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v25 = v6;
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D629C8], "sharedAccountUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountsEnabledForNotes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "identifier", v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  objc_msgSend(v7, "allAccounts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__ICLegacyAccountUtilities_accountForEmailAddress_context___block_invoke;
  v26[3] = &unk_1E76C9730;
  v27 = v10;
  v28 = v8;
  v29 = v5;
  v19 = v5;
  v20 = v8;
  v21 = v10;
  objc_msgSend(v18, "ic_objectsPassingTest:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __59__ICLegacyAccountUtilities_accountForEmailAddress_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountWithIdentifier:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_3;
LABEL_6:
    v13 = 0;
    goto LABEL_9;
  }
  if (!v6)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v9, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48)))
  {

LABEL_8:
    v13 = 1;
    *a4 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "displayAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((_DWORD)v13)
    goto LABEL_8;
LABEL_9:

  return v13;
}

+ (id)emailAddressForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D629C8];
  v4 = a3;
  objc_msgSend(v3, "sharedAccountUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accountWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)didChooseToMigrateLegacyAccountType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Invalid account type %ld", a5, a6, a7, a8, 0);
}

@end
