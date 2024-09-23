@implementation BRCAccountSession

- (void)addOfflineServerZone:(id)a3
{
  brc_mutex *p_zonesLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *v10;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  id v18;

  v18 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_serverZonesByZoneRowID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    self->_serverZonesByZoneRowID = v5;

  }
  v7 = v18;
  if (!self->_sharedServerZonesByMangledID)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
    self->_sharedServerZonesByMangledID = v8;

    v7 = v18;
  }
  if (!self->_privateServerZonesByID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    privateServerZonesByID = self->_privateServerZonesByID;
    self->_privateServerZonesByID = v10;

    v7 = v18;
  }
  objc_msgSend(v7, "setSession:", self);
  v12 = self->_serverZonesByZoneRowID;
  objc_msgSend(v18, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v18, v13);

  if (objc_msgSend(v18, "isSharedZone"))
  {
    v14 = self->_sharedServerZonesByMangledID;
    objc_msgSend(v18, "asSharedZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mangledID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, v16);

  }
  else
  {
    v17 = self->_privateServerZonesByID;
    objc_msgSend(v18, "zoneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, v15);
  }

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineClientZone:(id)a3
{
  brc_mutex *p_zonesLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *privateClientZonesByID;
  NSMutableDictionary *v7;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_privateClientZonesByID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    privateClientZonesByID = self->_privateClientZonesByID;
    self->_privateClientZonesByID = v5;

  }
  if (!self->_sharedClientZonesByMangledID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
    self->_sharedClientZonesByMangledID = v7;

  }
  objc_msgSend(v14, "setSession:", self);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  objc_msgSend(v14, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](serverZonesByZoneRowID, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v14, "associateWithServerZone:offline:", v11, 1);
  if (objc_msgSend(v14, "isSharedZone"))
  {
    v12 = self->_sharedClientZonesByMangledID;
    objc_msgSend(v14, "mangledID");
  }
  else
  {
    v12 = self->_privateClientZonesByID;
    objc_msgSend(v14, "zoneName");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, v13);

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineAppLibrary:(id)a3
{
  brc_mutex *p_zonesLock;
  id v5;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;

  p_zonesLock = &self->_zonesLock;
  v5 = a3;
  brc_mutex_lock(&p_zonesLock->pthread);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  if (!appLibrariesByRowID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_appLibrariesByRowID;
    self->_appLibrariesByRowID = v7;

    appLibrariesByRowID = self->_appLibrariesByRowID;
  }
  objc_msgSend(v5, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](appLibrariesByRowID, "setObject:forKeyedSubscript:", v5, v9);

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (OS_dispatch_workloop)clientTruthWorkloop
{
  return self->_clientTruthWorkloop;
}

- (OS_dispatch_workloop)readOnlyWorkloop
{
  return self->_readOnlyWorkloop;
}

- (OS_dispatch_workloop)serverTruthWorkloop
{
  return self->_serverTruthWorkloop;
}

- (unint64_t)databaseIDHash
{
  return -[NSString hash](self->_databaseID, "hash");
}

- (BRCClientState)clientState
{
  return self->_clientState;
}

- (BRCServerPersistedState)serverState
{
  return self->_serverState;
}

- (BRCPQLConnection)clientDB
{
  return self->_clientDB;
}

- (BRCPQLConnection)serverDB
{
  return self->_serverDB;
}

- (BRCPQLConnection)readOnlyDB
{
  BRCAccountSession *v2;
  BRCPQLConnection *v3;
  BRCPQLConnection *v4;
  BRCPQLConnection *v5;
  id v6;
  void *v7;
  BRCPQLConnection *clientDB;
  void *v9;
  NSObject *v10;
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_readOnlyDB;
  if (v3)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    v12 = 0;
    v4 = -[BRCAccountSession newConnectionWithLabel:readonly:error:](v2, "newConnectionWithLabel:readonly:error:", CFSTR("readonly-interactive-db"), 1, &v12);
    v6 = v12;
    if (v4)
    {
      -[BRCAccountSession readOnlyWorkloop](v2, "readOnlyWorkloop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection useSerialQueueWithTarget:](v4, "useSerialQueueWithTarget:", v7);

      objc_storeStrong((id *)&v2->_readOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) readOnlyDB].cold.1();

      clientDB = v2->_clientDB;
    }
    v5 = clientDB;

  }
  objc_sync_exit(v2);

  return v5;
}

- (BRCPQLConnection)expensiveReadOnlyDB
{
  BRCAccountSession *v2;
  BRCPQLConnection *v3;
  BRCPQLConnection *v4;
  BRCPQLConnection *v5;
  id v6;
  void *v7;
  BRCPQLConnection *clientDB;
  void *v9;
  NSObject *v10;
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expensiveReadOnlyDB;
  if (v3)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    v12 = 0;
    v4 = -[BRCAccountSession newConnectionWithLabel:readonly:error:](v2, "newConnectionWithLabel:readonly:error:", CFSTR("readonly-expensive-db"), 1, &v12);
    v6 = v12;
    if (v4)
    {
      -[BRCAccountSession readOnlyWorkloop](v2, "readOnlyWorkloop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection useSerialQueueWithTarget:](v4, "useSerialQueueWithTarget:", v7);

      objc_storeStrong((id *)&v2->_expensiveReadOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) expensiveReadOnlyDB].cold.1();

      clientDB = v2->_clientDB;
    }
    v5 = clientDB;

  }
  objc_sync_exit(v2);

  return v5;
}

- (void)dbBecameCorruptedWithDescription:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  BRCAccountSession *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *dbCorruptionQueue;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_dbCorruptionQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("db-corrupting-handler-queue", v12);

    dbCorruptionQueue = v8->_dbCorruptionQueue;
    v8->_dbCorruptionQueue = (OS_dispatch_queue *)v13;

    -[BRCAccountSession captureDBCorruptionInfoWithDescription:error:](v8, "captureDBCorruptionInfoWithDescription:error:", v6, v7);
    objc_sync_exit(v8);

    -[BRCAccountSession fileUnlinker](v8, "fileUnlinker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v8->_dbURL, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "renameAndUnlinkInBackgroundItemAtPath:", v16);

    -[BRCAccountSession fileUnlinker](v8, "fileUnlinker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession sessionDirPath](v8, "sessionDirPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "renameAndUnlinkInBackgroundItemAtPath:", v18);

    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("db was corrupted with description - '%@' and due to - %@"), v6, v7);
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      brc_append_system_info_to_message();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v21;
      v25 = 2112;
      v26 = v19;
      _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);

    }
    brc_append_system_info_to_message();
    v22 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) dbBecameCorruptedWithDescription:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 299, v22);
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Corrupting handling is already in-flight%@", buf, 0xCu);
  }

  objc_sync_exit(v8);
}

- (id)newConnection:(id)a3
{
  id v4;
  BRCPQLConnection *v5;
  BRCPQLConnection *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [BRCPQLConnection alloc];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55__BRCAccountSession_BRCDatabaseManager__newConnection___block_invoke;
  v11 = &unk_1E875D878;
  objc_copyWeak(&v12, &location);
  v6 = -[BRCPQLConnection initWithLabel:dbCorruptionHandler:](v5, "initWithLabel:dbCorruptionHandler:", v4, &v8);
  -[BRCPQLConnection setAssertionPersonaIdentifier:](v6, "setAssertionPersonaIdentifier:", self->_personaIdentifier, v8, v9, v10, v11);
  -[BRCPQLConnection setStatementCacheMaxCount:](v6, "setStatementCacheMaxCount:", 10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __55__BRCAccountSession_BRCDatabaseManager__newConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "dbBecameCorruptedWithDescription:error:", CFSTR("Invoked from DB Corruption Handler"), v4);

}

+ (id)sessionForBackingUpDatabasesAtURL:(id)a3
{
  NSURL *v3;
  BRCAccountSession *v4;
  NSURL *dbURL;

  v3 = (NSURL *)a3;
  v4 = objc_alloc_init(BRCAccountSession);
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;

  return v4;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3 with:(id)a4
{
  NSURL *v5;
  BRDSIDString *v6;
  BRCAccountSession *v7;
  NSURL *dbURL;
  NSURL *v9;
  BRDSIDString *accountDSID;
  BRDSIDString *v11;
  BRCPQLConnection *serverDB;
  void *v13;
  BRCPQLConnection *clientDB;
  void *v15;

  v5 = (NSURL *)a3;
  v6 = (BRDSIDString *)a4;
  v7 = objc_alloc_init(BRCAccountSession);
  -[BRCAccountSession setupDatabase](v7, "setupDatabase");
  dbURL = v7->_dbURL;
  v7->_dbURL = v5;
  v9 = v5;

  accountDSID = v7->_accountDSID;
  v7->_accountDSID = v6;
  v11 = v6;

  serverDB = v7->_serverDB;
  -[BRCAccountSession serverTruthWorkloop](v7, "serverTruthWorkloop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](serverDB, "useSerialQueueWithTarget:", v13);

  clientDB = v7->_clientDB;
  -[BRCAccountSession clientTruthWorkloop](v7, "clientTruthWorkloop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](clientDB, "useSerialQueueWithTarget:", v15);

  -[BRCAccountSession openForDumping](v7, "openForDumping");
  return v7;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sessionForDumpingDatabasesAtURL:with:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sessionForSendingTelemetryAtURL:(id)a3
{
  NSURL *v3;
  BRCAccountSession *v4;
  NSURL *dbURL;
  NSURL *v6;
  BRCPQLConnection *serverDB;
  void *v8;
  BRCPQLConnection *clientDB;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (NSURL *)a3;
  v4 = objc_alloc_init(BRCAccountSession);
  -[BRCAccountSession setupDatabase](v4, "setupDatabase");
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;
  v6 = v3;

  serverDB = v4->_serverDB;
  -[BRCAccountSession serverTruthWorkloop](v4, "serverTruthWorkloop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](serverDB, "useSerialQueueWithTarget:", v8);

  clientDB = v4->_clientDB;
  -[BRCAccountSession clientTruthWorkloop](v4, "clientTruthWorkloop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](clientDB, "useSerialQueueWithTarget:", v10);

  -[BRCAccountSession openForSendingTelemetry](v4, "openForSendingTelemetry");
  +[BRCDaemon daemon](BRCDaemon, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();

  objc_msgSend(v11, "setContainerClass:", v12);
  return v4;
}

+ (id)sessionForCheckingInconsistencies
{
  BRCAccountSession *v2;
  BRCPQLConnection *serverDB;
  void *v4;
  BRCPQLConnection *clientDB;
  void *v6;

  v2 = objc_alloc_init(BRCAccountSession);
  serverDB = v2->_serverDB;
  -[BRCAccountSession serverTruthWorkloop](v2, "serverTruthWorkloop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](serverDB, "useSerialQueueWithTarget:", v4);

  clientDB = v2->_clientDB;
  -[BRCAccountSession clientTruthWorkloop](v2, "clientTruthWorkloop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](clientDB, "useSerialQueueWithTarget:", v6);

  return v2;
}

- (void)setupDatabase
{
  BRCPQLConnection *v3;
  BRCPQLConnection *serverDB;
  BRCPQLConnection *v5;
  BRCPQLConnection *clientDB;
  id v7;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[BRCAccountSession newConnection:](self, "newConnection:", CFSTR("serverTruth"));
  serverDB = self->_serverDB;
  self->_serverDB = v3;

  v5 = -[BRCAccountSession newConnection:](self, "newConnection:", CFSTR("clientTruth"));
  clientDB = self->_clientDB;
  self->_clientDB = v5;

  -[BRCPQLConnection setStatementCacheMaxCount:](self->_serverDB, "setStatementCacheMaxCount:", objc_msgSend(v7, "statementCacheMaxCountForServerTruth"));
  -[BRCPQLConnection setStatementCacheMaxCount:](self->_clientDB, "setStatementCacheMaxCount:", objc_msgSend(v7, "statementCacheMaxCountForClientTruth"));

}

- (void)_startWatcher
{
  id v3;
  const char *v4;
  unsigned int v5;
  unsigned int v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *dbWatcher;
  OS_dispatch_source *v9;
  void (**v10)(_QWORD *);
  void *v11;
  dispatch_block_t v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[4];
  unsigned int v22;

  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("client.db"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  v5 = open(v4, 33028);
  if ((v5 & 0x80000000) != 0)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't open the client db we've just created %{errno}d"), *__error());
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

    brc_append_system_info_to_message();
    v20 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _startWatcher]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 391, v20);
  }
  v6 = v5;
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v5, 1uLL, (dispatch_queue_t)self->_dbWatcherQueue);
  dbWatcher = self->_dbWatcher;
  self->_dbWatcher = v7;

  v9 = self->_dbWatcher;
  v10 = (void (**)(_QWORD *))MEMORY[0x1E0D11070];
  if (*MEMORY[0x1E0D11070])
  {
    ((void (*)(void *))*MEMORY[0x1E0D11070])(&__block_literal_global_6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &__block_literal_global_6;
  }
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v11);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v12);

  v13 = self->_dbWatcher;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__BRCAccountSession_BRCDatabaseManager___startWatcher__block_invoke_2;
  v21[3] = &__block_descriptor_36_e5_v8__0l;
  v22 = v6;
  v14 = v13;
  v15 = v21;
  v16 = v15;
  if (*v10)
  {
    (*v10)(v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  dispatch_source_set_cancel_handler(v14, v16);

  dispatch_resume((dispatch_object_t)self->_dbWatcher);
}

void __54__BRCAccountSession_BRCDatabaseManager___startWatcher__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  const char *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("someone ripped the database from under our feet"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412546;
    v5 = v2;
    v6 = 2112;
    v7 = v0;
    _os_log_fault_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v4, 0x16u);

  }
  brc_append_system_info_to_message();
  v3 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _startWatcher]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 396, v3);
}

uint64_t __54__BRCAccountSession_BRCDatabaseManager___startWatcher__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopDBWatcher
{
  NSObject *dbWatcherQueue;
  _QWORD block[5];

  dbWatcherQueue = self->_dbWatcherQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__BRCAccountSession_BRCDatabaseManager__stopDBWatcher__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(dbWatcherQueue, block);
}

void __54__BRCAccountSession_BRCDatabaseManager__stopDBWatcher__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

  }
}

- (BOOL)_openConnection:(id)a3 databaseName:(id)a4 readonly:(BOOL)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  BOOL v12;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  LODWORD(v7) = objc_msgSend((id)objc_opt_class(), "_openConnection:databaseName:baseURL:readonly:error:", v10, v11, self->_dbURL, v7, a6);

  if ((_DWORD)v7)
    v12 = -[BRCAccountSession _registerDynamicDBFunctions:error:](self, "_registerDynamicDBFunctions:error:", v10, a6);
  else
    v12 = 0;

  return v12;
}

+ (BOOL)_openConnection:(id)a3 databaseName:(id)a4 baseURL:(id)a5 readonly:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  if (v8)
    v13 = 3145729;
  else
    v13 = 3145734;
  objc_msgSend(a5, "URLByAppendingPathComponent:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "openAtURL:withFlags:error:", v14, v13, a7);

  if (!v15)
    goto LABEL_9;
  if (!v8)
    objc_msgSend(v11, "setSynchronousMode:", objc_msgSend(v12, "isEqualToString:", CFSTR("checker.db")) ^ 1);
  if (+[BRCAccountSession _registerStaticDBFunctions:error:](BRCAccountSession, "_registerStaticDBFunctions:error:", v11, a7))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v16, "sqliteCacheSize"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v16, "sqliteCacheSpill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DE81E0];
    v20 = objc_retainAutorelease(v17);
    objc_msgSend(v19, "rawInjection:length:", objc_msgSend(v20, "UTF8String"), objc_msgSend(v20, "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "execute:", CFSTR("PRAGMA cache_size = %@"), v21);

    v22 = (void *)MEMORY[0x1E0DE81E0];
    v23 = objc_retainAutorelease(v18);
    objc_msgSend(v22, "rawInjection:length:", objc_msgSend(v23, "UTF8String"), objc_msgSend(v23, "length"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "execute:", CFSTR("PRAGMA cache_spill = %@"), v24);

    v25 = 1;
  }
  else
  {
LABEL_9:
    v25 = 0;
  }

  return v25;
}

+ (BOOL)_registerStaticDBFunctions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke;
  v9[3] = &unk_1E875E1A8;
  v6 = v5;
  v10 = v6;
  if (objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("migration_is_parented_or_equal_to_old_doc_id"), 2, v9, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("document_is_evictable"), 1, &__block_literal_global_52_0, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("document_is_indexable"), 1, &__block_literal_global_55,
                       a4))
  {
    v7 = objc_msgSend(v6, "registerFunction:nArgs:handler:", CFSTR("ckinfo_etags_are_equal"), 2, &__block_literal_global_58);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSObject *v21;
  sqlite3_context *v22;

  pql_sqlite3_value_object();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1();

    sqlite3_result_null(a2);
    goto LABEL_23;
  }
  v22 = a2;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteValue:", *(_QWORD *)(a4 + 8));
  v9 = -1000;
  while (1)
  {
    v10 = (void *)MEMORY[0x1D17A6BE8]();
    if (!v8)
      goto LABEL_18;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("root")) & 1) != 0)
    {
      v19 = 0;
LABEL_16:
      sqlite3_result_int(v22, v19);

      objc_autoreleasePoolPop(v10);
      goto LABEL_22;
    }
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("documents")) & 1) != 0)
    {
      v19 = 1;
      goto LABEL_16;
    }

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v7, "dbRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "fetch:", CFSTR("SELECT item_parent_id FROM client_items WHERE zone_rowid = %@ AND item_id = %@"), v13, v8);

    if ((objc_msgSend(v14, "next") & 1) == 0)
      break;
    objc_msgSend(v14, "dataAtIndex:", 0);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    v8 = (void *)v15;
    if (__CFADD__(v9++, 1))
      goto LABEL_19;
  }

LABEL_18:
  objc_autoreleasePoolPop(v10);
  v15 = (uint64_t)v8;
LABEL_19:
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2();

  sqlite3_result_null(v22);
  v8 = (void *)v15;
LABEL_22:

LABEL_23:
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_51(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v5;

  v5 = sqlite3_value_int64(*a4) & 1;
  sqlite3_result_int(a2, v5);
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  unsigned int v5;

  v5 = (sqlite3_value_int64(*a4) >> 1) & 1;
  sqlite3_result_int(a2, v5);
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", *a4);
  v7 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", a4[1]);
  objc_msgSend(v11, "etag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "etag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      sqlite3_result_int(a2, 1);
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v11, "etag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "etag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_result_int(a2, objc_msgSend(v9, "isEqualToString:", v10));

  if (!v8)
    goto LABEL_6;
LABEL_7:

}

- (BOOL)_registerDynamicDBFunctions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke;
  v17[3] = &unk_1E875E230;
  objc_copyWeak(&v18, &location);
  v8 = (void *)MEMORY[0x1D17A6DB0](v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_60;
  v15[3] = &unk_1E875E230;
  objc_copyWeak(&v16, &location);
  v9 = (void *)MEMORY[0x1D17A6DB0](v15);
  if (objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("trigger_notification"), 1, v8, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("bump_notifs_rank"), 0, v9, a4))
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2;
    v12[3] = &unk_1E875E258;
    v13 = v8;
    v14 = v9;
    v10 = objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("bump_notifs_rank_and_trigger_notifs"), 1, v12, a4);

  }
  else
  {
    v10 = 0;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3_value **a4)
{
  id WeakRetained;
  sqlite3_int64 v6;
  void *v7;
  NSObject *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = sqlite3_value_int64(*a4);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1((uint64_t)v7, v6, v8);

  objc_msgSend(WeakRetained, "notificationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queueUpdateForItemAtRowID:", v6);

}

void __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_60(uint64_t a1, sqlite3_context *a2)
{
  void *v3;
  sqlite3_int64 v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allocateNotifRank");

  sqlite3_result_int64(a2, v4);
}

uint64_t __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_setupConnection:(id)a3 readonly:(BOOL)a4 forChecker:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  char v20;
  _BOOL4 v22;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = a5;
  v22 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  if (v6)
    v8 = &unk_1E87D87A8;
  else
    v8 = &unk_1E87D87C0;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    v13 = 0x1E0CB3000uLL;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@.db"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v18 = v13;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v25, "attachDBAtPath:as:error:", v19, v15, a6);

          v13 = v18;
          if ((v20 & 1) == 0)
            goto LABEL_16;
        }
        else if (!-[BRCAccountSession _openConnection:databaseName:readonly:error:](self, "_openConnection:databaseName:readonly:error:", v25, v16, v22, a6))
        {
LABEL_16:

          v11 = 0;
          goto LABEL_18;
        }

        v11 = 1;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_18:

  return v11;
}

- (id)newConnectionWithLabel:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = -[BRCAccountSession newConnection:](self, "newConnection:", v8);
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("checker"));

  if (-[BRCAccountSession _setupConnection:readonly:forChecker:error:](self, "_setupConnection:readonly:forChecker:error:", v9, v6, v10, a5))
  {
    v11 = v9;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (BOOL)_setupBackupDetector:(backup_detector *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  const char *v21;
  const char *v22;
  __darwin_ino64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-odd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-even"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  a3->var2 = 0;
  v9 = objc_retainAutorelease(v7);
  if (create_control_file((char *)objc_msgSend(v9, "fileSystemRepresentation"), &v23, 1))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[BRCAccountSession(BRCDatabaseManager) _setupBackupDetector:error:]";
        v26 = 2080;
        if (!a4)
          v21 = "(ignored by caller)";
        v27 = (unint64_t)v21;
        v28 = 2112;
        v29 = (unint64_t)v10;
        v30 = 2112;
        v31 = v11;
        _os_log_error_impl(&dword_1CBD43000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      goto LABEL_6;
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  a3->var0 = v23;
  if (!create_control_file((char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), &v23, 1))
  {
    a3->var1 = v23;
    brc_bread_crumbs();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      *(_DWORD *)buf = 134218754;
      v25 = (const char *)var0;
      v26 = 2048;
      v27 = var1;
      v28 = 2048;
      v29 = var2;
      v30 = 2112;
      v31 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector initialized {old:%llu; new:%llu; c:%llu}%@",
        buf,
        0x2Au);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v25 = "-[BRCAccountSession(BRCDatabaseManager) _setupBackupDetector:error:]";
      v26 = 2080;
      if (!a4)
        v22 = "(ignored by caller)";
      v27 = (unint64_t)v22;
      v28 = 2112;
      v29 = (unint64_t)v10;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (!a4)
    goto LABEL_13;
LABEL_6:
  v10 = v10;
  v13 = 0;
  v14 = *a4;
  *a4 = v10;
LABEL_7:

LABEL_14:
  return v13;
}

- (BOOL)_stepBackupDetector:(backup_detector *)a3 newState:(backup_detector *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  unint64_t var1;
  void *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  unint64_t var2;
  NSObject *v33;
  const char *v35;
  __darwin_ino64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t var0;
  stat v44;
  uint8_t buf[4];
  const char *st_ino;
  __int16 v47;
  _BYTE v48[18];
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-odd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-even"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  memset(&v44, 0, sizeof(v44));
  if ((a3->var2 & 1) != 0)
    v10 = v9;
  v12 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation", *(_QWORD *)&v44.st_dev);
  if (lstat(v12, &v44))
  {
    v13 = *__error();
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 136315650;
      st_ino = v12;
      v47 = 1024;
      *(_DWORD *)v48 = v13;
      *(_WORD *)&v48[4] = 2112;
      *(_QWORD *)&v48[6] = v14;
      _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] failed stating '%s' %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v13;
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        st_ino = "-[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
        v47 = 2080;
        if (!a5)
          v35 = "(ignored by caller)";
        *(_QWORD *)v48 = v35;
        *(_WORD *)&v48[8] = 2112;
        *(_QWORD *)&v48[10] = v16;
        v49 = 2112;
        v50 = (unint64_t)v17;
        _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      goto LABEL_10;
    goto LABEL_33;
  }
  if (v44.st_ino != a3->var1)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      var1 = a3->var1;
      *(_DWORD *)buf = 134218754;
      st_ino = (const char *)v44.st_ino;
      v47 = 2048;
      *(_QWORD *)v48 = var1;
      *(_WORD *)&v48[8] = 2080;
      *(_QWORD *)&v48[10] = v12;
      v49 = 2112;
      v50 = (unint64_t)v24;
      _os_log_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] backup detected: ino %llu instead of %llu at '%s'\n%@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 70);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_32:
      if (a5)
      {
LABEL_10:
        v16 = objc_retainAutorelease(v16);
        v19 = 0;
        *a5 = v16;
        goto LABEL_41;
      }
LABEL_33:
      v19 = 0;
      goto LABEL_41;
    }
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
LABEL_31:

      goto LABEL_32;
    }
    v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    v47 = 2080;
    if (!a5)
      v29 = "(ignored by caller)";
LABEL_48:
    *(_QWORD *)v48 = v29;
    *(_WORD *)&v48[8] = 2112;
    *(_QWORD *)&v48[10] = v16;
    v49 = 2112;
    v50 = (unint64_t)v27;
    _os_log_error_impl(&dword_1CBD43000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_31;
  }
  if ((a3->var2 & 1) != 0)
    v20 = v11;
  else
    v20 = v9;
  v21 = (char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
  if (!lstat(v21, &v44))
  {
    if (v44.st_ino != a3->var0)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        var0 = a3->var0;
        *(_DWORD *)buf = 136315906;
        st_ino = v21;
        v47 = 2048;
        *(_QWORD *)v48 = v44.st_ino;
        *(_WORD *)&v48[8] = 2048;
        *(_QWORD *)&v48[10] = var0;
        v49 = 2112;
        v50 = (unint64_t)v30;
        _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] mismatch on new control file '%s': %llu != %llu\n%@", buf, 0x2Au);
      }

      goto LABEL_37;
    }
    if (!create_control_file(v21, &v44.st_ino, 1))
    {
      v36 = v44.st_ino;
      a4->var0 = a3->var1;
      a4->var1 = v36;
      a4->var2 = a3->var2 + 1;
      goto LABEL_38;
    }
    goto LABEL_29;
  }
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:].cold.1();

  if (create_control_file(v21, &v44.st_ino, 1))
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_32;
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u))
      goto LABEL_31;
    v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    v47 = 2080;
    if (!a5)
      v29 = "(ignored by caller)";
    goto LABEL_48;
  }
LABEL_37:
  var2 = a3->var2;
  *(_OWORD *)&a4->var0 = *(_OWORD *)&a3->var0;
  a4->var2 = var2;
  a4->var0 = v44.st_ino;
LABEL_38:
  brc_bread_crumbs();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v37 = a3->var0;
    v38 = a3->var1;
    v39 = a4->var0;
    v40 = a4->var1;
    v41 = a3->var2;
    v42 = a4->var2;
    *(_DWORD *)buf = 134219522;
    st_ino = (const char *)v37;
    v47 = 2048;
    *(_QWORD *)v48 = v39;
    *(_WORD *)&v48[8] = 2048;
    *(_QWORD *)&v48[10] = v38;
    v49 = 2048;
    v50 = v40;
    v51 = 2048;
    v52 = v41;
    v53 = 2048;
    v54 = v42;
    v55 = 2112;
    v56 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector updated {old:%llu -> %llu; new:%llu -> %llu; c:%llu -> %llu}%@",
      buf,
      0x48u);
  }

  v19 = 1;
LABEL_41:

  return v19;
}

- (void)preventDatabaseFromBeingReused
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-odd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-even"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v3, &v15);
  v7 = v15;
  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v3;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }

  }
  v14 = v7;
  v10 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v14);
  v11 = v14;

  if ((v10 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }

  }
}

- (id)fixObfuscatedMangledID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  if (!self->_forDBDump)
    goto LABEL_6;
  if (fixObfuscatedMangledID__onceToken != -1)
    dispatch_once(&fixObfuscatedMangledID__onceToken, &__block_literal_global_86);
  v5 = objc_msgSend(v4, "length");
  v7 = objc_msgSend((id)fixObfuscatedMangledID____regex, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5);
  if (v7 || v6 != v5)
  {
    objc_msgSend(v4, "substringWithRange:", v7, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

void __64__BRCAccountSession_BRCDatabaseManager__fixObfuscatedMangledID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[a-zA-Z0-9\\-]+\\.[a-zA-Z0-9\\-\\.]+"), 0, 0);
  v1 = (void *)fixObfuscatedMangledID____regex;
  fixObfuscatedMangledID____regex = v0;

}

- (BOOL)saveServerZone:(id)a3 toDB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v14;
  NSObject *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveServerZone:toDB:].cold.2();

  }
  objc_msgSend(v5, "plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "execute:", CFSTR("UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@"), v8, v9);

  if (v10)
  {
    objc_msgSend(v5, "setNeedsSave:", 0);
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveServerZone:toDB:].cold.1();

  }
  return v10;
}

- (BOOL)saveServerZoneToDB:(id)a3
{
  return -[BRCAccountSession saveServerZone:toDB:](self, "saveServerZone:toDB:", a3, self->_serverDB);
}

- (BOOL)saveClientZoneToDB:(id)a3
{
  id v4;
  void *v5;
  BRCPQLConnection *clientDB;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v13;
  NSObject *v14;

  v4 = a3;
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveClientZoneToDB:].cold.2();

  }
  clientDB = self->_clientDB;
  objc_msgSend(v4, "plist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("UPDATE client_zones SET zone_plist = %@ WHERE rowid = %@"), v7, v8);

  if (v9)
  {
    objc_msgSend(v4, "setNeedsSave:", 0);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveClientZoneToDB:].cold.1();

  }
  return v9;
}

- (BOOL)createServerZone:(id)a3
{
  NSObject *v4;
  BRCPQLConnection *serverDB;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  BRCPQLConnection *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BRCPQLConnection *v27;
  void *v28;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  serverDB = self->_serverDB;
  -[NSObject ownerName](v4, "ownerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject zoneName](v4, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject plist](v4, "plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serverDB) = -[BRCPQLConnection execute:](serverDB, "execute:", CFSTR("INSERT OR IGNORE INTO server_zones (zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@)"), v6, v7, v8);

  if ((serverDB & 1) != 0)
  {
    if (-[BRCPQLConnection changes](self->_serverDB, "changes") < 1)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        -[BRCAccountSession(BRCDatabaseManager) createServerZone:].cold.3();

      v19 = self->_serverDB;
      -[NSObject ownerName](v4, "ownerName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject zoneName](v4, "zoneName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PQLConnection numberWithSQL:](v19, "numberWithSQL:", CFSTR("SELECT rowid from server_zones WHERE zone_owner = %@ and zone_name = %@"), v20, v21);

      if (!v10)
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(BRCDatabaseManager) createServerZone:].cold.2();

      }
      -[NSObject dbRowID](v4, "dbRowID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        brc_bread_crumbs();
        v23 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          -[NSObject dbRowID](v4, "dbRowID");
          v31 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v36 = v31;
          v37 = 2112;
          v38 = (uint64_t)v10;
          v39 = 2112;
          v40 = v23;
          _os_log_fault_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a new rowid for already existing zone (sct.dbRowID=%@ rowID=%@)%@", buf, 0x20u);

        }
      }
      else
      {
        -[NSObject setDbRowID:](v4, "setDbRowID:", v10);
      }
      v27 = self->_serverDB;
      -[NSObject plist](v4, "plist");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = -[BRCPQLConnection execute:](v27, "execute:", CFSTR("UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@"), v28, v10);

      if ((v27 & 1) != 0)
        goto LABEL_25;
      brc_bread_crumbs();
      v11 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        -[BRCPQLConnection lastError](self->_serverDB, "lastError");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v4;
        v37 = 2112;
        v38 = (uint64_t)v32;
        v39 = 2112;
        v40 = v11;
        _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to update plist for zone %@: %@%@", buf, 0x20u);

      }
    }
    else
    {
      -[NSObject dbRowID](v4, "dbRowID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setDbRowID:](v4, "setDbRowID:", v25);

        -[NSObject dbRowID](v4, "dbRowID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
LABEL_26:
          -[NSObject ownerName](v4, "ownerName");
          v14 = objc_claimAutoreleasedReturnValue();
          -[BRCAccountSession createUserKeyForOwnerName:](self, "createUserKeyForOwnerName:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15 != 0;
          goto LABEL_27;
        }
        brc_bread_crumbs();
        v10 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(BRCDatabaseManager) saveServerZone:toDB:].cold.2();
        goto LABEL_24;
      }
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      -[NSObject dbRowID](v4, "dbRowID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID");
      *(_DWORD *)buf = 138412802;
      v36 = v12;
      v37 = 2048;
      v38 = v13;
      v39 = 2112;
      v40 = v10;
      _os_log_fault_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: sct.dbRowID is %@ lastInsertedRow is %lld%@", buf, 0x20u);
    }

    goto LABEL_24;
  }
  brc_bread_crumbs();
  v14 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
  {
    -[BRCPQLConnection lastError](self->_serverDB, "lastError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v36 = v4;
    v37 = 2112;
    v38 = (uint64_t)v30;
    v39 = 2112;
    v40 = v14;
    _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] Failed to create server zone %@:  %@%@", buf, 0x20u);

  }
  v16 = 0;
LABEL_27:

  return v16;
}

- (BOOL)deleteServerZone:(id)a3
{
  BRCPQLConnection *serverDB;
  void *v4;

  serverDB = self->_serverDB;
  objc_msgSend(a3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serverDB) = -[BRCPQLConnection execute:](serverDB, "execute:", CFSTR("DELETE FROM server_zones WHERE rowid = %@"), v4);

  return (char)serverDB;
}

- (void)_enumerateAppLibraryRowIDs:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, void *, void *))a4;
  v6 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT container_id, rowid FROM rowid_reservations"));
  if (objc_msgSend(v6, "next"))
  {
    do
    {
      v7 = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v6, "stringAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v8, v9);

      objc_autoreleasePoolPop(v7);
    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }
  objc_msgSend(v6, "close");

}

- (id)_reserveRowIDForLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  if (!-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("INSERT INTO rowid_reservations (container_id) VALUES (%@)"), v4))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[BRCPQLConnection lastError](self->_serverDB, "lastError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v11 = v4;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_fault_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: couldn't allocate a rowid. libraryID %@ error %@%@", buf, 0x20u);

    }
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) createServerZone:].cold.2();
LABEL_8:

  }
  return v5;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4 supportsEnhancedDrivePrivacy:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v22;
  NSObject *v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:].cold.2();

  }
  objc_msgSend(v7, "plist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "childBasehashSalt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "saltingState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dbRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "execute:", CFSTR("UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@, child_basehash_salt = %@, salting_state = %@ WHERE rowid = %@"), v10, v11, v12, v13, v14);

    if (v15)
    {
LABEL_4:
      objc_msgSend(v7, "setNeedsSave:", 0);
      v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v7, "dbRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "execute:", CFSTR("UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@ WHERE rowid = %@"), v10, v11, v17);

    if (v18)
      goto LABEL_4;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:].cold.1();

  v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[BRCAccountSession saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:](self, "saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:", v7, v6, objc_msgSend(v8, "supportsEnhancedDrivePrivacy"));

  return (char)self;
}

- (BOOL)saveAppLibraryToDB:(id)a3
{
  return -[BRCAccountSession saveAppLibrary:toDB:](self, "saveAppLibrary:toDB:", a3, self->_clientDB);
}

- (id)newAppLibraryFromPQLResultSet:(id)a3 version:(int)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCAppLibrary *v16;
  void *v17;
  BRCAppLibrary *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  objc_msgSend(v6, "numberAtIndex:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  objc_msgSend(v6, "stringAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithAppLibraryName:", v9);
  _BRCClassesForContainerState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:atIndex:", v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "numberAtIndex:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 3)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberAtIndex:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v15, "intValue");

  }
  v16 = [BRCAppLibrary alloc];
  objc_msgSend(v6, "db");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v7;
  BYTE2(v20) = 0;
  LOWORD(v20) = 0;
  v18 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v16, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v10, v22, v13, v17, v12, self, v20, 0, v14, v21);

  return v18;
}

- (BOOL)_createAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BRCPQLConnection *clientDB;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;

  v4 = a3;
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _createAppLibrary:].cold.2();

  }
  objc_msgSend(v4, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:].cold.2();

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsEnhancedDrivePrivacy");

  clientDB = self->_clientDB;
  objc_msgSend(v4, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibraryID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneRowID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v8)
  {
    objc_msgSend(v4, "childBasehashSalt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "saltingState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state)  VALUES (%@, %@, %@, %@, %@, %@)"), v10, v11, v12, v14, v15, v16);

  }
  else
  {
    v17 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid)  VALUES (%@, %@, %@, %@)"), v10, v11, v12, v13);
  }

  return v17;
}

- (BOOL)_deleteAppLibrary:(id)a3
{
  BRCPQLConnection *clientDB;
  void *v4;

  clientDB = self->_clientDB;
  objc_msgSend(a3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientDB) = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("DELETE FROM app_libraries WHERE rowid = %@"), v4);

  return (char)clientDB;
}

- (id)_appLibrariesEnumerator:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsEnhancedDrivePrivacy");

  if (v6)
    v7 = 3;
  else
    v7 = 2;
  if (self->_forDBDump)
  {
    objc_msgSend(v4, "userVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongValue");

    if (v9 >= 0x7544)
      v7 = v7;
    else
      v7 = 2;
  }
  -[BRCAccountSession _appLibrariesEnumerator:version:](self, "_appLibrariesEnumerator:version:", v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_appLibrariesEnumerator:(id)a3 version:(int)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  int v12;

  if (a4 <= 2)
    v7 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries");
  else
    v7 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries");
  v8 = (void *)objc_msgSend(a3, "fetch:", v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__BRCAccountSession_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke;
  v11[3] = &unk_1E875E2A0;
  v11[4] = self;
  v12 = a4;
  objc_msgSend(v8, "enumerateObjects:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __73__BRCAccountSession_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newAppLibraryFromPQLResultSet:version:", a2, *(unsigned int *)(a1 + 40));
}

- (id)_appLibraryByName:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsEnhancedDrivePrivacy");

  if (v9)
    v10 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries WHERE app_library_name = %@");
  else
    v10 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@");
  v11 = (void *)objc_msgSend(v6, "fetch:", v10, v7);

  v12 = 0;
  if (objc_msgSend(v11, "next"))
  {
    if (v9)
      v13 = 3;
    else
      v13 = 2;
    v12 = -[BRCAccountSession newAppLibraryFromPQLResultSet:version:](self, "newAppLibraryFromPQLResultSet:version:", v11, v13);
  }

  return v12;
}

- (BOOL)_createClientZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BRCPQLConnection *clientDB;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  NSObject *v18;

  v4 = a3;
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) saveClientZoneToDB:].cold.2();

  }
  objc_msgSend(v4, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)*MEMORY[0x1E0C94730];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  clientDB = self->_clientDB;
  objc_msgSend(v4, "dbRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("INSERT OR REPLACE INTO client_zones (rowid, zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@, %@)"), v12, v10, v13, v14);
  return v15;
}

- (BOOL)_deleteClientZone:(id)a3
{
  BRCPQLConnection *clientDB;
  void *v4;

  clientDB = self->_clientDB;
  objc_msgSend(a3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientDB) = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("DELETE FROM client_zones where rowid = %@"), v4);

  return (char)clientDB;
}

- (id)newSharedClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSharedClientZone *v13;
  void *v15;
  NSObject *v16;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v9, v7);
  _BRCClassesForContainerState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:].cold.1();

  }
  v13 = -[BRCClientZone initWithMangledID:dbRowID:plist:session:initialCreation:]([BRCSharedClientZone alloc], "initWithMangledID:dbRowID:plist:session:initialCreation:", v10, v6, v12, self, 0);

  return v13;
}

- (id)_sharedClientZonesEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BRCAccountSession clientDB](self, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner != %@"), *MEMORY[0x1E0C94730]);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__BRCAccountSession_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke;
  v7[3] = &unk_1E875E2C8;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __69__BRCAccountSession_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSharedClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)newSharedServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSharedServerZone *v13;
  void *v15;
  NSObject *v16;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v9, v7);
  _BRCClassesForContainerState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:].cold.1();

  }
  v13 = -[BRCSharedServerZone initWithMangledID:dbRowID:plist:session:]([BRCSharedServerZone alloc], "initWithMangledID:dbRowID:plist:session:", v10, v6, v12, self);

  return v13;
}

- (id)_sharedServerZonesEnumerator:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(a3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner != %@"), *MEMORY[0x1E0C94730]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__BRCAccountSession_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke;
  v7[3] = &unk_1E875E2C8;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __70__BRCAccountSession_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSharedServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_sharedServerZoneByName:(id)a3 ownerName:(id)a4 db:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__BRCAccountSession_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke;
  v6[3] = &unk_1E875E2C8;
  v6[4] = self;
  return (id)objc_msgSend(a5, "fetchObject:sql:", v6, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@"), a4, a3);
}

id __78__BRCAccountSession_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSharedServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)newPrivateClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCPrivateClientZone *v12;
  void *v14;
  NSObject *v15;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v8, 0);
  _BRCClassesForContainerState();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:].cold.1();

  }
  v12 = -[BRCPrivateClientZone initWithMangledID:dbRowID:plist:session:initialCreation:]([BRCPrivateClientZone alloc], "initWithMangledID:dbRowID:plist:session:initialCreation:", v9, v6, v11, self, 0);

  return v12;
}

- (id)_privateClientZonesEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BRCAccountSession clientDB](self, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@"), *MEMORY[0x1E0C94730]);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__BRCAccountSession_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke;
  v7[3] = &unk_1E875E2C8;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __70__BRCAccountSession_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_privateClientZoneByName:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__BRCAccountSession_BRCDatabaseManager___privateClientZoneByName_db___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND zone_name = %@ AND zone_plist IS NOT NULL"), *MEMORY[0x1E0C94730], a3);
}

id __69__BRCAccountSession_BRCDatabaseManager___privateClientZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_privateClientZoneByID:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__BRCAccountSession_BRCDatabaseManager___privateClientZoneByID_db___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND rowid = %@"), *MEMORY[0x1E0C94730], a3);
}

id __67__BRCAccountSession_BRCDatabaseManager___privateClientZoneByID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)newPrivateServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCPrivateServerZone *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v8, 0);
  _BRCClassesForContainerState();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v9)
      goto LABEL_3;
    goto LABEL_7;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:].cold.1();

  if (!v9)
  {
LABEL_7:
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) newPrivateServerZoneFromPQLResultSet:error:].cold.1();

  }
LABEL_3:
  v12 = -[BRCServerZone initWithMangledID:dbRowID:plist:session:]([BRCPrivateServerZone alloc], "initWithMangledID:dbRowID:plist:session:", v9, v6, v11, self);

  return v12;
}

- (id)_privateServerZoneByName:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__BRCAccountSession_BRCDatabaseManager___privateServerZoneByName_db___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@"), *MEMORY[0x1E0C94730], a3);
}

id __69__BRCAccountSession_BRCDatabaseManager___privateServerZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_privateServerZonesEnumerator:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(a3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@"), *MEMORY[0x1E0C94730]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__BRCAccountSession_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke;
  v7[3] = &unk_1E875E2C8;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __71__BRCAccountSession_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)itemsNeedingIndexingEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items AS li      WHERE li.item_type  in (1, 2, 8, 0, 9, 10)        AND li.item_state in (0, -1)        AND (li.item_scope in (2, 3)        OR call_block(%p, li.item_id))        AND li.item_notifs_rank >= %lld        AND li.item_user_visible = 1   ORDER BY li.item_notifs_rank ASC LIMIT %lld"), &__block_literal_global_150, a3, a4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__BRCAccountSession_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke_2;
  v13[3] = &unk_1E875E310;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjects:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __98__BRCAccountSession_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  sqlite3_result_int(a2, +[BRCItemID isDocumentsItemIDWithSQLiteValue:](BRCItemID, "isDocumentsItemIDWithSQLiteValue:", *a4));
}

id __98__BRCAccountSession_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)itemsWithSideCarInFlightDiffsEnumerator
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_clientDB, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0"), &unk_1E87D70D0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__BRCAccountSession_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_1E875E2C8;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__BRCAccountSession_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (id)deviceKeyForName:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT key FROM devices WHERE name = %@"), a3);
}

- (id)createDeviceKeyForNameInServerDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  -[BRCAccountSession deviceKeyForName:db:](self, "deviceKeyForName:db:", v4, self->_serverDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_11;
  if (!-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("INSERT INTO devices (name) VALUES (%@)"), v4))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) createDeviceKeyForNameInServerDB:].cold.2();

    goto LABEL_10;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(BRCDatabaseManager) createDeviceKeyForNameInServerDB:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

+ (id)userIdentityForKey:(id)a3 db:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT user_plist FROM users WHERE user_key = %@"), v6);

  return v7;
}

- (id)userIdentityForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "userIdentityForKey:db:", v4, self->_clientDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userIdentityForName:(id)a3 db:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT user_plist FROM users WHERE user_name = %@"), v6);

  return v7;
}

- (void)_setUserIdentity:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  objc_msgSend(v6, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "br_formattedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _setUserIdentity:forName:].cold.3();

  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] learning name '%@' for user %@%@", buf, 0x20u);
  }

  if (!v6)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _setUserIdentity:forName:].cold.2();

  }
  v12 = -[BRCAccountSession createUserKeyForOwnerName:](self, "createUserKeyForOwnerName:", v7);
  if (!-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("UPDATE users SET user_plist = %@ WHERE user_name = %@"), v6, v7))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[BRCPQLConnection lastError](self->_serverDB, "lastError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v7;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v13;
      _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user identity for name '%@': %@%@", buf, 0x20u);

    }
  }
  if (-[BRCPQLConnection changes](self->_serverDB, "changes") != 1)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _setUserIdentity:forName:].cold.1();

  }
}

- (void)learnParticipantIdentitiesForShare:(id)a3 forceUpdate:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  BRFieldUserIdentity *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BRFieldUserIdentity *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  BRCAccountSession *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  BRFieldUserIdentity *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = self;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = v6;
  objc_msgSend(v6, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v36;
    v34 = *MEMORY[0x1E0C94730];
    *(_QWORD *)&v9 = 138412290;
    v28 = v9;
    v32 = a4;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "isCurrentUser", v28) & 1) == 0 && objc_msgSend(v13, "acceptanceStatus") == 2)
        {
          objc_msgSend(v13, "userIdentity");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            -[NSObject userRecordID](v14, "userRecordID");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              brc_bread_crumbs();
              v17 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v40 = v13;
                v41 = 2112;
                v42 = v15;
                v43 = 2112;
                v44 = v17;
                _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] user %@ has identity %@%@", buf, 0x20u);
              }

              -[NSObject userRecordID](v15, "userRecordID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "recordName");
              v20 = objc_claimAutoreleasedReturnValue();

              if ((-[NSObject isEqualToString:](v20, "isEqualToString:", v34) & 1) == 0)
              {
                if (a4
                  || (objc_msgSend((id)objc_opt_class(), "userIdentityForName:db:", v20, v33->_serverDB),
                      v21 = (void *)objc_claimAutoreleasedReturnValue(),
                      v21,
                      !v21))
                {
                  -[NSObject nameComponents](v15, "nameComponents");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22)
                  {
                    v23 = -[BRFieldUserIdentity initWithCKUserIdentity:]([BRFieldUserIdentity alloc], "initWithCKUserIdentity:", v15);
                    -[BRFieldUserIdentity nameComponents](v23, "nameComponents");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "br_formattedName");
                    v25 = objc_claimAutoreleasedReturnValue();

                    if (!v25)
                    {
                      brc_bread_crumbs();
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v26 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = v28;
                        v40 = v30;
                        _os_log_fault_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: userFormattedName != nil%@", buf, 0xCu);
                      }

                    }
                    -[BRCAccountSession _setUserIdentity:forName:](v33, "_setUserIdentity:forName:", v23, v20);
                    a4 = v32;
                  }
                  else
                  {
                    brc_bread_crumbs();
                    v23 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                    {
                      -[NSObject debugDescription](v15, "debugDescription");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v40 = v29;
                      v41 = 2112;
                      v42 = v20;
                      v43 = 2112;
                      v44 = v23;
                      _os_log_fault_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nameless identity: %@ (user %@)%@", buf, 0x20u);

                    }
                  }

                }
              }
              goto LABEL_26;
            }
          }
          else
          {
            if (objc_msgSend(v13, "role") == 1)
            {
              brc_bread_crumbs();
              v16 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v13;
                v41 = 2112;
                v42 = v16;
                _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: owner %@ with no user identity%@", buf, 0x16u);
              }
            }
            else
            {
              brc_bread_crumbs();
              v16 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v13;
                v41 = 2112;
                v42 = v16;
                _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Participant %@ has no user identity%@", buf, 0x16u);
              }
            }
LABEL_26:

          }
        }
        ++v12;
      }
      while (v10 != v12);
      v27 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      v10 = v27;
    }
    while (v27);
  }

}

- (id)userKeyForOwnerName:(id)a3 db:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C94730]) & 1) != 0)
    v7 = &unk_1E87D70E8;
  else
    v7 = (void *)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT user_key FROM users WHERE user_name = %@"), v5);

  return v7;
}

- (id)userNameForKey:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "stringWithSQL:", CFSTR("SELECT user_name FROM users WHERE user_key = %@"), a3);
}

- (id)createUserKeyForOwnerName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) createUserKeyForOwnerName:].cold.1();

    goto LABEL_15;
  }
  -[BRCAccountSession userKeyForOwnerName:db:](self, "userKeyForOwnerName:db:", v4, self->_serverDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("INSERT INTO users (user_name) VALUES (%@)"), v4))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSession(BRCDatabaseManager) createUserKeyForOwnerName:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[BRCPQLConnection lastError](self->_serverDB, "lastError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v12;
      _os_log_fault_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user name: '%@': %@%@", buf, 0x20u);

    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  v7 = v5;
  v6 = v7;
LABEL_11:
  v11 = v7;
LABEL_16:

  return v11;
}

+ (id)nameComponentsForKey:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "br_isEqualToNumber:", &unk_1E87D70E8) & 1) == 0)
  {
    objc_msgSend(a1, "userIdentityForKey:db:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "nameComponents");
    else
      +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)nameComponentsForName:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94730]) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "userIdentityForName:db:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "nameComponents");
    else
      +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_clearNeedsUpgradeErrorsWithBrVersion:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(BRCDatabaseManager) _clearNeedsUpgradeErrorsWithBrVersion:].cold.1();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[BRCAccountSession _privateClientZonesEnumerator](self, "_privateClientZonesEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v11, "state") & 0x200000) != 0)
        {
          objc_msgSend(v11, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          -[BRCAccountSession saveClientZoneToDB:](self, "saveClientZoneToDB:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BRCAccountSession _sharedClientZonesEnumerator](self, "_sharedClientZonesEnumerator", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        if ((objc_msgSend(v17, "state") & 0x200000) != 0)
        {
          objc_msgSend(v17, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          -[BRCAccountSession saveClientZoneToDB:](self, "saveClientZoneToDB:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[BRCAccountSession clientDB](self, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "execute:", CFSTR("UPDATE client_items SET item_min_supported_os_rowid = NULL"));

}

+ (void)_registerLastBootIfNeeded:(id)a3 table:(id)a4 skipControlFiles:(BOOL)a5 deviceIDChanged:(BOOL *)a6
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  __darwin_ino64_t v26;

  v6 = a5;
  v8 = a3;
  v9 = a4;
  OSVersion();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BRVersion();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("device-tracking"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:isDirectory:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v17 = objc_retainAutorelease(v16);
  if (file_id_from_control_file((const char *)objc_msgSend(v17, "fileSystemRepresentation"), &v26, v6)
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v26),
        (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[BRCAccountSession(BRCDatabaseManager) _registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:].cold.1();

    v20 = 0;
  }
  v21 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT os, br, bird_schema, db_schema FROM %@ ORDER BY rowid DESC LIMIT 1"), v9);
  if (objc_msgSend(v21, "next"))
  {
    objc_msgSend(v21, "stringAtIndex:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringAtIndex:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v23)
      && objc_msgSend(v11, "isEqualToString:", v22)
      && objc_msgSend(v21, "unsignedIntAtIndex:", 2) == 21007)
    {
      objc_msgSend(v21, "numberAtIndex:", 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v12, "br_isEqualToNumber:", v24);

      objc_msgSend(v21, "close");
      if ((v25 & 1) != 0)
        goto LABEL_15;
      goto LABEL_14;
    }

  }
  objc_msgSend(v21, "close");
LABEL_14:
  objc_msgSend(v8, "execute:", CFSTR("INSERT INTO %@ (date,os,br,bird_schema,db_schema) VALUES (%lu,%@,%@,%u,%@)"), v9, time(0), v10, v11, 21007, v12);
LABEL_15:

}

- (int64_t)lastBootHistoryTime
{
  id v3;
  int64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  v3 = -[PQLConnection numberWithSQL:](self->_clientDB, "numberWithSQL:", CFSTR("SELECT date FROM boot_history ORDER BY rowid DESC LIMIT 1"));
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

+ (BOOL)_checkIntegrity:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 skipControlFiles:(BOOL)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v10;
  _BOOL4 v12;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  const char *v39;
  const char *v40;
  const char *v41;
  id *v42;
  id v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  _BYTE buf[24];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v10 = a6;
  v12 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v45 = 0uLL;
  v46 = 0;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFiles:deviceIDChanged:error:].cold.1(v12);

  if (v12)
  {
    v18 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT count(*) FROM server_state"));
    if ((objc_msgSend(v18, "br_isEqualToNumber:", &unk_1E87D7100) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", CFSTR("server_boot_history"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:", v14, v19, v10, a7);

      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
LABEL_44:
      v28 = 1;
      goto LABEL_47;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 22, CFSTR("missing entry in the server_state table"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v39 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFile"
                             "s:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a8)
          v39 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v48 = v25;
        v49 = 2112;
        v50 = v26;
        _os_log_error_impl(&dword_1CBD43000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a8)
      *a8 = objc_retainAutorelease(v25);

    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v28 = 0;
    goto LABEL_47;
  }
  if (v15)
  {
    v24 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT old, new, counter, os, br FROM backup_detector"));
    if (objc_msgSend(v24, "next"))
    {
      *(_QWORD *)&v45 = objc_msgSend(v24, "unsignedLongLongAtIndex:", 0);
      *((_QWORD *)&v45 + 1) = objc_msgSend(v24, "unsignedLongLongAtIndex:", 1);
      v46 = objc_msgSend(v24, "unsignedLongLongAtIndex:", 2);
      objc_msgSend(v24, "stringAtIndex:", 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringAtIndex:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      v44 = 0;
    }
    objc_msgSend(v24, "close");
    if (!v10)
    {
      *(_OWORD *)buf = v45;
      *(_QWORD *)&buf[16] = v46;
      if (!objc_msgSend(v15, "_stepBackupDetector:newState:error:", buf, &v45, a8))
      {
        v18 = 0;
        v20 = 0;
        v21 = 0;
LABEL_46:
        v28 = 0;
        v23 = v44;
        goto LABEL_47;
      }
    }
    v42 = a8;
  }
  else
  {
    v42 = a8;
    v44 = 0;
    v22 = 0;
    v24 = 0;
  }
  OSVersion();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BRVersion();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToString:", v20) & 1) == 0)
    objc_msgSend(v15, "_clearNeedsUpgradeErrorsWithBrVersion:", v20);
  if (v15
    && (objc_msgSend(v14, "execute:", CFSTR("UPDATE backup_detector set old = %llu, new = %llu, counter = %llu, br = %@"), v45, v46, v20) & 1) == 0)
  {
    objc_msgSend(v14, "lastError");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v41 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFile"
                             "s:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42)
          v41 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        v48 = v33;
        v49 = 2112;
        v50 = v34;
        _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (v42)
      *v42 = objc_retainAutorelease(v33);

    v18 = 0;
    goto LABEL_46;
  }
  v18 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT count(*) FROM client_state"));
  if ((objc_msgSend(v18, "br_isEqualToNumber:", &unk_1E87D7100) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 22, CFSTR("missing entry in the client_state table"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        v40 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFile"
                             "s:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42)
          v40 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        v48 = v30;
        v49 = 2112;
        v50 = v31;
        _os_log_error_impl(&dword_1CBD43000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (v42)
      *v42 = objc_retainAutorelease(v30);

    goto LABEL_46;
  }
  v43 = v15;
  objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", CFSTR("boot_history"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:", v14, v29, v10, a7);

  v23 = v44;
  if (!objc_msgSend(v44, "isEqualToString:", v21)
    || (objc_msgSend(v22, "isEqualToString:", v20) & 1) == 0)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    v15 = v43;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2112;
      v48 = v20;
      v49 = 2112;
      v50 = v21;
      v51 = 2112;
      v52 = v36;
      _os_log_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] CloudDocs was upgraded from [%@ on %@] to [%@ on %@]%@", buf, 0x34u);
    }

    if (v43)
      objc_msgSend(v14, "execute:", CFSTR("UPDATE backup_detector SET os = %@"), v21);
    goto LABEL_44;
  }
  v28 = 1;
  v15 = v43;
LABEL_47:

  return v28;
}

+ (id)_classesForClientState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v17, "initWithObjects:", v16, v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

- (void)_loadClientStateFromDB:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  BRCClientState *v16;
  BRCClientState **p_clientState;
  BRCClientState *clientState;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  id v26;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:].cold.5();

  v7 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT * FROM client_state"));
  +[BRCAccountSession _classesForClientState](BRCAccountSession, "_classesForClientState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "next"))
  {
    abc_report_panic_with_signature();
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "lastError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("there should always be one row in client_state {%@}"), v22);
    objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

    brc_append_system_info_to_message();
    v25 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1615, v25);
  }
  objc_msgSend(v7, "dataAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;
    if (v11)
    {
      v12 = v11;
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while unarchiving client state %@"), v12);
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v15 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1610, v15);
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "close");
  v16 = -[BRCClientState initWithDictionary:clientStateData:]([BRCClientState alloc], "initWithDictionary:clientStateData:", v10, v9);
  p_clientState = &self->_clientState;
  clientState = self->_clientState;
  self->_clientState = v16;

  if (v10)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:].cold.2(p_clientState);
  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:].cold.1(p_clientState);
  }

}

- (BOOL)_finishClientTruthConnectionSetupWithError:(id *)a3
{
  BRCPQLConnection *v4;
  NSString *v5;
  NSString *databaseID;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v4 = self->_clientDB;
  -[BRCAccountSession _loadClientStateFromDB:](self, "_loadClientStateFromDB:", v4);
  v5 = -[PQLConnection stringWithSQL:](v4, "stringWithSQL:", CFSTR("SELECT uuid FROM backup_detector"));
  databaseID = self->_databaseID;
  self->_databaseID = v5;

  if (!self->_databaseID)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:].cold.1();

  }
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke;
  v21[3] = &unk_1E875E388;
  objc_copyWeak(&v22, &location);
  -[BRCPQLConnection setPreFlushHook:](v4, "setPreFlushHook:", v21);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2;
  v19[3] = &unk_1E875E388;
  objc_copyWeak(&v20, &location);
  -[BRCPQLConnection setPostFlushHook:](v4, "setPostFlushHook:", v19);
  -[BRCPQLConnection autoRollbackHandler](v4, "autoRollbackHandler");
  v14 = v7;
  v15 = 3221225472;
  v16 = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_240;
  v17 = &unk_1E875E3F0;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  -[BRCPQLConnection setAutoRollbackHandler:](v4, "setAutoRollbackHandler:", &v14);
  -[BRCPQLConnection execute:](v4, "execute:", CFSTR("CREATE TEMP TRIGGER child_item_count_notifs  AFTER UPDATE OF visible_child_count ON main.client_items  BEGIN  UPDATE client_items SET item_notifs_rank = bump_notifs_rank_and_trigger_notifs(old.rowid)   WHERE old.visible_child_count != new.visible_child_count     AND rowid = old.rowid     AND item_type = 0 ; END"),
    v14,
    v15,
    v16,
    v17);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dbBatchDelay");
  -[BRCPQLConnection usePacedBatchingOnTargetQueue:withInterval:changeCount:](v4, "usePacedBatchingOnTargetQueue:withInterval:changeCount:", self->_clientTruthWorkloop, objc_msgSend(v9, "dbBatchSize"), v10);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return 1;
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26[3];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();

  }
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v6 = WeakRetained[22];
    memset(v26, 0, sizeof(v26));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1646, v26);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v28 = v26[0];
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx db pre-flush: flushing client-state %@%@", buf, 0x20u);
    }

    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_228;
    v24[3] = &unk_1E875E338;
    objc_copyWeak(&v25, v4);
    objc_msgSend(WeakRetained, "enumerateServerZones:", v24);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_230;
    v22[3] = &unk_1E875E360;
    objc_copyWeak(&v23, v4);
    objc_msgSend(WeakRetained, "enumerateAppLibraries:", v22);
    v21 = 0;
    v10 = objc_msgSend(v6, "hasStateChangesAndClearSaveStatusWithResultingState:", &v21);
    v11 = v21;
    if (v10)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2();

      if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE client_state SET v = %@"), v11) & 1) == 0)
      {
        abc_report_panic_with_signature();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to flush client state, crash to maintain consistency"));
        objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          brc_append_system_info_to_message();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(v19, (uint64_t)v17, (uint64_t)buf, v18);
        }

        brc_append_system_info_to_message();
        v20 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
        __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1668, v20);
      }
    }
    objc_msgSend(WeakRetained, "stageRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willFlushAllStagedFileIDs");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    __brc_leave_section(v26);

  }
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_228(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  objc_msgSend(a2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsSave"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "saveClientZoneToDB:", v3);

    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_228_cold_1();

  }
  return 1;
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_230(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (objc_msgSend(v3, "needsSave"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "saveAppLibraryToDB:", v3);

    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_230_cold_1();

  }
  return 1;
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13[3];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();

  }
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1682, v13);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(v13);

    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "nextNotifRank");

    objc_msgSend(WeakRetained, "notificationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flushUpdatesWithRank:", v8);

    objc_msgSend(WeakRetained, "enumerateClientZones:", &__block_literal_global_239);
    objc_msgSend(WeakRetained, "recentsEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maxNotifRankWasFlushed");

    __brc_leave_section(v13);
  }

}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_237(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "flushAppliedTombstones");
  return 1;
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_240(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)*MEMORY[0x1E0DE81E8])
  {
    v11 = objc_msgSend(v9, "code");

    if (v11 != 13)
      goto LABEL_7;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_240_cold_2();

    +[BRCDaemon daemon](BRCDaemon, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restart");
  }

LABEL_7:
  if (objc_msgSend(v9, "brc_isDatabaseRemovalError"))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_240_cold_1();

    +[BRCDaemon daemon](BRCDaemon, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "restart");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_finishServerTruthConnectionSetupWithError:(id *)a3
{
  BRCPQLConnection *serverDB;
  _QWORD v5[5];

  serverDB = self->_serverDB;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__BRCAccountSession_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke;
  v5[3] = &unk_1E875D8C8;
  v5[4] = self;
  return -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 1, v5);
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BRCServerPersistedState *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT state FROM server_state"));
  if ((objc_msgSend(v4, "next") & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = v6;
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("there should always be one row in server_state: %@"), v10);
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v13 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _finishServerTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1770, v13);
    }
    objc_msgSend(v4, "close");
    goto LABEL_6;
  }
  objc_msgSend(v4, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 0);
  v5 = (BRCServerPersistedState *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "close");
  if (!v5)
  {
LABEL_6:
    v5 = objc_alloc_init(BRCServerPersistedState);
    -[BRCServerPersistedState saveToDB:](v5, "saveToDB:", v3);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 184);
  *(_QWORD *)(v7 + 184) = v5;

  return 1;
}

- (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 initialVersion:(unsigned int *)a5 lastCurrentVersion:(unsigned int *)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v12;
  id v14;

  v12 = a4;
  v14 = a3;
  LOBYTE(a8) = objc_msgSend((id)objc_opt_class(), "openAndValidateDatabase:serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:", v14, v12, self, self->_dbURL, 0, a5, a6, a7, a8);

  return (char)a8;
}

+ (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 baseURL:(id)a6 skipControlFiles:(BOOL)a7 initialVersion:(unsigned int *)a8 lastCurrentVersion:(unsigned int *)a9 deviceIDChanged:(BOOL *)a10 error:(id *)a11
{
  _BOOL8 v15;
  id v17;
  id v18;
  id v19;
  __CFString *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  char v26;
  void *v27;
  NSObject *v28;
  uint64_t v30;
  __CFString *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  id v37;
  BOOL *v38;
  int v39;
  int v40;
  BOOL v41;
  BOOL v42;
  uint64_t v43;
  uint8_t v44[4];
  __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v15 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = CFSTR("client.db");
  if (v15)
    v20 = CFSTR("server.db");
  v31 = v20;
  v43 = 0;
  brc_bread_crumbs();
  v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    v51 = v21;
    _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening DB %@ in base URL: %@%@", buf, 0x20u);
  }

  if (objc_msgSend(a1, "_openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:", v17, v15, v31, v19, (char *)&v43 + 4, &v43, a11))
  {
    if (a8)
      *a8 = HIDWORD(v43);
    if (a9)
      *a9 = v43;
    if (HIDWORD(v43) >> 4 >= 0x753)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        +[BRCAccountSession(BRCDatabaseManager) openAndValidateDatabase:serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:].cold.1();

      a7 = 1;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__3;
    v52 = __Block_byref_object_dispose__3;
    v53 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke;
    v32[3] = &unk_1E875E418;
    v33 = v17;
    v37 = a1;
    v34 = v19;
    v25 = v18;
    v41 = v15;
    v39 = HIDWORD(v43);
    v40 = v43;
    v35 = v25;
    v36 = buf;
    v42 = a7;
    v38 = a10;
    v26 = objc_msgSend(v33, "performWithFlags:action:", 10, v32);
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v44 = 138412802;
      v45 = v31;
      v46 = 2112;
      v47 = v30;
      v48 = 2112;
      v49 = v27;
      _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Done with %@ DB: error: %@%@", v44, 0x20u);
    }

    if (a11)
      *a11 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  id obj;

  if ((objc_msgSend(*(id *)(a1 + 32), "execute:", CFSTR("PRAGMA recursive_triggers = true")) & 1) == 0)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1();

  }
  v4 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned __int8 *)(a1 + 88);
  v8 = *(unsigned int *)(a1 + 80);
  v9 = *(unsigned int *)(a1 + 84);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v4, "_validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:", v5, v6, v10, v7, v8, v9, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (!v12)
    return 0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(unsigned __int8 *)(a1 + 88);
  v15 = *(unsigned __int8 *)(a1 + 89);
  v16 = *(void **)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(id *)(v19 + 40);
  v20 = objc_msgSend(v16, "_checkIntegrity:serverTruth:session:skipControlFiles:deviceIDChanged:error:", v13, v14, v18, v15, v17, &v27);
  objc_storeStrong((id *)(v19 + 40), v27);
  if (!v20)
    return 0;
  v21 = *(void **)(a1 + 48);
  if (!v21)
    return 1;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(id *)(v23 + 40);
  v24 = objc_msgSend(v21, "_registerDynamicDBFunctions:error:", v22, &v26);
  objc_storeStrong((id *)(v23 + 40), v26);
  return v24;
}

+ (BOOL)_openConnection:(id)a3 serverTruth:(BOOL)a4 databaseName:(id)a5 baseURL:(id)a6 initialVersion:(unsigned int *)a7 lastCurrentVersion:(unsigned int *)a8 error:(id *)a9
{
  id *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  BOOL v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  NSObject *v44;
  id v45;
  int v46;
  int v47;
  void *v48;
  NSObject *v49;
  BOOL v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  unsigned int v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id *v67;
  unsigned int v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  unint64_t v75;
  void *v76;
  NSObject *v77;
  const char *v78;
  unint64_t v79;
  void *v80;
  NSObject *v81;
  void *v82;
  const char *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  unsigned int *v92;
  unsigned int *v93;
  id v94;
  int v95;
  id v96;
  uint8_t buf[4];
  _BYTE v98[28];
  __int16 v99;
  void *v100;
  uint64_t v101;

  v14 = a9;
  v101 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.8();

  v96 = 0;
  v20 = +[BRCAccountSession _openConnection:databaseName:baseURL:readonly:error:](BRCAccountSession, "_openConnection:databaseName:baseURL:readonly:error:", v15, v16, v17, 0, &v96);
  v21 = v96;
  if (v20)
  {
    objc_msgSend(v15, "userVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue");

    if (!(_DWORD)v23)
    {
      v36 = 0;
      v37 = 0;
      if (a4)
      {
LABEL_64:
        if (!a7)
        {
LABEL_66:
          if (a8)
            *a8 = v37;
          v35 = 1;
          goto LABEL_69;
        }
LABEL_65:
        *a7 = v36;
        goto LABEL_66;
      }
      goto LABEL_60;
    }
    v92 = a7;
    v93 = a8;
    +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((v23 - 3000) > 0x3EA)
    {
      if (v23 <= 0x75)
      {
        v91 = a4;
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.2();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("old-db-%d.%03d"), 0, v23);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "registerAndSendNewContainerResetWithOutcome:", v40);

        goto LABEL_21;
      }
      v26 = a9;
      v60 = v23 >> 4;
      if (v23 >> 4 < 0x521 || (v23 - 21000) < 0x3E8)
      {

        v14 = a9;
        goto LABEL_57;
      }
      v91 = a4;
      v75 = v23 / 0x3E8uLL;
      brc_bread_crumbs();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.3();

      if (v60 < 0x753)
        +[BRCDatabaseFromTheFutureException raise:format:](BRCDatabaseFromTheFutureException, "raise:format:", CFSTR("DatabaseFromTheFuture"), CFSTR("database has a major version from the future: %d (want at most %d)"), v75, 21);
      else
        +[BRCDatabaseFromFPFSException raise:format:](BRCDatabaseFromFPFSException, "raise:format:", CFSTR("DatabaseFromFPFS"), CFSTR("database version (%d) is from FPFS but we are in Legacy"), v75, v89);
    }
    else
    {
      v91 = a4;
      v26 = a9;
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (unsigned __int16)v23 / 0x3E8u;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v98 = (unsigned __int16)v23 / 0x3E8u;
        v30 = (unsigned __int16)v23 % 0x3E8u;
        *(_WORD *)&v98[4] = 1024;
        *(_DWORD *)&v98[6] = v30;
        *(_WORD *)&v98[10] = 2112;
        *(_QWORD *)&v98[12] = v27;
        _os_log_fault_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
      }
      else
      {
        v30 = (unsigned __int16)v23 % 0x3E8u;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("internal-db-%d.%03d"), v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "registerAndSendNewContainerResetWithOutcome:", v31);

    }
    v14 = v26;
LABEL_21:

    v95 = 61;
    v41 = sqlite3_file_control((sqlite3 *)objc_msgSend(v15, "dbHandle"), 0, 101, &v95);
    if (v41)
    {
      v42 = v41;
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
      {
        v78 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v15, "dbHandle"));
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v98 = v42;
        *(_WORD *)&v98[4] = 2080;
        *(_QWORD *)&v98[6] = v78;
        *(_WORD *)&v98[14] = 2112;
        *(_QWORD *)&v98[16] = v43;
        _os_log_error_impl(&dword_1CBD43000, v44, (os_log_type_t)0x90u, "[ERROR] unable to truncate database: %d; %s%@",
          buf,
          0x1Cu);
      }

      objc_msgSend(v15, "brc_close");
      objc_msgSend(v15, "url");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = unlink((const char *)objc_msgSend(v45, "fileSystemRepresentation"));

      if (v46 < 0)
      {
        v47 = *__error();
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, (os_log_type_t)0x90u))
        {
          objc_msgSend(v15, "url");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v98 = v82;
          *(_WORD *)&v98[8] = 1024;
          *(_DWORD *)&v98[10] = v47;
          *(_WORD *)&v98[14] = 2112;
          *(_QWORD *)&v98[16] = v48;
          _os_log_error_impl(&dword_1CBD43000, v49, (os_log_type_t)0x90u, "[ERROR] can't unlink '%@' %{errno}d%@", buf, 0x1Cu);

        }
        *__error() = v47;
      }
    }
    else
    {
      objc_msgSend(v15, "brc_close");
    }
    v94 = v21;
    v50 = +[BRCAccountSession _openConnection:databaseName:baseURL:readonly:error:](BRCAccountSession, "_openConnection:databaseName:baseURL:readonly:error:", v15, v16, v17, 0, &v94);
    v34 = v94;

    if (!v50)
    {
      brc_bread_crumbs();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
        +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.4();

      if (v14)
        *v14 = objc_retainAutorelease(v34);
      goto LABEL_52;
    }
    objc_msgSend(v15, "userVersion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v51, "unsignedIntValue");

    a4 = v91;
    if ((_DWORD)v23)
    {
      +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if ((v23 - 3000) <= 0x3EA)
      {
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v98 = (unsigned __int16)v23 / 0x3E8u;
          v56 = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v98[4] = 1024;
          *(_DWORD *)&v98[6] = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v98[10] = 2112;
          *(_QWORD *)&v98[12] = v54;
          _os_log_fault_impl(&dword_1CBD43000, v55, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
        }
        else
        {
          v56 = (unsigned __int16)v23 % 0x3E8u;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("internal-db-%d.%03d"), (unsigned __int16)v23 / 0x3E8u, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "registerAndSendNewContainerResetWithOutcome:", v57);

LABEL_46:
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 70, CFSTR("db is stale even after recreating"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          brc_bread_crumbs();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
          {
            v83 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v98 = "+[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:in"
                             "itialVersion:lastCurrentVersion:error:]";
            *(_WORD *)&v98[8] = 2080;
            if (!v14)
              v83 = "(ignored by caller)";
            *(_QWORD *)&v98[10] = v83;
            *(_WORD *)&v98[18] = 2112;
            *(_QWORD *)&v98[20] = v64;
            v99 = 2112;
            v100 = v65;
            _os_log_error_impl(&dword_1CBD43000, v66, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (v14)
          *v14 = objc_retainAutorelease(v64);

LABEL_52:
        v35 = 0;
        goto LABEL_70;
      }
      if (v23 <= 0x75)
      {
        brc_bread_crumbs();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.2();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("old-db-%d.%03d"), 0, v23);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "registerAndSendNewContainerResetWithOutcome:", v63);

        goto LABEL_46;
      }
      v67 = v14;
      v68 = v23 >> 4;
      if (v23 >> 4 >= 0x521 && (v23 - 21000) >= 0x3E8)
      {
        v79 = v23 / 0x3E8uLL;
        brc_bread_crumbs();
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
          +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.3();

        if (v68 < 0x753)
          +[BRCDatabaseFromTheFutureException raise:format:](BRCDatabaseFromTheFutureException, "raise:format:", CFSTR("DatabaseFromTheFuture"), CFSTR("database has a major version from the future: %d (want at most %d)"), v79, 21);
        else
          +[BRCDatabaseFromFPFSException raise:format:](BRCDatabaseFromFPFSException, "raise:format:", CFSTR("DatabaseFromFPFS"), CFSTR("database version (%d) is from FPFS but we are in Legacy"), v79, v90);
        v14 = v67;
        goto LABEL_46;
      }

      v14 = v67;
    }
    v21 = v34;
LABEL_57:
    a7 = v92;
    a8 = v93;
    if (a4)
    {
      if ((_DWORD)v23)
      {
        v69 = CFSTR("SELECT bird_schema FROM server_boot_history ORDER BY rowid DESC LIMIT 1");
LABEL_63:
        v73 = (void *)objc_msgSend(v15, "numberWithSQL:", v69);
        v37 = objc_msgSend(v73, "unsignedIntValue");

        v36 = v23;
        goto LABEL_64;
      }
      goto LABEL_71;
    }
LABEL_60:
    objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("server.db"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "path");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v15, "attachDBAtPath:as:error:", v71, CFSTR("server"), v14);

    if ((v72 & 1) == 0)
    {
      abc_report_panic_with_signature();
      v84 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "lastError");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "stringWithFormat:", CFSTR("we should be able to attach the server db {%@}"), v85);
      objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v88 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("+[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1887, v88);
    }
    if ((_DWORD)v23)
    {
      v69 = CFSTR("SELECT bird_schema FROM boot_history ORDER BY rowid DESC LIMIT 1");
      goto LABEL_63;
    }
LABEL_71:
    v36 = 0;
    v37 = 0;
    if (!a7)
      goto LABEL_66;
    goto LABEL_65;
  }
  brc_bread_crumbs();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
    +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.7();

  if (!a9)
  {
    v35 = 0;
LABEL_69:
    v34 = v21;
    goto LABEL_70;
  }
  v34 = objc_retainAutorelease(v21);
  v35 = 0;
  *a9 = v34;
LABEL_70:

  return v35;
}

+ (BOOL)_validateDatabase:(id)a3 baseURL:(id)a4 session:(id)a5 serverTruth:(BOOL)a6 initialVersion:(unsigned int)a7 lastCurrentVersion:(unsigned int)a8 error:(id *)a9
{
  _BOOL8 v11;
  void *v14;
  NSObject *v15;
  uint64_t (*v16)(uint64_t, void *, char);
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  uint64_t (*v24)(void *, void *, char);
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t (*v35)(void *, void *, int, void **);
  uint64_t v36;
  const char *v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  id *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  BOOL v53;
  void *v54;
  id v55;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  _BYTE v69[30];
  uint64_t v70;

  v11 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v64 = a4;
  v66 = a5;
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.3(v11);

  v63 = os_transaction_create();
  v16 = br_internal_fixup_10_000;
  if (br_internal_fixup_10_000)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      v19 = *((_DWORD *)&internal_fixups + 4 * v17);
      if (v19 > a7)
        break;
      if (v19 == a7)
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v69 = a8;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = a7;
          *(_WORD *)&v69[10] = 2112;
          *(_QWORD *)&v69[12] = v20;
          _os_log_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] doing an internal fixup from %d to %d%@", buf, 0x18u);
        }

        v67 = 0;
        v22 = (void *)MEMORY[0x1D17A6BE8]();
        v23 = ((uint64_t (*)(id, id, _BOOL8, id *))v16)(v66, v65, v11, &v67);
        objc_autoreleasePoolPop(v22);
        if ((v23 & 1) == 0)
        {
          brc_bread_crumbs();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = a9;
          if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v69 = a8;
            *(_WORD *)&v69[4] = 1024;
            *(_DWORD *)&v69[6] = a7;
            *(_WORD *)&v69[10] = 2112;
            *(_QWORD *)&v69[12] = v67;
            *(_WORD *)&v69[20] = 2112;
            *(_QWORD *)&v69[22] = v47;
            _os_log_error_impl(&dword_1CBD43000, v48, (os_log_type_t)0x90u, "[ERROR] can't internal fixup from version %d to %d: %@%@", buf, 0x22u);
          }

LABEL_50:
          v34 = v65;
LABEL_51:
          v52 = v64;
          if (v49)
LABEL_52:
            *v49 = objc_retainAutorelease(v67);
LABEL_53:

          v53 = 0;
          v54 = (void *)v63;
          goto LABEL_59;
        }

      }
      v17 = v18;
      v16 = (uint64_t (*)(uint64_t, void *, char))*((_QWORD *)&internal_fixups + 2 * v18++ + 1);
    }
    while (v16);
  }
  v24 = br_fixup_tables_4_013;
  if (br_fixup_tables_4_013)
  {
    v25 = 0;
    v26 = 1;
    do
    {
      v27 = *((_DWORD *)&schema_fixups + 4 * v25);
      if (v27 > a7)
        break;
      if (v27 > a8)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v69 = a8;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = v27;
          *(_WORD *)&v69[10] = 2112;
          *(_QWORD *)&v69[12] = v28;
          _os_log_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] fixuping database from version %d to %d%@", buf, 0x18u);
        }

        v67 = 0;
        v30 = (void *)MEMORY[0x1D17A6BE8]();
        v31 = ((uint64_t (*)(id, id, _BOOL8, id *))v24)(v66, v65, v11, &v67);
        objc_autoreleasePoolPop(v30);
        if ((v31 & 1) == 0)
        {
          brc_bread_crumbs();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v51 = objc_claimAutoreleasedReturnValue();
          v49 = a9;
          if (os_log_type_enabled(v51, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v69 = a8;
            *(_WORD *)&v69[4] = 1024;
            *(_DWORD *)&v69[6] = v27;
            *(_WORD *)&v69[10] = 2112;
            *(_QWORD *)&v69[12] = v67;
            *(_WORD *)&v69[20] = 2112;
            *(_QWORD *)&v69[22] = v50;
            _os_log_error_impl(&dword_1CBD43000, v51, (os_log_type_t)0x90u, "[ERROR] can't fixup from version %d to %d: %@%@", buf, 0x22u);
          }

          goto LABEL_50;
        }

      }
      v25 = v26;
      v24 = (uint64_t (*)(void *, void *, char))*((_QWORD *)&schema_fixups + 2 * v26++ + 1);
    }
    while (v24);
  }
  if (a7 >> 4 < 0x521)
  {
    v34 = v65;
    if (a7 == 21007)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.1();
    }
    else
    {
      v35 = br_create_tables_initial;
      if (br_create_tables_initial)
      {
        v36 = 0;
        if (v11)
          v37 = "server";
        else
          v37 = "client";
        v38 = 1;
        while (1)
        {
          v39 = *((unsigned int *)&schema_upgrades + 4 * v36);
          if (v39 > a7)
          {
            brc_bread_crumbs();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)v69 = v37;
              *(_WORD *)&v69[8] = 1024;
              *(_DWORD *)&v69[10] = a7;
              *(_WORD *)&v69[14] = 1024;
              *(_DWORD *)&v69[16] = v39;
              *(_WORD *)&v69[20] = 2112;
              *(_QWORD *)&v69[22] = v40;
              _os_log_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
            }

            v67 = 0;
            v42 = (void *)MEMORY[0x1D17A6BE8]();
            v43 = v35(v66, v65, v11, &v67);
            objc_autoreleasePoolPop(v42);
            if ((v43 & 1) == 0)
            {
              brc_bread_crumbs();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v58 = objc_claimAutoreleasedReturnValue();
              v49 = a9;
              if (os_log_type_enabled(v58, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v69 = a7;
                *(_WORD *)&v69[4] = 1024;
                *(_DWORD *)&v69[6] = v39;
                *(_WORD *)&v69[10] = 2112;
                *(_QWORD *)&v69[12] = v67;
                *(_WORD *)&v69[20] = 2112;
                *(_QWORD *)&v69[22] = v57;
                _os_log_error_impl(&dword_1CBD43000, v58, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
              }

              goto LABEL_51;
            }
            if ((objc_msgSend(v65, "setUserVersion:", v39) & 1) == 0)
            {
              objc_msgSend(v65, "lastError");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v67;
              v67 = v59;

              brc_bread_crumbs();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v62 = objc_claimAutoreleasedReturnValue();
              v52 = v64;
              if (os_log_type_enabled(v62, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v69 = v39;
                *(_WORD *)&v69[4] = 2112;
                *(_QWORD *)&v69[6] = v67;
                *(_WORD *)&v69[14] = 2112;
                *(_QWORD *)&v69[16] = v61;
                _os_log_error_impl(&dword_1CBD43000, v62, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
              }

              v49 = a9;
              if (a9)
                goto LABEL_52;
              goto LABEL_53;
            }
            objc_msgSend(v65, "userVersion");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            a7 = objc_msgSend(v44, "unsignedIntValue");

            if (a7 != (_DWORD)v39)
            {
              brc_bread_crumbs();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v69 = v45;
                _os_log_fault_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db_version == schema_upgrades[i].version%@", buf, 0xCu);
              }

            }
          }
          v36 = v38;
          v35 = (uint64_t (*)(void *, void *, int, void **))*((_QWORD *)&schema_upgrades + 2 * v38++ + 1);
          if (!v35)
          {
            if (a7 == 21007)
              goto LABEL_58;
            break;
          }
        }
      }
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.2();
    }
  }
  else
  {
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v65;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v69 = a7;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = 21007;
      *(_WORD *)&v69[10] = 2112;
      *(_QWORD *)&v69[12] = v32;
      _os_log_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }
  }

LABEL_58:
  v54 = (void *)v63;
  v55 = (id)objc_opt_self();
  v53 = 1;
  v52 = v64;
LABEL_59:

  return v53;
}

+ (BOOL)upgradeOfflineDB:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t (*v18)(void *, void *, int, void **);
  uint64_t v19;
  const char *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  id *v34;
  const char *v35;
  id v36;
  uint8_t buf[4];
  _BYTE v38[30];
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "userVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  if (v12 >= 21008)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v38 = v12;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = 21007;
      *(_WORD *)&v38[10] = 2112;
      *(_QWORD *)&v38[12] = v13;
      _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }

    goto LABEL_12;
  }
  if (v12 == 21007)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.1();
LABEL_11:

LABEL_12:
LABEL_13:
    v16 = 1;
    goto LABEL_14;
  }
  if ((v12 - 21000) < 0x3E8)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[BRCAccountSession(BRCDatabaseManager) upgradeOfflineDB:serverTruth:session:error:].cold.2();
    goto LABEL_11;
  }
  v18 = br_create_tables_initial;
  if (!br_create_tables_initial)
    goto LABEL_13;
  v34 = a6;
  v19 = 0;
  v20 = "client";
  if (v8)
    v20 = "server";
  v35 = v20;
  v21 = 1;
  while (1)
  {
    v22 = *((unsigned int *)&schema_upgrades + 4 * v19);
    if (v22 <= v12)
      goto LABEL_25;
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v38 = v35;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = v12;
      *(_WORD *)&v38[14] = 1024;
      *(_DWORD *)&v38[16] = v22;
      *(_WORD *)&v38[20] = 2112;
      *(_QWORD *)&v38[22] = v23;
      _os_log_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
    }

    v36 = 0;
    v25 = (void *)MEMORY[0x1D17A6BE8]();
    v26 = v18(v10, v9, v8, &v36);
    objc_autoreleasePoolPop(v25);
    if ((v26 & 1) == 0)
      break;
    if ((objc_msgSend(v9, "setUserVersion:", v22) & 1) == 0)
    {
      objc_msgSend(v9, "lastError");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v36;
      v36 = v30;

      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v38 = v22;
        *(_WORD *)&v38[4] = 2112;
        *(_QWORD *)&v38[6] = v36;
        *(_WORD *)&v38[14] = 2112;
        *(_QWORD *)&v38[16] = v32;
        _os_log_error_impl(&dword_1CBD43000, v33, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
      }

      goto LABEL_33;
    }
    objc_msgSend(v9, "userVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v27, "unsignedIntValue");

LABEL_25:
    v19 = v21;
    v18 = (uint64_t (*)(void *, void *, int, void **))*((_QWORD *)&schema_upgrades + 2 * v21++ + 1);
    if (!v18)
      goto LABEL_13;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v38 = v12;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v22;
    *(_WORD *)&v38[10] = 2112;
    *(_QWORD *)&v38[12] = v36;
    *(_WORD *)&v38[20] = 2112;
    *(_QWORD *)&v38[22] = v28;
    _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
  }

LABEL_33:
  if (v34)
    *v34 = objc_retainAutorelease(v36);

  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)openDBWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  BOOL v7;
  BRCPQLConnection *v8;
  uint64_t v9;
  BRCPQLConnection *v10;
  BRCPQLConnection *clientDB;
  BRCPQLConnection *serverDB;
  BRCPQLConnection *v13;
  NSString *databaseID;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  char v19;
  uint64_t v20;

  if (!self->_offline)
    -[BRCAccountSession setupDatabase](self, "setupDatabase");
  -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_clientDB, "setCrashIfUsedAfterClose:", 0);
  -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_serverDB, "setCrashIfUsedAfterClose:", 0);
  v20 = 0;
  v19 = 0;
  if (!self->_offline
    && (!-[BRCAccountSession openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:](self, "openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:", self->_serverDB, 1, 0, &v20, 0, a3)|| !-[BRCAccountSession openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:](self, "openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:", self->_clientDB, 0, 0, (char *)&v20 + 4, &v19, a3)))
  {
    -[BRCPQLConnection brc_close](self->_serverDB, "brc_close");
    serverDB = self->_serverDB;
    self->_serverDB = 0;

    goto LABEL_12;
  }
  -[BRCAccountSession _startWatcher](self, "_startWatcher");
  -[BRCPQLConnection useSerialQueueWithTarget:](self->_serverDB, "useSerialQueueWithTarget:", self->_serverTruthWorkloop);
  v5 = -[BRCAccountSession _finishClientTruthConnectionSetupWithError:](self, "_finishClientTruthConnectionSetupWithError:", a3);
  if (!v5
    || !-[BRCAccountSession _finishServerTruthConnectionSetupWithError:](self, "_finishServerTruthConnectionSetupWithError:", a3))
  {
    v8 = self->_serverDB;
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke;
    v18[3] = &unk_1E875D8C8;
    v18[4] = self;
    -[BRCPQLConnection performWithFlags:action:](v8, "performWithFlags:action:", 1, v18);
    v10 = self->_serverDB;
    self->_serverDB = 0;

    if (v5)
    {
      clientDB = self->_clientDB;
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke_2;
      v17[3] = &unk_1E875D8C8;
      v17[4] = self;
      -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 1, v17);
LABEL_13:
      v13 = self->_clientDB;
      self->_clientDB = 0;

      databaseID = self->_databaseID;
      self->_databaseID = 0;

      -[BRCAccountSession dbLoadingBarrier](self, "dbLoadingBarrier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "signalBarrier");

      return 0;
    }
LABEL_12:
    -[BRCPQLConnection brc_close](self->_clientDB, "brc_close");
    goto LABEL_13;
  }
  -[BRCAccountSession dbLoadingBarrier](self, "dbLoadingBarrier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalBarrier");

  -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", self->_clientDB);
  -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", self->_serverDB);
  v7 = 1;
  -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_clientDB, "setCrashIfUsedAfterClose:", 1);
  -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_serverDB, "setCrashIfUsedAfterClose:", 1);
  return v7;
}

uint64_t __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "brc_close");
  return 1;
}

uint64_t __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "brc_close");
  return 1;
}

- (void)closeDBs
{
  void *v3;
  BRCAccountSession *v4;
  BRCPQLConnection *clientDB;
  BRCPQLConnection *serverDB;
  BRCPQLConnection *readOnlyDB;
  BRCPQLConnection *expensiveReadOnlyDB;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  BRCClientState *clientState;
  __int128 v22;
  void *v23;
  _QWORD block[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_clientDB)
  {
    objc_msgSend(v3, "addObject:");
    clientDB = v4->_clientDB;
    v4->_clientDB = 0;

  }
  if (v4->_serverDB)
  {
    objc_msgSend(v3, "addObject:");
    serverDB = v4->_serverDB;
    v4->_serverDB = 0;

  }
  if (v4->_readOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    readOnlyDB = v4->_readOnlyDB;
    v4->_readOnlyDB = 0;

  }
  if (v4->_expensiveReadOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    expensiveReadOnlyDB = v4->_expensiveReadOnlyDB;
    v4->_expensiveReadOnlyDB = 0;

  }
  objc_sync_exit(v4);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v26;
    *(_QWORD *)&v11 = 138412290;
    v22 = v11;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
        objc_msgSend(v15, "serialQueue", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (v17)
        {
          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v22;
            v30 = v23;
            _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db.serialQueue%@", buf, 0xCu);
          }

        }
        objc_msgSend(v15, "serialQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __49__BRCAccountSession_BRCDatabaseManager__closeDBs__block_invoke;
        block[3] = &unk_1E875D500;
        block[4] = v15;
        dispatch_sync(v18, block);

        ++v14;
      }
      while (v10 != v14);
      v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      v10 = v20;
    }
    while (v20);
  }

  -[BRCAccountSession stopDBWatcher](v4, "stopDBWatcher");
  clientState = v4->_clientState;
  v4->_clientState = 0;

}

uint64_t __49__BRCAccountSession_BRCDatabaseManager__closeDBs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "brc_close");
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 error:(id *)a4
{
  return -[BRCAccountSession initializeOfflineDatabaseWhileUpgrading:loadClientState:error:](self, "initializeOfflineDatabaseWhileUpgrading:loadClientState:error:", a3, 0, a4);
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 error:(id *)a5
{
  return -[BRCAccountSession initializeOfflineDatabaseWhileUpgrading:loadClientState:forDBDump:error:](self, "initializeOfflineDatabaseWhileUpgrading:loadClientState:forDBDump:error:", a3, a4, 0, a5);
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 forDBDump:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  BOOL v19;
  _QWORD v21[5];
  BOOL v22;
  _QWORD v23[7];
  _QWORD block[7];
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  self->_offline = 1;
  v31 = 0;
  self->_forDBDump = a5;
  -[BRCAccountSession clientDB](self, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke;
  block[3] = &unk_1E875E480;
  block[4] = self;
  block[5] = &v32;
  v25 = v8;
  block[6] = &v26;
  dispatch_sync(v11, block);

  v13 = v33;
  v14 = *((unsigned __int8 *)v33 + 24);
  if (*((_BYTE *)v33 + 24) && v8)
  {
    -[BRCAccountSession serverDB](self, "serverDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_265;
    v23[3] = &unk_1E875E4A8;
    v23[4] = self;
    v23[5] = &v32;
    v23[6] = &v26;
    dispatch_sync(v16, v23);

    v13 = v33;
    v14 = *((unsigned __int8 *)v33 + 24);
  }
  if (!v14)
  {
    *((_BYTE *)v13 + 24) = 0;
    if (!a6)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[BRCAccountSession clientDB](self, "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_266;
  v21[3] = &unk_1E875DC48;
  v21[4] = self;
  v22 = a4;
  v18 = objc_msgSend(v17, "performWithFlags:action:", 1, v21);
  *((_BYTE *)v33 + 24) = v18;

  if (a6)
LABEL_6:
    *a6 = objc_retainAutorelease((id)v27[5]);
LABEL_7:
  v19 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v19;
}

void __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(a1 + 56) == 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "_setupConnection:readonly:forChecker:error:", v3, v4, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v2;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableDatabaseProfilingForDB:", v7);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(id *)(v10 + 40);
    v11 = +[BRCAccountSession upgradeOfflineDB:serverTruth:session:error:](BRCAccountSession, "upgradeOfflineDB:serverTruth:session:error:", v8, 0, v9, &v13);
    objc_storeStrong((id *)(v10 + 40), v13);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;

  }
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSqliteErrorHandler:", &__block_literal_global_264);

}

void __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered an error %@ running stmt %@%@", (uint8_t *)&v9, 0x20u);
  }

}

void __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_265(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "serverDB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v5 + 40);
    LOBYTE(v3) = objc_msgSend(v3, "_openConnection:databaseName:readonly:error:", v4, CFSTR("server.db"), 0, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;

  }
  else
  {
    *(_BYTE *)(v2 + 24) = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "serverDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v9 + 40);
    v10 = +[BRCAccountSession upgradeOfflineDB:serverTruth:session:error:](BRCAccountSession, "upgradeOfflineDB:serverTruth:session:error:", v7, 1, v8, &v11);
    objc_storeStrong((id *)(v9 + 40), v11);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
  }
}

uint64_t __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_266(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  __int128 v40;
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
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedServerZonesEnumerator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v57 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineServerZone:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v6);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateServerZonesEnumerator:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineServerZone:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v11);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedClientZonesEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineClientZone:", v20);
        objc_msgSend(v20, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v17);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateClientZonesEnumerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * m);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineClientZone:", v27);
        objc_msgSend(v27, "dbRowID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v24);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = v3;
  objc_msgSend(*(id *)(a1 + 32), "_appLibrariesEnumerator:", v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v41;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * n);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineAppLibrary:", v34);
        objc_msgSend(v34, "zoneRowID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "asPrivateClientZone");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          objc_msgSend(v34, "associateWithClientZone:", v37);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v31);
  }

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_loadClientStateFromDB:", v39);

  return 1;
}

- (BOOL)dumpFileCoordinationInfoToFileHandle:(id)a3 error:(id *)a4
{
  int v6;
  FILE *v7;
  BRCDumpContext *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = dup(objc_msgSend(a3, "fileDescriptor"));
  v7 = fdopen(v6, "a");
  if (v7)
  {
    v8 = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v7, self->_clientDB);
    -[BRCDumpContext setDumpTrackedPendingDownloads:](v8, "setDumpTrackedPendingDownloads:", 1);
    fclose(v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[BRCAccountSession(BRCDatabaseManager) dumpFileCoordinationInfoToFileHandle:error:]";
        v16 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
  return v7 != 0;
}

- (void)_registerObfuscationFunction:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerFunction:nArgs:handler:", CFSTR("OBFUSCATE"), 1, &__block_literal_global_272);
  objc_msgSend(v3, "registerFunction:nArgs:handler:", CFSTR("OBFUSCATE_APPLIBRARY"), 1, &__block_literal_global_275);
  objc_msgSend(v3, "registerFunction:nArgs:handler:", CFSTR("OBFUSCATE_PATH"), 1, &__block_literal_global_286);

}

void __70__BRCAccountSession_BRCDatabaseManager___registerObfuscationFunction___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  const unsigned __int8 *v7;
  void *v8;
  id v9;
  const char *v10;
  int v11;

  v6 = (void *)MEMORY[0x1D17A6BE8]();
  v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_obfuscatedFilename");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

    v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_result_null(a2);
  }
  objc_autoreleasePoolPop(v6);
}

void __70__BRCAccountSession_BRCDatabaseManager___registerObfuscationFunction___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  const unsigned __int8 *v7;
  const char *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  int v16;

  v6 = (void *)MEMORY[0x1D17A6BE8]();
  v7 = sqlite3_value_text(*a4);
  if (v7 && (v8 = (const char *)v7, *v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.CloudDocs")))
    {
      v10 = strlen(v8);
      sqlite3_result_text(a2, v8, v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_msgSend(v9, "fp_obfuscatedDotSeparatedComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{"), CFSTR("-"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("}"), CFSTR("-"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_retainAutorelease(v13);
      v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
      v16 = strlen(v15);
      sqlite3_result_text(a2, v15, v16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    sqlite3_result_null(a2);
  }
  objc_autoreleasePoolPop(v6);
}

void __70__BRCAccountSession_BRCDatabaseManager___registerObfuscationFunction___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  const unsigned __int8 *v7;
  void *v8;
  id v9;
  const char *v10;
  int v11;

  v6 = (void *)MEMORY[0x1D17A6BE8]();
  v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_obfuscatedPath");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

    v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_result_null(a2);
  }
  objc_autoreleasePoolPop(v6);
}

- (BOOL)backupDatabaseToURL:(id)a3 includeServer:(BOOL)a4 doNotObfuscate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  int shouldObfuscateFilenames;
  int v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  int v44;
  BOOL v45;
  _BOOL4 v46;
  id obj;
  id *v48;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v8 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v55 = 0u;
  v56 = 0u;
  if (v8)
    v9 = &unk_1E87D87D8;
  else
    v9 = &unk_1E87D87F0;
  v57 = 0uLL;
  v58 = 0uLL;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  v48 = a6;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v56;
    v45 = a5;
    v46 = v8;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v15 = -[BRCAccountSession newConnection:](self, "newConnection:", CFSTR("backup"));
        objc_msgSend(v50, "URLByAppendingPathComponent:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sqliteErrorHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke;
        v53[3] = &unk_1E875E3F0;
        v19 = v17;
        v54 = v19;
        objc_msgSend(v15, "setSqliteErrorHandler:", v53);
        objc_msgSend(v15, "autoRollbackHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v18;
        v51[1] = 3221225472;
        v51[2] = __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_293;
        v51[3] = &unk_1E875E3F0;
        v21 = v20;
        v52 = v21;
        objc_msgSend(v15, "setAutoRollbackHandler:", v51);
        a6 = v48;
        if (!-[BRCAccountSession _openConnection:databaseName:readonly:error:](self, "_openConnection:databaseName:readonly:error:", v15, v14, 1, v48))goto LABEL_19;
        if ((objc_msgSend(v15, "backupToURL:progress:", v16, 0) & 1) == 0)
        {
          if (v48)
          {
            objc_msgSend(v15, "lastError");
            *v48 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "brc_close");
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v15, "brc_close");

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      a5 = v45;
      v8 = v46;
      if (v11)
        continue;
      break;
    }
  }
  if (a5)
  {
    shouldObfuscateFilenames = 0;
    if (!v8)
      goto LABEL_27;
  }
  else
  {
    shouldObfuscateFilenames = fp_shouldObfuscateFilenames();
    if (!v8)
      goto LABEL_27;
  }
  v15 = -[BRCAccountSession newConnection:](self, "newConnection:", CFSTR("privacy"));
  if (!objc_msgSend((id)objc_opt_class(), "_openConnection:databaseName:baseURL:readonly:error:", v15, CFSTR("server.db"), v50, 0, a6))
  {
LABEL_20:
    LOBYTE(v23) = 0;
    goto LABEL_21;
  }
  if (shouldObfuscateFilenames)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v25, "sqliteCacheSize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v25, "sqliteCacheSpill"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0DE81E0];
    v29 = objc_retainAutorelease(v26);
    objc_msgSend(v28, "rawInjection:length:", objc_msgSend(v29, "UTF8String"), objc_msgSend(v29, "length"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_size = %@"), v30);

    v31 = (void *)MEMORY[0x1E0DE81E0];
    v32 = objc_retainAutorelease(v27);
    objc_msgSend(v31, "rawInjection:length:", objc_msgSend(v32, "UTF8String"), objc_msgSend(v32, "length"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_spill = %@"), v33);

    -[BRCAccountSession _registerObfuscationFunction:](self, "_registerObfuscationFunction:", v15);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_297);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_300);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_303);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_306);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_309);

    a6 = v48;
  }
  objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_312);
  objc_msgSend(v15, "flush");
  objc_msgSend(v15, "brc_close");

LABEL_27:
  v15 = -[BRCAccountSession newConnection:](self, "newConnection:", CFSTR("privacy"));
  v23 = objc_msgSend((id)objc_opt_class(), "_openConnection:databaseName:baseURL:readonly:error:", v15, CFSTR("client.db"), v50, 0, a6);
  if (v23)
  {
    if (shouldObfuscateFilenames)
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v34, "sqliteCacheSize"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v34, "sqliteCacheSpill"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0DE81E0];
      v38 = objc_retainAutorelease(v35);
      objc_msgSend(v37, "rawInjection:length:", objc_msgSend(v38, "UTF8String"), objc_msgSend(v38, "length"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_size = %@"), v39);

      v40 = (void *)MEMORY[0x1E0DE81E0];
      v41 = objc_retainAutorelease(v36);
      objc_msgSend(v40, "rawInjection:length:", objc_msgSend(v41, "UTF8String"), objc_msgSend(v41, "length"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_spill = %@"), v42);

      -[BRCAccountSession _registerObfuscationFunction:](self, "_registerObfuscationFunction:", v15);
      objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_315);
      objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_318);
      v43 = (void *)objc_msgSend(v15, "numberWithSQL:", CFSTR("SELECT 1 FROM sqlite_master where type = 'table' AND name = 'client_pkg_items'"));
      v44 = objc_msgSend(v43, "BOOLValue");

      if (v44)
        objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_323);
      objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_326);

    }
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_329);
    objc_msgSend(v15, "flush");
    objc_msgSend(v15, "brc_close");
  }
LABEL_21:

  return v23;
}

void __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DE81E8]))
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v9, "code");

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();

LABEL_10:
}

void __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_293(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DE81E8]))
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v9, "code");

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();

LABEL_10:
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_296(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE devices SET name = printf(\"%%u - %%s\", key, OBFUSCATE(name)) WHERE name IS NOT NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE server_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE server_items SET item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_origname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_origname)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name))"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE rowid_reservations SET container_id = printf(\"%%u - %%s\", rowid,  OBFUSCATE_APPLIBRARY(container_id)) WHERE container_id IS NOT NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE users SET user_plist = NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_6(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE server_items SET child_basehash_salt = validation_key(child_basehash_salt), content_boundary_key = validation_key(content_boundary_key)"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_7(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE client_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_8(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE client_items SET item_localname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_localname)), item_bouncedname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_bouncedname)), item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name)), version_block_sync_until_bundle_id = NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_9(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE client_pkg_items SET rel_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(rel_path)) WHERE rel_path IS NOT NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_10(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE app_libraries SET app_library_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(app_library_name)) WHERE app_library_name IS NOT NULL"));
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_11(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE app_libraries SET child_basehash_salt = validation_key(child_basehash_salt)"));
  return 1;
}

- (BOOL)backupDatabaseToURL:(id)a3 error:(id *)a4
{
  return -[BRCAccountSession backupDatabaseToURL:includeServer:doNotObfuscate:error:](self, "backupDatabaseToURL:includeServer:doNotObfuscate:error:", a3, 1, 0, a4);
}

- (id)accountStatisticsWithDB:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("totalNumberOfItems"));

  v6 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items WHERE item_type = 2"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("totalNumberOfFaults"));

  v7 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items WHERE item_type = 1"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("totalNumberOfDocuments"));

  v8 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items WHERE item_type = 0"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("totalNumberOfDirectories"));

  return v4;
}

- (void)bumpNotificationRankOnItemGlobalID:(id)a3
{
  BRCPQLConnection *clientDB;
  id v4;
  void *v5;
  id v6;

  clientDB = self->_clientDB;
  v4 = a3;
  objc_msgSend(v4, "itemID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("UPDATE client_items SET item_notifs_rank = bump_notifs_rank() WHERE item_id = %@ AND zone_rowid = %@"), v6, v5);
}

- (void)disableDatabaseProfilingForDB:(id)a3
{
  objc_msgSend(a3, "setProfilingEnabled:", 0);
}

- (void)enableDatabaseProfilingForDB:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dbProfiled"))
    -[BRCAccountSession _setDatabaseProfilingForDB:enabled:verbose:](self, "_setDatabaseProfilingForDB:enabled:verbose:", v5, 1, objc_msgSend(v4, "dbVerboseProfiled"));

}

- (void)_setDatabaseProfilingForDB:(id)a3 enabled:(BOOL)a4 verbose:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setVerboseProfilingEnabled:", v5);
  objc_msgSend(v7, "setProfilingEnabled:", v6);

}

- (id)getFPFSNonMigratedItemsWithDB:(id)a3
{
  return (id)objc_msgSend(a3, "numberWithSQL:", CFSTR("SELECT count(*) FROM client_items WHERE item_localsyncupstate IN (5, 6)"));
}

- (id)_getFPFSMigrationStatus:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (!self->_clientState)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(DatabaseAdditions) _getFPFSMigrationStatus:withError:].cold.1((uint64_t)v15, v16);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT MIN(db_schema) FROM boot_history"));
    v9 = objc_msgSend(v8, "unsignedLongValue");

    if (v9 >> 4 > 0x752)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v7 = &unk_1E87D71C0;
  }
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MigrationStatus"));
  -[BRCAccountSession getFPFSNonMigratedItemsWithDB:](self, "getFPFSNonMigratedItemsWithDB:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("NonMigratedItems"));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__BRCAccountSession_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke;
  v17[3] = &unk_1E8760AE0;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A6DB0](v17);
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationUUIDKey"), CFSTR("MigrationID"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationStartTimeKey"), CFSTR("MigrationStarted"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationInitialItemsNeedMigratingCountKey"), CFSTR("InitialItemsNeedMigratingCount"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationInitialItemCountKey"), CFSTR("InitialItemsCount"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"), CFSTR("NewItemsInDB"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationLostItemCountKey"), CFSTR("MigrationLostItemCount"));
  v13 = v11;

LABEL_8:
  return v13;
}

void __74__BRCAccountSession_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "clientState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v5);

  }
}

- (BOOL)dumpFPFSMigrationStatusToFileHandle:(id)a3 tracker:(id)a4 includeNonMigratedItems:(BOOL)a5 error:(id *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  BRCPQLConnection *v11;
  BRCPQLConnection *v12;
  int cloudDocsFD;
  void *v14;
  int v15;
  FILE *v16;
  BRCPQLConnection *v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  NSObject *v24;
  const char *v26;
  const char *v27;
  _QWORD *v29;
  id v30;
  _QWORD v31[4];
  BRCPQLConnection *v32;
  BRCAccountSession *v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47[3];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  _BYTE v56[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]", 133, v47);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:].cold.1();

  v11 = self->_readOnlyDB;
  v12 = v11;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__14;
  v41 = __Block_byref_object_dispose__14;
  v42 = 0;
  cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    v14 = 0;
    if (!v11)
    {
LABEL_22:
      v21 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    -[BRCAccountSession containerScheduler](self, "containerScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_22;
  }
  v15 = dup(objc_msgSend(v8, "fileDescriptor", a6));
  v16 = fdopen(v15, "a");
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)v56 = 136315906;
        *(_QWORD *)&v56[4] = "-[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeN"
                             "onMigratedItems:error:]";
        *(_WORD *)&v56[12] = 2080;
        if (!v29)
          v27 = "(ignored by caller)";
        *(_QWORD *)&v56[14] = v27;
        *(_WORD *)&v56[22] = 2112;
        v57 = v22;
        LOWORD(v58) = 2112;
        *(_QWORD *)((char *)&v58 + 2) = v23;
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v56, 0x2Au);
      }

    }
    if (v29)
      *v29 = objc_retainAutorelease(v22);

    goto LABEL_22;
  }
  *(_QWORD *)v56 = 0;
  *(_QWORD *)&v56[8] = v56;
  *(_QWORD *)&v56[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__14;
  *(_QWORD *)&v58 = __Block_byref_object_dispose__14;
  *((_QWORD *)&v58 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v16, v12);
  objc_msgSend(*(id *)(*(_QWORD *)&v56[8] + 40), "setLiveDaemon:", cloudDocsFD >= 0);
  objc_msgSend(*(id *)(*(_QWORD *)&v56[8] + 40), "setTaskTracker:", v30);
  -[BRCAccountSession disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v12);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __114__BRCAccountSession_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke;
  v31[3] = &unk_1E8760B08;
  v17 = v12;
  v32 = v17;
  v33 = self;
  v34 = &v37;
  v35 = v56;
  v36 = &v43;
  -[BRCPQLConnection performWithFlags:action:](v17, "performWithFlags:action:", 1, v31);
  v18 = (id)v38[5];
  if (v18)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      v26 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v49 = "-[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]";
      v50 = 2080;
      if (!v29)
        v26 = "(ignored by caller)";
      v51 = v26;
      v52 = 2112;
      v53 = v18;
      v54 = 2112;
      v55 = v19;
      _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (v29)
    *v29 = objc_retainAutorelease(v18);

  fclose(v16);
  if (cloudDocsFD >= 0)
    -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v17);
  v21 = *((_BYTE *)v44 + 24) != 0;

  _Block_object_dispose(v56, 8);
LABEL_23:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  __brc_leave_section(v47);

  return v21;
}

uint64_t __114__BRCAccountSession_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongValue");

  if (v5 >> 4 >= 0x753)
  {
    v6 = *(_QWORD **)(a1 + 40);
    if (v6[22])
    {
      objc_msgSend(v6, "_getFPFSMigrationStatus:withError:", v3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v8 + 40);
        objc_msgSend(MEMORY[0x1E0CB36D8], "jsonStringFromDictionary:options:error:", v7, 1, &obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v8 + 40), obj);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v9);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x1E0D10B70], 15, MEMORY[0x1E0C9AA70], CFSTR("Domain was not migrated"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  return 0;
}

- (id)_computePathOfItemWithName:(id)a3 appLibrary:(id)a4 parentClientZoneRowID:(id)a5 parentID:(id)a6 type:(char)a7 needsLocalName:(BOOL)a8 db:(id)a9
{
  _BOOL4 v9;
  int v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v31;

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = (void *)objc_opt_new();
  if (v10 == 4)
  {
    v20 = CFSTR("/");
  }
  else
  {
    v31 = v14;
    v21 = (void *)objc_msgSend(v18, "fetch:", CFSTR(" WITH RECURSIVE item_parents (item_id, zone_rowid, item_filename, item_localname) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_filename, item_localname FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_filename, li.item_localname FROM client_items AS li     INNER JOIN item_parents AS p USING (item_id, zone_rowid)) SELECT item_localname, item_filename FROM item_parents"), v17, v16);
    v22 = objc_alloc(MEMORY[0x1E0D10E88]);
    objc_msgSend(v15, "appLibraryID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithAppLibraryName:", v23);

    objc_msgSend(v24, "mangledIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v25, 0);

    if (objc_msgSend(v21, "next"))
    {
      do
      {
        objc_msgSend(v21, "stringAtIndex:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringAtIndex:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || (v28 = objc_msgSend(v26, "length"), v29 = v26, !v28))
          v29 = v27;
        objc_msgSend(v19, "insertObject:atIndex:", v29, 1);

      }
      while ((objc_msgSend(v21, "next") & 1) != 0);
    }
    v14 = v31;
    objc_msgSend(v19, "addObject:", v31);
    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v19);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (BOOL)enumerateItemsWithType:(id)a3 itemRowIDs:(id)a4 db:(id)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  int cloudDocsFD;
  char v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  BRCAccountSession *v34;
  id v35;
  id v36;
  uint64_t *v37;
  char v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v14 = MEMORY[0x1E0C809B0];
  v45 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke;
  v39[3] = &unk_1E8760B30;
  v41 = &v42;
  v15 = v12;
  v40 = v15;
  objc_msgSend(v15, "performWithFlags:action:", 1, v39);
  v31 = v11;
  cloudDocsFD = self->_cloudDocsFD;
  -[BRCAccountSession disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v15);
  v17 = *((_BYTE *)v43 + 24);
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "1", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("reserved")) & 1) != 0)
  {
    v19 = "(+item_state = -2)";
    v20 = 18;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = cloudDocsFD;
    v23 = v13;

    v18 = (void *)v21;
    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br-alias")) & 1) != 0)
  {
    v19 = "item_type = 3";
LABEL_7:
    v20 = 13;
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br-bookmark-fault")) & 1) != 0)
  {
    v19 = "item_type = 7";
    goto LABEL_7;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("pkg")) & 1) != 0)
  {
    v19 = "(item_type IN (1, 2, 8) AND HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')";
    v20 = 80;
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br-non-uploaded")) & 1) != 0)
  {
    v19 = "item_localsyncupstate = 3";
    v20 = 25;
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("busy")))
  {
    v19 = "item_birthtime IN (443779200, -2082844800)";
    v20 = 42;
    goto LABEL_8;
  }
  v22 = cloudDocsFD;
  v23 = v13;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "1", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("indexset_contains(%p, rowid)"), v31);
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }
  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR(" WHERE %@ AND %@"), v18, v24);
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2;
  v32[3] = &unk_1E8760B58;
  v37 = &v42;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v17 ^ 1;
  v33 = v26;
  v34 = self;
  v27 = v15;
  v35 = v27;
  v28 = v23;
  v36 = v28;
  objc_msgSend(v27, "performWithFlags:action:", 1, v32);
  if ((v22 & 0x80000000) == 0)
    -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v27);

  _Block_object_dispose(&v42, 8);
  return 1;
}

uint64_t __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)objc_msgSend(v2, "unsignedLongValue") >> 4 > 0x752;

  return 0;
}

uint64_t __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v4 = CFSTR("SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_file_id, item_doc_id, item_generation FROM client_items %@");
  else
    v4 = CFSTR("SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_localname, item_file_id, item_doc_id, item_generation FROM client_items %@");
  v24 = v3;
  v5 = (void *)objc_msgSend(v3, "fetch:", v4, *(_QWORD *)(a1 + 32));
  while (objc_msgSend(v5, "next"))
  {
    objc_msgSend(v5, "stringAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", 2);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", 3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "intAtIndex:", 4);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v11 = v6;
    }
    else
    {
      objc_msgSend(v5, "stringAtIndex:", 5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    if (!*(_BYTE *)(a1 + 72) || (v13 = objc_msgSend(v11, "length"), v14 = v12, !v13))
      v14 = v6;
    v15 = *(void **)(a1 + 40);
    v28 = v12;
    v16 = v14;
    objc_msgSend(v15, "appLibraryByRowID:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_computePathOfItemWithName:appLibrary:parentClientZoneRowID:parentID:type:needsLocalName:db:", v16, v17, v8, v7, v10, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v8;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      v19 = 5;
    else
      v19 = 6;
    v25 = (void *)v9;
    objc_msgSend(v5, "numberAtIndex:", v19);
    v26 = (void *)v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", (v19 + 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", (v19 + 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  objc_msgSend(v5, "close");

  return 0;
}

- (BOOL)dumpItemsURLsToHandle:(id)a3 itemRowIDs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BRCPQLConnection *v10;
  int v11;
  FILE *v12;
  FILE *v13;
  BOOL v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSObject *v17;
  const char *v19;
  _QWORD v20[5];
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = self->_clientDB;
  if (!v10)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v11 = dup(objc_msgSend(v8, "fileDescriptor"));
  v12 = fdopen(v11, "a");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCAccountSession(DatabaseAdditions) dumpItemsURLsToHandle:itemRowIDs:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5)
          v19 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v22 = v15;
        LOWORD(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 2) = v16;
        _os_log_error_impl(&dword_1CBD43000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    goto LABEL_10;
  }
  v13 = v12;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__14;
  *(_QWORD *)&v23 = __Block_byref_object_dispose__14;
  *((_QWORD *)&v23 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v12, v10);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTaskTracker:", 0);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__BRCAccountSession_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke;
  v20[3] = &unk_1E8760B80;
  v20[4] = buf;
  -[BRCAccountSession enumerateItemsWithType:itemRowIDs:db:withBlock:](self, "enumerateItemsWithType:itemRowIDs:db:withBlock:", 0, v9, v10, v20);
  fclose(v13);
  _Block_object_dispose(buf, 8);

  v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __79__BRCAccountSession_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), a3);
}

- (BOOL)dumpItemsToHandle:(id)a3 itemType:(id)a4 tracker:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  BRCPQLConnection *v15;
  int v16;
  FILE *v17;
  int v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  NSObject *v21;
  BOOL v22;
  const char *v24;
  _QWORD v25[7];
  char v26;
  _QWORD v27[3];
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33[3];
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]", 360, v33);
  brc_bread_crumbs();
  v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v33[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v35 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping all %@ items%@", buf, 0x20u);
  }

  v15 = self->_clientDB;
  if (!v15)
    goto LABEL_13;
  v16 = dup(objc_msgSend(v10, "fileDescriptor"));
  v17 = fdopen(v16, "a");
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCAccountSession(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a6)
          v24 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v35 = v19;
        LOWORD(v36) = 2112;
        *(_QWORD *)((char *)&v36 + 2) = v20;
        _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v19);

LABEL_13:
    v22 = 0;
    goto LABEL_18;
  }
  v18 = objc_msgSend(v11, "isEqualToString:", CFSTR("all"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__14;
  *(_QWORD *)&v36 = __Block_byref_object_dispose__14;
  *((_QWORD *)&v36 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v17, v15);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTaskTracker:", v12);
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setNewLineAfterWrite:", 0);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeLineWithFormat:", CFSTR("{"));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeEmptyLine");
  }
  else
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 1;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__BRCAccountSession_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke;
  v25[3] = &unk_1E8760BA8;
  v25[4] = buf;
  v25[5] = &v29;
  v26 = v18;
  v25[6] = v27;
  -[BRCAccountSession enumerateItemsWithType:itemRowIDs:db:withBlock:](self, "enumerateItemsWithType:itemRowIDs:db:withBlock:", v11, 0, v15, v25);
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeEmptyLine");
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeLineWithFormat:", CFSTR("}"));
  }
  fclose(v17);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  v22 = 1;
LABEL_18:

  __brc_leave_section(v33);
  return v22;
}

void __81__BRCAccountSession_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v11 = a3;
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((objc_msgSend(v12, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0)
    *a8 = 1;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v11, "br_stringByJSONEscaping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "br_stringByJSONEscaping");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v15, "writeLineWithFormat:", CFSTR("\t\"%@\": \"%@\"), v13, v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      objc_msgSend(v15, "writeLineWithFormat:", CFSTR(","));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeEmptyLine");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeLineWithFormat:", CFSTR("\t\"%@\": \"%@\"), v13, v14);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v11);
  }

}

- (int)_resolveDeviceID
{
  id v2;
  int v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  NSHomeDirectory();
  v6 = xmmword_1CC066E84;
  v7 = 0;
  v5 = 0;
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (getattrlist((const char *)objc_msgSend(v2, "fileSystemRepresentation"), &v6, &v5, 8uLL, 0x20u) < 0)
    v3 = 0x80000000;
  else
    v3 = HIDWORD(v5);

  return v3;
}

- (BOOL)enumerateSharedToMeItemsWithBlock:(id)a3 error:(id *)a4
{
  BRCPQLConnection *v6;
  uint64_t v7;
  BRCPQLConnection *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v28;
  int v29;
  BRCPQLConnection *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  BRCPQLConnection *v34;
  id v35;
  _QWORD v36[4];
  BRCPQLConnection *v37;
  BRCAccountSession *v38;
  id v39;
  _BYTE *v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[4];
  BRCPQLConnection *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _BYTE buf[24];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v6 = self->_clientDB;
  v34 = v6;
  if (v6)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v7 = MEMORY[0x1E0C809B0];
    v54 = 0;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke;
    v48[3] = &unk_1E8760B30;
    v50 = &v51;
    v8 = v6;
    v49 = v8;
    -[BRCPQLConnection performWithFlags:action:](v8, "performWithFlags:action:", 1, v48);
    if (*((_BYTE *)v52 + 24))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        -[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_enumerateSharedToMeItemsWithBlock_error_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
        {
          v31 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4)
            v31 = "(ignored by caller)";
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2112;
          v56 = v17;
          v57 = 2112;
          v58 = v18;
          _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }
    else
    {
      v24 = -[BRCAccountSession _resolveDeviceID](self, "_resolveDeviceID");
      if (v24 != 0x80000000)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v56 = 0;
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "readerScanBatchSize");

        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 0;
        do
        {
          v36[0] = v7;
          v36[1] = 3221225472;
          v36[2] = __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_99;
          v36[3] = &unk_1E8760BD0;
          v30 = v8;
          v41 = &v44;
          v42 = v29;
          v40 = buf;
          v37 = v30;
          v38 = self;
          v43 = v24;
          v39 = v35;
          -[BRCPQLConnection performWithFlags:action:](v30, "performWithFlags:action:", 1, v36);

        }
        while (!*((_BYTE *)v45 + 24));
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(buf, 8);
        v23 = 1;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_unkownErrorWithDescription:", CFSTR("Can't resolve device ID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          v33 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4)
            v33 = "(ignored by caller)";
          *(_QWORD *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2112;
          v56 = v17;
          v57 = 2112;
          v58 = v25;
          _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }

    v23 = 0;
LABEL_24:

    _Block_object_dispose(&v51, 8);
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 25, CFSTR("The session has a nil DB"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      v32 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
      *(_WORD *)&buf[12] = 2080;
      if (!a4)
        v32 = "(ignored by caller)";
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      v56 = v20;
      v57 = 2112;
      v58 = v21;
      _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v20);

  v23 = 0;
LABEL_25:

  return v23;
}

uint64_t __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)objc_msgSend(v2, "unsignedLongValue") >> 4 > 0x752;

  return 0;
}

uint64_t __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_99(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "fetchWithSlowStatementRadar:sql:", CFSTR("none"), CFSTR("SELECT item_file_id, zone_rowid    FROM client_items   WHERE item_sharing_options != 0    ORDER BY rowid    LIMIT %lld    OFFSET %lld"), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (objc_msgSend(v2, "next"))
  {
    do
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v3 = objc_msgSend(v2, "integerAtIndex:", 0);
      v4 = *(void **)(a1 + 40);
      objc_msgSend(v2, "numberAtIndex:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverZoneByRowID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "clientZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isSharedZone");

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithDeviceID:fileID:", *(unsigned int *)(a1 + 80), v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
    }
    while ((objc_msgSend(v2, "next") & 1) != 0);
  }

  return 0;
}

- (BOOL)dumpDatabaseToFileHandle:(id)a3 zoneName:(id)a4 includeAllItems:(BOOL)a5 verbose:(BOOL)a6 tracker:(id)a7 error:(id *)a8
{
  _BOOL8 v9;
  void *v13;
  NSObject *v14;
  BRCPQLConnection *v15;
  BRCPQLConnection *v16;
  int cloudDocsFD;
  void *v18;
  int v19;
  FILE *v20;
  uint64_t v21;
  BRCPQLConnection *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  BOOL v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  NSObject *v34;
  const char *v36;
  const char *v37;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _BYTE *v44;
  _QWORD v45[5];
  BRCPQLConnection *v46;
  id v47;
  id v48;
  _BYTE *v49;
  uint64_t *v50;
  uint64_t *v51;
  BOOL v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63[3];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  _BYTE v72[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  __int128 v74;
  uint64_t v75;

  v9 = a6;
  v75 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v39 = a4;
  v40 = a7;
  memset(v63, 0, sizeof(v63));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]", 515, v63);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:].cold.1();

  v15 = self->_clientDB;
  v16 = v15;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__14;
  v57 = __Block_byref_object_dispose__14;
  v58 = 0;
  cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    v18 = 0;
    if (!v15)
    {
LABEL_22:
      v31 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    -[BRCAccountSession containerScheduler](self, "containerScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_22;
  }
  v19 = dup(objc_msgSend(v41, "fileDescriptor"));
  v20 = fdopen(v19, "a");
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        v37 = "(passed to caller)";
        *(_DWORD *)v72 = 136315906;
        *(_QWORD *)&v72[4] = "-[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:ve"
                             "rbose:tracker:error:]";
        *(_WORD *)&v72[12] = 2080;
        if (!a8)
          v37 = "(ignored by caller)";
        *(_QWORD *)&v72[14] = v37;
        *(_WORD *)&v72[22] = 2112;
        v73 = v32;
        LOWORD(v74) = 2112;
        *(_QWORD *)((char *)&v74 + 2) = v33;
        _os_log_error_impl(&dword_1CBD43000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v72, 0x2Au);
      }

    }
    if (a8)
      *a8 = objc_retainAutorelease(v32);

    goto LABEL_22;
  }
  *(_QWORD *)v72 = 0;
  *(_QWORD *)&v72[8] = v72;
  *(_QWORD *)&v72[16] = 0x3032000000;
  v73 = __Block_byref_object_copy__14;
  *(_QWORD *)&v74 = __Block_byref_object_dispose__14;
  *((_QWORD *)&v74 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v20, v16);
  objc_msgSend(*(id *)(*(_QWORD *)&v72[8] + 40), "setLiveDaemon:", cloudDocsFD >= 0);
  objc_msgSend(*(id *)(*(_QWORD *)&v72[8] + 40), "setTaskTracker:", v40);
  objc_msgSend(*(id *)(*(_QWORD *)&v72[8] + 40), "setVerbose:", v9);
  -[BRCAccountSession disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v16);
  v21 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke;
  v45[3] = &unk_1E8760C38;
  v49 = v72;
  v45[4] = self;
  v22 = v16;
  v46 = v22;
  v47 = v18;
  v52 = a5;
  v48 = v39;
  v50 = &v53;
  v51 = &v59;
  -[BRCPQLConnection performWithFlags:action:](v22, "performWithFlags:action:", 1, v45);
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v42[0] = v21;
  v42[1] = 3221225472;
  v42[2] = __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke_186;
  v42[3] = &unk_1E8760C60;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v43 = v23;
  v44 = v72;
  objc_msgSend(v23, "enumerateAccountHandlers:", v42);
  -[BRCAccountSession analyticsReporter](self, "analyticsReporter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v72[8] + 40));

  -[BRCAccountSession globalProgress](self, "globalProgress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v72[8] + 40));

  +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor](BRCCloudDocsAppsMonitor, "cloudDocsAppsMonitor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v72[8] + 40));

  +[BRCDaemon daemon](BRCDaemon, "daemon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v72[8] + 40));

  v28 = (id)v54[5];
  if (v28)
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v65 = "-[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]";
      v66 = 2080;
      if (!a8)
        v36 = "(ignored by caller)";
      v67 = v36;
      v68 = 2112;
      v69 = v28;
      v70 = 2112;
      v71 = v29;
      _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a8)
    *a8 = objc_retainAutorelease(v28);

  fclose(v20);
  if (cloudDocsFD >= 0)
    -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v22);
  v31 = *((_BYTE *)v60 + 24) != 0;

  _Block_object_dispose(v72, 8);
LABEL_23:
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  __brc_leave_section(v63);

  return v31;
}

uint64_t __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  const __CFString *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id obj;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  void *v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
  v112 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT count(*) FROM boot_history"));
  objc_msgSend(v112, "next");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "liveDaemon");
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v4;
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "icloudAccountIsInCarry"))
      v11 = "Yes";
    else
      v11 = "No";
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentHomeDir");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "br_realpath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeLineWithFormat:", CFSTR("dump taken at %@ [account=%@] [inCarry=%s] [home=%@]"), v9, v10, v11, v13);

  }
  else
  {
    objc_msgSend(v6, "writeLineWithFormat:", CFSTR("dump taken at %@"), v8);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", &stru_1E8769030);
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "userVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "writeLineWithFormat:", CFSTR("database version: %@"), v15);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("database ID: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(*(id *)(a1 + 40), "userVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedLongValue");

  v18 = CFSTR("FPFS");
  if (v17 >> 4 <= 0x752)
    v18 = CFSTR("Legacy");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("fsType: %@"), v18);
  if (v17 >> 4 >= 0x753)
  {
    v19 = *(_QWORD **)(a1 + 32);
    if (v19[22])
    {
      objc_msgSend(v19, "_getFPFSMigrationStatus:withError:", v3, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MigrationStatus"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(v21, "unsignedIntValue");
        objc_msgSend(v23, "writeLineWithFormat:", CFSTR("FPFS import state: %s"), BRCPrettyPrintEnum());
      }
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationUUIDKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("FPFS import UUID: %@"), v24);
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NonMigratedItems"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("FPFS import pending items: %@"), v25);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", &stru_1E8769030);
  v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  +[BRCDaemon daemon](BRCDaemon, "daemon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "startupDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeIntervalSinceNow");
  objc_msgSend(v26, "writeLineWithFormat:", CFSTR("boot_history (startup %.1fs ago)"), -v29);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dumpDateFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setDateFormat:", v31);

  objc_msgSend(v3, "userVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedLongValue");

  if (v33 <= 0x7533)
  {
    v34 = "";
    v35 = 0;
  }
  else
  {
    v34 = ",device_id";
    v35 = 10;
  }
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("server_truth"));
  v113 = (void *)v36;
  v114 = v3;
  v37 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT date,os,br,bird_schema,db_schema%@ FROM server_boot_history ORDER BY rowid DESC LIMIT 10"), v36);
  if (objc_msgSend(v37, "next"))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v37, "intAtIndex:", 0));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "stringFromDate:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringAtIndex:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringAtIndex:", 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberAtIndex:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberAtIndex:", 4);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 < 0x7534)
      {
        v44 = 0;
      }
      else
      {
        objc_msgSend(v37, "numberAtIndex:", 5);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@"), v39, v40, v41, v42, v43, v44);

    }
    while ((objc_msgSend(v37, "next") & 1) != 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("client_truth"));
  v45 = (void *)objc_msgSend(v114, "fetch:", CFSTR("SELECT date,os,br,bird_schema,db_schema%@ FROM boot_history ORDER BY rowid DESC LIMIT 10"), v113);

  if (objc_msgSend(v45, "next"))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v45, "intAtIndex:", 0));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "stringFromDate:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringAtIndex:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringAtIndex:", 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "numberAtIndex:", 3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "numberAtIndex:", 4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 < 0x7534)
      {
        v52 = 0;
      }
      else
      {
        objc_msgSend(v45, "numberAtIndex:", 5);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@"), v47, v48, v49, v50, v51, v52);

    }
    while ((objc_msgSend(v45, "next") & 1) != 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("backup_detector"));
  v53 = v114;
  v54 = (void *)objc_msgSend(v114, "fetch:", CFSTR("SELECT old,new,counter,os,br FROM backup_detector"));

  if (objc_msgSend(v54, "next"))
  {
    objc_msgSend(v54, "numberAtIndex:", 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberAtIndex:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberAtIndex:", 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringAtIndex:", 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringAtIndex:", 4);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "userVersion");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v61 = objc_retainAutorelease(v57);
    v62 = objc_msgSend(v61, "UTF8String");
    v63 = objc_retainAutorelease(v58);
    v64 = objc_msgSend(v63, "UTF8String");
    if (v59)
      v65 = objc_msgSend(v59, "longValue");
    else
      v65 = -1;
    objc_msgSend(v60, "writeLineWithFormat:", CFSTR("  [%@|%@|%@] OS:%s CloudDocs:%s DBSchema:%ld"), v110, v55, v56, v62, v64, v65);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    objc_msgSend(v54, "close");

    v53 = v114;
  }
  v66 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT * FROM server_state"));

  if (objc_msgSend(v66, "next"))
  {
    objc_msgSend(v66, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("server_state"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v67);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    objc_msgSend(v66, "close");
  }
  else
  {
    v67 = 0;
  }
  v68 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT * FROM client_state"));

  if (objc_msgSend(v68, "next"))
  {
    +[BRCAccountSession _classesForClientState](BRCAccountSession, "_classesForClientState");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "unarchivedObjectOfClasses:atIndex:", v69, 0);
    v70 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("client_state"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v70);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    objc_msgSend(v68, "close");

    v111 = (void *)v70;
  }
  else
  {
    v111 = v67;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("devices:"));
  v71 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT key, name FROM devices"));

  if (objc_msgSend(v71, "next"))
  {
    do
    {
      v72 = objc_msgSend(v71, "longAtIndex:", 0);
      objc_msgSend(v71, "stringAtIndex:", 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(v73, "fp_obfuscatedFilename");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "writeLineWithFormat:", CFSTR("    o \"%@\" (%ld)"), v75, v72);

    }
    while ((objc_msgSend(v71, "next") & 1) != 0);
  }
  objc_msgSend(v71, "close");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("users:"));
  v76 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT user_key, user_name, user_plist FROM users"));

  if (objc_msgSend(v76, "next"))
  {
    do
    {
      v77 = objc_msgSend(v76, "longAtIndex:", 0);
      objc_msgSend(v76, "stringAtIndex:", 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(v79, "nameComponents");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "br_formattedName");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "fp_obfuscatedFilename");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "writeLineWithFormat:", CFSTR("    o \"%@\" %@ (%ld)"), v78, v83, v77);

    }
    while ((objc_msgSend(v76, "next") & 1) != 0);
  }
  objc_msgSend(v76, "close");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
  objc_msgSend(*(id *)(a1 + 48), "dumpToContext:includeAllItems:db:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 40));
  v84 = *(void **)(a1 + 32);
  v85 = *(_QWORD *)(a1 + 56);
  v121 = 0;
  objc_msgSend(v84, "clientZonesMatchingSearchString:error:", v85, &v121);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v121;
  v88 = v87;
  v89 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v86)
  {
    v108 = v87;
    v90 = objc_msgSend(v86, "count");
    v91 = *(const __CFString **)(a1 + 56);
    if (!v91)
      v91 = CFSTR("*");
    objc_msgSend(v89, "writeLineWithFormat:", CFSTR("%u containers matching '%@'"), v90, v91);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v109 = v86;
    v92 = v86;
    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    if (v93)
    {
      v94 = v93;
      v95 = *(_QWORD *)v118;
      while (2)
      {
        for (i = 0; i != v94; ++i)
        {
          if (*(_QWORD *)v118 != v95)
            objc_enumerationMutation(v92);
          v97 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
          v98 = (void *)MEMORY[0x1D17A6BE8]();
          brc_bread_crumbs();
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v123 = v97;
            v124 = 2112;
            v125 = v99;
            _os_log_debug_impl(&dword_1CBD43000, v100, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping client zone %@%@", buf, 0x16u);
          }

          if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isCancelled") & 1) != 0)
          {
            objc_autoreleasePoolPop(v98);
            goto LABEL_63;
          }
          v101 = *(void **)(a1 + 32);
          v102 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          v103 = *(unsigned __int8 *)(a1 + 88);
          v104 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          obj = *(id *)(v104 + 40);
          objc_msgSend(v101, "_dumpClientZone:toContext:includeAllItems:error:", v97, v102, v103, &obj);
          objc_storeStrong((id *)(v104 + 40), obj);
          objc_autoreleasePoolPop(v98);
        }
        v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
        if (v94)
          continue;
        break;
      }
    }
LABEL_63:

    v105 = v114;
    v88 = v108;
    v86 = v109;
  }
  else
  {
    objc_msgSend(v89, "writeLineWithFormat:", CFSTR("%@"), v87);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    v105 = v114;
  }

  if (*(_BYTE *)(a1 + 88))
    +[BRCPackageItem dumpSession:toContext:db:error:](BRCPackageItem, "dumpSession:toContext:db:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v105, 0);
  objc_msgSend(*(id *)(a1 + 32), "dumpXPCClientsToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "dumpMiscOperationsToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "dumpDatabaseInfoToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  objc_msgSend(v112, "close");

  return 0;
}

void __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke_186(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "deviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "versionsProviderForVolume:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dumpToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)_dumpClientZoneBlockedState:(id)a3 toContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if ((objc_msgSend(v9, "state") & 0x10000) != 0)
  {
    objc_msgSend(v5, "highlightedString:type:", CFSTR(">>> BROKEN STRUCTURE"), 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeLineWithFormat:", CFSTR("%@"), v6);

  }
  if (objc_msgSend(v9, "isSyncBlockedBecauseAppNotInstalled"))
  {
    objc_msgSend(v5, "highlightedString:type:", CFSTR(">>> SYNC DISABLED (app not installed)"), 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeLineWithFormat:", CFSTR("%@"), v7);

  }
  if (objc_msgSend(v9, "isSyncBlockedBecauseOSNeedsUpgrade"))
  {
    objc_msgSend(v5, "highlightedString:type:", CFSTR(">>> NEEDS UPGRADE"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeLineWithFormat:", CFSTR("%@"), v8);

  }
}

- (BOOL)_dumpClientZoneStatus:(id)a3 toContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "descriptionWithContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeLineWithFormat:", CFSTR("%@"), v10);

  -[BRCAccountSession _dumpClientZoneBlockedState:toContext:](self, "_dumpClientZoneBlockedState:toContext:", v8, v9);
  objc_msgSend(v9, "pushIndentation");
  objc_msgSend(v8, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "dumpStatusToContext:error:", v9, a5);

  v12 = (_DWORD)v10 && (objc_msgSend(v8, "dumpStatusToContext:error:", v9, a5) & 1) != 0;
  objc_msgSend(v9, "popIndentation");

  return v12;
}

- (BOOL)_dumpClientZone:(id)a3 toContext:(id)a4 includeAllItems:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "descriptionWithContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeLineWithFormat:", CFSTR("- %@"), v12);

  -[BRCAccountSession _dumpClientZoneBlockedState:toContext:](self, "_dumpClientZoneBlockedState:toContext:", v10, v11);
  objc_msgSend(v11, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  if (objc_msgSend(v10, "isPrivateZone"))
  {
    objc_msgSend(v11, "pushIndentation");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v10, "asPrivateClientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appLibraries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dumpToContext:", v11);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v11, "popIndentation");
  }
  objc_msgSend(v11, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v11, "pushIndentation");
  objc_msgSend(v10, "serverZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (objc_msgSend(v10, "isSharedZone"))
    {
      objc_msgSend(v10, "asSharedClientZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "zoneName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ownerName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "db");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession _sharedServerZoneByName:ownerName:db:](self, "_sharedServerZoneByName:ownerName:db:", v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "db");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession _privateServerZoneByName:db:](self, "_privateServerZoneByName:db:", v20, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "associateWithServerZone:", v19);
  }
  v24 = objc_msgSend(v10, "dumpActivityToContext:includeExpensiveActivity:error:", v11, v7, a6);
  if (v24)
  {
    objc_msgSend(v11, "writeLineWithFormat:", &stru_1E8769030);
    v25 = objc_msgSend(v19, "dumpTablesToContext:includeAllItems:error:", v11, v7, a6);
    v26 = objc_msgSend(v10, "dumpTablesToContext:includeAllItems:error:", v11, v7, a6);
    if (v25 && v26)
      objc_msgSend(v11, "writeLineWithFormat:", CFSTR(" - not done dumping items -"));
    objc_msgSend(v11, "popIndentation");
    objc_msgSend(v11, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  }
  else
  {
    objc_msgSend(v11, "popIndentation");
  }

  return v24;
}

- (BOOL)dumpStatusToFileHandle:(id)a3 zoneName:(id)a4 tracker:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  BRCPQLConnection *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  BRCAccountSession *v31;
  id v32;
  _BYTE *v33;
  uint64_t v34[3];
  uint8_t v35[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]", 855, v34);
  brc_bread_crumbs();
  v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v34[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v44 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping status for zone: %@%@", buf, 0x20u);
  }

  v15 = self->_clientDB;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__14;
  v45 = __Block_byref_object_dispose__14;
  v46 = 0;
  -[BRCAccountSession disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v15);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke;
  v28 = &unk_1E87606E8;
  v16 = v10;
  v29 = v16;
  v33 = buf;
  v17 = v12;
  v30 = v17;
  v31 = self;
  v18 = v11;
  v32 = v18;
  -[BRCPQLConnection performWithFlags:action:](v15, "performWithFlags:action:", 1, &v25);
  v19 = *(id *)(*(_QWORD *)&buf[8] + 40);
  if (v19)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      v24 = "(passed to caller)";
      *(_DWORD *)v35 = 136315906;
      v36 = "-[BRCAccountSession(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]";
      v37 = 2080;
      if (!a6)
        v24 = "(ignored by caller)";
      v38 = v24;
      v39 = 2112;
      v40 = v19;
      v41 = 2112;
      v42 = v20;
      _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v35, 0x2Au);
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v19);

  -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v15, v25, v26, v27, v28);
  v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v34);

  return v22;
}

uint64_t __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  FILE *v5;
  FILE *v6;
  id v7;
  BRCDumpContext *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  FILE *v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = dup(objc_msgSend(*(id *)(a1 + 32), "fileDescriptor"));
  v5 = fdopen(v4, "a");
  if (v5)
  {
    v6 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v7, "setDateStyle:", 1);
    objc_msgSend(v7, "setTimeStyle:", 2);
    v8 = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v6, v3);
    -[BRCDumpContext setLiveDaemon:](v8, "setLiveDaemon:", 1);
    -[BRCDumpContext setOnlyActiveStuff:](v8, "setOnlyActiveStuff:", 1);
    -[BRCDumpContext setTaskTracker:](v8, "setTaskTracker:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT count(*) FROM boot_history"));
    objc_msgSend(v9, "next");
    v10 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v52 = 0;
    objc_msgSend(v10, "clientZonesMatchingSearchString:error:", v11, &v52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v52;
    v14 = v13;
    if (v12)
    {
      v45 = v6;
      v15 = objc_msgSend(v12, "count");
      v16 = *(void **)(a1 + 56);
      v46 = v3;
      v43 = v9;
      v44 = v7;
      v41 = v14;
      if (v16)
        v17 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      else
        v17 = "*";
      -[BRCDumpContext writeLineWithFormat:](v8, "writeLineWithFormat:", CFSTR("%u containers matching '%s'"), v15, v17);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v42 = v12;
      v29 = v12;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v49 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1D17A6BE8]();
            brc_bread_crumbs();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v54 = v29;
              v55 = 2112;
              v56 = v36;
              _os_log_debug_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping container %@%@", buf, 0x16u);
            }

            if (-[BRCDumpContext isCancelled](v8, "isCancelled"))
            {
              objc_autoreleasePoolPop(v35);
              goto LABEL_22;
            }
            v38 = *(void **)(a1 + 48);
            v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            obj = *(id *)(v39 + 40);
            objc_msgSend(v38, "_dumpClientZoneStatus:toContext:error:", v34, v8, &obj);
            objc_storeStrong((id *)(v39 + 40), obj);
            objc_autoreleasePoolPop(v35);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v31)
            continue;
          break;
        }
      }
LABEL_22:

      v6 = v45;
      v3 = v46;
      v9 = v43;
      v7 = v44;
      v14 = v41;
      v12 = v42;
    }
    else
    {
      -[BRCDumpContext writeLineWithFormat:](v8, "writeLineWithFormat:", CFSTR("%@"), v13);
      -[BRCDumpContext writeEmptyLine](v8, "writeEmptyLine");
    }

    objc_msgSend(v9, "close");
    fclose(v6);

  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    objc_msgSend(0, "close");
  }

  return 0;
}

- (void)scheduleZoneMovesToCloudDocs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  BRCAccountSession *v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession cloudDocsClientZone](self, "cloudDocsClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAppLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wasMovedToCloudDocs");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke;
    v25[3] = &unk_1E875E0F8;
    v26 = v8;
    v27 = self;
    v9 = v8;
    -[BRCAccountSession enumerateAppLibraries:](self, "enumerateAppLibraries:", v25);
    objc_msgSend(v9, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v10;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v22;
    *(_QWORD *)&v13 = 138412290;
    v20 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "isCloudDocsZone", v20, (_QWORD)v21))
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v20;
            v29 = v18;
            _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't CZM the clouddocs zone%@", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v17, "scheduleMoveToCloudDocs");
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v14);
  }

}

uint64_t __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v16;

  v3 = a2;
  if ((objc_msgSend(v3, "wasMovedToCloudDocs") & 1) == 0)
  {
    objc_msgSend(v3, "defaultClientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCloudDocsZone"))
      goto LABEL_7;
    objc_msgSend(v3, "mangledID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldAutoMigrateToCloudDocs");

    if (v7)
    {
      objc_msgSend(v3, "defaultClientZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serverZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasFetchedServerZoneState");

      if ((v10 & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "serialQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2;
        block[3] = &unk_1E875D500;
        v16 = v3;
        dispatch_async(v11, block);

        goto LABEL_8;
      }
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v3, "defaultClientZone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

LABEL_7:
    }
  }
LABEL_8:

  return 1;
}

void __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleSyncDown");

}

- (id)resolvedOpenRelpathForPath:(id)a3 mustExist:(BOOL)a4 errcode:(int *)a5
{
  return -[BRCAccountSession resolvedOpenRelpathForPath:mustExist:allowResolveInPkg:errcode:](self, "resolvedOpenRelpathForPath:mustExist:allowResolveInPkg:errcode:", a3, a4, 0, a5);
}

- (id)resolvedOpenRelpathForPath:(id)a3 mustExist:(BOOL)a4 allowResolveInPkg:(BOOL)a5 errcode:(int *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  BRCRelativePath *v11;
  void *v12;
  BRCRelativePath *v13;
  int v15;

  v7 = a5;
  v8 = a4;
  v15 = 0;
  v10 = a3;
  v11 = -[BRCRelativePath initWithAbsolutePath:session:]([BRCRelativePath alloc], "initWithAbsolutePath:session:", v10, self);

  if (!-[BRCRelativePath resolveAndKeepOpenMustExist:allowResolveInPkg:error:](v11, "resolveAndKeepOpenMustExist:allowResolveInPkg:error:", v8, v7, &v15))
  {
    if (a6)
    {
      v13 = 0;
      *a6 = v15;
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  -[BRCRelativePath appLibrary](v11, "appLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[BRCRelativePath close](v11, "close");
    goto LABEL_7;
  }
  v13 = v11;
LABEL_8:

  return v13;
}

- (void)_resolvePathInMobileDocsRoot:(id)a3 appLibrary:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  int v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;

  v6 = a3;
  objc_msgSend(v6, "pathRelativeToRoot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(PathResolution) _resolvePathInMobileDocsRoot:appLibrary:].cold.1((uint64_t)v31, v32);

  }
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (!v9)
  {
    objc_msgSend(v6, "setType:", 1);
    objc_msgSend(v6, "setItemScope:", 1);
    v14 = 0;
    if (!a4)
      goto LABEL_38;
    goto LABEL_37;
  }
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0D10E88];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "validateMangledIDString:", v12);

  v14 = 0;
  v15 = 0;
  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0D10E88]);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithMangledString:", v17);

    -[BRCAccountSession appLibraryByMangledID:](self, "appLibraryByMangledID:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v10 < 2)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "compare:options:", *MEMORY[0x1E0D10D98], 2) == 0;

  }
  v20 = v10 != 2 && v19;
  v21 = objc_msgSend(v14, "includesDataScope");
  v22 = v21 ^ 1 | v20;
  if (v21)
    v23 = 3;
  else
    v23 = 2;
  if (v22 == 1 && v10 >= v23)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v23 - 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "compare:options:", *MEMORY[0x1E0D10E00], 2);

    if (v10 == 2)
      v26 = 5;
    else
      v26 = 6;
    if (v10 == 1)
      v27 = 2;
    else
      v27 = v26;
    objc_msgSend(v6, "setType:", v27);
    if (!v25)
    {
      v28 = 3;
      goto LABEL_36;
    }
  }
  else
  {
    if (v10 == 2)
      v29 = 5;
    else
      v29 = 6;
    if (v10 == 1)
      v30 = 2;
    else
      v30 = v29;
    objc_msgSend(v6, "setType:", v30);
  }
  if (v22)
    v28 = 2;
  else
    v28 = 1;
LABEL_36:
  objc_msgSend(v6, "setItemScope:", v28);

  if (a4)
LABEL_37:
    objc_storeStrong(a4, v14);
LABEL_38:

}

- (int)resolvePathAdditionalMetadata:(id)a3 appLibrary:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id obj;

  v6 = a3;
  obj = 0;
  objc_msgSend(v6, "root");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCAccountSession hasRootForSyncedFolderType:](self, "hasRootForSyncedFolderType:", 1))
  {
    -[BRCAccountSession rootForSyncedFolderType:](self, "rootForSyncedFolderType:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      -[BRCAccountSession _resolvePathInMobileDocsRoot:appLibrary:](self, "_resolvePathInMobileDocsRoot:appLibrary:", v6, &obj);
      if (!a4)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (a4)
LABEL_4:
    objc_storeStrong(a4, obj);
LABEL_5:

  return 0;
}

- (id)_old_privateAppLibraryByZoneName:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__BRCAccountSession_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@ AND (app_library_owner = %@ OR app_library_owner IS NULL)"), a3, *MEMORY[0x1E0C94730]);
}

id __83__BRCAccountSession_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newAppLibraryFromPQLResultSet:version:", a2, 2);
}

- (id)_clientZonesMatchingSearchString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD);
  id v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  BRCAccountSession *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  char v60;
  _QWORD v61[4];
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v4) ^ 1;

  }
  v8 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v4;
    v11 = (id)*MEMORY[0x1E0C94730];
  }
  else
  {
    v12 = v8;
    v13 = v9;
    objc_msgSend(v4, "substringToIndex:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", v12 + v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v11;
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D10E88], "validateContainerID:", v15))
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v15, v14);
    -[BRCAccountSession clientZoneByMangledID:](self, "clientZoneByMangledID:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (id)v17;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke;
      v61[3] = &unk_1E8763458;
      v62 = v15;
      v20 = v19;
      v63 = v20;
      -[BRCAccountSession enumerateSharedClientZones:](self, "enumerateSharedClientZones:", v61);
      objc_msgSend(v20, "addObject:", v18);
      v21 = v63;
      v22 = v20;

      v23 = v62;
      v24 = v22;
      goto LABEL_22;
    }

  }
  v49 = self;
  v25 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2;
  v59[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
  v60 = v6;
  v26 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v59);
  v27 = objc_alloc(MEMORY[0x1E0CB38E8]);
  ((void (**)(_QWORD, void *))v26)[2](v26, v15);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (const __CFString *)v28;
  else
    v30 = CFSTR("*");
  v31 = (void *)objc_msgSend(v27, "initWithPattern:options:error:", v30, 0, 0);

  v32 = objc_alloc(MEMORY[0x1E0CB38E8]);
  objc_msgSend(v14, "lowercaseString");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (const __CFString *)v33;
  else
    v35 = CFSTR("*");
  v36 = (void *)objc_msgSend(v32, "initWithPattern:options:error:", v35, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v25;
  v55[1] = 3221225472;
  v55[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3;
  v55[3] = &unk_1E87634A0;
  v38 = v14;
  v39 = v26;
  v58 = v39;
  v40 = v31;
  v56 = v40;
  v41 = v37;
  v57 = v41;
  v42 = (void *)MEMORY[0x1D17A6DB0](v55);
  v50[0] = v25;
  v50[1] = 3221225472;
  v50[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4;
  v50[3] = &unk_1E87634C8;
  v54 = v39;
  v51 = v40;
  v52 = v36;
  v43 = v41;
  v53 = v43;
  v22 = v36;
  v16 = v40;
  v18 = v39;
  v44 = (void *)MEMORY[0x1D17A6DB0](v50);
  if (!v38)
    -[BRCAccountSession enumeratePrivateClientZones:](v49, "enumeratePrivateClientZones:", v42);
  -[BRCAccountSession enumerateSharedClientZones:](v49, "enumerateSharedClientZones:", v44, v38);
  objc_msgSend(v43, "sortUsingComparator:", &__block_literal_global_32);
  brc_bread_crumbs();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v65 = v4;
    v66 = 2112;
    v67 = v43;
    v68 = 2112;
    v69 = v45;
    _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
  }

  v23 = v43;
  v24 = v23;
  v14 = v48;
LABEL_22:

  return v24;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 1;
}

id __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  return 1;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(*(id *)(a1 + 40), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

  return 1;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 129);
  return v7;
}

- (id)clientZonesMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCAccountSession _clientZonesMatchingSearchString:](self, "_clientZonesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorClientZoneNotFound:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[BRCAccountSession(BRCContainerFindByName) clientZonesMatchingSearchString:error:]";
        v16 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v8 = 0;
  }

  return v8;
}

- (id)singleClientZoneMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  const char *v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCAccountSession _clientZonesMatchingSearchString:](self, "_clientZonesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      objc_msgSend(v7, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v14, "isPrivateZone"))
          {
            objc_msgSend(v14, "zoneName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);
          }
          else
          {
            objc_msgSend(v14, "mangledID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "mangledIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D10B70];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "br_errorWithDomain:code:description:", v18, 12, CFSTR("Too many containers matching '%@': {%@}"), v6, v19, (_QWORD)v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v35 = "-[BRCAccountSession(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        v36 = 2080;
        if (!a4)
          v28 = "(ignored by caller)";
        v37 = v28;
        v38 = 2112;
        v39 = v20;
        v40 = 2112;
        v41 = v21;
        _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAppLibraryNotFound:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v35 = "-[BRCAccountSession(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        v36 = 2080;
        if (!a4)
          v27 = "(ignored by caller)";
        v37 = v27;
        v38 = 2112;
        v39 = v8;
        v40 = 2112;
        v41 = v23;
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  v25 = 0;
LABEL_26:

  return v25;
}

- (id)_appLibrariesMatchingSearchString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  char v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v4) ^ 1;

  }
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (-[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", v8),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void (**)(_QWORD, _QWORD))v9;
    v40[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke;
    v32[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
    v33 = v6;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v32);
    v14 = objc_alloc(MEMORY[0x1E0CB38E8]);
    ((void (**)(_QWORD, void *))v13)[2](v13, v8);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = CFSTR("*");
    v18 = (void *)objc_msgSend(v14, "initWithPattern:options:error:", v17, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = v12;
    v26 = 3221225472;
    v27 = __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2;
    v28 = &unk_1E8763530;
    v31 = v13;
    v29 = v18;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v19;
    v20 = v18;
    v10 = v13;
    v21 = (void *)MEMORY[0x1D17A6DB0](&v25);
    -[BRCAccountSession enumerateAppLibraries:](self, "enumerateAppLibraries:", v21, v25, v26, v27, v28);
    objc_msgSend(v19, "sortUsingComparator:", &__block_literal_global_22_0);
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v4;
      v36 = 2112;
      v37 = v19;
      v38 = 2112;
      v39 = v22;
      _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
    }

    v11 = v19;
  }

  return v11;
}

id __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  return 1;
}

uint64_t __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 129);
  return v7;
}

- (id)appLibrariesMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCAccountSession _appLibrariesMatchingSearchString:](self, "_appLibrariesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorClientZoneNotFound:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[BRCAccountSession(BRCContainerFindByName) appLibrariesMatchingSearchString:error:]";
        v16 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v8 = 0;
  }

  return v8;
}

- (id)singleAppLibraryMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCAccountSession _appLibrariesMatchingSearchString:](self, "_appLibrariesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      objc_msgSend(v7, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "appLibraryID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D10B70];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "br_errorWithDomain:code:description:", v16, 12, CFSTR("Too many containers matching '%@': {%@}"), v6, v17, (_QWORD)v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        v26 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = "-[BRCAccountSession(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        v34 = 2080;
        if (!a4)
          v26 = "(ignored by caller)";
        v35 = v26;
        v36 = 2112;
        v37 = v18;
        v38 = 2112;
        v39 = v19;
        _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAppLibraryNotFound:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = "-[BRCAccountSession(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        v34 = 2080;
        if (!a4)
          v25 = "(ignored by caller)";
        v35 = v25;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v21;
        _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  v23 = 0;
LABEL_23:

  return v23;
}

- (BOOL)shouldPerformPCSMigration
{
  void *v3;
  char v4;

  if (-[BRCAccountSession PCSMigrationComplete](self, "PCSMigrationComplete"))
    return 0;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPreparePCSMigration");

  return v4;
}

- (BOOL)PCSMigrationComplete
{
  void *v2;
  void *v3;
  char v4;

  -[BRCAccountSession clientState](self, "clientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasCompletedPCSMigration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setNeedsPCSMigration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession clientState](self, "clientState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("hasCompletedPCSMigration"));

  -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
}

- (BRCAccountSession)init
{
  BRCAccountSession *v2;
  BRCAccountSession *v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dbWatcherQueue;
  id v12;
  dispatch_workloop_t v13;
  OS_dispatch_workloop *clientTruthWorkloop;
  id v15;
  dispatch_workloop_t v16;
  OS_dispatch_workloop *serverTruthWorkloop;
  id v18;
  dispatch_workloop_t v19;
  OS_dispatch_workloop *readOnlyWorkloop;
  uint64_t v21;
  NSHashTable *miscOperations;
  uint64_t v23;
  NSString *personaIdentifier;
  BRCBarrier *v25;
  BRCBarrier *dbLoadingBarrier;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)BRCAccountSession;
  v2 = -[BRCAccountSession init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    brc_mutex_init_recursive(&v2->_zonesLock.pthread);
    brc_mutex_init(&v3->_zonesCreationLock.pthread);
    v3->_cloudDocsFD = -1;
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "br_currentPersonaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    BRPersonaSpecificName();
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v7, v9);

    dbWatcherQueue = v3->_dbWatcherQueue;
    v3->_dbWatcherQueue = (OS_dispatch_queue *)v10;

    BRPersonaSpecificName();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_workloop_create((const char *)objc_msgSend(v12, "UTF8String"));
    clientTruthWorkloop = v3->_clientTruthWorkloop;
    v3->_clientTruthWorkloop = (OS_dispatch_workloop *)v13;

    BRPersonaSpecificName();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = dispatch_workloop_create((const char *)objc_msgSend(v15, "UTF8String"));
    serverTruthWorkloop = v3->_serverTruthWorkloop;
    v3->_serverTruthWorkloop = (OS_dispatch_workloop *)v16;

    BRPersonaSpecificName();
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_workloop_create((const char *)objc_msgSend(v18, "UTF8String"));
    readOnlyWorkloop = v3->_readOnlyWorkloop;
    v3->_readOnlyWorkloop = (OS_dispatch_workloop *)v19;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    miscOperations = v3->_miscOperations;
    v3->_miscOperations = (NSHashTable *)v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", &v3->_isDataSeparated);
    v23 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v3->_personaIdentifier;
    v3->_personaIdentifier = (NSString *)v23;

    v25 = objc_alloc_init(BRCBarrier);
    dbLoadingBarrier = v3->_dbLoadingBarrier;
    v3->_dbLoadingBarrier = v25;

    v3->_isOpen = 0;
  }
  return v3;
}

- (BRCAccountSession)initWithACAccountID:(id)a3 dbAccountDSID:(id)a4 salt:(id)a5 accountHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BRCAccountSession *v15;
  BRCAccountSession *v16;
  NSMutableSet *v17;
  NSMutableSet *xpcClients;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BRCFileUnlinker *v24;
  BRCFileUnlinker *fileUnlinker;
  void *v26;
  uint64_t v27;
  NSURL *dbURL;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[BRCAccountSession init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_acAccountID, a3);
    objc_storeStrong((id *)&v16->_accountDSID, a4);
    objc_storeStrong((id *)&v16->_ubiquityTokenSalt, a5);
    objc_storeStrong((id *)&v16->_accountHandler, a6);
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    xpcClients = v16->_xpcClients;
    v16->_xpcClients = v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0D10D00];
    objc_msgSend(v19, "stringByAppendingPathComponent:", *MEMORY[0x1E0D10D00]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession setSessionDirPath:](v16, "setSessionDirPath:", v21);

    objc_msgSend(MEMORY[0x1E0CB3940], "brc_currentCachesDir");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession setCacheDirPath:](v16, "setCacheDirPath:", v23);

    v24 = -[BRCFileUnlinker initWithCacheDirPath:]([BRCFileUnlinker alloc], "initWithCacheDirPath:", v22);
    fileUnlinker = v16->_fileUnlinker;
    v16->_fileUnlinker = v24;

    -[NSString stringByAppendingPathComponent:](v16->_sessionDirPath, "stringByAppendingPathComponent:", CFSTR("db"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v26, 1);
    v27 = objc_claimAutoreleasedReturnValue();
    dbURL = v16->_dbURL;
    v16->_dbURL = (NSURL *)v27;

  }
  return v16;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: session wasn't properly closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("session{account:%@}"), self->_accountDSID);
}

- (BRCTapToRadarManager)tapToRadarManager
{
  return self->_tapToRadarManager;
}

- (BRCSyncUpStagingProtocol)syncUpStager
{
  return (BRCSyncUpStagingProtocol *)self->_stageRegistry;
}

- (BRCDownloadStagingProtocol)downloadStager
{
  return (BRCDownloadStagingProtocol *)self->_stageRegistry;
}

- (BOOL)registerClient:(id)a3
{
  id v4;
  BRCAccountSession *v5;
  _BOOL4 isCancelled;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableSet containsObject:](v5->_xpcClients, "containsObject:", v4))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession registerClient:].cold.1();

  }
  isCancelled = v5->_isCancelled;
  if (!v5->_isCancelled)
    -[NSMutableSet addObject:](v5->_xpcClients, "addObject:", v4);
  objc_sync_exit(v5);

  return !isCancelled;
}

- (void)unregisterClient:(id)a3
{
  id v4;
  BRCAccountSession *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((-[NSMutableSet containsObject:](v5->_xpcClients, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession unregisterClient:].cold.1();

  }
  -[NSMutableSet removeObject:](v5->_xpcClients, "removeObject:", v4);
  objc_sync_exit(v5);

}

- (void)addMiscOperation:(id)a3
{
  -[NSHashTable addObject:](self->_miscOperations, "addObject:", a3);
}

- (id)getMiscOperations
{
  return (id)-[NSHashTable copy](self->_miscOperations, "copy");
}

- (void)closeXPCClientsSync
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx closing XPC connections%@");
  OUTLINED_FUNCTION_2();
}

- (BOOL)icloudAccountIsInCarry
{
  NSNumber *isInCarry;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *v18;
  BOOL v19;

  isInCarry = self->_isInCarry;
  if (isInCarry)
    return -[NSNumber BOOLValue](isInCarry, "BOOLValue");
  +[BRCAccountHandler currentiCloudAccount](BRCAccountHandler, "currentiCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "br_isEnabledForCloudDocs"))
  {
    -[BRCAccountSession accountDSID](self, "accountDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "br_dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F430]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "host");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "carryPartitions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && (objc_msgSend(v16, "containsObject:", v14) & 1) != 0)
          v17 = (NSNumber *)MEMORY[0x1E0C9AAB0];
        else
          v17 = (NSNumber *)MEMORY[0x1E0C9AAA0];
        v18 = self->_isInCarry;
        self->_isInCarry = v17;

      }
    }
  }
  v19 = -[NSNumber BOOLValue](self->_isInCarry, "BOOLValue");

  return v19;
}

- (void)_setupSharedPackageExtensionsPlist
{
  objc_msgSend(MEMORY[0x1E0CB3940], "brc_loadForcedPackageExtensionsForCurrentPersona");
}

- (void)_closeSharedPackageExtensionsPlist
{
  objc_msgSend(MEMORY[0x1E0CB3940], "brc_closeForcedPackageExtensionsForPersona:", self->_personaIdentifier);
}

- (void)_createAccountSupportPathIfNeeded:(id)a3 protectParent:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  char v55;
  char v56;
  int v57;
  int v58;
  void *v59;
  NSObject *v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72[3];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t buf[4];
  _BYTE v78[10];
  id v79;
  _BYTE v80[10];
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v4 = a4;
  v93 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:]", 489, v72);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v78 = v72[0];
    *(_WORD *)&v78[8] = 2112;
    v79 = v66;
    *(_WORD *)v80 = 2112;
    *(_QWORD *)&v80[2] = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating '%@'%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v66, 1, 0, &v71);
  v9 = v71;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if ((objc_msgSend(v9, "br_isCocoaErrorCode:", 516) & 1) == 0)
    {
      brc_bread_crumbs();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        v79 = v10;
        *(_WORD *)v80 = 2112;
        *(_QWORD *)&v80[2] = v59;
        _os_log_fault_impl(&dword_1CBD43000, v60, OS_LOG_TYPE_FAULT, "[CRIT] can't create directory at '%@': %@%@", buf, 0x20u);
      }

LABEL_69:
      exit(1);
    }
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:].cold.2((uint64_t)v66);

  }
  v70 = v10;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v66, &v70);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v70;

  v15 = v14 == 0;
  if (v14)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v45 = objc_msgSend(objc_retainAutorelease(v66), "fileSystemRepresentation");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v78 = v45;
      *(_WORD *)&v78[8] = 2112;
      v79 = v14;
      *(_WORD *)v80 = 2112;
      *(_QWORD *)&v80[2] = v16;
      _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] can't retrieve attributes of item at '%s': %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(v13, "fileOwnerAccountName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v13, "fileOwnerAccountName");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v78 = v46;
      *(_WORD *)&v78[8] = 2112;
      v79 = v47;
      *(_WORD *)v80 = 2112;
      *(_QWORD *)&v80[2] = v21;
      _os_log_fault_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_FAULT, "[CRIT] created directory has a wrong owner (value: %@, expected: %@)%@", buf, 0x20u);

    }
    v15 = 0;
  }
  if ((objc_msgSend(v13, "filePosixPermissions") & 0x180) == 0)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v65 = aPcDBLSW[(unsigned __int16)objc_msgSend(v13, "filePosixPermissions") >> 12];
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x100) != 0)
        v48 = 114;
      else
        v48 = 45;
      v64 = v48;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x80) != 0)
        v49 = 119;
      else
        v49 = 45;
      v63 = v49;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x40) != 0)
        v50 = 120;
      else
        v50 = 45;
      v62 = v50;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x20) != 0)
        v51 = 114;
      else
        v51 = 45;
      v61 = v51;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x10) != 0)
        v52 = 119;
      else
        v52 = 45;
      if ((objc_msgSend(v13, "filePosixPermissions") & 8) != 0)
        v53 = 120;
      else
        v53 = 45;
      if ((objc_msgSend(v13, "filePosixPermissions") & 4) != 0)
        v54 = 114;
      else
        v54 = 45;
      v55 = objc_msgSend(v13, "filePosixPermissions");
      v56 = objc_msgSend(v13, "filePosixPermissions");
      *(_DWORD *)buf = 67111682;
      *(_DWORD *)v78 = v65;
      if ((v55 & 2) != 0)
        v57 = 119;
      else
        v57 = 45;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v64;
      if ((v56 & 1) != 0)
        v58 = 120;
      else
        v58 = 45;
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)v80 = v62;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v61;
      v81 = 1024;
      v82 = v52;
      v83 = 1024;
      v84 = v53;
      v85 = 1024;
      v86 = v54;
      v87 = 1024;
      v88 = v57;
      v89 = 1024;
      v90 = v58;
      v91 = 2112;
      v92 = v23;
      _os_log_fault_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_FAULT, "[CRIT] created directory doesn't have read/write access for owner (permission: %c%c%c%c%c%c%c%c%c%c)%@", buf, 0x48u);
    }

    v15 = 0;
  }
  v25 = *MEMORY[0x1E0CB2AD8];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0CB2AC0];
  v28 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0CB2AC0]);

  if ((v28 & 1) != 0)
  {
    v29 = v14;
  }
  else
  {
    v75 = v25;
    v76 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v14;
    v31 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v30, v66, &v69);
    v29 = v69;

    if ((v31 & 1) == 0)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        v79 = v29;
        *(_WORD *)v80 = 2112;
        *(_QWORD *)&v80[2] = v32;
        _os_log_fault_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
      }

    }
  }
  if (v4)
  {
    objc_msgSend(v66, "stringByDeletingLastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v29;
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v34, &v68);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v68;

    objc_msgSend(v35, "objectForKeyedSubscript:", v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", v27);

    if ((v38 & 1) != 0)
    {
      v29 = v36;
    }
    else
    {
      v73 = v25;
      v74 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v36;
      v40 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v39, v34, &v67);
      v29 = v67;

      if ((v40 & 1) == 0)
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v78 = v34;
          *(_WORD *)&v78[8] = 2112;
          v79 = v29;
          *(_WORD *)v80 = 2112;
          *(_QWORD *)&v80[2] = v41;
          _os_log_fault_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
        }

      }
    }

  }
  else
  {
    v35 = v13;
  }

  if (!v15)
    goto LABEL_69;
  brc_bread_crumbs();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:].cold.1();

  __brc_leave_section(v72);
}

- (void)markAccountMigrationComplete
{
  -[BRCAccountHandler markMigrationCompletedForDSID:](self->_accountHandler, "markMigrationCompletedForDSID:", self->_accountDSID);
}

- (void)_setupThrottles
{
  void *v3;
  void *v4;
  BRCThrottle *v5;
  BRCThrottle *appLibraryScanThrottle;
  void *v7;
  BRCThrottle *v8;
  BRCThrottle *appLibraryResetThrottle;
  void *v10;
  BRCThrottle *v11;
  BRCThrottle *sharedAppLibraryResetThrottle;
  void *v13;
  BRCThrottle *v14;
  BRCThrottle *appLibraryAliasRemovalThrottle;
  void *v16;
  BRCThrottle *v17;
  BRCThrottle *lostItemThrottle;
  void *v19;
  BRCThrottle *v20;
  BRCThrottle *operationFailureThrottle;
  void *v22;
  BRCThrottle *v23;
  BRCThrottle *syncClientZoneThrottle;
  BRCThrottle *v25;
  BRCThrottle *syncClientZoneErrorThrottle;
  id v27;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLibraryScanThrottleParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("fsreader.container.throttle"), v4);
  appLibraryScanThrottle = self->_appLibraryScanThrottle;
  self->_appLibraryScanThrottle = v5;

  objc_msgSend(v3, "appLibraryResetThrottleParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("container.reset.throttle"), v7);
  appLibraryResetThrottle = self->_appLibraryResetThrottle;
  self->_appLibraryResetThrottle = v8;

  objc_msgSend(v3, "sharedAppLibraryResetThrottleParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("shared-container.reset.throttle"), v10);
  sharedAppLibraryResetThrottle = self->_sharedAppLibraryResetThrottle;
  self->_sharedAppLibraryResetThrottle = v11;

  objc_msgSend(v3, "appLibraryAliasRemovalThrottleParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("container.reset.alias-removal.throttle"), v13);
  appLibraryAliasRemovalThrottle = self->_appLibraryAliasRemovalThrottle;
  self->_appLibraryAliasRemovalThrottle = v14;

  objc_msgSend(v3, "lostItemThrottleParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("fsreader.lost.throttle"), v16);
  lostItemThrottle = self->_lostItemThrottle;
  self->_lostItemThrottle = v17;

  objc_msgSend(v3, "operationFailureThrottleParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("operation.failure.throttle"), v19);
  operationFailureThrottle = self->_operationFailureThrottle;
  self->_operationFailureThrottle = v20;

  objc_msgSend(v3, "syncClientZoneThrottleParams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("sync.container.throttle"), v22);
  syncClientZoneThrottle = self->_syncClientZoneThrottle;
  self->_syncClientZoneThrottle = v23;

  objc_msgSend(v3, "syncClientZoneErrorThrottleParams");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v25 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("sync.container.error.throttle"), v27);
  syncClientZoneErrorThrottle = self->_syncClientZoneErrorThrottle;
  self->_syncClientZoneErrorThrottle = v25;

}

- (void)resetThrottles
{
  -[BRCThrottle reset](self->_appLibraryScanThrottle, "reset");
  -[BRCThrottle reset](self->_appLibraryResetThrottle, "reset");
  -[BRCThrottle reset](self->_appLibraryAliasRemovalThrottle, "reset");
  -[BRCThrottle reset](self->_sharedAppLibraryResetThrottle, "reset");
  -[BRCThrottle reset](self->_lostItemThrottle, "reset");
  -[BRCThrottle reset](self->_operationFailureThrottle, "reset");
  -[BRCThrottle reset](self->_syncClientZoneThrottle, "reset");
  -[BRCThrottle reset](self->_syncClientZoneErrorThrottle, "reset");
}

- (void)_refreshRootsCache
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] New mobile documents dir = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_submitSessionOpenFailedTelemetryEventIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Checking if there is a need to submit ACCOUNT_SESSION_OPEN_ERROR telemetry%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_submitDBCorruptionTelemetryEventIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Checking if there is a need to submit DB_RESET telemetry%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)openWithError:(id *)a3 pushWorkloop:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSMutableDictionary *v11;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *v13;
  NSMutableDictionary *serverZonesByZoneRowID;
  NSMutableDictionary *v15;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *v17;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *v19;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *v21;
  NSMutableDictionary *privateClientZonesByID;
  NSMutableDictionary *v23;
  NSMutableDictionary *rootsByFolderType;
  NSMutableDictionary *v25;
  NSMutableDictionary *fsEventsMonitors;
  id v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  BRDSIDString *accountDSID;
  void *v33;
  void *v34;
  NSURL *v35;
  NSObject *v36;
  void *v37;
  NSURL *v38;
  BRCVolume *v39;
  BRCVolume *volume;
  BRCVolume *v41;
  void *v42;
  BRCStageRegistry *v43;
  BRCStageRegistry *stageRegistry;
  BRCFairScheduler *v45;
  BRCFairScheduler *fairClientDBScheduler;
  BRCDeadlineScheduler *v47;
  BRCDeadlineScheduler *defaultScheduler;
  BRCContainerScheduler *v49;
  BRCContainerScheduler *containerScheduler;
  BRCApplyScheduler *v51;
  BRCApplyScheduler *applyScheduler;
  BRCFSReader *v53;
  BRCFSReader *fsReader;
  BRCFSWriter *v55;
  BRCFSWriter *fsWriter;
  BRCFSUploader *v57;
  BRCFSUploader *fsUploader;
  BRCFSDownloader *v59;
  BRCFSDownloader *fsDownloader;
  BRCSyncUpScheduler *v61;
  BRCSyncUpScheduler *syncUpScheduler;
  BRCNotificationManager *v63;
  BRCNotificationManager *notificationManager;
  BRCSyncContextProvider *v65;
  BRCSyncContextProvider *syncContextProvider;
  BRCTimerScheduler *v67;
  BRCTimerScheduler *autoResumeSyncTimerScheduler;
  BRCTapToRadarManager *v69;
  BRCTapToRadarManager *tapToRadarManager;
  BRCDownloadTrackers *v71;
  BRCDownloadTrackers *downloadTrackers;
  NSObject *v73;
  OS_dispatch_queue *v74;
  OS_dispatch_queue *resetQueue;
  NSObject *v76;
  OS_dispatch_queue *v77;
  OS_dispatch_queue *dbFixupQueue;
  void *v79;
  BRCRecentsEnumerator *v80;
  BRCRecentsEnumerator *recentsEnumerator;
  BRCUserNotification *v82;
  BRCUserNotification *userNotification;
  BRCDiskSpaceReclaimer *v84;
  BRCDiskSpaceReclaimer *diskReclaimer;
  void *v86;
  void *v87;
  BOOL v88;
  void *v89;
  void *v90;
  br_pacer *v91;
  br_pacer *reschedulePendingDiskItemsPacer;
  void *v93;
  br_pacer *v94;
  br_pacer *updateDiskSpacePacer;
  BRCGlobalProgress *v96;
  BRCGlobalProgress *globalProgress;
  BRCItemTransmogrifier *v98;
  BRCItemTransmogrifier *itemTransmogrifier;
  BRCAnalyticsReporter *v100;
  BRCAnalyticsReporter *analyticsReporter;
  void *v103;
  NSObject *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  const char *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  const char *v114;
  void *v115;
  void *v116;
  _QWORD v117[9];
  id v118[5];
  id v119;
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD block[4];
  NSURL *v123;
  uint64_t v124[3];
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  BRCAccountSession *v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_isOpen)
  {
    brc_bread_crumbs();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession openWithError:pushWorkloop:].cold.5();

  }
  memset(v124, 0, sizeof(v124));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]", 1045, v124);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v126 = v124[0];
    v127 = 2112;
    v128 = self;
    v129 = 2112;
    v130 = v7;
    _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Opening session%@", buf, 0x20u);
  }

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v15;

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  rootsByFolderType = self->_rootsByFolderType;
  self->_rootsByFolderType = v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  fsEventsMonitors = self->_fsEventsMonitors;
  self->_fsEventsMonitors = v25;

  -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:](self, "_createAccountSupportPathIfNeeded:protectParent:", self->_sessionDirPath, 1);
  -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:](self, "_createAccountSupportPathIfNeeded:protectParent:", self->_cacheDirPath, 1);
  if (self->_cloudDocsFD == -1)
  {
    -[NSString stringByDeletingLastPathComponent](self->_sessionDirPath, "stringByDeletingLastPathComponent");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = open((const char *)objc_msgSend(v27, "fileSystemRepresentation"), 33028);
    self->_cloudDocsFD = v28;
    if (v28 < 0)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open file at path '%@' %{errno}d"), v27, *__error());
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
      {
        brc_append_system_info_to_message();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession openWithError:pushWorkloop:].cold.1(v109, (uint64_t)v107, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v110 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSession openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1070, v110);
    }
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession openWithError:pushWorkloop:].cold.4((uint64_t)v27);

    if (flock(self->_cloudDocsFD, 2) < 0)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to lock file at path '%@' %{errno}d"), v27, *__error());
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT))
      {
        brc_append_system_info_to_message();
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession openWithError:pushWorkloop:].cold.1(v113, (uint64_t)v111, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v114 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSession openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1074, v114);
    }

  }
  -[BRCAccountSession dirPathForSyncedFolderType:](self, "dirPathForSyncedFolderType:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  accountDSID = self->_accountDSID;
  objc_msgSend(v31, "stringByDeletingLastPathComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(accountDSID) = BRCMigrateLegacyUbiquityRoot(accountDSID, v31, v33);

  if ((accountDSID & 1) != 0)
  {
    -[NSURL path](self->_dbURL, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:](self, "_createAccountSupportPathIfNeeded:protectParent:", v34, 0);

    v35 = self->_dbURL;
    dispatch_get_global_queue(0, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke;
    block[3] = &unk_1E875D500;
    v38 = v35;
    v123 = v38;
    dispatch_async(v36, block);

    -[BRCAccountSession _setupSharedPackageExtensionsPlist](self, "_setupSharedPackageExtensionsPlist");
    -[BRCAccountSession _setupThrottles](self, "_setupThrottles");
    v39 = objc_alloc_init(BRCVolume);
    volume = self->_volume;
    self->_volume = v39;

    objc_msgSend(MEMORY[0x1E0D10E30], "clearAccountDescriptorCache");
    v121[0] = v37;
    v121[1] = 3221225472;
    v121[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_53;
    v121[3] = &unk_1E87647E8;
    v121[4] = self;
    -[BRCAccountSession _enumerateAccountHandlerSupportedFolderTypes:](self, "_enumerateAccountHandlerSupportedFolderTypes:", v121);
    v41 = self->_volume;
    -[BRCAccountSession rootForSyncedFolderType:](self, "rootForSyncedFolderType:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = -[BRCVolume setUpForRelPath:error:](v41, "setUpForRelPath:error:", v42, a3);

    if ((v41 & 1) == 0)
      goto LABEL_22;
    v43 = -[BRCStageRegistry initWithAccountSession:]([BRCStageRegistry alloc], "initWithAccountSession:", self);
    stageRegistry = self->_stageRegistry;
    self->_stageRegistry = v43;

    -[BRCStageRegistry open](self->_stageRegistry, "open");
    if (!-[BRCAccountSession openDBWithError:](self, "openDBWithError:", a3))
      goto LABEL_22;
    -[BRCAccountSession _markDBOpened](self, "_markDBOpened");
    v45 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", self->_clientTruthWorkloop, CFSTR("client-db"));
    fairClientDBScheduler = self->_fairClientDBScheduler;
    self->_fairClientDBScheduler = v45;

    v47 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.main-scheduler"), self->_fairClientDBScheduler);
    defaultScheduler = self->_defaultScheduler;
    self->_defaultScheduler = v47;

    v49 = -[BRCContainerScheduler initWithAccountSession:pushWorkloop:]([BRCContainerScheduler alloc], "initWithAccountSession:pushWorkloop:", self, v6);
    containerScheduler = self->_containerScheduler;
    self->_containerScheduler = v49;

    v51 = -[BRCApplyScheduler initWithAccountSession:]([BRCApplyScheduler alloc], "initWithAccountSession:", self);
    applyScheduler = self->_applyScheduler;
    self->_applyScheduler = v51;

    v53 = -[BRCFSReader initWithAccountSession:]([BRCFSReader alloc], "initWithAccountSession:", self);
    fsReader = self->_fsReader;
    self->_fsReader = v53;

    v55 = -[BRCFSWriter initWithAccountSession:]([BRCFSWriter alloc], "initWithAccountSession:", self);
    fsWriter = self->_fsWriter;
    self->_fsWriter = v55;

    v57 = -[BRCFSUploader initWithAccountSession:]([BRCFSUploader alloc], "initWithAccountSession:", self);
    fsUploader = self->_fsUploader;
    self->_fsUploader = v57;

    v59 = -[BRCFSDownloader initWithAccountSession:]([BRCFSDownloader alloc], "initWithAccountSession:", self);
    fsDownloader = self->_fsDownloader;
    self->_fsDownloader = v59;

    v61 = -[BRCSyncUpScheduler initWithAccountSession:]([BRCSyncUpScheduler alloc], "initWithAccountSession:", self);
    syncUpScheduler = self->_syncUpScheduler;
    self->_syncUpScheduler = v61;

    v63 = -[BRCNotificationManager initWithAccountSession:]([BRCNotificationManager alloc], "initWithAccountSession:", self);
    notificationManager = self->_notificationManager;
    self->_notificationManager = v63;

    v65 = -[BRCSyncContextProvider initWithAccountSession:]([BRCSyncContextProvider alloc], "initWithAccountSession:", self);
    syncContextProvider = self->_syncContextProvider;
    self->_syncContextProvider = v65;

    v67 = -[BRCTimerScheduler initWithAccountSession:timerName:sqlTable:field:timerHandler:]([BRCTimerScheduler alloc], "initWithAccountSession:timerName:sqlTable:field:timerHandler:", self, CFSTR("autoResumeSyncTimer"), CFSTR("client_items"), CFSTR("version_block_sync_until_timestamp"), &__block_literal_global_46);
    autoResumeSyncTimerScheduler = self->_autoResumeSyncTimerScheduler;
    self->_autoResumeSyncTimerScheduler = v67;

    v69 = objc_alloc_init(BRCTapToRadarManager);
    tapToRadarManager = self->_tapToRadarManager;
    self->_tapToRadarManager = v69;

    v71 = -[BRCDownloadTrackers initWithSession:]([BRCDownloadTrackers alloc], "initWithSession:", self);
    downloadTrackers = self->_downloadTrackers;
    self->_downloadTrackers = v71;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.reset", v73);

    resetQueue = self->_resetQueue;
    self->_resetQueue = v74;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.db.fixup", v76);

    dbFixupQueue = self->_dbFixupQueue;
    self->_dbFixupQueue = v77;

    dispatch_suspend((dispatch_object_t)self->_resetQueue);
    v120[0] = v37;
    v120[1] = 3221225472;
    v120[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_3;
    v120[3] = &unk_1E87647E8;
    v120[4] = self;
    -[BRCAccountSession _enumerateAccountHandlerSupportedFolderTypes:](self, "_enumerateAccountHandlerSupportedFolderTypes:", v120);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v76) = objc_msgSend(v79, "spotlightIndexingEnabled");

    if ((_DWORD)v76)
    {
      v80 = -[BRCRecentsEnumerator initWithAccountSession:]([BRCRecentsEnumerator alloc], "initWithAccountSession:", self);
      recentsEnumerator = self->_recentsEnumerator;
      self->_recentsEnumerator = v80;

    }
    v82 = objc_alloc_init(BRCUserNotification);
    userNotification = self->_userNotification;
    self->_userNotification = v82;

    if (-[BRCAccountSession _createAppLibraryRootsIfNeededWithError:](self, "_createAppLibraryRootsIfNeededWithError:", a3)&& -[BRCAccountSession createAppLibrariesIfNeededWithError:](self, "createAppLibrariesIfNeededWithError:", a3))
    {
      v84 = -[BRCDiskSpaceReclaimer initWithAccountSession:]([BRCDiskSpaceReclaimer alloc], "initWithAccountSession:", self);
      diskReclaimer = self->_diskReclaimer;
      self->_diskReclaimer = v84;

      -[BRCContainerScheduler setup](self->_containerScheduler, "setup");
      objc_msgSend(MEMORY[0x1E0D10E88], "cloudDocsMangledID");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession getOrCreateAppLibraryAndPrivateZonesIfNecessary:](self, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v116);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "defaultClientZone");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = v87 != 0;
      if (v87)
      {
        objc_msgSend(v87, "defaultAppLibrary");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v115)
        {
          brc_bread_crumbs();
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
            -[BRCAccountSession openWithError:pushWorkloop:].cold.3();

        }
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "diskSpaceCheckInterval");

        -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        br_pacer_create();
        v91 = (br_pacer *)objc_claimAutoreleasedReturnValue();
        reschedulePendingDiskItemsPacer = self->_reschedulePendingDiskItemsPacer;
        self->_reschedulePendingDiskItemsPacer = v91;

        objc_initWeak((id *)buf, self);
        v118[1] = v37;
        v118[2] = (id)3221225472;
        v118[3] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_89;
        v118[4] = &unk_1E875DC98;
        objc_copyWeak(&v119, (id *)buf);
        br_pacer_set_event_handler();
        -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        br_pacer_create();
        v94 = (br_pacer *)objc_claimAutoreleasedReturnValue();
        updateDiskSpacePacer = self->_updateDiskSpacePacer;
        self->_updateDiskSpacePacer = v94;

        v117[5] = v37;
        v117[6] = 3221225472;
        v117[7] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_91;
        v117[8] = &unk_1E875DC98;
        objc_copyWeak(v118, (id *)buf);
        br_pacer_set_event_handler();
        v96 = -[BRCGlobalProgress initWithSession:]([BRCGlobalProgress alloc], "initWithSession:", self);
        globalProgress = self->_globalProgress;
        self->_globalProgress = v96;

        v98 = -[BRCItemTransmogrifier initWithSession:]([BRCItemTransmogrifier alloc], "initWithSession:", self);
        itemTransmogrifier = self->_itemTransmogrifier;
        self->_itemTransmogrifier = v98;

        v100 = -[BRCAnalyticsReporter initWithSession:]([BRCAnalyticsReporter alloc], "initWithSession:", self);
        analyticsReporter = self->_analyticsReporter;
        self->_analyticsReporter = v100;

        -[BRCAccountSession _submitDBCorruptionTelemetryEventIfNeeded](self, "_submitDBCorruptionTelemetryEventIfNeeded");
        -[BRCAccountSession _submitSessionOpenFailedTelemetryEventIfNeeded](self, "_submitSessionOpenFailedTelemetryEventIfNeeded");
        v117[0] = v37;
        v117[1] = 3221225472;
        v117[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_95;
        v117[3] = &unk_1E8764850;
        v117[4] = self;
        -[BRCAccountSession fetchUserRecordIDWithCompletionHandler:](self, "fetchUserRecordIDWithCompletionHandler:", v117);
        +[BRCSQLBackedSet clearTempDatabases](BRCSQLBackedSet, "clearTempDatabases");
        self->_isOpen = 1;
        objc_destroyWeak(v118);
        objc_destroyWeak(&v119);
        objc_destroyWeak((id *)buf);

      }
      else if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 4);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
LABEL_22:
      v88 = 0;
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D10B70], 18, 0);
    v88 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v88 = 0;
  }

  __brc_leave_section(v124);
  return v88;
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17A6BE8]();
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]_block_invoke", 1100, v14);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v16 = v14[0];
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx including %@ in backup%@", buf, 0x20u);
  }

  v5 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x1E0C999D8];
  v13 = 0;
  v7 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA0], v6, &v13);
  v8 = v13;
  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = (uint64_t)v12;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to include '%@' from backups: %@%@", buf, 0x20u);

    }
  }
  __brc_leave_section(v14);

  objc_autoreleasePoolPop(v2);
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_53(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "createRootForSyncedFolderType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setRoot:forSyncedFolderType:", v4, a2);

  return 1;
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[BRCDocumentItem autoResumeSyncPausedDocumentsOnTimeoutWithSession:](BRCDocumentItem, "autoResumeSyncPausedDocumentsOnTimeoutWithSession:", a2);
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "rootForSyncedFolderType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "createFSEventsMonitorForSyncedFolderType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFSEventsMonitor:forSyncedFolderType:", v5, a2);

  }
  return 1;
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_89(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4[3];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    memset(v4, 0, sizeof(v4));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]_block_invoke", 1285, v4);
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_89_cold_1();

    objc_msgSend(WeakRetained[79], "rescheduleJobsForPendingDiskSpaceWithAvailableSpace:", objc_msgSend(WeakRetained, "availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:", 0, 0));
    __brc_leave_section(v4);
  }

}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_91(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]_block_invoke", 1293, v4);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_91_cold_1();

  objc_msgSend(WeakRetained, "availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:", 0, 1);
  __brc_leave_section(v4);

}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "enablePushNotifications");
}

- (void)_markDBOpened
{
  self->_isDBOpened = 1;
}

- (void)_pcsChainAllItemsWithActivity:(id)a3
{
  id v4;
  NSObject *clientTruthWorkloop;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);

}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_2();

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_98;
  v7[3] = &unk_1E87648A0;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v10 = &v11;
  objc_msgSend(v8, "enumerateAppLibraries:", v7);
  if (!*((_BYTE *)v12 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_1();

  }
  _Block_object_dispose(&v11, 8);
}

BOOL __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BRCPCSChainingOperation *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  BRCPCSChainingOperation *v24;
  NSObject *v25;
  _QWORD *v26;
  NSObject *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  dispatch_block_t v31;
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  BRCPCSChainingOperation *v39;
  id location;
  _QWORD v41[6];

  v3 = a2;
  objc_msgSend(v3, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDocumentScopePublic") & 1) == 0)
  {

LABEL_11:
    v12 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v3, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSyncBlocked");

  if ((v6 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v3, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aggressivelyPCSChainWithSession:", *(_QWORD *)(a1 + 32));

  if (!v9)
    goto LABEL_11;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_98_cold_1();

    }
    v12 = 0;
  }
  else
  {
    objc_msgSend(v3, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_99;
    v41[3] = &unk_1E875E2C8;
    v41[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "documentsFolderItemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultClientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dbRowID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "fetchObject:sql:", v41, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_filename != '.Trash' AND pcs_state NOT IN (2, 3) LIMIT 1"), v16, v18);

    v12 = v19 == 0;
    if (v19)
    {
      v20 = -[BRCPCSChainingOperation initWithRootItem:appLibrary:sessionContext:syncUpCallback:]([BRCPCSChainingOperation alloc], "initWithRootItem:appLibrary:sessionContext:syncUpCallback:", v19, v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 640));
      objc_msgSend(MEMORY[0x1E0C94F88], "br_aggressiveChaining");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setGroup:](v20, "setGroup:", v21);

      -[BRCPCSChainingOperation setQualityOfService:](v20, "setQualityOfService:", 9);
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "serialQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v22);

      dispatch_source_set_timer(v23, 0, 0x2540BE400uLL, 0xB2D05E00uLL);
      v37[0] = v15;
      v37[1] = 3221225472;
      v37[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2;
      v37[3] = &unk_1E875D470;
      v38 = *(id *)(a1 + 40);
      v24 = v20;
      v39 = v24;
      v25 = v23;
      v26 = v37;
      v27 = v25;
      v28 = v26;
      v29 = v28;
      v30 = v28;
      if (*MEMORY[0x1E0D11070])
      {
        ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v30);
      dispatch_source_set_event_handler(v27, v31);

      dispatch_resume(v27);
      v33[0] = v15;
      v33[1] = 3221225472;
      v33[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_105;
      v33[3] = &unk_1E8764878;
      v32 = v27;
      v34 = v32;
      objc_copyWeak(&v36, &location);
      v35 = *(id *)(a1 + 40);
      -[BRCPCSChainingOperation setPcsChainCompletionBlock:](v24, "setPcsChainCompletionBlock:", v33);
      -[_BRCOperation schedule](v24, "schedule");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);

    }
  }
LABEL_12:

  return v12;
}

id __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_99(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newServerItemFromPQLResultSet:error:", a2, a3);
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "cancel");
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
        __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_cold_1();

    }
  }
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_105(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject **WeakRetained;
  NSObject **v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a3;
  v8 = a5;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    if ((objc_msgSend(v8, "brc_isCloudKitCancellationError") & 1) == 0
      && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_105_cold_1();

    }
  }
  else
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_106;
      v17[3] = &unk_1E875E948;
      v17[4] = WeakRetained;
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v7, "addPreFlushDirectoryListCompletionBlock:", v17);
      objc_msgSend(v7, "beginObservingChangesWithDelegate:", 0);
      v11 = v18;
    }
    else
    {
      v14 = WeakRetained[6];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_3;
      v15[3] = &unk_1E875D470;
      v15[4] = WeakRetained;
      v16 = *(id *)(a1 + 40);
      dispatch_async(v14, v15);
      v11 = v16;
    }

  }
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_106(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_107;
  v4[3] = &unk_1E875D470;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_107(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pcsChainAllItemsWithActivity:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pcsChainAllItemsWithActivity:", *(_QWORD *)(a1 + 40));
}

- (id)_getPartiallySaltedItemWithAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  objc_msgSend(v4, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  if (objc_msgSend(v4, "saltingState") != 2)
    goto LABEL_4;
  objc_msgSend(v4, "rootItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_4:
    objc_msgSend(v5, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT item_id FROM server_items WHERE salting_state = 2 AND item_type IN (0, 9, 10) AND zone_rowid = %@ LIMIT 1"), v10);

    if (objc_msgSend(v11, "next")
      && (objc_msgSend(v11, "objectOfClass:atIndex:", objc_opt_class(), 0),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(v5, "itemByItemID:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "asDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)_saltPartiallySaltedItemsWithActivity:(id)a3
{
  id v4;
  NSObject *clientTruthWorkloop;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);

}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_115;
  v9[3] = &unk_1E87648F0;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v4, "enumerateAppLibraries:", v9);
  if (!*((_BYTE *)v14 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_1();

  }
  _Block_object_dispose(&v13, 8);
}

BOOL __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _BOOL8 v10;
  void *v12;
  BRCSaltingBatchOperation *v13;
  id v14;
  BRCSaltingBatchOperation *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v3 = a2;
  objc_msgSend(v3, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSyncBlocked") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v3, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "finishSaltingPartiallySaltedDirectories")
    || (objc_msgSend(v4, "enhancedDrivePrivacyEnabled") & 1) == 0)
  {

    goto LABEL_12;
  }
  v7 = objc_msgSend(v4, "isBusy");

  if ((v7 & 1) != 0)
  {
LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_115_cold_1();

    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_getPartiallySaltedItemWithAppLibrary:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 40));
    v10 = v12 == 0;
    if (v12)
    {
      v13 = [BRCSaltingBatchOperation alloc];
      v14 = objc_loadWeakRetained(&location);
      v15 = -[BRCSaltingBatchOperation initWithParentItem:sessionContext:](v13, "initWithParentItem:sessionContext:", v12, v14);

      objc_msgSend(MEMORY[0x1E0C94F88], "br_partialSaltingCompletion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setGroup:](v15, "setGroup:", v16);

      -[_BRCOperation setNonDiscretionary:](v15, "setNonDiscretionary:", 1);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_117;
      v18[3] = &unk_1E87648C8;
      objc_copyWeak(&v22, &location);
      v19 = v12;
      v17 = v4;
      v20 = v17;
      v21 = *(id *)(a1 + 32);
      -[BRCSaltingBatchOperation setMetadataCompletionBlock:](v15, "setMetadataCompletionBlock:", v18);
      objc_msgSend(v17, "addOutOfBandOperation:", v15);
      -[_BRCOperation schedule](v15, "schedule");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v22);
    }
    objc_destroyWeak(&location);

  }
LABEL_13:

  return v10;
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_117(id *a1, int a2, int a3, void *a4)
{
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analyticsReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugItemIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "mangledID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1[5], "enhancedDrivePrivacyEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aggregateReportForAppTelemetryIdentifier:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:error:", 42, v12, v13, v14, v7);

    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = a1[4];
      *(_DWORD *)buf = 138413314;
      v25 = v18;
      v26 = 1024;
      v27 = a2;
      v28 = 1024;
      v29 = a3;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished metadata salting a batch for item %@ when completed: %d validation: %d error: %@%@", buf, 0x2Cu);
    }

    if (!v7
      || (objc_msgSend(v7, "brc_isSaltingError") & 1) != 0
      || (a3 & 1) != 0
      || objc_msgSend(v7, "brc_isCloudKitCancellationError"))
    {
      v17 = v9[6];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_119;
      v19[3] = &unk_1E875DD30;
      v20 = v7;
      v21 = a1[5];
      v22 = v9;
      v23 = a1[6];
      dispatch_async(v17, v19);

    }
  }

}

uint64_t __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_119(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitCancellationError") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "scheduleSyncDown");
  return objc_msgSend(*(id *)(a1 + 48), "_saltPartiallySaltedItemsWithActivity:", *(_QWORD *)(a1 + 56));
}

- (unsigned)_recoverAndReportBoosting
{
  BRCAccountSession *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__BRCAccountSession__recoverAndReportBoosting__block_invoke;
  v5[3] = &unk_1E8764918;
  v5[4] = &v6;
  -[BRCAccountSession enumerateAppLibraries:](self, "enumerateAppLibraries:", v5);
  v3 = +[AppTelemetryTimeSeriesEvent newSyncBoostingProblemCountWithProblemCount:](AppTelemetryTimeSeriesEvent, "newSyncBoostingProblemCountWithProblemCount:", *((unsigned int *)v7 + 6));
  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](v2->_analyticsReporter, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v3);
  LODWORD(v2) = *((_DWORD *)v7 + 6);

  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __46__BRCAccountSession__recoverAndReportBoosting__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "integrityCheckBoosting") & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (unsigned)_recoverAndReportBrokenShareOptions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v16;
  BRCAccountSession *v18;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[BRCPQLConnection fetch:](self->_clientDB, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci LEFT JOIN server_items AS si ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE ci.zone_rowid != ci.item_parent_zone_rowid AND (ci.item_sharing_options & 4) = 0 AND (si.item_id IS NULL OR item_id_is_root(si.item_parent_id))"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__BRCAccountSession__recoverAndReportBrokenShareOptions__block_invoke;
  v20[3] = &unk_1E875E2C8;
  v18 = self;
  v19 = v3;
  v20[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(v10, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isSharedZone");

        if (v13)
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v10;
            v27 = 2112;
            v28 = v14;
            _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is missing a shareID%@", buf, 0x16u);
          }

          objc_msgSend(v10, "setSharingOptions:", objc_msgSend(v10, "sharingOptions") | 4);
          objc_msgSend(v10, "markForceNeedsSyncUp");
          objc_msgSend(v10, "saveToDB");
          v7 = (v7 + 1);
        }
        objc_autoreleasePoolPop(v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v16 = +[AppTelemetryTimeSeriesEvent newCorruptSharingOptionsProblemWithProblemCount:](AppTelemetryTimeSeriesEvent, "newCorruptSharingOptionsProblemWithProblemCount:", v7);
  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](v18->_analyticsReporter, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v16);

  return v7;
}

id __56__BRCAccountSession__recoverAndReportBrokenShareOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (unsigned)_reportBasehashSalting
{
  return 0;
}

- (void)_recoverAndReportStateIntegrityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BRCPQLConnection *clientDB;
  uint64_t v10;
  id v11;
  NSObject *clientTruthWorkloop;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  BRCAccountSession *v19;
  _QWORD *v20;
  _QWORD v21[4];

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession _recoverAndReportStateIntegrityWithCompletion:].cold.1();

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v7 = dispatch_group_create();
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  clientDB = self->_clientDB;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke;
  v17[3] = &unk_1E8764940;
  v11 = v8;
  v19 = self;
  v20 = v21;
  v18 = v11;
  -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 8, v17);
  clientTruthWorkloop = self->_clientTruthWorkloop;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke_2;
  block[3] = &unk_1E8764968;
  v15 = v4;
  v16 = v21;
  v13 = v4;
  dispatch_group_notify(v7, clientTruthWorkloop, block);

  _Block_object_dispose(v21, 8);
}

uint64_t __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckMissingShareOptions"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_recoverAndReportBrokenShareOptions");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckApplyJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 608), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckSyncUpJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 640), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckDownloadJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 632), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckUploadJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckReaderJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "integrityCheckBoosting"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_recoverAndReportBoosting");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckBasehashSalting"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_reportBasehashSalting");
  return 1;
}

uint64_t __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_cleanupOldCiconiaLocations
{
  id v3;
  BRCFileUnlinker *fileUnlinker;
  void *v5;
  id v6;

  if (self->_isDataSeparated)
  {
    objc_msgSend(MEMORY[0x1E0D10E60], "cloudDocsAppSupportURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("ciconia"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (!access((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0))
    {
      fileUnlinker = self->_fileUnlinker;
      objc_msgSend(v3, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](fileUnlinker, "renameAndUnlinkInBackgroundItemAtPath:", v5);

    }
  }
}

- (id)_prepareXPCActivityIdentifierWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDataSeparatedPersona");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[BRCAccountSession volume](self, "volume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%d"), v4, objc_msgSend(v9, "deviceID"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)_registerBackgroundXPCActivities
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void (**v9)(_QWORD *);
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  id v22;
  _QWORD *v23;
  id v24;
  const char *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location[2];

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  -[BRCAccountSession _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.transmogrify"));
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v39, "UTF8String");
  objc_msgSend(v3, "transmogrifyXPCActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke;
  v47[3] = &unk_1E875EA30;
  objc_copyWeak(&v48, location);
  v6 = v5;
  v7 = v47;
  v8 = v7;
  v9 = (void (**)(_QWORD *))MEMORY[0x1E0D11060];
  if (*MEMORY[0x1E0D11060])
  {
    ((void (*)(_QWORD *))*MEMORY[0x1E0D11060])(v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  xpc_activity_unregister(v4);
  xpc_activity_register(v4, v6, v8);

  -[BRCAccountSession _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.aggressive-pcs-chain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "aggressivelyPCSChainWithSession:", self);
  v13 = objc_retainAutorelease(v11);
  v14 = v13;
  if (v12)
  {
    v15 = (const char *)objc_msgSend(v13, "UTF8String");
    objc_msgSend(v3, "aggressivePCSChainActivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_139;
    v45[3] = &unk_1E875EA30;
    objc_copyWeak(&v46, location);
    v17 = v16;
    v18 = v45;
    v19 = v18;
    if (*v9)
    {
      (*v9)(v18);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    xpc_activity_unregister(v15);
    xpc_activity_register(v15, v17, v19);

    objc_destroyWeak(&v46);
  }
  else
  {
    v21 = (const char *)objc_msgSend(v13, "UTF8String");
    v22 = (id)*MEMORY[0x1E0C80748];
    if (*v9)
    {
      (*v9)(__block_literal_global_759);
      v23 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = __block_literal_global_759;
    }
    xpc_activity_unregister(v21);
    xpc_activity_register(v21, v22, v23);

  }
  -[BRCAccountSession _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.db-integrity-check"));
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = (const char *)objc_msgSend(v24, "UTF8String");
  objc_msgSend(v3, "dbIntegrityCheckXPCActivity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_144;
  v43[3] = &unk_1E875EA30;
  objc_copyWeak(&v44, location);
  v27 = v26;
  v28 = v43;
  v29 = v28;
  if (*v9)
  {
    (*v9)(v28);
    v30 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v30;
  }
  xpc_activity_unregister(v25);
  xpc_activity_register(v25, v27, v29);

  -[BRCAccountSession _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.finish-salting-partially-salted-directories"));
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = (const char *)objc_msgSend(v31, "UTF8String");
  objc_msgSend(v3, "finishSaltingPartiallySaltedDirectoriesActivity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_151;
  v40[3] = &unk_1E8764A38;
  v34 = v3;
  v41 = v34;
  objc_copyWeak(&v42, location);
  v35 = v33;
  v36 = v40;
  v37 = v36;
  if (*MEMORY[0x1E0D11060])
  {
    ((void (*)(_QWORD *))*MEMORY[0x1E0D11060])(v36);
    v38 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v38;
  }
  xpc_activity_unregister(v32);
  xpc_activity_register(v32, v35, v37);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v48);
  objc_destroyWeak(location);

}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3))
        goto LABEL_14;
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }

    }
    objc_msgSend(WeakRetained, "clientDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (xpc_activity_get_state(v3) == 2)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_131;
        block[3] = &unk_1E875D500;
        block[4] = WeakRetained;
        dispatch_sync(v8, block);
        if (!xpc_activity_set_state(v3, 5))
        {
          brc_bread_crumbs();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v13 = v9;
            _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", buf, 0xCu);
          }

        }
      }
    }

  }
LABEL_14:

}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_131(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "acAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifierForACAccountID:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v31, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v4 = 0;
  else
    v4 = v31;
  v5 = v4;
  v33 = v31;
  if (!v5)
  {
    if (_block_invoke___personaOnceToken_3 != -1)
      dispatch_once(&_block_invoke___personaOnceToken_3, &__block_literal_global_134);
    v33 = (id)_block_invoke___personalPersona_3;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  objc_msgSend(v32, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  if (v7 == v33 || (objc_msgSend(v7, "isEqualToString:") & 1) != 0)
    goto LABEL_10;
  if (voucher_process_can_use_arbitrary_personas())
  {
    v38 = 0;
    v20 = (void *)objc_msgSend(v32, "copyCurrentPersonaContextWithError:", &v38);
    v21 = v38;
    v22 = v39;
    v39 = v20;

    if (v21)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v21);

    }
    objc_msgSend(v32, "generateAndRestorePersonaContextWithPersonaUniqueString:", v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
LABEL_10:
      v29 = 0;
      goto LABEL_11;
    }
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v42 = v31;
      v43 = 2112;
      v44 = v29;
      v45 = 2112;
      v46 = v25;
      _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
    goto LABEL_39;
  }
  if (!v5 && (objc_msgSend(v32, "isDataSeparatedPersona") & 1) == 0)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.3();
    v29 = 0;
LABEL_39:

    goto LABEL_11;
  }
  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_BRCOperation completedWithResult:error:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_131_cold_1();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "foldersNeedingTransmogrifyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v14;
          v43 = 2112;
          v44 = v16;
          _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Scheduling directory transmogrify at startup for %@%@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "itemTransmogrifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "asDirectory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scheduleBouncedDirectoryRename:", v19);

        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }

  _BRRestorePersona();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_3;
  _block_invoke___personalPersona_3 = v0;

}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_139(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3))
        goto LABEL_23;
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v5;
        _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }

    }
    if (xpc_activity_get_state(v3) == 2)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
          __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_139_cold_4();

      }
      +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[13], "acAccountID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "personaIdentifierForACAccountID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "isEqualToString:", CFSTR("__defaultPersonaID__")))
        v12 = 0;
      else
        v12 = v11;
      v13 = v12;
      v14 = v11;
      if (!v13)
      {
        if (_block_invoke_2___personaOnceToken_0 != -1)
          dispatch_once(&_block_invoke_2___personaOnceToken_0, &__block_literal_global_141);
        v14 = (id)_block_invoke_2___personalPersona_0;
      }
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentPersona");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0;
      objc_msgSend(v16, "userPersonaUniqueString");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17 == v14 || (objc_msgSend(v17, "isEqualToString:", v14) & 1) != 0)
      {
        v19 = 0;
      }
      else
      {
        if (voucher_process_can_use_arbitrary_personas())
        {
          v29 = 0;
          v20 = (void *)objc_msgSend(v16, "copyCurrentPersonaContextWithError:", &v29);
          v21 = v29;
          v22 = v30;
          v30 = v20;

          if (v21)
          {
            brc_bread_crumbs();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
              -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v21);

          }
          objc_msgSend(v16, "generateAndRestorePersonaContextWithPersonaUniqueString:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_22;
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v32 = v11;
            v33 = 2112;
            v34 = v19;
            v35 = 2112;
            v36 = v25;
            _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
          }
        }
        else
        {
          if (v13 || (objc_msgSend(v16, "isDataSeparatedPersona") & 1) != 0)
          {
            brc_bread_crumbs();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[_BRCOperation completedWithResult:error:].cold.2();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.3();
          v19 = 0;
        }

      }
LABEL_22:
      objc_msgSend(WeakRetained, "_pcsChainAllItemsWithActivity:", v3);

      _BRRestorePersona();
    }
  }
LABEL_23:

}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_140()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_2___personalPersona_0;
  _block_invoke_2___personalPersona_0 = v0;

}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_144(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  xpc_activity_t activity;
  _QWORD block[5];
  _xpc_activity_s *v7;

  activity = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_get_state(activity) == 2)
  {
    v4 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_2_145;
    block[3] = &unk_1E875D470;
    block[4] = WeakRetained;
    v7 = activity;
    dispatch_async_and_wait(v4, block);

  }
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_2_145(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "acAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifierForACAccountID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;
  v7 = v4;
  if (!v6)
  {
    if (_block_invoke_3___personaOnceToken_0 != -1)
      dispatch_once(&_block_invoke_3___personaOnceToken_0, &__block_literal_global_146);
    v7 = (id)_block_invoke_3___personalPersona_0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_msgSend(v9, "userPersonaUniqueString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v7 || (objc_msgSend(v10, "isEqualToString:", v7) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v27 = 0;
    v16 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v27);
    v17 = v27;
    v18 = v28;
    v28 = v16;

    if (v17)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v17);

    }
    objc_msgSend(v9, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v30 = v4;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v21;
        _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:

    }
  }
  else
  {
    if (!v6 && (objc_msgSend(v9, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v12 = 0;
      goto LABEL_32;
    }
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 4))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v13;
      _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't continue activity%@", buf, 0xCu);
    }

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_147;
  v25[3] = &unk_1E87649F0;
  v15 = *(void **)(a1 + 32);
  v26 = *(id *)(a1 + 40);
  objc_msgSend(v15, "_recoverAndReportStateIntegrityWithCompletion:", v25);

  _BRRestorePersona();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_3()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_3___personalPersona_0;
  _block_invoke_3___personalPersona_0 = v0;

}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_147(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    brc_bread_crumbs();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_1CBD43000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't finish activity%@", (uint8_t *)&v3, 0xCu);
    }

  }
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_151(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "finishSaltingPartiallySaltedDirectories"))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      if (xpc_activity_should_defer(v3))
      {
        if (xpc_activity_set_state(v3, 3))
          goto LABEL_24;
        brc_bread_crumbs();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v5;
          _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
        }

      }
      if (xpc_activity_get_state(v3) == 2)
      {
        if (!xpc_activity_set_state(v3, 4))
        {
          brc_bread_crumbs();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
            __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_151_cold_4();

        }
        +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[13], "acAccountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personaIdentifierForACAccountID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", CFSTR("__defaultPersonaID__")))
          v12 = 0;
        else
          v12 = v11;
        v13 = v12;
        v14 = v11;
        if (!v13)
        {
          if (_block_invoke_4___personaOnceToken != -1)
            dispatch_once(&_block_invoke_4___personaOnceToken, &__block_literal_global_153);
          v14 = (id)_block_invoke_4___personalPersona;
        }
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentPersona");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0;
        objc_msgSend(v16, "userPersonaUniqueString");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 == v14 || (objc_msgSend(v17, "isEqualToString:", v14) & 1) != 0)
        {
          v19 = 0;
        }
        else
        {
          if (voucher_process_can_use_arbitrary_personas())
          {
            v29 = 0;
            v20 = (void *)objc_msgSend(v16, "copyCurrentPersonaContextWithError:", &v29);
            v21 = v29;
            v22 = v30;
            v30 = v20;

            if (v21)
            {
              brc_bread_crumbs();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
                -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v21);

            }
            objc_msgSend(v16, "generateAndRestorePersonaContextWithPersonaUniqueString:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_23;
            brc_bread_crumbs();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              v32 = v11;
              v33 = 2112;
              v34 = v19;
              v35 = 2112;
              v36 = v25;
              _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
            }
          }
          else
          {
            if (v13 || (objc_msgSend(v16, "isDataSeparatedPersona") & 1) != 0)
            {
              brc_bread_crumbs();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                -[_BRCOperation completedWithResult:error:].cold.2();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
            brc_bread_crumbs();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              -[_BRCOperation completedWithResult:error:].cold.3();
            v19 = 0;
          }

        }
LABEL_23:
        objc_msgSend(WeakRetained, "_saltPartiallySaltedItemsWithActivity:", v3);

        _BRRestorePersona();
      }
    }
LABEL_24:

  }
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_152()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_4___personalPersona;
  _block_invoke_4___personalPersona = v0;

}

- (void)_fixupItemsAtStartup
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx fixing up items%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasNeverSyncedDown");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "changeState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "clientRequestID");

    v9 = objc_msgSend(v4, "currentRequestID");
    if (v8 >= v9)
    {
      v10 = v9;
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "mangledID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413058;
        v18 = v16;
        v19 = 2048;
        v20 = v8;
        v21 = 2048;
        v22 = v10;
        v23 = 2112;
        v24 = v11;
        _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Will acknowledge the last sync down again for %@ (server:%lld, client:%lld)%@", (uint8_t *)&v17, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    }
  }
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v4, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "mangledIDIsPendingMigration:", v14);

  if ((_DWORD)v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

  return 1;
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2;
        v12[3] = &unk_1E875D8C8;
        v12[4] = v10;
        objc_msgSend(v3, "performWithFlags:action:", 8, v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "nextRank");
  return 1;
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "allocateRanksWhenCaughtUp:", 1);
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        memset(v14, 0, sizeof(v14));
        __brc_create_section(0, (uint64_t)"-[BRCAccountSession _fixupItemsAtStartup]_block_invoke_3", 1996, v14);
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v20 = v14[0];
          v21 = 2112;
          v22 = v7;
          v23 = 2112;
          v24 = v8;
          _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Acknowledge the last sync down again for %@%@", buf, 0x20u);
        }

        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 608);
        objc_msgSend(v7, "changeState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didSyncDownZone:requestID:upToRank:caughtUpWithServer:", v7, objc_msgSend(v11, "clientRequestID"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0);

        __brc_leave_section(v14);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v4);
  }

  return 1;
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_157(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "state") & 2) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_159(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18[3];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _fixupItemsAtStartup]_block_invoke_2", 2021, v18);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_159_cold_1();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7++), "scheduleSyncDown");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v5);
  }

  v8 = *(void **)(a1 + 40);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_160;
  v13[3] = &unk_1E8764AB0;
  v10 = *(_QWORD *)(a1 + 56);
  v13[4] = v8;
  v13[5] = v10;
  objc_msgSend(v8, "enumerateServerZones:", v13);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_161;
  v12[3] = &unk_1E8760A50;
  v11 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "groupInBatch:", v12);
  __brc_leave_section(v18);
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "rescheduleSuspendedJobsMatching:inState:", v3, 26);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "rescheduleSuspendedJobsMatching:inState:", v3, 29);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "rescheduleSuspendedJobsMatching:inState:", v3, 16);
  if (objc_msgSend(v3, "hasFetchedRecentsAndFavorites"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "rescheduleJobsPendingRecentsAndFavoritesFetchInZone:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "rescheduleJobsPendingRecentsAndFavoritesFetchInZone:", v3);
  }
  if (objc_msgSend(v3, "isSharedZone"))
  {
    objc_msgSend(v3, "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asSharedClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllShareAcceptationSidefaults");

  }
  return 1;
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_161(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BRCItemToPathLookup *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *obj;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v56 = a2;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v59 = a1;
  objc_msgSend(*(id *)(a1 + 32), "bouncedItemsEnumerator");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v76 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D17A6BE8]();
        v9 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v7);
        -[BRCItemToPathLookup byPath](v9, "byPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCItemToPathLookup byFileSystemID](v9, "byFileSystemID");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v10 == (void *)v11;
        else
          v13 = 0;
        if (v13)
        {
          brc_bread_crumbs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v83 = v7;
            v84 = 2112;
            v85 = v16;
            _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] fixing up %@ by marking bounce finished%@", buf, 0x16u);
          }

          objc_msgSend(v7, "markBounceFinished");
        }
        else
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v83 = v7;
            v84 = 2112;
            v85 = v14;
            _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] fixing up %@ by marking bounce failed%@", buf, 0x16u);
          }

          objc_msgSend(v7, "markBounceFailed");
        }
        objc_msgSend(v7, "saveToDB");
        -[BRCItemToPathLookup closePaths](v9, "closePaths");

        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    }
    while (v4);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(*(id *)(v59 + 32), "stagedItemsEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v72 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        v24 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(v23, "fixupStagedItemAtStartup");
        objc_autoreleasePoolPop(v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v20);
  }

  v25 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 144), "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND item_min_supported_os_rowid IS NULL AND NOT EXISTS (SELECT 1 FROM client_sync_up AS su WHERE su.throttle_id = ci.rowid AND su.throttle_state != 0)"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_165;
  v66[3] = &unk_1E875E2C8;
  v66[4] = *(_QWORD *)(v59 + 32);
  v57 = v25;
  objc_msgSend(v25, "enumerateObjects:", v66);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v68 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
        v33 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v83 = v32;
          v84 = 2112;
          v85 = v34;
          _os_log_fault_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ is missing a sync up throttle%@", buf, 0x16u);
        }

        objc_msgSend(v32, "clientZone");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dbRowID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "markLatestSyncRequestFailedInZone:", v37);

        if (objc_msgSend(v32, "isSharedToMeChildItem"))
        {
          objc_msgSend(v32, "markLatestSyncRequestFailedInZone:", &unk_1E87D7460);
          objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 600), "scheduleSyncUpForSideCar");
          v29 = 1;
        }
        if (objc_msgSend(v32, "isSharedToMeTopLevelItem"))
        {
          objc_msgSend(v32, "parentClientZone");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "dbRowID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "markLatestSyncRequestFailedInZone:", v39);

        }
        objc_msgSend(v32, "saveToDB");
        objc_autoreleasePoolPop(v33);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  v40 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 144), "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci LEFT JOIN client_sync_up AS su ON su.throttle_id = ci.rowid AND su.zone_rowid = ci.zone_rowid LEFT JOIN client_uploads AS cu ON cu.throttle_id = ci.rowid AND cu.zone_rowid = ci.zone_rowid WHERE ci.item_localsyncupstate = 3 AND ci.item_type IN (1, 6) AND (IFNULL(cu.throttle_state, 0) = 0 OR (cu.throttle_state = 31 AND IFNULL(su.throttle_state, 0) = 0))"));
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_169;
  v61[3] = &unk_1E875E2C8;
  v61[4] = *(_QWORD *)(v59 + 32);
  v58 = v40;
  objc_msgSend(v40, "enumerateObjects:", v61);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v63 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
        v47 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v83 = v46;
          v84 = 2112;
          v85 = v48;
          _os_log_fault_impl(&dword_1CBD43000, v49, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has a corrupt upload throttle%@", buf, 0x16u);
        }

        objc_msgSend(v46, "asDocument");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "markNeedsReading");

        objc_msgSend(v46, "saveToDB");
        objc_autoreleasePoolPop(v47);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
    }
    while (v43);
  }

  if ((v29 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 600), "sideCarSyncPersistedState");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "needsSync");

    if ((v52 & 1) == 0)
    {
      v53 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 144), "numberWithSQL:", CFSTR("SELECT throttle_id FROM client_sync_up WHERE zone_rowid = %@ AND throttle_state != 0"), &unk_1E87D7460);
      if (objc_msgSend(v53, "BOOLValue"))
      {
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_161_cold_1((uint64_t)v53);

        objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 600), "scheduleSyncUpForSideCar");
      }

    }
  }

}

id __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_165(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

id __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_169(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (void)resumeIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_UTILITY%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __38__BRCAccountSession_resumeIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "maxNotifRankWasFlushed");
}

- (void)invalidateAccountStatus
{
  BRCAccountSession *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_accountIsReady = 0;
  objc_sync_exit(obj);

}

- (BRCAccountWaitOperation)accountWaitOperation
{
  BRCAccountSession *v2;
  BRCAccountWaitOperation *v3;
  BRCAccountWaitOperation *accountWaitOperation;
  void *v5;
  void *v6;
  void *v7;
  BRCAccountWaitOperation *v8;
  BRCAccountWaitOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_accountIsReady)
  {
    v3 = 0;
  }
  else
  {
    accountWaitOperation = v2->_accountWaitOperation;
    if (!accountWaitOperation)
    {
      -[BRCAccountSession syncContextProvider](v2, "syncContextProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultSyncContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ckContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[BRCAccountWaitOperation initWithCKContainer:]([BRCAccountWaitOperation alloc], "initWithCKContainer:", v7);
      v9 = v2->_accountWaitOperation;
      v2->_accountWaitOperation = v8;

      objc_initWeak(&location, v2);
      -[BRCAccountSession syncClientZoneErrorThrottle](v2, "syncClientZoneErrorThrottle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setOperationFailureThrottle:](v2->_accountWaitOperation, "setOperationFailureThrottle:", v10);

      -[_BRCOperation operationFailureThrottle](v2->_accountWaitOperation, "operationFailureThrottle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession accountWaitOperation].cold.1();

      }
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __41__BRCAccountSession_accountWaitOperation__block_invoke;
      v20 = &unk_1E8762D60;
      objc_copyWeak(&v21, &location);
      -[_BRCOperation setFinishBlock:](v2->_accountWaitOperation, "setFinishBlock:", &v17);
      objc_msgSend(v7, "privateCloudDatabase", v17, v18, v19, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "operationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addOperation:", v2->_accountWaitOperation);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      accountWaitOperation = v2->_accountWaitOperation;
    }
    v3 = accountWaitOperation;
  }
  objc_sync_exit(v2);

  return v3;
}

void __41__BRCAccountSession_accountWaitOperation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = WeakRetained;
    objc_sync_enter(v2);
    *((_BYTE *)v2 + 521) = 1;
    v3 = (void *)*((_QWORD *)v2 + 66);
    *((_QWORD *)v2 + 66) = 0;

    objc_sync_exit(v2);
    WeakRetained = v4;
  }

}

- (id)fetchAccountWaitOperationWithAccountReady:(BOOL *)a3
{
  BRCAccountSession *v4;
  BRCAccountWaitOperation *v5;

  v4 = self;
  objc_sync_enter(v4);
  if (a3)
    *a3 = v4->_accountIsReady;
  if (v4->_accountIsReady)
    v5 = 0;
  else
    v5 = v4->_accountWaitOperation;
  objc_sync_exit(v4);

  return v5;
}

- (void)captureSessionOpenFailedInfoWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_accountSessionOpenErrorInfoPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("Error");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAccountSessionOpenFailed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (!v7)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_fault_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode session open failed info %@: %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v4, v7, 0);

  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v13;
      _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession captureSessionOpenFailedInfoWithError:].cold.1((uint64_t)v4);
  }

}

- (void)captureDBCorruptionInfoWithDescription:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "br_isCloudDocsErrorCode:", 99) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_corruptedDBInfoPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = CFSTR("Description");
    v25[1] = CFSTR("Error");
    v26[0] = v5;
    v8 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorCorruptedDB");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)

    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (!v10)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v20 = v9;
        v21 = 2112;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        _os_log_fault_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode corruption info %@: %@%@", buf, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "createFileAtPath:contents:attributes:", v7, v10, 0);

    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v20 = v7;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v16;
        _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSession captureSessionOpenFailedInfoWithError:].cold.1((uint64_t)v7);
    }

  }
}

- (void)close
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx cancelling _defaultScheduler...%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __26__BRCAccountSession_close__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10[3];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession close]_block_invoke", 2443, v10);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v12 = v10[0];
    v13 = 2048;
    v14 = a2;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling fs-events monitor of type: %lu%@", buf, 0x20u);
  }

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  __brc_leave_section(v10);
  return 1;
}

uint64_t __26__BRCAccountSession_close__block_invoke_181(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

uint64_t __26__BRCAccountSession_close__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v6;
  NSObject *v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasRootForSyncedFolderType:", a2) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __26__BRCAccountSession_close__block_invoke_2_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "rootForSyncedFolderType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "close");

  return 1;
}

uint64_t __26__BRCAccountSession_close__block_invoke_183(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPostFlushHook:", 0);
  return 1;
}

- (void)closeAndResetLocalStateWithDescription:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCPQLConnection *clientDB;
  BRCAccountHandler *v11;
  void *v12;
  NSObject *v13;
  NSObject *resetQueue;
  OS_dispatch_queue *v15;
  BRCAccountHandler *accountHandler;
  uint64_t v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  BRCAccountSession *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSession closeAndResetLocalStateWithDescription:error:]", 2647, v17);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v19 = v17[0];
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Resetting local state%@", buf, 0x20u);
  }

  clientDB = self->_clientDB;
  v11 = self->_accountHandler;
  if (!self->_resumed)
  {
    resetQueue = self->_resetQueue;
    if (resetQueue)
    {
      dispatch_resume(resetQueue);
      v15 = self->_resetQueue;
    }
    else
    {
      v15 = 0;
    }
    self->_resetQueue = 0;

    if (!clientDB)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (clientDB)
  {
LABEL_12:
    -[BRCAccountSession close](self, "close");
    goto LABEL_13;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession closeAndResetLocalStateWithDescription:error:].cold.1();

LABEL_13:
  -[BRCAccountSession stopDBWatcher](self, "stopDBWatcher");
  -[BRCAccountSession captureDBCorruptionInfoWithDescription:error:](self, "captureDBCorruptionInfoWithDescription:error:", v6, v7);
  BRCRecursiveRemove(self->_cacheDirPath);
  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  if (!clientDB)
    -[BRCAccountSession close](self, "close");
  self->_isCancelled = 0;
  accountHandler = self->_accountHandler;
  self->_accountHandler = v11;

  __brc_leave_section(v17);
}

- (void)_validatePersona
{
  void *v3;
  NSString *personaIdentifier;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  personaIdentifier = self->_personaIdentifier;
  if (personaIdentifier && !-[NSString isEqualToString:](personaIdentifier, "isEqualToString:", v9))
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not removing account data on an account with the wrong persona %@ expecting %@"), v9, self->_personaIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2(v5, (uint64_t)v6, v7);

    brc_append_system_info_to_message();
    v8 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSession _validatePersona]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 2684, v8);
  }

}

- (BOOL)_recursivelyPrepareFolderForLogOutAtURL:(id)a3 pruneEmptyFolders:(BOOL)a4 pruneEmptyTopLevelFolder:(BOOL)a5 maxDepth:(unint64_t)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  BRCFileUnlinker *fileUnlinker;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  NSObject *v42;
  BRCFileUnlinker *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  NSObject *v48;
  int v49;
  id v50;
  int v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  int v64;
  id v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  BOOL v76;
  NSObject *v77;
  BRCFileUnlinker *v78;
  void *v79;
  void *v81;
  _BOOL4 v82;
  NSObject *v83;
  void *v84;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  int v89;
  BRCFileUnlinker *v90;
  unsigned int v91;
  BRCAccountSession *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BOOL4 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id obj;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  _BYTE v116[128];
  _QWORD v117[6];

  v7 = a5;
  v96 = a4;
  v117[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (a6)
  {
    if (v9)
    {
      v82 = v7;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "maxRelativePathDepth");

      v14 = *MEMORY[0x1E0C99A18];
      v86 = *MEMORY[0x1E0C999D0];
      v117[0] = *MEMORY[0x1E0C999D0];
      v117[1] = v14;
      v97 = v14;
      v15 = *MEMORY[0x1E0C99A28];
      v95 = *MEMORY[0x1E0C99A00];
      v117[2] = *MEMORY[0x1E0C99A00];
      v117[3] = v15;
      v98 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v11;
      v84 = v10;
      -[NSObject enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, v16, 1, &__block_literal_global_189_0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v18, "uploadMaxFileSize");
      v81 = v18;
      v93 = objc_msgSend(v18, "uploadMaxPkgFileSize");
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      obj = v17;
      v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
      if (!v102)
      {
        v99 = 0;
        goto LABEL_71;
      }
      v99 = 0;
      v91 = 2 * v13;
      v101 = *(_QWORD *)v109;
      v85 = a6 - 1;
      v92 = self;
      while (1)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v109 != v101)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v19);
          v21 = (void *)MEMORY[0x1D17A6BE8]();
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "excludedFilenamesWorthPreserving");
          v23 = objc_claimAutoreleasedReturnValue();

          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "excludedExtensionsWorthPreserving");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          brc_bread_crumbs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v113 = v20;
            v114 = 2112;
            v115 = v26;
            _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerate URL [%@]%@", buf, 0x16u);
          }

          v103 = (void *)v23;
          if (_CFURLIsItemPromiseAtURL())
          {
            brc_bread_crumbs();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v113 = v30;
              v114 = 2112;
              v115 = v28;
              v31 = v29;
              v32 = "[DEBUG] unlinking %@%@";
              goto LABEL_16;
            }
            goto LABEL_17;
          }
          if (objc_msgSend(v20, "br_isExternalDocumentReference"))
          {
            brc_bread_crumbs();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v113 = v30;
              v114 = 2112;
              v115 = v28;
              v31 = v29;
              v32 = "[DEBUG] unlinking br security bookmark %@%@";
LABEL_16:
              _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 0x16u);

            }
LABEL_17:

            fileUnlinker = self->_fileUnlinker;
            objc_msgSend(v20, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](fileUnlinker, "renameAndUnlinkInBackgroundItemAtPath:", v34);

            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            goto LABEL_18;
          }
          v107 = 0;
          v39 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v107, v98, 0);
          v40 = v107;
          v38 = v40;
          if (v39 && objc_msgSend(v40, "BOOLValue"))
          {
            brc_bread_crumbs();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "path");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v113 = v74;
              v114 = 2112;
              v115 = v41;
              _os_log_debug_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] unlinking symlink %@%@", buf, 0x16u);

            }
            v43 = self->_fileUnlinker;
            objc_msgSend(v20, "path");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v43, "renameAndUnlinkInBackgroundItemAtPath:", v44);

            v35 = 0;
            v36 = 0;
            v37 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v20, "path");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "br_isExcludedButPreservedAtLogOutWithFilenames:extensions:", v23, v25);

          if (v46)
          {
            brc_bread_crumbs();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "path");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v113 = v73;
              v114 = 2112;
              v115 = v47;
              _os_log_debug_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping preserved item %@%@", buf, 0x16u);

            }
            v35 = 0;
            v36 = 0;
LABEL_29:

            v37 = 0;
            goto LABEL_62;
          }
          v106 = 0;
          v49 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v106, v97, 0);
          v50 = v106;
          v35 = v50;
          if (v49 && (objc_msgSend(v50, "BOOLValue") & 1) != 0)
          {
            v36 = 0;
          }
          else
          {
            v105 = 0;
            v51 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v105, v95, 0);
            v52 = v105;
            v36 = v52;
            if (!v51 || !objc_msgSend(v52, "BOOLValue"))
              goto LABEL_41;
          }
          objc_msgSend(v20, "path");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v36, "BOOLValue");
          if (objc_msgSend(v36, "BOOLValue"))
            v55 = v93;
          else
            v55 = v94;
          v56 = objc_msgSend(v53, "br_isDocumentTooLargeForUpload:maxUploadDocumentSize:", v54, v55);

          if (v56)
          {
            brc_bread_crumbs();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "path");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v113 = v87;
              v114 = 2112;
              v115 = v47;
              _os_log_debug_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping item too large to upload %@%@", buf, 0x16u);

            }
            goto LABEL_29;
          }
LABEL_41:
          if ((objc_msgSend(v35, "BOOLValue") & 1) != 0 || (objc_msgSend(v36, "BOOLValue") & 1) != 0)
          {
            v37 = 0;
LABEL_44:
            if (v96)
            {
              objc_msgSend(v20, "path");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "br_isExcludedWithMaximumDepth:", v91);

              if (v58)
              {
                brc_bread_crumbs();
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v20, "path");
                  v88 = v59;
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v113 = v61;
                  v114 = 2112;
                  v115 = v88;
                  v62 = v60;
                  v63 = "[DEBUG] unlinking excluded item %@%@";
                  goto LABEL_59;
                }
                goto LABEL_60;
              }
              objc_msgSend(v20, "lastPathComponent");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend(v66, "isEqualToString:", CFSTR(".localized"));

              if (v67)
              {
                brc_bread_crumbs();
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v20, "path");
                  v88 = v59;
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v113 = v61;
                  v114 = 2112;
                  v115 = v88;
                  v62 = v60;
                  v63 = "[DEBUG] unlinking .localized file %@%@";
                  goto LABEL_59;
                }
                goto LABEL_60;
              }
              objc_msgSend(v20, "lastPathComponent");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "br_pathExtension");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v69, "isEqualToString:", CFSTR("app"));

              if (v89)
              {
                objc_msgSend(v20, "path");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                BRCGetXattrValueForKeyOnPath(v70, CFSTR("com.apple.clouddocs.app-uploaded"));
                v71 = (void *)objc_claimAutoreleasedReturnValue();

                if (v71)
                {
                  brc_bread_crumbs();
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v20, "path");
                    v88 = v59;
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v113 = v61;
                    v114 = 2112;
                    v115 = v88;
                    v62 = v60;
                    v63 = "[DEBUG] unlinking uploaded .app file %@%@";
LABEL_59:
                    _os_log_debug_impl(&dword_1CBD43000, v62, OS_LOG_TYPE_DEBUG, v63, buf, 0x16u);

                    v59 = v88;
                  }
LABEL_60:

                  v90 = v92->_fileUnlinker;
                  objc_msgSend(v20, "path");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v90, "renameAndUnlinkInBackgroundItemAtPath:", v72);

                  self = v92;
                  goto LABEL_18;
                }
              }
              self = v92;
            }
            goto LABEL_62;
          }
          v104 = 0;
          v64 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v104, v86, 0);
          v65 = v104;
          v37 = v65;
          if (!v64 || (objc_msgSend(v65, "BOOLValue") & 1) == 0)
            goto LABEL_44;
          if (-[BRCAccountSession _recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:](self, "_recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:", v20, v96, 0, v85))
          {
            goto LABEL_18;
          }
LABEL_62:
          ++v99;
          if (BRCSetSharedSpotlightAttributeAtURL())
            BRCSetSharedSpotlightAttributeAtURL();
LABEL_18:

          objc_autoreleasePoolPop(v21);
          ++v19;
        }
        while (v102 != v19);
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
        v102 = v75;
        if (!v75)
        {
LABEL_71:

          v76 = v99 == 0;
          v10 = v84;
          if ((v96 || v82) && !v99)
          {
            v78 = self->_fileUnlinker;
            objc_msgSend(v84, "path");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v78, "renameAndUnlinkInBackgroundItemAtPath:", v79);

          }
          v77 = v83;
          goto LABEL_75;
        }
      }
    }
    brc_bread_crumbs();
    obj = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession _recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:].cold.1();
    v76 = 0;
LABEL_75:

  }
  else
  {
    v76 = 0;
  }

  return v76;
}

uint64_t __113__BRCAccountSession__recursivelyPrepareFolderForLogOutAtURL_pruneEmptyFolders_pruneEmptyTopLevelFolder_maxDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_1CBD43000, v7, (os_log_type_t)0x90u, "[ERROR] Unable to enumerate URL [%@] with Error [%@]%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (void)_unlinkContainersWithRootURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (!-[BRCAccountSession isOpen](self, "isOpen"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession _unlinkContainersWithRootURL:].cold.2();

  }
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession _unlinkContainersWithRootURL:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__BRCAccountSession__unlinkContainersWithRootURL___block_invoke;
  v11[3] = &unk_1E875E790;
  v12 = v7;
  v8 = v7;
  -[BRCAccountSession enumerateAppLibraries:](self, "enumerateAppLibraries:", v11);
  -[BRCAccountSession _unlinkContainersWithPristineContainerIDs:containersActualRoot:](self, "_unlinkContainersWithPristineContainerIDs:containersActualRoot:", v8, v4);

}

uint64_t __50__BRCAccountSession__unlinkContainersWithRootURL___block_invoke(uint64_t a1, void *a2)
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

- (void)destroyLocalData
{
  -[BRCAccountSession destroyLocalDataWithPristineContainerIDs:](self, "destroyLocalDataWithPristineContainerIDs:", 0);
}

- (void)destroyLocalDataWithPristineContainerIDs:(id)a3
{
  -[BRCAccountSession _destroyLocalDataWaitingForFilesToBeUnlinked:pristineContainerIDs:completionBlock:](self, "_destroyLocalDataWaitingForFilesToBeUnlinked:pristineContainerIDs:completionBlock:", 1, a3, 0);
}

- (void)destroyLocalDataWaitingForFilesToBeUnlinked:(BOOL)a3 completionBlock:(id)a4
{
  -[BRCAccountSession _destroyLocalDataWaitingForFilesToBeUnlinked:pristineContainerIDs:completionBlock:](self, "_destroyLocalDataWaitingForFilesToBeUnlinked:pristineContainerIDs:completionBlock:", a3, 0, a4);
}

- (void)_destroyLocalDataWaitingForFilesToBeUnlinked:(BOOL)a3 pristineContainerIDs:(id)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  BRCFileUnlinker *v16;
  NSString *cacheDirPath;
  NSString *sessionDirPath;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  BOOL v36;
  uint64_t v37[3];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  BRCAccountSession *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v6 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v8 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _destroyLocalDataWaitingForFilesToBeUnlinked:pristineContainerIDs:completionBlock:]", 2934, v37);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v39 = v37[0];
    v40 = 2112;
    v41 = self;
    v42 = 2112;
    v43 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx destroying local account data for %@%@", buf, 0x20u);
  }

  v11 = dispatch_group_create();
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create("com.apple.bird.destroy-account-data", v13);

  v15 = (void *)os_transaction_create();
  -[BRCAccountSession _validatePersona](self, "_validatePersona");
  -[BRCAccountSession _unlinkContainersWithPristineContainerIDs:containersActualRoot:](self, "_unlinkContainersWithPristineContainerIDs:containersActualRoot:", v27, 0);
  v16 = self->_fileUnlinker;
  BRCRecursiveRemove(self->_cacheDirPath);
  cacheDirPath = self->_cacheDirPath;
  self->_cacheDirPath = 0;

  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  sessionDirPath = self->_sessionDirPath;
  self->_sessionDirPath = 0;

  -[BRCAccountSession dirPathForSyncedFolderType:](self, "dirPathForSyncedFolderType:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v16, "renameAndUnlinkInBackgroundItemAtPath:", v19);
  if (v6)
    dispatch_group_enter(v11);
  v20 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke;
  v33[3] = &unk_1E87619A0;
  v21 = v15;
  v34 = v21;
  v36 = v6;
  v22 = v11;
  v35 = v22;
  -[BRCFileUnlinker forcePurgeWithCompletionBlock:](v16, "forcePurgeWithCompletionBlock:", v33);
  dispatch_group_async(v22, v14, &__block_literal_global_198);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "spotlightIndexingEnabled");

  if (v24)
  {
    dispatch_group_enter(v22);
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_199;
    v31[3] = &unk_1E875D850;
    v32 = v22;
    +[BRCRecentsEnumerator dropRecentsForSession:completionHandler:](BRCRecentsEnumerator, "dropRecentsForSession:completionHandler:", self, v31);

  }
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2;
  block[3] = &unk_1E875EAA8;
  v29 = v21;
  v30 = v8;
  v25 = v8;
  v26 = v21;
  dispatch_group_notify(v22, v14, block);

  __brc_leave_section(v37);
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  if (*(_BYTE *)(a1 + 48))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  brc_bread_crumbs();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_cold_1();

}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_197()
{
  void *v0;
  NSObject *v1;

  TCCAccessReset();
  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_197_cold_1();

}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_199(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t result;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_loadClientZonesFromDisk
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx loading app libraries%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3011, &v43);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_2();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateServerZonesEnumerator:", v34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v9;
          v49 = 2112;
          v50 = v10;
          _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v9, "setSession:", *(_QWORD *)(a1 + 32));
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v9, "mangledID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v13);

        v14 = *(void **)(a1 + 48);
        objc_msgSend(v9, "dbRowID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

        v16 = *(void **)(a1 + 56);
        objc_msgSend(v9, "dbRowID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addZoneRowID:", v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v6);
  }

  __brc_leave_section(&v43);
  v43 = 0;
  v44 = 0;
  v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3022, &v43);
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_1();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedServerZonesEnumerator:", v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v23);
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v24;
          v49 = 2112;
          v50 = v25;
          _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v24, "setSession:", *(_QWORD *)(a1 + 32));
        v27 = *(void **)(a1 + 40);
        objc_msgSend(v24, "mangledID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v28);

        v29 = *(void **)(a1 + 48);
        objc_msgSend(v24, "dbRowID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, v30);

        v31 = *(void **)(a1 + 56);
        objc_msgSend(v24, "dbRowID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addZoneRowID:", v32);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v21);
  }

  __brc_leave_section(&v43);
  return 1;
}

uint64_t __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  char v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  void *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t m;
  void *v97;
  void *v98;
  void *v99;
  _BYTE *v100;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *obj;
  uint64_t obja;
  uint64_t objb;
  id context;
  id contexta;
  id contextb;
  id contextc;
  _QWORD v115[5];
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
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint8_t buf[24];
  void *v141;
  _BYTE v142[128];
  uint8_t v143[24];
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v102 = a2;
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3040, v143);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201_cold_4();

  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateClientZonesEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v132, v142, 16);
  if (v6)
  {
    context = *(id *)v133;
    v105 = *MEMORY[0x1E0D10B70];
    obj = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(id *)v133 != context)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded client zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v8, "setSession:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v8, "setDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 600));
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v8, "dbRowID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (objc_msgSend(v14, "isPrivateZone"))
          {
            objc_msgSend(v14, "zoneName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "zoneName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if ((v17 & 1) != 0)
            {
              objc_msgSend(v8, "associateWithServerZone:offline:", v14, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
              goto LABEL_20;
            }
          }
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2112;
            v141 = v18;
            _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneNames mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v105, 77, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "dbBecameCorruptedWithDescription:error:", CFSTR("Zone names mistmatch"), v20);

        }
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v21;
          _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring client zone because it's missing a server zone%@", buf, 0xCu);
        }

        v23 = *(void **)(a1 + 48);
        objc_msgSend(v8, "dbRowID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addZoneRowID:", v24);

        v14 = 0;
LABEL_20:

        objc_autoreleasePoolPop(v9);
      }
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v142, 16);
    }
    while (v6);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3066, v143);
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201_cold_3();

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedClientZonesEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  if (v28)
  {
    obja = *(_QWORD *)v129;
    v106 = *MEMORY[0x1E0D10B70];
    v103 = v27;
    do
    {
      v29 = 0;
      contexta = (id)v28;
      do
      {
        if (*(_QWORD *)v129 != obja)
          objc_enumerationMutation(v103);
        v30 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)v29);
        v31 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v32;
          _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded shared client zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v30, "setSession:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v30, "setDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 600));
        v34 = *(void **)(a1 + 40);
        objc_msgSend(v30, "dbRowID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          if (objc_msgSend(v36, "isSharedZone"))
          {
            objc_msgSend(v36, "zoneName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "zoneName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "isEqual:", v38) & 1) != 0)
            {
              objc_msgSend(v36, "ownerName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "ownerName");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v39, "isEqual:", v40);

              if ((v41 & 1) != 0)
              {
                objc_msgSend(v30, "associateWithServerZone:offline:", v36, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
                goto LABEL_43;
              }
            }
            else
            {

            }
          }
          brc_bread_crumbs();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v36;
            *(_WORD *)&buf[22] = 2112;
            v141 = v42;
            _os_log_fault_impl(&dword_1CBD43000, v43, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneName or ownerss mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v106, 78, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "dbBecameCorruptedWithDescription:error:", CFSTR("Zone names or owners mismatch"), v44);

        }
        brc_bread_crumbs();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring shared client zone because it's missing a server zone%@", buf, 0xCu);
        }

        v47 = *(void **)(a1 + 48);
        objc_msgSend(v30, "dbRowID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addZoneRowID:", v48);

        v36 = 0;
LABEL_43:

        objc_autoreleasePoolPop(v31);
        v29 = (char *)v29 + 1;
      }
      while (contexta != v29);
      v27 = v103;
      v28 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
    }
    while (v28);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3094, buf);
  brc_bread_crumbs();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession _loadClientZonesFromDisk].cold.1();

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_appLibrariesEnumerator:", v102);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v125;
    contextb = v51;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v125 != v53)
          objc_enumerationMutation(contextb);
        v55 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
        v56 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412546;
          *(_QWORD *)&v143[4] = v55;
          *(_WORD *)&v143[12] = 2112;
          *(_QWORD *)&v143[14] = v57;
          _os_log_debug_impl(&dword_1CBD43000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded app library: %@%@", v143, 0x16u);
        }

        v59 = *(void **)(a1 + 40);
        objc_msgSend(v55, "zoneRowID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "clientZone");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "asPrivateClientZone");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend(v55, "associateWithClientZone:offline:", v63, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
          objc_msgSend(v55, "appLibraryID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v55, "wasMovedToCloudDocs"))
          {
            if ((objc_msgSend(v63, "isCloudDocsZone") & 1) != 0)
            {
LABEL_64:
              if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121)
                && objc_msgSend(v55, "containerMetadataNeedsSyncUp"))
              {
                objc_msgSend(v55, "scheduleContainerMetadataSyncUp");
              }
              v70 = *(void **)(a1 + 56);
              objc_msgSend(v55, "dbRowID");
              v65 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setObject:forKeyedSubscript:", v55, v65);
              goto LABEL_68;
            }
          }
          else
          {
            objc_msgSend(v63, "zoneName");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "isEqualToString:", v64);

            if ((v67 & 1) != 0)
              goto LABEL_64;
          }
          brc_bread_crumbs();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v143 = 138412290;
            *(_QWORD *)&v143[4] = v68;
            _os_log_fault_impl(&dword_1CBD43000, v69, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibrary.wasMovedToCloudDocs ? clientZone.isCloudDocsZone : [clientZone.zoneName isEqualToString:appLibraryID]%@", v143, 0xCu);
          }

          goto LABEL_64;
        }
        brc_bread_crumbs();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412290;
          *(_QWORD *)&v143[4] = v64;
          _os_log_debug_impl(&dword_1CBD43000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring app library because it's missing a client zone%@", v143, 0xCu);
        }
LABEL_68:

        objc_autoreleasePoolPop(v56);
      }
      v51 = contextb;
      v52 = objc_msgSend(contextb, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
    }
    while (v52);
  }

  __brc_leave_section((uint64_t *)buf);
  brc_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 200));
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3128, buf);
  brc_bread_crumbs();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201_cold_1();

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend(*(id *)(a1 + 64), "allValues");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
  if (v74)
  {
    v107 = *(_QWORD *)v121;
    v104 = v73;
    do
    {
      objb = v74;
      for (k = 0; k != objb; ++k)
      {
        if (*(_QWORD *)v121 != v107)
          objc_enumerationMutation(v104);
        v76 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
        contextc = (id)MEMORY[0x1D17A6BE8]();
        objc_msgSend(v76, "clientZone");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v77)
        {
LABEL_80:
          brc_bread_crumbs();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v143 = 138412546;
            *(_QWORD *)&v143[4] = v76;
            *(_WORD *)&v143[12] = 2112;
            *(_QWORD *)&v143[14] = v81;
            _os_log_impl(&dword_1CBD43000, v82, OS_LOG_TYPE_DEFAULT, "[WARNING] dropping %@ because it's missing its client zone or app library%@", v143, 0x16u);
          }
          goto LABEL_96;
        }
        if (objc_msgSend(v76, "isPrivateZone"))
        {
          objc_msgSend(v76, "clientZone");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "asPrivateClientZone");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "hasDefaultAppLibrary");

          if ((v80 & 1) == 0)
            goto LABEL_80;
        }
        else
        {

        }
        objc_msgSend(v76, "clientZone");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
        {
          brc_bread_crumbs();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v143 = 138412546;
            *(_QWORD *)&v143[4] = v81;
            *(_WORD *)&v143[12] = 2112;
            *(_QWORD *)&v143[14] = v83;
            _os_log_debug_impl(&dword_1CBD43000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] activating %@%@", v143, 0x16u);
          }

          objc_msgSend(v81, "resume");
        }
        v85 = *(void **)(a1 + 48);
        objc_msgSend(v76, "dbRowID");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "removeZoneRowID:", v86);

        v87 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
        objc_msgSend(v76, "dbRowID");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v76, v88);

        if (objc_msgSend(v76, "isSharedZone"))
        {
          objc_msgSend(v76, "mangledID");
          v82 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setObject:forKeyedSubscript:", v76, v82);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setObject:forKeyedSubscript:", v81, v82);
        }
        else
        {
          v89 = *(void **)(*(_QWORD *)(a1 + 32) + 376);
          objc_msgSend(v76, "zoneName");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v76, v90);

          v91 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
          objc_msgSend(v81, "zoneName");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v81, v92);

          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          objc_msgSend(v81, "asPrivateClientZone");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "appLibraries");
          v82 = objc_claimAutoreleasedReturnValue();

          v94 = -[NSObject countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
          if (v94)
          {
            v95 = *(_QWORD *)v117;
            do
            {
              for (m = 0; m != v94; ++m)
              {
                if (*(_QWORD *)v117 != v95)
                  objc_enumerationMutation(v82);
                v97 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * m);
                v98 = *(void **)(*(_QWORD *)(a1 + 32) + 344);
                objc_msgSend(v97, "dbRowID");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, v99);

              }
              v94 = -[NSObject countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
            }
            while (v94);
          }
        }
LABEL_96:

        objc_autoreleasePoolPop(contextc);
      }
      v73 = v104;
      v74 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
    }
    while (v74);
  }

  __brc_leave_section((uint64_t *)buf);
  v100 = *(_BYTE **)(a1 + 32);
  if (!v100[121])
  {
    objc_msgSend(v100, "enumerateAppLibraries:", &__block_literal_global_207);
    v100 = *(_BYTE **)(a1 + 32);
  }
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_208;
  v115[3] = &unk_1E8764B80;
  v115[4] = v100;
  objc_msgSend(v100, "_enumerateAppLibraryRowIDs:usingBlock:", v102, v115);
  brc_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 200));

  return 1;
}

uint64_t __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_206(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_206_cold_1((uint64_t)v2);

  objc_msgSend(v2, "activate");
  return 1;
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D10E88];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithAppLibraryName:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "setObject:forKeyedSubscript:", v6, v8);
}

- (void)_handleUnloadedZones:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *clientTruthWorkloop;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  BRCAccountSession *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "handleUnloadedZones");

    if ((v6 & 1) != 0)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__BRCAccountSession__handleUnloadedZones___block_invoke;
      v10[3] = &unk_1E875D470;
      v11 = v4;
      v12 = self;
      dispatch_async(clientTruthWorkloop, v10);
      v8 = v11;
    }
    else
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We found %@ unloaded zones, but handling logic is disabled by user defaults%@", buf, 0x16u);
      }

    }
  }

}

uint64_t __42__BRCAccountSession__handleUnloadedZones___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__BRCAccountSession__handleUnloadedZones___block_invoke_2;
  v3[3] = &unk_1E8761558;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIndexesUsingBlock:", v3);
}

void __42__BRCAccountSession__handleUnloadedZones___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Checking if unloaded zone %lu is being referenced by a client item%@", buf, 0x16u);
  }

  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE zone_rowid = %lu LIMIT 1"), a2);
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __42__BRCAccountSession__handleUnloadedZones___block_invoke_2_cold_1((uint64_t)v10, a2, v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D10B70], 142, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dbBecameCorruptedWithDescription:error:", CFSTR("Unloaded zone is referenced by item"), v12);
    *a3 = 1;

  }
}

- (id)_unloadClientZones
{
  BRCPQLConnection *v3;
  void *v4;
  NSObject *v5;
  BRCPQLConnection *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *serverZonesByZoneRowID;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *privateClientZonesByID;

  v3 = self->_clientDB;
  -[BRCPQLConnection serialQueue](v3, "serialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BRCPQLConnection serialQueue](v3, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

  }
  v6 = self->_serverDB;
  -[BRCPQLConnection serialQueue](v6, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BRCPQLConnection serialQueue](v6, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

  }
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  brc_mutex_lock(&self->_zonesLock.pthread);
  -[NSMutableDictionary allValues](self->_privateClientZonesByID, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSMutableDictionary allValues](self->_sharedClientZonesByMangledID, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = 0;

  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = 0;

  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = 0;

  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = 0;

  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = 0;

  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = 0;

  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = 0;

  brc_mutex_unlock(&self->_zonesLock.pthread);
  brc_mutex_unlock(&self->_zonesCreationLock.pthread);
  return v12;
}

- (void)_mutexZonesLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: BRCurrentPersonaMatchesID(self.personaIdentifier)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)sharedServerZoneRowIDsByOwnerNamePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sharedServerZonesByMangledID, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "ownerName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", v4);

        if (v13)
        {
          objc_msgSend(v11, "dbRowID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v5;
}

- (id)serverZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *privateClientZonesByID;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  if (objc_msgSend(v4, "isShared"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedClientZonesByMangledID, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    privateClientZonesByID = self->_privateClientZonesByID;
    objc_msgSend(v4, "appLibraryOrZoneName");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](privateClientZonesByID, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v7;
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)serverZoneByCKZoneID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D10E88];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithRecordZoneID:", v5);

  -[BRCAccountSession serverZoneByMangledID:](self, "serverZoneByMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)serverZoneByName:(id)a3 ownerName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0D10E88];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithZoneName:ownerName:", v8, v7);

  -[BRCAccountSession serverZoneByMangledID:](self, "serverZoneByMangledID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)serverZoneByRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3)
  {
    v4 = a3;
    -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serverZonesByZoneRowID, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v5)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession serverZoneByRowID:].cold.2();

    }
    objc_msgSend(v5, "clientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession serverZoneByRowID:].cold.1();

    }
    objc_msgSend(v5, "clientZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v5;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)clientZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isShared"))
  {
    -[BRCAccountSession sharedClientZoneByMangledID:](self, "sharedClientZoneByMangledID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountSession appLibraryByMangledID:](self, "appLibraryByMangledID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "defaultClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }

  return v5;
}

- (void)enumerateServerZones:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_serverZonesByZoneRowID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17A6BE8](v7);
        objc_msgSend(v11, "clientZone", (_QWORD)v16);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            objc_autoreleasePoolPop(v12);
            goto LABEL_12;
          }
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)enumerateAppLibraries:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_appLibrariesByRowID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1D17A6BE8](v7);
      LODWORD(v11) = v4[2](v4, v11);
      objc_autoreleasePoolPop(v12);
      if (!(_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v8 = v7;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)appLibraries
{
  void *v3;

  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_appLibrariesByRowID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (id)fallbackAppLibraryForClientZone:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D10B20]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPersona");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnterprisePersona");

    if (v12)
    {
      -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", *MEMORY[0x1E0D10DB0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "zoneName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "zoneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D10B40]);

  if (v16)
  {
    objc_msgSend(v6, "zoneName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v18;
  }
  if (!v13)
  {
    objc_msgSend(v6, "mangledID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "iworkShareableExtensions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "containsObject:", v7))
    {
      if ((objc_msgSend(v7, "containsString:", CFSTR("pages")) & 1) != 0)
      {
        v24 = (_QWORD *)MEMORY[0x1E0D10B38];
      }
      else if ((objc_msgSend(v7, "containsString:", CFSTR("key")) & 1) != 0)
      {
        v24 = (_QWORD *)MEMORY[0x1E0D10B28];
      }
      else
      {
        if (!objc_msgSend(v7, "containsString:", CFSTR("numbers")))
          goto LABEL_19;
        v24 = (_QWORD *)MEMORY[0x1E0D10B30];
      }
      -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", *v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v19 = v25;
        v20 = v19;
LABEL_20:

        goto LABEL_21;
      }
    }
LABEL_19:
    -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", *MEMORY[0x1E0D10DB0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    goto LABEL_20;
  }
  v19 = v13;
  v20 = v19;
LABEL_21:

  return v20;
}

- (id)privateServerZoneByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateServerZonesByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)enumeratePrivateServerZones:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_privateServerZonesByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1D17A6BE8](v7);
      LODWORD(v11) = v4[2](v4, v11);
      objc_autoreleasePoolPop(v12);
      if (!(_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 = v7;
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (id)cloudDocsClientZone
{
  return -[BRCAccountSession privateClientZoneByID:](self, "privateClientZoneByID:", *MEMORY[0x1E0D10DB0]);
}

- (id)privateClientZoneByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateClientZonesByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)enumerateClientZones:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_serverZonesByZoneRowID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v11, "clientZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v11;
          v25 = 2112;
          v26 = v14;
          _os_log_fault_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: missing client zone for %@%@", buf, 0x16u);
        }

      }
      v16 = v4[2](v4, v13);

      objc_autoreleasePoolPop(v12);
      if (!v16)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (id)clientZones
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableDictionary count](self->_serverZonesByZoneRowID, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_serverZonesByZoneRowID, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(v9, "clientZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (void)enumeratePrivateClientZones:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_privateClientZonesByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1D17A6BE8](v7);
      LODWORD(v11) = v4[2](v4, v11);
      objc_autoreleasePoolPop(v12);
      if (!(_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 = v7;
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (id)sharedServerZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedServerZonesByMangledID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)sharedClientZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedClientZonesByMangledID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)enumerateSharedClientZones:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_sharedClientZonesByMangledID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17A6BE8](v7);
        objc_msgSend(v11, "serverZone", (_QWORD)v18);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            objc_autoreleasePoolPop(v12);
            goto LABEL_13;
          }
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)performBlock:(id)a3 whileRemovingPrivateClientZone:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *privateClientZonesByID;
  void *v13;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v15;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (!self->_isCancelled)
  {
    -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v9);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession performBlock:whileRemovingPrivateClientZone:].cold.1(v7, (uint64_t)v10, v11);

    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    if (v6)
      v6[2](v6);
    -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
    privateClientZonesByID = self->_privateClientZonesByID;
    objc_msgSend(v7, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](privateClientZonesByID, "removeObjectForKey:", v13);

    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    objc_msgSend(v7, "dbRowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](serverZonesByZoneRowID, "removeObjectForKey:", v15);

    brc_mutex_unlock(&self->_zonesLock.pthread);
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    objc_msgSend(v7, "close");
  }

}

- (void)destroySharedClientZone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  brc_mutex *p_zonesCreationLock;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v14;
  BRCPQLConnection *clientDB;
  uint64_t v16;
  id v17;
  id v18;
  BRCPQLConnection *serverDB;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  BRCAccountSession *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  BRCAccountSession *v36;
  id v37;

  v4 = a3;
  v5 = v4;
  if (!self->_isCancelled)
  {
    if ((objc_msgSend(v4, "state") & 0x100) == 0)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession destroySharedClientZone:].cold.3();

    }
    if ((objc_msgSend(v5, "state") & 0x20000) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession destroySharedClientZone:].cold.2();

    }
    -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v7);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    objc_msgSend(v5, "serverZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession destroySharedClientZone:].cold.1((uint64_t)v9);

    p_zonesCreationLock = &self->_zonesCreationLock;
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
    -[NSMutableDictionary removeObjectForKey:](self->_sharedClientZonesByMangledID, "removeObjectForKey:", v9);
    -[NSMutableDictionary removeObjectForKey:](self->_sharedServerZonesByMangledID, "removeObjectForKey:", v9);
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    objc_msgSend(v5, "dbRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](serverZonesByZoneRowID, "removeObjectForKey:", v14);

    brc_mutex_unlock(&self->_zonesLock.pthread);
    clientDB = self->_clientDB;
    v16 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __45__BRCAccountSession_destroySharedClientZone___block_invoke;
    v34[3] = &unk_1E8761D60;
    v17 = v9;
    v35 = v17;
    v36 = self;
    v18 = v5;
    v37 = v18;
    -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 27, v34);
    serverDB = self->_serverDB;
    v27 = v16;
    v28 = 3221225472;
    v29 = __45__BRCAccountSession_destroySharedClientZone___block_invoke_223;
    v30 = &unk_1E8761D60;
    v20 = v17;
    v31 = v20;
    v32 = self;
    v21 = v8;
    v33 = v21;
    -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 11, &v27);

    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    objc_msgSend(v18, "close", v27, v28, v29, v30);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(p_zonesCreationLock) = objc_msgSend(v22, "sessionZombiesEnabled");

    if ((_DWORD)p_zonesCreationLock)
    {
      objc_msgSend(MEMORY[0x1E0D10F20], "turnObjectIntoZombie:", v21);
      objc_msgSend(MEMORY[0x1E0D10F20], "turnObjectIntoZombie:", v18);
    }

  }
}

uint64_t __45__BRCAccountSession_destroySharedClientZone___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession_destroySharedClientZone___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "_deleteClientZone:", *(_QWORD *)(a1 + 48));
}

uint64_t __45__BRCAccountSession_destroySharedClientZone___block_invoke_223(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSession_destroySharedClientZone___block_invoke_223_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "deleteServerZone:", *(_QWORD *)(a1 + 48));
}

- (id)appLibraryByRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.1();

  }
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appLibrariesByRowID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (!v5)
  {
    if (-[BRCAccountSession isCancelled](self, "isCancelled"))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find app library in the middle of closing%@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession appLibraryByRowID:].cold.1(v4, (uint64_t)v6, v7);
    }

  }
  return v5;
}

- (id)appLibraryByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_libraryRowIDsByMangledID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_appLibrariesByRowID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);

  return v6;
}

- (id)appLibraryByID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D10E88];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAppLibraryName:", v5);

  -[BRCAccountSession appLibraryByMangledID:](self, "appLibraryByMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)assertNotOnZoneMutex
{
  brc_mutex_assert_unlocked(&self->_zonesLock.pthread);
}

- (id)__getOrCreateServerZone:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  __objc2_class **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  v5 = objc_msgSend(v4, "isShared");
  objc_msgSend(v4, "appLibraryOrZoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedServerZonesByMangledID, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v7)
    {
      v8 = off_1E875BCA8;
      goto LABEL_9;
    }
LABEL_5:
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession __getOrCreateServerZone:].cold.3();
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateServerZonesByID, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (v7)
    goto LABEL_5;
  v8 = off_1E875BC48;
LABEL_9:
  v7 = (id)objc_msgSend(objc_alloc(*v8), "initWithMangledID:dbRowID:plist:session:", v4, 0, 0, self);
  if (!-[BRCAccountSession createServerZone:](self, "createServerZone:", v7))
  {
    v14 = 0;
    goto LABEL_14;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession __getOrCreateServerZone:].cold.2((uint64_t)v7);

  objc_msgSend(v7, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession __getOrCreateServerZone:].cold.1();
LABEL_7:

  }
  v7 = v7;
  v14 = v7;
LABEL_14:

  return v14;
}

- (id)__getOrCreateClientZone:(id)a3 withServerZone:(id)a4 alreadyExists:(BOOL *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v25;
  NSObject *v26;

  v8 = a3;
  v9 = a4;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  v10 = objc_msgSend(v8, "isShared");
  objc_msgSend(v8, "appLibraryOrZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = 0;
  -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedClientZonesByMangledID, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      v13 = BRCSharedClientZone;
LABEL_12:
      v16 = [v13 alloc];
      objc_msgSend(v9, "dbRowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v16, "initWithMangledID:dbRowID:plist:session:initialCreation:", v8, v17, 0, self, 1);

      if (!-[BRCAccountSession _createClientZone:](self, "_createClientZone:", v12))
      {

        v12 = 0;
      }
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSession __getOrCreateClientZone:withServerZone:alreadyExists:].cold.2((uint64_t)v12);

      if (v12)
      {
        objc_msgSend(v12, "setDelegate:", self->_containerScheduler);
        objc_msgSend(v12, "associateWithServerZone:", v9);
        objc_msgSend(v12, "dbRowID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "br_isEqualToNumber:", v21);

        if ((v22 & 1) == 0)
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[BRCAccountSession __getOrCreateClientZone:withServerZone:alreadyExists:].cold.1();

        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_privateClientZonesByID, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      v13 = BRCPrivateClientZone;
      goto LABEL_12;
    }
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession __getOrCreateClientZone:withServerZone:alreadyExists:].cold.3();

  if (a5)
    *a5 = 1;
LABEL_18:
  v23 = v12;

  return v23;
}

- (id)__getOrCreateAppLibrary:(id)a3 rowID:(id)a4 createOnDisk:(BOOL)a5 alreadyExists:(BOOL *)a6 withClientZone:(id)a7 createCZMMoved:(BOOL)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BRCAppLibrary *v21;
  void *v22;
  BRCPQLConnection *clientDB;
  id v24;
  BOOL *v25;
  BOOL v26;
  void *v27;
  BRCAppLibrary *v28;
  void *v29;
  NSObject *v30;
  BRCAppLibrary *v31;
  void *v32;
  BRCAppLibrary *v33;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  BRCAppLibrary *v39;
  uint64_t v40;
  __int16 v41;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  if (!v15)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(BRCDatabaseManager) createServerZone:].cold.2();

  }
  v41 = 0;
  v40 = 0;
  if (v11
    && !-[BRCAccountSession createAppLibraryOnDisk:createdRoot:createdDocuments:rootFileID:](self, "createAppLibraryOnDisk:createdRoot:createdDocuments:rootFileID:", v14, (char *)&v41 + 1, &v41, &v40))
  {
    v28 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v14, "appLibraryOrZoneName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v21 = [BRCAppLibrary alloc];
    objc_msgSend(v16, "dbRowID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    clientDB = self->_clientDB;
    if (v40)
    {
      v39 = v21;
      v24 = v16;
      v25 = a6;
      v26 = HIBYTE(v41) != 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = 1;
      BYTE2(v37) = a8;
      BYTE1(v37) = v26;
      a6 = v25;
      v16 = v24;
      LOBYTE(v37) = 1;
      v28 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v39, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v14, v15, v22, clientDB, 0, self, v37, v27, 0, v38);

    }
    else
    {
      LODWORD(v38) = 1;
      BYTE2(v37) = a8;
      LOBYTE(v37) = 1;
      BYTE1(v37) = HIBYTE(v41) != 0;
      v28 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v21, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v14, v15, v22, clientDB, 0, self, v37, 0, 0, v38);
    }

    if (-[BRCAccountSession _createPrivateAppLibrary:](self, "_createPrivateAppLibrary:", v28))
    {
      -[BRCAppLibrary associateWithClientZone:](v28, "associateWithClientZone:", v16);
      -[BRCAppLibrary setDelegate:](v28, "setDelegate:", self->_containerScheduler);
      objc_msgSend(v16, "serverZone");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:](self, "__registerServerZone:clientZone:appLibrary:isShared:", v32, v16, v28, 0);

      if (a6)
        *a6 = 0;
      v31 = v28;
      goto LABEL_24;
    }
LABEL_25:
    v33 = 0;
    goto LABEL_26;
  }
  if (HIBYTE(v41))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession __getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:].cold.2((uint64_t)v16);

    objc_msgSend(v16, "scheduleResetServerAndClientTruthsForReason:", CFSTR("no-root"));
  }
  else if ((_BYTE)v41)
  {
    -[BRCFSReader scanContainerDocumentsIfNeeded:](self->_fsReader, "scanContainerDocumentsIfNeeded:", v18);
  }
  brc_bread_crumbs();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession __getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:].cold.1();

  if (a6)
    *a6 = 1;
  v31 = v18;
LABEL_24:
  v28 = v31;
  v33 = v31;
LABEL_26:

  return v33;
}

- (void)__registerServerZone:(id)a3 clientZone:(id)a4 appLibrary:(id)a5 isShared:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *sharedServerZonesByMangledID;
  id v21;
  void *v22;
  NSMutableDictionary *privateServerZonesByID;
  void *v24;
  NSMutableDictionary *privateClientZonesByID;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v27;
  NSMutableDictionary *appLibrariesByRowID;
  void *v29;
  void *v30;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSObject *v32;
  void *v33;
  NSObject *v34;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((v12 == 0) != v6)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:].cold.4();

  }
  objc_msgSend(v10, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13 || v6)
  {

    if (!v14)
      goto LABEL_5;
LABEL_9:
    -[BRCAccountSession _mutexZonesLock](self, "_mutexZonesLock");
    if (v10 && v11)
    {
      if (v6)
      {
        objc_msgSend(v10, "mangledID");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:].cold.2();
          goto LABEL_19;
        }
        v19 = (void *)v18;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedClientZonesByMangledID, "setObject:forKeyedSubscript:", v11, v18);
        sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
        v21 = v10;
      }
      else
      {
        objc_msgSend(v10, "zoneName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:].cold.3();
          goto LABEL_19;
        }
        privateServerZonesByID = self->_privateServerZonesByID;
        objc_msgSend(v10, "zoneName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](privateServerZonesByID, "setObject:forKeyedSubscript:", v10, v24);

        privateClientZonesByID = self->_privateClientZonesByID;
        objc_msgSend(v10, "zoneName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        sharedServerZonesByMangledID = privateClientZonesByID;
        v21 = v11;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](sharedServerZonesByMangledID, "setObject:forKeyedSubscript:", v21, v19);

      serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
      objc_msgSend(v10, "dbRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](serverZonesByZoneRowID, "setObject:forKeyedSubscript:", v10, v27);

    }
    if (!v12)
    {
LABEL_20:
      brc_mutex_unlock(&self->_zonesLock.pthread);
      goto LABEL_21;
    }
    appLibrariesByRowID = self->_appLibrariesByRowID;
    objc_msgSend(v12, "dbRowID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](appLibrariesByRowID, "setObject:forKeyedSubscript:", v12, v29);

    objc_msgSend(v12, "dbRowID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
    objc_msgSend(v12, "mangledID");
    v32 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](libraryRowIDsByMangledID, "setObject:forKeyedSubscript:", v30, v32);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v12, "dbRowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_9;
LABEL_5:
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:].cold.1();

LABEL_21:
}

- (BOOL)_shouldPrivateAppLibraryBeCZMMoved:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isCloudDocsMangledID") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[BRCAccountSession appLibraryByID:](self, "appLibraryByID:", *MEMORY[0x1E0D10DB0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "wasMovedToCloudDocs"))
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "shouldAutoMigrateToCloudDocs");

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 creationFlags:(unsigned int *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BRCPQLConnection *serverDB;
  uint64_t v24;
  id v25;
  BRCPQLConnection *clientDB;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  _BYTE *v43;
  unsigned int *v44;
  BOOL v45;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  _BYTE *v49;
  BOOL v50;
  uint64_t v51[3];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  __int128 v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__40;
  v68 = __Block_byref_object_dispose__40;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__40;
  v62 = __Block_byref_object_dispose__40;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__40;
  v56 = __Block_byref_object_dispose__40;
  v57 = 0;
  -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
  -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
  if (a4)
    *a4 = 0;
  v9 = -[BRCAccountSession _shouldPrivateAppLibraryBeCZMMoved:](self, "_shouldPrivateAppLibraryBeCZMMoved:", v6);
  memset(v51, 0, sizeof(v51));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:]", 3928, v51);
  brc_bread_crumbs();
  v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v51[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v71 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating app library and zones: %@ if needed%@", buf, 0x20u);
  }

  if (v6 && !objc_msgSend(v6, "isShared"))
  {
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    -[BRCAccountSession appLibraryByMangledID:](self, "appLibraryByMangledID:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v65[5];
    v65[5] = v15;

    objc_msgSend((id)v65[5], "defaultClientZone");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v59[5];
    v59[5] = v17;

    objc_msgSend((id)v59[5], "privateServerZone");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v53[5];
    v53[5] = v19;

    if (v53[5])
    {
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v33 = v53[5];
        v34 = v59[5];
        v35 = (uint64_t (*)(uint64_t, uint64_t))v65[5];
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        v71 = v35;
        LOWORD(v72) = 2112;
        *(_QWORD *)((char *)&v72 + 2) = v21;
        _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] returning early server zone: %@\nclient zone: %@\napp library: %@%@", buf, 0x2Au);
      }

      if (a4)
        *a4 = 1;
    }
    else
    {
      if (!-[BRCAccountSession isCancelled](self, "isCancelled"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v71 = __Block_byref_object_copy__40;
        *(_QWORD *)&v72 = __Block_byref_object_dispose__40;
        *((_QWORD *)&v72 + 1) = 0;
        serverDB = self->_serverDB;
        v24 = MEMORY[0x1E0C809B0];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke;
        v46[3] = &unk_1E8764BA8;
        v50 = v9;
        v48 = &v52;
        v46[4] = self;
        v25 = v6;
        v47 = v25;
        v49 = buf;
        -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 19, v46);
        if (v53[5])
        {
          clientDB = self->_clientDB;
          v38[0] = v24;
          v38[1] = 3221225472;
          v38[2] = __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_231;
          v38[3] = &unk_1E8764BD0;
          v45 = v9;
          v40 = &v58;
          v38[4] = self;
          v39 = v25;
          v41 = &v52;
          v42 = &v64;
          v43 = buf;
          v44 = a4;
          -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 23, v38);

        }
        _Block_object_dispose(buf, 8);

      }
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      if (v65[5])
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = v65[5];
          v30 = v53[5];
          v31 = (uint64_t (*)(uint64_t, uint64_t))v59[5];
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2112;
          v71 = v31;
          LOWORD(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 2) = v27;
          _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] returning app library %@\nserver zone:%@\n, client zone: %@%@", buf, 0x2Au);
        }
      }
      else
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          v36 = v53[5];
          v37 = (uint64_t (*)(uint64_t, uint64_t))v59[5];
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          v71 = v37;
          LOWORD(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 2) = v27;
          _os_log_error_impl(&dword_1CBD43000, v28, (os_log_type_t)0x90u, "[ERROR] couldn't create app library\n appID: %@\nserverZone: %@\nclientZone: %@%@", buf, 0x2Au);
        }
      }

    }
    v14 = (id)v65[5];
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:].cold.1((uint64_t)v6);

    v14 = 0;
  }
  __brc_leave_section(v51);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v14;
}

uint64_t __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v4, "privateServerZoneByID:", *MEMORY[0x1E0D10DB0]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_8;
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession serverZoneByRowID:].cold.2();

  }
  else
  {
    objc_msgSend(v4, "__getOrCreateServerZone:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asPrivateZone");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
LABEL_8:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "getOrReserveLibraryRowIDForLibrary:", *(_QWORD *)(a1 + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  return 1;
}

uint64_t __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int *v18;
  int v19;
  char v21;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v4, "__getOrCreateClientZone:withServerZone:alreadyExists:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asPrivateClientZone");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v4, "privateClientZoneByID:", *MEMORY[0x1E0D10DB0]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_231_cold_1();

    goto LABEL_7;
  }
LABEL_8:
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v13)
  {
    v21 = 0;
    objc_msgSend(*(id *)(a1 + 32), "__getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 1, &v21, v13, *(unsigned __int8 *)(a1 + 88));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v17)
    {
      v18 = *(int **)(a1 + 80);
      if (v21)
      {
        if (v18)
        {
          v19 = 1;
LABEL_15:
          *v18 = v19;
        }
      }
      else
      {
        if (v18)
        {
          v19 = 2 * (*(_BYTE *)(a1 + 88) != 0);
          goto LABEL_15;
        }
        if (!*(_BYTE *)(a1 + 88) && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "resume");
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }
        objc_msgSend(v17, "activate");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "scanContainerDocumentsIfNeeded:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      }
    }
  }

  return 1;
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3
{
  return -[BRCAccountSession _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:](self, "_getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:", a3, 0);
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 appLibraryExists:(BOOL *)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  int v12;
  int v13;

  v13 = 0;
  -[BRCAccountSession _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:](self, "_getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:", a3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v13 != 1)
  {
    -[BRCAccountSession clientDB](self, "clientDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__BRCAccountSession_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke;
    v10[3] = &unk_1E8764BF8;
    v12 = v13;
    v11 = v6;
    dispatch_sync(v8, v10);

  }
  if (a4)
    *a4 = v13 == 1;
  return v6;
}

uint64_t __86__BRCAccountSession_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke(uint64_t a1)
{
  void *v2;

  if (!*(_DWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resume");

  }
  return objc_msgSend(*(id *)(a1 + 32), "activate");
}

- (id)getOrCreateSharedZones:(id)a3
{
  return -[BRCAccountSession getOrCreateSharedZones:shareAcceptOp:](self, "getOrCreateSharedZones:shareAcceptOp:", a3, 0);
}

- (id)getOrCreateSharedZones:(id)a3 shareAcceptOp:(id)a4
{
  id v6;
  id v7;
  BRCPQLConnection *v8;
  void *v9;
  NSObject *v10;
  BRCPQLConnection *v11;
  void *v12;
  NSObject *v13;
  brc_mutex *p_zonesCreationLock;
  NSObject *clientTruthWorkloop;
  void *v16;
  BRCPQLConnection *serverDB;
  uint64_t v18;
  id v19;
  BRCPQLConnection *clientDB;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  BRCAccountSession *v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  _QWORD block[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isShared") & 1) == 0)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession getOrCreateSharedZones:shareAcceptOp:].cold.1();

  }
  v8 = self->_serverDB;
  -[BRCPQLConnection serialQueue](v8, "serialQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BRCPQLConnection serialQueue](v8, "serialQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v10);

  }
  v11 = self->_clientDB;
  -[BRCPQLConnection serialQueue](v11, "serialQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[BRCPQLConnection serialQueue](v11, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v13);

  }
  p_zonesCreationLock = &self->_zonesCreationLock;
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__40;
  v49 = __Block_byref_object_dispose__40;
  -[BRCAccountSession clientZoneByMangledID:](self, "clientZoneByMangledID:", v6);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__40;
  v43 = __Block_byref_object_dispose__40;
  objc_msgSend((id)v46[5], "serverZone");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (v40[5])
  {
    if (v7)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke;
      block[3] = &unk_1E8760960;
      v38 = &v45;
      v37 = v7;
      dispatch_async_and_wait(clientTruthWorkloop, block);

    }
    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    objc_msgSend((id)v46[5], "asSharedClientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    serverDB = self->_serverDB;
    v18 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_2;
    v33[3] = &unk_1E8763AF8;
    v35 = &v39;
    v33[4] = self;
    v19 = v6;
    v34 = v19;
    -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 19, v33);
    clientDB = self->_clientDB;
    v24 = v18;
    v25 = 3221225472;
    v26 = __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_3;
    v27 = &unk_1E8764C20;
    v31 = &v45;
    v28 = self;
    v29 = v19;
    v32 = &v39;
    v30 = v7;
    -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 19, &v24);
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    objc_msgSend((id)v46[5], "asSharedClientZone", v24, v25, v26, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v16;
}

uint64_t __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addSyncDownDependency:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "__getOrCreateServerZone:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

uint64_t __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v7;

  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "__getOrCreateClientZone:withServerZone:alreadyExists:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), &v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) && v7 == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "__registerServerZone:clientZone:appLibrary:isShared:");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "resume");
    }
  }
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addSyncDownDependency:");
  return 1;
}

- (id)getOrReserveLibraryRowIDForLibrary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  if (objc_msgSend(v4, "isShared"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession getOrReserveLibraryRowIDForLibrary:].cold.1();

    v7 = 0;
  }
  else
  {
    brc_mutex_lock(&self->_zonesLock.pthread);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_libraryRowIDsByMangledID, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v4, "appLibraryOrZoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession _reserveRowIDForLibrary:](self, "_reserveRowIDForLibrary:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138412802;
        v13 = v7;
        v14 = 2112;
        v15 = v4;
        v16 = 2112;
        v17 = v9;
        _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] reserved rowid %@ for %@%@", (uint8_t *)&v12, 0x20u);
      }

      if (v7)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_libraryRowIDsByMangledID, "setObject:forKeyedSubscript:", v7, v4);
    }
    brc_mutex_unlock(&self->_zonesLock.pthread);
  }

  return v7;
}

- (void)fetchUserRecordIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (fetchUserRecordIDWithCompletionHandler__onceToken != -1)
    dispatch_once(&fetchUserRecordIDWithCompletionHandler__onceToken, &__block_literal_global_234);
  v5 = fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E875EAA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("fetch-user-recordID", v0);

  v2 = (void *)fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue = (uint64_t)v1;

}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__40;
  v23 = __Block_byref_object_dispose__40;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__40;
  v17[4] = __Block_byref_object_dispose__40;
  v18 = 0;
  objc_sync_enter(CFSTR("currentUserRecordID"));
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentUserRecordID"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v20[5];
  v20[5] = v3;

  objc_sync_exit(CFSTR("currentUserRecordID"));
  if (!v20[5])
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1();

    v7 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "syncContextProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultSyncContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ckContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_236;
    v12[3] = &unk_1E8764C90;
    v15 = v17;
    v16 = &v19;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v2;
    v11 = v7;
    v14 = v11;
    objc_msgSend(v10, "fetchUserRecordIDWithCompletionHandler:", v12);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched user record id %@ with error %@%@", buf, 0x20u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_237;
    v14[3] = &unk_1E8764C68;
    v12 = v10;
    v18 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    v17 = *(id *)(a1 + 48);
    dispatch_async(v11, v14);

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

intptr_t __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_237(uint64_t a1)
{
  objc_sync_enter(CFSTR("currentUserRecordID"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("currentUserRecordID"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "forceBatchStart");
  objc_sync_exit(CFSTR("currentUserRecordID"));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)cachedCurrentUserRecordName
{
  void *v2;
  void *v4;
  NSObject *v5;

  -[BRCAccountSession cachedCurrentUserRecordNameIfExists](self, "cachedCurrentUserRecordNameIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession cachedCurrentUserRecordName].cold.1();

  }
  return v2;
}

- (id)cachedCurrentUserRecordNameIfExists
{
  BRCClientState *v2;
  void *v3;
  void *v4;

  v2 = self->_clientState;
  objc_sync_enter(CFSTR("currentUserRecordID"));
  -[BRCClientState objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("currentUserRecordID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("currentUserRecordID"));
  return v4;
}

- (void)_cloudDocsAppsListDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  _QWORD v13[7];
  uint64_t v14[3];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  if (!self->_isCancelled)
  {
    if (objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSession _cloudDocsAppsListDidChange:].cold.1();

    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__40;
      v21 = __Block_byref_object_dispose__40;
      v22 = 0;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__40;
      v15[4] = __Block_byref_object_dispose__40;
      v16 = 0;
      memset(v14, 0, sizeof(v14));
      __brc_create_section(0, (uint64_t)"-[BRCAccountSession _cloudDocsAppsListDidChange:]", 4237, v14);
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSession _cloudDocsAppsListDidChange:].cold.2();

      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke;
      v13[3] = &unk_1E8764D08;
      v13[4] = self;
      v13[5] = &v17;
      v13[6] = v15;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);
      objc_msgSend((id)v18[5], "invalidate");
      -[BRCAccountSession clientDB](self, "clientDB");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serialQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_6;
      block[3] = &unk_1E875D500;
      block[4] = self;
      dispatch_sync(v11, block);

      __brc_leave_section(v14);
      _Block_object_dispose(v15, 8);

      _Block_object_dispose(&v17, 8);
    }
  }

}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  _BYTE *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithAppLibraryName:", v7);
  objc_msgSend(*(id *)(a1 + 32), "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_2;
  v21[3] = &unk_1E8764CE0;
  v12 = *(_QWORD *)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 40);
  v21[4] = v12;
  v13 = v10;
  v14 = *(_QWORD *)(a1 + 48);
  v22 = v13;
  v25 = v14;
  v15 = v7;
  v23 = v15;
  v26 = &v27;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);
  v16 = *(_BYTE **)(a1 + 32);
  if (v16[561])
  {
    *a4 = 1;
  }
  else if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend(v16, "clientDB");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serialQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_5;
    block[3] = &unk_1E875D500;
    v20 = v13;
    dispatch_sync(v18, block);

  }
  _Block_object_dispose(&v27, 8);

}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  id v21;
  id v22;
  int8x16_t v23;

  v5 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    BRCBundleServiceConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 561))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "containerMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "versionNumberForBundleIdentifier:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D10F18]), "initWithXPCObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_3;
    v20 = &unk_1E8764CB8;
    v15 = *(_QWORD *)(a1 + 48);
    v21 = *(id *)(a1 + 40);
    v22 = v5;
    v23 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    objc_msgSend(v14, "extractMetadataForContainerID:bundleID:minimumBundleVersion:reply:", v15, v22, v10, &v17);
    v16 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result", v17, v18, v19, v20);

  }
}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDocumentScopePublic");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "updateMetadataWithExtractorProperties:iconPaths:bundleID:", v7, v8, *(_QWORD *)(a1 + 40));

    if (v13)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDocumentScopePublic");

  if (v11 != v15)
  {
    brc_task_tracker_create("apps-list-did-change");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "db");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serialQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_4;
    v19[3] = &unk_1E875D500;
    v20 = *(id *)(a1 + 32);
    brc_task_tracker_async_with_logs(v16, v18, v19, 0);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setBoolResult:error:", v9 == 0, v9);

}

uint64_t __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateDocumentScopePublic");
}

uint64_t __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleContainerMetadataSyncUp");
}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_7;
  v3[3] = &unk_1E8764D30;
  v3[4] = &v4;
  objc_msgSend(v2, "enumeratePrivateClientZones:", v3);
  if (*((_BYTE *)v5 + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "refreshPushRegistrationAfterAppsListChanged");
  _Block_object_dispose(&v4, 8);
}

uint64_t __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_7(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "recomputeAppSyncBlockState"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

- (void)cloudDocsAppsListDidChange:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BRPerformWithPersonaAndError();

}

void __48__BRCAccountSession_cloudDocsAppsListDidChange___block_invoke(uint64_t a1, uint64_t a2)
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
      __48__BRCAccountSession_cloudDocsAppsListDidChange___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cloudDocsAppsListDidChange:", *(_QWORD *)(a1 + 40));
  }
}

- (void)recomputeAppSyncBlockStateForPrivateClientZone:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BRCAccountSession clientDB](self, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  LODWORD(v5) = objc_msgSend(v4, "recomputeAppSyncBlockState");
  if ((_DWORD)v5)
    -[BRCContainerScheduler refreshPushRegistrationAfterAppsListChanged](self->_containerScheduler, "refreshPushRegistrationAfterAppsListChanged");
}

- (BOOL)hasOptimizeStorageEnabled
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)*MEMORY[0x1E0D10E10];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnterprisePersona");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x1E0D10E08], self->_accountDSID);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend(v3, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[BRCAccountSession setOptimizeStorageEnabled:forKey:synchronous:](self, "setOptimizeStorageEnabled:forKey:synchronous:", 1, v4, 0);
    v9 = (void *)MEMORY[0x1E0C9AAB0];
  }
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 forKey:(id)a4 synchronous:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  const char *v17;
  _QWORD block[5];
  id v19;
  uint64_t v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession setOptimizeStorageEnabled:forKey:synchronous:]", 4353, v20);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v16 = "disabling";
    *(_DWORD *)buf = 134219010;
    if (v6)
      v16 = "enabling";
    v22 = v20[0];
    v17 = "NO";
    v23 = 2080;
    v24 = v16;
    v25 = 2112;
    if (v5)
      v17 = "YES";
    v26 = v8;
    v27 = 2080;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s storage optimization for %@ synchronous %s%@", buf, 0x34u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, v8);

  objc_msgSend(v9, "synchronize");
  if (!v6)
  {
    brc_task_tracker_create("download-all-tracker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke;
    block[3] = &unk_1E875D470;
    block[4] = self;
    v15 = v13;
    v19 = v15;
    dispatch_sync(v14, block);

    brc_task_tracker_wait((uint64_t)v15);
  }
  BRPostAccountTokenChangedNotification();
  __brc_leave_section(v20);

}

void __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2;
  v2[3] = &unk_1E875E790;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateAppLibraries:", v2);

}

uint64_t __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "fetchRootItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", *(_QWORD *)(a1 + 32), 1, 0, 0, 0);

  return 1;
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 synchronous:(BOOL)a4
{
  -[BRCAccountSession setOptimizeStorageEnabled:forKey:synchronous:](self, "setOptimizeStorageEnabled:forKey:synchronous:", a3, *MEMORY[0x1E0D10E10], a4);
}

- (void)startDownloadsForGreediness
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _isGreedy%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __48__BRCAccountSession_startDownloadsForGreediness__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__BRCAccountSession_startDownloadsForGreediness__block_invoke_2;
  v5[3] = &unk_1E8764D78;
  v6 = v2;
  v3 = v2;
  objc_msgSend(v3, "enumerateFaultsAsyncWithBlock:batchSize:", v5, 200);

  return 1;
}

uint64_t __48__BRCAccountSession_startDownloadsForGreediness__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "asDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldBeGreedy"))
  {
    objc_msgSend(*(id *)(a1 + 32), "taskTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", v4, 1, 0, 0, 0);

  }
  return 1;
}

- (BOOL)isGreedy
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 isGreedy;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  float totalDiskSpace;
  float v24;
  float v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (-[BRCAccountSession hasOptimizeStorageEnabled](self, "hasOptimizeStorageEnabled"))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "shouldSessionBeGreedy") & 1) == 0)
    {
      v16 = 0;
      self->_isGreedy = 0;
      goto LABEL_32;
    }
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSession isGreedy].cold.1();

    isGreedy = self->_isGreedy;
    v7 = -[BRCFSDownloader sizeOfActiveDownloads](self->_fsDownloader, "sizeOfActiveDownloads");
    v8 = -[BRCAccountSession availableDiskSpace](self, "availableDiskSpace");
    v9 = objc_msgSend(v3, "maximumAccountSizeToBeAlwaysGreedy");
    if (v9 && (v10 = v9, -[BRCAccountSession accountSize](self, "accountSize") < v9))
    {
      if (self->_isGreedy)
        goto LABEL_28;
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 1;
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v10, 0, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412546;
        v33 = v14;
        v34 = 2112;
        v35 = v11;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] we will now download new documents automatically because the account contains less than %@%@", (uint8_t *)&v32, 0x16u);

      }
    }
    else if (self->_isGreedy)
    {
      v17 = objc_msgSend(v3, "minimumDiskSpaceRequiredToBeGreedy");
      v18 = v17;
      if (v8 >= v7 && v8 - v7 >= v17)
        goto LABEL_28;
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v8, 0, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v7, 0, 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v18, 0, 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138413058;
        v33 = v19;
        v34 = 2112;
        v35 = v20;
        v36 = 2112;
        v37 = v21;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] we will not download new documents automatically anymore because there is not enough disk space (%@ - %@) < %@%@", (uint8_t *)&v32, 0x2Au);

      }
      v12 = 0;
    }
    else
    {
      v22 = objc_msgSend(v3, "diskSpaceRequiredToReturnToGreedyState");
      totalDiskSpace = (float)self->_totalDiskSpace;
      objc_msgSend(v3, "relativeDiskSpaceRequiredToReturnToGreedyState");
      v25 = v24 * totalDiskSpace;
      if (v22 <= (unint64_t)v25)
        v26 = (unint64_t)v25;
      else
        v26 = v22;
      if (v8 <= v7 || v8 - v7 <= v26)
      {
LABEL_28:
        v30 = self->_isGreedy;
        if (!isGreedy && self->_isGreedy)
        {
          -[BRCAccountSession startDownloadsForGreediness](self, "startDownloadsForGreediness");
          v30 = self->_isGreedy;
        }
        v16 = v30;
        goto LABEL_32;
      }
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 1;
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v8, 0, 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v7, 0, 0, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v26, 0, 0, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138413058;
        v33 = v27;
        v34 = 2112;
        v35 = v28;
        v36 = 2112;
        v37 = v29;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] we will now download new documents automatically because there is enough disk space (%@ - %@) > %@%@", (uint8_t *)&v32, 0x2Au);

        v12 = 1;
      }
    }

    self->_isGreedy = v12;
    goto LABEL_28;
  }
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession isGreedy].cold.2();

  v16 = 1;
LABEL_32:

  return v16;
}

- (void)dumpXPCClientsToContext:(id)a3
{
  id v4;
  BRCAccountSession *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableSet copy](v5->_xpcClients, "copy");
  objc_sync_exit(v5);

  objc_msgSend(v4, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%ld xpc clients:"), objc_msgSend(v6, "count"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dumpToContext:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "writeLineWithFormat:", &stru_1E8769030);
}

- (void)dumpMiscOperationsToContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSHashTable allObjects](self->_miscOperations, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%ld misc operations:"), objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "descriptionWithContext:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@"), v12);

        }
        else
        {
          objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@"), v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)openForDumping
{
  BRCFairScheduler *v3;
  BRCFairScheduler *fairClientDBScheduler;
  BRCDeadlineScheduler *v5;
  BRCDeadlineScheduler *defaultScheduler;
  BRCApplyScheduler *v7;
  BRCApplyScheduler *applyScheduler;
  BRCFSReader *v9;
  BRCFSReader *fsReader;
  BRCFSWriter *v11;
  BRCFSWriter *fsWriter;
  BRCFSUploader *v13;
  BRCFSUploader *fsUploader;
  BRCFSDownloader *v15;
  BRCFSDownloader *fsDownloader;
  BRCStageRegistry *v17;
  BRCStageRegistry *stageRegistry;
  NSMutableDictionary *v19;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSMutableDictionary *v21;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *v23;
  NSMutableDictionary *serverZonesByZoneRowID;
  NSMutableDictionary *v25;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *v27;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *v29;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *v31;
  NSMutableDictionary *privateClientZonesByID;
  NSObject *v33;
  OS_dispatch_queue *v34;
  OS_dispatch_queue *resetQueue;
  NSObject *v36;

  v3 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", self->_clientTruthWorkloop, CFSTR("client-db"));
  fairClientDBScheduler = self->_fairClientDBScheduler;
  self->_fairClientDBScheduler = v3;

  v5 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.main-scheduler"), self->_fairClientDBScheduler);
  defaultScheduler = self->_defaultScheduler;
  self->_defaultScheduler = v5;

  v7 = -[BRCApplyScheduler initWithAccountSession:]([BRCApplyScheduler alloc], "initWithAccountSession:", self);
  applyScheduler = self->_applyScheduler;
  self->_applyScheduler = v7;

  v9 = -[BRCFSReader initWithAccountSession:]([BRCFSReader alloc], "initWithAccountSession:", self);
  fsReader = self->_fsReader;
  self->_fsReader = v9;

  v11 = -[BRCFSWriter initWithAccountSession:]([BRCFSWriter alloc], "initWithAccountSession:", self);
  fsWriter = self->_fsWriter;
  self->_fsWriter = v11;

  v13 = -[BRCFSUploader initWithAccountSession:]([BRCFSUploader alloc], "initWithAccountSession:", self);
  fsUploader = self->_fsUploader;
  self->_fsUploader = v13;

  v15 = -[BRCFSDownloader initWithAccountSession:]([BRCFSDownloader alloc], "initWithAccountSession:", self);
  fsDownloader = self->_fsDownloader;
  self->_fsDownloader = v15;

  v17 = -[BRCStageRegistry initWithAccountSession:]([BRCStageRegistry alloc], "initWithAccountSession:", self);
  stageRegistry = self->_stageRegistry;
  self->_stageRegistry = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v21;

  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v27;

  v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v29;

  v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v31;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v36 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v36, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (OS_dispatch_queue *)dispatch_queue_create("reset-queue", v33);

  resetQueue = self->_resetQueue;
  self->_resetQueue = v34;

}

- (void)openForSendingTelemetry
{
  BRCAnalyticsReporter *v3;
  BRCAnalyticsReporter *analyticsReporter;
  BRCSyncContextProvider *v5;
  BRCSyncContextProvider *syncContextProvider;

  -[BRCAccountSession openForDumping](self, "openForDumping");
  v3 = -[BRCAnalyticsReporter initWithSession:]([BRCAnalyticsReporter alloc], "initWithSession:", self);
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = v3;

  v5 = -[BRCSyncContextProvider initWithAccountSession:]([BRCSyncContextProvider alloc], "initWithAccountSession:", self);
  syncContextProvider = self->_syncContextProvider;
  self->_syncContextProvider = v5;

  -[BRCAccountSession _setupThrottles](self, "_setupThrottles");
}

- (NSString)sessionDirPath
{
  NSString *sessionDirPath;
  void *v5;
  NSObject *v6;

  sessionDirPath = self->_sessionDirPath;
  if (!sessionDirPath)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession sessionDirPath].cold.1();

    sessionDirPath = self->_sessionDirPath;
  }
  return sessionDirPath;
}

- (NSString)cacheDirPath
{
  NSString *cacheDirPath;
  void *v5;
  NSObject *v6;

  cacheDirPath = self->_cacheDirPath;
  if (!cacheDirPath)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession cacheDirPath].cold.1();

    cacheDirPath = self->_cacheDirPath;
  }
  return cacheDirPath;
}

- (BRCApplyScheduler)applyScheduler
{
  BRCApplyScheduler *applyScheduler;
  void *v5;
  NSObject *v6;

  applyScheduler = self->_applyScheduler;
  if (!applyScheduler)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession applyScheduler].cold.1();

    applyScheduler = self->_applyScheduler;
  }
  return applyScheduler;
}

- (BRCContainerScheduler)containerScheduler
{
  BRCContainerScheduler *containerScheduler;
  void *v5;
  NSObject *v6;

  containerScheduler = self->_containerScheduler;
  if (!containerScheduler)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession containerScheduler].cold.1();

    containerScheduler = self->_containerScheduler;
  }
  return containerScheduler;
}

- (BRCTimerScheduler)autoResumeSyncTimerScheduler
{
  BRCTimerScheduler *autoResumeSyncTimerScheduler;
  void *v5;
  NSObject *v6;

  autoResumeSyncTimerScheduler = self->_autoResumeSyncTimerScheduler;
  if (!autoResumeSyncTimerScheduler)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession autoResumeSyncTimerScheduler].cold.1();

    autoResumeSyncTimerScheduler = self->_autoResumeSyncTimerScheduler;
  }
  return autoResumeSyncTimerScheduler;
}

- (BRCFSReader)fsReader
{
  BRCFSReader *fsReader;
  void *v5;
  NSObject *v6;

  fsReader = self->_fsReader;
  if (!fsReader)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession fsReader].cold.1();

    fsReader = self->_fsReader;
  }
  return fsReader;
}

- (BRCFSWriter)fsWriter
{
  BRCFSWriter *fsWriter;
  void *v5;
  NSObject *v6;

  fsWriter = self->_fsWriter;
  if (!fsWriter)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession fsWriter].cold.1();

    fsWriter = self->_fsWriter;
  }
  return fsWriter;
}

- (BRCNotificationManager)notificationManager
{
  BRCNotificationManager *notificationManager;
  void *v5;
  NSObject *v6;

  notificationManager = self->_notificationManager;
  if (!notificationManager)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession notificationManager].cold.1();

    notificationManager = self->_notificationManager;
  }
  return notificationManager;
}

- (BRCStageRegistry)stageRegistry
{
  BRCStageRegistry *stageRegistry;
  void *v5;
  NSObject *v6;

  stageRegistry = self->_stageRegistry;
  if (!stageRegistry)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession stageRegistry].cold.1();

    stageRegistry = self->_stageRegistry;
  }
  return stageRegistry;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (BRCBarrier)dbLoadingBarrier
{
  return self->_dbLoadingBarrier;
}

- (void)setSessionDirPath:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDirPath, a3);
}

- (void)setCacheDirPath:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirPath, a3);
}

- (BRDSIDString)accountDSID
{
  return self->_accountDSID;
}

- (NSString)ubiquityTokenSalt
{
  return self->_ubiquityTokenSalt;
}

- (BRCDeadlineScheduler)defaultScheduler
{
  return self->_defaultScheduler;
}

- (BRCFairScheduler)fairClientDBScheduler
{
  return self->_fairClientDBScheduler;
}

- (BRCVolume)volume
{
  return self->_volume;
}

- (BRCFSUploader)fsUploader
{
  return self->_fsUploader;
}

- (BRCFSDownloader)fsDownloader
{
  return self->_fsDownloader;
}

- (BRCSyncUpScheduler)syncUpScheduler
{
  return self->_syncUpScheduler;
}

- (BRCDownloadTrackers)downloadTrackers
{
  return self->_downloadTrackers;
}

- (BRCAccountHandler)accountHandler
{
  return self->_accountHandler;
}

- (BRCUserNotification)userNotification
{
  return self->_userNotification;
}

- (BRCDiskSpaceReclaimer)diskReclaimer
{
  return self->_diskReclaimer;
}

- (BRCFileUnlinker)fileUnlinker
{
  return self->_fileUnlinker;
}

- (BRCRecentsEnumerator)recentsEnumerator
{
  return self->_recentsEnumerator;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCThrottle)appLibraryScanThrottle
{
  return self->_appLibraryScanThrottle;
}

- (BRCThrottle)appLibraryResetThrottle
{
  return self->_appLibraryResetThrottle;
}

- (BRCThrottle)sharedAppLibraryResetThrottle
{
  return self->_sharedAppLibraryResetThrottle;
}

- (BRCThrottle)appLibraryAliasRemovalThrottle
{
  return self->_appLibraryAliasRemovalThrottle;
}

- (BRCThrottle)lostItemThrottle
{
  return self->_lostItemThrottle;
}

- (BRCThrottle)operationFailureThrottle
{
  return self->_operationFailureThrottle;
}

- (BRCThrottle)syncClientZoneThrottle
{
  return self->_syncClientZoneThrottle;
}

- (BRCThrottle)syncClientZoneErrorThrottle
{
  return self->_syncClientZoneErrorThrottle;
}

- (BRCGlobalProgress)globalProgress
{
  return self->_globalProgress;
}

- (OS_dispatch_queue)resetQueue
{
  return self->_resetQueue;
}

- (OS_dispatch_queue)dbFixupQueue
{
  return self->_dbFixupQueue;
}

- (BRCItemTransmogrifier)itemTransmogrifier
{
  return self->_itemTransmogrifier;
}

- (BRCAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (BRCSyncContextProvider)syncContextProvider
{
  return self->_syncContextProvider;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (BOOL)offline
{
  return self->_offline;
}

- (NSFileProviderDomain)fpDomain
{
  return self->_fpDomain;
}

- (void)setFpDomain:(id)a3
{
  objc_storeStrong((id *)&self->_fpDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_autoResumeSyncTimerScheduler, 0);
  objc_storeStrong((id *)&self->_itemTransmogrifier, 0);
  objc_storeStrong((id *)&self->_dbFixupQueue, 0);
  objc_storeStrong((id *)&self->_resetQueue, 0);
  objc_storeStrong((id *)&self->_syncClientZoneErrorThrottle, 0);
  objc_storeStrong((id *)&self->_syncClientZoneThrottle, 0);
  objc_storeStrong((id *)&self->_operationFailureThrottle, 0);
  objc_storeStrong((id *)&self->_lostItemThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryAliasRemovalThrottle, 0);
  objc_storeStrong((id *)&self->_sharedAppLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryScanThrottle, 0);
  objc_storeStrong((id *)&self->_recentsEnumerator, 0);
  objc_storeStrong((id *)&self->_diskReclaimer, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_downloadTrackers, 0);
  objc_storeStrong((id *)&self->_syncUpScheduler, 0);
  objc_storeStrong((id *)&self->_fsDownloader, 0);
  objc_storeStrong((id *)&self->_fsUploader, 0);
  objc_storeStrong((id *)&self->_fairClientDBScheduler, 0);
  objc_storeStrong((id *)&self->_applyScheduler, 0);
  objc_storeStrong((id *)&self->_containerScheduler, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_cacheDirPath, 0);
  objc_storeStrong((id *)&self->_sessionDirPath, 0);
  objc_storeStrong((id *)&self->_dbLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_syncContextProvider, 0);
  objc_storeStrong((id *)&self->_isInCarry, 0);
  objc_storeStrong((id *)&self->_accountWaitOperation, 0);
  objc_storeStrong((id *)&self->_globalProgress, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_updateDiskSpacePacer, 0);
  objc_storeStrong((id *)&self->_reschedulePendingDiskItemsPacer, 0);
  objc_storeStrong((id *)&self->_fsEventsMonitors, 0);
  objc_storeStrong((id *)&self->_fsWriter, 0);
  objc_storeStrong((id *)&self->_fsReader, 0);
  objc_storeStrong((id *)&self->_rootsByFolderType, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fileUnlinker, 0);
  objc_storeStrong((id *)&self->_stageRegistry, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_privateClientZonesByID, 0);
  objc_storeStrong((id *)&self->_privateServerZonesByID, 0);
  objc_storeStrong((id *)&self->_sharedClientZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_sharedServerZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_serverZonesByZoneRowID, 0);
  objc_storeStrong((id *)&self->_appLibrariesByRowID, 0);
  objc_storeStrong((id *)&self->_libraryRowIDsByMangledID, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_expensiveReadOnlyDB, 0);
  objc_storeStrong((id *)&self->_readOnlyDB, 0);
  objc_storeStrong((id *)&self->_serverDB, 0);
  objc_storeStrong((id *)&self->_clientDB, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_fpDomain, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandler, 0);
  objc_storeStrong((id *)&self->_miscOperations, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong(&self->_dbProfilingHook, 0);
  objc_storeStrong((id *)&self->_readOnlyWorkloop, 0);
  objc_storeStrong((id *)&self->_serverTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_clientTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_dbCorruptionQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcherQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcher, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_defaultScheduler, 0);
}

- (id)newLocalItemFromPQLResultSet:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  __objc2_class *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  switch(objc_msgSend(v8, "intAtIndex:", 15))
  {
    case 0u:
    case 4u:
    case 9u:
      v10 = BRCDirectoryItem;
      goto LABEL_12;
    case 1u:
    case 2u:
      v10 = BRCDocumentItem;
      goto LABEL_12;
    case 3u:
      v10 = BRCAliasItem;
      goto LABEL_12;
    case 5u:
      v10 = BRCSymlinkItem;
      goto LABEL_12;
    case 6u:
    case 7u:
      v10 = BRCFinderBookmarkItem;
      goto LABEL_12;
    case 8u:
      v10 = BRCShareAcceptationDocumentFault;
      goto LABEL_12;
    case 0xAu:
      v10 = BRCShareAcceptationDirectoryFault;
LABEL_12:
      v13 = (void *)objc_msgSend([v10 alloc], "initFromPQLResultSet:session:db:error:", v8, self, v9, a5);
      break;
    default:
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(ItemFetching) newLocalItemFromPQLResultSet:db:error:].cold.1();

      v13 = 0;
      break;
  }

  return v13;
}

- (id)newServerItemFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  __objc2_class **v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "numberAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession serverZoneByRowID:](self, "serverZoneByRowID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isSharedZone");
  v10 = off_1E875BCA0;
  if (!v9)
    v10 = off_1E875BC88;
  v11 = (void *)objc_msgSend(objc_alloc(*v10), "initFromPQLResultSet:serverZone:error:", v6, v8, a4);

  return v11;
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return -[BRCAccountSession itemIDByRowID:db:](self, "itemIDByRowID:db:", a3, self->_clientDB);
}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "itemIDWithSQL:", CFSTR("SELECT item_id FROM client_items   WHERE rowid = %lld"), a3);
}

- (id)itemByRowID:(unint64_t)a3
{
  return -[BRCAccountSession itemByRowID:db:](self, "itemByRowID:db:", a3, self->_clientDB);
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__BRCAccountSession_ItemFetching__itemByRowID_db___block_invoke;
  v10[3] = &unk_1E875E310;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = (void *)objc_msgSend(v7, "fetchObject:sql:", v10, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid = %lld"), a3);

  return v8;
}

id __50__BRCAccountSession_ItemFetching__itemByRowID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)itemByFileObjectID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "type");
    v9 = objc_msgSend(v6, "rawID");
    switch(v8)
    {
      case 0:
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.4();
        goto LABEL_7;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession appLibraryByRowID:](self, "appLibraryByRowID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "fetchRootItemInDB:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 2:
        -[BRCAccountSession globalItemByDocumentID:db:](self, "globalItemByDocumentID:db:", v9, v7);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 3:
        -[BRCAccountSession globalItemByFileID:db:](self, "globalItemByFileID:db:", v9, v7);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v12 = (void *)v17;
        break;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession appLibraryByRowID:](self, "appLibraryByRowID:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "includesDataScope") & 1) == 0)
        {
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.5();

        }
        objc_msgSend(v15, "fetchDocumentsDirectoryItem:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v12 = (void *)v16;

        break;
      case 5:
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.3();
        goto LABEL_7;
      default:
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.2();

        goto LABEL_8;
    }
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.1();
LABEL_7:

LABEL_8:
    v12 = 0;
  }

  return v12;
}

- (id)itemByFileObjectID:(id)a3
{
  return -[BRCAccountSession itemByFileObjectID:db:](self, "itemByFileObjectID:db:", a3, self->_clientDB);
}

- (id)serverAliasItemForSharedItem:(id)a3
{
  return -[BRCAccountSession serverAliasItemForSharedItem:db:](self, "serverAliasItemForSharedItem:db:", a3, self->_clientDB);
}

- (id)serverAliasItemForSharedItem:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession privateClientZoneByID:](self, "privateClientZoneByID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend(v10, "serverZone"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        -[BRCAccountSession serverAliasItemForSharedItem:inZone:db:](self, "serverAliasItemForSharedItem:inZone:db:", v6, v11, v7), v12 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v12))
  {
    -[BRCAccountSession serverAliasItemForSharedItem:inZone:db:](self, "serverAliasItemForSharedItem:inZone:db:", v6, 0, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4
{
  return -[BRCAccountSession serverAliasItemForSharedItem:inZone:db:](self, "serverAliasItemForSharedItem:inZone:db:", a3, a4, self->_clientDB);
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSharedZone");

  if ((v12 & 1) == 0)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(ItemFetching) serverAliasItemForSharedItem:inZone:db:].cold.1();

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "mangledID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__BRCAccountSession_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke;
  v26[3] = &unk_1E875E2C8;
  v26[4] = self;
  if (v8)
  {
    v19 = (void *)MEMORY[0x1E0DE81D0];
    objc_msgSend(v8, "dbRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "formatInjection:", CFSTR("AND +si.zone_rowid = %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v9, "fetchObject:sql:", v26, CFSTR("SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id"), v18, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v9, "fetchObject:sql:", v26, CFSTR("SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id"), v18, v20);
  }

  return v22;
}

id __74__BRCAccountSession_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newServerItemFromPQLResultSet:error:", a2, a3);
}

- (id)localAliasForSharedItem:(id)a3 inZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCPQLConnection *clientDB;
  void *v17;
  id v18;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSharedZone");

  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(ItemFetching) serverAliasItemForSharedItem:inZone:db:].cold.1();

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  clientDB = self->_clientDB;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__BRCAccountSession_ItemFetching__localAliasForSharedItem_inZone___block_invoke;
  v22[3] = &unk_1E875E2C8;
  v22[4] = self;
  objc_msgSend(v6, "dbRowID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[BRCPQLConnection fetchObject:sql:](clientDB, "fetchObject:sql:", v22, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND +zone_rowid = %@ ORDER BY item_id"), v15, v17);
  return v18;
}

id __66__BRCAccountSession_ItemFetching__localAliasForSharedItem_inZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (id)itemByItemGlobalID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BRCZoneRootItem *v10;
  id v11;
  BRCZoneRootItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNonDesktopRoot");

  if (v9)
  {
    v10 = [BRCZoneRootItem alloc];
    objc_msgSend(v7, "itemID");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = -[BRCZoneRootItem initWithZoneRootItemID:session:](v10, "initWithZoneRootItemID:session:", v11, self);
  }
  else
  {
    objc_msgSend(v7, "zoneRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession serverZoneByRowID:](self, "serverZoneByRowID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__BRCAccountSession_ItemFetching__itemByItemGlobalID_db___block_invoke;
    v19[3] = &unk_1E875E310;
    v20 = v15;
    v21 = v6;
    v11 = v15;
    objc_msgSend(v7, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (BRCZoneRootItem *)objc_msgSend(v21, "fetchObject:sql:", v19, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v16, v17);
  }

  return v12;
}

id __57__BRCAccountSession_ItemFetching__itemByItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)itemByItemGlobalID:(id)a3
{
  return -[BRCAccountSession itemByItemGlobalID:db:](self, "itemByItemGlobalID:db:", a3, self->_clientDB);
}

- (BOOL)globalID:(id)a3 isStrictChildOfGlobalID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  BOOL v12;
  BRCPQLConnection *clientDB;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BRCItemGlobalID *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  BRCAccountSession *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxSyncPathDepth");

  if ((objc_msgSend(v6, "isEqualToItemGlobalID:", v7) & 1) != 0
    || (objc_msgSend(v6, "itemID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isNonDesktopRoot"),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 0;
  }
  else
  {
    clientDB = self->_clientDB;
    objc_msgSend(v6, "zoneRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BRCPQLConnection fetch:](clientDB, "fetch:", CFSTR("WITH RECURSIVE item_parents (item_id, zone_rowid) AS(    SELECT item_parent_id, item_parent_zone_rowid FROM client_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid FROM client_items AS li INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_id, zone_rowid FROM item_parents WHERE item_id_is_root(item_id) OR (item_id = %@ AND zone_rowid = %@) LIMIT 1"), v14, v15, v9, v16, v17);

    if ((objc_msgSend(v18, "next") & 1) != 0)
    {
      objc_msgSend(v18, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberAtIndex:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v20, v19);
      v12 = -[BRCItemGlobalID isEqualToItemGlobalID:](v21, "isEqualToItemGlobalID:", v7);

    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413314;
        v29 = self;
        v30 = 1024;
        v31 = v9;
        v32 = 2112;
        v33 = v7;
        v34 = 2112;
        v35 = v6;
        v36 = 2112;
        v37 = v22;
        _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because the hierarchy is deeper than %u under %@ when looking for %@%@", buf, 0x30u);
      }

      objc_msgSend(v6, "zoneRowID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession serverZoneByRowID:](self, "serverZoneByRowID:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "clientZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "scheduleResetServerAndClientTruthsForReason:", CFSTR("hierarchy-too-deep"));

      v12 = 0;
    }

  }
  return v12;
}

- (void)enumerateItemsWithShareIDUnderParent:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, void *, uint64_t, _BYTE *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BRCItemGlobalID *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, uint64_t, _BYTE *))a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxFolderEnumerationCount");

  LODWORD(v7) = objc_msgSend(v5, "isZoneRoot");
  v9 = (void *)MEMORY[0x1E0DE81D0];
  objc_msgSend(v5, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((_DWORD)v7)
    v14 = CFSTR("item_parent_zone_rowid = %@ AND item_parent_id = %@");
  else
    v14 = CFSTR("zone_rowid = %@ AND item_id = %@");
  objc_msgSend(v9, "formatInjection:", v14, v11, v12);
  v15 = objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v34 = v5;
  objc_msgSend(v5, "db");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v15;
  v17 = (void *)objc_msgSend(v16, "fetch:", CFSTR("WITH RECURSIVE item_children_with_shared_items (item_id, zone_rowid, shared_items_count) AS(    SELECT item_id, zone_rowid, (shared_by_me_count | shared_to_me_count) FROM item_recursive_properties      WHERE %@ AND (shared_by_me_count | shared_to_me_count) != 0  UNION ALL     SELECT ip.item_id, ip.zone_rowid, (ip.shared_by_me_count | ip.shared_to_me_count) FROM item_recursive_properties AS ip INNER JOIN item_children_with_shared_items AS p WHERE ip.item_parent_id = p.item_id AND ip.item_parent_zone_rowid = p.zone_rowid AND (ip.shared_by_me_count | ip.shared_to_me_count) != 0      LIMIT %llu) SELECT ic.item_id, ic.zone_rowid, li.item_sharing_options FROM item_children_with_shared_items AS ic INNER JOIN client_items AS li WHERE ic.shared_items_count = 1 AND li.item_id = ic.item_id AND li.zone_rowid = ic.zone_rowid AND (li.item_sharing_options & 4) != 0"), v15, v8);

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v17, "next"))
  {
    do
    {
      objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (int)objc_msgSend(v17, "intAtIndex:", 2);
      v22 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v20, v19);
      v41[0] = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v24);

    }
    while ((objc_msgSend(v17, "next") & 1) != 0);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v18;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
LABEL_8:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v28)
        objc_enumerationMutation(v25);
      if (v39)
        break;
      v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v29);
      objc_msgSend(v30, "objectAtIndex:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndex:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v31, objc_msgSend(v32, "unsignedLongValue"), &v39);

      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v27)
          goto LABEL_8;
        break;
      }
    }
  }

}

- (void)enumerateContainersWithDB:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15[3];

  v6 = a3;
  v7 = a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(ItemFetching) enumerateContainersWithDB:handler:]", 320, v15);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSession(ItemFetching) enumerateContainersWithDB:handler:].cold.1(v15, (uint64_t)v8, v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke;
  v12[3] = &unk_1E87678B8;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[BRCAccountSession enumerateAppLibraries:](self, "enumerateAppLibraries:", v12);

  __brc_leave_section(v15);
}

uint64_t __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(v3, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDocumentScopePublic")
    && (objc_msgSend(v4, "isInInitialState") & 1) == 0
    && (objc_msgSend(v3, "isCloudDocsAppLibrary") & 1) == 0)
  {
    objc_msgSend(v3, "fetchDocumentsDirectoryItem:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCNotification notificationFromItem:](BRCNotification, "notificationFromItem:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(MEMORY[0x1E0D10EB8], "containerItemForContainer:withRepresentativeItem:", v4, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke_cold_1();

      v8 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  return 1;
}

- (BOOL)createAppLibrariesIfNeededWithError:(id *)a3
{
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__59;
  v11 = __Block_byref_object_dispose__59;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke;
  v6[3] = &unk_1E8768388;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v13;
  brc_enumerate_all_folder_types((uint64_t)v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v8[5]);
  v4 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

uint64_t __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke(_QWORD *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  NSObject *v13;
  id obj;

  v4 = *(id *)(a1[4] + 104);
  if (a2 == 1)
  {
    v5 = -1;
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2();

    v5 = 1;
  }

  v8 = (void *)a1[4];
  v9 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v9 + 40);
  v10 = 1;
  v11 = objc_msgSend(v8, "applySyncPolicy:forSyncedFolderType:isInitialCreation:error:", v5, a2, 1, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v11 & 1) == 0)
  {
    if (a2 == 1)
    {
      v10 = 0;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_1();

    }
  }
  return v10;
}

- (void)enumerateFileTypesWithFilterBlock:(id)a3 enumerationBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__BRCAccountSession_LegacyAdditions__enumerateFileTypesWithFilterBlock_enumerationBlock___block_invoke;
  v9[3] = &unk_1E87683B0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  brc_enumerate_all_folder_types((uint64_t)v9);

}

uint64_t __89__BRCAccountSession_LegacyAdditions__enumerateFileTypesWithFilterBlock_enumerationBlock___block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return 1;
}

- (void)enumerateSupportedFolderTypes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__BRCAccountSession_LegacyAdditions__enumerateSupportedFolderTypes___block_invoke;
  v3[3] = &unk_1E87647E8;
  v3[4] = self;
  -[BRCAccountSession enumerateFileTypesWithFilterBlock:enumerationBlock:](self, "enumerateFileTypesWithFilterBlock:enumerationBlock:", v3, a3);
}

uint64_t __68__BRCAccountSession_LegacyAdditions__enumerateSupportedFolderTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v7;
  NSObject *v8;

  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  v5 = v4;
  if (a2 == 1)
  {

    if (objc_msgSend(*(id *)(a1 + 32), "hasRootForSyncedFolderType:", 1))
      return objc_msgSend(*(id *)(a1 + 32), "hasFSEventsMonitorForSyncedFolderType:", 1);
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2();

  }
  return 0;
}

- (void)_enumerateAccountHandlerSupportedFolderTypes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__BRCAccountSession_LegacyAdditions___enumerateAccountHandlerSupportedFolderTypes___block_invoke;
  v3[3] = &unk_1E87647E8;
  v3[4] = self;
  -[BRCAccountSession enumerateFileTypesWithFilterBlock:enumerationBlock:](self, "enumerateFileTypesWithFilterBlock:enumerationBlock:", v3, a3);
}

BOOL __83__BRCAccountSession_LegacyAdditions___enumerateAccountHandlerSupportedFolderTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  if (a2 != 1)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2();

  }
  return a2 == 1;
}

- (void)computeDocumentEvictableSizesForLowTime:(unint64_t)a3 medTime:(unint64_t)a4 highTime:(unint64_t)a5 lowSize:(unint64_t)a6 medSize:(unint64_t)a7 highSize:(unint64_t)a8 minRowID:(unint64_t)a9 minSize:(unint64_t)a10 batchSize:(unint64_t)a11 injection:(id)a12 db:(id)a13 reply:(id)a14
{
  id v19;
  id v20;
  void (**v21)(id, unint64_t, unint64_t, unint64_t, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  BRCAccountSession *v39;
  void *v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;

  v19 = a12;
  v20 = a13;
  v21 = (void (**)(id, unint64_t, unint64_t, unint64_t, _QWORD))a14;
  v37 = v19;
  v42 = v19;
  v22 = v20;
  v23 = (void *)objc_msgSend(v20, "numberWithSQL:", CFSTR("SELECT MAX(rowid) FROM client_items WHERE rowid > %lld %@ ORDER BY rowid LIMIT %lld"), a9, v37, a11);
  if (!v23)
  {
    v21[2](v21, a6, a7, a8, 0);
    goto LABEL_5;
  }
  v39 = self;
  if (-[BRCAccountSession isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, unint64_t, unint64_t, unint64_t, void *))v21)[2](v21, 0, 0, 0, v24);

LABEL_5:
    v25 = v42;
    goto LABEL_20;
  }
  v38 = v23;
  if (a3 <= a4 && !a5)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:].cold.1();

  }
  v26 = (void *)objc_msgSend(v20, "fetchWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/27491735>"), CFSTR("SELECT li.version_size,   MAX(IFNULL(da.access_time, 0), li.version_mtime)      FROM (SELECT version_size, rowid, item_type, item_localsyncupstate, item_state, version_mtime FROM client_items                   WHERE rowid > %lld                   %@                   ORDER BY rowid LIMIT %lld) AS li LEFT JOIN client_document_access AS da ON (da.item_rowid = li.rowid)     WHERE li.item_type = 1       AND li.item_localsyncupstate = 0       AND li.item_state != 1       AND li.version_size >= %lld       AND document_is_evictable(da.properties)       AND MAX(IFNULL(da.access_time, 0), li.version_mtime) <= %lld"), a9, v42, a11, a10, a5);
  v27 = v21;
  if (objc_msgSend(v26, "next"))
  {
    do
    {
      v28 = objc_msgSend(v26, "unsignedLongLongAtIndex:", 0);
      v29 = objc_msgSend(v26, "unsignedLongLongAtIndex:", 1);
      a8 += v28;
      if (v29 <= a4)
        v30 = v28;
      else
        v30 = 0;
      v31 = v29 > a3 || v29 > a4;
      a7 += v30;
      if (v31)
        v32 = 0;
      else
        v32 = v28;
      a6 += v32;
    }
    while ((objc_msgSend(v26, "next") & 1) != 0);
  }
  v33 = objc_msgSend(v38, "unsignedLongLongValue");
  objc_msgSend(v20, "serialQueue");
  v34 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __166__BRCAccountSession_LegacyAdditions__computeDocumentEvictableSizesForLowTime_medTime_highTime_lowSize_medSize_highSize_minRowID_minSize_batchSize_injection_db_reply___block_invoke;
  block[3] = &unk_1E87683D8;
  block[4] = v39;
  v47 = a3;
  v48 = a4;
  v49 = a5;
  v50 = a6;
  v51 = a7;
  v52 = a8;
  v53 = v33;
  v54 = a10;
  v55 = a11;
  v44 = v42;
  v45 = v20;
  v46 = v27;
  dispatch_async(v34, block);

  v21 = (void (**)(id, unint64_t, unint64_t, unint64_t, _QWORD))v27;
  v25 = v42;

  v23 = v38;
LABEL_20:

}

uint64_t __166__BRCAccountSession_LegacyAdditions__computeDocumentEvictableSizesForLowTime_medTime_highTime_lowSize_medSize_highSize_minRowID_minSize_batchSize_injection_db_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)computeTotalEvictableSizeWithAccessLowTimeDelta:(double)a3 medTimeDelta:(double)a4 highTimeDelta:(double)a5 db:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  void *v14;
  double v15;
  unint64_t v16;
  void *v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v12 = a7;
  v13 = a6;
  objc_msgSend(v13, "assertOnQueue");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = (unint64_t)v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = (unint64_t)v18;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSince1970");
  v22 = (unint64_t)v21;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v26, "minAutomaticallyEvictableFilesize");
  v24 = objc_msgSend(v26, "computeEvictableBatchSize");
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:](self, "computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:", v16, v19, v22, 0, 0, 0, 0, v23, v24, v25, v13, v12);

}

- (id)createFSEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  BRCFSEventsMonitor *v5;
  void *v6;
  BRCFSEventsMonitor *v7;

  v5 = [BRCFSEventsMonitor alloc];
  brc_folder_type_name(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCFSEventsMonitor initWithAccountSession:name:](v5, "initWithAccountSession:name:", self, v6);

  -[BRCFSEventsMonitor setDelegate:](v7, "setDelegate:", self->_fsReader);
  -[BRCFSEventsMonitor setDB:](v7, "setDB:", self->_clientDB);
  return v7;
}

- (id)fsEventsMonitorForAppLibraryID:(id)a3
{
  return -[BRCAccountSession fsEventsMonitorForSyncedFolderType:](self, "fsEventsMonitorForSyncedFolderType:", 1);
}

- (id)fsEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  NSMutableDictionary *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = self->_fsEventsMonitors;
  v5 = v4;
  if (a3 == 1)
  {
    if (v4)
      goto LABEL_3;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  if (!v5)
  {
LABEL_11:
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:].cold.1();

  }
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v15 = 134218498;
      v16 = a3;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v8;
      _os_log_fault_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: getting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v15, 0x20u);
    }

  }
  return v7;
}

- (BOOL)hasFSEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *fsEventsMonitors;
  void *v6;
  void *v7;
  BOOL v8;
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
  fsEventsMonitors = self->_fsEventsMonitors;
  if (!fsEventsMonitors)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) hasFSEventsMonitorForSyncedFolderType:].cold.1();

    fsEventsMonitors = self->_fsEventsMonitors;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fsEventsMonitors, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (void)setFSEventsMonitor:(id)a3 forSyncedFolderType:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  NSMutableDictionary *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_fsEventsMonitors;
  v8 = v6;
  if (a4 == 1)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

    if (v7)
    {
LABEL_3:
      if (v8)
        goto LABEL_7;
      goto LABEL_4;
    }
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:].cold.1();

  if (!v8)
  {
LABEL_4:
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v20 = 134218498;
      v21 = a4;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v9;
      _os_log_fault_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: setting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v20, 0x20u);
    }

  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) setFSEventsMonitor:forSyncedFolderType:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, v13);

}

- (void)removeFSEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v4 = self->_fsEventsMonitors;
  if (a3 != 1)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) removeFSEventsMonitorForSyncedFolderType:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v7);

}

- (id)fsEventsMonitors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_fsEventsMonitors, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_createAppLibraryRootIfNeededAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = 1;
  v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v14);
  v9 = v14;
  v10 = v14;

  if ((v8 & 1) == 0 && (objc_msgSend(v10, "br_isCocoaErrorCode:", 516) & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_1CBD43000, v12, (os_log_type_t)0x90u, "[ERROR] failed to create root:'%@': %@%@", buf, 0x20u);
    }

    if (a4)
      objc_storeStrong(a4, v9);
    v7 = 0;
  }

  return v7;
}

- (BOOL)_createAppLibraryRootsIfNeededWithError:(id *)a3
{
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__59;
  v11 = __Block_byref_object_dispose__59;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke;
  v6[3] = &unk_1E8768400;
  v6[4] = self;
  v6[5] = &v7;
  -[BRCAccountSession _enumerateAccountHandlerSupportedFolderTypes:](self, "_enumerateAccountHandlerSupportedFolderTypes:", v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v8[5]);
  v4 = v8[5] == 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "dirPathForSyncedFolderType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_createAppLibraryRootIfNeededAtPath:error:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if ((v4 & 1) == 0 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: createAppLibaryRoot failed but error is nil"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return v4;
}

- (id)dirPathForSyncedFolderType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isDataSeparatedPersona");

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentMobileDocumentsDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)syncedFolderTypeForURL:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__BRCAccountSession_LegacyAdditions__syncedFolderTypeForURL___block_invoke;
  v8[3] = &unk_1E8768428;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[BRCAccountSession enumerateSupportedFolderTypes:](self, "enumerateSupportedFolderTypes:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

BOOL __61__BRCAccountSession_LegacyAdditions__syncedFolderTypeForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "rootForSyncedFolderType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_realpath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absolutePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "br_realpath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_pathRelativeToPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;

  return v9 == 0;
}

- (id)createRootForSyncedFolderType:(unint64_t)a3
{
  void *v5;
  BRCRelativePath *v6;
  void *v8;
  NSObject *v9;

  if (-[BRCAccountSession hasRootForSyncedFolderType:](self, "hasRootForSyncedFolderType:"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) createRootForSyncedFolderType:].cold.1();

  }
  -[BRCAccountSession dirPathForSyncedFolderType:](self, "dirPathForSyncedFolderType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCRelativePath initWithRootPath:session:]([BRCRelativePath alloc], "initWithRootPath:session:", v5, self);

  return v6;
}

- (BOOL)hasRootForSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *rootsByFolderType;
  void *v6;
  void *v7;
  BOOL v8;
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
  rootsByFolderType = self->_rootsByFolderType;
  if (!rootsByFolderType)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) hasRootForSyncedFolderType:].cold.1();

    rootsByFolderType = self->_rootsByFolderType;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](rootsByFolderType, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (id)rootForSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  NSMutableDictionary *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = self->_rootsByFolderType;
  v5 = v4;
  if (a3 == 1)
  {
    if (v4)
      goto LABEL_3;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  if (!v5)
  {
LABEL_11:
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:].cold.1();

  }
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v15 = 134218498;
      v16 = a3;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v8;
      _os_log_fault_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: getting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v15, 0x20u);
    }

  }
  return v7;
}

- (void)setRoot:(id)a3 forSyncedFolderType:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  NSMutableDictionary *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_rootsByFolderType;
  v8 = v6;
  if (a4 == 1)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

    if (v7)
    {
LABEL_3:
      if (v8)
        goto LABEL_7;
      goto LABEL_4;
    }
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:].cold.1();

  if (!v8)
  {
LABEL_4:
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v20 = 134218498;
      v21 = a4;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v9;
      _os_log_fault_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: setting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v20, 0x20u);
    }

  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) setFSEventsMonitor:forSyncedFolderType:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, v13);

}

- (void)removeRootForSyncedFolderType:(unint64_t)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v4 = self->_rootsByFolderType;
  if (a3 != 1)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) removeFSEventsMonitorForSyncedFolderType:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v7);

}

- (id)roots
{
  NSMutableDictionary *rootsByFolderType;
  void *v3;
  void *v4;
  void *v5;

  rootsByFolderType = self->_rootsByFolderType;
  if (rootsByFolderType)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allValues](rootsByFolderType, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)stagedItemsEnumerator
{
  BRCPQLConnection *v3;
  id v4;
  BRCPQLConnection *v5;
  void *v6;
  _QWORD v8[5];
  BRCPQLConnection *v9;

  v3 = self->_clientDB;
  v4 = -[BRCPQLConnection fetchWithSlowStatementRadar:sql:](v3, "fetchWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/23820733>"), CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_staged_file_id BETWEEN -9223372036854775808 AND 9223372036854775807)   AND (item_staged_file_id != item_file_id OR item_file_id IS NULL)"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__BRCAccountSession_LegacyAdditions__stagedItemsEnumerator__block_invoke;
  v8[3] = &unk_1E875E310;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __59__BRCAccountSession_LegacyAdditions__stagedItemsEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)foldersNeedingTransmogrifyEnumerator
{
  BRCPQLConnection *v3;
  id v4;
  BRCPQLConnection *v5;
  void *v6;
  _QWORD v8[5];
  BRCPQLConnection *v9;

  v3 = self->_clientDB;
  v4 = -[BRCPQLConnection fetch:](v3, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_bouncedname LIKE '%%.folder'   AND item_filename NOT LIKE '%%.folder'   AND item_type = 0   AND item_state IN (0, -1)"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__BRCAccountSession_LegacyAdditions__foldersNeedingTransmogrifyEnumerator__block_invoke;
  v8[3] = &unk_1E875E310;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __74__BRCAccountSession_LegacyAdditions__foldersNeedingTransmogrifyEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)bouncedItemsEnumerator
{
  BRCPQLConnection *v3;
  id v4;
  BRCPQLConnection *v5;
  void *v6;
  _QWORD v8[5];
  BRCPQLConnection *v9;

  v3 = self->_clientDB;
  v4 = -[BRCPQLConnection fetch:](v3, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_tmpbounceno IS NOT NULL"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__BRCAccountSession_LegacyAdditions__bouncedItemsEnumerator__block_invoke;
  v8[3] = &unk_1E875E310;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __60__BRCAccountSession_LegacyAdditions__bouncedItemsEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)globalItemByFileID:(unint64_t)a3
{
  return -[BRCAccountSession globalItemByFileID:db:](self, "globalItemByFileID:db:", a3, self->_clientDB);
}

- (id)globalItemByFileID:(unint64_t)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__BRCAccountSession_LegacyAdditions__globalItemByFileID_db___block_invoke;
  v10[3] = &unk_1E875E310;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = (void *)objc_msgSend(v7, "fetchObject:sql:", v10, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items  WHERE item_file_id = %lld    AND item_state IN (0, -1)"), a3);

  return v8;
}

id __60__BRCAccountSession_LegacyAdditions__globalItemByFileID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)globalItemByDocumentID:(unsigned int)a3
{
  return -[BRCAccountSession globalItemByDocumentID:db:](self, "globalItemByDocumentID:db:", *(_QWORD *)&a3, self->_clientDB);
}

- (id)globalItemByDocumentID:(unsigned int)a3 db:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__BRCAccountSession_LegacyAdditions__globalItemByDocumentID_db___block_invoke;
  v10[3] = &unk_1E875E310;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = (void *)objc_msgSend(v7, "fetchObject:sql:", v10, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_doc_id = %u   AND +item_state IN (0, -1)   AND +item_type IN (1, 2, 8, 6, 7)"), v4);

  return v8;
}

id __64__BRCAccountSession_LegacyAdditions__globalItemByDocumentID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (BOOL)_getRootPathXattrValue:(id *)a3 forRootPath:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  unsigned __int16 v18;

  v7 = objc_retainAutorelease(a4);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v14 = BRCOpenAt(0xFFFFFFFFLL, v8, 33028, v9, v10, v11, v12, v13, v18);
  v15 = v14;
  if (v14 < 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BRCGetXattrValueForKeyOnFD(v14, v7, (void *)*MEMORY[0x1E0D10E28]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    close(v15);
    if (a3)
      *a3 = objc_retainAutorelease(v16);

  }
  return v15 >= 0;
}

- (BOOL)applySyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4 isInitialCreation:(BOOL)a5 error:(id *)a6
{
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  if (a3 == -1)
    return -[BRCAccountSession enableSyncforSyncedFolderType:isInitialCreation:error:](self, "enableSyncforSyncedFolderType:isInitialCreation:error:", a4, a5, a6);
  if (a3 != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) applySyncPolicy:forSyncedFolderType:isInitialCreation:error:].cold.2();

    if (a3 != 1)
      return 0;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[BRCAccountSession(LegacyAdditions) applySyncPolicy:forSyncedFolderType:isInitialCreation:error:].cold.1();

  return 1;
}

- (BOOL)enableSyncforSyncedFolderType:(unint64_t)a3 isInitialCreation:(BOOL)a4 error:(id *)a5
{
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27[3];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[BRCAccountHandler syncPolicyforSyncedFolderType:].cold.2();

  }
  -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v9);

  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(LegacyAdditions) enableSyncforSyncedFolderType:isInitialCreation:error:]", 584, v27);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v21 = v27[0];
    brc_folder_type_name(a3);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = CFSTR("Mobile Docs");
    *(_DWORD *)buf = 134218498;
    if (v22)
      v24 = (const __CFString *)v22;
    v29 = v21;
    v30 = 2112;
    v31 = v24;
    v32 = 2112;
    v33 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx enabling sync for %@%@", buf, 0x20u);

  }
  if (a3 == 1)
  {
    -[BRCAccountSession _loadClientZonesFromDisk](self, "_loadClientZonesFromDisk");
    objc_msgSend(MEMORY[0x1E0D10E88], "cloudDocsMangledID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BRCAccountSession getOrCreateAppLibraryAndPrivateZonesIfNecessary:](self, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v12);

    -[BRCAccountSession rootForSyncedFolderType:](self, "rootForSyncedFolderType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession fsEventsMonitorForSyncedFolderType:](self, "fsEventsMonitorForSyncedFolderType:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession volume](self, "volume");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject openWithRoot:isImmutableRoot:volume:error:](v15, "openWithRoot:isImmutableRoot:volume:error:", v14, 1, v16, a5);

    if ((v17 & 1) == 0)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
        -[BRCAccountSession(LegacyAdditions) enableSyncforSyncedFolderType:isInitialCreation:error:].cold.1();

      -[NSObject close](v15, "close");
      objc_msgSend(v14, "close");
      -[BRCAccountSession removeRootForSyncedFolderType:](self, "removeRootForSyncedFolderType:", 1);
      -[BRCAccountSession removeFSEventsMonitorForSyncedFolderType:](self, "removeFSEventsMonitorForSyncedFolderType:", 1);
    }
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountSession(LegacyAdditions) enableSyncforSyncedFolderType:isInitialCreation:error:].cold.2();
    v17 = 0;
  }

  __brc_leave_section(v27);
  return v17;
}

- (void)_recreateSymlinkIfNecessaryForDocumentsPath:(id)a3 folderName:(id)a4 destinationPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  BRCStageRegistry *stageRegistry;
  _BOOL4 v14;
  char *v15;
  int32_t v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  int *v21;
  char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  BRCStageRegistry *v28;
  BOOL v29;
  char *v30;
  NSObject *v31;
  char *v32;
  char *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  int __errnum;
  uint64_t v38;
  uint8_t buf[4];
  char *v40;
  __int16 v41;
  NSObject *v42;
  _OWORD value[2];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38 = 0;
  __errnum = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __109__BRCAccountSession_LegacyAdditions___recreateSymlinkIfNecessaryForDocumentsPath_folderName_destinationPath___block_invoke;
  v35[3] = &unk_1E875EF40;
  v11 = v9;
  v36 = v11;
  v12 = objc_msgSend(v8, "performOnOpenFileDescriptor:error:", v35, 0);

  if (v12)
  {
    stageRegistry = self->_stageRegistry;
    v34 = 0;
    v14 = -[BRCStageRegistry makeSymlinkWithTarget:inStageGatherFileID:generationID:error:](stageRegistry, "makeSymlinkWithTarget:inStageGatherFileID:generationID:error:", v10, &v38, 0, &v34);
    v15 = (char *)v34;
    if (v14)
    {
      v16 = -[BRCStageRegistry deviceID](self->_stageRegistry, "deviceID");
      v17 = BRCOpenByID(v16, v38, 2097158);
      if ((v17 & 0x80000000) == 0)
      {
        v18 = v17;
        memset(value, 0, sizeof(value));
        fgetxattr(v17, "com.apple.FinderInfo", value, 0x20uLL, 0, 0);
        BYTE8(value[0]) |= 0x40u;
        if (fsetxattr(v18, "com.apple.FinderInfo", value, 0x20uLL, 0, 0))
        {
          brc_bread_crumbs();
          v19 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = __error();
            v22 = strerror(*v21);
            *(_DWORD *)buf = 136315394;
            v40 = v22;
            v41 = 2112;
            v42 = v19;
            _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't set the hidden finderinfo bit on the staged symlink - %s%@", buf, 0x16u);
          }

          close(v18);
          goto LABEL_24;
        }
        close(v18);
        objc_msgSend(v8, "pathWithChildAtPath:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "resolveMustExist:error:", 0, &__errnum) & 1) != 0)
        {
          v28 = self->_stageRegistry;
          v33 = v15;
          v29 = -[BRCStageRegistry moveFromStage:toPath:fileName:error:](v28, "moveFromStage:toPath:fileName:error:", v38, v23, v11, &v33);
          v30 = v33;

          if (v29)
          {
            brc_bread_crumbs();
            v24 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              -[BRCAccountSession(LegacyAdditions) _recreateSymlinkIfNecessaryForDocumentsPath:folderName:destinationPath:].cold.1();
          }
          else
          {
            brc_bread_crumbs();
            v24 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v40 = v30;
              v41 = 2112;
              v42 = v24;
              _os_log_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't make the symlink live from stage - %@%@", buf, 0x16u);
            }
          }
          v15 = v30;
        }
        else
        {
          brc_bread_crumbs();
          v24 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = strerror(__errnum);
            *(_DWORD *)buf = 136315394;
            v40 = v32;
            v41 = 2112;
            v42 = v24;
            _os_log_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't resolve the dest path - %s%@", buf, 0x16u);
          }
        }

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      LODWORD(value[0]) = 138412290;
      *(_QWORD *)((char *)value + 4) = v23;
      v25 = "[WARNING] Can't open symlink in the stage%@";
      v26 = v24;
      v27 = 12;
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      LODWORD(value[0]) = 138412546;
      *(_QWORD *)((char *)value + 4) = v15;
      WORD6(value[0]) = 2112;
      *(_QWORD *)((char *)value + 14) = v23;
      v25 = "[WARNING] Can't make symlink in stage - %@%@";
      v26 = v24;
      v27 = 22;
    }
    _os_log_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)value, v27);
    goto LABEL_23;
  }
LABEL_25:

}

uint64_t __109__BRCAccountSession_LegacyAdditions___recreateSymlinkIfNecessaryForDocumentsPath_folderName_destinationPath___block_invoke(uint64_t a1, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned __int16 v11;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v9 = BRCOpenAt(a2, v3, 6, v4, v5, v6, v7, v8, v11);
  if (v9 < 0)
    return 0;
  close(v9);
  return 0xFFFFFFFFLL;
}

- (void)removeDesktopSymlink:(BOOL)a3 andDocumentsSymlink:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[BRCAccountSession cloudDocsClientZone](self, "cloudDocsClientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultAppLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "documentsPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "resolveMustExist:error:", 1, 0))
  {
    if (v5)
    {
      objc_msgSend(v7, "pathWithChildAtPath:", *MEMORY[0x1E0D10DC8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "resolveMustExist:error:", 1, 0)
        && objc_msgSend(v8, "isSymLink"))
      {
        BRCUnlinkFileID(objc_msgSend(v8, "deviceID"), objc_msgSend(v8, "fileID"));
      }

    }
    if (v4)
    {
      objc_msgSend(v7, "pathWithChildAtPath:", *MEMORY[0x1E0D10DD8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "resolveMustExist:error:", 1, 0)
        && objc_msgSend(v9, "isSymLink"))
      {
        BRCUnlinkFileID(objc_msgSend(v9, "deviceID"), objc_msgSend(v9, "fileID"));
      }

    }
  }

}

- (BOOL)shouldPathBeDesktopSymlink:(id)a3
{
  return 0;
}

- (BOOL)createAppLibraryOnDisk:(id)a3 createdRoot:(BOOL *)a4 createdDocuments:(BOOL *)a5 rootFileID:(unint64_t *)a6
{
  id v10;
  char v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  BOOL *v20;
  unint64_t *v21;
  BOOL *v22;
  char v23;
  char v24;
  int v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_msgSend(v10, "isCloudDocsMangledID") ^ 1;
  -[BRCAccountSession rootForSyncedFolderType:](self, "rootForSyncedFolderType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__BRCAccountSession_LegacyAdditions__createAppLibraryOnDisk_createdRoot_createdDocuments_rootFileID___block_invoke;
  v18[3] = &unk_1E8768450;
  v13 = v10;
  v23 = 1;
  v19 = v13;
  v20 = a4;
  v24 = v11;
  v21 = a6;
  v22 = a5;
  objc_msgSend(v12, "performOnOpenFileDescriptor:error:", v18, &v25);
  v14 = v25;
  if (v25)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v13;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] failed creating container %@ under root %@%@", buf, 0x20u);
    }

  }
  return v14 == 0;
}

uint64_t __101__BRCAccountSession_LegacyAdditions__createAppLibraryOnDisk_createdRoot_createdDocuments_rootFileID___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  stat v8;

  objc_msgSend(*(id *)(a1 + 32), "mangledIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 64) && (BRCMkContainerComponent(a2, v4, *(_BYTE **)(a1 + 40)) & 0x80000000) != 0)
    goto LABEL_10;
  if (*(_QWORD *)(a1 + 48))
  {
    memset(&v8, 0, sizeof(v8));
    if ((fstatat(a2, (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation", 0), &v8, 32) & 0x80000000) == 0)
    {
      **(_QWORD **)(a1 + 48) = v8.st_ino;
      goto LABEL_6;
    }
LABEL_10:
    v6 = *__error();
    goto LABEL_12;
  }
LABEL_6:
  if (*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", *MEMORY[0x1E0D10D98]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BRCMkContainerComponent(a2, v5, *(_BYTE **)(a1 + 56)) & 0x80000000) != 0)
    {
      v6 = *__error();

      goto LABEL_12;
    }

  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (void)enumerateSideFaultsUnderParent:(id)a3 db:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, BRCItemGlobalID *, _BYTE *);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCItemGlobalID *v18;
  char v19;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, BRCItemGlobalID *, _BYTE *))a5;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "maxFolderEnumerationCount");

  v19 = 0;
  objc_msgSend(v7, "clientZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "fetch:", CFSTR("WITH RECURSIVE item_children_with_side_faults (item_id, zone_rowid, faults_count) AS(    SELECT item_id, zone_rowid, faults_count FROM item_recursive_properties      WHERE zone_rowid = %@ AND item_id = %@ AND faults_count != 0  UNION ALL     SELECT ip.item_id, ip.zone_rowid, ip.faults_count FROM item_recursive_properties AS ip INNER JOIN item_children_with_side_faults AS p WHERE ip.item_parent_id = p.item_id AND ip.item_parent_zone_rowid = p.zone_rowid AND ip.faults_count != 0      LIMIT %llu) SELECT ic.item_id, ic.zone_rowid FROM item_children_with_side_faults AS ic WHERE ic.faults_count = 1 AND EXISTS (SELECT 1 FROM client_items AS li WHERE li.item_id = ic.item_id AND li.zone_rowid = ic.zone_rowid AND li.item_type in (2, 7, 8))"), v13, v14, v11);

  do
  {
    if (!objc_msgSend(v15, "next"))
      break;
    objc_msgSend(v15, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v17, v16);
    v9[2](v9, v18, &v19);

  }
  while (!v19);

}

- (unint64_t)availableDiskSpace
{
  return -[BRCAccountSession availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:](self, "availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:", 1, 1);
}

- (unint64_t)availableDiskSpaceUsingCache:(BOOL)a3
{
  return -[BRCAccountSession availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:](self, "availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:", a3, 1);
}

- (unint64_t)availableDiskSpaceUsingCache:(BOOL)a3 schedulingPendingDiskItemsIfNeeded:(BOOL)a4
{
  _BOOL4 v5;
  BRCAccountSession *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unint64_t availableDiskSpace;
  _QWORD v21[4];

  v5 = a3;
  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  mach_absolute_time();
  brc_monotonic_time_diff_to_interval();
  v8 = v7;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "diskSpaceCheckInterval");
  v11 = v10;

  if (v5 && v8 <= v11)
  {
    if (v6->_updateDiskSpacePacer)
      br_pacer_signal();
  }
  else
  {
    -[BRCVolume freeSize](v6->_volume, "freeSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue");
    v14 = v13;
    if (a4 && v6->_lastDiskSpaceCheckTime && v6->_availableDiskSpace < v13)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v14, 0, 0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession(LegacyAdditions) availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:].cold.1(v17, (uint64_t)v15, (uint64_t)v21, v16);
      }

      if (v6->_reschedulePendingDiskItemsPacer)
        br_pacer_signal();
    }
    v6->_availableDiskSpace = v14;
    -[BRCVolume totalSize](v6->_volume, "totalSize");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_totalDiskSpace = objc_msgSend(v18, "unsignedLongLongValue");

    if (v6->_availableDiskSpace > v6->_totalDiskSpace)
      v6->_availableDiskSpace = v6->_totalDiskSpace;
    v6->_lastDiskSpaceCheckTime = mach_absolute_time();

  }
  availableDiskSpace = v6->_availableDiskSpace;
  objc_sync_exit(v6);

  return availableDiskSpace;
}

- (void)availableDiskSpaceDidChange
{
  BRCAccountSession *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_lastDiskSpaceCheckTime = 1;
  objc_sync_exit(obj);

}

- (unint64_t)accountSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BRCAccountSession clientDB](self, "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "numberWithSQL:", CFSTR("SELECT value FROM aggregates WHERE key = 'version_size_sum'"));
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unint64_t)computeTotalLiveDocumentSizeWithDb:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "assertOnQueue");
  v4 = (void *)objc_msgSend(v3, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT SUM(li.version_size) FROM client_items as li WHERE li.item_type = 1   AND li.item_state = 0"));

  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  return v5;
}

- (id)_containerMetadataRecordsToSaveWithBatchSize:(unint64_t)a3 requestID:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  BRCAccountSession *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke;
  v16 = &unk_1E8768588;
  v17 = self;
  v18 = v7;
  v19 = a4;
  v20 = a3;
  v9 = v7;
  dispatch_sync(v8, &v13);

  if (objc_msgSend(v9, "count", v13, v14, v15, v16, v17))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

void __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2;
  v5[3] = &unk_1E8768560;
  v7 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v8 = v4;
  objc_msgSend(v2, "enumerateAppLibraries:", v5);

}

uint64_t __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = a2;
  if ((objc_msgSend(v3, "shouldSaveContainerMetadataServerside") & 1) == 0)
  {
    objc_msgSend(v3, "setContainerMetadataNeedsSyncUp:", 0);
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "containerMetadataNeedsSyncUp"))
    goto LABEL_10;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(v3, (uint64_t)v4, v5);

  objc_msgSend(v3, "setContainerMetadataSyncRequestID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C95048], "brc_containerMetadataRecordWithContainer:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  v8 = *(_QWORD *)(a1 + 48);

  if (v7 < v8)
    goto LABEL_10;
  v9 = 0;
LABEL_11:

  return v9;
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: is_parented_or_equal_to(Container, parent_id, parentId_or_Set)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we have a cycle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] recursive update of %lld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a4, a3, "[CRIT] %@%@", (uint8_t *)a3);

}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Saving client state data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sself%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_228_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Saved zone state for %@%@");
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_230_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Saved app library state for %@%@");
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx db post flush%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_240_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] Ciconia DB was likely dropped - domain removal will happen on next start%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_240_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] disk is full, restarting: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

void __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(*v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_1CBD43000, v2, v3, "[CRIT] UNREACHABLE: Failed to enable recursive triggers - %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] disk is full - will fail%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1CBD43000, a2, a3, "[ERROR] Failed opening file handle%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)registerClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createAccountSupportPathIfNeeded:protectParent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] permissions checked%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createAccountSupportPathIfNeeded:(uint64_t)a1 protectParent:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] '%@' already exists%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)openWithError:(uint64_t)a3 pushWorkloop:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v6, v4, "[CRIT] %@%@", v5);

}

- (void)openWithError:pushWorkloop:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: defaultAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)openWithError:(uint64_t)a1 pushWorkloop:.cold.4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] flocking '%@'%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)openWithError:pushWorkloop:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_isOpen%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_89_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx rescheduling pending disk throttles%@");
  OUTLINED_FUNCTION_2();
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_91_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx recomputing disk space%@");
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] Failed to set the xpc activity state to done%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Checking for items that need pcs chaining%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_98_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Failed to defer the pcs chain state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] Failed to defer the activity state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_105_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] failed to defer the activity state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Checking for items that need salting%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_115_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Failed to defer the salting state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_recoverAndReportStateIntegrityWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Starting _recoverAndReportStateIntegrity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_131_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Checking for folders that need transmogrify%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_139_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] failed to continue the pcs chain state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_151_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] failed to continue the salting state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_159_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Fixing up bounced and staged items%@");
  OUTLINED_FUNCTION_2();
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_161_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: side car forgot to schedule sync up throttle %@!%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)accountWaitOperation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _accountWaitOperation.operationFailureThrottle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)captureSessionOpenFailedInfoWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Failed to create %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __26__BRCAccountSession_close__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [self hasRootForSyncedFolderType:folderType]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)closeAndResetLocalStateWithDescription:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: hasDB%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: directoryURL is nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_unlinkContainersWithRootURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Calculating pristineContainerIDs before logout.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_unlinkContainersWithRootURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isOpen The session must be open in order to calculate pristine containers%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] done deleting local files%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_197_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] did reset TCC access%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] done deleting local account data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx loading shared server zones%@");
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx loading server zones%@");
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx registering and activating zones%@");
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx loading shared client zones%@");
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_201_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx loading client zones%@");
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_206_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] activating %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __42__BRCAccountSession__handleUnloadedZones___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a3, (uint64_t)a3, "[CRIT] UNREACHABLE: Found zoneRowID %lu which was skipped on load but is referenced by an item on DB%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)serverZoneByRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverZone.clientZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)serverZoneByRowID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enumeratePrivateServerZones:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: block%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performBlock:(NSObject *)a3 whileRemovingPrivateClientZone:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Deactivating private client zone %@%@", v5, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)destroySharedClientZone:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Destroying shared client zone %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)destroySharedClientZone:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateWantsDataUnlinked%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)destroySharedClientZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateIsResetting%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession_destroySharedClientZone___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] deleting shared zone and library for %@ from local db%@");
  OUTLINED_FUNCTION_2();
}

void __45__BRCAccountSession_destroySharedClientZone___block_invoke_223_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] deleting shared container %@ from server db%@");
  OUTLINED_FUNCTION_2();
}

- (void)appLibraryByRowID:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a3, v4, "[CRIT] UNREACHABLE: can't find app library for %lld%@", v5);
}

- (void)__getOrCreateServerZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverZone.dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateServerZone:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Created server zone: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateServerZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] server zone already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [clientZone.dbRowID br_isEqualToNumber:serverZone.dbRowID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateClientZone:(uint64_t)a1 withServerZone:alreadyExists:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Created client zone: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] client zone already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] app library already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__getOrCreateAppLibrary:(uint64_t)a1 rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:.cold.2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v1, (uint64_t)v1, "[CRIT] reset needed for %@ because we had to recreate its root%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: No db rowID on an app library or server zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: No mangledID on a server zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no zone name on a server zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: isShared == (appLibrary == nil)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(uint64_t)a1 creationFlags:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: invalid containerID: %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

void __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_231_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't find the default client zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getOrCreateSharedZones:shareAcceptOp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: mangledID.isShared%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getOrReserveLibraryRowIDForLibrary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't reserve library rowID for a shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] fetching the user record id because it wasn't set in the client state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cachedCurrentUserRecordName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: userRecordName != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_cloudDocsAppsListDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Running in sync bubble. Ignoring app list did change event%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_cloudDocsAppsListDidChange:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx CloudDocs apps list did change%@");
  OUTLINED_FUNCTION_2();
}

void __48__BRCAccountSession_cloudDocsAppsListDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Couldn't change personas during app list refresh%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isGreedy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sessionDirPath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: sessionDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cacheDirPath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: cacheDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: applyScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)containerScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: containerScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)autoResumeSyncTimerScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: autoResumeSyncTimerScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fsReader
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: fsReader was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fsWriter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: fsWriter was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)notificationManager
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: notificationManager was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stageRegistry
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: stageRegistry was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1CBD43000, v1, (os_log_type_t)0x90u, "[ERROR] failed to create container query item from %@%@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring failure to enable synced folder type%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Bad folder type %u%@");
  OUTLINED_FUNCTION_2();
}

void __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: createAppLibaryRoot failed but error is nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] preparing to sync up %@%@", v6);

}

@end
