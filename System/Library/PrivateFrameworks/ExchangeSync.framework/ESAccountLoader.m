@implementation ESAccountLoader

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ESAccountLoader_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__sharedInstance;
}

void __33__ESAccountLoader_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v0;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sMainBundle;
  sMainBundle = v2;

}

- (void)_addAccountInfo:(id)a3 forFrameworkNamed:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACAccountType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACParentAccountType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAccountClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccountClassName:", v11);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAClientAccountClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClientAccountClassName:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DADaemonAccountClass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDaemonAccountClassName:", v13);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAgentClass"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAgentClassName:", v14);

    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v15, v16))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_22AC94000, v15, v16, "Handling account info mapping %@", (uint8_t *)&v20, 0xCu);
    }

    if (v9)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_acParentAccountTypeToChildAccountTypes, "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v17 = (void *)objc_opt_new();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acParentAccountTypeToChildAccountTypes, "setObject:forKeyedSubscript:", v17, v9);
      }
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, v8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acAccountTypeToAccountFrameworkSubpath, "setObject:forKeyedSubscript:", v7, v8);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acAccountTypeToClassNames, "setObject:forKeyedSubscript:", v10, v8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acAccountTypeToAccountFrameworkSubpath, "setObject:forKeyedSubscript:", v7, v8);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAgentClassBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v7, "stringByAppendingPathComponent:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("bundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acAccountTypeToAccountDaemonBundleSubpath, "setObject:forKeyedSubscript:", v19, v8);

      }
    }

  }
}

- (ESAccountLoader)init
{
  ESAccountLoader *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  NSObject *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t v74[128];
  uint8_t buf[4];
  uint64_t v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v73.receiver = self;
  v73.super_class = (Class)ESAccountLoader;
  v3 = -[ESAccountLoader init](&v73, sel_init);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[ESAccountLoader setAcAccountTypeToAccountFrameworkSubpath:](v3, "setAcAccountTypeToAccountFrameworkSubpath:", v4);

    v5 = (void *)objc_opt_new();
    -[ESAccountLoader setAcAccountTypeToAccountDaemonBundleSubpath:](v3, "setAcAccountTypeToAccountDaemonBundleSubpath:", v5);

    v6 = (void *)objc_opt_new();
    -[ESAccountLoader setAcAccountTypeToClassNames:](v3, "setAcAccountTypeToClassNames:", v6);

    v7 = (void *)objc_opt_new();
    -[ESAccountLoader setAcParentAccountTypeToChildAccountTypes:](v3, "setAcParentAccountTypeToChildAccountTypes:", v7);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "privateFrameworksPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("ESAccountLoader.m"), 105, CFSTR("Could not find the frameworks directory for bundle %@"), v50);

    }
    v12 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("AccountInfo.plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DAAccountInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && objc_msgSend(v15, "count"))
    {
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AC94000, v17, v18, "Using pre-cached account infos", buf, 2u);
      }

      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v16;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      if (!v19)
        goto LABEL_44;
      v20 = v19;
      v53 = v16;
      v21 = v14;
      v22 = v8;
      v23 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v70 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("DAFrameworkName"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            -[ESAccountLoader _addAccountInfo:forFrameworkNamed:](v3, "_addAccountInfo:forFrameworkNamed:", v25, v26);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v20);
      v8 = v22;
      v14 = v21;
    }
    else
    {
      DALoggingwithCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x24BE2AD38];
      v29 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
      if (os_log_type_enabled(v27, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AC94000, v27, v29, "Going to the disk for our account info providers", buf, 2u);
      }

      objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v11, 0);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (!v30)
        goto LABEL_44;
      v31 = v30;
      v52 = v8;
      v53 = v16;
      v51 = v14;
      v32 = *(_QWORD *)v66;
      v33 = *(_BYTE *)(v28 + 7);
      v54 = *(_QWORD *)v66;
      v55 = v11;
      do
      {
        v34 = 0;
        v56 = v31;
        do
        {
          if (*(_QWORD *)v66 != v32)
            objc_enumerationMutation(obj);
          v60 = v34;
          v35 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v34);
          DALoggingwithCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, v33))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v35;
            _os_log_impl(&dword_22AC94000, v36, v33, "Checking account info from framework: %@", buf, 0xCu);
          }

          v37 = objc_alloc(*(Class *)(v9 + 1160));
          objc_msgSend(v11, "stringByAppendingPathComponent:", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v37, "initWithPath:", v38);

          if (v39)
          {
            objc_msgSend(v39, "infoDictionary");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v57 = v40;
              v58 = v39;
              objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("DAAccountInfo"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v64 = 0u;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v62;
                do
                {
                  for (j = 0; j != v43; ++j)
                  {
                    if (*(_QWORD *)v62 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
                    DALoggingwithCategory();
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v47, v33))
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v46;
                      _os_log_impl(&dword_22AC94000, v47, v33, "Adding account info: %@", buf, 0xCu);
                    }

                    -[ESAccountLoader _addAccountInfo:forFrameworkNamed:](v3, "_addAccountInfo:forFrameworkNamed:", v46, v35);
                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
                }
                while (v43);
              }

              v32 = v54;
              v11 = v55;
              v9 = 0x24BDD1000;
              v31 = v56;
              v40 = v57;
              v39 = v58;
            }

          }
          v34 = v60 + 1;
        }
        while (v60 + 1 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      }
      while (v31);
      v14 = v51;
      v8 = v52;
    }
    v16 = v53;
LABEL_44:

  }
  return v3;
}

- (BOOL)_loadFrameworkAtSubpath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ESAccountLoader *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)sMainBundle, "privateFrameworksPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_msgSend(v7, "load");
  objc_sync_exit(v8);

  return v9;
}

- (void)loadFrameworkForACAccountType:(id)a3
{
  id v4;
  NSMutableDictionary *acAccountTypeToAccountFrameworkSubpath;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  acAccountTypeToAccountFrameworkSubpath = self->_acAccountTypeToAccountFrameworkSubpath;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](acAccountTypeToAccountFrameworkSubpath, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ESAccountLoader _loadFrameworkAtSubpath:](self, "_loadFrameworkAtSubpath:", v7))
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_22AC94000, v8, v9, "We don't know of any bundles for account type \"%@\", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)loadDaemonBundleForACAccountType:(id)a3
{
  id v4;
  NSMutableDictionary *acAccountTypeToAccountDaemonBundleSubpath;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  acAccountTypeToAccountDaemonBundleSubpath = self->_acAccountTypeToAccountDaemonBundleSubpath;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](acAccountTypeToAccountDaemonBundleSubpath, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ESAccountLoader _loadFrameworkAtSubpath:](self, "_loadFrameworkAtSubpath:", v7))
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_22AC94000, v8, v9, "Could not load bundle for account type %@ at subpath %@", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (Class)accountClassForACAccount:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSMutableDictionary *acParentAccountTypeToChildAccountTypes;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  Class v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void *v22;
  objc_class *v23;
  int v25;
  NSString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

  v6 = self->_acAccountTypeToClassNames;
  objc_msgSend(v4, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    objc_msgSend(v4, "parentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](acParentAccountTypeToChildAccountTypes, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (NSMutableDictionary *)v12;
  }
  objc_msgSend(v4, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountClassName");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  v17 = NSClassFromString(v16);
  if (!v17)
  {
    objc_msgSend(v4, "parentAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    v21 = os_log_type_enabled(v19, v20);
    if (v18)
    {
      if (v21)
      {
        objc_msgSend(v4, "parentAccount");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v16;
        v27 = 2112;
        v28 = v4;
        v29 = 2112;
        v30 = v22;
        _os_log_impl(&dword_22AC94000, v19, v20, "Could not come up with an account class (name %@) for account %@ parent account %@", (uint8_t *)&v25, 0x20u);

      }
    }
    else if (v21)
    {
      v25 = 138412546;
      v26 = v16;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_22AC94000, v19, v20, "Could not come up with an account class (name %@) for account %@", (uint8_t *)&v25, 0x16u);
    }

  }
  v23 = v17;

  return v23;
}

- (Class)clientAccountClassForACAccount:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSMutableDictionary *acParentAccountTypeToChildAccountTypes;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  Class v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  void *v25;
  objc_class *v26;
  int v28;
  NSString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

  v6 = self->_acAccountTypeToClassNames;
  objc_msgSend(v4, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    objc_msgSend(v4, "parentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](acParentAccountTypeToChildAccountTypes, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (NSMutableDictionary *)v12;
  }
  objc_msgSend(v4, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientAccountClassName");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v4, "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accountClassName");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v20 = NSClassFromString(v16);
  if (!v20)
  {
    objc_msgSend(v4, "parentAccount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    v24 = os_log_type_enabled(v22, v23);
    if (v21)
    {
      if (v24)
      {
        objc_msgSend(v4, "parentAccount");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v16;
        v30 = 2112;
        v31 = v4;
        v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_22AC94000, v22, v23, "Could not come up with a client account class (name %@) for account %@ parent account %@", (uint8_t *)&v28, 0x20u);

      }
    }
    else if (v24)
    {
      v28 = 138412546;
      v29 = v16;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_22AC94000, v22, v23, "Could not come up with a client account class (name %@) for account %@", (uint8_t *)&v28, 0x16u);
    }

  }
  v26 = v20;

  return v26;
}

- (Class)daemonAccountClassForACAccount:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSMutableDictionary *acParentAccountTypeToChildAccountTypes;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  Class v21;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  void *v26;
  objc_class *v27;
  int v29;
  NSString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

  v6 = self->_acAccountTypeToClassNames;
  objc_msgSend(v4, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    objc_msgSend(v4, "parentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](acParentAccountTypeToChildAccountTypes, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (NSMutableDictionary *)v12;
  }
  objc_msgSend(v4, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "daemonAccountClassName");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v4, "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accountClassName");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_6;
  }
  objc_msgSend(v4, "accountType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESAccountLoader loadDaemonBundleForACAccountType:](self, "loadDaemonBundleForACAccountType:", v20);

  v21 = NSClassFromString(v16);
  if (!v21)
  {
LABEL_6:
    objc_msgSend(v4, "parentAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    v25 = os_log_type_enabled(v23, v24);
    if (v22)
    {
      if (v25)
      {
        objc_msgSend(v4, "parentAccount");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412802;
        v30 = v16;
        v31 = 2112;
        v32 = v4;
        v33 = 2112;
        v34 = v26;
        _os_log_impl(&dword_22AC94000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@ parent account %@", (uint8_t *)&v29, 0x20u);

      }
    }
    else if (v25)
    {
      v29 = 138412546;
      v30 = v16;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_22AC94000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@", (uint8_t *)&v29, 0x16u);
    }

    v21 = 0;
  }
  v27 = v21;

  return v27;
}

- (Class)agentClassForACAccount:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *acParentAccountTypeToChildAccountTypes;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  Class v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;

  v5 = a3;
  objc_msgSend(v5, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESAccountLoader loadDaemonBundleForACAccountType:](self, "loadDaemonBundleForACAccountType:", v6);

  v7 = self->_acAccountTypeToClassNames;
  objc_msgSend(v5, "parentAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    acParentAccountTypeToChildAccountTypes = self->_acParentAccountTypeToChildAccountTypes;
    objc_msgSend(v5, "parentAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](acParentAccountTypeToChildAccountTypes, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (NSMutableDictionary *)v13;
  }
  objc_msgSend(v5, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "agentClassName");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();

  v18 = NSClassFromString(v17);
  if (!v18)
  {
    objc_msgSend(v5, "parentAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      objc_msgSend(v5, "parentAccount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESAccountLoader.m"), 250, CFSTR("Could not come up with an agent class (name %@) for account %@ parent account %@"), v17, v5, v22);

    }
    else
    {
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESAccountLoader.m"), 252, CFSTR("Could not come up with an agent class (name %@) for account %@"), v17, v5);
    }

  }
  v23 = v18;

  return v23;
}

- (Class)daemonAppropriateAccountClassForACAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (ESIsRunningInExchangeSyncD())
    -[ESAccountLoader daemonAccountClassForACAccount:](self, "daemonAccountClassForACAccount:", v4);
  else
    -[ESAccountLoader clientAccountClassForACAccount:](self, "clientAccountClassForACAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (NSMutableDictionary)acAccountTypeToAccountFrameworkSubpath
{
  return self->_acAccountTypeToAccountFrameworkSubpath;
}

- (void)setAcAccountTypeToAccountFrameworkSubpath:(id)a3
{
  objc_storeStrong((id *)&self->_acAccountTypeToAccountFrameworkSubpath, a3);
}

- (NSMutableDictionary)acAccountTypeToAccountDaemonBundleSubpath
{
  return self->_acAccountTypeToAccountDaemonBundleSubpath;
}

- (void)setAcAccountTypeToAccountDaemonBundleSubpath:(id)a3
{
  objc_storeStrong((id *)&self->_acAccountTypeToAccountDaemonBundleSubpath, a3);
}

- (NSMutableDictionary)acAccountTypeToClassNames
{
  return self->_acAccountTypeToClassNames;
}

- (void)setAcAccountTypeToClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_acAccountTypeToClassNames, a3);
}

- (NSMutableDictionary)acParentAccountTypeToChildAccountTypes
{
  return self->_acParentAccountTypeToChildAccountTypes;
}

- (void)setAcParentAccountTypeToChildAccountTypes:(id)a3
{
  objc_storeStrong((id *)&self->_acParentAccountTypeToChildAccountTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acParentAccountTypeToChildAccountTypes, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToClassNames, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountDaemonBundleSubpath, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountFrameworkSubpath, 0);
}

@end
