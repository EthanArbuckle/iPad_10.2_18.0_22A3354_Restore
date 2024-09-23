@implementation ACAccountStore(DeviceManagementClient)

- (id)dmc_visibleRemoteManagementAccounts
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "filteredArrayUsingPredicate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (id)dmc_RemoteManagementAccounts
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "dmc_RemoteManagementAccountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)dmc_RemoteManagementAccountType
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F130]);
}

- (id)dmc_visibleSecondaryRemoteManagementAccounts
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dmc_visibleRemoteManagementAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filteredArrayUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)dmc_primaryiCloudAccount
{
  return objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", *MEMORY[0x1E0C8F030], 0, &__block_literal_global_4);
}

- (uint64_t)dmc_iCloudAccountForRemoteManagingAccount
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
}

- (uint64_t)dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:()DeviceManagementClient
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", *MEMORY[0x1E0C8F030], a3);
}

- (uint64_t)dmc_iTunesAccountForRemoteManagingAccount
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F170]);
}

- (uint64_t)dmc_iTunesAccountForRemoteManagingAccountWithAltDSID:()DeviceManagementClient
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", *MEMORY[0x1E0C8F170], a3);
}

- (id)_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()DeviceManagementClient
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "dmc_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()DeviceManagementClient altDSID:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v8, 0, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v9;
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "dmc_altDSID", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v7);

        if ((v17 & 1) != 0)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)dmc_remoteManagementAccountForAltDSID:()DeviceManagementClient
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dmc_altDSID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForDSID:()DeviceManagementClient
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dmc_DSID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToNumber:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForIdentifier:()DeviceManagementClient
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForEnrollmentURL:()DeviceManagementClient
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dmc_enrollmentURL", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForManagementProfileIdentifier:()DeviceManagementClient
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dmc_managementProfileIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)dmc_hasPrimaryAccount:()DeviceManagementClient
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C8F030];
  v6 = *MEMORY[0x1E0C8F170];
  v28[0] = *MEMORY[0x1E0C8F030];
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "accountType", (_QWORD)v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v5))
        {
          v17 = objc_msgSend(v14, "dmc_isPrimaryAccount");

          if ((v17 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
        objc_msgSend(v14, "accountType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToString:", v6))
        {
          v20 = objc_msgSend(v14, "isActive");

          if ((v20 & 1) != 0)
          {
LABEL_17:
            v21 = 1;
            goto LABEL_18;
          }
        }
        else
        {

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_18:

  return v21;
}

- (uint64_t)dmc_conflictingAccountsExistWithUsername:()DeviceManagementClient error:
{
  id *v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = *MEMORY[0x1E0C8F030];
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke;
  v23[3] = &unk_1E4D36C30;
  v10 = v7;
  v24 = v10;
  objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v8, a4, v23);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    v13 = *MEMORY[0x1E0C8F170];
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke_2;
    v21[3] = &unk_1E4D36C30;
    v4 = &v22;
    v22 = v10;
    objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v13, a4, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v19 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  v14 = *DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountTypeDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v10;
    v27 = 2112;
    v28 = v16;
    v29 = 2114;
    v30 = v18;
    _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_DEFAULT, "Conflicting account with username (%{public}@) exists. Identifier: %@, type: %{public}@", buf, 0x20u);

  }
  v19 = 1;
  if (!v11)
    goto LABEL_8;
LABEL_9:

  return v19;
}

- (uint64_t)dmc_conflictingAccountsExistWithAltDSID:()DeviceManagementClient error:
{
  id *v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = *MEMORY[0x1E0C8F030];
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke;
  v23[3] = &unk_1E4D36C30;
  v10 = v7;
  v24 = v10;
  objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v8, a4, v23);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    v13 = *MEMORY[0x1E0C8F170];
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke_2;
    v21[3] = &unk_1E4D36C30;
    v4 = &v22;
    v22 = v10;
    objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v13, a4, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v19 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  v14 = *DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountTypeDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v10;
    v27 = 2112;
    v28 = v16;
    v29 = 2114;
    v30 = v18;
    _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_DEFAULT, "Conflicting account with altDSID (%{public}@) exists. Identifier: %@, type: %{public}@", buf, 0x20u);

  }
  v19 = 1;
  if (!v11)
    goto LABEL_8;
LABEL_9:

  return v19;
}

- (id)dmc_iCloudAccountWithUsername:()DeviceManagementClient
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = *MEMORY[0x1E0C8F030];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ACAccountStore_DeviceManagementClient__dmc_iCloudAccountWithUsername___block_invoke;
  v9[3] = &unk_1E4D36C30;
  v10 = v4;
  v6 = v4;
  objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v5, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dmc_accountWithType:()DeviceManagementClient error:criteria:
{
  id v8;
  uint64_t (**v9)(id, void *);
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v30[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:", v10, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;

  if (!v12)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((v9[2](v9, v20) & 1) != 0)
          {
            v14 = v20;

            goto LABEL_17;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v17)
          continue;
        break;
      }
    }

    goto LABEL_15;
  }
  v13 = *DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch accounts with error: %{public}@", buf, 0xCu);
  }
  if (!a4)
  {
LABEL_15:
    v14 = 0;
    goto LABEL_17;
  }
  v14 = 0;
  *a4 = objc_retainAutorelease(v12);
LABEL_17:

  return v14;
}

- (uint64_t)dmc_updateAccountWithTypeIdentifier:()DeviceManagementClient altDSID:error:updateBlock:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_msgSend(a1, "_dmc_updateAccount:error:updateBlock:", v13, a5, v12);
  }
  else
  {
    v15 = *DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_ERROR, "Couldn't find account with type: %{public}@, altDSID: %{public}@.", (uint8_t *)&v17, 0x16u);
    }
    if (a5)
    {
      objc_msgSend(a1, "_dmc_missingAccountError");
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (uint64_t)dmc_updateAccountWithIdentifier:()DeviceManagementClient error:updateBlock:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "dmc_remoteManagementAccountForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(a1, "_dmc_updateAccount:error:updateBlock:", v10, a4, v9);
  }
  else
  {
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Couldn't find account with identifier: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    if (a4)
    {
      objc_msgSend(a1, "_dmc_missingAccountError");
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (uint64_t)dmc_updateAppleAccountWithPersonaID:()DeviceManagementClient error:updateBlock:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0C8F030];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__ACAccountStore_DeviceManagementClient__dmc_updateAppleAccountWithPersonaID_error_updateBlock___block_invoke;
  v16[3] = &unk_1E4D36C30;
  v11 = v8;
  v17 = v11;
  objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v10, a4, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(a1, "_dmc_updateAccount:error:updateBlock:", v12, a4, v9);
  }
  else
  {
    v14 = *DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "Couldn't find apple account with persona ID: %{public}@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)_dmc_updateAccount:()DeviceManagementClient error:updateBlock:
{
  id v8;
  void (**v9)(id, id);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  void *v24;
  id v25;
  uint64_t *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v8, "accountType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountTypeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dmc_altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_DEFAULT, "Will update account with type: %{public}@, altDSID: %{public}@.", buf, 0x16u);

  }
  v9[2](v9, v8);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  objc_msgSend(a1, "_dmc_workerQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke;
  v23 = &unk_1E4D36C80;
  v24 = a1;
  v16 = v8;
  v25 = v16;
  v26 = &v28;
  v27 = buf;
  objc_msgSend(v15, "queueBlock:", &v20);

  objc_msgSend(a1, "_dmc_workerQueue", v20, v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "waitUntilAllBlocksAreFinished");

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v18 = *((_BYTE *)v29 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (void)dmc_removeMAIDRelatedAccountsWithAltDSID:()DeviceManagementClient asynchronous:
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_INFO, "Will sign out accounts with altDSID: %{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithAltDSID_asynchronous___block_invoke;
  v10[3] = &unk_1E4D36CA8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(a1, "dmc_accountsWithPredicateBlock:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dmc_removeAccounts:asynchronous:", v9, a4);

}

- (void)dmc_removeMAIDRelatedAccountsWithPersonaID:()DeviceManagementClient asynchronous:
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_INFO, "Will remove accounts with personaID: %{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithPersonaID_asynchronous___block_invoke;
  v10[3] = &unk_1E4D36CA8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(a1, "dmc_accountsWithPredicateBlock:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dmc_removeAccounts:asynchronous:", v9, a4);

}

- (void)dmc_removeAccountWithIdentifier:()DeviceManagementClient asynchronous:
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountWithIdentifier:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dmc_removeAccounts:asynchronous:", v8, a4);

  }
}

- (id)dmc_accountsWithPredicateBlock:()DeviceManagementClient
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C8F0E8];
  v21[0] = *MEMORY[0x1E0C8F170];
  v21[1] = v5;
  v6 = *MEMORY[0x1E0C8F050];
  v21[2] = *MEMORY[0x1E0C8F030];
  v21[3] = v6;
  v7 = *MEMORY[0x1E0C8F130];
  v21[4] = *MEMORY[0x1E0C8F0C8];
  v21[5] = v7;
  v21[6] = *MEMORY[0x1E0C8F098];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v8, 0, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (v10)
  {
    v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_ERROR, "Fetching accounts failed with error: %{public}@", buf, 0xCu);
    }
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__ACAccountStore_DeviceManagementClient__dmc_accountsWithPredicateBlock___block_invoke;
    v16[3] = &unk_1E4D36CD0;
    v17 = v8;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)dmc_removeAccounts:()DeviceManagementClient asynchronous:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  _QWORD v30[9];

  v30[7] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C8F030];
  v30[0] = *MEMORY[0x1E0C8F130];
  v30[1] = v6;
  v7 = *MEMORY[0x1E0C8F098];
  v30[2] = *MEMORY[0x1E0C8F0E8];
  v30[3] = v7;
  v8 = *MEMORY[0x1E0C8F050];
  v30[4] = *MEMORY[0x1E0C8F170];
  v30[5] = v8;
  v30[6] = *MEMORY[0x1E0C8F0C8];
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v30, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke;
  v27[3] = &unk_1E4D36CD0;
  v21 = v11;
  v28 = v21;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_msgSend(a1, "_dmc_workerQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_2;
        v22[3] = &unk_1E4D36D20;
        v22[4] = v18;
        v22[5] = a1;
        objc_msgSend(v19, "queueBlock:", v22);

        if ((a4 & 1) == 0)
        {
          objc_msgSend(a1, "_dmc_workerQueue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "waitUntilAllBlocksAreFinished");

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v15);
  }

}

- (DMCHangDetectionQueue)_dmc_workerQueue
{
  DMCHangDetectionQueue *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (DMCHangDetectionQueue *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[DMCHangDetectionQueue initWithQoS:hangThreshold:owner:]([DMCHangDetectionQueue alloc], "initWithQoS:hangThreshold:owner:", -1, CFSTR("ACAccountStore+DMC"), 65.0);
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (uint64_t)_dmc_missingAccountError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCStoreErrorDomain"), 30002, 0, CFSTR("DMCFatalError"));
}

@end
