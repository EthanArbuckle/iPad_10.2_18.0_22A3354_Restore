@implementation ATXAbstractVersionedDatabase

- (_PASSqliteDatabase)db
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_dbInitialized)
  {
    self->_dbInitialized = 1;
    -[ATXAbstractVersionedDatabase _startDatabase](self, "_startDatabase");
  }
  return self->_db;
}

- (ATXAbstractVersionedDatabase)initWithDefaultPath:(id)a3
{
  void *v4;
  ATXAbstractVersionedDatabase *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXAbstractVersionedDatabase initWithDbPath:](self, "initWithDbPath:", v4);

  return v5;
}

- (ATXAbstractVersionedDatabase)initWithDbPath:(id)a3
{
  id v5;
  NSObject *v6;
  ATXAbstractVersionedDatabase *v7;
  ATXAbstractVersionedDatabase *v8;
  ATXAbstractVersionedDatabase *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *queue;
  _QWORD block[4];
  ATXAbstractVersionedDatabase *v14;
  objc_super v15;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXAbstractVersionedDatabase initWithDbPath:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot call _ATXNotificationDatabase init until class c unlocked"));
    objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("Cannot call _ATXNotificationDatabase init until class c unlocked"));
  }
  v15.receiver = self;
  v15.super_class = (Class)ATXAbstractVersionedDatabase;
  v7 = -[ATXAbstractVersionedDatabase init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__ATXAbstractVersionedDatabase_initWithDbPath___block_invoke;
    block[3] = &unk_1E82DAC38;
    v9 = v7;
    v14 = v9;
    if (initWithDbPath___pasOnceToken3 != -1)
      dispatch_once(&initWithDbPath___pasOnceToken3, block);
    v10 = (OS_dispatch_queue *)(id)initWithDbPath___pasExprOnceResult;

    queue = v9->_queue;
    v9->_queue = v10;

    objc_storeStrong((id *)&v9->_path, a3);
  }

  return v8;
}

void __47__ATXAbstractVersionedDatabase_initWithDbPath___block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  objc_class *v3;
  id v4;
  dispatch_queue_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), v2);

  v6 = (void *)initWithDbPath___pasExprOnceResult;
  initWithDbPath___pasExprOnceResult = (uint64_t)v5;

  objc_autoreleasePoolPop(v0);
}

- (void)_startDatabase
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Not enough space on volume. Opening in-memory datastore.", v1, 2u);
}

- (void)_disconnectFromDb
{
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v4;

  db = self->_db;
  if (db)
  {
    -[_PASSqliteDatabase closePermanently](db, "closePermanently");
    v4 = self->_db;
    self->_db = 0;

  }
}

- (BOOL)_configureDatabase
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _PASSqliteDatabase *db;
  int v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(&unk_1E83CF998, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(&unk_1E83CF998);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        db = self->_db;
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __50__ATXAbstractVersionedDatabase__configureDatabase__block_invoke;
        v11[3] = &unk_1E82DEF28;
        v11[4] = &v12;
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, 0, v11);
        v9 = *((unsigned __int8 *)v13 + 24);
        _Block_object_dispose(&v12, 8);
        if (v9)
          return 0;
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(&unk_1E83CF998, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v3)
        continue;
      break;
    }
  }
  return 1;
}

uint64_t __50__ATXAbstractVersionedDatabase__configureDatabase__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (int64_t)latestVersion
{
  return 0;
}

- (id)createCustomSchema
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)createSchema
{
  void *v2;
  void *v3;

  -[ATXAbstractVersionedDatabase createCustomSchema](self, "createCustomSchema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("CREATE TABLE IF NOT EXISTS meta (id INTEGER PRIMARY KEY, version INT)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)currentSchemaVersion
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ATXAbstractVersionedDatabase db](self, "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ATXAbstractVersionedDatabase_currentSchemaVersion__block_invoke;
  v5[3] = &unk_1E82DCC00;
  v5[4] = &v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT version FROM meta"), 0, v5, &__block_literal_global_81);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__ATXAbstractVersionedDatabase_currentSchemaVersion__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __52__ATXAbstractVersionedDatabase_currentSchemaVersion__block_invoke_2()
{
  return *MEMORY[0x1E0D81788];
}

- (void)_initializeSchemaVersion:(int64_t)a3
{
  _PASSqliteDatabase *db;
  _QWORD v4[5];

  db = self->_db;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke;
  v4[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4[4] = a3;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO meta (id, version) VALUES (1,?)"), v4, 0, &__block_literal_global_26);
}

uint64_t __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v10;
}

- (BOOL)migrate
{
  return 1;
}

- (void)_runMigration
{
  _PASSqliteDatabase *db;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  db = self->_db;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ATXAbstractVersionedDatabase__runMigration__block_invoke;
  v4[3] = &unk_1E82E0A90;
  v4[4] = self;
  v4[5] = &v5;
  -[_PASSqliteDatabase frailWriteTransaction:](db, "frailWriteTransaction:", v4);
  if (!*((_BYTE *)v6 + 24))
  {
    -[_PASSqliteDatabase placeCorruptionMarker](self->_db, "placeCorruptionMarker");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0D81778], CFSTR("_ATXNotificationsDatabase migration failed. Marking as corrupt."));
  }
  _Block_object_dispose(&v5, 8);
}

BOOL __45__ATXAbstractVersionedDatabase__runMigration__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "migrate");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_initializeTables");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "_initializeSchemaVersion:", objc_msgSend(*(id *)(a1 + 32), "latestVersion"));
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)_initializeTables
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ATXAbstractVersionedDatabase createSchema](self, "createSchema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", v6, 3221225472, __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke, &unk_1E82DCB60, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), &v14);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    }
    while (v4);
  }

  v8 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (int64_t)countRowsOfTable:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[ATXAbstractVersionedDatabase db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "atx_countRowsOfTable:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithDbPath:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Cannot call _ATXNotificationDatabase init until class c unlocked", v1, 2u);
}

void __57__ATXAbstractVersionedDatabase__initializeSchemaVersion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error initializing meta table: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__ATXAbstractVersionedDatabase__initializeTables__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_11();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "Error initializing schema: %@ %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
