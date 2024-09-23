@implementation BRCDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCClientPrivilegesDescriptor *v10;
  NSObject *v11;
  const char *v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  BRCClientPrivilegesDescriptor *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  BRCXPCTokenClient *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  BRCXPCTokenClient *v27;
  uint64_t v29;
  uid_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  NSObject *v35;
  id v36;
  _QWORD v37[4];
  NSObject *p_super;
  id v39;
  _OWORD v40[2];
  uint64_t v41[3];
  uint8_t buf[4];
  BRCClientPrivilegesDescriptor *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uid_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = (NSXPCListener *)a3;
  v7 = a4;
  memset(v41, 0, sizeof(v41));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon listener:shouldAcceptNewConnection:]", 961, v41);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v29 = v41[0];
    v30 = geteuid();
    *(_DWORD *)buf = 134218754;
    v43 = (BRCClientPrivilegesDescriptor *)v29;
    v44 = 2112;
    v45 = v7;
    v46 = 1024;
    v47 = v30;
    v48 = 2112;
    v49 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received new XPC connection: %@, for uid: %u%@", buf, 0x26u);
  }

  if (!self->_shouldRejectXPCCalls)
  {
    dispatch_sync((dispatch_queue_t)self->_xpcListenersReadyQueue, &__block_literal_global_100);
    +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "boostFileProvider");

    dispatch_sync((dispatch_queue_t)self->_accountReadyQueue, &__block_literal_global_102);
    if (!self->_disableAccountChangesHandling)
    {
      +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_isDeviceUnlocked");

      if ((v16 & 1) == 0)
      {
        brc_bread_crumbs();
        v10 = (BRCClientPrivilegesDescriptor *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        *(_DWORD *)buf = 138412290;
        v43 = v10;
        v12 = "[WARNING] Denying xpc connection because the device is locked%@";
        goto LABEL_6;
      }
    }
    v17 = [BRCClientPrivilegesDescriptor alloc];
    if (v7)
      objc_msgSend(v7, "auditToken");
    else
      memset(v40, 0, sizeof(v40));
    v10 = -[BRCClientPrivilegesDescriptor initWithAuditToken:](v17, "initWithAuditToken:", v40);
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isInSyncBubble"))
    {
      v19 = -[BRCClientPrivilegesDescriptor isSyncBubbleClientEntitled](v10, "isSyncBubbleClientEntitled");

      if (!v19)
      {
        brc_bread_crumbs();
        v11 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = (BRCClientPrivilegesDescriptor *)v11;
          _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Denying xpc connection because the daemon is in the sync bubble%@", buf, 0xCu);
        }
        v13 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    if (self->_tokenListener == v6)
    {
      v21 = -[BRCXPCClient initWithConnection:]([BRCXPCTokenClient alloc], "initWithConnection:", v7);
      BRCXPCTokenInterface();
    }
    else
    {
      -[BRCDaemon waitOnAccountResumedQueue](self, "waitOnAccountResumedQueue");
      v21 = -[BRCXPCClient initWithConnection:]([BRCXPCRegularIPCsClient alloc], "initWithConnection:", v7);
      BRCXPCInterface();
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v22);

    -[BRCXPCClient setPrivilegesDescriptor:](v21, "setPrivilegesDescriptor:", v10);
    -[BRCDaemon getCurrentSessionMustFinishedLoading:](self, "getCurrentSessionMustFinishedLoading:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCXPCClient setSession:](v21, "setSession:", v23);

    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[BRCDaemon listener:shouldAcceptNewConnection:].cold.1();

    objc_msgSend(v7, "setExportedObject:", v21);
    v26 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_106;
    v37[3] = &unk_1E87604F8;
    v39 = v7;
    v27 = v21;
    p_super = &v27->super.super;
    objc_msgSend(v7, "setInterruptionHandler:", v37);
    v31 = v26;
    v32 = 3221225472;
    v33 = __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_2_111;
    v34 = &unk_1E8760520;
    v11 = v27;
    v35 = v11;
    v36 = v7;
    objc_msgSend(v7, "setInvalidationHandler:", &v31);
    objc_msgSend(v7, "resume", v31, v32, v33, v34);

    v13 = 1;
    v20 = p_super;
    goto LABEL_25;
  }
  brc_bread_crumbs();
  v10 = (BRCClientPrivilegesDescriptor *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v10;
    v12 = "[NOTICE] Rejecting all XPC connections%@";
LABEL_6:
    _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
  }
LABEL_7:
  v13 = 0;
LABEL_26:

  __brc_leave_section(v41);
  return v13;
}

- (id)currentAccountHandler
{
  void *v2;
  void *v3;

  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountHandlerForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_initSignals
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] We are running under bundle %@, not initializing signals because this is not bird daemon%@");
  OUTLINED_FUNCTION_2();
}

void __19__BRCDaemon_daemon__block_invoke()
{
  uint64_t v0;
  void *v1;
  id obj;

  v0 = objc_opt_new();
  v1 = (void *)gDaemon;
  gDaemon = v0;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  isDaemonRunning = 1;
  objc_sync_exit(obj);

}

void __18__BRCDaemon_start__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (qos_class_self() != QOS_CLASS_DEFAULT)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCDaemon start].cold.2();

  }
  objc_msgSend(*(id *)(a1 + 32), "_startXPCListeners");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __18__BRCDaemon_start__block_invoke_76;
  v9[3] = &unk_1E875D500;
  v9[4] = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(_QWORD))MEMORY[0x1D17A6DB0](v9);
  +[BRCBuddyFlowObserver sharedBuddyFlowObserver](BRCBuddyFlowObserver, "sharedBuddyFlowObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "observeBuddyIfNecessaryWithKey:block:description:", CFSTR("DaemonStart"), v2, CFSTR("Daemon start"));

  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] BYSetupAssistantNeedsToRun --> pausing daemon startup until done.%@", buf, 0xCu);
    }

  }
  else
  {
    v2[2](v2);
  }

}

void __18__BRCDaemon_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_resumeSignals");
  objc_msgSend(*(id *)(a1 + 32), "_startupAndLoadAccount");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__BRCDaemon_start__block_invoke_3;
  block[3] = &unk_1E875D500;
  block[4] = v2;
  dispatch_async(v3, block);
}

id __30__BRCDaemon__setupCacheDelete__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  int v21;
  uint64_t v22[3];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon _setupCacheDelete]_block_invoke", 446, v22);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v24 = v22[0];
    v25 = 1024;
    v26 = a2;
    v27 = 2112;
    v28 = v5;
    v29 = 2112;
    v30 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cache delete requested us to compute purgeable space: (urgency: %d) %@%@", buf, 0x26u);
  }

  v9 = +[BRCDiskSpaceReclaimer simpleUrgencyForCacheDeleteUrgency:](BRCDiskSpaceReclaimer, "simpleUrgencyForCacheDeleteUrgency:", a2);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("CACHE_DELETE_VOLUME"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E87D7190, CFSTR("CACHE_DELETE_AMOUNT"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E87D7190, CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));
  v11 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_32;
  v18[3] = &unk_1E87602A8;
  v21 = v9;
  v12 = v10;
  v19 = v12;
  v13 = v6;
  v20 = v13;
  objc_msgSend(v11, "performWithSessionForVolume:action:", v13, v18);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __30__BRCDaemon__setupCacheDelete__block_invoke_cold_1();

  v16 = v12;
  __brc_leave_section(v22);

  return v16;
}

- (void)_setupCacheDelete
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[15];

  if (!self->_shouldRejectXPCCalls)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[9] = self;
    v10[10] = MEMORY[0x1E0C809B0];
    v10[11] = 3221225472;
    v10[12] = __30__BRCDaemon__setupCacheDelete__block_invoke;
    v10[13] = &unk_1E87602D0;
    v10[14] = self;
    v10[5] = MEMORY[0x1E0C809B0];
    v10[6] = 3221225472;
    v10[7] = __30__BRCDaemon__setupCacheDelete__block_invoke_37;
    v10[8] = &unk_1E87602D0;
    CacheDeleteRegisterInfoCallbacks();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheDeletePushXPCActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_2_46;
    v10[3] = &unk_1E8760420;
    v10[4] = self;
    v6 = v5;
    v7 = v10;
    v8 = v7;
    if (*MEMORY[0x1E0D11060])
    {
      ((void (*)(_QWORD *))*MEMORY[0x1E0D11060])(v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    xpc_activity_unregister("com.apple.bird.cache-delete.push");
    xpc_activity_register("com.apple.bird.cache-delete.push", v6, v8);

  }
}

- (void)_finishStartup
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx sending token change notification%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __18__BRCDaemon_start__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_setupCacheDelete");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__BRCDaemon_start__block_invoke_4;
  block[3] = &unk_1E875D500;
  block[4] = v2;
  dispatch_async(v3, block);
}

- (id)currentSession
{
  return -[BRCDaemon getCurrentSessionMustFinishedLoading:](self, "getCurrentSessionMustFinishedLoading:", 0);
}

- (void)waitOnAccountResumedQueue
{
  dispatch_sync((dispatch_queue_t)self->_accountResumedQueue, &__block_literal_global_99);
}

- (void)performWithSessionForVolume:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  stat v13;
  stat v14;

  v5 = a3;
  v6 = a4;
  memset(&v14, 0, sizeof(v14));
  v7 = objc_retainAutorelease(v5);
  if (lstat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v14) < 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      -[BRCDaemon performWithSessionForVolume:action:].cold.1((uint64_t)v7, (uint64_t)v9, v10);

  }
  else
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = 3221225472;
    v13 = v14;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[2] = __48__BRCDaemon_performWithSessionForVolume_action___block_invoke;
    v11[3] = &unk_1E8760280;
    v12 = v6;
    objc_msgSend(v8, "enumerateAccountHandlers:", v11);

    v9 = v12;
  }

}

+ (id)daemon
{
  if (daemon_once != -1)
    dispatch_once(&daemon_once, &__block_literal_global_15);
  return (id)gDaemon;
}

+ (BOOL)isDaemonRunning
{
  void *v2;
  char v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = isDaemonRunning;
  objc_sync_exit(v2);

  return v3;
}

uint64_t __25__BRCDaemon__initSignals__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExitSignal:", 2);
}

uint64_t __25__BRCDaemon__initSignals__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExitSignal:", 3);
}

uint64_t __25__BRCDaemon__initSignals__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExitSignal:", 15);
}

- (void)_setupVNodeRapidAging
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (BOOL)shouldRejectXPCCalls
{
  uid_t v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = geteuid();
  if (!v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] We are running as Root user. We should reject all XPC connections%@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2 == 0;
}

- (BRCDaemon)init
{
  BRCDaemon *v2;
  BRCDaemon *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *xpcListenersReadyQueue;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *accountReadyQueue;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *accountResumedQueue;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *startupQueue;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *accountLoaderQueue;
  BRCFPFSMigrationScheduler *v24;
  BRCFPFSMigrationScheduler *fpfsMigrationScheduler;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)BRCDaemon;
  v2 = -[BRCDaemon init](&v27, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BRCDaemon _initSignals](v2, "_initSignals");
    -[BRCDaemon _setupVNodeRapidAging](v3, "_setupVNodeRapidAging");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.bird.xpc-listener-ready", v5);

    xpcListenersReadyQueue = v3->_xpcListenersReadyQueue;
    v3->_xpcListenersReadyQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.bird.account-startup-queue", v9);

    accountReadyQueue = v3->_accountReadyQueue;
    v3->_accountReadyQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.bird.account-resume-queue", v13);

    accountResumedQueue = v3->_accountResumedQueue;
    v3->_accountResumedQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.bird.startup-queue", v17);

    startupQueue = v3->_startupQueue;
    v3->_startupQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("account-loader", v21);

    accountLoaderQueue = v3->_accountLoaderQueue;
    v3->_accountLoaderQueue = (OS_dispatch_queue *)v22;

    v3->_shouldRejectXPCCalls = -[BRCDaemon shouldRejectXPCCalls](v3, "shouldRejectXPCCalls");
    v24 = objc_alloc_init(BRCFPFSMigrationScheduler);
    fpfsMigrationScheduler = v3->_fpfsMigrationScheduler;
    v3->_fpfsMigrationScheduler = v24;

  }
  return v3;
}

- (void)waitForConfiguration
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;

  dispatch_resume((dispatch_object_t)self->_sigIntSrc);
  dispatch_resume((dispatch_object_t)self->_sigQuitSrc);
  dispatch_resume((dispatch_object_t)self->_sigTermSrc);
  self->_unitTestMode = 1;
  objc_msgSend(MEMORY[0x1E0CB3B58], "serviceListener");
  v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
  __break(1u);
}

- (void)setUpAnonymousListener
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
}

- (BOOL)_haveRequiredKernelFeatures
{
  return 1;
}

- (void)setUpSandbox
{
  void *v2;
  int v3;
  id v4;

  if (!self->_shouldRejectXPCCalls)
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isInSyncBubble");

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.bird.%u"), getuid());
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v4, "UTF8String");
      _set_user_dir_suffix();

    }
    else
    {
      _set_user_dir_suffix();
    }
  }
}

- (id)getCurrentSessionMustFinishedLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  -[BRCDaemon currentAccountHandler](self, "currentAccountHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && !objc_msgSend(v4, "finishedLoading"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __48__BRCDaemon_performWithSessionForVolume_action___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceID");
  v6 = *(_DWORD *)(a1 + 40);

  if (v5 == v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "diskReclaimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cachedPurgeableSpaceForUrgency:", *(unsigned int *)(a1 + 48));

  v6 = v5 & ~(v5 >> 63);
  objc_msgSend(v3, "diskReclaimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "nonPurgeableSizeWithPurgeableSize:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("CACHE_DELETE_VOLUME"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("CACHE_DELETE_AMOUNT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));

}

id __30__BRCDaemon__setupCacheDelete__block_invoke_37(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  int v22;
  uint64_t v23[3];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon _setupCacheDelete]_block_invoke", 477, v23);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v25 = v23[0];
    v26 = 1024;
    v27 = a2;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cache delete requested us to purge: (urgency: %d) %@%@", buf, 0x26u);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_38;
  v18[3] = &unk_1E8760320;
  v22 = a2;
  v11 = v5;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v10, "performWithSessionForVolume:action:", v13, v18);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __30__BRCDaemon__setupCacheDelete__block_invoke_37_cold_1();

  v16 = v12;
  __brc_leave_section(v23);

  return v16;
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v3, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_2;
  block[3] = &unk_1E87602F8;
  v14 = &v16;
  v6 = v3;
  v13 = v6;
  v15 = *(_DWORD *)(a1 + 56);
  dispatch_sync(v5, block);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(v6, "diskReclaimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "purgeSpace:withUrgency:", v8, *((unsigned int *)v17 + 6));

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("CACHE_DELETE_VOLUME"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, CFSTR("CACHE_DELETE_AMOUNT"));

  _Block_object_dispose(&v16, 8);
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "diskReclaimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "urgencyForCacheDeleteUrgency:", *(unsigned int *)(a1 + 48));

}

id __30__BRCDaemon__setupCacheDelete__block_invoke_2_41(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon _setupCacheDelete]_block_invoke_2", 506, v13);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v15 = v13[0];
    v16 = 2112;
    v17 = a3;
    v18 = 2112;
    v19 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cache delete requested us to periodically purge: %@%@", buf, 0x20u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_43;
  v11[3] = &unk_1E87603A8;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "enumerateAccountHandlers:", v11);

  v9 = v8;
  __brc_leave_section(v13);
  return v9;
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    objc_msgSend(v3, "diskReclaimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "periodicReclaimSpace");

    objc_msgSend(v10, "volume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v10;
    if (v6)
    {
      objc_msgSend(v10, "volume");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mountPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("CACHE_DELETE_VOLUME"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("CACHE_DELETE_AMOUNT"));

      v3 = v10;
    }
  }

}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2_46(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[5];
  uint64_t v13[3];
  __int128 buf;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    if (xpc_activity_set_state(v3, 3))
      goto LABEL_16;
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", (uint8_t *)&buf, 0xCu);
    }

  }
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon _setupCacheDelete]_block_invoke", 542, v13);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __30__BRCDaemon__setupCacheDelete__block_invoke_2_46_cold_1(v13);

  if (!xpc_activity_set_state(v3, 4))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to continue%@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x2020000000;
  v16 = 1;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_47;
  v12[3] = &unk_1E87603F8;
  v12[4] = &buf;
  objc_msgSend(v10, "enumerateAccountHandlers:", v12);

  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    v11 = CFSTR("success case kBRCCacheDeletePushXPCActivityId");
  else
    v11 = CFSTR("Error case in computePurgeableSpaceForAllUrgenciesWithReply for kBRCCacheDeletePushXPCActivityId");
  objc_msgSend(*(id *)(a1 + 32), "_setDoneXpcActivity:description:", v3, v11);
  _Block_object_dispose(&buf, 8);
  __brc_leave_section(v13);
LABEL_16:

}

void __30__BRCDaemon__setupCacheDelete__block_invoke_47(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(a2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "diskReclaimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__BRCDaemon__setupCacheDelete__block_invoke_2_48;
    v6[3] = &unk_1E87603D0;
    v8 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    objc_msgSend(v5, "computePurgeableSpaceForAllUrgenciesWithReply:", v6);

  }
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2_48(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      __30__BRCDaemon__setupCacheDelete__block_invoke_2_48_cold_3();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "volume");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mountPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E87D71A8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedLongLongValue");

      objc_msgSend(*(id *)(a1 + 32), "diskReclaimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "nonPurgeableSizeWithPurgeableSize:", v13);

      v22[0] = CFSTR("CACHE_DELETE_ID");
      v22[1] = CFSTR("CACHE_DELETE_VOLUME");
      v23[0] = CFSTR("com.apple.bird.cache-delete");
      v23[1] = v11;
      v23[2] = v6;
      v22[2] = CFSTR("CACHE_DELETE_AMOUNT");
      v22[3] = CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __30__BRCDaemon__setupCacheDelete__block_invoke_2_48_cold_2();

    }
    else
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        __30__BRCDaemon__setupCacheDelete__block_invoke_2_48_cold_1();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }

  }
}

- (void)_setDoneXpcActivity:(id)a3 description:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done for \"%@\"%@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)_dbgSleepIfRequested
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "timeIntervalSinceNow");
  OUTLINED_FUNCTION_10_0(&dword_1CBD43000, v1, v2, "[DEBUG] Start date expired: %@ (%f)%@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5_0();
}

- (void)_startXPCListeners
{
  void *v3;
  NSObject *v4;
  NSDate *v5;
  NSDate *startupDate;
  void *v7;
  NSObject *v8;
  id v9;
  NSXPCListener *v10;
  NSXPCListener *xpcListener;
  id v12;
  NSXPCListener *v13;
  NSXPCListener *tokenListener;
  pid_t v15;
  uid_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;
  char *v25;
  void *v26;
  uint64_t v27[3];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcListenersReadyQueue);
  -[BRCDaemon setUpSandbox](self, "setUpSandbox");
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "Legacy";
    v30 = 2080;
    v31 = "";
    v32 = 2112;
    *(_QWORD *)v33 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] starting bird in %s mode%s%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startupDate = self->_startupDate;
  self->_startupDate = v5;

  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon _startXPCListeners]", 659, v27);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = v27[0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bundleIdentifier");
    v25 = (char *)objc_claimAutoreleasedReturnValue();
    v15 = getpid();
    v16 = getuid();
    OSVersion();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    BRVersion();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "br_realpath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isInSyncBubble");
    v23 = CFSTR("NO");
    *(_DWORD *)buf = 134220034;
    v29 = (const char *)v24;
    v30 = 2112;
    if (v22)
      v23 = CFSTR("YES");
    v31 = v25;
    v32 = 1024;
    *(_DWORD *)v33 = v15;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v16;
    v34 = 2112;
    v35 = v17;
    v36 = 2112;
    v37 = v18;
    v38 = 2112;
    v39 = v20;
    v40 = 2112;
    v41 = v23;
    v42 = 2112;
    v43 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Starting up, welcome, bundle:%@, pid:%d, uid:%d, os:%@, version:%@, home:\"%@\", in sync bubble:%@%@", buf, 0x54u);

  }
  -[BRCDaemon _dbgSleepIfRequested](self, "_dbgSleepIfRequested");
  if (!self->_unitTestMode)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v10 = (NSXPCListener *)objc_msgSend(v9, "initWithMachServiceName:", *MEMORY[0x1E0D110D8]);
    xpcListener = self->_xpcListener;
    self->_xpcListener = v10;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    v12 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v13 = (NSXPCListener *)objc_msgSend(v12, "initWithMachServiceName:", *MEMORY[0x1E0D110E0]);
    tokenListener = self->_tokenListener;
    self->_tokenListener = v13;

    -[NSXPCListener setDelegate:](self->_tokenListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    -[NSXPCListener resume](self->_tokenListener, "resume");
  }
  __brc_leave_section(v27);
}

- (void)_startupAndLoadAccount
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] using Cloud Database class: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

uint64_t __35__BRCDaemon__startupAndLoadAccount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localeDidChange");
}

- (void)_resumeSignals
{
  if (!self->_unitTestMode)
  {
    dispatch_resume((dispatch_object_t)self->_sigIntSrc);
    dispatch_resume((dispatch_object_t)self->_sigQuitSrc);
    dispatch_resume((dispatch_object_t)self->_sigTermSrc);
  }
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_DEFAULT%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __18__BRCDaemon_start__block_invoke_76(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  dispatch_block_t v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__BRCDaemon_start__block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = v1;
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v2, v3);

}

uint64_t __18__BRCDaemon_start__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishStartup");
}

- (void)restart
{
  _Exit(0);
}

- (id)registerShareAcceptOperation:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  BRCDaemon *v8;
  uint64_t v9;
  NSMutableDictionary *shareAcceptOperationsByToken;
  NSOperationQueue *shareAcceptQueue;
  NSOperationQueue *v12;
  NSOperationQueue *v13;
  NSOperationQueue *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSMutableDictionary *shareAcceptWaitersByToken;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[5];
  id v31;
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_shareAcceptOperationsByToken)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    shareAcceptOperationsByToken = v8->_shareAcceptOperationsByToken;
    v8->_shareAcceptOperationsByToken = (NSMutableDictionary *)v9;

  }
  shareAcceptQueue = v8->_shareAcceptQueue;
  if (!shareAcceptQueue)
  {
    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v13 = v8->_shareAcceptQueue;
    v8->_shareAcceptQueue = v12;

    -[NSOperationQueue setName:](v8->_shareAcceptQueue, "setName:", CFSTR("share-accept"));
    shareAcceptQueue = v8->_shareAcceptQueue;
  }
  v14 = shareAcceptQueue;
  v15 = v8->_shareAcceptOperationsByToken;
  objc_msgSend(v7, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = v18;
  }
  else
  {
    shareAcceptWaitersByToken = v8->_shareAcceptWaitersByToken;
    objc_msgSend(v7, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](shareAcceptWaitersByToken, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v6, "setSkipOpenInApp:", 1);
    v24 = v8->_shareAcceptOperationsByToken;
    objc_msgSend(v7, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v6, v26);

  }
  objc_sync_exit(v8);

  if (!v18)
  {
    objc_msgSend(v6, "finishBlock");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__BRCDaemon_registerShareAcceptOperation_forURL___block_invoke;
    v30[3] = &unk_1E8760448;
    v32 = v27;
    v30[4] = v8;
    v31 = v7;
    v28 = v27;
    objc_msgSend(v6, "setFinishBlock:", v30);
    -[NSOperationQueue addOperation:](v14, "addOperation:", v6);
    v18 = v6;

  }
  return v18;
}

void __49__BRCDaemon_registerShareAcceptOperation_forURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v9);

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v25, "waiterBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v23 = a1;
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
        if (v5)
        {
          v26 = v6;
          objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v5, 0, &v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v26;

          v6 = v19;
        }
        else
        {
          v18 = 0;
        }
        (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v20 = *(void **)(*(_QWORD *)(v23 + 32) + 112);
  objc_msgSend(*(id *)(v23 + 40), "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastPathComponent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v22);

  objc_sync_exit(obj);
}

- (void)registerWaiterBlock:(id)a3 forShareURL:(id)a4
{
  id v6;
  id v7;
  BRCDaemon *v8;
  NSMutableDictionary *shareAcceptWaitersByToken;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  BRCShareAcceptWaiterInfo *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *acceptWaiterTimer;
  dispatch_source_t v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *v23;
  OS_dispatch_source *v24;
  _QWORD *v25;
  NSObject *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  dispatch_block_t v30;
  dispatch_time_t v31;
  _QWORD v32[5];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  shareAcceptWaitersByToken = v8->_shareAcceptWaitersByToken;
  if (!shareAcceptWaitersByToken)
  {
    v10 = objc_opt_new();
    v11 = v8->_shareAcceptWaitersByToken;
    v8->_shareAcceptWaitersByToken = (NSMutableDictionary *)v10;

    shareAcceptWaitersByToken = v8->_shareAcceptWaitersByToken;
  }
  objc_msgSend(v7, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](shareAcceptWaitersByToken, "objectForKeyedSubscript:", v13);
  v14 = (BRCShareAcceptWaiterInfo *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = objc_alloc_init(BRCShareAcceptWaiterInfo);
    v15 = v8->_shareAcceptWaitersByToken;
    objc_msgSend(v7, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v17);

  }
  -[BRCShareAcceptWaiterInfo waiterBlocks](v14, "waiterBlocks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1D17A6DB0](v6);
  objc_msgSend(v18, "addObject:", v19);

  acceptWaiterTimer = v8->_acceptWaiterTimer;
  if (acceptWaiterTimer)
    dispatch_source_cancel(acceptWaiterTimer);
  v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v8->_accountResumedQueue);
  v22 = v8->_acceptWaiterTimer;
  v8->_acceptWaiterTimer = (OS_dispatch_source *)v21;

  v23 = v8->_acceptWaiterTimer;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __45__BRCDaemon_registerWaiterBlock_forShareURL___block_invoke;
  v32[3] = &unk_1E875D500;
  v32[4] = v8;
  v24 = v23;
  v25 = v32;
  v26 = v24;
  v27 = v25;
  v28 = v27;
  v29 = v27;
  if (*MEMORY[0x1E0D11070])
  {
    ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
  dispatch_source_set_event_handler(v26, v30);

  v31 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer((dispatch_source_t)v8->_acceptWaiterTimer, v31, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)v8->_acceptWaiterTimer);

  objc_sync_exit(v8);
}

void __45__BRCDaemon_registerWaiterBlock_forShareURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id obj;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v20 = *(id *)(a1 + 32);
  objc_sync_enter(v20);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v3)
  {
    v23 = *(_QWORD *)v31;
    v4 = *MEMORY[0x1E0C947D8];
    obj = v2;
    do
    {
      v24 = v3;
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v25 + 32) + 104), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 == 0;

        if (v8)
        {
          brc_bread_crumbs();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v36 = v6;
            v37 = 2112;
            v38 = v9;
            _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] No accept operation found for key %@%@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(v25 + 32) + 112), "objectForKeyedSubscript:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v22 = v11;
          objc_msgSend(v11, "waiterBlocks");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v4, 11, 0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(v25 + 32) + 112), "removeObjectForKey:", v6);
        }
      }
      v2 = obj;
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v3);
  }

  v18 = *(_QWORD *)(v25 + 32);
  v19 = *(void **)(v18 + 120);
  *(_QWORD *)(v18 + 120) = 0;

  objc_sync_exit(v20);
}

- (void)dumpToContext:(id)a3
{
  BRCDaemon *v4;
  NSMutableDictionary *shareAcceptOperationsByToken;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[NSMutableDictionary count](v4->_shareAcceptOperationsByToken, "count"))
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("share accept operations"));
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    objc_msgSend(v7, "pushIndentation");
    shareAcceptOperationsByToken = v4->_shareAcceptOperationsByToken;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __27__BRCDaemon_dumpToContext___block_invoke;
    v8[3] = &unk_1E8760470;
    v6 = v7;
    v9 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](shareAcceptOperationsByToken, "enumerateKeysAndObjectsUsingBlock:", v8);
    objc_msgSend(v6, "popIndentation");
    objc_msgSend(v6, "writeLineWithFormat:", &stru_1E8769030);

  }
  objc_sync_exit(v4);

}

void __27__BRCDaemon_dumpToContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "descriptionWithContext:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR(" %@: %@"), v5, v6);

}

- (void)localeDidChange
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Language changed, exiting%@", (uint8_t *)&v4, 0xCu);
  }

  exit(0);
}

uint64_t __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_106(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  const char *v6;

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  result = objc_msgSend(*(id *)(a1 + 32), "dieOnInvalidate");
  if ((_DWORD)result)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("our connection was invalidated"));
    v3 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_106_cold_1(v3, (uint64_t)v4, v5);

    brc_append_system_info_to_message();
    v6 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCDaemon listener:shouldAcceptNewConnection:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/daemon/BRCDaemon.m", 1009, v6);
  }
  return result;
}

void __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_2_111(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5[3];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BRCDaemon listener:shouldAcceptNewConnection:]_block_invoke_2", 1013, v5);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v7 = v5[0];
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Client %@ connection was invalidated%@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __brc_leave_section(v5);
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
}

- (BOOL)selfCheck:(__sFILE *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  __sFILE *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[BRCDaemon currentSession](self, "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performWithFlags:action:", 17, &__block_literal_global_114);
  v19 = 0;
  v6 = (void *)objc_msgSend(v4, "newConnectionWithLabel:readonly:error:", CFSTR("checker"), 0, &v19);
  v7 = v19;

  if (v6)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __23__BRCDaemon_selfCheck___block_invoke_117;
    v15 = &unk_1E8760590;
    v17 = &v20;
    v16 = v4;
    v18 = a3;
    objc_msgSend(v6, "groupInTransaction:", &v12);
    objc_msgSend(v6, "brc_close", v12, v13, v14, v15);
    v8 = v16;
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      -[BRCDaemon selfCheck:].cold.1();

  }
  v10 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v10;
}

uint64_t __23__BRCDaemon_selfCheck___block_invoke()
{
  return 1;
}

uint64_t __23__BRCDaemon_selfCheck___block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __23__BRCDaemon_selfCheck___block_invoke_2;
  v7[3] = &unk_1E8760568;
  v9 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateServerZones:", v7);

  return 0;
}

uint64_t __23__BRCDaemon_selfCheck___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  BOOL v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "validateItemsLoggingToFile:db:", a1[6], a1[4]);
  v5 = *(_QWORD *)(a1[5] + 8);
  if (v4)
    v6 = *(_BYTE *)(v5 + 24) != 0;
  else
    v6 = 0;
  *(_BYTE *)(v5 + 24) = v6;
  v7 = objc_msgSend(v3, "validateStructureLoggingToFile:db:", a1[6], a1[4]);
  v8 = *(_QWORD *)(a1[5] + 8);
  if (v7)
    v9 = *(_BYTE *)(v8 + 24) != 0;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  v10 = objc_msgSend(v3, "validateItemsLoggingToFile:db:", a1[6], a1[4]);
  v11 = *(_QWORD *)(a1[5] + 8);
  if (v10)
    v12 = *(_BYTE *)(v11 + 24) != 0;
  else
    v12 = 0;
  *(_BYTE *)(v11 + 24) = v12;
  v13 = objc_msgSend(v3, "validateStructureLoggingToFile:db:", a1[6], a1[4]);
  v14 = *(_QWORD *)(a1[5] + 8);
  if (v13)
    v15 = *(_BYTE *)(v14 + 24) != 0;
  else
    v15 = 0;
  *(_BYTE *)(v14 + 24) = v15;

  return 1;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  id v7;

  v3 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCDaemon networkReachabilityChanged:].cold.1();

  BRNotificationNameForServerAvailabilityChanges();
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  brc_notify_set_state_and_post();

  if (v3)
    dispatch_async((dispatch_queue_t)self->_startupQueue, &__block_literal_global_120);
}

void __40__BRCDaemon_networkReachabilityChanged___block_invoke()
{
  id v0;

  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enumerateAccountHandlerIfFinishedLoading:", &__block_literal_global_121);

}

void __40__BRCDaemon_networkReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(a2, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientTruthWorkloop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "clientTruthWorkloop");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__BRCDaemon_networkReachabilityChanged___block_invoke_3;
    block[3] = &unk_1E875D500;
    v6 = v2;
    dispatch_async(v4, block);

  }
}

uint64_t __40__BRCDaemon_networkReachabilityChanged___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateAppLibraries:", &__block_literal_global_123);
}

uint64_t __40__BRCDaemon_networkReachabilityChanged___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = a2;
  objc_msgSend(v2, "defaultClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasFetchedRecentsAndFavorites") & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v3, "serverZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "state") & 4) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v6 = objc_msgSend(v3, "isSyncBlocked");

  if ((v6 & 1) == 0)
    objc_msgSend(v2, "scheduleFullLibraryContentsFetch");
LABEL_7:

  return 1;
}

- (void)handleExitSignal:(int)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  BRCDaemon *v8;
  SEL v9;
  int v10;
  int v11;
  char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = strsignal(a3);
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] starting exit sequence because of received signal (%s)%@", (uint8_t *)&v11, 0x16u);
  }

  self->_shuttingDown = 1;
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interrupt");

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  -[BRCFPFSMigrationScheduler removeSchedule](self->_fpfsMigrationScheduler, "removeSchedule");
  v8 = (BRCDaemon *)-[BRCDaemon exitWithCode:](self, "exitWithCode:", 0);
  -[BRCDaemon exitWithCode:](v8, v9, v10);
}

- (void)exitWithCode:(int)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__BRCDaemon_exitWithCode___block_invoke;
  v7[3] = &unk_1E87603A8;
  v8 = v4;
  objc_msgSend(v8, "enumerateAccountHandlers:", v7);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v10 = a3;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] exiting with code %d...%@", buf, 0x12u);
  }

  exit(a3);
}

void __26__BRCDaemon_exitWithCode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v6, "deviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "versionsProviderForVolume:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  objc_msgSend(v4, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "clientDB");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "serialQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__BRCDaemon_exitWithCode___block_invoke_2;
    block[3] = &unk_1E875D500;
    v13 = v11;
    dispatch_sync(v10, block);

  }
}

uint64_t __26__BRCDaemon_exitWithCode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flush");
}

- (void)suspendIPCAcceptation
{
  dispatch_suspend((dispatch_object_t)self->_accountResumedQueue);
}

- (void)resumeIPCAcceptation
{
  dispatch_resume((dispatch_object_t)self->_accountResumedQueue);
}

- (Class)containerClass
{
  return self->_containerClass;
}

- (void)setContainerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_containerClass, a3);
}

- (BOOL)disableAccountChangesHandling
{
  return self->_disableAccountChangesHandling;
}

- (void)setDisableAccountChangesHandling:(BOOL)a3
{
  self->_disableAccountChangesHandling = a3;
}

- (BOOL)disableAppsChangesHandling
{
  return self->_disableAppsChangesHandling;
}

- (void)setDisableAppsChangesHandling:(BOOL)a3
{
  self->_disableAppsChangesHandling = a3;
}

- (unint64_t)forceIsGreedyState
{
  return self->_forceIsGreedyState;
}

- (void)setForceIsGreedyState:(unint64_t)a3
{
  self->_forceIsGreedyState = a3;
}

- (NSDate)startupDate
{
  return self->_startupDate;
}

- (BOOL)isShuttingDown
{
  return self->_shuttingDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupDate, 0);
  objc_storeStrong((id *)&self->_containerClass, 0);
  objc_storeStrong((id *)&self->_fpfsMigrationScheduler, 0);
  objc_storeStrong((id *)&self->_shareAcceptQueue, 0);
  objc_storeStrong((id *)&self->_acceptWaiterTimer, 0);
  objc_storeStrong((id *)&self->_shareAcceptWaitersByToken, 0);
  objc_storeStrong((id *)&self->_shareAcceptOperationsByToken, 0);
  objc_storeStrong((id *)&self->_accountLoaderQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_accountResumedQueue, 0);
  objc_storeStrong((id *)&self->_accountReadyQueue, 0);
  objc_storeStrong((id *)&self->_xpcListenersReadyQueue, 0);
  objc_storeStrong((id *)&self->_tokenListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_sigQuitSrc, 0);
  objc_storeStrong((id *)&self->_sigIntSrc, 0);
}

- (void)performWithSessionForVolume:(NSObject *)a3 action:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 138412802;
  v9 = a1;
  v10 = 2080;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_1CBD43000, a3, (os_log_type_t)0x90u, "[ERROR] cannot retrieve device ID for '%@': %s%@", (uint8_t *)&v8, 0x20u);
  OUTLINED_FUNCTION_5_0();
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] purgeable space is %@%@");
  OUTLINED_FUNCTION_2();
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_37_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Purged space is %@%@");
  OUTLINED_FUNCTION_2();
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2_46_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx pushing purgeable update to cache delete%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2_48_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to get volume path%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2_48_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Purgeable info: %@ (not returned)%@");
  OUTLINED_FUNCTION_2();
}

void __30__BRCDaemon__setupCacheDelete__block_invoke_2_48_cold_3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] welcome %@!%@");
  OUTLINED_FUNCTION_2();
}

void __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_106_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  brc_append_system_info_to_message();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v6, 0x16u);

}

- (void)selfCheck:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

- (void)networkReachabilityChanged:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  BRNotificationNameForServerAvailabilityChanges();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_10_0(&dword_1CBD43000, v1, v2, "[DEBUG] sending server availability: %savailable (%@)%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5_0();
}

@end
