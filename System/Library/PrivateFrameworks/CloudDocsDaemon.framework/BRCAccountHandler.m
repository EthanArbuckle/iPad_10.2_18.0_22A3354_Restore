@implementation BRCAccountHandler

- (BRCAccountHandler)initWithACAccountID:(id)a3
{
  id v5;
  BRCAccountHandler *v6;
  BRCAccountHandler *v7;
  uint64_t v8;
  NSString *accountPath;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  id v18;
  dispatch_workloop_t v19;
  OS_dispatch_workloop *pushWorkloop;
  id v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *migrationStatusSetterQueue;
  BRCBarrier *v27;
  BRCBarrier *accountLoadingBarrier;
  uint64_t v29;
  NSMutableDictionary *syncPolicyByFolderType;
  void *v31;
  uint64_t v32;
  NSHashTable *delegates;
  void *v35;
  NSObject *v36;
  const char *v37;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BRCAccountHandler;
  v6 = -[BRCAccountHandler init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_acAccountID, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
    v8 = objc_claimAutoreleasedReturnValue();
    accountPath = v7->_accountPath;
    v7->_accountPath = (NSString *)v8;

    if (!v7->_accountPath)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a nil account path"));
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v37 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountHandler initWithACAccountID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 297, v37);
    }
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "br_currentPersonaID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    BRPersonaSpecificName();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v13, v15);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

    BRPersonaSpecificName();
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_workloop_create((const char *)objc_msgSend(v18, "UTF8String"));
    pushWorkloop = v7->_pushWorkloop;
    v7->_pushWorkloop = (OS_dispatch_workloop *)v19;

    BRPersonaSpecificName();
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v23, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create(v22, v24);

    migrationStatusSetterQueue = v7->_migrationStatusSetterQueue;
    v7->_migrationStatusSetterQueue = (OS_dispatch_queue *)v25;

    v27 = objc_alloc_init(BRCBarrier);
    accountLoadingBarrier = v7->_accountLoadingBarrier;
    v7->_accountLoadingBarrier = v27;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    syncPolicyByFolderType = v7->_syncPolicyByFolderType;
    v7->_syncPolicyByFolderType = (NSMutableDictionary *)v29;

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:", v7);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v32 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v32;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BRCAccountHandler;
  -[BRCAccountHandler dealloc](&v4, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDelegate:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountHandler profileConnectionDidReceiveRestrictionChangedNotification:userInfo:].cold.1();
  v19 = v4;

  +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor](BRCCloudDocsAppsMonitor, "cloudDocsAppsMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allApplicationIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isCloudSyncAllowed:", v14);

          if ((v16 & 1) == 0)
          {
            brc_bread_crumbs();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v25 = v14;
              v26 = 2112;
              v27 = v17;
              _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] jetsaming %@%@", buf, 0x16u);
            }

            BKSTerminateApplicationForReasonAndReportWithDescription();
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

}

- (BOOL)setDBAccountDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  char v15;
  id v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSObject *v21;
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[BRCAccountHandler accountPath](self, "accountPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "brc_accountIDPathForAccountPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BRCAccountHandler accountPath](self, "accountPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v10 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v24);
    v11 = v24;

    if ((v10 & 1) == 0)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        -[BRCAccountHandler setDBAccountDSID:].cold.3();

    }
    v23 = v11;
    v14 = 1;
    v15 = objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v8, 1, 4, &v23);
    v16 = v23;

    if ((v15 & 1) == 0)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        -[BRCAccountHandler setDBAccountDSID:].cold.2();

      v14 = 0;
    }
  }
  else if ((BRCRecursiveRemove(v8) & 0x80000000) != 0)
  {
    v19 = *__error();
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      -[BRCAccountHandler setDBAccountDSID:].cold.1();

    v16 = 0;
    v14 = 0;
    *__error() = v19;
  }
  else
  {
    v16 = 0;
    v14 = 1;
  }

  return v14;
}

- (BOOL)_cleanupAPFSSnapshotWhenNoSessionExists
{
  id v3;
  int v4;
  void *v5;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v7.f_mntonname[392], 0, 32);
  objc_msgSend(MEMORY[0x1E0D10E60], "cloudDocsAppSupportURL", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = statfs((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v7);

  if ((v4 & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7.f_mntonname);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCAnalyticsReporter cancelSyncConsistencyReportWithMountPath:queue:](BRCAnalyticsReporter, "cancelSyncConsistencyReportWithMountPath:queue:", v5, self->_pushWorkloop);

  }
  return v4 >= 0;
}

- (void)_cleanupPushAndActivitiesStatesWhenNoSessionExists
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx disabling pushes, be sure to listen to activities and the like%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __71__BRCAccountHandler__cleanupPushAndActivitiesStatesWhenNoSessionExists__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.bird.disabled-events", v1);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *MEMORY[0x1E0CFE128];
  v16[0] = *MEMORY[0x1E0CFE130];
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      v10 = 0;
      v11 = v7;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE148]), "initWithEnvironmentName:namedDelegatePort:queue:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), CFSTR("com.apple.bird.push"), v2);

        objc_msgSend(v7, "setEnabledTopics:ignoredTopics:opportunisticTopics:", v9, v9, v9);
        objc_msgSend(v7, "shutdown");
        ++v10;
        v11 = v7;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);

  }
}

- (void)startAndLoadAccountSynchronously:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  BRCAccountHandler *v12;
  id v13;

  v4 = a3;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke;
  v11 = &unk_1E875D470;
  v12 = self;
  v13 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, &v8);
  dispatch_async(queue, v7);

  -[BRCAccountHandler waitForSessionLoading](self, "waitForSessionLoading", v8, v9, v10, v11, v12);
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  char v17;
  char v18;
  id v19;
  void *v20;
  NSObject *v21;
  BRCAccountSession *v22;
  NSObject *v23;
  id v24;
  int v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  int v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  uint64_t v55[3];
  _QWORD v56[4];
  NSObject *v57;
  uint64_t v58[3];
  char v59;
  _QWORD block[4];
  id v61;
  uint8_t buf[24];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D10E58];
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "accountPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brc_dbAccountDSIDForPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentMobileDocumentsDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BRCGetXattrValueForKeyOnPath(v6, CFSTR("com.apple.ubd.prsid"));
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 40), "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]);
  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    v12 = 0;
    v10 = 0;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "br_dsid");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "br_isEnabledForCloudDocs"))
  {
    v11 = *((_QWORD *)*v3 + 8);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_2;
    block[3] = &unk_1E875D500;
    v10 = v10;
    v61 = v10;
    dispatch_async(v11, block);

LABEL_11:
    v12 = 1;
LABEL_12:
    v59 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", &v59);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v58, 0, sizeof(v58));
    __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 521, v58);
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v45 = v58[0];
      objc_msgSend(*v3, "accountPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
        v46 = CFSTR("DS");
      else
        v46 = CFSTR("not DS");
      objc_msgSend(*(id *)(a1 + 40), "br_personaIdentifier", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(*(id *)(a1 + 40), "isDataSeparatedAccount");
      v49 = CFSTR("DS");
      if (!v48)
        v49 = CFSTR("not DS");
      *(_DWORD *)buf = 134220290;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v63 = v5;
      v64 = 2112;
      v65 = v7;
      v66 = 2112;
      v67 = v51;
      v68 = 2112;
      v69 = v52;
      v70 = 2112;
      v71 = v50;
      v72 = 2112;
      v73 = v47;
      v74 = 2112;
      v75 = v49;
      v76 = 2112;
      v77 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx loaded system account ID: %@ (db ID: %@, disk ID: %@, path: %@, current persona: %@ (%@), account's persona: %@ (%@))%@", buf, 0x66u);

      v9 = MEMORY[0x1E0C809B0];
    }

    if (v7 | v5)
      v17 = v12;
    else
      v17 = 1;
    if ((v17 & 1) != 0)
    {
      if (v5)
        v18 = 0;
      else
        v18 = v12;
      if ((v18 & 1) != 0)
      {
        v19 = v10;
LABEL_26:
        if ((objc_msgSend(*v3, "setDBAccountDSID:", v10) & 1) != 0)
        {
          if (v10)
          {
            v25 = 1;
            v5 = (uint64_t)v10;
            goto LABEL_36;
          }
        }
        else
        {
          brc_bread_crumbs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_2();

        }
        v28 = 0;
        v5 = 0;
LABEL_55:
        objc_msgSend(*v3, "_cleanupPushAndActivitiesStatesWhenNoSessionExists");
LABEL_56:
        objc_msgSend(*((id *)*v3 + 4), "resumeIfNecessary");
        *((_BYTE *)*v3 + 8) = 1;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB48], -1000, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_1();

        objc_msgSend(MEMORY[0x1E0CAAD28], "br_sharedProviderManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = v9;
        v53[1] = 3221225472;
        v53[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_153;
        v53[3] = &unk_1E875D850;
        v53[4] = *v3;
        objc_msgSend(v40, "signalErrorResolved:completionHandler:", v37, v53);

        __brc_leave_section(v58);
        goto LABEL_59;
      }
      if (!v5)
      {
        v28 = 0;
        goto LABEL_55;
      }
      if ((objc_msgSend((id)v5, "isEqualToString:", v10) & 1) != 0)
      {
        v25 = 0;
LABEL_36:
        memset(v55, 0, sizeof(v55));
        __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 569, v55);
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v55[0];
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2112;
          v63 = (uint64_t)v29;
          _os_log_debug_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Loading current on-disk account: %@%@", buf, 0x20u);
        }

        brc_bread_crumbs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v31;
          _os_log_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEFAULT, "[NOTICE] using account %@%@", buf, 0x16u);
        }

        v33 = *v3;
        if (*((_QWORD *)*v3 + 6))
        {
          if ((objc_msgSend(*((id *)*v3 + 6), "isEqualToString:", v5) & 1) != 0)
            goto LABEL_45;
          v33 = *v3;
        }
        if (objc_msgSend(v33, "_loadOnDiskAccountSessionWithError:", 0))
        {
          objc_storeStrong((id *)*v3 + 6, (id)v5);
LABEL_46:
          BRPostAccountTokenChangedNotification();
LABEL_47:
          if (objc_msgSend(*(id *)(a1 + 40), "isDataSeparatedAccount"))
          {
            v34 = *(void **)(a1 + 32);
            v35 = *(_QWORD *)(a1 + 40);
            v54 = 0;
            objc_msgSend(v34, "addFileProviderDomainForAccount:error:", v35, &v54);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v54;
            if (!v28)
              objc_msgSend(*((id *)*v3 + 4), "setFpDomain:", v36);

          }
          else
          {
            v28 = 0;
          }
          __brc_leave_section(v55);
          if (!v28)
            goto LABEL_56;
          goto LABEL_55;
        }
LABEL_45:
        if (!v25)
          goto LABEL_47;
        goto LABEL_46;
      }
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        v63 = (uint64_t)v43;
        _os_log_fault_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: disk account ID (%@) doesn't match system account ID (%@)%@", buf, 0x20u);
      }

    }
    else
    {
      memset(buf, 0, sizeof(buf));
      __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 524, buf);
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_3();

      __brc_leave_section((uint64_t *)buf);
    }
    objc_msgSend(*v3, "reloadSyncedFolderPoliciesDisableiCloudDesktop:", 1);
    v22 = -[BRCAccountSession initWithACAccountID:dbAccountDSID:salt:accountHandler:]([BRCAccountSession alloc], "initWithACAccountID:dbAccountDSID:salt:accountHandler:", *((_QWORD *)*v3 + 14), v5, 0, 0);
    v56[0] = v9;
    v56[1] = 3221225472;
    v56[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_151;
    v56[3] = &unk_1E875D500;
    v23 = dispatch_semaphore_create(0);
    v57 = v23;
    -[BRCAccountSession destroyLocalDataWaitingForFilesToBeUnlinked:completionBlock:](v22, "destroyLocalDataWaitingForFilesToBeUnlinked:completionBlock:", 0, v56);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    v24 = v10;

    goto LABEL_26;
  }
  if ((int)BRGetMigrationStatusForDSID() >= 2)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] setting the migration on the account because account is migrated - and waiting for ACAccountNotification plugin%@", buf, 0xCu);
    }

    objc_msgSend(*v3, "setMigrationStatus:forDSID:shouldUpdateAccount:shouldPostAccountChangedNotification:completion:", 2, v10, 1, 0, 0);
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v41;
    _os_log_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] migration is not accepted, not loading the account for %@%@", buf, 0x16u);
  }

  objc_msgSend(*v3, "_cleanupPushAndActivitiesStatesWhenNoSessionExists");
  v28 = 0;
LABEL_59:

}

uint64_t __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_2()
{
  uint64_t result;
  void *v1;
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = BRGetMigrationStatusForDSID();
  if ((int)result <= 1)
  {
    brc_bread_crumbs();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_1CBD43000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] setting the migration prefs because account is migrated%@", (uint8_t *)&v3, 0xCu);
    }

    return BRSetMigrationStatusForDSIDInPref();
  }
  return result;
}

intptr_t __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_151(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_153(uint64_t a1, void *a2)
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
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] signalErrorResolved for %@ finished - %@%@", (uint8_t *)&v7, 0x20u);
  }

}

- (id)addFileProviderDomainForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isDataSeparatedAccount") & 1) == 0)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler addFileProviderDomainForAccount:error:].cold.1();

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  v34 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  objc_msgSend(MEMORY[0x1E0D10E78], "br_getProviderIDForDataSeparated:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D10E78], "br_getDomainIdentifierForACAccountID:", self->_acAccountID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CAAD00]);
  objc_msgSend(v6, "accountDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:hidden:", v9, v11, CFSTR("Library/Mobile Documents"), 0);

  v13 = (void *)MEMORY[0x1E0CAAD28];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__BRCAccountHandler_addFileProviderDomainForAccount_error___block_invoke;
  v25[3] = &unk_1E875E768;
  v14 = v12;
  v26 = v14;
  v28 = &v29;
  v15 = v7;
  v27 = v15;
  objc_msgSend(v13, "addDomain:forProviderIdentifier:completionHandler:", v14, v8, v25);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v14;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_INFO, "[INFO] Waiting for fileprovider to add domain %@%@", buf, 0x16u);
  }

  v18 = brc_interval_to_nsec();
  v19 = dispatch_time(0, v18);
  if (dispatch_group_wait(v15, v19))
    __assert_rtn("-[BRCAccountHandler addFileProviderDomainForAccount:error:]", "BRCAccountHandler.m", 648, "timeout == 0");
  if (a4)
    *a4 = objc_retainAutorelease((id)v30[5]);
  v20 = v27;
  v21 = v14;

  _Block_object_dispose(&v29, 8);
  return v21;
}

void __59__BRCAccountHandler_addFileProviderDomainForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_error_impl(&dword_1CBD43000, v5, (os_log_type_t)0x90u, "[ERROR] Added domain %@ with error: %@%@", (uint8_t *)&v10, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)jetsamCloudDocsApps
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx jetsaming clients%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)__destroySessionWithIntents:(id)a3
{
  id v4;
  BRCAccountSession *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  dispatch_semaphore_t v24;
  BRCAccountSession *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  dispatch_time_t v36;
  intptr_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  BRCAccountSession *session;
  BRDSIDString *dbAccountDSID;
  int v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  const char *label;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  BRCAccountHandler *v62;
  BRCAccountSession *v63;
  id v64;
  NSObject *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  BRCAccountSession *v71;
  NSObject *v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE block[24];
  void *v84;
  NSObject *v85;
  id v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_session;
  if (!v5)
  {
    brc_bread_crumbs();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler __destroySessionWithIntents:].cold.5();

  }
  -[BRCAccountSession(LegacyAdditions) fsReader](v5, "fsReader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[BRCAccountSession fsEventsMonitors](v5, "fsEventsMonitors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v76 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "resume");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    }
    while (v9);
  }

  -[BRCAccountSession applyScheduler](v5, "applyScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  -[BRCAccountSession preventDatabaseFromBeingReused](v5, "preventDatabaseFromBeingReused");
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[BRCAccountHandler accountPath](self, "accountPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "brc_accountIDPathForAccountPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_13;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[BRCAccountHandler __destroySessionWithIntents:].cold.4();

  if ((BRCRecursiveRemove(v15) & 0x80000000) != 0)
  {
    v49 = *__error();
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, (os_log_type_t)0x90u))
      -[BRCAccountHandler __destroySessionWithIntents:].cold.3();

    *__error() = v49;
  }
  else
  {
LABEL_13:
    v61 = v15;
    v62 = self;
    -[BRCAccountSession stopDBWatcher](v5, "stopDBWatcher");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __49__BRCAccountHandler___destroySessionWithIntents___block_invoke;
    v73[3] = &unk_1E875E790;
    v20 = v18;
    v74 = v20;
    -[BRCAccountSession enumerateAppLibraries:](v5, "enumerateAppLibraries:", v73);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v21, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("session-watchdog", v22);

    v24 = dispatch_semaphore_create(0);
    v70[0] = v19;
    v70[1] = 3221225472;
    v70[2] = __49__BRCAccountHandler___destroySessionWithIntents___block_invoke_2;
    v70[3] = &unk_1E875D470;
    v63 = v5;
    v25 = v5;
    v71 = v25;
    v26 = v24;
    v72 = v26;
    v27 = v23;
    v28 = v70;
    v29 = (void *)MEMORY[0x1D17A6BE8]();
    v79 = 0uLL;
    v80 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v79);
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v65 = v26;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v52 = v79;
      label = dispatch_queue_get_label(v27);
      *(_DWORD *)block = 134218498;
      *(_QWORD *)&block[4] = v52;
      v26 = v65;
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v84 = v30;
      _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    v87 = v79;
    v88 = v80;
    *(_QWORD *)block = v19;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_3;
    v84 = &unk_1E875D578;
    v32 = v27;
    v85 = v32;
    v33 = v28;
    v86 = v33;
    dispatch_async(v32, block);

    objc_autoreleasePoolPop(v29);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "logoutTimeout");

    v36 = dispatch_time(0, 1000000000 * v35);
    v37 = dispatch_semaphore_wait(v26, v36);
    if (v37)
    {
      brc_bread_crumbs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[BRCAccountHandler __destroySessionWithIntents:].cold.2();

    }
    v59 = v35;
    v60 = v20;
    -[BRCAccountSession destroyLocalDataWithPristineContainerIDs:](v25, "destroyLocalDataWithPristineContainerIDs:", v20);
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = v4;
    v40 = v4;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v67 != v43)
            objc_enumerationMutation(v40);
          v45 = (void *)MEMORY[0x1E0CB3600];
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "URL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "__itemAtURL:didDisconnectWithPurposeID:", v46, CFSTR("com.apple.bird"));

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
      }
      while (v42);
    }

    if (v37)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timed out waiting for %u seconds for account session to close!"), v59);
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v58 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountHandler __destroySessionWithIntents:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 741, v58);
    }
    session = v62->_session;
    v62->_session = 0;

    dbAccountDSID = v62->_dbAccountDSID;
    v62->_dbAccountDSID = 0;

    v5 = v63;
    v4 = v64;
    v15 = v61;
  }

}

uint64_t __49__BRCAccountHandler___destroySessionWithIntents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "containerMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInInitialState"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return 1;
}

intptr_t __49__BRCAccountHandler___destroySessionWithIntents___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "close");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_destroyCurrentSessionSynchronously
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx destroying current session%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

uint64_t __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "dirPathForSyncedFolderType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35F8], "writingIntentWithURL:options:", v5, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  return 1;
}

void __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "__destroySessionWithIntents:", *(_QWORD *)(a1 + 40));
  }
  objc_sync_exit(obj);

}

void __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v3 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = a1;
  obj = *(id *)(a1 + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          v26 = 2112;
          v27 = v9;
          _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] got coordinated write access for %@%@", buf, 0x16u);

        }
        if (objc_msgSend(v3, "length"))
          v11 = CFSTR(", ");
        else
          v11 = &stru_1E8769030;
        objc_msgSend(v8, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@'%@'"), v11, v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v5);
  }

  if (v18)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v3;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v15;
      _os_log_fault_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_FAULT, "[CRIT] Can't acquire coordinated disconnect at {%@}: %@, proceeding anyway%@", buf, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(v17 + 56) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v17 + 48));

}

- (id)ubiquityTokenSalt
{
  BRCAccountHandler *v2;
  NSString *ubiquityTokenSalt;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSString *v12;
  NSString *v13;
  int v14;
  void *v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  char v28;
  NSString *v29;
  BOOL v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  ubiquityTokenSalt = v2->_ubiquityTokenSalt;
  if (ubiquityTokenSalt)
  {
    v4 = ubiquityTokenSalt;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[BRCAccountHandler accountPath](v2, "accountPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "ubiquityTokenSaltFilename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v9, 4, &v42);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v42;
  v12 = v2->_ubiquityTokenSalt;
  v2->_ubiquityTokenSalt = (NSString *)v10;

  v13 = v2->_ubiquityTokenSalt;
  if (v13)
  {
    v4 = v13;

    goto LABEL_5;
  }
  objc_msgSend(v11, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_13;
  }
  v17 = objc_msgSend(v11, "code") == 260;

  if (!v17)
  {
LABEL_13:
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      -[BRCAccountHandler ubiquityTokenSalt].cold.2();

    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler ubiquityTokenSalt].cold.1();

  }
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v22;
    _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] generating new ubiquity token%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v2->_ubiquityTokenSalt;
  v2->_ubiquityTokenSalt = (NSString *)v25;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v11;
  v28 = objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v41);
  v4 = v41;

  if ((v28 & 1) != 0)
  {
    v29 = v2->_ubiquityTokenSalt;
    v40 = v4;
    v30 = -[NSString writeToURL:atomically:encoding:error:](v29, "writeToURL:atomically:encoding:error:", v9, 1, 4, &v40);
    v31 = v40;

    if (v30)
    {
      dispatch_get_global_queue(0, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __38__BRCAccountHandler_ubiquityTokenSalt__block_invoke;
      v38[3] = &unk_1E875D500;
      v39 = v9;
      v32 = v9;
      dispatch_async(v4, v38);

    }
    else
    {
      brc_bread_crumbs();
      v4 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        objc_msgSend(v9, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v44 = v37;
        v45 = 2112;
        v46 = v31;
        v47 = 2112;
        v48 = v4;
        _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] failed writing salt data to '%@': %@%@", buf, 0x20u);

      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v33 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      objc_msgSend(v7, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v44 = v36;
      v45 = 2112;
      v46 = v4;
      v47 = 2112;
      v48 = v33;
      _os_log_error_impl(&dword_1CBD43000, v34, (os_log_type_t)0x90u, "[ERROR] failed creating salt directory '%@': %@%@", buf, 0x20u);

    }
  }
  v14 = 1;
LABEL_6:
  objc_sync_exit(v2);

  if (v14)
    v4 = v2->_ubiquityTokenSalt;
  return v4;
}

void __38__BRCAccountHandler_ubiquityTokenSalt__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17A6BE8]();
  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0C999D8];
  v10 = 0;
  v5 = objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v4, &v10);
  v6 = v10;
  if ((v5 & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] failed excluding salt data at '%@' from backups: %@%@", buf, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)checkEnoughDiskSpaceToBeFunctional
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCAccountHandler checkEnoughDiskSpaceToBeFunctional].cold.1();

  v10 = 1;
  if (v5)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "minimumDiskSpaceRequiredToBeFunctional");

    if (objc_msgSend(v5, "unsignedLongLongValue") < v9)
      v10 = 0;
  }

  return v10;
}

- (unsigned)_handleOpenError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "brc_isOutOfSpaceError") & 1) != 0
    || (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 85) & 1) != 0
    || !-[BRCAccountHandler checkEnoughDiskSpaceToBeFunctional](self, "checkEnoughDiskSpaceToBeFunctional"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _handleOpenError:].cold.1();

    self->_doesNotHaveEnoughDiskSpaceToBeFunctional = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 121))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _handleOpenError:].cold.2();

    v7 = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 99))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _handleOpenError:].cold.3();

    v7 = 5;
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "br_isCloudDocsErrorCode:", 81) & 1) == 0
    && !objc_msgSend(v4, "br_isCloudDocsErrorCode:", 92))
  {
    goto LABEL_29;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v4, "underlyingErrors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (!v14)
    goto LABEL_28;
  v15 = v14;
  v16 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v50 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      if (objc_msgSend(v18, "br_isPOSIXErrorCode:", 13))
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        v7 = 2;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _handleOpenError:].cold.6();
LABEL_50:

LABEL_51:
        goto LABEL_11;
      }
      if (objc_msgSend(v18, "br_isNSXPCConnectionError"))
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _handleOpenError:].cold.7();
        goto LABEL_49;
      }
      if (objc_msgSend(v18, "fp_isFileProviderError:", -2001))
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _handleOpenError:].cold.8();
LABEL_49:
        v7 = 5;
        goto LABEL_50;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  }
  while (v15);
LABEL_28:

LABEL_29:
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 116))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v4;
      v57 = 2112;
      v58 = v19;
      _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got %@ while opening account. Exiting without an error%@", buf, 0x16u);
    }

    v7 = 2;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "br_isCloudDocsErrorCode:", 100))
    goto LABEL_64;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "underlyingErrors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (!v21)
    goto LABEL_63;
  v22 = v21;
  v23 = *(_QWORD *)v46;
LABEL_36:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v46 != v23)
      objc_enumerationMutation(v13);
    v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v24);
    if (objc_msgSend(v25, "br_isCocoaErrorCode:", 4101))
      break;
    if (v22 == ++v24)
    {
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (!v22)
        goto LABEL_63;
      goto LABEL_36;
    }
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v25, "underlyingErrors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (!v28)
    goto LABEL_62;
  v29 = v28;
  v30 = *(_QWORD *)v42;
  v31 = *MEMORY[0x1E0DE81E8];
  while (2)
  {
    v32 = 0;
    while (2)
    {
      if (*(_QWORD *)v42 != v30)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v32);
      if ((objc_msgSend(v33, "fp_isFileProviderInternalError:", 12) & 1) != 0
        || (objc_msgSend(v33, "domain"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v35 = objc_msgSend(v34, "isEqualToString:", v31),
            v34,
            v35))
      {
        brc_bread_crumbs();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _handleOpenError:].cold.4();

        v7 = 5;
        goto LABEL_71;
      }
      if (objc_msgSend(v33, "br_isPOSIXErrorCode:", 28))
      {
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 1;
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _handleOpenError:].cold.5();

        self->_doesNotHaveEnoughDiskSpaceToBeFunctional = 1;
LABEL_71:

        goto LABEL_51;
      }
      if (v29 != ++v32)
        continue;
      break;
    }
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v29)
      continue;
    break;
  }
LABEL_62:

LABEL_63:
LABEL_64:
  v7 = 6;
LABEL_11:

  return v7;
}

- (id)waitForSessionDBLoadingBarrier
{
  BRCBarrier *v3;
  BRCAccountSession *loadingSession;
  BRCAccountSession *v5;
  void *v6;

  -[BRCBarrier waitForBarrier](self->_accountLoadingBarrier, "waitForBarrier");
  v3 = self->_accountLoadingBarrier;
  objc_sync_enter(v3);
  loadingSession = self->_loadingSession;
  if (!loadingSession)
    loadingSession = self->_session;
  v5 = loadingSession;
  objc_sync_exit(v3);

  -[BRCAccountSession dbLoadingBarrier](v5, "dbLoadingBarrier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waitForBarrier");

  return v5;
}

- (unsigned)_tryToOpenSession:(id)a3 error:(id *)a4
{
  id v7;
  char v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const char *v16;
  id v17[3];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_storeStrong((id *)&self->_loadingSession, a3);
  -[BRCBarrier signalBarrier](self->_accountLoadingBarrier, "signalBarrier");
  v17[0] = 0;
  v8 = objc_msgSend(v7, "openWithError:pushWorkloop:", v17, self->_pushWorkloop);
  v9 = v17[0];
  if ((v8 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      -[BRCAccountHandler _tryToOpenSession:error:].cold.5();

    v10 = -[BRCAccountHandler _handleOpenError:](self, "_handleOpenError:", v9);
    v9 = v9;
    if (v9)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v16 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v19 = "-[BRCAccountHandler _tryToOpenSession:error:]";
        v20 = 2080;
        if (!a4)
          v16 = "(ignored by caller)";
        v21 = v16;
        v22 = 2112;
        v23 = v9;
        v24 = 2112;
        v25 = v13;
        _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
  return v10;
}

- (BOOL)_shouldRetryOpenSession:(unsigned __int8)a3
{
  return a3 == 6 || (a3 & 0xFE) == 4;
}

- (BOOL)_shouldResetLocalData:(id)a3
{
  return objc_msgSend(a3, "br_isCloudDocsErrorCode:", 100);
}

- (BOOL)_loadOnDiskAccountSessionWithError:(id *)a3
{
  BRCAccountSession *v4;
  NSString *acAccountID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BRCAccountSession *v10;
  uint64_t v11;
  id v12;
  BRCBarrier *v13;
  BRCAccountSession *loadingSession;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[BRCAccountHandler reloadSyncedFolderPolicies](self, "reloadSyncedFolderPolicies", a3);
  v4 = [BRCAccountSession alloc];
  acAccountID = self->_acAccountID;
  v6 = (void *)MEMORY[0x1E0D10E58];
  -[BRCAccountHandler accountPath](self, "accountPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "brc_dbAccountDSIDForPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountHandler ubiquityTokenSalt](self, "ubiquityTokenSalt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BRCAccountSession initWithACAccountID:dbAccountDSID:salt:accountHandler:](v4, "initWithACAccountID:dbAccountDSID:salt:accountHandler:", acAccountID, v8, v9, self);

  v31 = 0;
  v11 = -[BRCAccountHandler _tryToOpenSession:error:](self, "_tryToOpenSession:error:", v10, &v31);
  v12 = v31;
  if ((_DWORD)v11)
  {
    if (-[BRCAccountHandler _shouldRetryOpenSession:](self, "_shouldRetryOpenSession:", v11))
    {
      if (-[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:](self, "_loadOnDiskAccountSessionSecondTry:prevError:", v10, v12))
      {
        goto LABEL_4;
      }
    }
    else
    {
      if (-[BRCAccountHandler _shouldResetLocalData:](self, "_shouldResetLocalData:", v12))
      {
        -[BRCAccountSession closeAndResetLocalStateWithDescription:error:](v10, "closeAndResetLocalStateWithDescription:error:", CFSTR("Reset Local State"), v12);
      }
      else
      {
        -[BRCAccountSession close](v10, "close");
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v12;
          v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Capturing account session open error of the first try: %@%@", buf, 0x16u);
        }

        -[BRCAccountSession captureSessionOpenFailedInfoWithError:](v10, "captureSessionOpenFailedInfoWithError:", v12);
      }
      if ((_DWORD)v11 == 2)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _loadOnDiskAccountSessionWithError:].cold.3();

        exit(0);
      }
      if ((_DWORD)v11 == 3)
      {
        objc_msgSend(v12, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SqliteSQL"));
        v24 = objc_claimAutoreleasedReturnValue();

        abc_report_panic_with_signature();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open account: %@ (underlying: %@, sql: %@)\n"), v12, v22, v24);
        objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

        brc_append_system_info_to_message();
        v27 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
        __assert_rtn("-[BRCAccountHandler _loadOnDiskAccountSessionWithError:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 1122, v27);
      }
      if ((_DWORD)v11 != 1)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[BRCAccountHandler _loadOnDiskAccountSessionWithError:].cold.2();
        v17 = 0;
        goto LABEL_6;
      }
    }
    v17 = 0;
    goto LABEL_22;
  }
LABEL_4:
  v13 = self->_accountLoadingBarrier;
  objc_sync_enter(v13);
  objc_storeStrong((id *)&self->_session, v10);
  loadingSession = self->_loadingSession;
  self->_loadingSession = 0;

  objc_sync_exit(v13);
  v15 = -[BRCAccountHandler ubiquityTokenSalt](self, "ubiquityTokenSalt");
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 1;
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[BRCAccountHandler _loadOnDiskAccountSessionWithError:].cold.1();
LABEL_6:

LABEL_22:
  return v17;
}

- (BOOL)_loadOnDiskAccountSessionSecondTry:(id)a3 prevError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  const __CFString *v11;
  unsigned int v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  void *v22;
  int *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  id v45;
  char v46;
  const __CFString *v47;
  void *v48;
  BRCAccountHandler *v49;
  id v50;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.10();

  }
  if (objc_msgSend(v7, "br_isCloudDocsErrorCode:", 81))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.7();
    v10 = 0;
    v11 = CFSTR("CreateFPFSDomain");
  }
  else if (objc_msgSend(v7, "br_isCloudDocsErrorCode:", 92))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.8();
    v10 = 0;
    v11 = CFSTR("ImportFPFSDomain");
  }
  else
  {
    objc_msgSend(v6, "closeAndResetLocalStateWithDescription:error:", CFSTR("Cannot open account session"), v7);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.9();
    v11 = 0;
  }

  v50 = 0;
  v12 = -[BRCAccountHandler _tryToOpenSession:error:](self, "_tryToOpenSession:error:", v6, &v50);
  v13 = v50;
  if (v12)
  {
    v46 = v10;
    v47 = v11;
    v48 = v6;
    v45 = v7;
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.6();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = self;
    -[BRCAccountHandler accountPath](self, "accountPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", *MEMORY[0x1E0D10D00]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i != 5; ++i)
    {
      v20 = objc_retainAutorelease(v18);
      v21 = open((const char *)objc_msgSend(v20, "fileSystemRepresentation"), 4);
      v22 = (void *)MEMORY[0x1E0CB3940];
      if ((v21 & 0x80000000) != 0)
      {
        v23 = __error();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("#%lu FAIL %s"), i, strerror(*v23));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%lu fd = %d"), i, v21);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v24);

    }
    v25 = v47;
    v6 = v48;
    if ((v46 & 1) != 0)
    {
      if ((objc_msgSend(v13, "br_isCloudDocsErrorCode:", 81) & 1) != 0)
      {
        v25 = CFSTR("CreateFPFSDomain");
      }
      else
      {
        if (!objc_msgSend(v13, "br_isCloudDocsErrorCode:", 92))
          goto LABEL_27;
        v25 = CFSTR("ImportFPFSDomain");
      }
    }
    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "captureLogsForOperationType:ofSubtype:forError:waitForCompletion:", CFSTR("OpenAccountSession"), v25, v13, 1);

LABEL_27:
    objc_msgSend(v13, "userInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SqliteSQL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[BRCAccountHandler _shouldResetLocalData:](v49, "_shouldResetLocalData:", v13))
    {
      objc_msgSend(v48, "closeAndResetLocalStateWithDescription:error:", CFSTR("Reset Local State"), v13);
    }
    else
    {
      objc_msgSend(v48, "close");
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
        -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.5();

      objc_msgSend(v48, "captureSessionOpenFailedInfoWithError:", v13);
    }
    if (v12 <= 6)
    {
      if (((1 << v12) & 0x12) != 0)
      {
LABEL_39:
        if (v49->_doesNotHaveEnoughDiskSpaceToBeFunctional)
        {
          brc_bread_crumbs();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.1();

        }
        v7 = v45;
        goto LABEL_44;
      }
      if (((1 << v12) & 0x24) != 0)
      {
        brc_bread_crumbs();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[BRCAccountHandler _loadOnDiskAccountSessionWithError:].cold.3();

        exit(0);
      }
      if (((1 << v12) & 0x48) != 0)
      {
        abc_report_panic_with_signature();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Still unable to open account after attempted reset: %@ (underlying: %@, sql: %@)\nopen result: %@"), v13, v28, v30, v16);
        objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

        brc_append_system_info_to_message();
        v44 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
        __assert_rtn("-[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 1216, v44);
      }
    }
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.2();

    goto LABEL_39;
  }
LABEL_44:

  return v12 == 0;
}

- (BOOL)_createCurrentAccountSessionWithID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  BRCAccountSession *session;
  uint64_t v23[3];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCAccountHandler _createCurrentAccountSessionWithID:error:]", 1233, v23);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v25 = v23[0];
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating account session for %@%@", buf, 0x20u);
  }

  if (self->_session)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler _createCurrentAccountSessionWithID:error:].cold.2();

    if (self->_session)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        *(_DWORD *)buf = 138412546;
        v25 = (uint64_t)session;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] we are already logged in %@%@", buf, 0x16u);
      }

      -[BRCAccountHandler _destroyCurrentSessionSynchronously](self, "_destroyCurrentSessionSynchronously");
    }
  }
  v9 = (void *)MEMORY[0x1E0D10E58];
  -[BRCAccountHandler accountPath](self, "accountPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "brc_dbAccountDSIDForPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0D10E58];
    -[BRCAccountHandler accountPath](self, "accountPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brc_dbAccountDSIDForPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v6);

    if ((v12 & 1) != 0)
      goto LABEL_10;
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler _createCurrentAccountSessionWithID:error:].cold.1();

  }
LABEL_10:
  if (-[BRCAccountHandler setDBAccountDSID:](self, "setDBAccountDSID:", v6))
    v16 = -[BRCAccountHandler _loadOnDiskAccountSessionWithError:](self, "_loadOnDiskAccountSessionWithError:", a4);
  else
    v16 = 0;
  __brc_leave_section(v23);

  return v16;
}

- (void)_handleAccountWillChange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [_dbAccountDSID isEqualToString:_session.accountDSID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAccountDidChange
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] can't create account session: %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)_migrateAccountIfNecessaryForAccountDSID:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  BRCAccountMigrationChecker *v6;
  void *v7;
  NSObject *v8;
  BRCAccountMigrator *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((int)BRGetMigrationStatusForDSID() <= 1)
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
      _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Asking account status for %@%@", (uint8_t *)&v10, 0x16u);
    }

    v6 = -[BRCAccountOnlinePerformer initWithDSID:]([BRCAccountMigrationChecker alloc], "initWithDSID:", v3);
    -[BRCAccountOnlinePerformer resumeAndAutoClose](v6, "resumeAndAutoClose");

  }
  if (BRGetMigrationStatusForDSID() == 2)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Triggering migration for %@%@", (uint8_t *)&v10, 0x16u);
    }

    v9 = -[BRCAccountOnlinePerformer initWithDSID:]([BRCAccountMigrator alloc], "initWithDSID:", v3);
    -[BRCAccountOnlinePerformer resumeAndAutoClose](v9, "resumeAndAutoClose");

  }
}

+ (id)currentiCloudAccount
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_accountForCurrentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[BRCAccountHandler currentiCloudAccount].cold.3();

  if (v4)
  {
    if ((objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]) & 1) == 0)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[BRCAccountHandler currentiCloudAccount].cold.2();

    }
    if ((objc_msgSend(v4, "br_isEnabledForCloudDocs") & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        +[BRCAccountHandler currentiCloudAccount].cold.1();

    }
    objc_msgSend(v4, "br_dsid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_migrateAccountIfNecessaryForAccountDSID:", v11);

  }
  return v4;
}

+ (id)currentiCloudAccountID
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "currentiCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)waitForSessionLoading
{
  void *v4;
  NSObject *v5;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (self->_finishedLoading)
    return 1;
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_216);
  if (self->_finishedLoading)
    return 1;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[BRCAccountHandler waitForSessionLoading].cold.1();

  return self->_finishedLoading;
}

- (BOOL)destroyCurrentAccountSynchronously
{
  void *v3;
  BRCAccountSession *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D10E58], "brc_dbAccountDSIDForPath:", self->_accountPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[BRCAccountSession initWithACAccountID:dbAccountDSID:salt:accountHandler:]([BRCAccountSession alloc], "initWithACAccountID:dbAccountDSID:salt:accountHandler:", self->_acAccountID, v3, 0, 0);
    -[BRCAccountSession preventDatabaseFromBeingReused](v4, "preventDatabaseFromBeingReused");
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[BRCAccountHandler accountPath](self, "accountPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_accountIDPathForAccountPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && (BRCRecursiveRemove(v7) & 0x80000000) != 0)
    {
      v9 = *__error();
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = 138413058;
        v14 = v3;
        v15 = 2112;
        v16 = v7;
        v17 = 1024;
        v18 = v9;
        v19 = 2112;
        v20 = v10;
        _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] can't remove account belonging to account %@ at %@ %{errno}d%@", (uint8_t *)&v13, 0x26u);
      }

      v8 = 0;
      *__error() = v9;
    }
    else
    {
      -[BRCAccountSession destroyLocalData](v4, "destroyLocalData");
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateAccountToDSID:(id)a3
{
  BRDSIDString *v5;
  BRDSIDString *dbAccountDSID;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  BRDSIDString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (BRDSIDString *)a3;
  dbAccountDSID = self->_dbAccountDSID;
  if (dbAccountDSID == v5 || -[BRDSIDString isEqualToString:](dbAccountDSID, "isEqualToString:", v5))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCAccountHandler _updateAccountToDSID:].cold.1();

  }
  else
  {
    -[BRCAccountHandler _handleAccountWillChange](self, "_handleAccountWillChange");
    v9 = (void *)MEMORY[0x1E0D10E58];
    -[BRCAccountHandler accountPath](self, "accountPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "brc_dbAccountDSIDForPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || (objc_msgSend(v7, "isEqualToString:", v5) & 1) != 0)
      goto LABEL_14;
    if (v5)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = 138412802;
        v14 = v7;
        v15 = 2112;
        v16 = v5;
        v17 = 2112;
        v18 = v11;
        _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning up previous session belonging to account %@, to make room for new account %@%@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[BRCAccountHandler _updateAccountToDSID:].cold.2();
    }

    -[BRCAccountHandler reloadSyncedFolderPoliciesDisableiCloudDesktop:](self, "reloadSyncedFolderPoliciesDisableiCloudDesktop:", 1);
    if (-[BRCAccountHandler destroyCurrentAccountSynchronously](self, "destroyCurrentAccountSynchronously"))
    {
LABEL_14:
      objc_storeStrong((id *)&self->_dbAccountDSID, a3);
      self->_hasSetMigrationComplete = 0;
      -[BRCAccountHandler _handleAccountDidChange](self, "_handleAccountDidChange");
    }
  }

}

- (BOOL)destroySessionSynchronously
{
  NSObject *queue;
  dispatch_block_t v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BRCAccountHandler_destroySessionSynchronously__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(queue, v4);

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_217);
  return 1;
}

uint64_t __48__BRCAccountHandler_destroySessionSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountToDSID:", 0);
}

- (BOOL)createAccountSessionWithDSID:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *queue;
  id v7;
  dispatch_block_t v8;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__BRCAccountHandler_createAccountSessionWithDSID_error___block_invoke;
  v10[3] = &unk_1E875D470;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v10);
  dispatch_async(queue, v8);

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_218);
  return 1;
}

uint64_t __56__BRCAccountHandler_createAccountSessionWithDSID_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountToDSID:", *(_QWORD *)(a1 + 40));
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 completion:(id)a6
{
  -[BRCAccountHandler setMigrationStatus:forDSID:shouldUpdateAccount:shouldPostAccountChangedNotification:completion:](self, "setMigrationStatus:forDSID:shouldUpdateAccount:shouldPostAccountChangedNotification:completion:", a3, a4, a5, 1, a6);
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 shouldPostAccountChangedNotification:(BOOL)a6 completion:(id)a7
{
  id v11;
  id v12;
  dispatch_group_t v13;
  void *v14;
  OS_dispatch_queue *migrationStatusSetterQueue;
  id v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD *v24;
  NSObject *v25;
  id v26;
  const char *label;
  uint64_t v28;
  id v29;
  _QWORD v31[5];
  id v32;
  _QWORD *v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NSObject *v38;
  _QWORD *v39;
  char v40;
  BOOL v41;
  _QWORD v42[3];
  char v43;
  __int128 v44;
  uint64_t v45;
  _BYTE block[24];
  void *v47;
  NSObject *v48;
  id v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a7;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v13 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidateAccountForPersonaCache");
  migrationStatusSetterQueue = self->_migrationStatusSetterQueue;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke;
  v35[3] = &unk_1E875E890;
  v39 = v42;
  v29 = v11;
  v36 = v29;
  v40 = a3;
  v41 = a5;
  v16 = v14;
  v37 = v16;
  v38 = v13;
  v17 = v38;
  v18 = migrationStatusSetterQueue;
  v19 = v35;
  v20 = (void *)MEMORY[0x1D17A6BE8]();
  v44 = 0uLL;
  v45 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_group_async_with_logs", 293, &v44);
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v28 = v44;
    label = dispatch_queue_get_label(v18);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v28;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v47 = v21;
    _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v50 = v44;
  v51 = v45;
  *(_QWORD *)block = MEMORY[0x1E0C809B0];
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_group_async_with_logs_block_invoke;
  v47 = &unk_1E875D578;
  v23 = v18;
  v48 = v23;
  v24 = v19;
  v49 = v24;
  dispatch_group_async(v17, v23, block);

  objc_autoreleasePoolPop(v20);
  dispatch_get_global_queue(0, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_221;
  v31[3] = &unk_1E875E8B8;
  v32 = v12;
  v33 = v42;
  v34 = a6;
  v31[4] = self;
  v26 = v12;
  dispatch_group_notify(v17, v25, v31);

  _Block_object_dispose(v42, 8);
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = BRSetMigrationStatusForDSIDInPref() != 0;
  if (*(_BYTE *)(a1 + 65) && *(char *)(a1 + 64) >= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "br_accountForCurrentPersona");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "br_dsid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      if ((objc_msgSend(v2, "br_isCloudDocsMigrated") & 1) != 0)
      {
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_cold_1();

      }
      else
      {
        objc_msgSend(v2, "br_setCloudDocsMigrated:", 1);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v9 = *(void **)(a1 + 40);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_219;
        v11[3] = &unk_1E875E868;
        v12 = v2;
        v13 = *(id *)(a1 + 48);
        objc_msgSend(v9, "saveVerifiedAccount:withCompletionHandler:", v12, v11);

        v4 = v12;
      }
    }
    else
    {
      if (v2)
      {
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          v7 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
          v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
          *(_DWORD *)buf = 136315650;
          v15 = v7;
          v16 = 2080;
          v17 = v8;
          v18 = 2112;
          v19 = v4;
          _os_log_fault_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: the main account (%s) doesn't match the one we have (%s)%@", buf, 0x20u);
        }
      }
      else
      {
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
          *(_DWORD *)buf = 136315394;
          v15 = v10;
          v16 = 2112;
          v17 = (uint64_t)v4;
          _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] we seem to have logged out while migrating account (%s)%@", buf, 0x16u);
        }
      }

    }
  }
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_219(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_219_cold_1();
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1CBD43000, v7, (os_log_type_t)0x90u, "[ERROR] can't set the migrated bit on %@: %@%@", (uint8_t *)&v9, 0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_221(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && *(_BYTE *)(a1 + 56)
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    BRPostAccountTokenChangedNotification();
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)markMigrationCompletedForDSID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  const char *label;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  uint64_t v20;
  _BYTE block[24];
  void *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke;
  v17[3] = &unk_1E875D470;
  v17[4] = self;
  v7 = v4;
  v18 = v7;
  v8 = v5;
  v9 = v17;
  v10 = (void *)MEMORY[0x1D17A6BE8]();
  v19 = 0uLL;
  v20 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v19);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = v19;
    label = dispatch_queue_get_label(v8);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v15;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v22 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v25 = v19;
  v26 = v20;
  *(_QWORD *)block = v6;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke;
  v22 = &unk_1E875D578;
  v13 = v8;
  v23 = v13;
  v14 = v9;
  v24 = v14;
  dispatch_async(v13, block);

  objc_autoreleasePoolPop(v10);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    objc_msgSend(v2, "br_accountForCurrentPersona");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "br_dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      if (objc_msgSend(v4, "br_isCloudDocsMigrationComplete")
        && objc_msgSend(v4, "br_isCloudDocsMigrated"))
      {
        brc_bread_crumbs();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_cold_1();

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
        BRPostAccountTokenChangedNotification();
      }
      else
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v22 = (uint64_t)v5;
          v23 = 2112;
          v24 = (uint64_t)v10;
          _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] setting migration complete on %@%@", buf, 0x16u);
        }

        objc_msgSend(v4, "br_setCloudDocsMigrationComplete:", 1);
        objc_msgSend(v4, "br_setCloudDocsMigrated:", 1);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_222;
        v18[3] = &unk_1E875E868;
        v12 = *(_QWORD *)(a1 + 32);
        v19 = v4;
        v20 = v12;
        v4 = v4;
        objc_msgSend(v3, "saveVerifiedAccount:withCompletionHandler:", v4, v18);

      }
    }
    else
    {
      if (!v4)
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
          *(_DWORD *)buf = 136315394;
          v22 = v15;
          v23 = 2112;
          v24 = (uint64_t)v13;
          _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] we seem to have logged out while migrating account (%s)%@", buf, 0x16u);
        }

        goto LABEL_16;
      }
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v16 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
        v17 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
        *(_DWORD *)buf = 136315650;
        v22 = v16;
        v23 = 2080;
        v24 = v17;
        v25 = 2112;
        v26 = v8;
        _os_log_fault_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: the main account (%s) doesn't match the one we have (%s)%@", buf, 0x20u);
      }

    }
    v13 = v5;
    v5 = v4;
LABEL_16:

  }
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_222(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 72) = 1;
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_222_cold_1();

    BRPostAccountTokenChangedNotification();
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] can't set the migrated bit on %@: %@%@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (void)reloadSyncedFolderPolicies
{
  -[BRCAccountHandler reloadSyncedFolderPoliciesDisableiCloudDesktop:](self, "reloadSyncedFolderPoliciesDisableiCloudDesktop:", 0);
}

- (void)reloadSyncedFolderPoliciesDisableiCloudDesktop:(BOOL)a3
{
  -[BRCAccountHandler setSyncPolicy:forSyncedFolderType:](self, "setSyncPolicy:forSyncedFolderType:", -1, 1);
  BRPostAccountTokenChangedNotification();
}

- (int64_t)syncPolicyforSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *syncPolicyByFolderType;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  }
  syncPolicyByFolderType = self->_syncPolicyByFolderType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](syncPolicyByFolderType, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.1();

  }
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (void)setSyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *syncPolicyByFolderType;
  void *v11;
  void *v12;
  NSObject *v13;

  if (a3 != -1 && a3 != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler setSyncPolicy:forSyncedFolderType:].cold.2();

  }
  if (a4 != 1)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  syncPolicyByFolderType = self->_syncPolicyByFolderType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](syncPolicyByFolderType, "setObject:forKeyedSubscript:", v9, v11);

}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (BOOL)doesNotHaveEnoughDiskSpaceToBeFunctional
{
  return self->_doesNotHaveEnoughDiskSpaceToBeFunctional;
}

- (void)setDoesNotHaveEnoughDiskSpaceToBeFunctional:(BOOL)a3
{
  self->_doesNotHaveEnoughDiskSpaceToBeFunctional = a3;
}

- (NSString)acAccountID
{
  return self->_acAccountID;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (NSString)accountPath
{
  return self->_accountPath;
}

- (OS_dispatch_workloop)pushWorkloop
{
  return self->_pushWorkloop;
}

- (NSError)loggedOutError
{
  return self->_loggedOutError;
}

- (void)setLoggedOutError:(id)a3
{
  objc_storeStrong((id *)&self->_loggedOutError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedOutError, 0);
  objc_storeStrong((id *)&self->_pushWorkloop, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_accountLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_syncPolicyByFolderType, 0);
  objc_storeStrong((id *)&self->_migrationStatusSetterQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dbAccountDSID, 0);
  objc_storeStrong((id *)&self->_loadingSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_accountPath, 0);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:userInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] received a managed restriction changed notification - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)setDBAccountDSID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] can't delete account file %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)setDBAccountDSID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] can't write account ID: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)setDBAccountDSID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] failed to create account path: %@%@");
  OUTLINED_FUNCTION_2();
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(v0 + 112);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Signaling FP to resolve authentication errors for account %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: not loading account %@ because we cannot create set account id on disk%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx deleting account on disk%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)addFileProviderDomainForAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [account isDataSeparatedAccount]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__destroySessionWithIntents:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] timed out waiting for %u seconds for account session to close!%@");
  OUTLINED_FUNCTION_2();
}

- (void)__destroySessionWithIntents:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] can't remove account %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)__destroySessionWithIntents:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] removing '%@'%@");
  OUTLINED_FUNCTION_2();
}

- (void)__destroySessionWithIntents:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: session%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] acquired coordinated disconnect at {%@}%@");
  OUTLINED_FUNCTION_2();
}

- (void)ubiquityTokenSalt
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] failed loading salt: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)checkEnoughDiskSpaceToBeFunctional
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Disk space available %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] No space on disk%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Volume not supported by FPFS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Got %@ --> exit without failure.%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Got %@ while trying to reimport items under the root container%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] No space on disk to reimport items under the root container: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> exit without failure%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> FP probably crashing -> exit without failure%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenError:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> something wrong on FP -> exit without failure%@");
  OUTLINED_FUNCTION_2();
}

- (void)_tryToOpenSession:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v6, v4, "[ERROR] Your database is from the future, disabling iCloud Drive (%@)%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_tryToOpenSession:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v6, v4, "[ERROR] Your database is from FPFS but we are in Legacy, disabling iCloud Drive (%@)%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_tryToOpenSession:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v6, v4, "[ERROR] %@%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_tryToOpenSession:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to open account session: Exception [%@]%@");
  OUTLINED_FUNCTION_2();
}

- (void)_tryToOpenSession:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to open account session: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionWithError:.cold.1()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "sessionDirPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Starting up at %@%@", v3, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)_loadOnDiskAccountSessionWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: errorHandlingOnFailure == BRCFail%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Exit bird without panic%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Looks like we hit disk space issue on second try --> don't panic or exit%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: errorHandlingOnFailure == BRCRetryOrFail || errorHandlingOnFailure == BRCFail%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Capturing account session second open error: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] Failed to open account session second time%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Failed adding FPFS domain. Skipping database reset and trying to open again%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Failed import FPFS domain. Skipping database reset and trying to open again%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Local session state has been resetted, try opening the session for the second time%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: prevError%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createCurrentAccountSessionWithID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [BRDSIDString brc_dbAccountDSIDForPath:self.accountPath] == nil || [[BRDSIDString brc_dbAccountDSIDForPath:self.accountPath] isEqualToString:accountID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createCurrentAccountSessionWithID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _session == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)currentiCloudAccount
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] current account is: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)waitForSessionLoading
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _finishedLoading%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAccountToDSID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Account hasn't really changed, do nothing%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAccountToDSID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Cleaning up session on disk belonging to account %@%@");
  OUTLINED_FUNCTION_2();
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] account property is already set%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_219_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] saved the migration bit%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] migration already completed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_222_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] saved the bit%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncPolicyforSyncedFolderType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: syncPolicy%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncPolicyforSyncedFolderType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: folderType >= BRCSyncedFolderTypeMin && folderType <= BRCSyncedFolderTypeMax%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSyncPolicy:forSyncedFolderType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: syncPolicy == BRCSyncedFolderPolicyEnabled || syncPolicy == BRCSyncedFolderPolicyDisabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
