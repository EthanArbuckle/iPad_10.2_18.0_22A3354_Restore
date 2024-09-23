@implementation BRCXPCClient

- (BOOL)isUsingUbiquity
{
  return self->_isUsingUbiquity;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_personaMonitorCounts, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_appLibraries, 0);
  objc_storeStrong((id *)&self->_foregroundBackgroundHandlingQueue, 0);
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, 0);
  objc_storeStrong((id *)&self->__session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)_process:(int)a3 didBecomeForeground:(BOOL)a4
{
  NSObject *foregroundBackgroundHandlingQueue;
  _QWORD v5[5];
  BOOL v6;

  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__BRCXPCClient__process_didBecomeForeground___block_invoke;
  v5[3] = &unk_1E8760EE0;
  v5[4] = self;
  v6 = a4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, v5);
}

- (void)_stopMonitoringProcess
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] stop monitoring %@%@");
  OUTLINED_FUNCTION_2();
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke(uint64_t a1, uint64_t a2)
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
      __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_process:didBecomeForeground:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
  }
}

- (void)process:(int)a3 didBecomeForeground:(BOOL)a4
{
  void *v4;
  void *v5;

  -[BRCXPCClient session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BRPerformWithPersonaAndError();

}

- (void)invalidate
{
  BRCXPCClient *v2;
  char v3;
  void *v4;
  NSObject *foregroundBackgroundHandlingQueue;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10[3];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  BRCXPCClient *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = *((_BYTE *)v2 + 32);
  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    *((_BYTE *)v2 + 32) = v3 | 1;
    brc_task_tracker_cancel(v2->_tracker);
    -[BRCXPCClient session](v2, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  foregroundBackgroundHandlingQueue = v2->_foregroundBackgroundHandlingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__BRCXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = v2;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, block);
  if ((v3 & 1) == 0)
  {
    memset(v10, 0, sizeof(v10));
    __brc_create_section(0, (uint64_t)"-[BRCXPCClient invalidate]", 331, v10);
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v13 = v10[0];
      v14 = 2112;
      v15 = v2;
      v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx invalidating connection with %@%@", buf, 0x20u);
    }

    -[BRCXPCClient _stopMonitoringProcess](v2, "_stopMonitoringProcess");
    objc_msgSend(v4, "notificationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pipeDelegateInvalidated:", v2);

    objc_msgSend(v4, "unregisterClient:", v2);
    -[NSOperationQueue cancelAllOperations](v2->_operationQueue, "cancelAllOperations");
    WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);
    objc_msgSend(WeakRetained, "invalidate");

    __brc_leave_section(v10);
  }

}

- (BRCClientPrivilegesDescriptor)clientPriviledgesDescriptor
{
  return self->_clientPriviledgesDescriptor;
}

- (BRCAccountSession)session
{
  return self->__session;
}

- (BRCXPCClient)initWithConnection:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCXPCClient;
  v5 = -[BRCXPCClient init](&v24, sel_init);
  if (v5)
  {
    if (initWithConnection__onceToken != -1)
      dispatch_once(&initWithConnection__onceToken, &__block_literal_global_55);
    brc_task_tracker_create("XPC Client task tracker");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    objc_storeWeak((id *)v5 + 16, v4);
    *((_DWORD *)v5 + 18) = objc_msgSend(v4, "processIdentifier");
    if (v4)
    {
      objc_msgSend(v4, "auditToken");
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
    }
    *(_OWORD *)(v5 + 76) = v22;
    *(_OWORD *)(v5 + 92) = v23;
    v8 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v9 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xpc-client-queue-%d"), *((unsigned int *)v5 + 18));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = initWithConnection__xpcWorkloop;
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create_with_target_V2(v11, v14, v13);

    v16 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("foreground-background-handling", v18);

    v20 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v19;

  }
  return (BRCXPCClient *)v5;
}

- (void)setSession:(id)a3
{
  BRCAccountSession *v5;
  BRCXPCClient *v6;
  BRCAccountSession *session;
  void **p_session;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = (BRCAccountSession *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((*((_BYTE *)v6 + 32) & 1) == 0)
  {
    p_session = (void **)&v6->__session;
    session = v6->__session;
    if (session != v5)
    {
      -[BRCAccountSession unregisterClient:](session, "unregisterClient:", v6);
      if (!v5)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCXPCClient setSession:].cold.1();

      }
      objc_storeStrong((id *)&v6->__session, a3);
      if (!-[BRCAccountSession registerClient:](v6->__session, "registerClient:", v6))
      {
        v9 = *p_session;
        *p_session = 0;

      }
    }
  }
  objc_sync_exit(v6);

}

- (id)_overrideSessionForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
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
  v15 = __Block_byref_object_copy__42;
  v16 = __Block_byref_object_dispose__42;
  v17 = 0;
  -[BRCXPCClient session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "syncedFolderTypeForURL:", v4))
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__BRCXPCClient_LegacyAdditions___overrideSessionForURL___block_invoke;
    v9[3] = &unk_1E8760C60;
    v10 = v4;
    v11 = &v12;
    objc_msgSend(v6, "enumerateAccountHandlers:", v9);

  }
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__BRCXPCClient_LegacyAdditions___overrideSessionForURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "syncedFolderTypeForURL:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(v8, "session");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (BOOL)canAccessLogicalOrPhysicalURL:(id)a3 accessKind:(int64_t)a4 session:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "syncedFolderTypeForURL:", v8);

  if (!v11)
    goto LABEL_5;
  -[BRCXPCClient _auditURL:](self, "_auditURL:", v8);
  v12 = objc_retainAutorelease(v10);
  if (!-[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", objc_msgSend(v12, "fileSystemRepresentation"), a4))
  {
    if ((objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
LABEL_5:
      v13 = 0;
      goto LABEL_14;
    }
    if (!_CFURLIsItemPromiseAtURL())
    {
      v14 = (id)_CFURLPromiseCopyPhysicalURL();
      if (v14)
        goto LABEL_17;
      objc_msgSend(v8, "URLByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "br_sideFaultName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLByAppendingPathComponent:", v17);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
LABEL_17:
        objc_msgSend(v14, "path");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", objc_msgSend(v18, "fileSystemRepresentation"), a4);

        if (v19)
        {
          _CFURLPromiseSetPhysicalURL();
          v13 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }

    }
    objc_msgSend(v12, "stringByDeletingLastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", objc_msgSend(v14, "fileSystemRepresentation"), a4);
    goto LABEL_13;
  }
  v13 = 1;
LABEL_14:

  return v13;
}

- (void)performBlock:(id)a3 withSessionFromURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[BRCXPCClient _overrideSessionForURL:](self, "_overrideSessionForURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[BRCXPCClient session](self, "session");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  v17 = v6;
  v13 = v11;
  v14 = v6;
  v15 = v7;
  BRPerformWithPersonaAndError();

}

void __65__BRCXPCClient_LegacyAdditions__performBlock_withSessionFromURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void (*v6)(void);

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __65__BRCXPCClient_LegacyAdditions__performBlock_withSessionFromURL___block_invoke_cold_1(a1, (uint64_t)v4, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

- (void)accessLogicalOrPhysicalURL:(id)a3 accessKind:(int64_t)a4 dbAccessKind:(int64_t)a5 synchronouslyIfPossible:(BOOL)a6 handler:(id)a7
{
  id v10;
  BRCAccountSession *v11;
  BRCAccountSession *session;
  BRCAccountSession *v13;
  BRCAccountSession *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  BOOL v25;
  BRCAccountSession *v26;
  void (**v27)(id, _QWORD, void *);
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  brc_task_tracker *tracker;
  void *v42;
  NSObject *v43;
  void *v46;
  void *v47;
  void (**v48)(id, _QWORD, void *);
  void *v49;
  _QWORD v50[4];
  void (**v51)(id, _QWORD, void *);
  _QWORD v52[5];
  BRCAccountSession *v53;
  id v54;
  _QWORD v55[4];
  BRCAccountSession *v56;
  BRCXPCClient *v57;
  id v58;
  id v59;
  int64_t v60;
  char v61;
  _QWORD v62[4];
  void (**v63)(id, _QWORD, void *);
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v48 = (void (**)(id, _QWORD, void *))a7;
  -[BRCXPCClient _overrideSessionForURL:](self, "_overrideSessionForURL:", v10);
  v11 = (BRCAccountSession *)objc_claimAutoreleasedReturnValue();
  session = v11;
  if (!v11)
    session = self->__session;
  v13 = session;

  -[BRCXPCClient session](self, "session");
  v14 = (BRCAccountSession *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountSession personaIdentifier](v13, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("__defaultPersonaID__")))
  {

  }
  else
  {
    -[BRCAccountSession personaIdentifier](v13, "personaIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = 0;
      goto LABEL_10;
    }
  }
  if (accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personaOnceToken != -1)
    dispatch_once(&accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personaOnceToken, &__block_literal_global_49);
  v16 = (id)accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personalPersona;
  v17 = 1;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentPersona");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = 0;
  objc_msgSend(v49, "userPersonaUniqueString");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v47 = v19;
  if (v19 == v16 || (objc_msgSend(v19, "isEqualToString:", v16) & 1) != 0)
  {
LABEL_12:
    v46 = 0;
    goto LABEL_13;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v64 = 0;
    v33 = (void *)objc_msgSend(v49, "copyCurrentPersonaContextWithError:", &v64);
    v34 = v64;
    v35 = v65;
    v65 = v33;

    if (v34)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.8();

    }
    objc_msgSend(v49, "generateAndRestorePersonaContextWithPersonaUniqueString:", v16);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
      goto LABEL_12;
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
    {
      -[BRCAccountSession personaIdentifier](v13, "personaIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v67 = v40;
      v68 = 2112;
      v69 = v46;
      v70 = 2112;
      v71 = v38;
      _os_log_error_impl(&dword_1CBD43000, v39, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

    }
LABEL_48:

    goto LABEL_13;
  }
  if (v17 && (objc_msgSend(v49, "isDataSeparatedPersona") & 1) == 0)
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.3();
    v46 = 0;
    goto LABEL_48;
  }
  brc_bread_crumbs();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[_BRCOperation completedWithResult:error:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (v13 != v14
    || (v62[0] = MEMORY[0x1E0C809B0],
        v62[1] = 3221225472,
        v62[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_7,
        v62[3] = &unk_1E8761B08,
        v63 = v48,
        v20 = _brc_ipc_check_logged_status(self, 1, v62),
        v63,
        v20))
  {
    if (!-[BRCAccountSession syncedFolderTypeForURL:](v13, "syncedFolderTypeForURL:", v10))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2](v48, 0, v23);
LABEL_38:

      goto LABEL_39;
    }
    if (a5 == 1
      && (objc_msgSend(v10, "br_mightBeBRAlias") & 1) == 0
      && (+[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "allowReadOnlyDBInIPC"),
          v21,
          v22))
    {
      -[BRCAccountSession readOnlyWorkloop](v13, "readOnlyWorkloop");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 1;
    }
    else
    {
      -[BRCAccountSession clientTruthWorkloop](v13, "clientTruthWorkloop");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
    }
    v25 = v13 == v14;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2;
    v55[3] = &unk_1E87650F0;
    v61 = v24;
    v26 = v13;
    v56 = v26;
    v57 = self;
    v58 = v10;
    v60 = a4;
    v27 = v48;
    v59 = v27;
    v28 = MEMORY[0x1D17A6DB0](v55);
    v29 = (void *)v28;
    if (v25)
    {
      if (a6)
      {
        (*(void (**)(uint64_t))(v28 + 16))(v28);
LABEL_37:

        goto LABEL_38;
      }
    }
    else
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[BRCXPCClient(LegacyAdditions) accessLogicalOrPhysicalURL:accessKind:dbAccessKind:synchronouslyIfPossible:handler:].cold.1();

      -[BRCXPCClient _becameXPCCLientOfSession:](self, "_becameXPCCLientOfSession:", v26);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_11;
      v52[3] = &unk_1E8761190;
      v54 = v29;
      v52[4] = self;
      v53 = v26;
      v32 = (void *)MEMORY[0x1D17A6DB0](v52);
      v29 = (void *)MEMORY[0x1D17A6DB0]();

    }
    tracker = self->_tracker;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2_12;
    v50[3] = &unk_1E875FD48;
    v51 = v27;
    brc_task_tracker_async_with_logs(tracker, v23, v29, v50);

    goto LABEL_37;
  }
LABEL_39:

  _BRRestorePersona();
}

void __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personalPersona;
  accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personalPersona = v0;

}

uint64_t __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  char v6;
  BRCURLToItemLookup *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "readOnlyDB");
  else
    objc_msgSend(v3, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertOnQueue");
  v5 = objc_msgSend(*(id *)(a1 + 40), "canAccessLogicalOrPhysicalURL:accessKind:session:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = v5;
    v7 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:db:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 32), v4);
    v33 = 0;
    v8 = -[BRCURLToItemLookup resolveAndKeepOpenWithError:](v7, "resolveAndKeepOpenWithError:", &v33);
    v9 = v33;
    if (v8)
    {
      if ((v6 & 1) == 0)
      {
        if (v7)
        {
          -[BRCURLToItemLookup parentRelpath](v7, "parentRelpath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appLibrary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
          }
          else
          {
            -[BRCURLToItemLookup relpath](v7, "relpath");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "appLibrary");
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
          if ((objc_msgSend(*(id *)(a1 + 40), "_isAppLibraryProxyEntitled") & 1) != 0
            || v13
            && (v20 = *(void **)(a1 + 40),
                objc_msgSend(v13, "mangledID"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                LOBYTE(v20) = objc_msgSend(v20, "_canCreateAppLibraryWithID:error:", v21, 0),
                v21,
                (v20 & 1) != 0))
          {

            goto LABEL_25;
          }
          -[BRCURLToItemLookup byIDLocalItem](v7, "byIDLocalItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            v24 = v22;
          }
          else
          {
            -[BRCURLToItemLookup faultedLocalItem](v7, "faultedLocalItem");
            v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          v25 = v24;

          objc_msgSend(v25, "setOfAppLibraryIDsWithReverseAliases");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v35 = v25;
            v36 = 2112;
            v37 = v26;
            v38 = 2112;
            v39 = v27;
            _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] looking for container containing aliases to %@, found: %@%@", buf, 0x20u);
          }

          objc_msgSend(*(id *)(a1 + 40), "entitledAppLibraryIDs");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v26, "intersectsSet:", v29);

          if ((v30 & 1) != 0)
            goto LABEL_25;
LABEL_28:
          v31 = *(_QWORD *)(a1 + 56);
          _cocoaDomainPermissionError(*(_QWORD *)(a1 + 64), *(void **)(a1 + 48));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v31 + 16))(v31, 0, v32);

          goto LABEL_26;
        }
        v16 = objc_alloc(MEMORY[0x1E0D10E88]);
        objc_msgSend(*(id *)(a1 + 48), "br_containerID");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithAppLibraryName:", v17);

        LOBYTE(v17) = objc_msgSend(*(id *)(a1 + 40), "_hasAccessToAppLibraryID:error:", v18, 0);
        if ((v17 & 1) == 0)
          goto LABEL_28;
      }
LABEL_25:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_26:
      -[BRCURLToItemLookup closePaths](v7, "closePaths");

      goto LABEL_27;
    }
    -[BRCURLToItemLookup closePaths](v7, "closePaths");

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    _cocoaDomainPermissionError(*(_QWORD *)(a1 + 64), *(void **)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

  }
LABEL_27:

}

uint64_t __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_11(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_finishedXPCClientOfSession:", *(_QWORD *)(a1 + 40));
}

void __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2_12(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_getCloudDocsUnsupportedError
{
  return 0;
}

- (void)setPrivilegesDescriptor:(id)a3
{
  id v5;
  BRCClientPrivilegesDescriptor *clientPriviledgesDescriptor;
  id WeakRetained;

  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, a3);
  v5 = a3;
  clientPriviledgesDescriptor = self->_clientPriviledgesDescriptor;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "setUserInfo:", clientPriviledgesDescriptor);

}

void __35__BRCXPCClient_initWithConnection___block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("xpc-client-workloop");
  v1 = (void *)initWithConnection__xpcWorkloop;
  initWithConnection__xpcWorkloop = (uint64_t)v0;

}

void __26__BRCXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isUsingUbiquity"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeClientUsingUbiquity:", *(_QWORD *)(a1 + 32), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)wait
{
  brc_task_tracker_wait((uint64_t)self->_tracker);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_operationQueue, "waitUntilAllOperationsAreFinished");
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  BRCXPCClient *v5;
  void *v6;

  -[BRCXPCClient session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = &stru_1E8769030;
  else
    v4 = CFSTR(" (Logged out)");
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5->_clientPriviledgesDescriptor, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return (NSString *)v6;
}

- (void)dumpToContext:(id)a3
{
  BRCXPCClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "writeLineWithFormat:", CFSTR(" o %@"), v4);
  objc_sync_exit(v4);

}

- (void)addOperation:(id)a3
{
  BRCXPCClient *v4;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v6;
  NSOperationQueue *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
    objc_msgSend(v12, "cancel");
  operationQueue = v4->_operationQueue;
  if (!operationQueue)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v7 = v4->_operationQueue;
    v4->_operationQueue = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("misc-operations", v9);

    -[NSOperationQueue setUnderlyingQueue:](v4->_operationQueue, "setUnderlyingQueue:", v10);
    operationQueue = v4->_operationQueue;
  }
  -[NSOperationQueue addOperation:](operationQueue, "addOperation:", v12);
  objc_sync_exit(v4);

  -[BRCXPCClient session](v4, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addMiscOperation:", v12);

}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) & 1) == *(_BYTE *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
    {
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2();
    }
    else
    {
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1();
    }

    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) & 0xFE | *(_BYTE *)(a1 + 40);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(a1 + 40))
          objc_msgSend(v10, "addForegroundClient:", v11);
        else
          objc_msgSend(v10, "removeForegroundClient:", v11, (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_startMonitoringProcessIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] starting monitoring %@%@");
  OUTLINED_FUNCTION_2();
}

- (BOOL)checkTCCAccess
{
  BRCXPCClient *v2;
  void *v3;

  v2 = self;
  -[BRCXPCClient session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[BRCXPCClient checkTCCAccessForSession:](v2, "checkTCCAccessForSession:", v3);

  return (char)v2;
}

- (BOOL)checkTCCAccessForSession:(id)a3
{
  return 1;
}

- (void)addAppLibrary:(id)a3
{
  id v4;
  NSObject *foregroundBackgroundHandlingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BRCXPCClient_addAppLibrary___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, block);
  -[BRCXPCClient _startMonitoringProcessIfNeeded](self, "_startMonitoringProcessIfNeeded");

}

void __30__BRCXPCClient_addAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    v3 = *(_BYTE *)(v1 + 109);
    objc_msgSend(*(id *)(v1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "countForObject:", *(_QWORD *)(a1 + 40));
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = "YES";
      v14 = 138413058;
      if (v4 == 1)
        v11 = "YES";
      else
        v11 = "NO";
      v15 = v9;
      v16 = 2080;
      if ((v3 & 1) == 0)
        v10 = "NO";
      v17 = v11;
      v18 = 2080;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "logName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v7;
        _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is now monitoring %@%@", (uint8_t *)&v14, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "addForegroundClient:", *(_QWORD *)(a1 + 32));
    }
  }
}

- (void)removeAppLibrary:(id)a3
{
  id v4;
  NSObject *foregroundBackgroundHandlingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BRCXPCClient_removeAppLibrary___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, block);

}

void __33__BRCXPCClient_removeAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    v3 = *(_BYTE *)(v1 + 109);
    v4 = objc_msgSend(*(id *)(v1 + 56), "countForObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = "YES";
      v14 = 138413058;
      if (v4 == 1)
        v11 = "YES";
      else
        v11 = "NO";
      v15 = v9;
      v16 = 2080;
      if ((v3 & 1) == 0)
        v10 = "NO";
      v17 = v11;
      v18 = 2080;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "logName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v7;
        _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is no longer monitoring %@%@", (uint8_t *)&v14, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "removeForegroundClient:", *(_QWORD *)(a1 + 32));
    }
  }
}

- (void)notificationPipe:(id)a3 willObserveAppLibrary:(id)a4
{
  -[BRCXPCClient addAppLibrary:](self, "addAppLibrary:", a4);
}

- (void)notificationPipe:(id)a3 didObserveAppLibrary:(id)a4
{
  -[BRCXPCClient removeAppLibrary:](self, "removeAppLibrary:", a4);
}

- (char)cloudEnabledStatus
{
  BRCXPCClient *v2;
  BRCClientPrivilegesDescriptor *clientPriviledgesDescriptor;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  clientPriviledgesDescriptor = v2->_clientPriviledgesDescriptor;
  -[BRCXPCClient session](v2, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientPriviledgesDescriptor) = -[BRCClientPrivilegesDescriptor cloudEnabledStatusWithHasSession:](clientPriviledgesDescriptor, "cloudEnabledStatusWithHasSession:", v4 != 0);

  objc_sync_exit(v2);
  return (char)clientPriviledgesDescriptor;
}

- (BOOL)_hasAccessToAppLibraryID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v14;
  id v15;
  __int16 v16;
  BRCXPCClient *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BRCXPCClient _isAppLibraryProxyEntitled](self, "_isAppLibraryProxyEntitled"))
    goto LABEL_12;
  if (!-[BRCXPCClient isSandboxed](self, "isSandboxed") && -[BRCXPCClient checkTCCAccess](self, "checkTCCAccess"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] granting access to %@ for non-sandboxed app %@%@", (uint8_t *)&v14, 0x20u);
    }

    goto LABEL_12;
  }
  -[BRCXPCClient entitledAppLibraryIDs](self, "entitledAppLibraryIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    if (!v6
      || (objc_msgSend(v6, "appLibraryOrZoneName"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "containsObject:", v10),
          v10,
          v11))
    {
      if (-[BRCXPCClient cloudEnabledStatus](self, "cloudEnabledStatus") == 1)
      {

LABEL_12:
        v12 = 1;
        goto LABEL_16;
      }
    }
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 1, CFSTR("Not entitled to access container"));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (BOOL)_canCreateAppLibraryWithID:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!-[BRCXPCClient _isAppLibraryProxyEntitled](self, "_isAppLibraryProxyEntitled"))
  {
    -[BRCXPCClient entitledAppLibraryIDs](self, "entitledAppLibraryIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "appLibraryOrZoneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        && objc_msgSend(v8, "containsObject:", v9)
        && -[BRCXPCClient cloudEnabledStatus](self, "cloudEnabledStatus") == 1)
      {

        v7 = 1;
LABEL_12:

        goto LABEL_13;
      }

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 1, CFSTR("Not entitled to create container"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_12;
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_isAppLibraryProxyWithError:(id *)a3
{
  BOOL result;
  void *v6;
  NSObject *v7;
  id v8;

  if (-[BRCXPCClient _isAppLibraryProxyEntitled](self, "_isAppLibraryProxyEntitled")
    || !-[BRCXPCClient isSandboxed](self, "isSandboxed") && -[BRCXPCClient checkTCCAccess](self, "checkTCCAccess"))
  {
    return 1;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    -[BRCXPCClient _isAppLibraryProxyWithError:].cold.1();

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 1, CFSTR("Not a container proxy"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v8;
  return result;
}

- (BOOL)_hasPrivateIPCEntitlementForSelector:(SEL)a3 error:(id *)a4
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  BRCXPCClient *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[BRCXPCClient _isAutomationEntitled](self, "_isAutomationEntitled"))
    return 1;
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCXPCClient _entitlementValueForKey:ofClass:](self, "_entitlementValueForKey:ofClass:", *MEMORY[0x1E0D10C50], objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "containsObject:", v8);
  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] %@: is trying to call %@, but has no access%@", buf, 0x20u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 1, CFSTR("Not entitled to access: %@"), v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  NSXPCConnection **p_connection;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_connection = &self->_connection;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_entitlementBooleanValueForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BRCXPCClient _entitlementValueForKey:ofClass:](self, "_entitlementValueForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BRMangledID)defaultMangledID
{
  BRCXPCClient *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCClientPrivilegesDescriptor defaultAppLibraryID](v2->_clientPriviledgesDescriptor, "defaultAppLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D10E88]);
    -[BRCClientPrivilegesDescriptor defaultAppLibraryID](v2->_clientPriviledgesDescriptor, "defaultAppLibraryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithAppLibraryName:", v5);

  }
  else
  {
    v6 = 0;
  }

  objc_sync_exit(v2);
  return (BRMangledID *)v6;
}

- (NSSet)entitledAppLibraryIDs
{
  BRCXPCClient *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCClientPrivilegesDescriptor appLibraryIDs](v2->_clientPriviledgesDescriptor, "appLibraryIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)_isAppLibraryProxyEntitled
{
  BRCXPCClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRCClientPrivilegesDescriptor isProxyEntitled](v2->_clientPriviledgesDescriptor, "isProxyEntitled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_isAutomationEntitled
{
  BRCXPCClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRCClientPrivilegesDescriptor isAutomationEntitled](v2->_clientPriviledgesDescriptor, "isAutomationEntitled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasPrivateSharingInterfaceEntitlement
{
  BRCXPCClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRCClientPrivilegesDescriptor isSharingPrivateInterfaceEntitled](v2->_clientPriviledgesDescriptor, "isSharingPrivateInterfaceEntitled");
  objc_sync_exit(v2);

  return v3;
}

- (NSString)bundleID
{
  BRCXPCClient *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCClientPrivilegesDescriptor applicationIdentifier](v2->_clientPriviledgesDescriptor, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (BOOL)isSandboxed
{
  return 1;
}

- (void)_auditURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  BRCXPCClient *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "br_isSideFaultName"))
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      objc_msgSend(v4, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1CBD43000, v7, (os_log_type_t)0x90u, "[ERROR] Client %@ gave us a non-existing fault URL path %@%@", (uint8_t *)&v9, 0x20u);

    }
    goto LABEL_6;
  }
LABEL_7:

}

- (id)_auditedURLFromPath:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCXPCClient _auditURL:](self, "_auditURL:", v4);
  return v4;
}

- (BOOL)canAccessPath:(const char *)a3 accessKind:(int64_t)a4
{
  __int128 v7;
  int v8;
  __int128 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  const char *v18;
  _BYTE buf[32];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&self->auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
  *(_OWORD *)&buf[16] = v7;
  v18 = a3;
  v8 = sandbox_check_by_audit_token();
  if (!a4 && !v8)
  {
    v9 = *(_OWORD *)&self->auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
    *(_OWORD *)&buf[16] = v9;
    v18 = a3;
    if (sandbox_check_by_audit_token())
      goto LABEL_4;
LABEL_9:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (!v8)
    goto LABEL_9;
LABEL_4:
  v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (!v10)
    return v10;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) != 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v14;
      v16 = "[DEBUG] %@: denied access to %s%@";
LABEL_14:
      _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v14;
      v16 = "[DEBUG] %@: file doesn't exist at path: %s%@";
      goto LABEL_14;
    }
  }

  LOBYTE(v10) = 0;
  return v10;
}

- (void)performBlockWithAnySession:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void (**v6)(_QWORD);
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(_QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__48;
  v14 = __Block_byref_object_dispose__48;
  -[BRCXPCClient session](self, "session");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v11[5])
  {
    v4[2](v4);
  }
  else
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__BRCXPCClient_performBlockWithAnySession___block_invoke;
    v7[3] = &unk_1E8766350;
    v9 = &v10;
    v6 = v4;
    v8 = v6;
    objc_msgSend(v5, "enumerateAccountHandlers:", v7);

    if (!v11[5])
      ((void (*)(void (**)(_QWORD), _QWORD))v6[2])(v6, 0);

  }
  _Block_object_dispose(&v10, 8);

}

void __43__BRCXPCClient_performBlockWithAnySession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = v3;
    objc_msgSend(v3, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v8;
    if (v4)
    {
      objc_msgSend(v8, "session");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v3 = v8;
    }
  }

}

- (void)_becameXPCCLientOfSession:(id)a3
{
  BRCAccountSession *v4;
  BRCXPCClient *v5;
  NSMutableDictionary *personaMonitorCounts;
  uint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v4 = (BRCAccountSession *)a3;
  v5 = self;
  objc_sync_enter(v5);
  personaMonitorCounts = v5->_personaMonitorCounts;
  if (!personaMonitorCounts)
  {
    v7 = objc_opt_new();
    v8 = v5->_personaMonitorCounts;
    v5->_personaMonitorCounts = (NSMutableDictionary *)v7;

    personaMonitorCounts = v5->_personaMonitorCounts;
  }
  -[BRCAccountSession personaIdentifier](v4, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](personaMonitorCounts, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "longLongValue");
  v12 = v11;
  if (v11 < 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCXPCClient _becameXPCCLientOfSession:].cold.1();

  }
  else if (!v11 && v5->__session != v4)
  {
    -[BRCAccountSession registerClient:](v4, "registerClient:", v5);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5->_personaMonitorCounts;
  -[BRCAccountSession personaIdentifier](v4, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  objc_sync_exit(v5);
}

- (void)_finishedXPCClientOfSession:(id)a3
{
  BRCAccountSession *v4;
  BRCXPCClient *v5;
  NSMutableDictionary *personaMonitorCounts;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (BRCAccountSession *)a3;
  v5 = self;
  objc_sync_enter(v5);
  personaMonitorCounts = v5->_personaMonitorCounts;
  -[BRCAccountSession personaIdentifier](v4, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](personaMonitorCounts, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "longLongValue");
  v10 = v9;
  if (v9 <= 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[BRCAccountSession personaIdentifier](v4, "personaIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCXPCClient _finishedXPCClientOfSession:].cold.1(v15, (uint64_t)v13, v19, v14);
    }

    goto LABEL_8;
  }
  if (v9 != 1)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5->_personaMonitorCounts;
    -[BRCAccountSession personaIdentifier](v4, "personaIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

    goto LABEL_9;
  }
  v11 = v5->_personaMonitorCounts;
  -[BRCAccountSession personaIdentifier](v4, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

  if (v5->__session != v4)
    -[BRCAccountSession unregisterClient:](v4, "unregisterClient:", v5);
LABEL_9:

  objc_sync_exit(v5);
}

- (BOOL)canAccessPhysicalURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(self) = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", objc_msgSend(v4, "fileSystemRepresentation"), 0);

  return (char)self;
}

- (id)issueContainerExtensionForURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)*MEMORY[0x1E0D10BB0];
  v6 = a3;
  objc_msgSend(v6, "brc_issueSandboxExtensionOfClass:error:", objc_msgSend(v5, "UTF8String"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_setupAppLibrary:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  brc_task_tracker *tracker;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__48;
  v21 = __Block_byref_object_dispose__48;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  tracker = self->_tracker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke;
  v13[3] = &unk_1E8766378;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v15 = &v17;
  v16 = a4;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke_73;
  v12[3] = &__block_descriptor_40_e5_v8__0l;
  v12[4] = a4;
  brc_task_tracker_sync(tracker, v13, v12);
  if (-[BRCXPCClient isUsingUbiquity](self, "isUsingUbiquity"))
    objc_msgSend((id)v18[5], "addClientUsingUbiquity:", self);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id *v13;
  uint64_t v14;
  const char *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_canCreateAppLibraryWithID:error:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v5);
  else
    objc_msgSend(v3, "appLibraryByMangledID:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = "create";
    if (!v2)
      v9 = "load";
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 1, CFSTR("can't %s app library for %@"), v9, *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v14 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        if (v14)
          v15 = "(passed to caller)";
        else
          v15 = "(ignored by caller)";
        v17 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
        v18 = 2080;
        v19 = v15;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        _os_log_error_impl(&dword_1CBD43000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    v13 = *(id **)(a1 + 56);
    if (v13)
      objc_storeStrong(v13, v10);

  }
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke_73(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id *v5;
  uint64_t v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 136315906;
      if (v6)
        v7 = "(passed to caller)";
      else
        v7 = "(ignored by caller)";
      v9 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
      v10 = 2080;
      v11 = v7;
      v12 = 2112;
      v13 = v2;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_1CBD43000, v4, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v8, 0x2Au);
    }

  }
  v5 = *(id **)(a1 + 32);
  if (v5)
    objc_storeStrong(v5, v2);

}

- (void)_waitForContainerToBeForcedIngestWithContainerID:(id)a3 containerURL:(id)a4 sandboxExtension:(id)a5 bundleVersion:(id)a6 error:(id)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, id, id, id, id);
  void *v18;
  NSObject *v19;
  int v20;
  BRCXPCClient *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, id, id, id, id))a8;
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = 138413570;
    v21 = self;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v20, 0x3Eu);
  }

  v17[2](v17, v13, v14, v15, v16);
}

- (void)_setupAppLibraryAndZoneWithID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD block[4];
  id v25;
  id location;
  uint8_t buf[4];
  BRCXPCClient *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  location = 0;
  v9 = a5;
  -[BRCXPCClient _setupAppLibrary:error:](self, "_setupAppLibrary:error:", v8, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v6)
    {
      -[BRCXPCClient session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientTruthWorkloop");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke;
      block[3] = &unk_1E875D500;
      v25 = v10;
      dispatch_async_and_wait(v12, block);

    }
    objc_msgSend(v10, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRCXPCClient canAccessPhysicalURL:](self, "canAccessPhysicalURL:", v13))
    {
      v14 = 0;
    }
    else
    {
      obj = location;
      -[BRCXPCClient issueContainerExtensionForURL:error:](self, "issueContainerExtensionForURL:error:", v13, &obj);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&location, obj);
      if (!v14)
      {

        v13 = 0;
      }
    }
    objc_msgSend(v10, "containerMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCXPCClient bundleID](self, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "versionNumberForBundleIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCXPCClient addAppLibrary:](self, "addAppLibrary:", v10);
    objc_msgSend(v8, "appLibraryOrZoneName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(location, "brc_wrappedError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCXPCClient _waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:](self, "_waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:", v21, v13, v14, v20, v22, v9);

    v9 = (id)v14;
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(location, "brc_wrappedError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v28 = self;
      v29 = 2112;
      v30 = 0;
      v31 = 2112;
      v32 = 0;
      v33 = 2112;
      v34 = 0;
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);

    }
    objc_msgSend(location, "brc_wrappedError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, v13);
  }

}

uint64_t __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recreateDocumentsFolderIfNeededOnDisk");
}

- (void)setupNonSandboxedAccessForUbiquityContainers:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  BRCXPCClient *v8;
  BRCClientPrivilegesDescriptor *v9;
  __int128 v10;
  BRCClientPrivilegesDescriptor *v11;
  void *v12;
  NSObject *v13;
  _BYTE v14[32];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [BRCClientPrivilegesDescriptor alloc];
  v10 = *(_OWORD *)&v8->auditToken.val[4];
  *(_OWORD *)v14 = *(_OWORD *)v8->auditToken.val;
  *(_OWORD *)&v14[16] = v10;
  v11 = -[BRCClientPrivilegesDescriptor initWithNonSandboxedAppWithAppLibraryIDs:bundleID:auditToken:](v9, "initWithNonSandboxedAppWithAppLibraryIDs:bundleID:auditToken:", v6, v7, v14);
  -[BRCXPCClient setPrivilegesDescriptor:](v8, "setPrivilegesDescriptor:", v11);

  objc_sync_exit(v8);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v14 = 138413058;
    *(_QWORD *)&v14[4] = v8;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v6;
    *(_WORD *)&v14[22] = 2112;
    *(_QWORD *)&v14[24] = v7;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: unsandboxed app is now using %@ as %@%@", v14, 0x2Au);
  }

}

- (void)_startSharingOperationAfterAcceptation:(id)a3 client:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setRemoteClientProxy:", a4);
  objc_msgSend(v9, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSharedZone"))
  {
    objc_msgSend(v9, "clientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asSharedClientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v9, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shareAcceptOperationForItemID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] add dependency %@ for operation %@%@", (uint8_t *)&v18, 0x20u);
    }

    objc_msgSend(v8, "addDependency:", v14);
  }
  -[BRCXPCClient session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addMiscOperation:", v8);

  objc_msgSend(v8, "schedule");
}

- (void)setClientPriviledgesDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (BOOL)dieOnInvalidate
{
  return self->_dieOnInvalidate;
}

- (void)setIsUsingUbiquity:(BOOL)a3
{
  self->_isUsingUbiquity = a3;
}

void __65__BRCXPCClient_LegacyAdditions__performBlock_withSessionFromURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_obfuscatedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't switch personas to look up session from url %@%@", v6, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)setSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: session != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - is now background%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - is now foreground%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona, bailing out%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_isAppLibraryProxyWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] %@ is talking to us without container proxy right%@");
  OUTLINED_FUNCTION_2();
}

- (void)_becameXPCCLientOfSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: count >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_finishedXPCClientOfSession:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No xpc client group found for %@%@", buf, 0x16u);

}

@end
