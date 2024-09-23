@implementation BRAccountDescriptor

- (BRAccountDescriptor)initWithPersonaIdentifier:(id)a3 accountIdentifier:(id)a4 domainIdentifier:(id)a5 organizationName:(id)a6 dataSeparated:(BOOL)a7 loggedInToCloudDocs:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BRAccountDescriptor *v18;
  BRAccountDescriptor *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BRAccountDescriptor;
  v18 = -[BRAccountDescriptor init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_personaIdentifier, a3);
    objc_storeStrong((id *)&v19->_accountIdentifier, a4);
    objc_storeStrong((id *)&v19->_domainIdentifier, a5);
    objc_storeStrong((id *)&v19->_organizationName, a6);
    v19->_isDataSeparated = a7;
    v19->_isLoggedInToCloudDocs = a8;
  }

  return v19;
}

- (BRAccountDescriptor)initWithCoder:(id)a3
{
  id v4;
  BRAccountDescriptor *v5;
  uint64_t v6;
  NSString *personaIdentifier;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *domainIdentifier;
  uint64_t v12;
  NSString *organizationName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRAccountDescriptor;
  v5 = -[BRAccountDescriptor init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaID"));
    v6 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainID"));
    v10 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orgName"));
    v12 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v12;

    v5->_isDataSeparated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dataSeparated"));
    v5->_isLoggedInToCloudDocs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loggedInToCloudDocs"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *personaIdentifier;
  id v5;

  personaIdentifier = self->_personaIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", personaIdentifier, CFSTR("personaID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("domainID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("orgName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDataSeparated, CFSTR("dataSeparated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLoggedInToCloudDocs, CFSTR("loggedInToCloudDocs"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)personaIdentifier
{
  return self->_personaIdentifier;
}

+ (void)clearAccountDescriptorCache
{
  id obj;

  if (g_allAccounts)
  {
    obj = (id)g_allAccounts;
    objc_sync_enter(obj);
    g_cacheValid = 0;
    g_hasDSAccount = 0;
    objc_msgSend((id)g_allAccounts, "removeAllObjects");
    objc_sync_exit(obj);

  }
}

+ (id)allLoggedInAccountDescriptors
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "allEligibleAccountDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_101);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsAtIndexes:", v4);

  return v3;
}

uint64_t __52__BRAccountDescriptor_allLoggedInAccountDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLoggedInToCloudDocs") ^ 1;
}

+ (void)refreshCache:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (refreshCache__onceToken == -1)
  {
    if (a3)
    {
LABEL_3:
      dispatch_async((dispatch_queue_t)refreshCache__refreshQueue, &__block_literal_global_105);
      return;
    }
  }
  else
  {
    dispatch_once(&refreshCache__onceToken, &__block_literal_global_102);
    if (v3)
      goto LABEL_3;
  }
  __36__BRAccountDescriptor_refreshCache___block_invoke_2((uint64_t)a1, (uint64_t)a2);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;

  v0 = objc_opt_new();
  v1 = (void *)g_allAccounts;
  g_allAccounts = v0;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("account-refresh-queue", v2);

  v4 = (void *)refreshCache__refreshQueue;
  refreshCache__refreshQueue = (uint64_t)v3;

}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  BRAccountDescriptor *v32;
  void *v33;
  void *v34;
  BRAccountDescriptor *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  id v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  NSObject *obj;
  id obja;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  int v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  NSObject *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  char v90[32];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v65 = BRIsFPFSEnabled(a1, a2);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  if (v65)
  {
    v3 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
    v4 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  }
  else
  {
    v4 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged");
  }
  v5 = v3;
  v61 = v4;
  v6 = objc_msgSend(v62, "isEqualToString:");
  v60 = v5;
  v71 = objc_msgSend(v62, "isEqualToString:", v5);
  v7 = 1;
  v66 = v6;
  if ((objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.bird")) & 1) == 0 && (v6 & 1) == 0 && (v71 & 1) == 0)
  {
    getpid();
    v7 = sandbox_check() != 0;
  }
  v8 = (id)g_allAccounts;
  objc_sync_enter(v8);
  if ((g_cacheValid & 1) == 0)
  {
    v58 = v8;
    if (v7)
    {
      getpid();
      if (sandbox_check())
      {
        brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 497);
        v59 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_5();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore", "com.apple.accountsd.accountmanager");
        v59 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "br_allEligibleAppleAccounts");
        v16 = objc_claimAutoreleasedReturnValue();
        v9 = v16;
        if (v65 && -[NSObject count](v16, "count"))
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
          if ((v71 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CAAD20], "br_getEnterpriseProviderManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v17, "addObject:", v18);
            }
            else
            {
              brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 511);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(0);
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_4();

            }
          }
          if ((v66 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CAAD20], "br_getPrimaryProviderManager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              objc_msgSend(v17, "addObject:", v40);
            }
            else
            {
              brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 519);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
                __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_3();

            }
          }
          v22 = (void *)objc_opt_new();
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v57 = v17;
          v68 = -[NSObject countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
          if (v68)
          {
            obja = *(id *)v82;
            while (2)
            {
              for (i = 0; i != v68; ++i)
              {
                if (*(id *)v82 != obja)
                  objc_enumerationMutation(v57);
                v43 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                v80 = 0;
                objc_msgSend(v43, "br_getFPDomainsWithError:", &v80);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v80;
                if (v45)
                {
                  v54 = v45;
                  brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 529);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log(0);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, (os_log_type_t)0x90u))
                    __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_2();

                  v37 = v57;
                  v36 = v57;
                  goto LABEL_82;
                }
                v78 = 0u;
                v79 = 0u;
                v76 = 0u;
                v77 = 0u;
                v46 = v44;
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
                if (v47)
                {
                  v48 = *(_QWORD *)v77;
                  do
                  {
                    for (j = 0; j != v47; ++j)
                    {
                      if (*(_QWORD *)v77 != v48)
                        objc_enumerationMutation(v46);
                      v50 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
                      +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:](BRAccountDescriptor, "matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:", v50, v9, 0);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v51)
                      {
                        objc_msgSend(v50, "identifier");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "identifier");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v22, "setObject:forKeyedSubscript:", v52, v53);

                      }
                    }
                    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
                  }
                  while (v47);
                }

              }
              v68 = -[NSObject countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
              if (v68)
                continue;
              break;
            }
          }

        }
        else
        {
          v22 = 0;
        }
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v9;
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
        if (v23)
        {
          v67 = *(_QWORD *)v73;
          do
          {
            v69 = v23;
            for (k = 0; k != v69; ++k)
            {
              if (*(_QWORD *)v73 != v67)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
              if ((!v71 || (objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "isDataSeparatedAccount") & 1) == 0)
                && (!v66 || objc_msgSend(v25, "isDataSeparatedAccount")))
              {
                objc_msgSend(v25, "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v26;
                if ((v65 & 1) != 0)
                {
                  objc_msgSend(v22, "objectForKeyedSubscript:", v26);
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = (void *)v28;
                  if (v28)
                    v30 = (void *)v28;
                  else
                    v30 = v27;
                  v31 = v30;

                }
                else
                {
                  v31 = v26;
                }
                v32 = [BRAccountDescriptor alloc];
                objc_msgSend(v25, "br_personaIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "accountDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = -[BRAccountDescriptor initWithPersonaIdentifier:accountIdentifier:domainIdentifier:organizationName:dataSeparated:loggedInToCloudDocs:](v32, "initWithPersonaIdentifier:accountIdentifier:domainIdentifier:organizationName:dataSeparated:loggedInToCloudDocs:", v33, v27, v31, v34, objc_msgSend(v25, "isDataSeparatedAccount"), objc_msgSend(v25, "br_isEnabledForCloudDocs"));

                objc_msgSend((id)g_allAccounts, "addObject:", v35);
                if (objc_msgSend(v25, "isDataSeparatedAccount"))
                  g_hasDSAccount = 1;

              }
            }
            v23 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          }
          while (v23);
        }

        g_cacheValid = 1;
        brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 576);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_1();
LABEL_82:

      }
    }
    else
    {
      +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "newSyncProxy");

      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __36__BRAccountDescriptor_refreshCache___block_invoke_3;
      v85[3] = &unk_1E3DA4960;
      v86 = v11;
      v59 = v86;
      -[NSObject queryEligibleAccountDescriptorsWithReply:](v86, "queryEligibleAccountDescriptorsWithReply:", v85);
      objc_msgSend(v59, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = v12 == 0;

      if ((_DWORD)v11)
      {
        v19 = (void *)g_allAccounts;
        objc_msgSend(v59, "result");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObjectsFromArray:", v20);

        if ((unint64_t)objc_msgSend((id)g_allAccounts, "count") > 1)
        {
          g_hasDSAccount = 1;
        }
        else
        {
          objc_msgSend((id)g_allAccounts, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          g_hasDSAccount = objc_msgSend(v21, "isDataSeparated");

        }
        g_cacheValid = 1;
        brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke_2", 488);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_1();
      }
      else
      {
        brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor refreshCache:]_block_invoke", 491);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        {
          objc_msgSend(v59, "error");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_7(v15, (uint64_t)v13, (uint64_t)v90);
        }
      }

      v9 = v86;
    }

    v8 = v58;
  }
  objc_sync_exit(v8);

}

uint64_t __36__BRAccountDescriptor_refreshCache___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

+ (id)allEligibleAccountDescriptors
{
  id v4;
  void *v5;

  +[BRAccount startAccountTokenChangeObserverIfNeeded](BRAccount, "startAccountTokenChangeObserverIfNeeded");
  if ((g_cacheValid & 1) == 0)
  {
    objc_msgSend(a1, "refreshCache:", 0);
    if ((g_cacheValid & 1) == 0)
      return 0;
  }
  v4 = (id)g_allAccounts;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend((id)g_allAccounts, "copy");
  objc_sync_exit(v4);

  return v5;
}

+ (id)accountDescriptorForURL:(id)a3
{
  return (id)objc_msgSend(a1, "accountDescriptorForURL:mustBeLoggedIn:", a3, 1);
}

+ (id)accountDescriptorForURL:(id)a3 mustBeLoggedIn:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[BRAccountDescriptor allEligibleAccountDescriptors](BRAccountDescriptor, "allEligibleAccountDescriptors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "personaIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v12, 1);

        if (v13)
        {
          if (v4 && !objc_msgSend(v11, "isLoggedInToCloudDocs"))
            v11 = 0;
          v14 = v11;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

+ (id)accountDescriptorForPersonaID:(id)a3
{
  return (id)objc_msgSend(a1, "accountDescriptorForPersonaID:mustBeLoggedIn:", a3, 1);
}

+ (id)accountDescriptorForPersonaID:(id)a3 mustBeLoggedIn:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  char v20;
  id v21;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  +[BRAccountDescriptor allEligibleAccountDescriptors](BRAccountDescriptor, "allEligibleAccountDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v23 = v4;
    v12 = *(_QWORD *)v25;
    v13 = v8 ^ 1;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "personaIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v5);
        if (((v17 | v13) & 1) != 0)
        {
          v18 = v17;

          if (v18)
            goto LABEL_13;
        }
        else
        {
          objc_msgSend(v15, "personaIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("__defaultPersonaID__"));

          if ((v20 & 1) != 0)
          {
LABEL_13:
            if (v23 && !objc_msgSend(v15, "isLoggedInToCloudDocs"))
              v15 = 0;
            v21 = v15;
            goto LABEL_17;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_17:

  return v21;
}

+ (id)accountDescriptorForAccountID:(id)a3
{
  return (id)objc_msgSend(a1, "accountDescriptorForAccountID:mustBeLoggedIn:", a3, 1);
}

+ (id)accountDescriptorForAccountID:(id)a3 mustBeLoggedIn:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[BRAccountDescriptor allEligibleAccountDescriptors](BRAccountDescriptor, "allEligibleAccountDescriptors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "accountIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if (v13)
        {
          if (v4 && !objc_msgSend(v11, "isLoggedInToCloudDocs"))
            v11 = 0;
          v14 = v11;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

+ (BOOL)mightHaveDataSeparatedAccountDescriptor
{
  void *v3;
  NSObject *v4;
  int v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  _BYTE v11[10];
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((g_cacheValid & 1) != 0)
    return g_hasDSAccount != 0;
  brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor mightHaveDataSeparatedAccountDescriptor]", 674);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v11 = v3;
    _os_log_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Cache not populated - going for a quick discovery%@", buf, 0xCu);
  }

  v5 = kpersona_find_by_type();
  v6 = v5 == -1;
  brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor mightHaveDataSeparatedAccountDescriptor]", 682);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v11 = v5 == -1;
    *(_WORD *)&v11[4] = 1024;
    *(_DWORD *)&v11[6] = *(_DWORD *)v11;
    v12 = 1024;
    v13 = 0;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] hasManagedPersona = %d because %d || %d%@", buf, 0x1Eu);
  }

  objc_msgSend(a1, "refreshCache:", 1);
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_isDataSeparated)
    v5 = CFSTR("separated");
  else
    v5 = CFSTR("primary");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p account:%@ persona:%@ org:%@ %@>"), v4, self, self->_accountIdentifier, self->_personaIdentifier, self->_organizationName, v5);
}

+ (id)matchDomainWithAccountAndStampDomainIfNeeded:(id)a3 withAccounts:(id)a4 persistDomain:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  BOOL *v39;
  NSObject *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "br_isCiconiaDomain"))
  {
    brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 708);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:].cold.1();
    v12 = 0;
  }
  else
  {
    objc_msgSend(v7, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_opt_new();
    v11 = v16;

    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("dsid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 714);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:].cold.3();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v21)
    {
      v22 = v21;
      v39 = a5;
      v40 = v11;
      v41 = v8;
      v42 = v7;
      v23 = *(_QWORD *)v44;
LABEL_12:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v24);
        objc_msgSend(v25, "identifier", v39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", v9))
          break;
        objc_msgSend(v25, "br_dsid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v17, "isEqualToString:", v27);

        if (v28)
        {
          brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 723);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            v48 = v17;
            v49 = 2112;
            v50 = v26;
            v51 = 2112;
            v52 = v9;
            v53 = 2112;
            v54 = v30;
            _os_log_debug_impl(&dword_19CBF0000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Located account with DSID: %@ (accountID: %@, domainID: %@)%@", buf, 0x2Au);
          }
          goto LABEL_27;
        }

        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          if (v22)
            goto LABEL_12;

          v8 = v41;
          v7 = v42;
          v11 = v40;
          if (v17)
            goto LABEL_22;
LABEL_36:
          brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 742);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v9;
            v49 = 2112;
            v50 = v36;
            _os_log_impl(&dword_19CBF0000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Didn't find an account with identifier %@. Possible data loss%@", buf, 0x16u);
          }

          v29 = 0;
          v17 = 0;
          goto LABEL_39;
        }
      }
      brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 719);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        +[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:].cold.2();
LABEL_27:
      v8 = v41;
      v7 = v42;
      v11 = v40;

      v29 = v25;
      if (v17)
        goto LABEL_28;
      if (v29)
      {
        objc_msgSend(v29, "br_dsid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 735);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v42;
          v49 = 2112;
          v50 = v17;
          v51 = 2112;
          v52 = v34;
          _os_log_impl(&dword_19CBF0000, v35, OS_LOG_TYPE_DEFAULT, "[NOTICE] Stamping domain %@ with DSID %@%@", buf, 0x20u);
        }

        -[NSObject setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v17, CFSTR("dsid"));
        objc_msgSend(v42, "setUserInfo:", v40);
        if (v39)
          *v39 = 1;
        goto LABEL_39;
      }
      goto LABEL_36;
    }

    if (!v17)
      goto LABEL_36;
LABEL_22:
    v29 = 0;
LABEL_28:
    brc_bread_crumbs((uint64_t)"+[BRAccountDescriptor matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:]", 732);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v7;
      v49 = 2112;
      v50 = v17;
      v51 = 2112;
      v52 = v32;
      _os_log_debug_impl(&dword_19CBF0000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Domain %@ was already stamped with dsid: %@%@", buf, 0x20u);
    }

LABEL_39:
    v10 = v29;

    v12 = v10;
  }

  return v12;
}

- (BOOL)isLoggedInToCloudDocs
{
  return self->_isLoggedInToCloudDocs;
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = g_allAccounts;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, v1, "[DEBUG] All logged in accounts cache populated to %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] Couldn't get FP domains - %@%@");
  OUTLINED_FUNCTION_1();
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Couldn't fetch the primary manager%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Couldn't fetch the enterprise manager%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Can't query accountsd for the logged in account descriptors either%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__BRAccountDescriptor_refreshCache___block_invoke_2_cold_7(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_19CBF0000, v6, v4, "[ERROR] Couldn't get account descriptors from daemon - %@%@", v5);

}

+ (void)matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] There is no account for Ciconia domain, the Ciconia Migrator should delete this%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] Located account with identifier: %@%@", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] Domain user info: %@%@", v1);
  OUTLINED_FUNCTION_1();
}

@end
