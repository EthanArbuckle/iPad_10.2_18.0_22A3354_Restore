@implementation ESAccount

+ (id)esAccountSubclassWithBackingAccountInfo:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = a3;
  +[ESAccountLoader sharedInstance](ESAccountLoader, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_msgSend(v4, "daemonAppropriateAccountClassForACAccount:", v3);

  v6 = (void *)objc_msgSend([v5 alloc], "initWithBackingAccountInfo:", v3);
  return v6;
}

+ (id)_leafExchangeAccountTypes
{
  if (_leafExchangeAccountTypes_onceToken != -1)
    dispatch_once(&_leafExchangeAccountTypes_onceToken, &__block_literal_global_3);
  return (id)_leafExchangeAccountTypes__sLeafAccountTypes;
}

void __38__ESAccount__leafExchangeAccountTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB4030], *MEMORY[0x24BDB4078], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_leafExchangeAccountTypes__sLeafAccountTypes;
  _leafExchangeAccountTypes__sLeafAccountTypes = v0;

}

- (void)updateOofSettingsWithParams:(id)a3 consumer:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  int v9;
  ESAccount *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_22AC94000, v6, v7, "Updating oof settings requested on account %@, which does not support it", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 10, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settingsRequestFinishedWithResults:status:error:", 0, 10, v8);

}

- (void)retrieveOofSettingsForConsumer:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  ESAccount *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_22AC94000, v5, v6, "Retrieving oof settings requested on account %@, which does not support it", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingsRequestFinishedWithResults:status:error:", 0, 10, v7);

}

+ (id)oneshotListOfAccountIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[ESAccount _leafExchangeAccountTypes](ESAccount, "_leafExchangeAccountTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v16 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v3, "accountsWithAccountType:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v18;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v18 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "identifier");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13)
                  objc_msgSend(v2, "addObject:", v13);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v10);
          }

        }
        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  return v2;
}

+ (void)reacquireClientRestrictions:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "oneshotListOfAccountIDs", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearUserInfoForClientUUIDs:", v5);

}

@end
