@implementation MailAccount(NNMKAdditions)

- (id)nano_accountId
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "nano_account");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accountId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (NNMKAccount)nano_account
{
  NNMKAccount *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = objc_alloc_init(NNMKAccount);
  objc_msgSend(a1, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setLocalId:](v2, "setLocalId:", v3);

  objc_msgSend(a1, "parentAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setParentAccountIdentifier:](v2, "setParentAccountIdentifier:", v4);

  objc_msgSend(a1, "displayName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_24F9F9D80;
  -[NNMKAccount setDisplayName:](v2, "setDisplayName:", v7);

  if (objc_msgSend(a1, "supportsArchiving"))
    v8 = objc_msgSend(a1, "shouldArchiveByDefault");
  else
    v8 = 0;
  -[NNMKAccount setShouldArchive:](v2, "setShouldArchive:", v8);
  objc_msgSend(a1, "nano_emailAddressesAndAliasesList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setEmailAddresses:](v2, "setEmailAddresses:", v9);

  -[NNMKAccount setSourceType:](v2, "setSourceType:", 0);
  objc_msgSend(a1, "persistentAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setUsername:](v2, "setUsername:", v11);

  objc_msgSend((id)objc_opt_class(), "accountTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setTypeIdentifier:](v2, "setTypeIdentifier:", v12);

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("NNMKEmailAddressTokenKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setEmailAddressToken:](v2, "setEmailAddressToken:", v13);

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("NNMKPCCEmailAddressKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setPccEmailAddress:](v2, "setPccEmailAddress:", v14);

  objc_msgSend(a1, "defaultEmailAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setDefaultEmailAddress:](v2, "setDefaultEmailAddress:", v15);

  +[NNMKAccount generateAccountIdForAccount:](NNMKAccount, "generateAccountIdForAccount:", v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKAccount setAccountId:](v2, "setAccountId:", v16);

  return v2;
}

- (id)nano_emailAddressesAndAliasesList
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "emailAddressesAndAliasesList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_emailAddressStringsFromObjects:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_emailAddressStringsFromObjects:()NNMKAdditions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "ea_uncommentedAddress", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)nano_activeMailAccounts
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BE66358], "activeAccountsWithError:", &v14);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v14;
  v2 = 0;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v0, "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v0;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v2, "addObject:", v8, (_QWORD)v10);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v5);
    }

  }
  return v2;
}

@end
