@implementation ACAccountStore(BRAdditions)

- (id)br_accountForCurrentPersona
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "br_accountForPersona:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)br_accountForPersona:()BRAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  NSObject *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (br_accountForPersona__onceToken != -1)
    dispatch_once(&br_accountForPersona__onceToken, &__block_literal_global_6);
  obj = (id)_accountForPersona;
  objc_sync_enter(obj);
  objc_msgSend((id)_accountForPersona, "objectForKeyedSubscript:", CFSTR("__defaultPersonaID__"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(a1, "aa_primaryAppleAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_accountForPersona, "setObject:forKeyedSubscript:", v6, CFSTR("__defaultPersonaID__"));

  }
  objc_msgSend(v4, "br_personaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDataSeparatedPersona") & 1) == 0)
  {
    objc_msgSend((id)_accountForPersona, "objectForKeyedSubscript:", CFSTR("__defaultPersonaID__"));
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend((id)_accountForPersona, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_15;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "br_allEligibleAppleAccounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v14 = (void *)_accountForPersona;
        objc_msgSend(v13, "br_personaIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v10);
  }

  objc_msgSend((id)_accountForPersona, "objectForKeyedSubscript:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_15:
    objc_msgSend((id)_accountForPersona, "objectForKeyedSubscript:", v7);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v18 = (void *)v17;
    goto LABEL_18;
  }
  brc_bread_crumbs((uint64_t)"-[ACAccountStore(BRAdditions) br_accountForPersona:]", 109);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_19CBF0000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] couldn't find account for persona %@%@", buf, 0x16u);
  }

  v18 = 0;
LABEL_18:

  objc_sync_exit(obj);
  return v18;
}

- (id)_br_getAllAppleAccountsWithError:()BRAdditions
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 118, CFSTR("Got nil accounts array back from Accounts Store accountsWithAccountType"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      brc_bread_crumbs((uint64_t)"-[ACAccountStore(BRAdditions) _br_getAllAppleAccountsWithError:]", 45);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v11 = "(passed to caller)";
        v12 = 136315906;
        v13 = "-[ACAccountStore(BRAdditions) _br_getAllAppleAccountsWithError:]";
        v14 = 2080;
        if (!a3)
          v11 = "(ignored by caller)";
        v15 = v11;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_19CBF0000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v12, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v7);

  }
  return v6;
}

- (uint64_t)br_allEligibleAppleAccounts
{
  return objc_msgSend(a1, "br_allEligibleAppleAccountsWithError:", 0);
}

- (id)br_allEligibleAppleAccountsWithError:()BRAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_br_getAllAppleAccountsWithError:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "br_copy_if:", &__block_literal_global_25);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)br_allEnabledAppleAccountsIncludingDataSeparated:()BRAdditions
{
  return objc_msgSend(a1, "br_allEnabledAppleAccountsIncludingDataSeparated:withError:", a3, 0);
}

- (id)br_allEnabledAppleAccountsIncludingDataSeparated:()BRAdditions withError:
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  char v9;

  objc_msgSend(a1, "_br_getAllAppleAccountsWithError:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__ACAccountStore_BRAdditions__br_allEnabledAppleAccountsIncludingDataSeparated_withError___block_invoke;
  v8[3] = &__block_descriptor_33_e8_B16__0_8l;
  v9 = a3;
  objc_msgSend(v5, "br_copy_if:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidateAccountForPersonaCache
{
  id obj;

  +[BRAccountDescriptor clearAccountDescriptorCache](BRAccountDescriptor, "clearAccountDescriptorCache");
  if (_accountForPersona)
  {
    obj = (id)_accountForPersona;
    objc_sync_enter(obj);
    objc_msgSend((id)_accountForPersona, "removeAllObjects");
    objc_sync_exit(obj);

  }
}

@end
