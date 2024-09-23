@implementation MFSMIMEConfigurationProvider

- (BOOL)signingIsConfigured
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;
  BOOL v11;
  BOOL v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[MailAccount activeAccounts](MailAccount, "activeAccounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v20 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v5, "emailAddresses");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v6);
              v10 = +[MFMessageKeychainManager copyAllSigningIdentitiesForAddress:error:](MFMessageKeychainManager, "copyAllSigningIdentitiesForAddress:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), 0);
              v11 = objc_msgSend(v10, "count") == 0;

              if (!v11)
              {

                v12 = 1;
                goto LABEL_19;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v7)
              continue;
            break;
          }
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v12 = 0;
    }
    while (v2);
  }
  else
  {
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (BOOL)signingEnabledByDefault
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[MailAccount activeAccounts](MailAccount, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v7, "emailAddresses", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v14;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v8);
              if (objc_msgSend(v7, "secureCompositionSigningPolicyForAddress:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j)) > 0)
              {
                v3 = 1;
                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
            if (v9)
              continue;
            break;
          }
          v3 = 0;
        }
LABEL_16:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

- (BOOL)encryptionIsConfigured
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;
  BOOL v11;
  BOOL v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[MailAccount activeAccounts](MailAccount, "activeAccounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v20 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v5, "emailAddresses");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v6);
              v10 = +[MFMessageKeychainManager copyAllEncryptionIdentitiesForAddress:error:](MFMessageKeychainManager, "copyAllEncryptionIdentitiesForAddress:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), 0);
              v11 = objc_msgSend(v10, "count") == 0;

              if (!v11)
              {

                v12 = 1;
                goto LABEL_19;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v7)
              continue;
            break;
          }
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v12 = 0;
    }
    while (v2);
  }
  else
  {
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (BOOL)encryptionIsEnabledByDefault
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[MailAccount activeAccounts](MailAccount, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v7, "emailAddresses", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v14;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v8);
              if (objc_msgSend(v7, "secureCompositionEncryptionPolicyForAddress:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j)) > 0)
              {
                v3 = 1;
                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
            if (v9)
              continue;
            break;
          }
          v3 = 0;
        }
LABEL_16:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

@end
