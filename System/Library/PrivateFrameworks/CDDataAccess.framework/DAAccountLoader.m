@implementation DAAccountLoader

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__DAAccountLoader_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__sharedInstance;
}

void __33__DAAccountLoader_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_findPrivateFrameworks");
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v1;

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

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    if (os_log_type_enabled(v15, v16))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1C1CD1000, v15, v16, "Handling account info mapping %@", (uint8_t *)&v20, 0xCu);
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

- (DAAccountLoader)init
{
  DAAccountLoader *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[16];
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)DAAccountLoader;
  v2 = -[DAAccountLoader init](&v59, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[DAAccountLoader setAcAccountTypeToAccountFrameworkSubpath:](v2, "setAcAccountTypeToAccountFrameworkSubpath:", v3);

    v4 = (void *)objc_opt_new();
    -[DAAccountLoader setAcAccountTypeToAccountDaemonBundleSubpath:](v2, "setAcAccountTypeToAccountDaemonBundleSubpath:", v4);

    v5 = (void *)objc_opt_new();
    -[DAAccountLoader setAcAccountTypeToClassNames:](v2, "setAcAccountTypeToClassNames:", v5);

    v6 = (void *)objc_opt_new();
    -[DAAccountLoader setAcParentAccountTypeToChildAccountTypes:](v2, "setAcParentAccountTypeToChildAccountTypes:", v6);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)privateFrameworksPath;
    v9 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("AccountInfo.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithContentsOfFile:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DAAccountInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    v15 = os_log_type_enabled(v13, v14);
    v43 = v8;
    if (v12)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1CD1000, v13, v14, "Using pre-cached account infos", buf, 2u);
      }

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v12;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("DAFrameworkName"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              -[DAAccountLoader _addAccountInfo:forFrameworkNamed:](v2, "_addAccountInfo:forFrameworkNamed:", v20, v21);

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v17);
        v8 = v43;
      }
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1CD1000, v13, v14, "Going to the disk for our account info providers", buf, 2u);
      }

      objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v8, 0);
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v22)
      {
        v40 = 0;
        v41 = v11;
        v42 = v7;
        v23 = *(_QWORD *)v51;
        v24 = 0x1E0CB3000uLL;
        v25 = v22;
        do
        {
          v26 = 0;
          v44 = v25;
          do
          {
            if (*(_QWORD *)v51 != v23)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v26);
            v28 = objc_alloc(*(Class *)(v24 + 1232));
            objc_msgSend(v8, "stringByAppendingPathComponent:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v28, "initWithPath:", v29);

            if (v30)
            {
              objc_msgSend(v30, "infoDictionary");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v31;
              if (v31)
              {
                v33 = v23;
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DAAccountInfo"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = 0u;
                v47 = 0u;
                v48 = 0u;
                v49 = 0u;
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                if (v35)
                {
                  v36 = v35;
                  v37 = *(_QWORD *)v47;
                  do
                  {
                    for (j = 0; j != v36; ++j)
                    {
                      if (*(_QWORD *)v47 != v37)
                        objc_enumerationMutation(v34);
                      -[DAAccountLoader _addAccountInfo:forFrameworkNamed:](v2, "_addAccountInfo:forFrameworkNamed:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), v27, v40, v41, v42);
                    }
                    v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                  }
                  while (v36);
                }

                v8 = v43;
                v25 = v44;
                v23 = v33;
                v24 = 0x1E0CB3000;
              }

            }
            ++v26;
          }
          while (v26 != v25);
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        }
        while (v25);
        v11 = v41;
        v7 = v42;
        v12 = v40;
      }
    }

  }
  return v2;
}

+ (void)_findPrivateFrameworks
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateFrameworksPath");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)privateFrameworksPath;
  privateFrameworksPath = v5;

  if (!privateFrameworksPath)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DAAccountLoader.m"), 140, CFSTR("Could not find the frameworks directory for bundle %@"), v7);

  }
}

- (BOOL)_loadFrameworkAtSubpath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DAAccountLoader *v7;
  char v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)privateFrameworksPath, "stringByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  objc_sync_enter(v7);
  v13 = 0;
  v8 = objc_msgSend(v6, "loadAndReturnError:", &v13);
  v9 = v13;
  if ((v8 & 1) == 0)
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1C1CD1000, v10, v11, "Failed to load account bundle {error: %@}", buf, 0xCu);
    }

  }
  objc_sync_exit(v7);

  return v8;
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

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  acAccountTypeToAccountFrameworkSubpath = self->_acAccountTypeToAccountFrameworkSubpath;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](acAccountTypeToAccountFrameworkSubpath, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[DAAccountLoader _loadFrameworkAtSubpath:](self, "_loadFrameworkAtSubpath:", v7))
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1C1CD1000, v8, v9, "We don't know of any bundles for account type \"%@\", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)loadDaemonBundleForACAccountType:(id)a3
{
  NSMutableDictionary *acAccountTypeToAccountDaemonBundleSubpath;
  void *v5;
  id v6;

  acAccountTypeToAccountDaemonBundleSubpath = self->_acAccountTypeToAccountDaemonBundleSubpath;
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](acAccountTypeToAccountDaemonBundleSubpath, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[DAAccountLoader _loadFrameworkAtSubpath:](self, "_loadFrameworkAtSubpath:", v6);
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

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

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
    v20 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
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
        _os_log_impl(&dword_1C1CD1000, v19, v20, "Could not come up with an account class (name %@) for account %@ parent account %@", (uint8_t *)&v25, 0x20u);

      }
    }
    else if (v21)
    {
      v25 = 138412546;
      v26 = v16;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1C1CD1000, v19, v20, "Could not come up with an account class (name %@) for account %@", (uint8_t *)&v25, 0x16u);
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

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

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
    v23 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
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
        _os_log_impl(&dword_1C1CD1000, v22, v23, "Could not come up with a client account class (name %@) for account %@ parent account %@", (uint8_t *)&v28, 0x20u);

      }
    }
    else if (v24)
    {
      v28 = 138412546;
      v29 = v16;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_1C1CD1000, v22, v23, "Could not come up with a client account class (name %@) for account %@", (uint8_t *)&v28, 0x16u);
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

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

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
  -[DAAccountLoader loadDaemonBundleForACAccountType:](self, "loadDaemonBundleForACAccountType:", v20);

  v21 = NSClassFromString(v16);
  if (!v21)
  {
LABEL_6:
    objc_msgSend(v4, "parentAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
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
        _os_log_impl(&dword_1C1CD1000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@ parent account %@", (uint8_t *)&v29, 0x20u);

      }
    }
    else if (v25)
    {
      v29 = 138412546;
      v30 = v16;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_1C1CD1000, v23, v24, "Could not come up with a daemon account class (name %@) for account %@", (uint8_t *)&v29, 0x16u);
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
  -[DAAccountLoader loadDaemonBundleForACAccountType:](self, "loadDaemonBundleForACAccountType:", v6);

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

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      objc_msgSend(v5, "parentAccount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccountLoader.m"), 251, CFSTR("Could not come up with an agent class (name %@) for account %@ parent account %@"), v17, v5, v22);

    }
    else
    {
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccountLoader.m"), 253, CFSTR("Could not come up with an agent class (name %@) for account %@"), v17, v5);
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
  if (DAIsRunningInDataAccessD())
    -[DAAccountLoader daemonAccountClassForACAccount:](self, "daemonAccountClassForACAccount:", v4);
  else
    -[DAAccountLoader clientAccountClassForACAccount:](self, "clientAccountClassForACAccount:", v4);
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
