@implementation ACAccountStore(AppleAccount)

- (id)aa_appleAccounts
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C8F030];
  v1 = (void *)MEMORY[0x1E0C99D20];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v3, 0, 0, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)aa_isUsingiCloud
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "aa_primaryAppleAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)aa_primaryAppleAccountWithPreloadedDataclasses
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C8F248];
  v11[0] = *MEMORY[0x1E0C8F250];
  v11[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x1E0C8F030];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a1;
  v6 = v3;
  objc_msgSend(v4, "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "aaf_firstObjectPassingTest:", &__block_literal_global_17_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)aa_primaryAppleAccount
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0C8F030];
  v1 = (void *)MEMORY[0x1E0C99D20];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v3, 0, 0, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aaf_firstObjectPassingTest:", &__block_literal_global_16_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)aa_appleAccountType
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:error:", *MEMORY[0x1E0C8F030], 0);
}

- (id)aa_dataSeparatedAccounts
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "aa_appleAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aaf_filter:", &__block_literal_global_21);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)aa_appleAccountsWithError:()AppleAccount
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0C8F030];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a1;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v6, 0, a3, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)aa_accountsForAccountClass:()AppleAccount
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14[0] = *MEMORY[0x1E0C8F030];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a1;
  objc_msgSend(v5, "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__ACAccountStore_AppleAccount__aa_accountsForAccountClass___block_invoke;
  v12[3] = &unk_1E4170250;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "aaf_filter:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)aa_appleAccountsWithCompletion:()AppleAccount
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0C8F030];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v7, 0, v6, v8, v9);

}

- (void)aa_primaryAppleAccountWithCompletion:()AppleAccount
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithCompletion___block_invoke;
  v9[3] = &unk_1E416EE50;
  v10 = v4;
  v11[0] = *MEMORY[0x1E0C8F030];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a1;
  v7 = v4;
  objc_msgSend(v5, "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v8, 0, v9);

}

- (id)aa_appleAccountWithUsername:()AppleAccount
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v20[0] = *MEMORY[0x1E0C8F030];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a1;
    objc_msgSend(v5, "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v7, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__ACAccountStore_AppleAccount__aa_appleAccountWithUsername___block_invoke;
    v18[3] = &unk_1E4170250;
    v19 = v4;
    -[NSObject aaf_firstObjectPassingTest:](v8, "aaf_firstObjectPassingTest:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_appleAccountWithUsername:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

- (id)aa_appleAccountWithPersonID:()AppleAccount
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v20[0] = *MEMORY[0x1E0C8F030];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a1;
    objc_msgSend(v5, "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v7, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__ACAccountStore_AppleAccount__aa_appleAccountWithPersonID___block_invoke;
    v18[3] = &unk_1E4170250;
    v19 = v4;
    -[NSObject aaf_firstObjectPassingTest:](v8, "aaf_firstObjectPassingTest:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_appleAccountWithPersonID:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

- (id)aa_appleAccountWithAltDSID:()AppleAccount
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v20[0] = *MEMORY[0x1E0C8F030];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a1;
    objc_msgSend(v5, "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v7, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__ACAccountStore_AppleAccount__aa_appleAccountWithAltDSID___block_invoke;
    v18[3] = &unk_1E4170250;
    v19 = v4;
    -[NSObject aaf_firstObjectPassingTest:](v8, "aaf_firstObjectPassingTest:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_appleAccountWithAltDSID:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

- (id)aa_accountsEnabledForDataclass:()AppleAccount
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "accountIdentifiersEnabledForDataclass:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v7)
    {
      v8 = v7;
      v22 = v4;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(a1, "accountWithIdentifier:error:", v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            _AALogSystem();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v11;
              _os_log_error_impl(&dword_19EACA000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch enabled account with identifier: %@", buf, 0xCu);
            }

          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v8);
      v4 = v22;
    }
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_accountsEnabledForDataclass:].cold.1(v6, v14, v15, v16, v17, v18, v19, v20);
    v5 = 0;
  }

  return v5;
}

- (id)aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:()AppleAccount
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v4;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier %@", buf, 0xCu);
  }

  objc_msgSend(a1, "aa_appleAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F030]))
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier recommending nothing for an iCloud account because we"
           " already have one or more iCloud accounts.";
LABEL_14:
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "count") != 1)
  {
    v11 = objc_msgSend(v6, "count");
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v11 >= 2)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        v8 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found > 1 iCloud account. Recommending nothing.";
        goto LABEL_14;
      }
LABEL_15:

      v10 = 0;
      goto LABEL_24;
    }
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found zero iCloud accounts. Checking other account types...", buf, 2u);
    }

    v13 = *MEMORY[0x1E0C8F098];
    v58[0] = *MEMORY[0x1E0C8F0E8];
    v58[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:", v14, &v52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v52;
    if (v16)
    {
      _AALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v16;
        v18 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier recommending nothing after receiving error: %@";
        v19 = v17;
        v20 = 12;
LABEL_21:
        _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      if (objc_msgSend(v15, "count"))
      {
        v25 = objc_msgSend(v15, "count");
        _AALogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v25 == 1)
        {
          if (v27)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found exactly one IS/GC account. Using it.", buf, 2u);
          }

          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v27)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found several IS/GC accounts. Checking their usernames...", buf, 2u);
          }

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          obj = v15;
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v28)
          {
            v29 = v28;
            v30 = 0;
            v31 = *(_QWORD *)v49;
            v45 = v15;
            v46 = v14;
            v44 = 0;
LABEL_38:
            v32 = 0;
            while (1)
            {
              if (*(_QWORD *)v49 != v31)
                objc_enumerationMutation(obj);
              v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v32);
              objc_msgSend(v33, "username", v44, v45, v46);
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = (void *)v34;
              if (v30)
              {
                v36 = objc_msgSend(v30, "isEqualToString:", v34);

                if ((v36 & 1) == 0)
                {
                  _AALogSystem();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19EACA000, v42, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier IS/GC accounts contain several usernames. Recommending nothing.", buf, 2u);
                  }
LABEL_57:
                  v15 = v45;
                  v14 = v46;
                  v16 = v44;

                  v10 = 0;
                  goto LABEL_58;
                }
              }
              else
              {
                v30 = (void *)v34;
              }
              objc_msgSend(v33, "accountType");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v4, "isEqualToString:", v38);

              if (v39)
              {
                _AALogSystem();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v33, "accountType");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v54 = v41;
                  _os_log_impl(&dword_19EACA000, v42, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier can't recommend a username that already has an account of type %@. Recommending nothing.", buf, 0xCu);

                }
                goto LABEL_57;
              }
              if (v29 == ++v32)
              {
                v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
                v15 = v45;
                v14 = v46;
                v16 = v44;
                if (v29)
                  goto LABEL_38;
                goto LABEL_50;
              }
            }
          }
          v30 = 0;
LABEL_50:

          _AALogSystem();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19EACA000, v40, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier all IS/GC usernames are identical. Using that.", buf, 2u);
          }

          objc_msgSend(obj, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:

        }
        goto LABEL_23;
      }
      _AALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found no IS/GC accounts. Recommending nothing.";
        v19 = v17;
        v20 = 2;
        goto LABEL_21;
      }
    }

    v10 = 0;
LABEL_23:

    goto LABEL_24;
  }
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier found exactly one iCloud account. Using it.", buf, 2u);
  }

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  _AALogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "username");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v54 = v22;
    v55 = 2112;
    v56 = v10;
    _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier returning appleID %@ from account %@", buf, 0x16u);

  }
  objc_msgSend(v10, "username");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (uint64_t)aa_updatePropertiesForAppleAccount:()AppleAccount completion:
{
  return objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:options:completion:", a3, 0, a4);
}

- (uint64_t)aa_updatePropertiesForAppleAccount:()AppleAccount options:completion:
{
  return objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:options:serverInfo:completion:", a3, a4, 0, a5);
}

- (void)aa_updatePropertiesForAppleAccount:()AppleAccount options:serverInfo:completion:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v10, "aa_authToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      objc_msgSend(v10, "aa_password");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __97__ACAccountStore_AppleAccount__aa_updatePropertiesForAppleAccount_options_serverInfo_completion___block_invoke;
        v18[3] = &unk_1E41702B8;
        v18[4] = a1;
        v19 = v10;
        v20 = v12;
        v21 = v13;
        objc_msgSend(a1, "renewCredentialsForAccount:options:completion:", v19, v11, v18);

        goto LABEL_6;
      }
    }
  }
  objc_msgSend(a1, "_performUpdateRequestWithAccount:serverInfo:completion:", v10, v12, v13);
LABEL_6:

}

- (void)_performUpdateRequestWithAccount:()AppleAccount serverInfo:completion:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  AAUpdateProvisioningRequest *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  uint8_t buf[4];
  os_signpost_id_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = _AASignpostCreate(v10);
  v13 = v12;

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    objc_msgSend(v7, "accountType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = (os_signpost_id_t)v17;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "GetAccountSettings", " AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0xCu);

  }
  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "accountType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v30 = v11;
    v31 = 2114;
    v32 = v20;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GetAccountSettings  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

  }
  v21 = -[AAUpdateProvisioningRequest initWithAccount:]([AAUpdateProvisioningRequest alloc], "initWithAccount:", v7);
  -[AAUpdateProvisioningRequest setServerInfo:](v21, "setServerInfo:", v9);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke;
  v24[3] = &unk_1E41702E0;
  v27 = v11;
  v28 = v13;
  v25 = v7;
  v26 = v8;
  v22 = v8;
  v23 = v7;
  -[AARequest performRequestWithHandler:](v21, "performRequestWithHandler:", v24);

}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount withCompletion:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[AAiCloudLoginAccountRequester delegateParamsForiCloudOnly](AAiCloudLoginAccountRequester, "delegateParamsForiCloudOnly");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:", v7, v8, v6);

}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  AAiCloudLoginAccountRequester *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "accountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if ((v12 & 1) == 0)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:].cold.2(v7, v15);

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = -18;
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("com.apple.mobileme"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:].cold.1(v18);

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = -3;
LABEL_10:
    objc_msgSend(v16, "aa_errorWithCode:", v17);
    v14 = (AAiCloudLoginAccountRequester *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, AAiCloudLoginAccountRequester *))v9 + 2))(v9, 0, 0, v14);
    goto LABEL_11;
  }
  v14 = objc_alloc_init(AAiCloudLoginAccountRequester);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke;
  v19[3] = &unk_1E4170308;
  v21 = v9;
  v20 = v7;
  -[AAiCloudLoginAccountRequester loginWithAccount:forDelegates:completion:](v14, "loginWithAccount:forDelegates:completion:", v20, v8, v19);

LABEL_11:
}

- (void)aa_registerAppleAccount:()AppleAccount withCompletion:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ACAccountStore_AppleAccount__aa_registerAppleAccount_withCompletion___block_invoke;
  v9[3] = &unk_1E4170330;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "registerAccount:withHSA:completion:", v6, 0, v9);

}

- (void)aa_registerAppleAccountWithHSA:()AppleAccount completion:
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerAccount:withHSA:completion:", v6, 1, v5);

}

- (id)aa_grandSlamAccountForiCloudAccount:()AppleAccount
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    objc_msgSend(a1, "aida_accountForiCloudAccount:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_grandSlamAccountForiCloudAccount:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v3 = 0;
  }
  return v3;
}

- (id)aa_grandSlamAccountForAltDSID:()AppleAccount
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    objc_msgSend(a1, "aida_accountForAltDSID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_grandSlamAccountForAltDSID:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v3 = 0;
  }
  return v3;
}

- (id)aa_authKitAccountForAltDSID:()AppleAccount
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v18[0] = *MEMORY[0x1E0C8F0C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__ACAccountStore_AppleAccount__aa_authKitAccountForAltDSID___block_invoke;
    v16[3] = &unk_1E4170250;
    v17 = v4;
    objc_msgSend(v6, "aaf_firstObjectPassingTest:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ACAccountStore(AppleAccount) aa_authKitAccountForAltDSID:].cold.1(v5, v8, v9, v10, v11, v12, v13, v14);
    v7 = 0;
  }

  return v7;
}

- (void)aa_appleAccountWithUsername:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter username was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_appleAccountWithPersonID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter personID was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_appleAccountWithAltDSID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter altDSID was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_accountsEnabledForDataclass:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter dataclass was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "Rejecting attempt to call iCloud login without specifying iCloud delegate parameters", v1, 2u);
}

- (void)aa_loginAndUpdateiCloudAccount:()AppleAccount delegateParams:withCompletion:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Rejecting attempt to call iCloud login on non-iCloud account of type %@", (uint8_t *)&v5, 0xCu);

}

- (void)aa_grandSlamAccountForiCloudAccount:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter iCloudAccount was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_grandSlamAccountForAltDSID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter altDSID was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)aa_authKitAccountForAltDSID:()AppleAccount .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a1, a3, "%s: Failing because parameter altDSID was not provided!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
