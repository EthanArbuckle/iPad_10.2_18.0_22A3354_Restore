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
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  NSMutableDictionary *classNamesForTopLevelAccountTypes;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACAccountType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACParentAccountType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACTopLevelAccountType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAccountClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccountClassName:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAClientAccountClass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClientAccountClassName:", v13);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DADaemonAccountClass"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDaemonAccountClassName:", v14);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAgentClass"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAgentClassName:", v15);

    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
    if (os_log_type_enabled(v16, v17))
    {
      v24 = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1B51E4000, v16, v17, "Handling account info mapping %@", (uint8_t *)&v24, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acAccountTypeToAccountFrameworkSubpath, "setObject:forKeyedSubscript:", v7, v8);
    if (v10)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_classNamesForTopLevelAccountTypes, "objectForKeyedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v18 = (void *)objc_opt_new();
        classNamesForTopLevelAccountTypes = self->_classNamesForTopLevelAccountTypes;
        v20 = v18;
        v21 = v10;
LABEL_10:
        -[NSMutableDictionary setObject:forKeyedSubscript:](classNamesForTopLevelAccountTypes, "setObject:forKeyedSubscript:", v20, v21);
      }
    }
    else
    {
      if (!v9)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultClassNamesForAccountTypes, "setObject:forKeyedSubscript:", v11, v8);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAgentClassBundle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v7, "stringByAppendingPathComponent:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByAppendingPathExtension:", CFSTR("bundle"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_acAccountTypeToAccountDaemonBundleSubpath, "setObject:forKeyedSubscript:", v23, v8);

        }
        goto LABEL_12;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_classNamesForDirectlyNestedAccountTypes, "objectForKeyedSubscript:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v18 = (void *)objc_opt_new();
        classNamesForTopLevelAccountTypes = self->_classNamesForDirectlyNestedAccountTypes;
        v20 = v18;
        v21 = v9;
        goto LABEL_10;
      }
    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, v8);
LABEL_12:

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
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id obj;
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
  __int128 v58;
  uint8_t buf[16];
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)DAAccountLoader;
  v2 = -[DAAccountLoader init](&v60, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[DAAccountLoader setAcAccountTypeToAccountFrameworkSubpath:](v2, "setAcAccountTypeToAccountFrameworkSubpath:", v3);

    v4 = (void *)objc_opt_new();
    -[DAAccountLoader setAcAccountTypeToAccountDaemonBundleSubpath:](v2, "setAcAccountTypeToAccountDaemonBundleSubpath:", v4);

    v5 = (void *)objc_opt_new();
    -[DAAccountLoader setDefaultClassNamesForAccountTypes:](v2, "setDefaultClassNamesForAccountTypes:", v5);

    v6 = (void *)objc_opt_new();
    -[DAAccountLoader setClassNamesForDirectlyNestedAccountTypes:](v2, "setClassNamesForDirectlyNestedAccountTypes:", v6);

    v7 = (void *)objc_opt_new();
    -[DAAccountLoader setClassNamesForTopLevelAccountTypes:](v2, "setClassNamesForTopLevelAccountTypes:", v7);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)privateFrameworksPath;
    v10 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("AccountInfo.plist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithContentsOfFile:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DAAccountInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    v16 = os_log_type_enabled(v14, v15);
    v44 = v9;
    if (v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B51E4000, v14, v15, "Using pre-cached account infos", buf, 2u);
      }

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      obj = v13;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v56 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DAFrameworkName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              -[DAAccountLoader _addAccountInfo:forFrameworkNamed:](v2, "_addAccountInfo:forFrameworkNamed:", v21, v22);

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v18);
        v9 = v44;
      }
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B51E4000, v14, v15, "Going to the disk for our account info providers", buf, 2u);
      }

      objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v9, 0);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v23)
      {
        v41 = 0;
        v42 = v12;
        v43 = v8;
        v24 = *(_QWORD *)v52;
        v25 = 0x1E0CB3000uLL;
        v26 = v23;
        do
        {
          v27 = 0;
          v45 = v26;
          do
          {
            if (*(_QWORD *)v52 != v24)
              objc_enumerationMutation(obj);
            v28 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v27);
            v29 = objc_alloc(*(Class *)(v25 + 1232));
            objc_msgSend(v9, "stringByAppendingPathComponent:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v29, "initWithPath:", v30);

            if (v31)
            {
              objc_msgSend(v31, "infoDictionary");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v32)
              {
                v34 = v24;
                objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("DAAccountInfo"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = 0u;
                v48 = 0u;
                v49 = 0u;
                v50 = 0u;
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
                if (v36)
                {
                  v37 = v36;
                  v38 = *(_QWORD *)v48;
                  do
                  {
                    for (j = 0; j != v37; ++j)
                    {
                      if (*(_QWORD *)v48 != v38)
                        objc_enumerationMutation(v35);
                      -[DAAccountLoader _addAccountInfo:forFrameworkNamed:](v2, "_addAccountInfo:forFrameworkNamed:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j), v28, v41, v42, v43);
                    }
                    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
                  }
                  while (v37);
                }

                v9 = v44;
                v26 = v45;
                v24 = v34;
                v25 = 0x1E0CB3000;
              }

            }
            ++v27;
          }
          while (v27 != v26);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        }
        while (v26);
        v12 = v42;
        v8 = v43;
        v13 = v41;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DAAccountLoader.m"), 168, CFSTR("Could not find the frameworks directory for bundle %@"), v7);

  }
}

- (BOOL)_loadFrameworkAtSubpath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DAAccountLoader *v7;
  char v8;

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
  v8 = objc_msgSend(v6, "load");
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
    v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1B51E4000, v8, v9, "We don't know of any bundles for account type \"%@\", (uint8_t *)&v11, 0xCu);

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

- (id)_classNamesDictionaryForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *classNamesForDirectlyNestedAccountTypes;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "calTopLevelAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_classNamesForTopLevelAccountTypes, "objectForKeyedSubscript:", v8);
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v4, "accountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_5:
    classNamesForDirectlyNestedAccountTypes = self->_classNamesForDirectlyNestedAccountTypes;
    objc_msgSend(v4, "parentAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accountType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](classNamesForDirectlyNestedAccountTypes, "objectForKeyedSubscript:", v16);
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "accountType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {

        v9 = v17;
        goto LABEL_10;
      }
    }

LABEL_9:
    v9 = self->_defaultClassNamesForAccountTypes;
    goto LABEL_10;
  }

LABEL_10:
  return v9;
}

- (Class)clientAccountClassForACAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  Class v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  void *v19;
  objc_class *v20;
  int v22;
  NSString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

  -[DAAccountLoader _classNamesDictionaryForAccount:](self, "_classNamesDictionaryForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientAccountClassName");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v4, "accountType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountClassName");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v14 = NSClassFromString(v10);
  if (!v14)
  {
    objc_msgSend(v4, "parentAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    v18 = os_log_type_enabled(v16, v17);
    if (v15)
    {
      if (v18)
      {
        objc_msgSend(v4, "parentAccount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v10;
        v24 = 2112;
        v25 = v4;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1B51E4000, v16, v17, "Could not come up with a client account class (name %@) for account %@ parent account %@", (uint8_t *)&v22, 0x20u);

      }
    }
    else if (v18)
    {
      v22 = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_1B51E4000, v16, v17, "Could not come up with a client account class (name %@) for account %@", (uint8_t *)&v22, 0x16u);
    }

  }
  v20 = v14;

  return v20;
}

- (Class)daemonAccountClassForACAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Class v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  void *v20;
  objc_class *v21;
  int v23;
  NSString *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadFrameworkForACAccountType:](self, "loadFrameworkForACAccountType:", v5);

  -[DAAccountLoader _classNamesDictionaryForAccount:](self, "_classNamesDictionaryForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daemonAccountClassName");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v4, "accountType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountClassName");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_4;
  }
  objc_msgSend(v4, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadDaemonBundleForACAccountType:](self, "loadDaemonBundleForACAccountType:", v14);

  v15 = NSClassFromString(v10);
  if (!v15)
  {
LABEL_4:
    objc_msgSend(v4, "parentAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    v19 = os_log_type_enabled(v17, v18);
    if (v16)
    {
      if (v19)
      {
        objc_msgSend(v4, "parentAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v10;
        v25 = 2112;
        v26 = v4;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1B51E4000, v17, v18, "Could not come up with a daemon account class (name %@) for account %@ parent account %@", (uint8_t *)&v23, 0x20u);

      }
    }
    else if (v19)
    {
      v23 = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1B51E4000, v17, v18, "Could not come up with a daemon account class (name %@) for account %@", (uint8_t *)&v23, 0x16u);
    }

    v15 = 0;
  }
  v21 = v15;

  return v21;
}

- (Class)agentClassForACAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  Class v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;

  v5 = a3;
  objc_msgSend(v5, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountLoader loadDaemonBundleForACAccountType:](self, "loadDaemonBundleForACAccountType:", v6);

  -[DAAccountLoader _classNamesDictionaryForAccount:](self, "_classNamesDictionaryForAccount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "agentClassName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  v12 = NSClassFromString(v11);
  if (!v12)
  {
    objc_msgSend(v5, "parentAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v5, "parentAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccountLoader.m"), 273, CFSTR("Could not come up with an agent class (name %@) for account %@ parent account %@"), v11, v5, v16);

    }
    else
    {
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAccountLoader.m"), 275, CFSTR("Could not come up with an agent class (name %@) for account %@"), v11, v5);
    }

  }
  v17 = v12;

  return v17;
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

- (NSMutableDictionary)defaultClassNamesForAccountTypes
{
  return self->_defaultClassNamesForAccountTypes;
}

- (void)setDefaultClassNamesForAccountTypes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultClassNamesForAccountTypes, a3);
}

- (NSMutableDictionary)classNamesForDirectlyNestedAccountTypes
{
  return self->_classNamesForDirectlyNestedAccountTypes;
}

- (void)setClassNamesForDirectlyNestedAccountTypes:(id)a3
{
  objc_storeStrong((id *)&self->_classNamesForDirectlyNestedAccountTypes, a3);
}

- (NSMutableDictionary)classNamesForTopLevelAccountTypes
{
  return self->_classNamesForTopLevelAccountTypes;
}

- (void)setClassNamesForTopLevelAccountTypes:(id)a3
{
  objc_storeStrong((id *)&self->_classNamesForTopLevelAccountTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNamesForTopLevelAccountTypes, 0);
  objc_storeStrong((id *)&self->_classNamesForDirectlyNestedAccountTypes, 0);
  objc_storeStrong((id *)&self->_defaultClassNamesForAccountTypes, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountDaemonBundleSubpath, 0);
  objc_storeStrong((id *)&self->_acAccountTypeToAccountFrameworkSubpath, 0);
}

@end
