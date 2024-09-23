@implementation _LSInProcessSettingsStore

- (unsigned)_internalQueue_selectUserElectionForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  unsigned __int8 v7;
  NSObject *v8;
  sqlite3_stmt *ppStmt;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[_LSInProcessSettingsStore database](self, "database"), "select userElection from(select identifier, userElection , 0 as legacy from Election UNION SELECT identifier, userElection, 1 as legacy from LegacyElection) where identifier = ? ORDER BY identifier, legacy limit 1", -1, &ppStmt, 0))
  {
    _LSExtensionsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v6, (uint64_t)v11);
    }

  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
  }
  if (sqlite3_step(ppStmt) == 100)
    v7 = sqlite3_column_int(ppStmt, 0);
  else
    v7 = 0;
  sqlite3_finalize(ppStmt);
  _LSExtensionsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.1();

  return v7;
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___LSInProcessSettingsStore_userElectionForExtensionKey___block_invoke;
  block[3] = &unk_1E10422F0;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_sync(v5, block);

  _LSExtensionsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_LSInProcessSettingsStore userElectionForExtensionKey:].cold.1();

  v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (sqlite3)database
{
  NSObject *v3;
  NSObject *dbCloseTimer;
  dispatch_time_t v5;

  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_database)
    -[_LSInProcessSettingsStore _internalQueue_loadDatabase](self, "_internalQueue_loadDatabase");
  dbCloseTimer = self->_dbCloseTimer;
  v5 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(dbCloseTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  return self->_database;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (_LSInProcessSettingsStore)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_LSInProcessSettingsStore;
  v2 = -[LSSettingsStore _init](&v13, sel__init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore", v3);
    v5 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v4;

    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 5));
    v7 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v6;

    objc_initWeak(&location, v2);
    v8 = *((_QWORD *)v2 + 3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33___LSInProcessSettingsStore_init__block_invoke;
    v10[3] = &unk_1E1044260;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v8, v10);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return (_LSInProcessSettingsStore *)v2;
}

- (void)_internalQueue_purgeDatabase
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_database)
  {
    _LSExtensionsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_INFO, "Jettisoning elections database", v4, 2u);
    }

    sqlite3_close(self->_database);
    self->_database = 0;
  }
}

- (void)dealloc
{
  sqlite3 *database;
  objc_super v4;

  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_LSInProcessSettingsStore;
  -[_LSInProcessSettingsStore dealloc](&v4, sel_dealloc);
}

- (void)_internalQueue_loadDatabase
{
  void *v3;
  NSObject *v4;
  id v5;
  _BYTE v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "settingsStoreFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSExtensionsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)&v6[4] = v3;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_INFO, "Loading readonly user election database from: '%@'", v6, 0xCu);
  }

  *(_QWORD *)v6 = 0;
  v5 = objc_retainAutorelease(v3);
  sqlite3_open_v2((const char *)objc_msgSend(v5, "fileSystemRepresentation"), (sqlite3 **)v6, 1, 0);
  self->_database = *(sqlite3 **)v6;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_dbCloseTimer, 0);
}

- (void)userElectionForExtensionKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_2(&dword_182882000, v0, v1, "Extension key '%@' user election: %d ");
  OUTLINED_FUNCTION_1();
}

- (void)_internalQueue_selectUserElectionForIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_2(&dword_182882000, v0, v1, "Identifier: '%@' user election: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_internalQueue_selectUserElectionForIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_5(&dword_182882000, v2, (uint64_t)v2, "Failed to execute statement: %s\n", v3);
}

@end
