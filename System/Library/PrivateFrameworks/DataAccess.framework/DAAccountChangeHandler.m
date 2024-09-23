@implementation DAAccountChangeHandler

+ (BOOL)handleAccountWillChange:(id)a3 withChangeInfo:(id)a4 store:(id)a5 accountUpdater:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  DALoggingwithCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v14, v15))
  {
    v20 = 138543362;
    v21 = v11;
    _os_log_impl(&dword_1B51E4000, v14, v15, "Handling account will change %{public}@", (uint8_t *)&v20, 0xCu);
  }

  v16 = objc_msgSend(v11, "changeType");
  if (v16 >= 2)
  {
    if (v16 != 3)
    {
      v18 = 0;
      goto LABEL_9;
    }
    v17 = objc_msgSend(a1, "_handleCalDAVAccountModifiedByDataAccess:withChangeInfo:inStore:accountUpdater:", v10, v11, v12, v13);
  }
  else
  {
    v17 = objc_msgSend(a1, "_handleAccountAddOrModify:withChangeInfo:inStore:accountUpdater:", v10, v11, v12, v13);
  }
  v18 = v17;
LABEL_9:

  return v18;
}

+ (void)handleAccountDidChange:(id)a3 withChangeInfo:(id)a4 store:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v11, v12))
  {
    v25 = 138543362;
    v26 = v9;
    _os_log_impl(&dword_1B51E4000, v11, v12, "Handling account did change %{public}@", (uint8_t *)&v25, 0xCu);
  }

  v13 = objc_msgSend(v9, "changeType");
  if (v13 == 2)
  {
    objc_msgSend(a1, "_handleAccountDelete:withChangeInfo:inStore:", v8, v9, v10);
  }
  else if (v13 <= 1)
  {
    objc_msgSend(v9, "accountTypeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "changeType") == 1)
    {
      objc_msgSend(MEMORY[0x1E0D1C438], "leafAccountTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v14);

      if (v16)
      {
        +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accountDidChangeWithChangeInfo:", v9);

      }
    }
    if (objc_msgSend(v9, "changeType") == 1)
    {
      objc_msgSend(v9, "modifiedDataClasses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0C8EE58];
      v20 = objc_msgSend(v18, "containsObject:", *MEMORY[0x1E0C8EE58]);

      if (v20)
      {
        objc_msgSend(v8, "enabledDataclasses");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsObject:", v19);

        if ((v22 & 1) != 0)
          objc_msgSend(a1, "_setupStoreForNewAccount:", v8);
        else
          objc_msgSend(a1, "_cleanupStoreForDisabledAccount:inStore:", v8, v10);
      }
    }
    if (!objc_msgSend(v9, "changeType"))
    {
      objc_msgSend(v8, "enabledDataclasses");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", *MEMORY[0x1E0C8EE58]);

      if (v24)
        objc_msgSend(a1, "_setupStoreForNewAccount:", v8);
    }

  }
}

+ (id)_supportedChildAccountTypesForParentAccountType:(id)a3
{
  id v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F0D0]))
  {
    v14 = *MEMORY[0x1E0C8F0E0];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v14;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F0A8]) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F160]) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F108]) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F030]))
    {
      v7 = *MEMORY[0x1E0C8F060];
      v11 = *MEMORY[0x1E0C8F058];
      v12 = v7;
      v13 = *MEMORY[0x1E0C8F0E0];
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v11;
      v6 = 3;
      goto LABEL_9;
    }
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F028]))
    {
      v8 = 0;
      goto LABEL_10;
    }
    v10 = *MEMORY[0x1E0C8F0E0];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v10;
  }
  v6 = 1;
LABEL_9:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v10, v11, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

+ (BOOL)_handleAccountAddOrModify:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  void *v18;
  char v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  char v25;
  int v26;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "accountTypeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C8F058]))
  {
    if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C8F080]) & 1) != 0
      || objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C8F0B8]))
    {
      DALoggingwithCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v14;
        _os_log_impl(&dword_1B51E4000, v20, v21, "Found an account of type %{public}@.  Sanity check enabled dataclasses.", buf, 0xCu);
      }

      if ((objc_msgSend(a1, "_sanityCheckEnabledDataclassesOnExchangeAccountInfo:", v10) & 1) != 0)
        goto LABEL_11;
    }
    else
    {
      if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C8F140]))
      {
        objc_msgSend(a1, "_supportedChildAccountTypesForParentAccountType:", v14);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          DALoggingwithCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
          if (os_log_type_enabled(v28, v29))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v14;
            _os_log_impl(&dword_1B51E4000, v28, v29, "Found a parent account of type %{public}@. Sanity checking child accounts for it.", buf, 0xCu);
          }
          v34 = v14;

          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v22 = v22;
          v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v30)
          {
            v31 = v30;
            v17 = 0;
            v32 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v38 != v32)
                  objc_enumerationMutation(v22);
                v17 |= objc_msgSend(a1, "_sanityCheckChildAccountOfType:withParent:accountChangeInfo:inStore:updater:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v10, v11, v12, v13, v34);
              }
              v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            }
            while (v31);
          }
          else
          {
            LOBYTE(v17) = 0;
          }

          v14 = v34;
        }
        else
        {
          LOBYTE(v17) = 0;
        }
        goto LABEL_12;
      }
      DALoggingwithCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v14;
        _os_log_impl(&dword_1B51E4000, v23, v24, "Found an account of type %{public}@.  Sanity check account properties.", buf, 0xCu);
      }

      v25 = objc_msgSend(a1, "_sanityCheckSubscribedCalendarAccountInfo:", v10);
      v26 = objc_msgSend(a1, "_handleChangeToSubscribedCalendar:withChangeInfo:inStore:accountUpdater:", v10, v11, v12, v13);
      if ((v25 & 1) != 0 || v26)
      {
LABEL_11:
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __90__DAAccountChangeHandler__handleAccountAddOrModify_withChangeInfo_inStore_accountUpdater___block_invoke;
        v35[3] = &unk_1E68CB7B8;
        v36 = v10;
        objc_msgSend(v13, "updateAccount:withCompletionHandler:", v36, v35);
        LOBYTE(v17) = 1;
        v22 = v36;
LABEL_12:

        goto LABEL_19;
      }
    }
    LOBYTE(v17) = 0;
    goto LABEL_19;
  }
  DALoggingwithCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v14;
    _os_log_impl(&dword_1B51E4000, v15, v16, "Found a parent account of type %{public}@. Sanity checking child accounts for it.", buf, 0xCu);
  }

  LOBYTE(v17) = objc_msgSend(a1, "_sanityCheckChildSubCalAccountsWithParent:inStore:accountUpdater:", v10, v12, v13);
  +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(a1, "_sanityCheckCalDAVAccount:accountChangeInfo:", v18, v11);

  if ((v19 & 1) != 0)
    goto LABEL_11;
LABEL_19:

  return v17 & 1;
}

void __90__DAAccountChangeHandler__handleAccountAddOrModify_withChangeInfo_inStore_accountUpdater___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B51E4000, v6, v7, "_handleAccountAddOrModify: Failed to save account with identifier %{public}@: %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

+ (void)_handleAccountDelete:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__DAAccountChangeHandler__handleAccountDelete_withChangeInfo_inStore___block_invoke;
  v13[3] = &unk_1E68CB7E0;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(a1, "_performBlockWithGenericClientDBForAccount:block:", v10, v13);

}

void __70__DAAccountChangeHandler__handleAccountDelete_withChangeInfo_inStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  v6 = (void *)MEMORY[0x1E0D0BB58];
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeStoreForDeletedAccountWithIdentifier:inDatabase:mainDatabase:accountStore:", v7, a3, a2, *(_QWORD *)(a1 + 40));

}

+ (void)_cleanupStoreForDisabledAccount:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__DAAccountChangeHandler__cleanupStoreForDisabledAccount_inStore___block_invoke;
  v11[3] = &unk_1E68CB7E0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(a1, "_performBlockWithGenericClientDBForAccount:block:", v8, v11);

}

void __66__DAAccountChangeHandler__cleanupStoreForDisabledAccount_inStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0D0BB58];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "childAccounts");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeStoreForAccount:withChildren:inDatabase:mainDatabase:accountStore:", v7, v8, a3, a2, *(_QWORD *)(a1 + 40));

}

+ (void)_setupStoreForNewAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F140]) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v4, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8F0B0]) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v4, "accountType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C8F120]);

  if ((v14 & 1) != 0)
  {
LABEL_5:
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v9, v10))
    {
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_1B51E4000, v9, v10, "Not creating a store for account %{public}@ because it is not appropriate", buf, 0xCu);

    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "parentAccount");
  v15 = objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v15
    && (-[NSObject accountType](v15, "accountType"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "identifier"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C8F058]),
        v17,
        v16,
        v18))
  {
    DALoggingwithCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v19, v20))
    {
      objc_msgSend(v4, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1B51E4000, v19, v20, "Not creating a store for account %{public}@ because it is the child of a CalDAV account", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__DAAccountChangeHandler__setupStoreForNewAccount___block_invoke;
    v23[3] = &unk_1E68CB808;
    v24 = v4;
    objc_msgSend(a1, "_performBlockWithGenericClientDBForAccount:block:", v22, v23);

    v19 = v24;
  }

LABEL_14:
}

void __51__DAAccountChangeHandler__setupStoreForNewAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D0BB58];
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "childAccounts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpCalStoreForParentAccount:withChildren:inDatabase:", v5, v6, a3);

}

+ (void)_performBlockWithGenericClientDBForAccount:(id)a3 block:(id)a4
{
  void (**v5)(id, uint64_t, uint64_t);
  id v6;
  id v7;

  v5 = (void (**)(id, uint64_t, uint64_t))a4;
  v6 = a3;
  +[DALocalDBHelper sharedInstanceForAccountType:creatingClass:](DALocalDBHelper, "sharedInstanceForAccountType:creatingClass:", CFSTR("GenericDataAccessAccount"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calOpenDatabaseAsGenericClientForAccountID:", 0);
  objc_msgSend(v7, "calOpenDatabaseAsGenericClientForAccountID:", v6);
  v5[2](v5, objc_msgSend(v7, "calDatabaseForAccountID:", 0), objc_msgSend(v7, "calDatabaseForAccountID:", v6));

  objc_msgSend(v7, "calCloseDatabaseForAccountID:save:", v6, 0);
  objc_msgSend(v7, "calCloseDatabaseForAccountID:save:", 0, 0);

}

+ (BOOL)_handleCalDAVAccountModifiedByDataAccess:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6
{
  return objc_msgSend(a1, "_sanityCheckChildSubCalAccountsWithParent:inStore:accountUpdater:", a3, a5, a6);
}

+ (id)_accountTypeWithIdentifier:(id)a3 inStore:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0;
  objc_msgSend(a4, "accountTypeWithAccountTypeIdentifier:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (!v6)
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1B51E4000, v8, v9, "Couldn't find an account type with identifier %{public}@, error = %@", buf, 0x16u);
    }

  }
  return v6;
}

+ (BOOL)_sanityCheckChildSubCalAccountsWithParent:(id)a3 inStore:(id)a4 accountUpdater:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  uint64_t v46;
  void *v47;
  uint64_t n;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  char v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t ii;
  uint64_t v80;
  void *v81;
  void *v82;
  char v83;
  int v84;
  void *v85;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  BOOL v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id obj;
  void *v108;
  void *v109;
  _QWORD v110[4];
  BOOL v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(uint64_t, char, void *);
  void *v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v89 = a4;
  v95 = a5;
  objc_msgSend(MEMORY[0x1E0D1C438], "CalDAVSubscribedCalendarsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = v9;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v10;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v108 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  objc_msgSend(v7, "childAccounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v138;
    v15 = *MEMORY[0x1E0C8F140];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v138 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        objc_msgSend(v17, "accountType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v15);

        if (v20)
        {
          +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "calDAVURLPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "length"))
          {
            objc_msgSend(v100, "setObject:forKeyedSubscript:", v17, v22);
          }
          else
          {
            objc_msgSend(v17, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setObject:forKeyedSubscript:", v17, v23);

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = v108;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
  v26 = v95;
  v27 = 0x1E0D1C000uLL;
  v28 = v100;
  if (v25)
  {
    v29 = v25;
    v30 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v134 != v30)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * j);
        objc_msgSend(v100, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          objc_msgSend(v98, "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v34, v32);

        }
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
    }
    while (v29);
  }

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  objc_msgSend(v100, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v130;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v130 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * k);
        if ((objc_msgSend(obj, "containsObject:", v40) & 1) == 0)
        {
          objc_msgSend(v100, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v41);

        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
    }
    while (v37);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v93 = v24;
  v42 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
  v91 = v42 != 0;
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v126;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v126 != v44)
          objc_enumerationMutation(v93);
        v46 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * m);
        v120 = MEMORY[0x1E0C809B0];
        v121 = 3221225472;
        v122 = __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke;
        v123 = &unk_1E68CB7B8;
        v124 = v46;
        objc_msgSend(v95, "removeAccount:completion:");
      }
      v43 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
    }
    while (v43);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend(v98, "allKeys");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
  if (v99)
  {
    v96 = *(_QWORD *)v117;
    v87 = *MEMORY[0x1E0C8F140];
    v47 = v94;
    while (1)
    {
      for (n = 0; n != v99; ++n)
      {
        if (*(_QWORD *)v117 != v96)
          objc_enumerationMutation(v92);
        v49 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * n);
        objc_msgSend(v28, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v50;
        if (!v50)
        {
          objc_msgSend(a1, "_accountTypeWithIdentifier:inStore:", v87, v89);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v51);
          objc_msgSend(v50, "setParentAccount:", v90);
          objc_msgSend(v50, "setAuthenticated:", 1);

        }
        +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (v52)
        {
          objc_msgSend(v52, "calDAVURLPath");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v50;
          v106 = n;
          v104 = v54;
          if (v54 == v49 || (objc_msgSend(v54, "isEqualToString:", v49) & 1) != 0)
          {
            v55 = 0;
          }
          else
          {
            objc_msgSend(v53, "setCalDAVURLPath:", v49);
            v55 = 1;
          }
          objc_msgSend(v98, "objectForKeyedSubscript:", v49);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v53, "shouldRemoveAlarms");
          objc_msgSend(*(id *)(v27 + 1080), "SubCalFilterAlarmsKey");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "BOOLValue");

          if (v57 != v60)
          {
            objc_msgSend(*(id *)(v27 + 1080), "SubCalFilterAlarmsKey");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setShouldRemoveAlarms:", objc_msgSend(v62, "BOOLValue"));

            v55 = 1;
          }
          objc_msgSend(v53, "subscriptionURL");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "absoluteString");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v27 + 1080), "SubCalSubscriptionURLKey");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v66, "hasPrefix:", CFSTR("webcal://")))
          {
            objc_msgSend(v66, "substringFromIndex:", 6);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("http"), "stringByAppendingString:", v67);
            v68 = objc_claimAutoreleasedReturnValue();

            v66 = (void *)v68;
          }
          if (v66 && v64 != v66 && (objc_msgSend(v64, "isEqualToString:", v66) & 1) == 0)
          {
            objc_msgSend(v53, "setHost:", v66);
            v55 = 1;
          }
          objc_msgSend(*(id *)(v27 + 1080), "SubCalTitleKey");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "accountDescription");
          v71 = objc_claimAutoreleasedReturnValue();
          if ((void *)v71 == v70)
          {

          }
          else
          {
            v72 = (void *)v71;
            objc_msgSend(v53, "accountDescription");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend(v73, "isEqualToString:", v70);

            if ((v74 & 1) == 0)
            {
              objc_msgSend(v53, "setAccountDescription:", v70);
              v55 = 1;
            }
          }
          v101 = v70;
          v102 = v66;
          v103 = v64;
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v75 = v56;
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v113;
            do
            {
              for (ii = 0; ii != v77; ++ii)
              {
                if (*(_QWORD *)v113 != v78)
                  objc_enumerationMutation(v75);
                v80 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * ii);
                objc_msgSend(v75, "objectForKeyedSubscript:", v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v80);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = objc_msgSend(v82, "isEqual:", v81);

                if ((v83 & 1) == 0)
                {
                  objc_msgSend(v53, "setObject:forKeyedSubscript:", v81, v80);
                  v55 = 1;
                }

              }
              v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
            }
            while (v77);
          }

          v50 = v105;
          v84 = objc_msgSend(a1, "_updateSubscribedCalendarAccountProperties:", v105);
          if (v109)
          {
            v47 = v94;
            v26 = v95;
            v27 = 0x1E0D1C000;
            v28 = v100;
            n = v106;
            if (((v84 | v55) & 1) == 0)
            {
LABEL_82:

              goto LABEL_83;
            }
          }
          else
          {
            objc_msgSend(v53, "setVersionForNewAccount");
            v47 = v94;
            v26 = v95;
            v27 = 0x1E0D1C000;
            v28 = v100;
            n = v106;
          }
          v110[0] = MEMORY[0x1E0C809B0];
          v110[1] = 3221225472;
          v110[2] = __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke_69;
          v110[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
          v111 = v109 == 0;
          v85 = (void *)MEMORY[0x1B5E48C2C](v110);
          if (v109)
            objc_msgSend(v26, "updateAccount:withCompletionHandler:", v105, v85);
          else
            objc_msgSend(v26, "addAccount:withCompletionHandler:", v105, v85);

          v91 = 1;
          goto LABEL_82;
        }
LABEL_83:

      }
      v99 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
      if (!v99)
        goto LABEL_87;
    }
  }
  v47 = v94;
LABEL_87:

  return v91;
}

void __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B51E4000, v6, v7, "Failed to remove orphaned subscribed calendar account %{public}@: error = %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

void __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke_69(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      v8 = CFSTR("added");
      if (!*(_BYTE *)(a1 + 32))
        v8 = CFSTR("modified");
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B51E4000, v6, v7, "Failed to save %{public}@ subscribed calendar child account: error = %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

+ (BOOL)_handleChangeToSubscribedCalendar:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6
{
  void *v7;
  char v8;

  +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF109828))
    v8 = objc_msgSend(a1, "_updateCalendarFromAccount:", v7);
  else
    v8 = 0;

  return v8;
}

+ (BOOL)_updateCalendarFromAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  int v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  os_log_type_t v27;
  void *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
  objc_msgSend(a1, "_findSubscribedCalendarForAccount:inEventStore:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "subscriptionURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v6, "subcalURL"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", v8),
          v9,
          (v10 & 1) == 0))
    {
      objc_msgSend(v6, "setSubcalURL:", v8);
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    v14 = objc_msgSend(v4, "shouldRemoveAlarms");
    if (v14 != objc_msgSend(v6, "stripAlarms"))
    {
      objc_msgSend(v6, "setStripAlarms:", objc_msgSend(v4, "shouldRemoveAlarms"));
      v11 = 1;
    }
    v15 = objc_msgSend(v4, "shouldRemoveAttachments");
    if (v15 != objc_msgSend(v6, "stripAttachments"))
    {
      objc_msgSend(v6, "setStripAttachments:", objc_msgSend(v4, "shouldRemoveAttachments"));
      v11 = 1;
    }
    objc_msgSend(v4, "refreshInterval");
    if (objc_msgSend(v6, "refreshInterval") != (int)v16)
    {
      objc_msgSend(v4, "refreshInterval");
      objc_msgSend(v6, "setRefreshInterval:", (int)v17);
      v11 = 1;
    }
    objc_msgSend(v4, "calendarExternalId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v18);

    if ((v20 & 1) != 0)
    {
      if (!v11)
      {
        DALoggingwithCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
        if (os_log_type_enabled(v21, v22))
        {
          objc_msgSend(v4, "accountID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "accountDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v23;
          v34 = 2112;
          v35 = v24;
          _os_log_impl(&dword_1B51E4000, v21, v22, "No calendar updates needed for changes to account %{public}@ (%@)", buf, 0x16u);

        }
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(v6, "setExternalID:", v18);
    }
    v31 = 0;
    v25 = objc_msgSend(v5, "saveCalendar:commit:error:", v6, 1, &v31);
    v21 = v31;
    if ((v25 & 1) == 0)
    {
      DALoggingwithCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
      if (os_log_type_enabled(v26, v27))
      {
        objc_msgSend(v4, "accountID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        v34 = 2112;
        v35 = v29;
        v36 = 2112;
        v37 = v21;
        _os_log_impl(&dword_1B51E4000, v26, v27, "Couldn't save calendar with updated properties for change to account %{public}@ (%@): %@", buf, 0x20u);

      }
    }
    goto LABEL_23;
  }
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
  if (os_log_type_enabled(v8, v12))
  {
    objc_msgSend(v4, "accountID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_impl(&dword_1B51E4000, v8, v12, "No calendar for account %{public}@, so we can't update it.", buf, 0xCu);

  }
LABEL_24:

  return 0;
}

+ (id)_findSubscribedCalendarForAccount:(id)a3 inEventStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "calendarsForEntityType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "subcalAccountID", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v7);

        if ((v14 & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (BOOL)_updateSubscribedCalendarAccountProperties:(id)a3
{
  return 0;
}

+ (BOOL)_sanityCheckCalDAVAccount:(id)a3 accountChangeInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v8, v9))
  {
    objc_msgSend(v7, "accountDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "shouldUseCalendarHomeSyncReport"))
      v12 = &stru_1E68CCDC0;
    else
      v12 = CFSTR(" NOT");
    objc_msgSend(v6, "modifiedDataClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413058;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1B51E4000, v8, v9, "Sanity checking CalDAV account \"%@\" (%{public}@). This account does %@ use the calendar home sync report. Modified dataclasses are %@.", (uint8_t *)&v24, 0x2Au);

  }
  objc_msgSend(v6, "modifiedDataClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", *MEMORY[0x1E0C8EE58]);

  if (v15)
    objc_msgSend(v7, "calendarsDataclassModified");
  objc_msgSend(v7, "backingAccountInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "changeType"))
    goto LABEL_13;
  objc_msgSend(v16, "parentAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || !objc_msgSend(v16, "supportsAuthentication")
    || objc_msgSend(v16, "isAuthenticated"))
  {

LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v16, "credential");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_13;
  DALoggingwithCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, v9))
  {
    objc_msgSend(v7, "accountDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publicDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v22;
    v26 = 2114;
    v27 = v23;
    _os_log_impl(&dword_1B51E4000, v21, v9, "Account \"%@\" (%{public}@) is being added with credentials but is not set as authenticated. Marking it to ignore the authenticated property on next sync.", (uint8_t *)&v24, 0x16u);

  }
  objc_msgSend(v16, "setAccountProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D0C4F8]);
  v18 = 1;
LABEL_14:

  return v18;
}

+ (BOOL)_sanityCheckChildDAVAccount:(id)a3 withParent:(id)a4 accountChangeInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id *v34;
  void *v35;
  void *v36;
  int v37;
  id *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  int v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C8F0A8];
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F0A8]) & 1) != 0)
    goto LABEL_6;
  v72 = a1;
  v73 = v10;
  objc_msgSend(v9, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C8F160]) & 1) != 0)
  {
LABEL_5:

    a1 = v72;
    v10 = v73;
LABEL_6:

    goto LABEL_7;
  }
  v71 = v8;
  objc_msgSend(v9, "accountType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C8F028]) & 1) != 0)
  {

    v8 = v71;
    goto LABEL_5;
  }
  objc_msgSend(v9, "accountType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0C8F108]);

  v8 = v71;
  a1 = v72;
  v10 = v73;
  if ((v70 & 1) == 0)
  {
    objc_msgSend(v9, "accountType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    if (!v33)
    {
      v39 = 0;
      goto LABEL_29;
    }
    if ((objc_msgSend(v71, "isCalDAVAccount") & 1) != 0)
    {
      v34 = (id *)MEMORY[0x1E0C8EE58];
    }
    else
    {
      if (!objc_msgSend(v71, "isCardDAVAccount"))
        goto LABEL_39;
      v34 = (id *)MEMORY[0x1E0C8EE68];
    }
    v46 = *v34;
    if (v46)
    {
      v47 = v46;
      objc_msgSend(v9, "propertiesForDataclass:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("url"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v49, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          objc_msgSend(v71, "principalURL");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "host");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "host");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v52, "isEqualToString:", v53);

          if ((v54 & 1) != 0)
          {
            v55 = v71;
            v56 = 0;
          }
          else
          {
            objc_msgSend(v50, "host");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setHost:", v58);

            v55 = v71;
            v56 = 1;
          }
          v59 = objc_msgSend(v55, "port");
          objc_msgSend(v50, "port");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "integerValue");

          if (v59 != v61)
          {
            objc_msgSend(v50, "port");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setPort:", objc_msgSend(v62, "integerValue"));

            v56 = 1;
          }
          objc_msgSend(v50, "scheme");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v63, "length"))
          {
            objc_msgSend(v50, "scheme");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("https"));

          }
          else
          {
            v65 = 1;
          }

          if ((_DWORD)v65 == objc_msgSend(v71, "useSSL"))
          {
            if (!v56)
            {
              v57 = 0;
              v8 = v71;
LABEL_54:
              a1 = v72;
              goto LABEL_55;
            }
          }
          else
          {
            objc_msgSend(v71, "setUseSSL:", v65);
          }
          DALoggingwithCategory();
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
          v8 = v71;
          if (os_log_type_enabled(v66, v67))
          {
            objc_msgSend(v71, "principalURL");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "absoluteString");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v75 = v69;
            v76 = 2112;
            v77 = v49;
            _os_log_impl(&dword_1B51E4000, v66, v67, "BagURL has changed from %@ to %@, updated account", buf, 0x16u);

          }
          v57 = 1;
          goto LABEL_54;
        }
      }
      else
      {
        v50 = 0;
      }
      v57 = 0;
LABEL_55:

      v10 = v73;
      goto LABEL_56;
    }
LABEL_39:
    v57 = 0;
LABEL_56:
    v39 = v57 != 0;
    goto LABEL_29;
  }
LABEL_7:
  objc_msgSend(v9, "accountType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", v13);

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v9, "accountType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0C8F160]);

    if ((v25 & 1) != 0)
    {
      v21 = 1;
      v22 = CFSTR("yahoo.com");
      goto LABEL_26;
    }
    objc_msgSend(v9, "accountType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0C8F028]);

    if ((v28 & 1) != 0)
    {
      v21 = 1;
      v22 = CFSTR("aol.com");
      goto LABEL_26;
    }
    objc_msgSend(v9, "accountType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0C8F108]);

    if (v37)
    {
      if ((objc_msgSend(v8, "isCalDAVAccount") & 1) != 0)
      {
        v38 = (id *)MEMORY[0x1E0C8EE58];
      }
      else
      {
        if (!objc_msgSend(v8, "isCardDAVAccount"))
          goto LABEL_25;
        v38 = (id *)MEMORY[0x1E0C8EE68];
      }
      v40 = *v38;
      if (v40)
      {
        v41 = v40;
        objc_msgSend(v9, "propertiesForDataclass:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF90]);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F000]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v43, "BOOLValue");

        goto LABEL_26;
      }
    }
LABEL_25:
    v22 = 0;
    v21 = 1;
    goto LABEL_26;
  }
  v21 = 1;
  v22 = CFSTR("google.com");
LABEL_26:
  objc_msgSend(v8, "host");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v44 == 0;

  if (!v44)
  {
    objc_msgSend(v8, "setHost:", v22);
    objc_msgSend(v8, "setUseSSL:", v21);
  }

LABEL_29:
  if (objc_msgSend(v8, "isCalDAVAccount"))
    v39 |= objc_msgSend(a1, "_sanityCheckCalDAVAccount:accountChangeInfo:", v8, v10);

  return v39;
}

+ (BOOL)_sanityCheckChildAccountOfType:(id)a3 withParent:(id)a4 accountChangeInfo:(id)a5 inStore:(id)a6 updater:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  os_log_type_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  char v54;
  void *v55;
  int v56;
  char v57;
  BOOL v58;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  int v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  int v93;
  int v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  _BOOL4 v164;
  int v165;
  uint64_t v166;
  void *v167;
  int v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint8_t v183[128];
  uint8_t buf[4];
  id v185;
  __int16 v186;
  id v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  void *v191;
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v174 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v172 = a7;
  v171 = v12;
  v169 = v11;
  v170 = v13;
  if (!objc_msgSend(v12, "changeType")
    || (objc_msgSend(v12, "oldAccountProperties"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    v168 = 1;
    goto LABEL_69;
  }
  objc_msgSend(v11, "username");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v167, "length");
  if (v166
    || (objc_msgSend(v12, "username"), v155 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v155, "length")))
  {
    objc_msgSend(v11, "username");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "username");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v15;
    v16 = 1;
    if (!objc_msgSend(v15, "isEqualToString:"))
    {
      v165 = 1;
      v17 = 0;
      v164 = 0;
      v163 = 0;
      v156 = 0;
      v157 = 0;
      v162 = 0;
      v161 = 0;
      v18 = 0;
      v160 = 0;
      v19 = 0;
      v158 = 0;
      v159 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
LABEL_14:
      v168 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountHost"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");
  v164 = v27 == 0;
  v165 = v16;
  v152 = v26;
  if (v27
    || (objc_msgSend(v12, "oldAccountProperties"),
        v144 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("DAAccountHost")),
        v143 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v143, "length")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountHost"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oldAccountProperties");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("DAAccountHost"));
    v151 = v28;
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:");
    v17 = 1;
    if (!v29)
    {
      v156 = 0;
      v157 = 0;
      v163 = 0x100000000;
      v162 = 0;
      v161 = 0;
      v18 = 0;
      v160 = 0;
      v19 = 0;
      v158 = 0;
      v159 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      goto LABEL_14;
    }
    HIDWORD(v163) = 1;
  }
  else
  {
    HIDWORD(v163) = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountPort"));
  v60 = objc_claimAutoreleasedReturnValue();
  LODWORD(v163) = v60 == 0;
  v148 = (void *)v60;
  if (!v60)
  {
    objc_msgSend(v12, "oldAccountProperties");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("DAAccountPort"));
    v61 = objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      v137 = 0;
      LODWORD(v162) = 0;
      goto LABEL_129;
    }
    v137 = (void *)v61;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountPort"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oldAccountProperties");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("DAAccountPort"));
  v147 = v62;
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "isEqual:");
  v17 = 1;
  if (!v63)
  {
    v156 = 0;
    v161 = 0;
    v18 = 0;
    v160 = 0;
    v19 = 0;
    v158 = 0;
    v159 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v157 = 1;
    v162 = 1;
    goto LABEL_14;
  }
  LODWORD(v162) = 1;
LABEL_129:
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountUseSSL"));
  v64 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v162) = v64 == 0;
  v142 = (void *)v64;
  if (!v64)
  {
    objc_msgSend(v12, "oldAccountProperties");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("DAAccountUseSSL"));
    v65 = objc_claimAutoreleasedReturnValue();
    if (!v65)
    {
      v128 = 0;
      v68 = 0;
      goto LABEL_136;
    }
    v128 = (void *)v65;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountUseSSL"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oldAccountProperties");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("DAAccountUseSSL"));
  v141 = v66;
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "isEqual:");
  v17 = 1;
  if (!v67)
  {
    v18 = 0;
    v161 = 0x100000000;
    v160 = 0;
    v19 = 0;
    v158 = 0;
    v159 = 0;
    v20 = 0;
    v21 = 0;
    v156 = 0x100000000;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v157 = 1;
    goto LABEL_14;
  }
  v68 = 1;
LABEL_136:
  objc_msgSend(MEMORY[0x1E0D1C438], "DAAccountPrincipalPath");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v135, "length");
  LODWORD(v161) = v69 == 0;
  HIDWORD(v161) = v68;
  if (v69
    || (objc_msgSend(v12, "oldAccountProperties"),
        v70 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0D1C438], "DAAccountPrincipalPath"),
        v122 = (void *)objc_claimAutoreleasedReturnValue(),
        v123 = v70,
        objc_msgSend(v70, "objectForKeyedSubscript:"),
        v121 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v121, "length")))
  {
    objc_msgSend(MEMORY[0x1E0D1C438], "DAAccountPrincipalPath");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oldAccountProperties");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1C438], "DAAccountPrincipalPath");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v72;
    objc_msgSend(v72, "objectForKeyedSubscript:");
    v133 = v71;
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqualToString:");
    v17 = 1;
    if (!v73)
    {
      v19 = 0;
      v158 = 0;
      v159 = 0;
      v20 = 0;
      v21 = 0;
      v156 = 0x100000000;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v157 = 1;
      v18 = 1;
      v160 = 1;
      goto LABEL_14;
    }
    LODWORD(v160) = 1;
  }
  else
  {
    LODWORD(v160) = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v127, "length");
  HIDWORD(v160) = v74 == 0;
  if (v74
    || (objc_msgSend(v12, "oldAccountProperties"),
        v116 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress")),
        v115 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v115, "length")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oldAccountProperties");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress"));
    v126 = v75;
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "isEqualToString:");
    v17 = 1;
    if (!v76)
    {
      v20 = 0;
      v159 = 0x100000000;
      v158 = 0;
      v21 = 0;
      v156 = 0x100000000;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v157 = 1;
      v18 = 1;
      v19 = 1;
      goto LABEL_14;
    }
    HIDWORD(v159) = 1;
  }
  else
  {
    HIDWORD(v159) = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Username"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v120, "length");
  LODWORD(v159) = v77 == 0;
  if (v77
    || (objc_msgSend(v12, "oldAccountProperties"),
        v109 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("Username")),
        v108 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v108, "length")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Username"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oldAccountProperties");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("Username"));
    v119 = v78;
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "isEqualToString:");
    v17 = 1;
    if (!v79)
    {
      v21 = 0;
      v156 = 0x100000000;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v157 = 1;
      v18 = 1;
      v19 = 1;
      v20 = 1;
      v158 = 1;
      goto LABEL_14;
    }
    LODWORD(v158) = 1;
  }
  else
  {
    LODWORD(v158) = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Hostname"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v114, "length");
  HIDWORD(v158) = v80 == 0;
  if (v80
    || (objc_msgSend(v12, "oldAccountProperties"),
        v103 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("Hostname")),
        v102 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v102, "length")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Hostname"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oldAccountProperties");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("Hostname"));
    v113 = v81;
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "isEqualToString:");
    v17 = 1;
    if (!v82)
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v157 = 1;
      v18 = 1;
      v19 = 1;
      v20 = 1;
      v21 = 1;
      v156 = 0x100000001;
      goto LABEL_14;
    }
    LODWORD(v156) = 1;
  }
  else
  {
    LODWORD(v156) = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PortNumber"));
  v83 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v157) = v83 == 0;
  v107 = (void *)v83;
  if (!v83)
  {
    objc_msgSend(v12, "oldAccountProperties");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("PortNumber"));
    v85 = objc_claimAutoreleasedReturnValue();
    if (!v85)
    {
      v98 = 0;
      v23 = 0;
      goto LABEL_167;
    }
    v98 = (void *)v85;
    v110 = v84;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PortNumber"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oldAccountProperties");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("PortNumber"));
  v106 = v86;
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "isEqual:");
  v17 = 1;
  if (!v87)
  {
    v24 = 0;
    v25 = 0;
    LODWORD(v157) = 1;
    HIDWORD(v156) = 1;
    v18 = 1;
    v19 = 1;
    v20 = 1;
    v21 = 1;
    v22 = 1;
    v23 = 1;
    goto LABEL_14;
  }
  v23 = 1;
  v84 = v110;
LABEL_167:
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SSLEnabled"));
  v88 = objc_claimAutoreleasedReturnValue();
  v95 = v88 == 0;
  v101 = (void *)v88;
  v110 = v84;
  if (v88)
  {
LABEL_170:
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SSLEnabled"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oldAccountProperties");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("SSLEnabled"));
    v92 = objc_claimAutoreleasedReturnValue();
    v100 = v91;
    v93 = objc_msgSend(v91, "isEqual:", v92);
    v90 = (void *)v92;
    v94 = 1;
    goto LABEL_171;
  }
  objc_msgSend(v12, "oldAccountProperties");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("SSLEnabled"));
  v89 = objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    v96 = (void *)v89;
    goto LABEL_170;
  }
  v96 = 0;
  v94 = 0;
  v93 = 1;
LABEL_171:
  v168 = v93 ^ 1;
  v17 = 1;
  LODWORD(v157) = 1;
  HIDWORD(v156) = 1;
  v18 = 1;
  v19 = 1;
  v20 = 1;
  v21 = 1;
  v22 = 1;
  v24 = 1;
  v25 = v95;
  if (v94)
  {

  }
LABEL_16:
  if (v25)
  {

    if (!v24)
    {
LABEL_18:
      if (!v23)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if (!v24)
  {
    goto LABEL_18;
  }

  if (v23)
  {
LABEL_19:

  }
LABEL_20:
  if (HIDWORD(v157))
  {

  }
  if (v22)

  if ((_DWORD)v156)
  {

  }
  v11 = v169;
  if (HIDWORD(v158))
  {

  }
  if (v21)

  if ((_DWORD)v158)
  {

  }
  if ((_DWORD)v159)
  {

  }
  if (v20)

  if (HIDWORD(v159))
  {

  }
  if (HIDWORD(v160))
  {

  }
  if (v19)

  if ((_DWORD)v160)
  {

  }
  if ((_DWORD)v161)
  {

  }
  if (v18)
  {

  }
  if (HIDWORD(v161))
  {

  }
  if (HIDWORD(v162))
  {

  }
  if (HIDWORD(v156))

  if ((_DWORD)v162)
  {

  }
  if ((_DWORD)v163)
  {

  }
  if ((_DWORD)v157)

  if (HIDWORD(v163))
  {

  }
  if (!v164)
  {
    if (!v17)
      goto LABEL_64;
LABEL_118:

    if (!v165)
      goto LABEL_66;
    goto LABEL_65;
  }

  if (v17)
    goto LABEL_118;
LABEL_64:
  if (v165)
  {
LABEL_65:

  }
LABEL_66:
  if (!v166)

LABEL_69:
  v30 = (void *)objc_opt_new();
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  objc_msgSend(v11, "childAccounts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v179, v192, 16);
  if (!v32)
  {

    v43 = v172;
LABEL_96:
    v45 = v170;
    objc_msgSend(a1, "_accountTypeWithIdentifier:inStore:", v174, v170);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v49);
    objc_msgSend(v34, "setParentAccount:", v11);
    objc_msgSend(v34, "setAuthenticationType:", *MEMORY[0x1E0C8F350]);
    v54 = 1;
    v44 = v171;
    goto LABEL_97;
  }
  v33 = v32;
  v34 = 0;
  v35 = *(_QWORD *)v180;
  do
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v180 != v35)
        objc_enumerationMutation(v31);
      v37 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
      objc_msgSend(v37, "accountType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", v174);

      if (v40)
      {
        if (v34)
        {
          objc_msgSend(a1, "_pickAccountToKeepWithAccount:andAccount:", v34, v37);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          if (v41 == v34)
          {
            objc_msgSend(v30, "addObject:", v37);
          }
          else
          {
            objc_msgSend(v30, "addObject:", v34);
            v42 = v41;

            v34 = v42;
          }

        }
        else
        {
          v34 = v37;
        }
      }
    }
    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v179, v192, 16);
  }
  while (v33);

  v11 = v169;
  v43 = v172;
  if (!v34)
    goto LABEL_96;
  v44 = v171;
  v45 = v170;
  if (!objc_msgSend(v30, "count"))
  {
    v54 = 0;
    goto LABEL_98;
  }
  DALoggingwithCategory();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
  if (os_log_type_enabled(v46, v47))
  {
    objc_msgSend(v34, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v185 = v174;
    v186 = 2112;
    v187 = v169;
    v188 = 2112;
    v189 = v48;
    v190 = 2112;
    v191 = v30;
    _os_log_impl(&dword_1B51E4000, v46, v47, "Found > 1 child accounts of type %@ under account %@.  Keeping %@ and removing %@", buf, 0x2Au);

  }
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v49 = v30;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v175, v183, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v176;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v176 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(v172, "removeAccount:completion:");
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v175, v183, 16);
    }
    while (v51);
  }
  v54 = 0;
  v44 = v171;
  v45 = v170;
  v11 = v169;
  v43 = v172;
LABEL_97:

LABEL_98:
  +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v34);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v55, "isCalDAVAccount") & 1) != 0 || objc_msgSend(v55, "isCardDAVAccount"))
    v56 = objc_msgSend(a1, "_sanityCheckChildDAVAccount:withParent:accountChangeInfo:", v55, v11, v44);
  else
    v56 = 0;
  if (v168 && !objc_msgSend(v55, "shouldDoInitialAutodiscovery"))
  {
    objc_msgSend(v55, "setShouldDoInitialAutodiscovery:", 1);
    if ((v54 & 1) == 0)
      goto LABEL_109;
LABEL_108:
    objc_msgSend(v43, "addAccount:withCompletionHandler:", v34, &__block_literal_global_2);
    objc_msgSend(v30, "count");
    v58 = 1;
    goto LABEL_113;
  }
  if ((v54 & 1) != 0)
    goto LABEL_108;
  if (!v56)
  {
    v57 = 0;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(v43, "updateAccount:withCompletionHandler:", v34, &__block_literal_global_127);
  v57 = 1;
LABEL_110:
  if (objc_msgSend(v30, "count"))
    v58 = 1;
  else
    v58 = v57;
LABEL_113:

  return v58;
}

void __102__DAAccountChangeHandler__sanityCheckChildAccountOfType_withParent_accountChangeInfo_inStore_updater___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B51E4000, v6, v7, "Failed to remove duplicate child account %{public}@: error = %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

void __102__DAAccountChangeHandler__sanityCheckChildAccountOfType_withParent_accountChangeInfo_inStore_updater___block_invoke_125(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B51E4000, v5, v6, "Failed to add child account: error = %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void __102__DAAccountChangeHandler__sanityCheckChildAccountOfType_withParent_accountChangeInfo_inStore_updater___block_invoke_126(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B51E4000, v5, v6, "Failed to save child account: error = %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

+ (id)_pickAccountToKeepWithAccount:(id)a3 andAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  v10 = v6;
  if (v9 != -1)
  {
    v10 = v5;
    if (v9 != 1)
    {
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "compare:", v12);

      if (v13 == -1)
        v10 = v5;
      else
        v10 = v6;
    }
  }
  v14 = v10;

  return v14;
}

+ (BOOL)_sanityCheckEnabledDataclassesOnExchangeAccountInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "enabledDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
    goto LABEL_10;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  v10 = *MEMORY[0x1E0C8EE70];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v4);
      v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isEqualToString:", v10);
      v7 |= v12;
      v8 |= v12 ^ 1;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v6);
  if ((v7 & 1) == (v8 & 1))
  {
LABEL_10:
    v13 = 0;
  }
  else
  {
    objc_msgSend(v3, "setEnabled:forDataclass:");
    v13 = 1;
  }

  return v13;
}

@end
