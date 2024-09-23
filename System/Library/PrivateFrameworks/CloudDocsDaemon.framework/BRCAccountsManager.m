@implementation BRCAccountsManager

- (id)accountHandlerForCurrentPersona
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSMutableDictionary *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountsManager accountForPersona:](self, "accountForPersona:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountsManager accountHandlerForACAccountID:](self, "accountHandlerForACAccountID:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = self->_accountHandlersByACAccountID;
    objc_sync_enter(v21);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_accountHandlersByACAccountID, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    obj = v8;
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "session");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isDataSeparated") & 1) == 0 && (objc_msgSend(v4, "isDataSeparatedPersona") & 1) == 0)
          {

LABEL_15:
            brc_bread_crumbs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              v30 = 2112;
              v31 = v18;
              _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Found account handler %@ by persona match%@", buf, 0x16u);
            }

            v7 = v12;
            goto LABEL_18;
          }
          objc_msgSend(v12, "session");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "personaIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "br_personaID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v17)
            goto LABEL_15;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_18:

    objc_sync_exit(v21);
  }

  return v7;
}

- (id)accountHandlerForACAccountID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountHandlersByACAccountID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)accountForCurrentPersona
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_accountForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id obj;

  obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_sync_exit(obj);
}

- (void)enumerateAccountHandlers:(id)a3
{
  id v4;
  NSObject *queue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__38;
  v24 = __Block_byref_object_dispose__38;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke;
  block[3] = &unk_1E875F980;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = (id)v21[5];
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "acAccountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "br_personaIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v4;
        BRPerformWithPersonaAndError();

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v20, 8);
}

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_44);
  return (id)sharedManager_instance;
}

- (BOOL)_isDeviceUnlocked
{
  int v2;
  void *v3;
  NSObject *v4;
  void *v6;
  NSObject *v7;

  v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 < 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager _isDeviceUnlocked].cold.1((uint64_t)v6, v2, v7);

    return 0;
  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BRCAccountsManager _isDeviceUnlocked].cold.2(v2);

    return v2 == 1;
  }
}

- (id)versionsProviderForVolume:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_versionsProvidersByVolumeID, "objectForKeyedSubscript:", a3);
}

void __35__BRCAccountsManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;

}

- (BOOL)isInSyncBubble
{
  return objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
}

- (BRCAccountsManager)init
{
  BRCAccountsManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *maintainFPDomainsQueue;
  uint64_t v11;
  NSMutableDictionary *accountHandlersByACAccountID;
  uint64_t v13;
  NSMutableDictionary *versionsProvidersByVolumeID;
  BRCBarrier *v15;
  BRCBarrier *accountsLoadingBarrier;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BRCAccountsManager;
  v2 = -[BRCAccountsManager init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("account-queue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("maintain-fp-domains", v8);

    maintainFPDomainsQueue = v2->_maintainFPDomainsQueue;
    v2->_maintainFPDomainsQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    accountHandlersByACAccountID = v2->_accountHandlersByACAccountID;
    v2->_accountHandlersByACAccountID = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    versionsProvidersByVolumeID = v2->_versionsProvidersByVolumeID;
    v2->_versionsProvidersByVolumeID = (NSMutableDictionary *)v13;

    v15 = objc_alloc_init(BRCBarrier);
    accountsLoadingBarrier = v2->_accountsLoadingBarrier;
    v2->_accountsLoadingBarrier = v15;

  }
  return v2;
}

- (id)getQueue
{
  return self->_queue;
}

- (id)getMaintainFPDomainsQueue
{
  return self->_maintainFPDomainsQueue;
}

- (id)_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_accountForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "br_dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.bird.keepDataLocalOnSignOutSetAtTime."), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_readkeepDataLocalOnSignOutForCurrentPersona
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  time_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[BRCAccountsManager _keepDataLocalOnSignOutDefaultsKeyForCurrentPersona](self, "_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = v2;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Value of %@ user default is: %@%@", (uint8_t *)&v9, 0x20u);
  }

  v7 = time(0);
  LOBYTE(v7) = objc_msgSend(v4, "longValue") > v7 - 60;

  return v7;
}

- (void)keepDataLocalOnSignOutForCurrentPersona:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[BRCAccountsManager _keepDataLocalOnSignOutDefaultsKeyForCurrentPersona](self, "_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", time(0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:", v7);
  }

}

- (BOOL)cleanupAccountDataForLoggedOutAccountWithPersona:(id)a3
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  BRPerformWithPersonaAndError();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  char v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  id v53[5];
  id v54;
  char v55[32];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_6();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    BRPostAccountTokenChangedNotification();
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0DC5EF0], "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDataSeparatedPersona");

  if ((_DWORD)v7)
  {
    v8 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v53[1] = (id)MEMORY[0x1E0C809B0];
  v53[2] = (id)3221225472;
  v53[3] = __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_2;
  v53[4] = &unk_1E875D850;
  v10 = v8;
  v54 = v10;
  BRPerformWithPersonaAndError();
  objc_msgSend(*(id *)(a1 + 40), "accountHandlerForCurrentPersona");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fpDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAAD28], "br_getProviderManagerForDataSeparated:", v7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v44 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
  }
  else
  {
    if (v12)
    {
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_5();

    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "br_accountForCurrentPersona");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_4();

    v53[0] = 0;
    objc_msgSend(v45, "br_getFPDomainForAccount:withError:", v15, v53);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v53[0];

    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    if (!v13)
    {
      if (v44)
      {
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
          __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_3();

        v20 = 0;
      }
      else
      {
        brc_bread_crumbs();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(0, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_2(v39, (uint64_t)v37, (uint64_t)v55);
        }

        v44 = 0;
        v20 = 0;
        *((_BYTE *)v50 + 24) = 1;
      }
      goto LABEL_17;
    }
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v57 = v40;
    v58 = 2112;
    v59 = v41;
    v60 = 2112;
    v61 = v18;
    _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing domain: %@, display name: %@%@", buf, 0x20u);

  }
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_19;
  v46[3] = &unk_1E875F878;
  v20 = v13;
  v47 = v20;
  v48 = &v49;
  objc_msgSend(v45, "br_removeDomain:sync:completionHandler:", v20, 1, v46);

LABEL_17:
  if (v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "destroySessionSynchronously");
    if (!*((_BYTE *)v50 + 24))
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Domain removal failed and we have an account session. Crashing to prevent inconsistent state"));
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        brc_append_system_info_to_message();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_1(v23, (uint64_t)v21, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v24 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountsManager cleanupAccountDataForLoggedOutAccountWithPersona:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountsManager.m", 305, v24);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingPathComponent:", *MEMORY[0x1E0D10D00]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("db"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "fileExistsAtPath:", v27);

    if (v29)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v57 = v32;
        v58 = 2112;
        v59 = v26;
        v60 = 2112;
        v61 = v30;
        _os_log_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Found existing session directory on startup for account with no account handler (persona %@). Removing it %@%@", buf, 0x20u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[BRCFileSystemWrapper recursiveRemove:](BRCFileSystemWrapper, "recursiveRemove:", v26) == 0;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v34 = *(_BYTE *)(v33 + 24);
  if (v34)
    v34 = *((_BYTE *)v50 + 24) != 0;
  *(_BYTE *)(v33 + 24) = v34;
  _Block_object_dispose(&v49, 8);

LABEL_31:
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Cannot adopt persona for Ciconia cleanup: %@%@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "brc_ciconiaWorkDirForCurrentPersona");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "brc_ciconiaDumpDirForCurrentPersona");
    v5 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(void **)(a1 + 32);
      v10 = 138412802;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning Ciconia for persona ID: %@ at: %@%@", (uint8_t *)&v10, 0x20u);
    }

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "cleanupCiconiaAtURL:diagnosticsURL:completionHandler:", v4, v5, &__block_literal_global_17_0);

  }
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_15_cold_1();

  }
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_1CBD43000, v5, (os_log_type_t)0x90u, "[ERROR] Failed to remove domain %@ - %@%@", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_19_cold_1(a1, (uint64_t)v6, v7);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)loadAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Creating sync task%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34__BRCAccountsManager_loadAccounts__block_invoke(uint64_t a1)
{
  id (**v2)(void *);
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56[3];
  id v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "waitUntilDeviceIsUnlocked");
  v2 = (id (**)(void *))MEMORY[0x1E0D11060];
  *MEMORY[0x1E0D11070] = _BRBlockRememberPersona;
  *v2 = _BRActivityBlockRememberPersona;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v37, "br_allEnabledAppleAccountsIncludingDataSeparated:withError:", 1, &v57);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v57;
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"-[BRCAccountsManager loadAccounts]_block_invoke", 366, v56);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v31 = v56[0];
    v32 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 134218754;
    v61 = v31;
    v62 = 2048;
    v63 = v32;
    v64 = 2112;
    v65 = v36;
    v66 = 2112;
    v67 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Loaded %lu system icloud accounts with error: %@%@", buf, 0x2Au);
  }

  if (!v38 || v36)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      __34__BRCAccountsManager_loadAccounts__block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0D10EA8], "exitProcess:", 0);
  }
  else
  {
    +[BRCUserDefaults loadCachedServerConfiguration](BRCUserDefaults, "loadCachedServerConfiguration");
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v5 = v38;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v8 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v10, "br_personaIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v7;
          v46 = 3221225472;
          v47 = __34__BRCAccountsManager_loadAccounts__block_invoke_37;
          v48 = &unk_1E87610D0;
          v12 = *(_QWORD *)(a1 + 32);
          v49 = v10;
          v50 = v12;
          v13 = v5;
          v51 = v13;
          BRPerformWithPersonaAndError();

        }
        v6 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "signalBarrier");
    v44 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 32);
          v40[0] = v7;
          v40[1] = 3221225472;
          v40[2] = __34__BRCAccountsManager_loadAccounts__block_invoke_38;
          v40[3] = &unk_1E87644E0;
          v40[4] = v20;
          v40[5] = v18;
          objc_msgSend(v20, "createAndLoadSessionWithACAccountID:createBlock:", v19, v40);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
      }
      while (v15);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "isInSyncBubble"))
    {
      v21 = *(_QWORD **)(a1 + 32);
      if (!v21[6])
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2();

        v21 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v21, "_createSyncBubbleTasksIfNecessary");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "end");
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 48);
      *(_QWORD *)(v22 + 48) = 0;

    }
    objc_msgSend(v35, "serverConfigurationURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v27;

    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __34__BRCAccountsManager_loadAccounts__block_invoke_41;
    v39[3] = &unk_1E875D500;
    v39[4] = *(_QWORD *)(a1 + 32);
    +[BRCUserDefaults setServerConfigurationURL:whenLoaded:](BRCUserDefaults, "setServerConfigurationURL:whenLoaded:", v30, v39);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_scheduleExistingFileProviderDomainsMaintenanceWithAccounts:", v14);

  }
  __brc_leave_section(v56);

}

void __34__BRCAccountsManager_loadAccounts__block_invoke_37(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;

  if (a2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __34__BRCAccountsManager_loadAccounts__block_invoke_37_cold_1(a1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_maintainExistingFileProviderDomainsIfNeededWithAccounts:", *(_QWORD *)(a1 + 48));
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 32));
  }
}

id __34__BRCAccountsManager_loadAccounts__block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAndLoadAccountSynchronously:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v2, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountHandler:didChangeSessionTo:", v2, v4);

  return v2;
}

uint64_t __34__BRCAccountsManager_loadAccounts__block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateAccountHandlers:", &__block_literal_global_43_0);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefaultsChanged");

}

- (id)_getEnterpriseProviderManager
{
  return (id)objc_msgSend(MEMORY[0x1E0CAAD28], "br_getEnterpriseProviderManager");
}

- (id)_getPrimaryProviderManager
{
  return (id)objc_msgSend(MEMORY[0x1E0CAAD28], "br_getPrimaryProviderManager");
}

- (BOOL)_maintainExistingFileProviderDomainsWithAccounts:(id)a3 withError:(id *)a4
{
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  char *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char *v30;
  char *v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  char *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  char *v45;
  void *v46;
  char *v47;
  id v48;
  char *v49;
  NSObject *v50;
  char *v51;
  NSObject *v52;
  char *v53;
  int v54;
  void *v55;
  char *v56;
  void *v57;
  NSObject *v58;
  char *v59;
  NSObject *v60;
  char *v61;
  const char *v63;
  __int128 v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  _QWORD v75[6];
  id v76;
  id v77;
  char v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id obj;
  uint64_t v84;
  _QWORD v85[4];
  id v86[3];
  uint8_t v87[128];
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  char *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  if (!-[BRCAccountsManager isInSyncBubble](self, "isInSyncBubble"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:].cold.2();

    -[BRCAccountsManager _getEnterpriseProviderManager](self, "_getEnterpriseProviderManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v85[0] = &v84;
    v85[1] = 0x3032000000;
    v85[2] = __Block_byref_object_copy__38;
    v85[3] = __Block_byref_object_dispose__38;
    v86[0] = 0;
    obj = 0;
    objc_msgSend(v69, "br_getFPDomainsWithError:", &obj);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v86, obj);
    if (*(_QWORD *)(v85[0] + 40))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
        -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:].cold.1((uint64_t)v85);

      v10 = (char *)*(id *)(v85[0] + 40);
      v5 = v10 == 0;
      v11 = v10;
      if (v10)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        {
          v63 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v89 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
          v90 = 2080;
          if (!a4)
            v63 = "(ignored by caller)";
          v91 = v63;
          v92 = 2112;
          v93 = v11;
          v94 = 2112;
          v95 = v12;
          _os_log_error_impl(&dword_1CBD43000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
      {
        v14 = objc_retainAutorelease(v11);
        *a4 = v14;
      }
      else
      {
        v14 = v11;
      }
LABEL_85:

      _Block_object_dispose(&v84, 8);
      goto LABEL_86;
    }
    v81 = 0u;
    v82 = 0u;
    v80 = 0u;
    v79 = 0u;
    v70 = v67;
    v15 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (!v15)
    {
LABEL_81:
      v5 = 1;
LABEL_84:
      v14 = (char *)v70;
      goto LABEL_85;
    }
    v17 = "(passed to caller)";
    v72 = *(_QWORD *)v80;
    if (!a4)
      v17 = "(ignored by caller)";
    v65 = v17;
    v66 = *MEMORY[0x1E0CB2FE0];
    *(_QWORD *)&v16 = 138412802;
    v64 = v16;
LABEL_17:
    v73 = v15;
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v80 != v72)
        objc_enumerationMutation(v70);
      v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v18);
      if ((BRIsDefaultDomain() & 1) == 0)
      {
        v78 = 0;
        objc_msgSend(MEMORY[0x1E0D10E30], "matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:", v19, v71, &v78);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (v21)
        {
          objc_msgSend(v19, "personaIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isEqualToString:", CFSTR("__defaultPersonaID__")))
          {

            goto LABEL_28;
          }
          objc_msgSend(v19, "personaIdentifier");
          v24 = (id)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v25 = 0;
          }
          else
          {
LABEL_28:
            if (_maintainExistingFileProviderDomainsWithAccounts_withError____personaOnceToken != -1)
              dispatch_once(&_maintainExistingFileProviderDomainsWithAccounts_withError____personaOnceToken, &__block_literal_global_49);
            v24 = (id)_maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona;
            v25 = 1;
          }
          objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager", v64);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "currentPersona");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = 0;
          objc_msgSend(v27, "userPersonaUniqueString");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28 == v24 || (objc_msgSend(v28, "isEqualToString:", v24) & 1) != 0)
          {
            v30 = 0;
            goto LABEL_34;
          }
          if (voucher_process_can_use_arbitrary_personas())
          {
            v76 = 0;
            v46 = (void *)objc_msgSend(v27, "copyCurrentPersonaContextWithError:", &v76);
            v47 = (char *)v76;
            v48 = v77;
            v77 = v46;

            if (v47)
            {
              brc_bread_crumbs();
              v49 = (char *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412546;
                v89 = v47;
                v90 = 2112;
                v91 = v49;
                _os_log_error_impl(&dword_1CBD43000, v50, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", buf, 0x16u);
              }

            }
            objc_msgSend(v27, "generateAndRestorePersonaContextWithPersonaUniqueString:", v24);
            v30 = (char *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              brc_bread_crumbs();
              v51 = (char *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
              {
                objc_msgSend(v19, "personaIdentifier");
                v53 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v64;
                v89 = v53;
                v90 = 2112;
                v91 = v30;
                v92 = 2112;
                v93 = v51;
                _os_log_error_impl(&dword_1CBD43000, v52, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

              }
              goto LABEL_79;
            }
          }
          else if (v25 && (objc_msgSend(v27, "isDataSeparatedPersona") & 1) == 0)
          {
            brc_bread_crumbs();
            v51 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v89 = v51;
              _os_log_debug_impl(&dword_1CBD43000, v52, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", buf, 0xCu);
            }
            v30 = 0;
LABEL_79:

          }
          else
          {
            brc_bread_crumbs();
            v59 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v89 = v59;
              _os_log_debug_impl(&dword_1CBD43000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v66, 22, 0);
            v30 = (char *)objc_claimAutoreleasedReturnValue();
          }
LABEL_34:
          brc_bread_crumbs();
          v31 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v89 = (const char *)v19;
            v90 = 2112;
            v91 = v31;
            _os_log_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_INFO, "[INFO] Removing domain %@ since it doesn't have a backing AC account%@", buf, 0x16u);
          }

          v86[1] = 0;
          v86[2] = 0;
          objc_msgSend(v19, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = _br_parseUUIDString();

          if ((v34 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "br_currentPersonaID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "personaIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "isEqualToString:", v37);

            if (v38)
            {
              brc_bread_crumbs();
              v39 = (char *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v89 = v39;
                _os_log_debug_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] domain's persona still exists, removing account path%@", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "fileExistsAtPath:", v41);

                if (v43)
                  BRCRecursiveRemove(v41);
              }
              goto LABEL_57;
            }
          }
          else
          {
            if (objc_msgSend(v19, "br_isCiconiaDomain"))
            {
              brc_bread_crumbs();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v19, "identifier");
                v45 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v89 = v45;
                v90 = 2112;
                v91 = (const char *)v41;
                _os_log_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] We are removing the ciconia domain %@, not removing account data%@", buf, 0x16u);

              }
            }
            else
            {
              brc_bread_crumbs();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v19, "identifier");
                v61 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v89 = v61;
                v90 = 2112;
                v91 = (const char *)v41;
                _os_log_fault_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: domain identifier %@ isn't a UUID so not removing account data%@", buf, 0x16u);

              }
            }

LABEL_57:
          }
          if ((objc_msgSend(v19, "isDataSeparatedDomain") & 1) != 0
            || (objc_msgSend(v19, "isEnterpriseDomain") & 1) != 0)
          {
            v54 = 1;
          }
          else
          {
            v54 = objc_msgSend(v19, "br_isCiconiaDomain");
          }
          v75[0] = MEMORY[0x1E0C809B0];
          v75[1] = 3221225472;
          v75[2] = __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_51;
          v75[3] = &unk_1E875F878;
          v75[4] = v19;
          v75[5] = &v84;
          objc_msgSend(v69, "br_removeDomain:sync:completionHandler:", v19, v54 ^ 1u, v75);
          v55 = *(void **)(v85[0] + 40);
          if (v55)
          {
            v56 = v55;
            brc_bread_crumbs();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 136315906;
              v89 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
              v90 = 2080;
              v91 = v65;
              v92 = 2112;
              v93 = v56;
              v94 = 2112;
              v95 = v57;
              _os_log_error_impl(&dword_1CBD43000, v58, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

            if (a4)
              *a4 = objc_retainAutorelease(v56);

          }
          _BRRestorePersona();

          if (v55)
          {
            v5 = 0;
            goto LABEL_84;
          }
          goto LABEL_69;
        }
        if (v78)
        {
          objc_msgSend(v19, "personaIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v69;
          BRPerformWithPersonaAndError();

        }
      }
LABEL_69:
      if (v73 == ++v18)
      {
        v15 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
        if (!v15)
          goto LABEL_81;
        goto LABEL_17;
      }
    }
  }
  v5 = 1;
LABEL_86:

  return v5;
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona;
  _maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona = v0;

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Garbage Collected domain %@ with error - %@%@", (uint8_t *)&v9, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_1CBD43000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", buf, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_52_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 40), "br_addDomain:completionHandler:");
  }

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_1CBD43000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:(id)a3
{
  id v4;
  BRCAccountsManager *v5;
  _BOOL4 maintainedExistingFPDomains;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  maintainedExistingFPDomains = v5->_maintainedExistingFPDomains;
  v5->_maintainedExistingFPDomains = 1;
  objc_sync_exit(v5);

  if (!maintainedExistingFPDomains)
  {
    v11 = 0;
    v7 = -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:](v5, "_maintainExistingFileProviderDomainsWithAccounts:withError:", v4, &v11);
    v8 = v11;
    if ((v7 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCAccountsManager _maintainExistingFileProviderDomainsIfNeededWithAccounts:].cold.1();

    }
  }

}

- (void)_scheduleExistingFileProviderDomainsMaintenanceWithAccounts:(id)a3
{
  id v4;
  BRCAccountsManager *v5;
  _BOOL4 maintainedExistingFPDomains;
  NSObject *maintainFPDomainsQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  maintainedExistingFPDomains = v5->_maintainedExistingFPDomains;
  objc_sync_exit(v5);

  if (!maintainedExistingFPDomains)
  {
    maintainFPDomainsQueue = v5->_maintainFPDomainsQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke;
    v8[3] = &unk_1E875D470;
    v8[4] = v5;
    v9 = v4;
    dispatch_async(maintainFPDomainsQueue, v8);

  }
}

void __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "_waitUntilFileProviderIsReady:", &v12);
  v4 = v12;
  if ((v3 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_54;
    block[3] = &unk_1E875D470;
    block[4] = v5;
    v11 = v6;
    dispatch_sync(v7, block);

  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1();

  }
}

uint64_t __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_maintainExistingFileProviderDomainsIfNeededWithAccounts:", *(_QWORD *)(a1 + 40));
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2_cold_1();

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
}

- (void)enumerateAccountHandlerIfFinishedLoading:(id)a3
{
  if (self->_finishedLoadingAccounts)
    -[BRCAccountsManager enumerateAccountHandlers:](self, "enumerateAccountHandlers:", a3);
}

- (BOOL)_waitUntilFileProviderIsReady:(id *)a3
{
  void *v4;
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  const char *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "waitForFPToBeReadyToAcceptXPCWithError:", &v13);
  v5 = v13;
  v6 = objc_msgSend(v5, "br_isCloudDocsErrorCode:", 114);
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (!v5)
    {
      v7 = 0;
      v6 = 1;
      if (!a3)
        goto LABEL_9;
      goto LABEL_8;
    }
    if ((objc_msgSend(v5, "br_isPOSIXErrorCode:", 4) & 1) == 0)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        -[BRCAccountsManager _waitUntilFileProviderIsReady:].cold.1();

      exit(1);
    }
    v7 = v5;
    brc_bread_crumbs();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v15 = "-[BRCAccountsManager _waitUntilFileProviderIsReady:]";
      v16 = 2080;
      if (!a3)
        v10 = "(ignored by caller)";
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v5;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v7);
LABEL_9:

  return v6;
}

- (void)createAndLoadSessionWithACAccountID:(id)a3 createBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:].cold.2();

  }
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enableFileProviderBoosting");

  v26 = 0;
  v9 = -[BRCAccountsManager _waitUntilFileProviderIsReady:](self, "_waitUntilFileProviderIsReady:", &v26);
  v10 = v26;
  if (v9)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__38;
    v24 = __Block_byref_object_dispose__38;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountWithIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "br_personaIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    BRPerformWithPersonaAndError();

    v14 = self->_accountHandlersByACAccountID;
    objc_sync_enter(v14);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountHandlersByACAccountID, "setObject:forKeyedSubscript:", v21[5], v6);
    objc_sync_exit(v14);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1();

  }
}

void __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke_cold_1();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (BOOL)waitForInitialAccountLoadingSynchronouslyIfPossible
{
  NSObject *queue;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_finishedLoadingAccounts)
  {
    if (self->_loadAccountsRequested)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke;
      block[3] = &unk_1E875D500;
      block[4] = self;
      dispatch_sync(queue, block);
    }
    else
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Not waiting for initial account loading synchronously since we did not yet kick loadAccounts request%@", buf, 0xCu);
      }

    }
  }
  return self->_finishedLoadingAccounts;
}

void __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41))
  {
    brc_bread_crumbs();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke_cold_1();

  }
}

- (BOOL)waitForAccountLoadingSynchronouslyIfPossible:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  NSObject *queue;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  _QWORD block[5];
  id v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (*(_WORD *)&self->_loadAccountsRequested)
    goto LABEL_2;
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "boostFileProvider");

  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      v14 = "[WARNING] We were unsuccessful in boosting FP during the startup flow%@";
      goto LABEL_13;
    }
LABEL_14:

    v7 = 0;
    goto LABEL_5;
  }
  if (!self->_finishedLoadingAccounts && !self->_loadAccountsRequested)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      v14 = "[WARNING] We still aren't in a state where load accounts was requested%@";
LABEL_13:
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_2:
  -[BRCAccountsManager accountHandlerForACAccountID:](self, "accountHandlerForACAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishedLoading");

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke;
    block[3] = &unk_1E875D528;
    p_buf = &buf;
    block[4] = self;
    v16 = v4;
    dispatch_sync(queue, block);
    v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
LABEL_5:

  return v7;
}

void __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  NSObject *v4;

  v1 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "accountHandlerForACAccountID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(v1[1] + 8) + 24) = objc_msgSend(v2, "finishedLoading");

  if (!*(_BYTE *)(*(_QWORD *)(v1[1] + 8) + 24))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke_cold_1(v1);

  }
}

- (id)accountForPersona:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C8F2B8];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_accountForPersona:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personaIdentifierForACAccountID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C8F2B8];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "br_personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createAccountHandlerForAccountID:(id)a3
{
  id v3;
  BRCAccountHandler *v4;

  v3 = a3;
  v4 = -[BRCAccountHandler initWithACAccountID:]([BRCAccountHandler alloc], "initWithACAccountID:", v3);

  return v4;
}

- (id)getOrCreateAccountHandlerForACAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "br_personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BRCurrentPersonaMatchesID();

  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager getOrCreateAccountHandlerForACAccount:].cold.1();

    goto LABEL_8;
  }
  v8 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountHandlersByACAccountID, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_accountHandlersByACAccountID, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountsManager _createAccountHandlerForAccountID:](self, "_createAccountHandlerForAccountID:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountHandlersByACAccountID, "setObject:forKeyedSubscript:", v10, v5);
  }
  objc_sync_exit(v8);

LABEL_11:
  return v10;
}

- (void)createSessionWithACAccountID:(id)a3 dsid:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *maintainFPDomainsQueue;
  id v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountWithIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  maintainFPDomainsQueue = self->_maintainFPDomainsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke;
  block[3] = &unk_1E8761AE0;
  block[4] = self;
  v20 = v8;
  v21 = v12;
  v22 = v9;
  v23 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v12;
  v17 = v8;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(maintainFPDomainsQueue, v18);

}

void __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  dispatch_block_t v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_2;
  block[3] = &unk_1E8761AE0;
  block[4] = v2;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v4, v5);

}

void __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__38;
  v11[4] = __Block_byref_object_dispose__38;
  v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_3;
  v4[3] = &unk_1E8764598;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v7 = v9;
  v6 = *(id *)(a1 + 56);
  v8 = v11;
  objc_msgSend(v2, "createAndLoadSessionWithACAccountID:createBlock:", v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);

}

id __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "createAccountSessionWithDSID:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(v2, "startAndLoadAccountSynchronously:", *(_QWORD *)(a1 + 40));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v2, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountHandler:didChangeSessionTo:", v2, v7);

  }
  return v2;
}

- (void)updateAccountDisplayName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  BRCAccountsManager *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateAccountForPersonaCache");
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke;
  v15[3] = &unk_1E875DDA0;
  v16 = v6;
  v17 = self;
  v18 = v8;
  v19 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_sync(queue, v15);

}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_INFO, "[INFO] Updating account %@%@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__38;
  v20 = __Block_byref_object_dispose__38;
  v21 = 0;
  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDataSeparated");

  if (v8)
  {
    objc_msgSend(v6, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "personaIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 32);
    v17 = v6;
    BRPerformWithPersonaAndError();

    v11 = v15;
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v13, v14);
  _Block_object_dispose(buf, 8);

}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id obj;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accountWithIdentifier:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    obj = 0;
    v7 = (id)objc_msgSend(v6, "addFileProviderDomainForAccount:error:", v5, &obj);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
    BRPostAccountTokenChangedNotification();

  }
}

- (BOOL)destroySessionWithACAccountID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  char v8;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  BRCAccountsManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:].cold.2();

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = dispatch_group_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke;
  block[3] = &unk_1E87615A8;
  v13 = v4;
  v14 = self;
  v15 = &v16;
  v7 = v4;
  dispatch_sync(queue, block);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_INFO, "[INFO] Logging out account %@%@", (uint8_t *)&v14, 0x16u);
  }

  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountWithIdentifier:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "br_personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "cleanupAccountDataForLoggedOutAccountWithPersona:", v9);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v11 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
    objc_sync_enter(v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v11);

    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_2();
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_1();
  }

}

- (void)accountHandler:(id)a3 willChangeSessionFrom:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volume");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "deviceID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_versionsProvidersByVolumeID, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSession:", 0);
    objc_msgSend(v8, "suspend");

    v6 = v9;
  }

}

- (void)accountHandler:(id)a3 didChangeSessionTo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BRCVersionsFileProvider *v10;
  BRCVersionsFileProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "deviceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_versionsProvidersByVolumeID, "objectForKeyedSubscript:", v9);
    v10 = (BRCVersionsFileProvider *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = [BRCVersionsFileProvider alloc];
      objc_msgSend(v6, "volume");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "personaIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[BRCVersionsFileProvider initWithVolume:personaIdentifier:](v11, "initWithVolume:personaIdentifier:", v12, v14);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_versionsProvidersByVolumeID, "setObject:forKeyedSubscript:", v10, v9);
    }
    -[BRCFileProvider setSession:](v10, "setSession:", v6);
    -[BRCVersionsFileProvider resume](v10, "resume");

  }
}

- (void)waitUntilDeviceIsUnlocked
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't register notifications%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "_isDeviceUnlocked"))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  else
    syslog(5, "Device is locked - waiting\n");
}

uint64_t __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke_2(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke_65(uint64_t a1)
{
  uint64_t result;

  result = notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

- (void)_createSyncBubbleTasksIfNecessary
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_accountHandlersByACAccountID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "session");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientTruthWorkloop");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          block[0] = v8;
          block[1] = 3221225472;
          block[2] = __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke;
          block[3] = &unk_1E875D500;
          v13 = v10;
          dispatch_async_and_wait(v11, block);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "enumeratePrivateClientZones:", &__block_literal_global_67);
  objc_msgSend(*(id *)(a1 + 32), "enumerateSharedClientZones:", &__block_literal_global_69);
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

uint64_t __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "beginSyncBubbleActivityIfNecessary");
  return 1;
}

uint64_t __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "beginSyncBubbleActivityIfNecessary");
  return 1;
}

- (void)uploadContent
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "yes";
  if (!*(_BYTE *)(a1 + 41))
    v1 = "no";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v2, v3, "[DEBUG] Notified to upload content. resumed:%s%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

- (void)willSwitchUser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Notified of a user switch%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__BRCAccountsManager_willSwitchUser__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 41))
  {
    if (!*(_QWORD *)(v2 + 48))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2();

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "_createSyncBubbleTasksIfNecessary");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "end");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

  }
}

- (BOOL)retrySyncBubbleLaterIfNeededWithError:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  BRCAccountsManager *v9;

  v4 = a3;
  if (-[BRCAccountsManager isInSyncBubble](self, "isInSyncBubble")
    && objc_msgSend(v4, "brc_shouldRetryLater"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke;
    v7[3] = &unk_1E875D470;
    v8 = v4;
    v9 = self;
    if (retrySyncBubbleLaterIfNeededWithError__onceToken != -1)
      dispatch_once(&retrySyncBubbleLaterIfNeededWithError__onceToken, v7);

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke_cold_1(a1);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("encountered error domain %@ code %ld"), v7, objc_msgSend(*(id *)(a1 + 32), "code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterStakeHolder:status:reason:", v6, 1, v8);

}

- (BRCBarrier)accountsLoadingBarrier
{
  return self->_accountsLoadingBarrier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_accountsListChangeHandlers, 0);
  objc_storeStrong((id *)&self->_checkNeedsBubbleTask, 0);
  objc_storeStrong((id *)&self->_maintainFPDomainsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountHandlersByACAccountID, 0);
  objc_storeStrong((id *)&self->_versionsProvidersByVolumeID, 0);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_fault_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", v4, 0x16u);

}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] No domain to remove found for %@%@", v5);

}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Got an error when trying to find a domain to remove: %@%@");
  OUTLINED_FUNCTION_2();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] We don't have a domain in the account session, let's try to find a domain for account: %@%@");
  OUTLINED_FUNCTION_2();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !session%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Can't adopt session's persona, it must have already been deleted.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_15_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Cleaning up Ciconia failed: %@%@");
  OUTLINED_FUNCTION_2();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_19_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Removed domain %@%@", (uint8_t *)&v7);

}

void __34__BRCAccountsManager_loadAccounts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] We got an error from account store, we can't continue our loading sequence%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_checkNeedsBubbleTask%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_37_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v1, v2, "[CRIT] UNREACHABLE: Can't perform with account persona of %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] Failed getting the list of enterprise FP domains: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:withError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Finding old domains. Current accounts: %@%@");
  OUTLINED_FUNCTION_2();
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_52_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Persisting domain %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed maintaining existing file provider domains: %@%@");
  OUTLINED_FUNCTION_2();
}

void __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed waiting for File Provider to be ready: %@%@");
  OUTLINED_FUNCTION_2();
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't adopt persona for the account handler. Skipping it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_waitUntilFileProviderIsReady:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Waiting without success for FP to accept XPCs: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)createAndLoadSessionWithACAccountID:createBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: acAccountID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't create and load the session because we can't adopt the persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_finishedLoadingAccounts%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Waited without success for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)getOrCreateAccountHandlerForACAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't create an account handler with the wrong persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Updating display name is not supported on non EDS account%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] Failed to destroy session during logout%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Destroyed session during logout successfully%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_isDeviceUnlocked
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "unlocked";
  if (a1 != 1)
    v1 = "locked";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v2, v3, "[DEBUG] device is %s%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

void __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Encountered an error forcing us to try to retry the sync bubble later - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
