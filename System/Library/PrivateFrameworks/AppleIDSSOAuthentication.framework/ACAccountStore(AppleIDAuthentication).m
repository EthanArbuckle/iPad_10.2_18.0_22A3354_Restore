@implementation ACAccountStore(AppleIDAuthentication)

- (id)aida_accountForPrimaryiCloudAccount
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_primaryiCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aida_accountForiCloudAccount:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_primaryiCloudAccount
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "accountPropertyForKey:", CFSTR("primaryAccount"), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if ((v10 & 1) != 0)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)aida_accountForiCloudAccount:()AppleIDAuthentication
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(v18, "aida_alternateDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aida_AppleIDAuthenticationAccounts");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "aida_alternateDSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v4) & 1) != 0)
          goto LABEL_14;
        objc_msgSend(v9, "accountPropertyForKey:", CFSTR("adsid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v4))
        {

LABEL_14:
LABEL_15:
          v15 = v9;
          goto LABEL_16;
        }
        objc_msgSend(v9, "username");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "username");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
          goto LABEL_15;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v15 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (id)aida_AppleIDAuthenticationAccounts
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "aida_AppleIDAuthenticationAccountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)aida_AppleIDAuthenticationAccountType
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F050]);
}

- (id)aida_accountForAltDSID:()AppleIDAuthentication
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "aida_AppleIDAuthenticationAccounts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "aida_alternateDSID", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v4))
        {

LABEL_13:
          v14 = v10;
          goto LABEL_14;
        }
        objc_msgSend(v10, "accountPropertyForKey:", CFSTR("adsid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)aida_iCloudAccountMatchingAppleIDAuthAccount:()AppleIDAuthentication
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountPropertyForKey:", CFSTR("altDSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v6 = (id)objc_msgSend(v4, "accountPropertyForKey:", CFSTR("adsid"));
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v7);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v18 = v4;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "accountPropertyForKey:", CFSTR("altDSID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v5);

        if (v15)
        {
          v16 = v13;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
    v16 = 0;
LABEL_13:
    v4 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (uint64_t)aida_renewCredentialsForAccount:()AppleIDAuthentication services:completion:
{
  return objc_msgSend(a1, "aida_renewCredentialsForAccount:services:force:completion:", a3, a4, 0, a5);
}

- (void)aida_renewCredentialsForAccount:()AppleIDAuthentication services:force:completion:
{
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0C8F330];
  v17[0] = CFSTR("Services");
  v17[1] = v10;
  v18[0] = a4;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "numberWithBool:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "renewCredentialsForAccount:options:completion:", v14, v16, v12);
}

@end
