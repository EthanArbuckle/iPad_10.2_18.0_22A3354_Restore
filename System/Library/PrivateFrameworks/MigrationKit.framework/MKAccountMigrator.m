@implementation MKAccountMigrator

- (MKAccountMigrator)init
{
  MKAccountMigrator *v2;
  uint64_t v3;
  ACAccountStore *accountStore;
  ACAccountStore *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *accountTypes;
  NSMutableDictionary *v9;
  NSMutableDictionary *existingAccounts;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _BYTE v35[128];
  const __CFString *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)MKAccountMigrator;
  v2 = -[MKMigrator init](&v33, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

    v5 = v2->_accountStore;
    if (v5)
    {
      v36 = CFSTR("com.google");
      -[ACAccountStore accountTypeWithAccountTypeIdentifier:](v5, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4068]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      accountTypes = v2->_accountTypes;
      v2->_accountTypes = (NSDictionary *)v7;

    }
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    existingAccounts = v2->_existingAccounts;
    v2->_existingAccounts = v9;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSDictionary allKeys](v2->_accountTypes, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](v2->_accountTypes, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          -[ACAccountStore accountsWithAccountType:](v2->_accountStore, "accountsWithAccountType:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "username");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            }
            while (v17);
          }

          -[NSMutableDictionary setObject:forKey:](v2->_existingAccounts, "setObject:forKey:", v14, v12);
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v24);
    }

    -[MKMigrator setType:](v2, "setType:", 1);
  }
  return v2;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKAccountMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKAccountMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  void *v4;
  NSObject *v5;
  MKAccount *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSDictionary *accountTypes;
  void *v11;
  NSMutableDictionary *existingAccounts;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MKAccount *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  ACAccountStore *accountStore;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  MKAccountMigrator *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = self;
    _os_log_impl(&dword_21EC08000, v5, OS_LOG_TYPE_INFO, "%@ will import an account.", buf, 0xCu);
  }

  if (!self->_accountStore || !-[NSDictionary count](self->_accountTypes, "count"))
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BDD0FC8];
    v64[0] = CFSTR("cannot continue to import an account due to an ACAccountStore error.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v6 = (MKAccount *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("MKAccountErrorDomain"), 2, v6);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v19 = (MKAccount *)v22;
    v20 = 0;
LABEL_15:

    +[MKLog log](MKLog, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      -[MKAccount description](v19, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = self;
      v57 = 2112;
      v58 = v24;
      _os_log_impl(&dword_21EC08000, v23, OS_LOG_TYPE_INFO, "%@ account store did store an account. error=%@", buf, 0x16u);

    }
    if (v20)
    {
      -[MKMigrator migratorDidImport](self, "migratorDidImport");
      -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v48, "length"));
    }
    else
    {
      -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v19);
    }
    +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance", v46);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v25);
    -[NSObject payload](v25, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "accounts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v4);
    v30 = v29;

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v30);
    objc_msgSend(v27, "importElapsedTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "decimalNumberByAdding:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setImportElapsedTime:", v33);

    objc_sync_exit(v25);
    v6 = v19;
    goto LABEL_21;
  }
  v6 = -[MKAccount initWithData:]([MKAccount alloc], "initWithData:", v48);
  if (!v6)
  {
    v34 = (void *)MEMORY[0x24BDD1540];
    v61 = *MEMORY[0x24BDD0FC8];
    v62 = CFSTR("invalid argument");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v6 = (MKAccount *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("MKAccountErrorDomain"), 1, v6);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[MKAccount type](v6, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAccount name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v56 = self;
    v57 = 2112;
    v58 = v8;
    v59 = 2112;
    v60 = v9;
    _os_log_impl(&dword_21EC08000, v7, OS_LOG_TYPE_INFO, "%@ received an account. type=%@, name=%@", buf, 0x20u);

  }
  accountTypes = self->_accountTypes;
  -[MKAccount type](v6, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](accountTypes, "objectForKeyedSubscript:", v11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    existingAccounts = self->_existingAccounts;
    -[MKAccount type](v6, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](existingAccounts, "objectForKeyedSubscript:", v13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKAccount name](v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v46, "containsObject:", v14);

    if (v15)
    {
      +[MKLog log](MKLog, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[MKAccount type](v6, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKAccount name](v6, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v56 = self;
        v57 = 2112;
        v58 = v17;
        v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_21EC08000, v16, OS_LOG_TYPE_INFO, "%@ account already exists. type=%@, name=%@", buf, 0x20u);

      }
      v19 = 0;
      v20 = 1;
    }
    else
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v47);
      -[MKAccount name](v6, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setUsername:", v37);

      -[MKAccount name](v6, "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAccountDescription:", v38);

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v47, "supportedDataclasses");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v51 != v41)
              objc_enumerationMutation(v39);
            v43 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v36, "setProvisioned:forDataclass:", 1, v43, v46);
            objc_msgSend(v36, "setEnabled:forDataclass:", 1, v43);
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        }
        while (v40);
      }

      accountStore = self->_accountStore;
      v49 = 0;
      -[ACAccountStore saveVerifiedAccount:error:](accountStore, "saveVerifiedAccount:error:", v36, &v49);
      v19 = (MKAccount *)v49;
      v20 = v19 == 0;
      if (!v19)
      {
        -[MKAccount name](v6, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v45);

      }
    }
    goto LABEL_15;
  }
  +[MKLog log](MKLog, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    -[MKAccount type](v6, "type");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v56 = self;
    v57 = 2112;
    v58 = v35;
    _os_log_impl(&dword_21EC08000, v25, OS_LOG_TYPE_INFO, "%@ will skip an account. type=%@", buf, 0x16u);

  }
LABEL_21:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAccounts, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
