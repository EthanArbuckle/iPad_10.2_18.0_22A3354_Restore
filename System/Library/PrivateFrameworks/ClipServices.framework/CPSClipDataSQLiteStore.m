@implementation CPSClipDataSQLiteStore

+ (CPSClipDataSQLiteStore)defaultStore
{
  if (+[CPSClipDataSQLiteStore defaultStore]::onceToken != -1)
    dispatch_once(&+[CPSClipDataSQLiteStore defaultStore]::onceToken, &__block_literal_global_13);
  return (CPSClipDataSQLiteStore *)(id)+[CPSClipDataSQLiteStore defaultStore]::store;
}

void __38__CPSClipDataSQLiteStore_defaultStore__block_invoke()
{
  CPSClipDataSQLiteStore *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = [CPSClipDataSQLiteStore alloc];
  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/com.apple.ClipServices.clipserviced/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v1) & 1) == 0)
    objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v1, 0);
  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("ClipData.db"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByResolvingSymlinksInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[CPSClipDataSQLiteStore initWithDatabaseURL:](v0, "initWithDatabaseURL:", v8);
  v7 = (void *)+[CPSClipDataSQLiteStore defaultStore]::store;
  +[CPSClipDataSQLiteStore defaultStore]::store = v6;

}

- (CPSClipDataSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4;
  CPSClipDataSQLiteStore *v5;
  NSURL *v6;
  CPSClipDataSQLiteStore *v7;
  NSURL *databaseURL;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  NSObject *v11;
  CPSClipDataSQLiteStore *v12;
  CPSClipDataSQLiteStore *v13;
  _QWORD v15[4];
  CPSClipDataSQLiteStore *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPSClipDataSQLiteStore;
  v5 = -[CPSClipDataSQLiteStore init](&v22, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE82D90], "inMemoryDatabaseURL");
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    v9 = dispatch_queue_create("com.apple.ClipService.CPSClipDataSQLiteStore", 0);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v11 = v5->_databaseQueue;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__CPSClipDataSQLiteStore_initWithDatabaseURL___block_invoke;
    v15[3] = &unk_24C3BAA38;
    v12 = v5;
    v16 = v12;
    v17 = &v18;
    dispatch_sync(v11, v15);
    if (*((_BYTE *)v19 + 24))
      v13 = v12;
    else
      v13 = 0;
    v7 = v13;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __46__CPSClipDataSQLiteStore_initWithDatabaseURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseAndCheckIntegrity:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CPSClipDataSQLiteStore)init
{
  return -[CPSClipDataSQLiteStore initWithDatabaseURL:](self, "initWithDatabaseURL:", 0);
}

- (BOOL)_checkDatabaseIntegrity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[WBSSQLiteDatabase fetchQuery:](self->_database, "fetchQuery:", CFSTR("PRAGMA integrity_check(1)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if (!v3)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CPSClipDataSQLiteStore _checkDatabaseIntegrity].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ok")) & 1) == 0)
  {
    v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CPSClipDataSQLiteStore _checkDatabaseIntegrity].cold.2((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (void)_openDatabaseAndCheckIntegrity:(BOOL)a3
{
  _BOOL4 v3;
  WBSSQLiteDatabase *v5;
  WBSSQLiteDatabase *database;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  WBSSQLiteDatabase *v24;

  v3 = a3;
  v5 = (WBSSQLiteDatabase *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D90]), "initWithURL:queue:", self->_databaseURL, self->_databaseQueue);
  database = self->_database;
  self->_database = v5;

  if ((-[WBSSQLiteDatabase openWithAccessType:error:](self->_database, "openWithAccessType:error:", 3, 0) & 1) != 0)
  {
    if (v3 && !-[CPSClipDataSQLiteStore _checkDatabaseIntegrity](self, "_checkDatabaseIntegrity"))
      goto LABEL_15;
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA journal_mode = WAL")) != 100)
    {
      v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CPSClipDataSQLiteStore _openDatabaseAndCheckIntegrity:].cold.2((uint64_t)&self->_databaseURL, v7, v8, v9, v10, v11, v12, v13);
    }
    SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA foreign_keys = ON"));
    v14 = -[CPSClipDataSQLiteStore _migrateToCurrentSchemaVersionIfNeeded](self, "_migrateToCurrentSchemaVersionIfNeeded");
    if (v14 != 8)
    {
      v15 = v14;
      v16 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CPSClipDataSQLiteStore _openDatabaseAndCheckIntegrity:].cold.1((uint64_t *)&self->_databaseURL, v15, v16);
LABEL_15:
      -[CPSClipDataSQLiteStore _closeDatabase](self, "_closeDatabase");
    }
  }
  else
  {
    v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CPSClipDataSQLiteStore _openDatabaseAndCheckIntegrity:].cold.3((uint64_t)&self->_databaseURL, v17, v18, v19, v20, v21, v22, v23);
    v24 = self->_database;
    self->_database = 0;

  }
}

- (void)_closeDatabase
{
  WBSSQLiteDatabase *database;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (int)_schemaVersion
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intAtIndex:", 0);

  objc_msgSend(v2, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  return v4;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  WBSSQLiteDatabase *database;
  void *v6;
  int v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  database = self->_database;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v12 = a3;
      v13 = 2114;
      v14 = v10;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_20AD44000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  int v6;

  v3 = -[CPSClipDataSQLiteStore _schemaVersion](self, "_schemaVersion");
  v4 = v3;
  if (v3 <= 7)
  {
    if (v3)
    {
      v5 = v3 + 1;
      while ((_DWORD)v5 != 9)
      {
        v6 = -[CPSClipDataSQLiteStore _migrateToSchemaVersion:](self, "_migrateToSchemaVersion:", v5);
        v5 = (v5 + 1);
        if (v6 != 101)
          return v4;
      }
    }
    else if (-[CPSClipDataSQLiteStore _createFreshDatabaseSchema](self, "_createFreshDatabaseSchema") != 101)
    {
      return 0;
    }
    v4 = 8;
    -[CPSClipDataSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 8);
  }
  return v4;
}

- (int)_createFreshDatabaseSchema
{
  int v3;
  NSObject *v4;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE app_clips (id INTEGER PRIMARY KEY AUTOINCREMENT,bundle_id TEXT NOT NULL UNIQUE,user_notification_consent INTEGER DEFAULT NULL,location_confirmation_consent INTEGER DEFAULT NULL,allows_location_confirmation_after_launch BOOL DEFAULT 0,last_user_notification_request_time REAL DEFAULT NULL,last_version_check_time REAL DEFAULT NULL,last_install_time REAL DEFAULT NULL,parent_app_name TEXT DEFAULT NULL,parent_app_caption TEXT DEFAULT NULL,parent_app_store_url TEXT DEFAULT NULL)"));
  if (v3 == 101)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX app_clips__bundle_id ON app_clips (bundle_id)")) != 101)
    {
      v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _createFreshDatabaseSchema].cold.1();
      }

    }
    return -[CPSClipDataSQLiteStore _createClipEntryPointsTable](self, "_createClipEntryPointsTable");
  }
  else
  {
    v5 = v3;
    v6 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _createFreshDatabaseSchema].cold.2();
    }

  }
  return v5;
}

- (int)_createClipEntryPointsTable
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE clip_entry_points (id INTEGER PRIMARY KEY AUTOINCREMENT,app_clip_bundle_id TEXT DEFAULT NULL,web_clip_id TEXT NOT NULL UNIQUE,last_abr_fetch_time REAL DEFAULT 0,FOREIGN KEY(app_clip_bundle_id) REFERENCES app_clips(bundle_id) ON DELETE CASCADE ON UPDATE CASCADE)"));
  if (v3 != 101)
  {
    v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _createClipEntryPointsTable].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3;
  void (**v5)(_QWORD);
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];

  v3 = *(_QWORD *)&a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke;
  v13[3] = &unk_24C3BAA60;
  v13[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x20BD30A54](v13, a2);
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION"));
  if (v6 == 101)
  {
    switch((int)v3)
    {
      case 1:
        goto LABEL_8;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        v7 = -[CPSClipDataSQLiteStore _migrateToSchemaVersion](self, "_migrateToSchemaVersion");
        goto LABEL_7;
      case 8:
        v7 = -[CPSClipDataSQLiteStore _migrateToSchemeVersion](self, "_migrateToSchemeVersion");
LABEL_7:
        v6 = v7;
        if (v7 != 101)
          goto LABEL_17;
LABEL_8:
        v6 = -[CPSClipDataSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", v3);
        if (v6 != 101)
          goto LABEL_19;
        v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION"));
        if (v6 != 101)
        {
          v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[CPSClipDataSQLiteStore _migrateToSchemaVersion:].cold.3();
LABEL_19:
          v5[2](v5);
        }
        break;
      default:
        v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CPSClipDataSQLiteStore _migrateToSchemaVersion:].cold.2();
        v6 = 1;
LABEL_17:
        v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CPSClipDataSQLiteStore _migrateToSchemaVersion:].cold.1();
        goto LABEL_19;
    }
  }
  else
  {
    v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion:].cold.4();
  }

  return v6;
}

void __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 16), 0, CFSTR("ROLLBACK TRANSACTION")) != 101)
  {
    v1 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (int)_migrateToSchemaVersion_2
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE app_clips ADD COLUMN parent_app_name TEXT DEFAULT NULL"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_2].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE app_clips ADD COLUMN parent_app_caption TEXT DEFAULT NULL"));
  if (v4 != 101)
  {
    v5 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_2].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE clip_entry_points (id INTEGER PRIMARY KEY AUTOINCREMENT,app_clip_bundle_id TEXT DEFAULT NULL REFERENCES app_clips(bundle_id) ON DELETE SET NULL,web_clip_id TEXT NOT NULL UNIQUE,last_abr_fetch_time REAL DEFAULT 0)"));
  if (v3 != 101)
  {
    v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _createClipEntryPointsTable].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_4
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE app_clips ADD COLUMN location_confirmation_consent BOOL DEFAULT 0"));
  if (v3 != 101)
  {
    v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_4].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_5
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE app_clips ADD COLUMN parent_app_store_url TEXT DEFAULT NULL"));
  if (v3 != 101)
  {
    v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_5].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_6
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE app_clips ADD COLUMN allows_location_confirmation_after_launch BOOL DEFAULT 0"));
  if (v3 != 101)
  {
    v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_6].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_7
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("UPDATE app_clips SET user_notification_consent = NULL, location_confirmation_consent = NULL"));
  if (v3 != 101)
  {
    v4 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemaVersion_7].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemeVersion_8
{
  int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE clip_entry_points RENAME TO clip_entry_points_old"));
  if (v3 != 101)
  {
    v4 = v3;
    v6 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _migrateToSchemeVersion_8].cold.3();
    }
    goto LABEL_12;
  }
  v4 = -[CPSClipDataSQLiteStore _createClipEntryPointsTable](self, "_createClipEntryPointsTable");
  if (v4 == 101)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("INSERT INTO clip_entry_points (id, app_clip_bundle_id, web_clip_id, last_abr_fetch_time)SELECT clip_entry_points_old.id, clip_entry_points_old.app_clip_bundle_id, clip_entry_points_old.web_clip_id, clip_entry_points_old.last_abr_fetch_time FROM clip_entry_points_old")) != 101)
    {
      v5 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _migrateToSchemeVersion_8].cold.2();
      }

    }
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE clip_entry_points_old"));
    if (v4 != 101)
    {
      v6 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _migrateToSchemeVersion_8].cold.1();
      }
LABEL_12:

    }
  }
  return v4;
}

- (void)saveAppClipRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *databaseQueue;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__CPSClipDataSQLiteStore_saveAppClipRecord_completion___block_invoke;
    block[3] = &unk_24C3BAA88;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_async(databaseQueue, block);

  }
  else
  {
    v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD44000, v11, OS_LOG_TYPE_DEFAULT, "Not saving app clip record because bundle ID is nil", buf, 2u);
    }
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __55__CPSClipDataSQLiteStore_saveAppClipRecord_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateAppClipRecord:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "fullApplicationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cps_privacyPreservingDescription");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated existing app clip record with full app named %{public}@", (uint8_t *)&v10, 0xCu);
    }
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_insertAppClipRecord:", *(_QWORD *)(a1 + 40));
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("Failed to insert");
      if ((_DWORD)v6)
        v8 = CFSTR("Successfully inserted");
      v10 = 138412546;
      v11 = v8;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_20AD44000, v7, OS_LOG_TYPE_DEFAULT, "%@ new app clip record with full app named %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v6);

}

- (BOOL)_updateAppClipRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", self->_database, CFSTR("UPDATE app_clips SET user_notification_consent = ?, location_confirmation_consent = ?, allows_location_confirmation_after_launch = ?, last_user_notification_request_time = ?, last_version_check_time = ?, last_install_time = ?, parent_app_name = ?, parent_app_caption = ?, parent_app_store_url = ? WHERE bundle_id = ?"));
    objc_msgSend(v4, "userNotificationGranted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "userNotificationGranted");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v7, "BOOLValue"), 1);

    }
    else
    {
      objc_msgSend(v5, "bindNullAtParameterIndex:", 1);
    }
    objc_msgSend(v4, "locationConfirmationGranted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "locationConfirmationGranted");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v10, "BOOLValue"), 2);

    }
    else
    {
      objc_msgSend(v5, "bindNullAtParameterIndex:", 2);
    }
    objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v4, "locationConfirmationState"), 3);
    objc_msgSend(v4, "lastProxCardLaunchTime");
    objc_msgSend(v5, "bindDouble:atParameterIndex:", 4);
    objc_msgSend(v4, "lastVersionCheckTime");
    objc_msgSend(v5, "bindDouble:atParameterIndex:", 5);
    objc_msgSend(v4, "lastInstallTime");
    objc_msgSend(v5, "bindDouble:atParameterIndex:", 6);
    objc_msgSend(v4, "fullApplicationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindString:atParameterIndex:", v11, 7);

    objc_msgSend(v4, "fullApplicationCaption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindString:atParameterIndex:", v12, 8);

    objc_msgSend(v4, "fullApplicationStoreURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindString:atParameterIndex:", v14, 9);

    objc_msgSend(v4, "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindString:atParameterIndex:", v15, 10);

    v16 = objc_msgSend(v5, "execute");
    if (v16 != 101)
    {
      v17 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[CPSClipDataSQLiteStore _updateAppClipRecord:].cold.1();
      }

    }
    objc_msgSend(v5, "invalidate");
    v8 = v16 == 101 && -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount") != 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_insertAppClipRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  BOOL v17;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", self->_database, CFSTR("INSERT INTO app_clips (bundle_id, user_notification_consent, location_confirmation_consent, allows_location_confirmation_after_launch, last_user_notification_request_time, last_version_check_time, last_install_time, parent_app_name, parent_app_caption, parent_app_store_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindString:atParameterIndex:", v6, 1);

  objc_msgSend(v4, "userNotificationGranted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "userNotificationGranted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v8, "BOOLValue"), 2);

  }
  else
  {
    objc_msgSend(v5, "bindNullAtParameterIndex:", 2);
  }
  objc_msgSend(v4, "locationConfirmationGranted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "locationConfirmationGranted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v10, "BOOLValue"), 3);

  }
  else
  {
    objc_msgSend(v5, "bindNullAtParameterIndex:", 3);
  }
  objc_msgSend(v5, "bindInt64:atParameterIndex:", objc_msgSend(v4, "locationConfirmationState"), 4);
  objc_msgSend(v4, "lastProxCardLaunchTime");
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 5);
  objc_msgSend(v4, "lastVersionCheckTime");
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 6);
  objc_msgSend(v4, "lastInstallTime");
  objc_msgSend(v5, "bindDouble:atParameterIndex:", 7);
  objc_msgSend(v4, "fullApplicationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindString:atParameterIndex:", v11, 8);

  objc_msgSend(v4, "fullApplicationCaption");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindString:atParameterIndex:", v12, 9);

  objc_msgSend(v4, "fullApplicationStoreURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindString:atParameterIndex:", v14, 10);

  v15 = objc_msgSend(v5, "execute");
  if (v15 != 101)
  {
    v16 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _insertAppClipRecord:].cold.1();
    }

  }
  objc_msgSend(v5, "invalidate");
  v17 = v15 == 101 && -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount") != 0;

  return v17;
}

- (void)getAppClipRecordWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke;
  block[3] = &unk_24C3BAA88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke(_QWORD *a1)
{
  CPSAppClipRecord **v2;
  void *v3;
  NSObject *v4;
  CPSAppClipRecord *v5;
  void *v6;
  CPSAppClipRecord *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  CPSAppClipRecord *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (CPSAppClipRecord **)(a1 + 5);
  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(a1[4] + 16), CFSTR("SELECT user_notification_consent, location_confirmation_consent, allows_location_confirmation_after_launch, last_user_notification_request_time, last_version_check_time, last_install_time, parent_app_name, parent_app_caption, parent_app_store_url FROM app_clips WHERE bundle_id = ?"), a1 + 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *v2;
    v22 = 138739971;
    v23 = v5;
    _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_DEFAULT, "Getting app clip record with bundle ID %{sensitive}@", (uint8_t *)&v22, 0xCu);
  }
  objc_msgSend(v3, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[CPSAppClipRecord initWithSQLiteRow:bundleID:]([CPSAppClipRecord alloc], "initWithSQLiteRow:bundleID:", v6, *v2);
    v8 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[CPSAppClipRecord fullApplicationName](v7, "fullApplicationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cps_privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSAppClipRecord fullApplicationCaption](v7, "fullApplicationCaption");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cps_privacyPreservingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138740483;
      v23 = v7;
      v24 = 2114;
      v25 = v10;
      v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved app clip record %{sensitive}@, name is %{public}@, caption is %{public}@", (uint8_t *)&v22, 0x20u);

    }
  }
  else
  {
    v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    v7 = 0;
  }

  objc_msgSend(v3, "statement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidate");

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)saveClipEntryPointRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CPSClipDataSQLiteStore_saveClipEntryPointRecord_completion___block_invoke;
  block[3] = &unk_24C3BAA88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __62__CPSClipDataSQLiteStore_saveClipEntryPointRecord_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_insertOrReplaceEntryPointRecord:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_insertOrReplaceEntryPointRecord:(id)a3
{
  id v4;
  void *v5;
  double v6;
  int v7;
  NSObject *v8;
  id v10;
  id v11;
  double v12[4];

  v12[3] = *(double *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", self->_database, CFSTR("INSERT OR REPLACE INTO clip_entry_points (app_clip_bundle_id, web_clip_id, last_abr_fetch_time) VALUES (?, ?, ?)"));
  objc_msgSend(v4, "appClipBundleID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webClipIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastABRFetchTime");
  v12[0] = v6;
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSString * {__strong},double>(v5, &v11, &v10, v12);

  v7 = objc_msgSend(v5, "execute");
  if (v7 != 101)
  {
    v8 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[CPSClipDataSQLiteStore _insertOrReplaceEntryPointRecord:].cold.1();
    }

  }
  objc_msgSend(v5, "invalidate");

  return v7 == 101;
}

- (void)getEntryPointRecordWithWebClipIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__CPSClipDataSQLiteStore_getEntryPointRecordWithWebClipIdentifier_completion___block_invoke;
  block[3] = &unk_24C3BAA88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __78__CPSClipDataSQLiteStore_getEntryPointRecordWithWebClipIdentifier_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  CPSClipEntryPointRecord *v3;
  void *v4;
  id v5;

  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(a1[4] + 16), CFSTR("SELECT app_clip_bundle_id, web_clip_id, last_abr_fetch_time FROM clip_entry_points WHERE web_clip_id = ?"), a1 + 5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[CPSClipEntryPointRecord initWithSQLiteRow:]([CPSClipEntryPointRecord alloc], "initWithSQLiteRow:", v2);
  else
    v3 = 0;

  objc_msgSend(v5, "statement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)removeRecordWithBundleID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke;
  v7[3] = &unk_24C3BAAB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("DELETE FROM app_clips WHERE bundle_id = ?"));
  objc_msgSend(v2, "bindString:atParameterIndex:", *(_QWORD *)(a1 + 40), 1);
  if (objc_msgSend(v2, "execute") != 101)
  {
    v3 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke_cold_1();
    }

  }
  objc_msgSend(v2, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_checkDatabaseIntegrity
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a2, a3, "Failed database integrity check: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_openDatabaseAndCheckIntegrity:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a2;
  v5 = 1024;
  v6 = 8;
  v7 = 2114;
  v8 = v3;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "CPSClip Data SQLite schema version (%d) does not match our supported schema version (%d) in store at %{public}@", (uint8_t *)v4, 0x18u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a2, a3, "Failed to enable write-ahead logging on CPSClip Data SQLite store at %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a2, a3, "Failed to open tab state SQLite store at %{public}@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_createFreshDatabaseSchema
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to create app_clips table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_createClipEntryPointsTable
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to create clip_entry_points table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_migrateToSchemaVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_20AD44000, v0, v1, "Failed to migrate the database to schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_migrateToSchemaVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_20AD44000, v0, v1, "Not migrating to an unsupported schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_migrateToSchemaVersion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_20AD44000, v0, v1, "Failed to commit the transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_migrateToSchemaVersion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_1(&dword_20AD44000, v0, v1, "Failed to start a transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __50__CPSClipDataSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Failed to roll back transaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_migrateToSchemaVersion_2
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to add parent_app_name column to app_clips table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_migrateToSchemaVersion_4
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to add location_confirmation_consent column to app_clips table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_migrateToSchemaVersion_5
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to add parent_app_store_url column to app_clips table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_migrateToSchemaVersion_6
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to add allows_location_confirmation_after_launch column to app_clips table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_migrateToSchemaVersion_7
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to set user_notification_consent and location_confirmation_consent to NULL: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_migrateToSchemeVersion_8
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to rename clip_entry_points tabs to clip_entry_points_old: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_updateAppClipRecord:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to update a clip record in the app_clips table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

- (void)_insertAppClipRecord:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to insert a clip data into the app_clips table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

void __66__CPSClipDataSQLiteStore_getAppClipRecordWithBundleID_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Unable to retrieve app clip record", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_insertOrReplaceEntryPointRecord:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to save entry point into the clip_entry_points table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

void __51__CPSClipDataSQLiteStore_removeRecordWithBundleID___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_20AD44000, "Failed to remove a row from the app_clips table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_3_3();
}

@end
