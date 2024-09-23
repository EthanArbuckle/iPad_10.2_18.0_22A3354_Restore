@implementation MBAppManager

+ (id)appManager
{
  return -[MBAppManager initWithSettingsContext:]([MBAppManager alloc], "initWithSettingsContext:", 0);
}

+ (id)appManagerWithSettingsContext:(id)a3
{
  id v3;
  MBAppManager *v4;

  v3 = a3;
  v4 = -[MBAppManager initWithSettingsContext:]([MBAppManager alloc], "initWithSettingsContext:", v3);

  return v4;
}

- (MBAppManager)initWithSettingsContext:(id)a3
{
  id v5;
  MBAppManager *v6;
  MBAppManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBAppManager;
  v6 = -[MBAppManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settingsContext, a3);

  return v7;
}

- (id)_subdomainNamesForAppDomainNames:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  MBAppManager *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  id obja;
  void *v53;
  uint64_t v54;
  id v55;
  void *context;
  void *contexta;
  __int128 v58;
  __int128 v59;
  __int128 v60;
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
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v46 = self;
  -[MBAppManager allApps](self, "allApps");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  v55 = v4;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v71;
    v47 = *(_QWORD *)v71;
    do
    {
      v9 = 0;
      v49 = v7;
      do
      {
        if (*(_QWORD *)v71 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)MEMORY[0x1D8270CF0]();
        objc_msgSend(v10, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "containsObject:", v13);

        if (v14)
        {
          v53 = v11;
          context = v9;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(v10, "containers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v67;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v67 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
                objc_msgSend(v20, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v21, "isEqualToString:", v22);

                if ((v23 & 1) == 0)
                {
                  objc_msgSend(v20, "domain");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "name");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v25);

                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
            }
            while (v17);
          }

          v4 = v55;
          v9 = context;
          v8 = v47;
          v7 = v49;
          v11 = v53;
        }
        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v9 != (void *)v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v7);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[MBAppManager allApps](v46, "allApps");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v63;
    v48 = *(_QWORD *)v63;
    do
    {
      v29 = 0;
      v50 = v27;
      do
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(obja);
        v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v29);
        contexta = (void *)MEMORY[0x1D8270CF0]();
        objc_msgSend(v30, "domain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v4, "containsObject:", v32);

        if ((v33 & 1) == 0)
        {
          v54 = v29;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(v30, "containers");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v59 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                objc_msgSend(v39, "identifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "identifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v40, "isEqualToString:", v41);

                if ((v42 & 1) == 0)
                {
                  objc_msgSend(v39, "domain");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "name");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "removeObject:", v44);

                }
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
            }
            while (v36);
          }

          v29 = v54;
          v4 = v55;
          v28 = v48;
          v27 = v50;
        }
        objc_autoreleasePoolPop(contexta);
        ++v29;
      }
      while (v29 != v27);
      v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v27);
  }

  return v5;
}

+ (id)_allPersistedDisabledDomainNamesForPersona:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  MBDisabledDomainsQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_msgSend(v3, "copyPreferencesValueForKey:class:", CFSTR("DisabledDomains"), objc_opt_class());
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;

  return v7;
}

+ (void)_persistDisabledDomainNames:(id)a3 forPersona:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  MBDisabledDomainsQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v9)
    +[MBAppManager _persistDisabledDomainNames:forPersona:].cold.1();
  objc_msgSend(v9, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPreferencesValue:forKey:", v8, CFSTR("DisabledDomains"));
}

- (void)removeAllDisabledDomainNamesForPersona:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  MBDisabledDomainsQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MBAppManager_removeAllDisabledDomainNamesForPersona___block_invoke;
  block[3] = &unk_1E995CE70;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

uint64_t __55__MBAppManager_removeAllDisabledDomainNamesForPersona___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferencesValue:forKey:", 0, CFSTR("DisabledDomains"));
}

- (id)_allDisabledDomainNamesForPersona:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  MBDisabledDomainsQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend((id)objc_opt_class(), "_allPersistedDisabledDomainNamesForPersona:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBAppManager _subdomainNamesForAppDomainNames:](self, "_subdomainNamesForAppDomainNames:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  return v6;
}

- (id)allDisabledDomainNames
{
  return -[MBAppManager allDisabledDomainNamesForPersona:](self, "allDisabledDomainNamesForPersona:", 0);
}

- (id)allDisabledDomainNamesForPersona:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  MBDisabledDomainsQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MBAppManager_allDisabledDomainNamesForPersona___block_invoke;
  block[3] = &unk_1E995CE98;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__MBAppManager_allDisabledDomainNamesForPersona___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_allDisabledDomainNamesForPersona:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_syncDisabledDomainsWithAllInstalledAppDomains:(id)a3 persona:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  MBDisabledDomainsQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MBAppManager__syncDisabledDomainsWithAllInstalledAppDomains_persona___block_invoke;
  block[3] = &unk_1E995CEC0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __71__MBAppManager__syncDisabledDomainsWithAllInstalledAppDomains_persona___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_allPersistedDisabledDomainNamesForPersona:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (!v5)
  {

    goto LABEL_20;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
      if ((objc_msgSend(*(id *)(a1 + 32), "_isContainerizedAppDomain:", v10) & 1) == 0)
      {
        MBGetDefaultLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v10;
          _os_log_impl(&dword_1D5213000, v18, OS_LOG_TYPE_INFO, "%@ is not a containerized app domain - not removing from the disabled domains list", buf, 0xCu);
          _MBLog(CFSTR("INFO"), (uint64_t)"%@ is not a containerized app domain - not removing from the disabled domains list", v19, v20, v21, v22, v23, v24, v10);
        }

LABEL_14:
        objc_msgSend(v3, "addObject:", v10);
        continue;
      }
      if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10) & 1) != 0)
        goto LABEL_14;
      MBGetDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_INFO, "Removing %@ from disabled domains list - related app is no longer installed on the device", buf, 0xCu);
        _MBLog(CFSTR("INFO"), (uint64_t)"Removing %@ from disabled domains list - related app is no longer installed on the device", v12, v13, v14, v15, v16, v17, v10);
      }

      v7 = 1;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  }
  while (v6);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reconcileBooksAndHealthInDisabledDomainsList:", v3);
    objc_msgSend((id)objc_opt_class(), "_persistDisabledDomainNames:forPersona:", v3, *(_QWORD *)(a1 + 40));
  }
LABEL_20:

}

- (void)_reconcileBooksAndHealthInDisabledDomainsList:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", CFSTR("AppDomain-com.apple.iBooks")) & 1) == 0)
    objc_msgSend(v3, "removeObject:", CFSTR("BooksDomain"));
  if ((objc_msgSend(v3, "containsObject:", CFSTR("AppDomain-com.apple.Health")) & 1) == 0)
    objc_msgSend(v3, "removeObject:", CFSTR("HealthDomain"));
  if ((objc_msgSend(v3, "containsObject:", CFSTR("HealthDomain")) & 1) == 0)
    objc_msgSend(v3, "removeObject:", CFSTR("AppDomain-com.apple.Health"));

}

- (BOOL)_isContainerizedAppDomain:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[MBDomain isAppName:](MBDomain, "isAppName:", v3)
    || +[MBDomain isAppPluginName:](MBDomain, "isAppPluginName:", v3)
    || +[MBDomain isAppGroupName:](MBDomain, "isAppGroupName:", v3);

  return v4;
}

- (BOOL)isDomainNameEnabled:(id)a3 forPersona:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MBAppManager allDisabledDomainNamesForPersona:](self, "allDisabledDomainNamesForPersona:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsObject:", v6);

  return self ^ 1;
}

- (void)setEnabled:(BOOL)a3 forDomainName:(id)a4 persona:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  MBDisabledDomainsQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MBAppManager_setEnabled_forDomainName_persona___block_invoke;
  block[3] = &unk_1E995CEE8;
  block[4] = self;
  v14 = v9;
  v16 = a3;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

}

void __49__MBAppManager_setEnabled_forDomainName_persona___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_allDisabledDomainNamesForPersona:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = v2;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v2, "removeObject:", v3);
  else
    objc_msgSend(v2, "addObject:", v3);
  objc_msgSend((id)objc_opt_class(), "_persistDisabledDomainNames:forPersona:", v4, *(_QWORD *)(a1 + 40));

}

- (id)allRestrictedDomainNamesForPersona:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)objc_msgSend(v3, "copyPreferencesValueForKey:class:", CFSTR("RestrictedDomains"), objc_opt_class());
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doNotBackupAppIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        +[MBDomain nameWithAppID:](MBDomain, "nameWithAppID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        +[MBDomain placeholderNameWithAppID:](MBDomain, "placeholderNameWithAppID:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[MBAppManager _subdomainNamesForAppDomainNames:](self, "_subdomainNamesForAppDomainNames:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v16);

  return v6;
}

- (id)allRestrictedDomainNames
{
  return -[MBAppManager allRestrictedDomainNamesForPersona:](self, "allRestrictedDomainNamesForPersona:", 0);
}

- (BOOL)loadAppsWithPersona:(id)a3 safeHarbors:(BOOL)a4 error:(id *)a5
{
  return -[MBAppManager loadAppsWithPersona:safeHarbors:dataSeparatedBundleIDs:error:](self, "loadAppsWithPersona:safeHarbors:dataSeparatedBundleIDs:error:", a3, a4, 0, a5);
}

- (BOOL)loadAppsWithPersona:(id)a3 safeHarbors:(BOOL)a4 dataSeparatedBundleIDs:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *containersByID;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  BOOL v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSMutableDictionary *v78;
  NSMutableDictionary *systemDataContainersByID;
  NSMutableDictionary *v80;
  NSMutableDictionary *systemSharedContainersByID;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t m;
  void *v86;
  NSMutableDictionary *v87;
  void *v88;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  BOOL v95;
  void *v96;
  id v98;
  id v99;
  id v100;
  id v101;
  int v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  id obj;
  id obja;
  uint64_t v109;
  uint64_t v110;
  void *context;
  void *contexta;
  void *i;
  uint64_t v114;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  id v139;
  _BYTE v140[128];
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v7 = a4;
  v151 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v101 = a5;
  v106 = v8;
  objc_msgSend(v8, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isPrimaryUser"))
    v102 = objc_msgSend(v8, "isPersonalPersona");
  else
    v102 = 0;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPersona");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userPersonaUniqueString");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  MBGetDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v144 = v106;
    v145 = 2112;
    v146 = v96;
    _os_log_impl(&dword_1D5213000, v12, OS_LOG_TYPE_DEFAULT, "Enumerating apps for persona %@ with current persona %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Enumerating apps for persona %@ with current persona %@", v13, v14, v15, v16, v17, v18, (uint64_t)v106);
  }

  v94 = (void *)MEMORY[0x1D8270CF0]();
  objc_msgSend(v106, "volumesToBackUp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v139 = 0;
  v98 = -[MBAppManager _copyUserAppsForPersona:dataSeparatedBundleIDs:volumeMountPoints:error:](self, "_copyUserAppsForPersona:dataSeparatedBundleIDs:volumeMountPoints:error:", v106, v101, v105, &v139);
  v21 = v139;
  v22 = v21;
  if (!v98)
  {
    v99 = v21;
    v95 = 0;
    goto LABEL_70;
  }
  objc_msgSend(v104, "addObjectsFromArray:");
  if ((v102 & v7) == 1)
  {
    v138 = v22;
    v23 = v22;
    v24 = -[MBAppManager _copySafeHarborsWithVolumeMountPoints:error:](self, "_copySafeHarborsWithVolumeMountPoints:error:", v105, &v138);
    v25 = v138;

    if (!v24)
    {
      v95 = 0;
      v99 = v25;
      goto LABEL_70;
    }
    objc_msgSend(v104, "addObjectsFromArray:", v24);

    v22 = v25;
  }
  v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v99 = v22;
  containersByID = self->_containersByID;
  self->_containersByID = v26;

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = v104;
  context = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v150, 16);
  if (context)
  {
    v109 = *(_QWORD *)v135;
    do
    {
      for (i = 0; i != context; i = (char *)i + 1)
      {
        if (*(_QWORD *)v135 != v109)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)i);
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        objc_msgSend(v28, "containers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v131;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v131 != v31)
                objc_enumerationMutation(v29);
              v33 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
              v34 = (void *)MEMORY[0x1D8270CF0]();
              v35 = objc_msgSend(v33, "containerType");
              objc_msgSend(v33, "identifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "containerDir");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              MBStringForContainerType(v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              MBGetDefaultLog();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v144 = v36;
                v145 = 2112;
                v146 = v38;
                v147 = 2112;
                v148 = v37;
                _os_log_impl(&dword_1D5213000, v39, OS_LOG_TYPE_INFO, "App: Found container %@ (%@) at %@", buf, 0x20u);
                _MBLog(CFSTR("INFO"), (uint64_t)"App: Found container %@ (%@) at %@", v40, v41, v42, v43, v44, v45, (uint64_t)v36);
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containersByID, "setObject:forKeyedSubscript:", v33, v36);
              objc_autoreleasePoolPop(v34);
            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
          }
          while (v30);
        }

      }
      context = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v150, 16);
    }
    while (context);
  }

  if (v102)
  {
    v129 = v99;
    v93 = -[MBAppManager _copySystemContainersWithVolumeMountPoints:error:](self, "_copySystemContainersWithVolumeMountPoints:error:", v105, &v129);
    v46 = v129;

    if (v93)
    {
      v128 = v46;
      v92 = -[MBAppManager _copySystemPluginsForPersona:volumeMountPoints:error:](self, "_copySystemPluginsForPersona:volumeMountPoints:error:", v106, v105, &v128);
      v100 = v128;

      v47 = v92;
      v95 = v92 != 0;
      if (v92)
      {
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v103 = v92;
        v48 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v124, v142, 16);
        if (v48)
        {
          obja = *(id *)v125;
          do
          {
            v49 = 0;
            v110 = v48;
            do
            {
              if (*(id *)v125 != obja)
                objc_enumerationMutation(v103);
              v114 = v49;
              v50 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v49);
              contexta = (void *)MEMORY[0x1D8270CF0]();
              objc_msgSend(v50, "identifier");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              MBGetDefaultLog();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                v53 = v52;
                if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v50, "containerDir");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v144 = v51;
                  v145 = 2112;
                  v146 = v54;
                  _os_log_impl(&dword_1D5213000, v53, OS_LOG_TYPE_INFO, "System Plugin: Found container %@ %@", buf, 0x16u);

                }
                objc_msgSend(v50, "containerDir");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                _MBLog(CFSTR("INFO"), (uint64_t)"System Plugin: Found container %@ %@", v55, v56, v57, v58, v59, v60, (uint64_t)v51);

              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containersByID, "setObject:forKeyedSubscript:", v50, v51);
              v122 = 0u;
              v123 = 0u;
              v120 = 0u;
              v121 = 0u;
              objc_msgSend(v50, "allAppGroupContainers");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v120, v141, 16);
              if (v62)
              {
                v63 = *(_QWORD *)v121;
                do
                {
                  for (k = 0; k != v62; ++k)
                  {
                    if (*(_QWORD *)v121 != v63)
                      objc_enumerationMutation(v61);
                    v65 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
                    objc_msgSend(v65, "identifier");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKeyedSubscript:](self->_containersByID, "objectForKeyedSubscript:", v66);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = v67 == 0;

                    if (v68)
                    {
                      MBGetDefaultLog();
                      v69 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        v70 = v69;
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(v65, "containerDir");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412802;
                          v144 = v66;
                          v145 = 2112;
                          v146 = v71;
                          v147 = 2112;
                          v148 = v51;
                          _os_log_impl(&dword_1D5213000, v70, OS_LOG_TYPE_INFO, "System Plugin: Found app group container %@ at %@ for %@", buf, 0x20u);

                        }
                        objc_msgSend(v65, "containerDir");
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        _MBLog(CFSTR("INFO"), (uint64_t)"System Plugin: Found app group container %@ at %@ for %@", v72, v73, v74, v75, v76, v77, (uint64_t)v66);

                      }
                      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containersByID, "setObject:forKeyedSubscript:", v65, v66);
                    }

                  }
                  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v120, v141, 16);
                }
                while (v62);
              }

              objc_autoreleasePoolPop(contexta);
              v49 = v114 + 1;
            }
            while (v114 + 1 != v110);
            v48 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v124, v142, 16);
          }
          while (v48);
        }

        v78 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        systemDataContainersByID = self->_systemDataContainersByID;
        self->_systemDataContainersByID = v78;

        v80 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        systemSharedContainersByID = self->_systemSharedContainersByID;
        self->_systemSharedContainersByID = v80;

        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v82 = v93;
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v116, v140, 16);
        if (v83)
        {
          v84 = *(_QWORD *)v117;
          do
          {
            for (m = 0; m != v83; ++m)
            {
              if (*(_QWORD *)v117 != v84)
                objc_enumerationMutation(v82);
              v86 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * m);
              if (objc_msgSend(v86, "isSystemSharedContainer"))
                v87 = self->_systemSharedContainersByID;
              else
                v87 = self->_systemDataContainersByID;
              objc_msgSend(v86, "identifier");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v87, "setObject:forKeyedSubscript:", v86, v88);

            }
            v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v116, v140, 16);
          }
          while (v83);
        }

        v47 = v92;
      }

      v46 = v100;
    }
    else
    {
      v95 = 0;
    }

    v99 = v46;
  }
  else
  {
    v95 = 1;
  }
LABEL_70:

  objc_autoreleasePoolPop(v94);
  if (a6)
    *a6 = objc_retainAutorelease(v99);

  return v95;
}

uint64_t __77__MBAppManager_loadAppsWithPersona_safeHarbors_dataSeparatedBundleIDs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 == objc_msgSend(v5, "length"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "length");
    if (v8 < objc_msgSend(v5, "length"))
      v7 = 1;
    else
      v7 = -1;
  }

  return v7;
}

- (id)_copyUserAppsForPersona:(id)a3 dataSeparatedBundleIDs:(id)a4 volumeMountPoints:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  MBGetDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v13, OS_LOG_TYPE_INFO, "Looking up user apps", buf, 2u);
    _MBLog(CFSTR("INFO"), (uint64_t)"Looking up user apps", v14, v15, v16, v17, v18, v19, (uint64_t)v27);
  }

  v20 = (void *)MEMORY[0x1D8270CF0]();
  -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v21, "userAppsForPersona:dataSeparatedBundleIDs:error:", v10, v11, &v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v28;
  objc_msgSend(v22, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {

    v27 = 0;
    v25 = -[MBAppManager _copyAppsWithPlists:volumeMountPoints:safeHarbor:error:](self, "_copyAppsWithPlists:volumeMountPoints:safeHarbor:error:", v24, v12, 0, &v27);
    v23 = v27;
  }
  else
  {
    v25 = 0;
  }

  objc_autoreleasePoolPop(v20);
  if (a6)
    *a6 = objc_retainAutorelease(v23);

  return v25;
}

- (id)_copySystemPluginsForPersona:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  MBGetDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_INFO, "Looking up system plugins", buf, 2u);
    _MBLog(CFSTR("INFO"), (uint64_t)"Looking up system plugins", v11, v12, v13, v14, v15, v16, (uint64_t)v24);
  }

  v17 = (void *)MEMORY[0x1D8270CF0]();
  -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v18, "systemPluginsForPersona:error:", v8, &v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v25;
  objc_msgSend(v19, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {

    v24 = 0;
    v22 = -[MBAppManager _copySystemPluginsWithPlists:volumeMountPoints:error:](self, "_copySystemPluginsWithPlists:volumeMountPoints:error:", v21, v9, &v24);
    v20 = v24;
  }
  else
  {
    v22 = 0;
  }

  objc_autoreleasePoolPop(v17);
  if (a5)
    *a5 = objc_retainAutorelease(v20);

  return v22;
}

- (id)_copySafeHarborsWithVolumeMountPoints:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v21;
  id v22;
  uint8_t buf[16];

  v6 = a3;
  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_INFO, "Copying safe harbors", buf, 2u);
    _MBLog(CFSTR("INFO"), (uint64_t)"Copying safe harbors", v8, v9, v10, v11, v12, v13, (uint64_t)v21);
  }

  v14 = (void *)MEMORY[0x1D8270CF0]();
  -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v15, "safeHarborsWithError:", &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;
  objc_msgSend(v16, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {

    v21 = 0;
    v19 = -[MBAppManager _copyAppsWithPlists:volumeMountPoints:safeHarbor:error:](self, "_copyAppsWithPlists:volumeMountPoints:safeHarbor:error:", v18, v6, 1, &v21);
    v17 = v21;
  }
  else
  {
    v19 = 0;
  }

  objc_autoreleasePoolPop(v14);
  if (a4)
    *a4 = objc_retainAutorelease(v17);

  return v19;
}

- (id)_copyAppsWithPlists:(id)a3 volumeMountPoints:(id)a4 safeHarbor:(BOOL)a5 error:(id *)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  MBApp *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  void *v50;
  id obj;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  _BYTE v61[14];
  __int16 v62;
  NSObject *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v53 = a4;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    v49 = *MEMORY[0x1E0C9AE78];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D8270CF0]();
        _volumeMountPointForPlist(v12, v53);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = -[MBContainer initWithPropertyList:volumeMountPoint:]([MBApp alloc], "initWithPropertyList:volumeMountPoint:", v12, v14);
          if (!v15)
            -[MBAppManager _copyAppsWithPlists:volumeMountPoints:safeHarbor:error:].cold.1();
          v16 = v15;
          -[MBApp bundleID](v15, "bundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleDir");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (a5)
          {
LABEL_11:
            objc_msgSend(v16, "containerDir");
            v20 = objc_claimAutoreleasedReturnValue();
            MBGetDefaultLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v22 = objc_msgSend(v16, "isPlaceholder");
              *(_DWORD *)buf = 138413058;
              v59 = v17;
              v60 = 1024;
              *(_DWORD *)v61 = v22;
              *(_WORD *)&v61[4] = 2112;
              *(_QWORD *)&v61[6] = v19;
              v62 = 2112;
              v63 = v20;
              _os_log_impl(&dword_1D5213000, v21, OS_LOG_TYPE_DEBUG, "Found installed app, bundleID:%@, isPlaceholder:%d, bundleDir:%@, containerDir:%@", buf, 0x26u);
              objc_msgSend(v16, "isPlaceholder");
              _MBLog(CFSTR("DEBUG"), (uint64_t)"Found installed app, bundleID:%@, isPlaceholder:%d, bundleDir:%@, containerDir:%@", v23, v24, v25, v26, v27, v28, (uint64_t)v17);
            }

            objc_msgSend(v50, "addObject:", v16);
          }
          else if (v17)
          {
            if (v18)
              goto LABEL_11;
            MBGetDefaultLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v59 = v17;
              v60 = 2112;
              *(_QWORD *)v61 = v12;
              _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_ERROR, "Found nil bundleDir for %@: %@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Found nil bundleDir for %@: %@", v41, v42, v43, v44, v45, v46, (uint64_t)v17);
            }
          }
          else
          {
            MBGetDefaultLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v12;
              _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_ERROR, "Found nil bundleID: %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Found nil bundleID: %@", v35, v36, v37, v38, v39, v40, (uint64_t)v12);
            }
          }

          goto LABEL_17;
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", v49);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Container"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        MBGetDefaultLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v59 = v16;
          v60 = 2112;
          *(_QWORD *)v61 = v17;
          _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_FAULT, "Skipping app %@, because it's container path %@ is on the wrong volume", buf, 0x16u);
          _MBLog(CFSTR("FAULT"), (uint64_t)"Skipping app %@, because it's container path %@ is on the wrong volume", v29, v30, v31, v32, v33, v34, (uint64_t)v16);
        }
LABEL_17:

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      v9 = v47;
    }
    while (v47);
  }

  return v50;
}

- (id)_copySystemPluginsWithPlists:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    v43 = *MEMORY[0x1E0C9AE78];
    v13 = 0x1ED028000uLL;
    while (2)
    {
      v14 = 0;
      v42 = v11;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        _volumeMountPointForPlist(v15, v7);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = objc_msgSend(objc_alloc((Class)(v13 + 1984)), "initWithPropertyList:volumeMountPoint:", v15, v16);
          if (!v18)
          {

            v40 = 0;
            goto LABEL_17;
          }
          v19 = v18;
          MBGetDefaultLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject identifier](v19, "identifier");
            v21 = v12;
            v22 = v7;
            v23 = v8;
            v24 = v9;
            v25 = v13;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = v26;
            _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_DEBUG, "Installed system plugin: %@", buf, 0xCu);

            -[NSObject identifier](v19, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _MBLog(CFSTR("DEBUG"), (uint64_t)"Installed system plugin: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);

            v13 = v25;
            v9 = v24;
            v8 = v23;
            v7 = v22;
            v12 = v21;
            v11 = v42;
          }

          objc_msgSend(v8, "addObject:", v19);
        }
        else
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", v43);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          MBGetDefaultLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v17;
            _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_ERROR, "Skipping system plugin %@, because it's container path is on the wrong volume", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), (uint64_t)"Skipping system plugin %@, because it's container path is on the wrong volume", v34, v35, v36, v37, v38, v39, (uint64_t)v17);
          }
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v11)
        continue;
      break;
    }
  }

  v40 = v8;
LABEL_17:

  return v40;
}

- (id)_copySystemContainersWithVolumeMountPoints:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_INFO, "Looking up system containers", buf, 2u);
    _MBLog(CFSTR("INFO"), (uint64_t)"Looking up system containers", v8, v9, v10, v11, v12, v13, v40);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = (void *)MEMORY[0x1D8270CF0]();
  -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemContainersWithError:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v42 = 0;
    v19 = -[MBAppManager _copySystemContainersWithPlists:volumeMountPoints:error:](self, "_copySystemContainersWithPlists:volumeMountPoints:error:", v18, v6, &v42);
    v20 = v42;
    if (!v19)
    {
      MBGetDefaultLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v20;
        _os_log_impl(&dword_1D5213000, v25, OS_LOG_TYPE_ERROR, "Failed to copy system containers from generated plists, error:%@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to copy system containers from generated plists, error:%@", v26, v27, v28, v29, v30, v31, (uint64_t)v20);
      }
      v24 = v14;
      goto LABEL_16;
    }
    objc_msgSend(v14, "addObjectsFromArray:", v19);

    v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "systemSharedContainersWithError:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v41 = v21;
    v25 = -[MBAppManager _copySystemContainersWithPlists:volumeMountPoints:error:](self, "_copySystemContainersWithPlists:volumeMountPoints:error:", v24, v6, &v41);
    v20 = v41;

    if (v25)
    {
      objc_msgSend(v14, "addObjectsFromArray:", v25);
LABEL_17:

      v21 = v20;
      goto LABEL_18;
    }
    MBGetDefaultLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v20;
      _os_log_impl(&dword_1D5213000, v32, OS_LOG_TYPE_ERROR, "Failed to copy system shared containers from generated plists, error:%@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to copy system shared containers from generated plists, error:%@", v33, v34, v35, v36, v37, v38, (uint64_t)v20);
    }

LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
LABEL_18:

  objc_autoreleasePoolPop(v15);
  if (a4 && v21)
    *a4 = objc_retainAutorelease(v21);

  return v14;
}

- (id)_copySystemContainersWithPlists:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  MBSystemContainer *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    v43 = *MEMORY[0x1E0C9AE78];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        _volumeMountPointForPlist(v14, v7);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = -[MBContainer initWithPropertyList:volumeMountPoint:]([MBSystemContainer alloc], "initWithPropertyList:volumeMountPoint:", v14, v15);
          MBGetDefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (!v17)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v14;
              _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_ERROR, "Failed to parse system container plist: %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to parse system container plist: %@", v35, v36, v37, v38, v39, v40, (uint64_t)v14);
            }

            if (a5)
            {
              +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to parse system container plist"));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

            v34 = 0;
            goto LABEL_21;
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            -[MBContainer identifier](v17, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = v20;
            _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_DEBUG, "System container: %@", buf, 0xCu);

            -[MBContainer identifier](v17, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            _MBLog(CFSTR("DEBUG"), (uint64_t)"System container: %@", v22, v23, v24, v25, v26, v27, (uint64_t)v21);

          }
          objc_msgSend(v8, "addObject:", v17);
        }
        else
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v43);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          MBGetDefaultLog();
          v17 = (MBSystemContainer *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v16;
            _os_log_impl(&dword_1D5213000, &v17->super.super, OS_LOG_TYPE_ERROR, "Skipping system container %@, because it's path is on the wrong volume", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), (uint64_t)"Skipping system container %@, because it's path is on the wrong volume", v28, v29, v30, v31, v32, v33, (uint64_t)v16);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v11)
        continue;
      break;
    }
  }

  v34 = v8;
LABEL_21:

  return v34;
}

- (id)allContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary allValues](self->_containersByID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSMutableDictionary allValues](self->_systemDataContainersByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  -[NSMutableDictionary allValues](self->_systemSharedContainersByID, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  return v4;
}

- (id)allApps
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableDictionary allValues](self->_containersByID, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_57);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __23__MBAppManager_allApps__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)allPlugins
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableDictionary allValues](self->_containersByID, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __26__MBAppManager_allPlugins__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)allSystemContainers
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary allValues](self->_systemDataContainersByID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSMutableDictionary allValues](self->_systemSharedContainersByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (id)containerWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_containersByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_systemDataContainersByID, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_systemSharedContainersByID, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)systemDataContainerWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemDataContainersByID, "objectForKeyedSubscript:", a3);
}

- (id)systemSharedContainerWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemSharedContainersByID, "objectForKeyedSubscript:", a3);
}

- (id)appWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_containersByID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)removeOldSafeHarbors
{
  void *v3;
  double v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  NSMutableDictionary *containersByID;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v54;
  MBAppManager *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  NSObject *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[MBSettingsContext safeHarborExpiration](self->_settingsContext, "safeHarborExpiration");
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:", -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MBGetDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v5;
    _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "Removing safe harbors created before %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removing safe harbors created before %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v55 = self;
  -[MBAppManager allContainers](self, "allContainers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v57;
    v54 = v13;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v57 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (objc_msgSend(v18, "isSafeHarbor"))
        {
          objc_msgSend(v18, "datePlacedInSafeHarbor");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v55, CFSTR("MBAppManager.m"), 545, CFSTR("Date missing from safe harbor: %@"), v52);

          }
          if (-[NSObject compare:](v19, "compare:", v5) == -1)
          {
            MBGetDefaultLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v18, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v61 = v31;
              v62 = 2112;
              v63 = v19;
              _os_log_impl(&dword_1D5213000, v30, OS_LOG_TYPE_DEFAULT, "Removing safe harbor %@ created at %@", buf, 0x16u);

              objc_msgSend(v18, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removing safe harbor %@ created at %@", v33, v34, v35, v36, v37, v38, (uint64_t)v32);

            }
            -[MBSettingsContext mobileInstallation](v55->_settingsContext, "mobileInstallation");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v39, "removeSafeHarborWithIdentifier:type:error:", v40, objc_msgSend(v18, "containerType"), 0);

            if (v41)
            {
              containersByID = v55->_containersByID;
              objc_msgSend(v18, "identifier");
              v20 = objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](containersByID, "removeObjectForKey:", v20);
            }
            else
            {
              MBGetDefaultLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v61 = v43;
                _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_DEFAULT, "Error removing safe harbor: %@", buf, 0xCu);

                objc_msgSend(v18, "identifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                _MBLog(CFSTR("DEFAULT"), (uint64_t)"Error removing safe harbor: %@", v45, v46, v47, v48, v49, v50, (uint64_t)v44);

              }
            }
            v13 = v54;
          }
          else
          {
            objc_msgSend(v18, "datePlacedInSafeHarbor");
            v20 = objc_claimAutoreleasedReturnValue();
            MBGetDefaultLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v18, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v61 = v22;
              v62 = 2112;
              v63 = v20;
              _os_log_impl(&dword_1D5213000, v21, OS_LOG_TYPE_DEFAULT, "Not removing safe harbor %@ created at %@", buf, 0x16u);

              objc_msgSend(v18, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              _MBLog(CFSTR("DEFAULT"), (uint64_t)"Not removing safe harbor %@ created at %@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);

            }
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v15);
  }

}

- (void)removeStaleStateForUninstalledAppsForPersona:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  MBAppManager *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1D8270CF0]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v4;
  objc_msgSend(v4, "appPlaceholderArchiveDirectory");
  v68 = 0;
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v54 = v5;
  v52 = (void *)v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v58;
      v73 = 2112;
      v74 = v7;
      _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch the contents of %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch the contents of %@: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v58);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v53 = self;
  -[MBAppManager allApps](self, "allApps");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v65 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v22, "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v57, "addObject:", v24);
        if ((objc_msgSend(v22, "isSystemApp") & 1) == 0)
        {
          objc_msgSend(v22, "bundleID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringByAppendingPathExtension:", CFSTR("zip"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObject:", v26);

          objc_msgSend(v22, "bundleID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAppendingPathExtension:", CFSTR("ipa"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObject:", v28);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v19);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v29 = v16;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v61;
    v33 = v54;
    do
    {
      v34 = 0;
      v35 = v7;
      do
      {
        if (*(_QWORD *)v61 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(v58, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v34));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        MBGetDefaultLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v36;
          _os_log_impl(&dword_1D5213000, v37, OS_LOG_TYPE_DEFAULT, "Removing old placeholder archive at %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removing old placeholder archive at %@", v38, v39, v40, v41, v42, v43, (uint64_t)v36);
        }

        v59 = v35;
        v44 = objc_msgSend(v54, "removeItemAtPath:error:", v36, &v59);
        v7 = v59;

        if ((v44 & 1) == 0)
        {
          MBGetDefaultLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v72 = v36;
            v73 = 2112;
            v74 = v7;
            _os_log_impl(&dword_1D5213000, v45, OS_LOG_TYPE_ERROR, "Failed to remove the placeholder archive at %@: %@", buf, 0x16u);
            _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to remove the placeholder archive at %@: %@", v46, v47, v48, v49, v50, v51, (uint64_t)v36);
          }

        }
        ++v34;
        v35 = v7;
      }
      while (v31 != v34);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v31);
  }
  else
  {
    v33 = v54;
  }

  -[MBAppManager _syncDisabledDomainsWithAllInstalledAppDomains:persona:](v53, "_syncDisabledDomainsWithAllInstalledAppDomains:persona:", v57, v56);
  objc_autoreleasePoolPop(context);

}

- (id)createSafeHarborForContainer:(id)a3 withPersona:(id)a4 usingIntermediateRestoreDir:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char v46;
  id v47;
  uid_t v48;
  gid_t v49;
  id v50;
  id v51;
  NSMutableDictionary *containersByID;
  void *v54;
  char *v55;
  id v56;
  _QWORD block[4];
  id v59;
  MBAppManager *v60;
  id v61;
  id v62;
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  BOOL v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint8_t buf[4];
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error__once != -1)
    dispatch_once(&createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error__once, &__block_literal_global_77);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MBMobileFileAttributes();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy_;
  v89 = __Block_byref_object_dispose_;
  v90 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy_;
  v83 = __Block_byref_object_dispose_;
  v84 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy_;
  v73 = __Block_byref_object_dispose_;
  v74 = 0;
  v13 = createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MBAppManager_createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error___block_invoke_2;
  block[3] = &unk_1E995CFB0;
  v14 = v10;
  v59 = v14;
  v60 = self;
  v68 = a5;
  v64 = &v85;
  v65 = &v79;
  v15 = v9;
  v61 = v15;
  v66 = &v75;
  v16 = v11;
  v62 = v16;
  v17 = v12;
  v63 = v17;
  v67 = &v69;
  dispatch_sync(v13, block);
  if (*((_BYTE *)v76 + 24))
  {
    objc_msgSend((id)v80[5], "stringByAppendingPathComponent:", CFSTR("Container"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v80[5], "stringByAppendingPathComponent:", CFSTR("Info"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "volumeMountPoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v15, "copyWithVolumeMountPoint:", v20);

    objc_msgSend((id)v86[5], "stringByAppendingPathComponent:", CFSTR("Container"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContainerDir:", v22);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDatePlacedInSafeHarbor:", v23);

    MBGetDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v92 = v18;
      _os_log_impl(&dword_1D5213000, v24, OS_LOG_TYPE_DEBUG, "Creating directory %@", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), (uint64_t)"Creating directory %@", v25, v26, v27, v28, v29, v30, (uint64_t)v18);
    }

    if (objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, v17, a6))
    {
      MBGetDefaultLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v92 = v19;
        _os_log_impl(&dword_1D5213000, v31, OS_LOG_TYPE_DEBUG, "Creating directory %@", buf, 0xCu);
        _MBLog(CFSTR("DEBUG"), (uint64_t)"Creating directory %@", v32, v33, v34, v35, v36, v37, (uint64_t)v19);
      }

      if (objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, v17, a6))
      {
        MBGetDefaultLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v56;
          _os_log_impl(&dword_1D5213000, v38, OS_LOG_TYPE_DEBUG, "Writing %@", buf, 0xCu);
          _MBLog(CFSTR("DEBUG"), (uint64_t)"Writing %@", v39, v40, v41, v42, v43, v44, (uint64_t)v56);
        }

        objc_msgSend(v21, "propertyListForSafeHarborInfo");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "writeToFile:atomically:", v56, 1);

        if ((v46 & 1) != 0)
        {
          v47 = objc_retainAutorelease(v56);
          v55 = (char *)objc_msgSend(v47, "fileSystemRepresentation");
          v48 = MBMobileUID();
          v49 = MBMobileUID();
          if (!lchown(v55, v48, v49))
          {
            containersByID = self->_containersByID;
            objc_msgSend(v21, "identifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](containersByID, "setObject:forKeyedSubscript:", v21, v54);

            v51 = v21;
            goto LABEL_23;
          }
          if (a6)
          {
            +[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 100, v47, CFSTR("Error changing ownership of Safe Harbor Info.plist"));
            v50 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
            v51 = 0;
            *a6 = v50;
LABEL_23:

            goto LABEL_24;
          }
        }
        else if (a6)
        {
          +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 100, v56, CFSTR("Error writing Safe Harbor Info.plist"));
          v50 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
      }
    }
    v51 = 0;
    goto LABEL_23;
  }
  v51 = 0;
  if (a6)
    *a6 = objc_retainAutorelease((id)v70[5]);
LABEL_24:

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
  return v51;
}

void __91__MBAppManager_createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("-[MBAppManager createSafeHarbor:error:]", 0);
  v1 = (void *)createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error__queue;
  createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error__queue = (uint64_t)v0;

}

void __91__MBAppManager_createSafeHarborForContainer_withPersona_usingIntermediateRestoreDir_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void *v42;
  id obj;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userIncompleteRestoreDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "mobileInstallation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeHarborDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MBUniqueIntegerFilenameWithDirectory((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "mobileInstallation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeHarborDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "userIncompleteRestoreDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v17 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v12 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
  }

  MBGetDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "containerTypeString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v45 = v19;
    v46 = 2112;
    v47 = v20;
    v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_1D5213000, v18, OS_LOG_TYPE_INFO, "Creating safe harbor for container %@ with type %@ at %@", buf, 0x20u);

    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "containerTypeString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _MBLog(CFSTR("INFO"), (uint64_t)"Creating safe harbor for container %@ with type %@ at %@", v23, v24, v25, v26, v27, v28, (uint64_t)v22);

  }
  MBGetDefaultLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v45 = v30;
    _os_log_impl(&dword_1D5213000, v29, OS_LOG_TYPE_DEBUG, "Creating directory %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), (uint64_t)"Creating directory %@", v31, v32, v33, v34, v35, v36, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }

  v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v38 = *(void **)(a1 + 56);
  v39 = *(_QWORD *)(a1 + 64);
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  obj = *(id *)(v40 + 40);
  v41 = objc_msgSend(v38, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v37, 1, v39, &obj);
  objc_storeStrong((id *)(v40 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v41;

}

- (id)createSafeHarborForContainer:(id)a3 withPersona:(id)a4 error:(id *)a5
{
  return -[MBAppManager createSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:error:](self, "createSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:error:", a3, a4, 1, a5);
}

- (BOOL)moveAppDataToSafeHarborForContainer:(id)a3 withPersona:(id)a4 usingIntermediateRestoreDir:(BOOL)a5 withError:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSMutableDictionary *containersByID;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const std::__fs::filesystem::path *v48;
  id v49;
  const std::__fs::filesystem::path *v50;
  std::error_code *v51;
  int v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id obj;
  _BOOL4 v104;
  void *v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  id v113;
  id v114;
  uint8_t v115[128];
  uint8_t buf[4];
  id v117;
  __int16 v118;
  id v119;
  uint64_t v120;

  v7 = a5;
  v120 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v10, "isSafeHarbor") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v114 = 0;
    -[MBAppManager createSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:error:](self, "createSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:error:", v10, v11, v7, &v114);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v114;

    if (v13)
    {
      v104 = v7;
      -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v14;
      objc_msgSend(v15, "userAppWithBundleID:placeholder:persona:error:", v16, 1, v11, &v113);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v113;

      if (v17)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Container"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        if (v102)
        {
          containersByID = self->_containersByID;
          objc_msgSend(v10, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](containersByID, "objectForKeyedSubscript:", v20);
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v18;
          v100 = v21;
          objc_msgSend(v21, "contentsOfDirectoryAtPath:error:", v102, &v112);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v112;

          v24 = (void *)v22;
          if (!v22 || v23)
          {
            MBGetDefaultLog();
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v117 = v102;
              v118 = 2112;
              v119 = v23;
              _os_log_impl(&dword_1D5213000, v77, OS_LOG_TYPE_DEFAULT, "Failed to enumerate contents of path at %@: %@", buf, 0x16u);
              _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to enumerate contents of path at %@: %@", v78, v79, v80, v81, v82, v83, (uint64_t)v102);
            }

            v12 = 0;
            if (a6)
              *a6 = objc_retainAutorelease(v23);
            v53 = v100;
          }
          else
          {
            -[MBSettingsContext mobileInstallation](self->_settingsContext, "mobileInstallation");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = 1;
            objc_msgSend((id)objc_opt_class(), "defaultSubdirectoriesForMBContainerType:withNestedSubdirectories:", 1, 0);
            v107 = (void *)objc_claimAutoreleasedReturnValue();

            v110 = 0u;
            v111 = 0u;
            v108 = 0u;
            v109 = 0u;
            obj = v24;
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
            if (v26)
            {
              v27 = v26;
              v97 = v24;
              v98 = v17;
              v96 = a6;
              v101 = v11;
              v99 = v10;
              v28 = *(_QWORD *)v109;
              v29 = v102;
              while (2)
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v109 != v28)
                    objc_enumerationMutation(obj);
                  v31 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
                  objc_msgSend(v31, "pathComponents");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v107, "containsObject:", v33);

                  if ((v34 & 1) != 0)
                  {
                    objc_msgSend(v29, "stringByAppendingPathComponent:", v31);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v104)
                    {
                      objc_msgSend(v101, "userIncompleteRestoreDirectory");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v105, "safeHarborDir");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "stringByAppendingPathComponent:", CFSTR("Container"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "stringByAppendingPathComponent:", v38);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();

                      v29 = v102;
                    }
                    else
                    {
                      objc_msgSend(v105, "safeHarborDir");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "stringByAppendingPathComponent:", CFSTR("Container"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v39, "stringByAppendingPathComponent:", v31);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_retainAutorelease(v35);
                    v48 = (const std::__fs::filesystem::path *)-[NSObject fileSystemRepresentation](v40, "fileSystemRepresentation");
                    v49 = objc_retainAutorelease(v47);
                    v50 = (const std::__fs::filesystem::path *)objc_msgSend(v49, "fileSystemRepresentation");
                    rename(v48, v50, v51);
                    if (v52)
                    {
                      MBGetDefaultLog();
                      v84 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v105, "domain");
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v85, "name");
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v117 = v86;
                        _os_log_impl(&dword_1D5213000, v84, OS_LOG_TYPE_DEFAULT, "Failed to move file in %@ to safe harbor", buf, 0xCu);

                        objc_msgSend(v105, "domain");
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v87, "name");
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to move file in %@ to safe harbor", v89, v90, v91, v92, v93, v94, (uint64_t)v88);

                      }
                      v24 = v97;
                      if (v96)
                      {
                        +[MBError posixErrorWithCode:format:](MBError, "posixErrorWithCode:format:", 100, CFSTR("Failed to move file to safe harbor"));
                        *v96 = (id)objc_claimAutoreleasedReturnValue();
                      }

                      v12 = 0;
                      v17 = v98;
                      v10 = v99;
                      v11 = v101;
                      goto LABEL_47;
                    }

                  }
                  else
                  {
                    MBGetDefaultLog();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v117 = v31;
                      _os_log_impl(&dword_1D5213000, v40, OS_LOG_TYPE_DEFAULT, "Not moving file %@ into the safe harbor because it lies outside the default directory hierarchy", buf, 0xCu);
                      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Not moving file %@ into the safe harbor because it lies outside the default directory hierarchy", v41, v42, v43, v44, v45, v46, (uint64_t)v31);
                    }
                  }

                }
                v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
                if (v27)
                  continue;
                break;
              }
              v12 = 1;
              v17 = v98;
              v10 = v99;
              v11 = v101;
              v53 = v100;
              v24 = v97;
            }
            else
            {
LABEL_47:
              v53 = v100;
            }
            v23 = 0;

          }
          v18 = v23;

        }
        else
        {
          MBGetDefaultLog();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "identifier");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v117 = v69;
            _os_log_impl(&dword_1D5213000, v68, OS_LOG_TYPE_ERROR, "App %@ has no data container to move to safe harbor", buf, 0xCu);

            objc_msgSend(v10, "identifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            _MBLog(CFSTR("ERROR"), (uint64_t)"App %@ has no data container to move to safe harbor", v71, v72, v73, v74, v75, v76, (uint64_t)v70);

          }
          if (a6)
          {
            objc_msgSend(v10, "identifier");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("App %@ has no data container to move to safe harbor"), v106);
            v12 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v12 = 0;
          }
        }

      }
      else
      {
        MBGetDefaultLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v117 = v18;
          _os_log_impl(&dword_1D5213000, v61, OS_LOG_TYPE_ERROR, "Failed to refresh app info before moving to safe harbor: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to refresh app info before moving to safe harbor: %@", v62, v63, v64, v65, v66, v67, (uint64_t)v18);
        }

        if (a6)
        {
          v18 = objc_retainAutorelease(v18);
          v12 = 0;
          *a6 = v18;
        }
        else
        {
          v12 = 0;
        }
      }

      v14 = v18;
    }
    else
    {
      MBGetDefaultLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v117 = v10;
        v118 = 2112;
        v119 = v14;
        _os_log_impl(&dword_1D5213000, v54, OS_LOG_TYPE_DEFAULT, "Failed to create safe harbor for %@: %@", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to create safe harbor for %@: %@", v55, v56, v57, v58, v59, v60, (uint64_t)v10);
      }

      if (a6)
      {
        v14 = objc_retainAutorelease(v14);
        v12 = 0;
        *a6 = v14;
      }
      else
      {
        v12 = 0;
      }
    }

  }
  return v12;
}

- (BOOL)moveAppDataToSafeHarborForContainer:(id)a3 withPersona:(id)a4 withError:(id *)a5
{
  return -[MBAppManager moveAppDataToSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:withError:](self, "moveAppDataToSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:withError:", a3, a4, 1, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSharedContainersByID, 0);
  objc_storeStrong((id *)&self->_systemDataContainersByID, 0);
  objc_storeStrong((id *)&self->_containersByID, 0);
  objc_storeStrong((id *)&self->_settingsContext, 0);
}

+ (void)_persistDisabledDomainNames:forPersona:.cold.1()
{
  __assert_rtn("+[MBAppManager _persistDisabledDomainNames:forPersona:]", "MBAppManager.m", 113, "names");
}

- (void)_copyAppsWithPlists:volumeMountPoints:safeHarbor:error:.cold.1()
{
  __assert_rtn("-[MBAppManager _copyAppsWithPlists:volumeMountPoints:safeHarbor:error:]", "MBAppManager.m", 389, "app");
}

@end
