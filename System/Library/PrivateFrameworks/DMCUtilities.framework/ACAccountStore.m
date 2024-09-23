@implementation ACAccountStore

uint64_t __77__ACAccountStore_DeviceManagementClient__dmc_visibleRemoteManagementAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_isVisibleRemoteManagementAccount");
}

uint64_t __86__ACAccountStore_DeviceManagementClient__dmc_visibleSecondaryRemoteManagementAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "dmc_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dmc_altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "dmc_isPrimaryAccount") ^ 1;
    }
    else
    {
      v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        objc_msgSend(v2, "dmc_altDSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_1A4951000, v9, OS_LOG_TYPE_ERROR, "No iCloud account for altDSID: %{public}@", (uint8_t *)&v12, 0xCu);

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __66__ACAccountStore_DeviceManagementClient__dmc_primaryiCloudAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_isPrimaryAccount");
}

BOOL __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

uint64_t __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)))
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "isActive");

  return v5;
}

uint64_t __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dmc_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "dmc_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "isActive");
  else
    v5 = 0;

  return v5;
}

BOOL __72__ACAccountStore_DeviceManagementClient__dmc_iCloudAccountWithUsername___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

uint64_t __96__ACAccountStore_DeviceManagementClient__dmc_updateAppleAccountWithPersonaID_error_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dmc_personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;
  __int128 v8;

  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke_2;
  v6[3] = &unk_1E4D36C58;
  v8 = *(_OWORD *)(a1 + 48);
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "saveVerifiedAccount:withCompletionHandler:", v4, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

void __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __96__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithAltDSID_asynchronous___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dmc_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __98__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithPersonaID_asynchronous___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dmc_personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __73__ACAccountStore_DeviceManagementClient__dmc_accountsWithPredicateBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 - objc_msgSend(v10, "indexOfObject:", v12);

  return v13;
}

uint64_t __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "indexOfObject:", v12);

  if (v9 < v13)
    return -1;
  else
    return v9 > v13;
}

void __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  dispatch_semaphore_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_DEFAULT, "Will remove account: %{public}@ , type: %{public}@", buf, 0x16u);

  }
  v11 = a1 + 32;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v11 + 8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_9;
  v13[3] = &unk_1E4D36CF8;
  v13[4] = v9;
  v14 = v2;
  v12 = v2;
  objc_msgSend(v10, "removeAccount:withCompletionHandler:", v9, v13);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *DMCLogObjects();
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v6;
      objc_msgSend(v12, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      v26 = 2114;
      v27 = v5;
      _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "Cannot remove account with ID: %@. Error: %{public}@", buf, 0x16u);

    }
    v8 = objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "identifier", CFSTR("Account Identifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15;
    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = &stru_1E4D38200;
    v22[1] = CFSTR("Type");
    v23[0] = v16;
    objc_msgSend(*(id *)(a1 + 32), "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1E4D38200;
    v23[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject logErrorEventForTopic:reason:error:details:](v8, "logErrorEventForTopic:reason:error:details:", CFSTR("Accounts"), CFSTR("Account Removal Failed"), v5, v21);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_DEFAULT, "Account removed: %{public}@ , type: %{public}@", buf, 0x16u);

LABEL_13:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

@end
