@implementation BRCDaemonContainerHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1)
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_5);
  return (id)sharedHelper_instance;
}

void __40__BRCDaemonContainerHelper_sharedHelper__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BRCDaemonContainerHelper _init]([BRCDaemonContainerHelper alloc], "_init");
  v1 = (void *)sharedHelper_instance;
  sharedHelper_instance = (uint64_t)v0;

}

- (id)_init
{
  BRCDaemonContainerHelper *v2;
  BRCDaemonContainerHelper *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  _DWORD *(*v19)(uint64_t, int);
  void *v20;
  BRCDaemonContainerHelper *v21;
  objc_super v22;
  _QWORD handler[4];
  id v24;
  uint64_t *v25;
  const char *v26;

  v22.receiver = self;
  v22.super_class = (Class)BRCDaemonContainerHelper;
  v2 = -[BRCDaemonContainerHelper init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BRCDaemonContainerHelper _computeTCCEnabledDisabledBundleIdentifiers](v2, "_computeTCCEnabledDisabledBundleIdentifiers");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.CloudDocs.BRCDaemonContainerHelper.TCCchanges", v5);

    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = v3->_queue;
    v9 = MEMORY[0x1E0C809B0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __33__BRCDaemonContainerHelper__init__block_invoke;
    v20 = &unk_1E875E0D0;
    v21 = v3;
    v10 = &v17;
    v11 = (void *)MEMORY[0x1E0DC5EE8];
    v12 = v8;
    objc_msgSend(v11, "sharedManager", v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "br_currentPersonaID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    handler[0] = v9;
    handler[1] = 3221225472;
    handler[2] = __br_notify_register_dispatch_block_invoke;
    handler[3] = &unk_1E875E140;
    v25 = v10;
    v26 = "com.apple.tcc.access.changed";
    v24 = v14;
    v15 = v14;
    notify_register_dispatch("com.apple.tcc.access.changed", &v3->_TCCAccessChangedNotificationToken, v12, handler);

  }
  return v3;
}

_DWORD *__33__BRCDaemonContainerHelper__init__block_invoke(uint64_t a1, int a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[6] == a2)
    return (_DWORD *)objc_msgSend(result, "_computeTCCEnabledDisabledBundleIdentifiers");
  return result;
}

- (void)_computeTCCEnabledDisabledBundleIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] About to compute the enabled and disabled bundle IDs via TCC%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)canFetchAllContainersByID
{
  return 1;
}

- (id)fetchAllContainersByIDWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountHandlerForCurrentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke;
  v12[3] = &unk_1E875E0F8;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateAppLibraries:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

uint64_t __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "setIsCloudSyncTCCDisabled:", objc_msgSend(*(id *)(a1 + 32), "cloudSyncTCCDisabledForContainerMeta:", v4));
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "appLibraryID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke_cold_1();

  }
  return 1;
}

- (id)fetchContainerForMangledID:(id)a3 personaID:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountHandlerForCurrentPersona");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "appLibraryByMangledID:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerMetadataFilledWithTCCInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)cloudSyncTCCDisabledForContainerMeta:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  BRCDaemonContainerHelper *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  uint64_t v15;
  NSObject *i;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D10DB0]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "bundleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = self;
      objc_sync_enter(v9);
      v10 = (void *)-[NSSet copy](v9->_knownBundleIDs, "copy");
      v11 = (void *)-[NSSet copy](v9->_disabledBundleIDs, "copy");
      objc_sync_exit(v9);

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v4, "bundleIdentifiers", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = 0;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v13; i = ((char *)i + 1))
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v10, "containsObject:", v17))
            {
              if ((objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
              {
                LOBYTE(v13) = 0;
                goto LABEL_19;
              }
              v14 = 1;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            continue;
          break;
        }

        if ((v14 & 1) == 0)
        {
          LOBYTE(v13) = 0;
          goto LABEL_20;
        }
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[BRCDaemonContainerHelper cloudSyncTCCDisabledForContainerMeta:].cold.1(v4, (uint64_t)v12, v13);

        LOBYTE(v13) = 1;
      }
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
  }
  LOBYTE(v13) = 0;
LABEL_21:

  return (char)v13;
}

- (unsigned)br_capabilityToMoveFromLocalItem:(id)a3 toNewParent:(id)a4 session:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  unsigned __int16 v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  const char *v21;
  void *v23;
  void *v24;
  char v25;
  char *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  char v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  char *v43;
  NSObject *v44;
  void *v45;
  int v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  int v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  char *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isDirectory") & 1) != 0)
  {
    objc_msgSend(v8, "clientZone");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isSharedToMeChildItem")
      && (objc_msgSend(v8, "sharingOptions") & 0x20) != 0
      && objc_msgSend(v8, "isKnownByServer"))
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v62 = 138412546;
        v63 = (const char *)v8;
        v64 = 2112;
        v65 = v12;
        v14 = "[WARNING] Can't edit a readonly share for %@%@";
LABEL_35:
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v62, 0x16u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    if (objc_msgSend(v9, "isSharedToMe") && (objc_msgSend(v9, "sharingOptions") & 0x20) != 0)
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v62 = 138412546;
        v63 = (const char *)v9;
        v64 = 2112;
        v65 = v12;
        v14 = "[WARNING] Can't add a file to a readonly share with parent %@%@";
        goto LABEL_35;
      }
LABEL_36:
      v17 = 512;
      goto LABEL_37;
    }
    if (objc_msgSend(v8, "isSharedToMeTopLevelItem") && objc_msgSend(v9, "isInTrashScope"))
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v62 = 138412546;
        v63 = (const char *)v8;
        v64 = 2112;
        v65 = v12;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Error trying to move shared top item %@ into trash%@", (uint8_t *)&v62, 0x16u);
      }
      v17 = 8;
      goto LABEL_37;
    }
    if (objc_msgSend(v8, "isSharedToMeTopLevelItem")
      && ((objc_msgSend(v9, "isSharedByMe") & 1) != 0 || objc_msgSend(v9, "isSharedToMe")))
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        v17 = 2;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      v62 = 138412546;
      v63 = (const char *)v8;
      v64 = 2112;
      v65 = v12;
      v18 = "[WARNING] Error trying to move shared top item %@ into a shared item%@";
      v19 = v13;
      v20 = 22;
LABEL_25:
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v62, v20);
      goto LABEL_26;
    }
    if ((objc_msgSend(v10, "isEqualToClientZone:", v11) & 1) != 0)
    {
      if (objc_msgSend(v8, "hasShareIDAndIsOwnedByMe"))
      {
        if ((objc_msgSend(v9, "isOwnedByMe") & 1) == 0)
        {
          brc_bread_crumbs();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
            -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.1();

        }
        if (objc_msgSend(v9, "isSharedByMe"))
        {
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v62 = 138412802;
            v63 = (const char *)v8;
            v64 = 2112;
            v65 = (const char *)v9;
            v66 = 2112;
            v67 = v12;
            v21 = "[WARNING] Error trying to move shared top item %@ into another shared item %@%@";
LABEL_110:
            _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v62, 0x20u);
            goto LABEL_111;
          }
          goto LABEL_111;
        }
        goto LABEL_85;
      }
      if ((objc_msgSend(v8, "isOwnedByMe") & 1) != 0)
      {
        if (!objc_msgSend(v8, "isSharedByMe"))
        {
          if (objc_msgSend(v9, "isSharedByMe"))
          {
            brc_bread_crumbs();
            v12 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v62 = 138412802;
              v63 = (const char *)v8;
              v64 = 2112;
              v65 = (const char *)v9;
              v66 = 2112;
              v67 = v12;
              v21 = "[WARNING] Moving item %@ into a share with parent %@%@";
              goto LABEL_110;
            }
LABEL_111:
            v17 = 128;
            goto LABEL_37;
          }
LABEL_85:
          if (objc_msgSend(v8, "isDirectory")
            && (objc_msgSend(v8, "isSharedByMe") & 1) == 0
            && (objc_msgSend(v8, "isSharedToMe") & 1) == 0)
          {
            if ((objc_msgSend(v9, "isSharedToMe") & 1) != 0 || objc_msgSend(v9, "isSharedByMe"))
            {
              objc_msgSend(v8, "asDirectory");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "possiblyContainsSharedItem");

              if (v46)
              {
                brc_bread_crumbs();
                v12 = (char *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  v62 = 138412802;
                  v63 = (const char *)v8;
                  v64 = 2112;
                  v65 = (const char *)v9;
                  v66 = 2112;
                  v67 = v12;
                  _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item with a shared child %@ into a share with parent %@%@", (uint8_t *)&v62, 0x20u);
                }
                v17 = 1024;
                goto LABEL_37;
              }
            }
            if (objc_msgSend(v9, "isInTrashScope"))
            {
              objc_msgSend(v8, "asDirectory");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "possiblyContainsSharedItem");

              if (v55)
              {
                brc_bread_crumbs();
                v12 = (char *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  v62 = 138412802;
                  v63 = (const char *)v8;
                  v64 = 2112;
                  v65 = (const char *)v9;
                  v66 = 2112;
                  v67 = v12;
                  _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving an item with a shared child %@ into trash at parent %@%@", (uint8_t *)&v62, 0x20u);
                }
                v17 = 2048;
                goto LABEL_37;
              }
            }
          }
          v17 = 64;
          goto LABEL_38;
        }
        if ((objc_msgSend(v9, "isOwnedByMe") & 1) == 0)
        {
          brc_bread_crumbs();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
            -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.1();

        }
        if ((objc_msgSend(v9, "isSharedByMe") & 1) == 0)
        {
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v62 = 138412802;
            v63 = (const char *)v8;
            v64 = 2112;
            v65 = (const char *)v9;
            v66 = 2112;
            v67 = v12;
            v21 = "[WARNING] Moving item %@ out of the share to new parent %@%@";
            goto LABEL_110;
          }
          goto LABEL_111;
        }
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v8);
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13
          || (objc_msgSend(v12, "recordName"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSObject recordName](v13, "recordName"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              v25 = objc_msgSend(v23, "isEqualToString:", v24),
              v24,
              v23,
              (v25 & 1) == 0))
        {
          brc_bread_crumbs();
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v62 = 138412802;
            v63 = (const char *)v8;
            v64 = 2112;
            v65 = (const char *)v9;
            v66 = 2112;
            v67 = v26;
            _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item %@ into a different share with parent %@%@", (uint8_t *)&v62, 0x20u);
          }

          goto LABEL_111;
        }
      }
      else
      {
        if (objc_msgSend(v9, "isOwnedByMe"))
        {
          brc_bread_crumbs();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
            -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.4();

        }
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v8);
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13
          || (objc_msgSend(v12, "recordName"),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSObject recordName](v13, "recordName"),
              v36 = (void *)objc_claimAutoreleasedReturnValue(),
              v37 = objc_msgSend(v35, "isEqualToString:", v36),
              v36,
              v35,
              (v37 & 1) == 0))
        {
          if (!objc_msgSend(v8, "isDocument"))
            goto LABEL_78;
          objc_msgSend(v8, "appLibrary");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "mangledID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "supportsServerSideAssetCopies");

          if (v42)
          {
            brc_bread_crumbs();
            v43 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.3();
            v17 = 64;
          }
          else
          {
LABEL_78:
            brc_bread_crumbs();
            v43 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              v62 = 138412802;
              v63 = (const char *)v8;
              v64 = 2112;
              v65 = (const char *)v9;
              v66 = 2112;
              v67 = v43;
              _os_log_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item %@ into another shared item %@%@", (uint8_t *)&v62, 0x20u);
            }
            v17 = 128;
          }

          goto LABEL_37;
        }
      }

      goto LABEL_85;
    }
    if (objc_msgSend(v8, "isSharedToMeTopLevelItem"))
    {
      if (objc_msgSend(v11, "isSharedZone"))
      {
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        v62 = 138412802;
        v63 = (const char *)v8;
        v64 = 2112;
        v65 = (const char *)v9;
        v66 = 2112;
        v67 = v12;
        v18 = "[WARNING] Error trying to move shared top item %@ into another shared item %@%@";
        v19 = v13;
        v20 = 32;
        goto LABEL_25;
      }
      objc_msgSend(v8, "appLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "defaultClientZone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToClientZone:", v11);

      if (v34)
      {
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.5();
LABEL_65:
        v17 = 64;
        goto LABEL_37;
      }
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v62 = 138412546;
        v63 = (const char *)v8;
        v64 = 2112;
        v65 = v12;
        v47 = "[WARNING] Top level shared item %@ moved across zone boundaries.  Allowing it%@";
        v48 = v13;
        v49 = 22;
        goto LABEL_100;
      }
    }
    else
    {
      if ((objc_msgSend(v10, "isSharedZone") & 1) != 0 || objc_msgSend(v11, "isSharedZone"))
      {
        if (!objc_msgSend(v8, "isDocument"))
          goto LABEL_59;
        objc_msgSend(v8, "appLibrary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "mangledID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "supportsServerSideAssetCopies");

        if (!v31)
        {
LABEL_59:
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v62 = 138412802;
            v63 = (const char *)v8;
            v64 = 2112;
            v65 = (const char *)v9;
            v66 = 2112;
            v67 = v12;
            _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is moving in or out of a shared zone to parent %@%@", (uint8_t *)&v62, 0x20u);
          }
          v17 = 16;
          goto LABEL_37;
        }
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.6();
        goto LABEL_65;
      }
      if (!objc_msgSend(v8, "hasShareIDAndIsOwnedByMe")
        || (objc_msgSend(v8, "sharingOptions") & 0x48) == 0)
      {
        if (!objc_msgSend(v8, "isDocument"))
          goto LABEL_106;
        objc_msgSend(v8, "appLibrary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "mangledID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "supportsServerSideAssetCopies");

        if (!v53)
        {
LABEL_106:
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v62 = 138412802;
            v63 = (const char *)v8;
            v64 = 2112;
            v65 = (const char *)v9;
            v66 = 2112;
            v67 = v12;
            v17 = 32;
            _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is crossing zone boundaries to %@%@", (uint8_t *)&v62, 0x20u);
          }
          else
          {
            v17 = 32;
          }
          goto LABEL_37;
        }
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.7();
        goto LABEL_65;
      }
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v62 = 138412290;
        v63 = v12;
        v47 = "[WARNING] Warning for move of shared item across zones%@";
        v48 = v13;
        v49 = 12;
LABEL_100:
        _os_log_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEFAULT, v47, (uint8_t *)&v62, v49);
      }
    }
    v17 = 256;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 20);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v38 = "(passed to caller)";
      v62 = 136315906;
      v63 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]";
      v64 = 2080;
      if (!a6)
        v38 = "(ignored by caller)";
      v65 = v38;
      v66 = 2112;
      v67 = (char *)v10;
      v68 = 2112;
      v69 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v62, 0x2Au);
    }

  }
  if (a6)
  {
    v10 = objc_retainAutorelease(v10);
    *a6 = v10;
  }
  v17 = 4;
LABEL_39:

  return v17;
}

- (unsigned)br_capabilityToMoveFromLookup:(id)a3 toNewParent:(id)a4 session:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char v17;
  BRCURLToItemLookup *v18;
  void *v19;
  unsigned __int16 v20;
  BRCURLToItemLookup *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemNotFound:", 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v35 = "(passed to caller)";
        v38 = 136315906;
        v39 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:]";
        v40 = 2080;
        if (!a6)
          v35 = "(ignored by caller)";
        v41 = v35;
        v42 = 2112;
        v43 = v13;
        v44 = 2112;
        v45 = v15;
        _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v38, 0x2Au);
      }

    }
    if (a6)
    {
      v13 = objc_retainAutorelease(v13);
      *a6 = v13;
    }
    goto LABEL_23;
  }
  objc_msgSend(v10, "byIDLocalItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v10, "faultedLocalItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v10, "url");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "brc_errorItemNotFound:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v36 = "(passed to caller)";
          v38 = 136315906;
          v39 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:]";
          v40 = 2080;
          if (!a6)
            v36 = "(ignored by caller)";
          v41 = v36;
          v42 = 2112;
          v43 = v26;
          v44 = 2112;
          v45 = v27;
          _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v38, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v26);

      v13 = 0;
LABEL_23:
      v20 = 1;
      goto LABEL_24;
    }
  }
  if (!objc_msgSend(v12, "syncedFolderTypeForURL:", v11))
  {
LABEL_16:
    v20 = 8;
    goto LABEL_24;
  }
  objc_msgSend(v11, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "br_isExcludedWithMaximumDepth:", 1024) & 1) != 0)
  {

    goto LABEL_16;
  }
  v17 = objc_msgSend(v11, "br_isInSyncedLocation");

  if ((v17 & 1) == 0)
    goto LABEL_16;
  v18 = [BRCURLToItemLookup alloc];
  objc_msgSend(v10, "db");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 1;
  v21 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:](v18, "initWithURL:allowAppLibraryRoot:session:db:", v11, 1, v12, v19);

  if (-[BRCURLToItemLookup resolveAndKeepOpenWithError:](v21, "resolveAndKeepOpenWithError:", a6))
  {
    -[BRCURLToItemLookup byIDLocalItem](v21, "byIDLocalItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCURLToItemLookup closePaths](v21, "closePaths");
    if (v22)
    {
      v20 = -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:](self, "br_capabilityToMoveFromLocalItem:toNewParent:session:error:", v13, v22, v12, a6);
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v11, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "brc_errorItemNotFound:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v37 = "(passed to caller)";
          v38 = 136315906;
          v39 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:]";
          v40 = 2080;
          if (!a6)
            v37 = "(ignored by caller)";
          v41 = v37;
          v42 = 2112;
          v43 = v32;
          v44 = 2112;
          v45 = v33;
          _os_log_debug_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v38, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v32);

      v20 = 1;
    }

  }
LABEL_24:

  return v20;
}

- (unsigned)br_capabilityToMoveFromURL:(id)a3 toNewParent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BRCURLToItemLookup *v13;
  unsigned __int16 v14;

  v8 = a4;
  v9 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountHandlerForCurrentPersona");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:", v9, 0, v12);
  if (-[BRCURLToItemLookup resolveAndKeepOpenWithError:](v13, "resolveAndKeepOpenWithError:", a5))
    v14 = -[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:](self, "br_capabilityToMoveFromLookup:toNewParent:session:error:", v13, v8, v12, a5);
  else
    v14 = 1;
  -[BRCURLToItemLookup closePaths](v13, "closePaths");

  return v14;
}

- (id)itemIDForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BRCURLToItemLookup *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountHandlerForCurrentPersona");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:", v5, 0, v8);
  if (-[BRCURLToItemLookup resolveAndKeepOpenWithError:](v9, "resolveAndKeepOpenWithError:", a4))
  {
    -[BRCURLToItemLookup byIDLocalItem](v9, "byIDLocalItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[BRCURLToItemLookup faultedLocalItem](v9, "faultedLocalItem");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;

    objc_msgSend(v14, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCURLToItemLookup closePaths](v9, "closePaths");
  }
  else
  {
    -[BRCURLToItemLookup closePaths](v9, "closePaths");
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  int TCCAccessChangedNotificationToken;
  NSSet *knownBundleIDs;
  NSSet *disabledBundleIDs;
  objc_super v6;

  TCCAccessChangedNotificationToken = self->_TCCAccessChangedNotificationToken;
  if (TCCAccessChangedNotificationToken != -1)
    notify_cancel(TCCAccessChangedNotificationToken);
  knownBundleIDs = self->_knownBundleIDs;
  self->_knownBundleIDs = 0;

  disabledBundleIDs = self->_disabledBundleIDs;
  self->_disabledBundleIDs = 0;

  v6.receiver = self;
  v6.super_class = (Class)BRCDaemonContainerHelper;
  -[BRCDaemonContainerHelper dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knownBundleIDs, 0);
  objc_storeStrong((id *)&self->_disabledBundleIDs, 0);
}

void __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] no metadata for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)cloudSyncTCCDisabledForContainerMeta:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is disabled by TCC%@", (uint8_t *)&v6, 0x16u);

}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parent.isOwnedByMe%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Allowing server-side asset copy for subitem moving %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !parent.isOwnedByMe%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Allowing move of top level folder share item %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Allowing server-side asset copy for shared folder transfer for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Allowing server-side asset copy for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
