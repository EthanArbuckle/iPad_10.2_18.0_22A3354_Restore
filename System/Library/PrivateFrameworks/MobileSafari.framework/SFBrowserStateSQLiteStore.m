@implementation SFBrowserStateSQLiteStore

- (NSArray)recentlyClosedWindows
{
  id v3;
  NSObject *databaseQueue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SFBrowserStateSQLiteStore *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  databaseQueue = self->_databaseQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__SFBrowserStateSQLiteStore_recentlyClosedWindows__block_invoke;
  v11 = &unk_1E21E6778;
  v12 = self;
  v5 = v3;
  v13 = v5;
  dispatch_sync(databaseQueue, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (void)mergeAllWindows
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke;
  block[3] = &unk_1E21E4950;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

- (SFBrowserStateSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4;
  SFBrowserStateSQLiteStore *v5;
  NSURL *v6;
  SFBrowserStateSQLiteStore *v7;
  NSURL *databaseURL;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  NSObject *v11;
  SFBrowserStateSQLiteStore *v12;
  SFBrowserStateSQLiteStore *v13;
  _QWORD v15[4];
  SFBrowserStateSQLiteStore *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFBrowserStateSQLiteStore;
  v5 = -[SFBrowserStateSQLiteStore init](&v22, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    v9 = dispatch_queue_create("com.apple.MobileSafari.TabStateSQLiteStore", 0);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v11 = v5->_databaseQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__SFBrowserStateSQLiteStore_initWithDatabaseURL___block_invoke;
    v15[3] = &unk_1E21E6810;
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

- (NSArray)browserWindows
{
  id v3;
  NSObject *databaseQueue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SFBrowserStateSQLiteStore *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  databaseQueue = self->_databaseQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__SFBrowserStateSQLiteStore_browserWindows__block_invoke;
  v11 = &unk_1E21E6778;
  v12 = self;
  v5 = v3;
  v13 = v5;
  dispatch_sync(databaseQueue, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

uint64_t __49__SFBrowserStateSQLiteStore_initWithDatabaseURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseAndCheckIntegrity:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_openDatabaseAndCheckIntegrity:(BOOL)a3
{
  _BOOL4 v3;
  WBSSQLiteDatabase *v5;
  WBSSQLiteDatabase *database;
  NSMutableDictionary *v7;
  NSMutableDictionary *tabUUIDStrings;
  NSMutableDictionary *v9;
  NSMutableDictionary *browserWindowDatabaseIDs;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  WBSSQLiteDatabase *v28;

  v3 = a3;
  v5 = (WBSSQLiteDatabase *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC0]), "initWithURL:queue:", self->_databaseURL, self->_databaseQueue);
  database = self->_database;
  self->_database = v5;

  if ((-[WBSSQLiteDatabase openWithAccessType:error:](self->_database, "openWithAccessType:error:", 3, 0) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    tabUUIDStrings = self->_tabUUIDStrings;
    self->_tabUUIDStrings = v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    browserWindowDatabaseIDs = self->_browserWindowDatabaseIDs;
    self->_browserWindowDatabaseIDs = v9;

    if (v3 && !-[SFBrowserStateSQLiteStore _checkDatabaseIntegrity](self, "_checkDatabaseIntegrity"))
      goto LABEL_15;
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA journal_mode = WAL")) != 100)
    {
      v11 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SFBrowserStateSQLiteStore _openDatabaseAndCheckIntegrity:].cold.2((uint64_t)&self->_databaseURL, v11, v12, v13, v14, v15, v16, v17);
    }
    SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA foreign_keys = ON"));
    v18 = -[SFBrowserStateSQLiteStore _migrateToCurrentSchemaVersionIfNeeded](self, "_migrateToCurrentSchemaVersionIfNeeded");
    if (v18 != 8)
    {
      v19 = v18;
      v20 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SFBrowserStateSQLiteStore _openDatabaseAndCheckIntegrity:].cold.1((uint64_t *)&self->_databaseURL, v19, v20);
LABEL_15:
      -[SFBrowserStateSQLiteStore _closeDatabase](self, "_closeDatabase");
    }
  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _openDatabaseAndCheckIntegrity:].cold.3((uint64_t)&self->_databaseURL, v21, v22, v23, v24, v25, v26, v27);
    v28 = self->_database;
    self->_database = 0;

  }
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 16), 0, CFSTR("BEGIN")) != 101)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_3();
    }
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_mergeAllWindowsIfNeeded") != 101
    && SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 16), 0, CFSTR("ROLLBACK")) != 101)
  {
    v2 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_2();
    }

  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 16), 0, CFSTR("COMMIT")) != 101)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_1();
    }
LABEL_12:

  }
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  int v6;

  v3 = -[SFBrowserStateSQLiteStore _schemaVersion](self, "_schemaVersion");
  v4 = v3;
  if (v3 <= 7)
  {
    if (v3)
    {
      v5 = v3 + 1;
      while ((_DWORD)v5 != 9)
      {
        v6 = -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:](self, "_migrateToSchemaVersion:", v5);
        v5 = (v5 + 1);
        if (v6 != 101)
          return v4;
      }
    }
    else
    {
      if (-[SFBrowserStateSQLiteStore _createFreshDatabaseSchema](self, "_createFreshDatabaseSchema") != 101)
        return 0;
      -[SFBrowserStateSQLiteStore _migrateFromLegacyPlistIfNeeded](self, "_migrateFromLegacyPlistIfNeeded");
    }
    v4 = 8;
    -[SFBrowserStateSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 8);
  }
  return v4;
}

- (int)_mergeAllWindowsIfNeeded
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _SFBrowserWindowStateData *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t i;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  id v47;
  void *v48;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  SFBrowserStateSQLiteStore *v59;
  _BYTE *v60;
  id v61[3];
  uint8_t v62[4];
  void *v63;
  __int16 v64;
  int v65;
  uint8_t v66[128];
  _BYTE buf[24];
  char v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  MEMORY[0x18D77F264](v61, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT COUNT(*) FROM browser_windows"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "nextObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intAtIndex:", 0);

  objc_msgSend(v48, "statement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  if (v3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT id, uuid, type FROM browser_windows ORDER BY id ASC"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intAtIndex:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intAtIndex:", 2));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v9);
      objc_msgSend(v51, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (v12)
      {
        v13 = objc_alloc_init(_SFBrowserWindowStateData);
        -[_SFBrowserWindowStateData setDatabaseID:](v13, "setDatabaseID:", (int)objc_msgSend(v9, "intValue"));
        objc_msgSend(v8, "stringAtIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFBrowserWindowStateData setUUIDString:](v13, "setUUIDString:", v14);

        objc_msgSend(v51, "setObject:forKeyedSubscript:", v13, v10);
      }

      objc_msgSend(v7, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
    while (v15);
    objc_msgSend(v7, "statement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT id, browser_window_id FROM tabs ORDER BY order_index ASC"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v17, "nextObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
        break;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "intAtIndex:", 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v19, "intAtIndex:", 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v50, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "addObject:", v20);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v26, v22);

        }
      }
      else
      {
        v25 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v21;
          _os_log_error_impl(&dword_18B7B2000, v25, OS_LOG_TYPE_ERROR, "Unknown window type for tab id %{public}@ in window id %{public}@", buf, 0x16u);
        }
      }

    }
    objc_msgSend(v17, "statement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "invalidate");

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v68 = 1;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("UPDATE tabs SET order_index = ?, browser_window_id = ?, browser_window_uuid = ? WHERE id = ?"));
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke;
    v56[3] = &unk_1E21E6860;
    v47 = v51;
    v57 = v47;
    v29 = v28;
    v58 = v29;
    v59 = self;
    v60 = buf;
    v46 = v29;
    objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v56);
    objc_msgSend(v29, "invalidate");
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("DELETE FROM browser_windows WHERE id = ?"));
    v31 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v47, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safari_mapObjectsUsingBlock:", &__block_literal_global_54);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v6, "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v53;
      v38 = 1;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if ((objc_msgSend(v34, "containsObject:", v40) & 1) == 0)
          {
            objc_msgSend(v30, "bindInt:atParameterIndex:", objc_msgSend(v40, "intValue"), 1);
            v41 = objc_msgSend(v30, "execute");
            if (v41 != 101)
            {
              v42 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v62 = 138543618;
                v63 = v43;
                v64 = 1024;
                v65 = v41;
                _os_log_error_impl(&dword_18B7B2000, v42, OS_LOG_TYPE_ERROR, "Failed to delete empty windows while merging: %{public}@ (%d)", v62, 0x12u);

              }
              v38 = 0;
            }
            objc_msgSend(v30, "reset");
          }
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      }
      while (v36);
    }
    else
    {
      v38 = 1;
    }

    objc_msgSend(v30, "invalidate");
    v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("UPDATE browser_windows SET scene_id = NULL"));
    if (v5 == 101)
    {
      if (((*(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0) & v38) != 0)
        v5 = 101;
      else
        v5 = 1;
    }
    else
    {
      v44 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _mergeAllWindowsIfNeeded].cold.1();
      }

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v5 = 101;
  }

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v61);
  return v5;
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

void __43__SFBrowserStateSQLiteStore_browserWindows__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _SFBrowserWindowStateData *v7;
  void *v8;
  _SFBrowserWindowStateData *v9;
  void *v10;
  uint64_t v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v11 = 0;
  SafariShared::WBSSQLiteDatabaseFetch<SFBrowserWindowType>(v2, CFSTR("SELECT id, uuid, scene_id FROM browser_windows WHERE type = ?"), &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      break;
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [_SFBrowserWindowStateData alloc];
    objc_msgSend(v5, "stringAtIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_SFBrowserWindowStateData initWithUUIDString:sceneID:](v7, "initWithUUIDString:sceneID:", v6, v8);

    objc_msgSend(*(id *)(a1 + 32), "_setDatabaseID:browserWindow:", (int)objc_msgSend(v5, "intAtIndex:", 0), v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
  objc_msgSend(v3, "statement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

}

void __50__SFBrowserStateSQLiteStore_recentlyClosedWindows__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _SFBrowserWindowStateData *v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = 2;
  SafariShared::WBSSQLiteDatabaseFetch<SFBrowserWindowType>(v2, CFSTR("SELECT id, uuid FROM browser_windows WHERE type = ? ORDER BY id DESC"), &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      break;
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_SFBrowserWindowStateData initWithUUIDString:sceneID:]([_SFBrowserWindowStateData alloc], "initWithUUIDString:sceneID:", v6, 0);
    objc_msgSend(*(id *)(a1 + 32), "_setDatabaseID:browserWindow:", (int)objc_msgSend(v5, "intAtIndex:", 0), v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
  objc_msgSend(v3, "statement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (SFBrowserStateSQLiteStore)init
{
  return -[SFBrowserStateSQLiteStore initWithDatabaseURL:](self, "initWithDatabaseURL:", 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFBrowserStateSQLiteStore;
  -[SFBrowserStateSQLiteStore dealloc](&v2, sel_dealloc);
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
    v7 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _checkDatabaseIntegrity].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ok")) & 1) == 0)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _checkDatabaseIntegrity].cold.2((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (void)_closeDatabase
{
  WBSSQLiteDatabase *database;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

  self->_generateUUIDFunctionAttached = 0;
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

  v17 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
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
      _os_log_error_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (void)_migrateFromLegacyPlistIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  _SFSafariContainerPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/Library/Safari/SuspendState.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByResolvingSymlinksInPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SFBrowserStateSQLiteStore _migrateFromLegacyPlistWithPath:](self, "_migrateFromLegacyPlistWithPath:", v7);
}

- (void)_migrateFromLegacyPlistWithPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v28;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("SafariStateBrowserWindowUUID"));

      -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:](self, "_updateBrowserWindowStateWithDictionary:", v10);
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SFBrowserStateSQLiteStore _migrateFromLegacyPlistWithPath:].cold.2((uint64_t)v4, v14, v15, v16, v17, v18, v19, v20);
    }

  }
  else if (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CB28A8], 260))
  {
    v13 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v4;
      _os_log_impl(&dword_18B7B2000, v13, OS_LOG_TYPE_DEFAULT, "Legacy SuspendState.plist does not exist at %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _migrateFromLegacyPlistWithPath:].cold.1((uint64_t)v4, v21, v22, v23, v24, v25, v26, v27);
  }

}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3;
  void (**v5)(_QWORD);
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v21;
  uint8_t v22[16];
  _QWORD aBlock[5];
  id v24[3];

  v3 = *(_QWORD *)&a3;
  MEMORY[0x18D77F264](v24, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke;
  aBlock[3] = &unk_1E21E4950;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION"));
  if (v6 == 101)
  {
    switch((int)v3)
    {
      case 1:
        goto LABEL_14;
      case 2:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        v6 = -[SFBrowserStateSQLiteStore _migrateToSchemaVersion](self, "_migrateToSchemaVersion");
        goto LABEL_13;
      case 3:
        objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "BOOLForKey:", CFSTR("TabStateMigrationInProgress")))
        {
          v9 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);
          -[SFBrowserStateSQLiteStore _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration](self, "_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration");
          v6 = 101;
        }
        else
        {
          objc_msgSend(v8, "setBool:forKey:", 1, CFSTR("TabStateMigrationInProgress"));
          v21 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_18B7B2000, v21, OS_LOG_TYPE_DEFAULT, "Start migrating from tab state database from V2 to V3", v22, 2u);
          }
          v6 = -[SFBrowserStateSQLiteStore _migrateToSchemaVersion](self, "_migrateToSchemaVersion");
        }
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("TabStateMigrationInProgress"));

LABEL_13:
        if (v6 != 101)
          goto LABEL_19;
LABEL_14:
        v6 = -[SFBrowserStateSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", v3);
        if (v6 != 101)
          goto LABEL_21;
        v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION"));
        if (v6 != 101)
        {
          v18 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.3();
LABEL_21:
          v5[2](v5);
        }
        break;
      default:
        v17 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.2();
        v6 = 1;
LABEL_19:
        v19 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.1();
        goto LABEL_21;
    }
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.5();
  }

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v24);
  return v6;
}

void __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
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
    v1 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (int)_migrateToSchemaVersion_2
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE tabs ADD COLUMN uncompressed_session_data_size INTEGER NOT NULL DEFAULT 0"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_2].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT COUNT(*) FROM sqlite_master WHERE type = 'table' AND (name = 'tabs_old' OR name = 'tab_sessions')"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(v3, "lastResultCode");
    v11 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.1();
    objc_msgSend(v3, "statement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    goto LABEL_33;
  }
  v6 = objc_msgSend(v4, "intAtIndex:", 0);
  objc_msgSend(v3, "statement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  if (v6 >= 1)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_DEFAULT, "Database is in an inconsistent state on schema version 3. Atempting to recover", buf, 2u);
    }
    v9 = -[SFBrowserStateSQLiteStore _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration](self, "_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration");
    if (v9 == 101)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B7B2000, v10, OS_LOG_TYPE_INFO, "Successfully recovered from database inconsistency of schema version 3.", buf, 2u);
      }
LABEL_8:
      v9 = 101;
      goto LABEL_33;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.2();
    goto LABEL_33;
  }
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP INDEX IF EXISTS tabs__uuid"));
  if (v9 != 101)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.7();
    }
    goto LABEL_32;
  }
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE tabs RENAME TO tabs_old"));
  if (v9 != 101)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.6();
    }
    goto LABEL_32;
  }
  v9 = -[SFBrowserStateSQLiteStore _createTableForTabs](self, "_createTableForTabs");
  if (v9 != 101)
    goto LABEL_33;
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("INSERT INTO tabs (id, uuid, title, url, user_visible_url, order_index, last_viewed_time, readinglist_bookmark_id, opened_from_link, showing_reader, reader_view_top_scroll_offset, private_browsing, displaying_standalone_image, browser_window_uuid, browser_window_id)SELECT tabs_old.id, tabs_old.uuid, tabs_old.title, tabs_old.url, tabs_old.user_visible_url, tabs_old.order_index, tabs_old.last_viewed_time, tabs_old.readinglist_bookmark_id, tabs_old.opened_from_link, tabs_old.showing_reader, tabs_old.reader_view_top_scroll_offset, tabs_old.private_browsing, tabs_old.displaying_standalone_image, tabs_old.browser_window_uuid, tabs_old.browser_window_id FROM tabs_old"));
  if (v9 != 101)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.5();
    }
LABEL_32:

    goto LABEL_33;
  }
  v9 = -[SFBrowserStateSQLiteStore _createTableForTabSession](self, "_createTableForTabSession");
  if (v9 == 101)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("INSERT INTO tab_sessions (tab_uuid, session_data, uncompressed_session_data_size)SELECT tabs_old.uuid, tabs_old.session_data, tabs_old.uncompressed_session_data_size FROM tabs_old")) != 101)
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.4();
      }

    }
    v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE tabs_old"));
    if (v9 != 101)
    {
      v14 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.3();
      }

      goto LABEL_8;
    }
  }
LABEL_33:

  return v9;
}

- (int)_migrateToSchemaVersion_5
{
  int v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP INDEX IF EXISTS tab_sessions__uuid"));
  if (v3 != 101)
  {
    v7 = v3;
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.5();
    }
    goto LABEL_17;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE tab_sessions RENAME TO tab_sessions_old"));
  if (v4 != 101)
  {
    v7 = v4;
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.4();
    }
    goto LABEL_17;
  }
  v5 = -[SFBrowserStateSQLiteStore _createTableForTabSession](self, "_createTableForTabSession");
  if (v5 != 101)
  {
    v7 = v5;
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.3();
    }
    goto LABEL_17;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("INSERT INTO tab_sessions (tab_uuid, session_data, uncompressed_session_data_size)SELECT tab_sessions_old.tab_uuid, tab_sessions_old.session_data, tab_sessions_old.uncompressed_session_data_size FROM tab_sessions_old")) != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.2();
    }

  }
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE tab_sessions_old"));
  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.1();
    }
LABEL_17:

  }
  return v7;
}

- (int)_migrateToSchemaVersion_6
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE tabs ADD COLUMN tab_group_uuid TEXT NOT NULL DEFAULT ''"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_6].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_7
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE tabs ADD COLUMN profile_uuid TEXT NOT NULL DEFAULT ''"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_7].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_8
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE browser_windows ADD COLUMN active_profile_identifier TEXT NOT NULL DEFAULT ''"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_8].cold.1();
    }

  }
  return v3;
}

- (int)_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration
{
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v8;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE IF EXISTS tab_sessions"));
  if (v3 != 101)
  {
    v6 = v3;
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration].cold.3();
    }
    goto LABEL_14;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE IF EXISTS tabs_old"));
  if (v4 != 101)
  {
    v6 = v4;
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.3();
    }
    goto LABEL_14;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE IF EXISTS tabs"));
  if (v5 != 101)
  {
    v6 = v5;
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration].cold.1();
    }
LABEL_14:

    return v6;
  }
  v6 = -[SFBrowserStateSQLiteStore _createTableForTabs](self, "_createTableForTabs");
  if (v6 == 101)
    return -[SFBrowserStateSQLiteStore _createTableForTabSession](self, "_createTableForTabSession");
  return v6;
}

- (int)_createTableForTabSession
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE tab_sessions (id INTEGER PRIMARY KEY AUTOINCREMENT,tab_uuid TEXT NOT NULL UNIQUE,session_data BLOB DEFAULT NULL,uncompressed_session_data_size INTEGER NOT NULL DEFAULT 0,FOREIGN KEY(tab_uuid) REFERENCES tabs(uuid) ON DELETE CASCADE ON UPDATE CASCADE)"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabSession].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX tab_sessions__uuid ON tab_sessions (tab_uuid)"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabSession].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_createTableForTabs
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE tabs (id INTEGER PRIMARY KEY AUTOINCREMENT,uuid TEXT NOT NULL UNIQUE,title TEXT,url TEXT COLLATE NOCASE,user_visible_url TEXT COLLATE NOCASE,order_index INTEGER NOT NULL,last_viewed_time REAL DEFAULT NULL,readinglist_bookmark_id INTEGER DEFAULT 0,opened_from_link BOOL DEFAULT 0,showing_reader BOOL DEFAULT 0,reader_view_top_scroll_offset INTEGER DEFAULT 0,private_browsing BOOL DEFAULT 0,displaying_standalone_image BOOL DEFAULT 0,browser_window_uuid TEXT NOT NULL,browser_window_id INTEGER NOT NULL,tab_group_uuid TEXT NOT NULL DEFAULT '',profile_uuid TEXT NOT NULL DEFAULT '',FOREIGN KEY(browser_window_id) REFERENCES browser_windows(id) ON DELETE CASCADE)"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabs].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX tabs__uuid ON tabs (uuid)"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabSession].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_createFreshDatabaseSchema
{
  int v3;
  int v4;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE browser_windows (id INTEGER PRIMARY KEY AUTOINCREMENT,uuid TEXT NOT NULL,type INTEGER DEFAULT 0,active_document_index INTEGER DEFAULT 0,active_private_document_index INTEGER DEFAULT 0,active_document_is_valid BOOL DEFAULT 1,tab_state_successfully_loaded BOOL DEFAULT 0,legacy_plist_file_version INTEGER DEFAULT 0,scene_ID TEXT,active_profile_identifier TEXT NOT NULL DEFAULT '',CONSTRAINT uuid_type_index UNIQUE(uuid, type))"));
  if (v3 == 101)
  {
    v4 = -[SFBrowserStateSQLiteStore _createTableForTabs](self, "_createTableForTabs");
    if (v4 == 101)
      return -[SFBrowserStateSQLiteStore _createTableForTabSession](self, "_createTableForTabSession");
  }
  else
  {
    v4 = v3;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createFreshDatabaseSchema].cold.1();
    }

  }
  return v4;
}

- (int)_migrateToSchemaVersion_4
{
  int v3;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE browser_windows ADD COLUMN scene_id TEXT"));
  if (v3 == 101)
    return -[SFBrowserStateSQLiteStore _mergeAllWindowsIfNeeded](self, "_mergeAllWindowsIfNeeded");
  v5 = v3;
  v6 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
    objc_claimAutoreleasedReturnValue();
    -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_4].cold.1();
  }

  return v5;
}

void __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke_2;
  v9[3] = &unk_1E21E6838;
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = *(_OWORD *)(a1 + 48);
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

}

void __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  uint8_t buf[8];
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = a3;
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)buf = objc_msgSend(*(id *)(a1 + 40), "databaseID");
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "intValue");
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long &,long,NSString * {__strong},int>(v6, &v13, buf, &v12, &v11);

  v7 = objc_msgSend(*(id *)(a1 + 32), "execute");
  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "intValue");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 1024;
      v18 = v7;
      _os_log_error_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_ERROR, "Failed to update tab id %d: %{public}@ (%d)", buf, 0x18u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

id __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke_94(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "databaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateSceneID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  id v11[3];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  MEMORY[0x18D77F264](v11, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SFBrowserStateSQLiteStore_updateSceneID___block_invoke;
  v8[3] = &unk_1E21E68C8;
  v8[4] = self;
  v9 = v4;
  v10 = &v12;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v11);
  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __43__SFBrowserStateSQLiteStore_updateSceneID___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "sceneID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "UUIDString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong}>(v3, 0, CFSTR("UPDATE browser_windows SET scene_id = ? WHERE uuid = ?"), &v9, &v8);

  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 1024;
      v15 = v4;
      _os_log_error_impl(&dword_18B7B2000, v5, OS_LOG_TYPE_ERROR, "Failed to update scene_id for window with UUID = %@: %{public}@ (%d)", buf, 0x1Cu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SFBrowserStateSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E21E4950;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __42__SFBrowserStateSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (void)deleteRecentlyClosedWindowsWithProfileIdentifier:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SFBrowserStateSQLiteStore_deleteRecentlyClosedWindowsWithProfileIdentifier___block_invoke;
  v7[3] = &unk_1E21E6778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __78__SFBrowserStateSQLiteStore_deleteRecentlyClosedWindowsWithProfileIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7[3];
  _BYTE buf[12];
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x18D77F264](v7, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)buf = 2;
  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<SFBrowserWindowType,NSString * const {__strong}&>(v2, 0, CFSTR("DELETE FROM browser_windows WHERE type = ? AND active_profile_identifier = ?"), buf, (_QWORD *)(a1 + 40));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 1024;
      v12 = v3;
      _os_log_error_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_ERROR, "Failed to remove recently closed windows (Profile: %{public}@) from BrowserState.db: %{public}@ (%d)", buf, 0x1Cu);

    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
}

- (void)_removeSavedSessionStateDataForTabsWithUUIDStrings:(id)a3
{
  id v4;
  WBSSQLiteDatabase *database;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10[7];

  v10[6] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  MEMORY[0x18D77F264](v10, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  database = self->_database;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("', '"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM tab_sessions WHERE tab_uuid IN ('%@')"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(database) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v8);

  if ((_DWORD)database != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _removeSavedSessionStateDataForTabsWithUUIDStrings:].cold.1();
    }

  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);

}

- (void)removeSavedSessionStateDataForTabsWithUUIDStrings:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = operator new();
  MEMORY[0x18D77F264](v5, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SFBrowserStateSQLiteStore_removeSavedSessionStateDataForTabsWithUUIDStrings___block_invoke;
  block[3] = &unk_1E21E68F0;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(databaseQueue, block);

}

id *__79__SFBrowserStateSQLiteStore_removeSavedSessionStateDataForTabsWithUUIDStrings___block_invoke(uint64_t a1)
{
  id *result;

  objc_msgSend(*(id *)(a1 + 32), "_removeSavedSessionStateDataForTabsWithUUIDStrings:", *(_QWORD *)(a1 + 40));
  result = *(id **)(a1 + 48);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x18D77F27CLL);
  }
  return result;
}

- (void)saveTabStateWithDictionary:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SFBrowserStateSQLiteStore *v9;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SFBrowserStateSQLiteStore_saveTabStateWithDictionary___block_invoke;
  v7[3] = &unk_1E21E6778;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __56__SFBrowserStateSQLiteStore_saveTabStateWithDictionary___block_invoke(uint64_t a1)
{
  SFTabStateData *v2;

  v2 = -[SFTabStateData initWithDictionaryRepresentation:]([SFTabStateData alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(a1 + 40), "_updateTabStateWithData:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_insertTabStateWithData:", v2);

}

- (id)tabStateDataForUUID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFBrowserStateSQLiteStore_tabStateDataForUUID___block_invoke;
  block[3] = &unk_1E21E6918;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__SFBrowserStateSQLiteStore_tabStateDataForUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_tabStateDataForUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_tabStateDataForUUID:(id)a3
{
  id v4;
  WBSSQLiteDatabase *database;
  void *v6;
  void *v7;
  SFTabStateData *v8;
  void *v9;
  id v11;

  v4 = a3;
  database = self->_database;
  objc_msgSend(v4, "UUIDString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}>(database, CFSTR("SELECT tabs.id, tabs.uuid, tabs.title, tabs.url, tabs.user_visible_url, tabs.order_index, tabs.last_viewed_time, tabs.readinglist_bookmark_id, tabs.opened_from_link, tabs.showing_reader, tabs.reader_view_top_scroll_offset, tabs.private_browsing, tabs.displaying_standalone_image, tabs.browser_window_uuid, tabs.tab_group_uuid, tabs.profile_uuid FROM tabs WHERE uuid = ?"), &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[SFTabStateData initWithSQLiteRow:]([SFTabStateData alloc], "initWithSQLiteRow:", v7);
  else
    v8 = 0;

  objc_msgSend(v6, "statement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  return v8;
}

- (void)readTabStatesWithBrowserWindowUUID:(id)a3 completion:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SFBrowserStateSQLiteStore_readTabStatesWithBrowserWindowUUID_completion___block_invoke;
  block[3] = &unk_1E21E3F10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __75__SFBrowserStateSQLiteStore_readTabStatesWithBrowserWindowUUID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readTabStatesWithBrowserWindowUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_readTabStatesWithBrowserWindowUUID:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  _SFBrowserWindowStateData *v9;
  void *v10;
  void *v11;
  WBSSQLiteDatabase *database;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFTabStateData *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void (**v26)(id, void *);
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v6 = (void (**)(id, void *))a4;
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, CFSTR("SELECT * FROM browser_windows WHERE uuid = ?"), &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[_SFBrowserWindowStateData initWithSQLiteRow:]([_SFBrowserWindowStateData alloc], "initWithSQLiteRow:", v8);
    -[_SFBrowserWindowStateData dictionaryRepresentation](v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v7, "statement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    database = self->_database;
    v29 = -[_SFBrowserWindowStateData databaseID](v9, "databaseID");
    SafariShared::WBSSQLiteDatabaseFetch<long>(database, CFSTR("SELECT tabs.id, tabs.uuid, tabs.title, tabs.url, tabs.user_visible_url, tabs.order_index, tabs.last_viewed_time, tabs.readinglist_bookmark_id, tabs.opened_from_link, tabs.showing_reader, tabs.reader_view_top_scroll_offset, tabs.private_browsing, tabs.displaying_standalone_image, tabs.browser_window_uuid, tabs.tab_group_uuid, tabs.profile_uuid FROM tabs WHERE browser_window_id = ? ORDER BY tabs.order_index ASC"), &v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v13, "nextObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        break;
      v17 = -[SFTabStateData initWithSQLiteRow:]([SFTabStateData alloc], "initWithSQLiteRow:", v16);
      -[SFTabStateData owningBrowserWindowUUIDString](v17, "owningBrowserWindowUUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[_SFBrowserWindowStateData UUIDString](v9, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTabStateData setOwningBrowserWindowUUIDString:](v17, "setOwningBrowserWindowUUIDString:", v19);

      }
      -[SFBrowserStateSQLiteStore _cacheUUIDForTabStateData:](self, "_cacheUUIDForTabStateData:", v17);
      if (-[SFTabStateData privateBrowsing](v17, "privateBrowsing"))
        v20 = v15;
      else
        v20 = v14;
      v21 = v20;
      -[SFTabStateData dictionaryRepresentation](v17, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

    }
    v6 = v26;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, CFSTR("SafariStateDocuments"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v15, CFSTR("SafariStatePrivateDocuments"));
    objc_msgSend(v13, "statement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "invalidate");

    v24 = -[_SFBrowserWindowStateData databaseID](v9, "databaseID");
    -[_SFBrowserWindowStateData UUIDString](v9, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserStateSQLiteStore _setDatabaseID:browserWindow:](self, "_setDatabaseID:browserWindow:", v24, v25);

    v6[2](v6, v28);
    v8 = v27;
  }
  else
  {
    v6[2](v6, 0);
    objc_msgSend(v7, "statement");
    v9 = (_SFBrowserWindowStateData *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserWindowStateData invalidate](v9, "invalidate");
  }

}

- (id)tabStatesWithBrowserWindowUUID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke;
  block[3] = &unk_1E21E68C8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke_2;
  v4[3] = &unk_1E21E6940;
  v4[4] = a1[6];
  return objc_msgSend(v2, "_readTabStatesWithBrowserWindowUUID:completion:", v1, v4);
}

void __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)_saveBrowserWindowStateWithDictionary:(id)a3
{
  id v4;
  _SFBrowserWindowStateData *v5;
  int64_t v6;

  v4 = a3;
  v5 = -[_SFBrowserWindowStateData initWithDictionaryRepresentation:]([_SFBrowserWindowStateData alloc], "initWithDictionaryRepresentation:", v4);
  v6 = -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithData:](self, "_saveBrowserWindowStateWithData:", v5);

  return v6;
}

- (int64_t)_saveBrowserWindowStateWithData:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  WBSSQLiteDatabase *database;
  int v8;
  int64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  id v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MEMORY[0x18D77F264](v21, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFBrowserStateSQLiteStore _databaseIDForBrowserWindow:](self, "_databaseIDForBrowserWindow:", v5);

  v20 = v6;
  database = self->_database;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "UUIDString");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = objc_msgSend(v4, "activeDocumentIndex");
    v19 = objc_msgSend(v4, "activePrivateDocumentIndex");
    v18 = objc_msgSend(v4, "legacyPlistFileVersion");
    v15 = objc_msgSend(v4, "type");
    objc_msgSend(v4, "activeProfileIdentifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong},long,long,long,SFBrowserWindowType,NSString * {__strong}>(database, 0, CFSTR("INSERT INTO browser_windows (uuid, scene_id, active_document_index, active_private_document_index, legacy_plist_file_version, type, active_profile_identifier) VALUES (?, ?, ?, ?, ?, ?, ?)"), &v17, &v16, v22, &v19, &v18, &v15, &v14);

    if (v8 == 101)
    {
      v9 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
      objc_msgSend(v4, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _setDatabaseID:browserWindow:](self, "_setDatabaseID:browserWindow:", v9, v10);

    }
    else
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithData:].cold.1();
      }

      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v22[0] = objc_msgSend(v4, "activeDocumentIndex");
    v19 = objc_msgSend(v4, "activePrivateDocumentIndex");
    v18 = objc_msgSend(v4, "type");
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long,long,SFBrowserWindowType,long &>(database, 0, CFSTR("UPDATE browser_windows SET active_document_index = ?, active_private_document_index = ?, type = ? WHERE id = ?"), v22, &v19, &v18, &v20) != 101)
    {
      v11 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithData:].cold.2();
      }

    }
    v9 = v20;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v21);

  return v9;
}

- (void)_updateOrInsertTabStateWithData:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "skipUpdate") & 1) == 0
    && (!-[SFBrowserStateSQLiteStore _isTabStateCached:](self, "_isTabStateCached:", v4)
     || !-[SFBrowserStateSQLiteStore _updateTabStateWithData:](self, "_updateTabStateWithData:", v4)))
  {
    -[SFBrowserStateSQLiteStore _insertTabStateWithData:](self, "_insertTabStateWithData:", v4);
  }

}

- (BOOL)_updateTabStateWithData:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  int v7;
  uint64_t (*v8)(_QWORD *);
  int v9;
  WBSSQLiteDatabase *database;
  BOOL v11;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x18D77F264](v18, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SFBrowserStateSQLiteStore__updateTabStateWithData___block_invoke;
  aBlock[3] = &unk_1E21E6968;
  aBlock[4] = self;
  v5 = v4;
  v17 = v5;
  v6 = _Block_copy(aBlock);
  v7 = objc_msgSend(v5, "skipSavingSessionState");
  v8 = (uint64_t (*)(_QWORD *))v6[2];
  if (v7)
  {
    v9 = v8(v6);
  }
  else
  {
    if (v8(v6) != 101)
    {
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    database = self->_database;
    objc_msgSend(v5, "sessionStateData");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "uncompressedSessionStateDataSize");
    objc_msgSend(v5, "UUIDString");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong},unsigned long,NSString * {__strong}>(database, 0, CFSTR("UPDATE tab_sessions SET session_data = ?, uncompressed_session_data_size = ?WHERE tab_uuid = ?"), &v15, &v14, &v13);

  }
  if (v9 != 101)
    goto LABEL_7;
  -[SFBrowserStateSQLiteStore _cacheUUIDForTabStateData:](self, "_cacheUUIDForTabStateData:", v5);
  v11 = 1;
LABEL_8:

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v11;
}

uint64_t __53__SFBrowserStateSQLiteStore__updateTabStateWithData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "url");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userVisibleURL");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(*(id *)(a1 + 40), "orderIndex");
  objc_msgSend(*(id *)(a1 + 40), "lastViewedTime");
  v17 = v3;
  v16 = objc_msgSend(*(id *)(a1 + 40), "readingListBookmarkID");
  v15 = objc_msgSend(*(id *)(a1 + 40), "wasOpenedFromLink");
  v14 = objc_msgSend(*(id *)(a1 + 40), "showingReader");
  v13 = objc_msgSend(*(id *)(a1 + 40), "readerViewTopScrollOffset");
  v12 = objc_msgSend(*(id *)(a1 + 40), "privateBrowsing");
  v11 = objc_msgSend(*(id *)(a1 + 40), "displayingStandaloneImage");
  objc_msgSend(*(id *)(a1 + 40), "owningBrowserWindowUUIDString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 40), "owningBrowserWindowDatabaseID");
  objc_msgSend(*(id *)(a1 + 40), "tabGroupUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "profileIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong},NSString * {__strong},long,double,int,BOOL,BOOL,long,BOOL,BOOL,NSString * {__strong},long,NSString * {__strong},NSString * {__strong},NSString * {__strong}>(v2, 0, CFSTR("UPDATE tabs SET title = ?, url = ?, user_visible_url = ?, order_index = ?, last_viewed_time = ?, readinglist_bookmark_id = ?, opened_from_link = ?, showing_reader = ?, reader_view_top_scroll_offset = ?, private_browsing = ?, displaying_standalone_image = ?, browser_window_uuid = ?, browser_window_id = ?, tab_group_uuid = ?, profile_uuid = ?WHERE uuid = ?"), &v21, &v20, &v19, &v18, (double *)&v17, &v16, &v15, &v14, &v13, &v12, &v11, &v10, &v9, &v8, &v7, &v6);

  return v4;
}

- (void)_insertTabStateWithData:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  uint64_t v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[3];
  double v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MEMORY[0x18D77F264](v26, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("INSERT INTO tabs (uuid, title, url, user_visible_url, order_index, last_viewed_time, readinglist_bookmark_id, opened_from_link, showing_reader, reader_view_top_scroll_offset, private_browsing, displaying_standalone_image, browser_window_uuid, browser_window_id, tab_group_uuid, profile_uuid)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
  objc_msgSend(v4, "UUIDString");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userVisibleURL");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v28[0] = objc_msgSend(v4, "orderIndex");
  objc_msgSend(v4, "lastViewedTime");
  v27[0] = v6;
  v21 = objc_msgSend(v4, "readingListBookmarkID");
  v20 = objc_msgSend(v4, "wasOpenedFromLink");
  v19 = objc_msgSend(v4, "showingReader");
  v18 = objc_msgSend(v4, "readerViewTopScrollOffset");
  v17 = objc_msgSend(v4, "privateBrowsing");
  v16 = objc_msgSend(v4, "displayingStandaloneImage");
  objc_msgSend(v4, "owningBrowserWindowUUIDString");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "owningBrowserWindowDatabaseID");
  objc_msgSend(v4, "tabGroupUUID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSString * {__strong},NSString * {__strong},NSString * {__strong},long,double,int,BOOL,BOOL,long,BOOL,BOOL,NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v5, &v25, &v24, &v23, &v22, v28, v27, &v21, &v20, &v19, &v18, &v17, &v16, &v15, &v14, &v13, &v12);

  if (objc_msgSend(v5, "execute") == 101)
  {
    -[SFBrowserStateSQLiteStore _cacheUUIDForTabStateData:](self, "_cacheUUIDForTabStateData:", v4);
  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _insertTabStateWithData:].cold.2();
    }

  }
  objc_msgSend(v5, "invalidate");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("INSERT INTO tab_sessions (tab_uuid, session_data, uncompressed_session_data_size)VALUES (?, ?, ?)"));
  objc_msgSend(v4, "UUIDString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStateData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v27[0] = objc_msgSend(v4, "uncompressedSessionStateDataSize");
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSData * {__strong},unsigned long>(v8, &v11, &v10, v27);

  if (objc_msgSend(v8, "execute") != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _insertTabStateWithData:].cold.1();
    }

  }
  objc_msgSend(v8, "invalidate");

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v26);
}

- (id)_sqliteStatementForTabDeleting
{
  WBSSQLiteStatement *cachedTabDeleteStatement;
  WBSSQLiteStatement *v4;
  WBSSQLiteStatement *v5;

  cachedTabDeleteStatement = self->_cachedTabDeleteStatement;
  if (!cachedTabDeleteStatement)
  {
    v4 = (WBSSQLiteStatement *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("DELETE FROM tabs WHERE uuid = ?"));
    v5 = self->_cachedTabDeleteStatement;
    self->_cachedTabDeleteStatement = v4;

    cachedTabDeleteStatement = self->_cachedTabDeleteStatement;
  }
  return cachedTabDeleteStatement;
}

- (void)_updateBrowserWindowStateWithDictionary:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  SFBrowserStateSQLiteStore *v25;
  int64_t v26;
  id v27[9];

  v27[7] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  MEMORY[0x18D77F264](v27, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  v5 = -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithDictionary:](self, "_saveBrowserWindowStateWithDictionary:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateBrowserWindowUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_arrayForKey:", CFSTR("SafariStateDocuments"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v4, "safari_arrayForKey:", CFSTR("SafariStatePrivateDocuments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    if (objc_msgSend(v8, "count"))
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION")) == 101)
      {
        objc_msgSend(v8, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_141);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = v8;
        }
        v13 = v12;
        v14 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2;
        v23[3] = &unk_1E21E69D0;
        v15 = v6;
        v25 = self;
        v26 = v5;
        v24 = v15;
        -[NSObject enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v23);
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION")) == 101)
        {
          -[NSObject safari_mapAndFilterObjectsUsingBlock:](v13, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_145);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore _tabUUIDsInWindow:](self, "_tabUUIDsInWindow:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v14;
          v21[1] = 3221225472;
          v21[2] = __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2_146;
          v21[3] = &unk_1E21E6A38;
          v18 = v16;
          v22 = v18;
          objc_msgSend(v17, "objectsPassingTest:", v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v14;
          v20[1] = 3221225472;
          v20[2] = __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_3;
          v20[3] = &unk_1E21E6A60;
          v20[4] = self;
          objc_msgSend(v19, "enumerateObjectsUsingBlock:", v20);
          objc_msgSend(v17, "minusSet:", v19);

        }
        else
        {
          v18 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:].cold.1();
          }
        }

      }
      else
      {
        v13 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:].cold.2();
        }
      }

    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v27);

}

SFTabStateData *__69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SFTabStateData *v3;

  v2 = a2;
  v3 = -[SFTabStateData initWithDictionaryRepresentation:]([SFTabStateData alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

void __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "owningBrowserWindowUUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(v4, "setOwningBrowserWindowUUIDString:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v4, "owningBrowserWindowDatabaseID") != *(_QWORD *)(a1 + 48))
    objc_msgSend(v4, "setOwningBrowserWindowDatabaseID:");
  objc_msgSend(*(id *)(a1 + 40), "_updateOrInsertTabStateWithData:", v4);

}

id __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_143(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "UUIDString");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2_146(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sqliteStatementForTabDeleting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindString:atParameterIndex:", v4, 1);
  objc_msgSend(v3, "execute");
  objc_msgSend(v3, "reset");

}

- (void)_updateBrowserWindowWithData:(id)a3 tabs:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[6];
  id v13[7];

  v13[6] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MEMORY[0x18D77F264](v13, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  v8 = -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithData:](self, "_saveBrowserWindowStateWithData:", v6);
  if (v7)
  {
    v9 = v8;
    if (objc_msgSend(v6, "needsQuickUpdate"))
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION")) == 101)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke;
        v12[3] = &unk_1E21E6A88;
        v12[4] = self;
        v12[5] = v9;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION")) != 101)
        {
          v10 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:].cold.1();
          }

        }
      }
      else
      {
        v11 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:].cold.2();
        }

      }
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);

}

void __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v4, "_tabStateDataForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v3, "setOwningBrowserWindowDatabaseID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_insertTabStateWithData:", v3);
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v13[0] = objc_msgSend(v3, "orderIndex");
  objc_msgSend(v3, "owningBrowserWindowUUIDString");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long,NSString * {__strong},long const&,NSString * {__strong}>(v9, 0, CFSTR("UPDATE tabs SET order_index = ?, browser_window_uuid = ?, browser_window_id = ?WHERE uuid = ?"), v13, &v12, (_QWORD *)(a1 + 40), &v11);

  if ((_DWORD)v9 == 101)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cacheUUIDForTabStateData:", v3);
  }
  else
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke_cold_1();
    }

  }
}

- (void)updateBrowserWindowWithData:(id)a3 tabs:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SFBrowserStateSQLiteStore_updateBrowserWindowWithData_tabs___block_invoke;
  block[3] = &unk_1E21E6AB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __62__SFBrowserStateSQLiteStore_updateBrowserWindowWithData_tabs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBrowserWindowWithData:tabs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_tabUUIDsInWindow:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *tabUUIDStrings;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_tabUUIDStrings, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    tabUUIDStrings = self->_tabUUIDStrings;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](tabUUIDStrings, "setObject:forKey:", v7, v4);

  }
  -[NSMutableDictionary objectForKey:](self->_tabUUIDStrings, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_cacheUUIDForTabStateData:(id)a3
{
  NSMutableDictionary *tabUUIDStrings;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  if (!-[SFBrowserStateSQLiteStore _isTabStateCached:](self, "_isTabStateCached:"))
  {
    tabUUIDStrings = self->_tabUUIDStrings;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__SFBrowserStateSQLiteStore__cacheUUIDForTabStateData___block_invoke;
    v10[3] = &unk_1E21E6AD8;
    v5 = v9;
    v11 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tabUUIDStrings, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(v5, "owningBrowserWindowUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserStateSQLiteStore _tabUUIDsInWindow:](self, "_tabUUIDsInWindow:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __55__SFBrowserStateSQLiteStore__cacheUUIDForTabStateData___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "owningBrowserWindowUUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v8))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v11);

      *a4 = 1;
    }
  }

}

- (BOOL)_isTabStateCached:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "owningBrowserWindowUUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserStateSQLiteStore _tabUUIDsInWindow:](self, "_tabUUIDsInWindow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

- (void)_setDatabaseID:(int64_t)a3 browserWindow:(id)a4
{
  NSMutableDictionary *browserWindowDatabaseIDs;
  void *v7;
  id v8;

  v8 = a4;
  browserWindowDatabaseIDs = self->_browserWindowDatabaseIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](browserWindowDatabaseIDs, "setObject:forKey:", v7, v8);

}

- (int64_t)_databaseIDForBrowserWindow:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKey:](self->_browserWindowDatabaseIDs, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)updateBrowserWindowStateWithDictionary:(id)a3 completion:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SFBrowserStateSQLiteStore_updateBrowserWindowStateWithDictionary_completion___block_invoke;
  block[3] = &unk_1E21E3F10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __79__SFBrowserStateSQLiteStore_updateBrowserWindowStateWithDictionary_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateBrowserWindowStateWithDictionary:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_readSavedSessionStateDataForTabWithUUIDString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v11;

  v11 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, CFSTR("SELECT tab_sessions.uncompressed_session_data_size, tab_sessions.session_data FROM tab_sessions WHERE tab_sessions.tab_uuid = ?"), &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intAtIndex:", 0);
    objc_msgSend(v6, "dataAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFTabStateData uncompressedDataWithRawData:uncompressedSize:](SFTabStateData, "uncompressedDataWithRawData:uncompressedSize:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "statement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");
    v9 = 0;
  }

  return v9;
}

- (id)readSavedSessionStateDataForTabWithUUIDString:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SFBrowserStateSQLiteStore_readSavedSessionStateDataForTabWithUUIDString___block_invoke;
  block[3] = &unk_1E21E6918;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__SFBrowserStateSQLiteStore_readSavedSessionStateDataForTabWithUUIDString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_readSavedSessionStateDataForTabWithUUIDString:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)deleteTabStateWithBrowserWindowUUID:(id)a3 andRemoveWindow:(BOOL)a4
{
  id v6;
  uint64_t v7;
  NSObject *databaseQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  BOOL v13;

  v6 = a3;
  v7 = operator new();
  MEMORY[0x18D77F264](v7, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  databaseQueue = self->_databaseQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__SFBrowserStateSQLiteStore_deleteTabStateWithBrowserWindowUUID_andRemoveWindow___block_invoke;
  v10[3] = &unk_1E21E6B00;
  v10[4] = self;
  v11 = v6;
  v13 = a4;
  v12 = v7;
  v9 = v6;
  dispatch_async(databaseQueue, v10);

}

id *__81__SFBrowserStateSQLiteStore_deleteTabStateWithBrowserWindowUUID_andRemoveWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  id *result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_databaseIDForBrowserWindow:", *(_QWORD *)(a1 + 40));
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = objc_alloc(MEMORY[0x1E0D89CC8]);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v3)
  {
    v6 = (void *)objc_msgSend(v4, "initWithDatabase:query:", v5, CFSTR("DELETE FROM browser_windows WHERE id = ?"));
    objc_msgSend(v6, "bindInt64:atParameterIndex:", v2, 1);
    objc_msgSend(v6, "execute");
    objc_msgSend(v6, "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "initWithDatabase:query:", v5, CFSTR("DELETE FROM tabs WHERE browser_window_id = ?"));
    objc_msgSend(v6, "bindInt64:atParameterIndex:", v2, 1);
    objc_msgSend(v6, "execute");
    objc_msgSend(v6, "invalidate");
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  result = *(id **)(a1 + 48);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x18D77F27CLL);
  }
  return result;
}

- (void)updateTabWithTabStateData:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFBrowserStateSQLiteStore_updateTabWithTabStateData___block_invoke;
  v7[3] = &unk_1E21E6778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __55__SFBrowserStateSQLiteStore_updateTabWithTabStateData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "owningBrowserWindowUUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_databaseIDForBrowserWindow:", v3);

  if (v4 != objc_msgSend(*(id *)(a1 + 40), "owningBrowserWindowDatabaseID"))
    objc_msgSend(*(id *)(a1 + 40), "setOwningBrowserWindowDatabaseID:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "_updateOrInsertTabStateWithData:", *(_QWORD *)(a1 + 40));
}

- (void)removeTabWithTabData:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = operator new();
  MEMORY[0x18D77F264](v5, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke;
  block[3] = &unk_1E21E68F0;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(databaseQueue, block);

}

void __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("DELETE FROM tabs WHERE uuid = ?"));
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bindString:atParameterIndex:", v3, 1);

  if (objc_msgSend(v2, "execute") != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke_cold_1();
    }

  }
  objc_msgSend(v2, "invalidate");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "owningBrowserWindowUUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_tabUUIDsInWindow:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  v9 = *(id **)(a1 + 48);
  if (v9)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v9);
    MEMORY[0x18D77F27C]();
  }

}

- (void)deleteSavedStatesForProfileWithIdentifier:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SFBrowserStateSQLiteStore_deleteSavedStatesForProfileWithIdentifier___block_invoke;
  block[3] = &unk_1E21E6778;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(databaseQueue, block);

}

void __71__SFBrowserStateSQLiteStore_deleteSavedStatesForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7[3];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x18D77F264](v7, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("DELETE FROM browser_windows WHERE active_profile_identifier = ?"));
  objc_msgSend(v2, "bindString:atParameterIndex:", *(_QWORD *)(a1 + 40), 1);
  v3 = objc_msgSend(v2, "execute");
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 1024;
      v11 = v3;
      v12 = 2114;
      v13 = v6;
      _os_log_error_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_ERROR, "Failed to delete a profile window: %{public}@ (%d) (Profile: %{public}@)", buf, 0x1Cu);

    }
  }
  objc_msgSend(v2, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "_vacuum");

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
}

- (void)checkPointWriteAheadLog
{
  uint64_t v3;
  NSObject *databaseQueue;
  _QWORD v5[6];

  v3 = operator new();
  MEMORY[0x18D77F264](v3, CFSTR("com.apple.SafariServices.SavingBrowserState"));
  databaseQueue = self->_databaseQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke;
  v5[3] = &unk_1E21E4928;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(databaseQueue, v5);
}

id *__52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id *result;
  uint64_t v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "checkpointWriteAheadLogWithLogFrameCount:checkpointedFrameCount:", (char *)&v7 + 4, &v7) == 0;
  v3 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v9 = HIDWORD(v7);
      v10 = 1024;
      v11 = v7;
      _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_INFO, "Checkpointed write ahead log. Log frame count: %d, checkpointed frame count: %d", buf, 0xEu);
    }
  }
  else
  {
    v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke_cold_1();
    }

  }
  result = *(id **)(a1 + 40);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    return (id *)MEMORY[0x18D77F27C]();
  }
  return result;
}

- (void)setSecureDeleteEnabled:(BOOL)a3
{
  NSObject *databaseQueue;
  _QWORD v4[5];
  BOOL v5;

  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SFBrowserStateSQLiteStore_setSecureDeleteEnabled___block_invoke;
  v4[3] = &unk_1E21E6B28;
  v5 = a3;
  v4[4] = self;
  dispatch_async(databaseQueue, v4);
}

void __52__SFBrowserStateSQLiteStore_setSecureDeleteEnabled___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  __CFString *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
    v4 = CFSTR("PRAGMA secure_delete = ON");
  else
    v4 = CFSTR("PRAGMA secure_delete = OFF");
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, v4);
  if (v5 != 100)
  {
    v6 = v5;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastErrorMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(unsigned __int8 *)(a1 + 40);
      v10 = 138543874;
      v11 = v8;
      v12 = 1024;
      v13 = v6;
      v14 = 1024;
      v15 = v9;
      _os_log_error_impl(&dword_18B7B2000, v7, OS_LOG_TYPE_ERROR, "Failed to toggle secure_delete pragma: %{public}@ (%d) (%d)", (uint8_t *)&v10, 0x18u);

    }
  }
}

- (void)_vacuum
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to vacuum database: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)regenerateTabUUIDsForDeviceRestoration
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFBrowserStateSQLiteStore_regenerateTabUUIDsForDeviceRestoration__block_invoke;
  block[3] = &unk_1E21E4950;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __67__SFBrowserStateSQLiteStore_regenerateTabUUIDsForDeviceRestoration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_regenerateTabUUIDsForDeviceRestoration");
}

- (void)_regenerateTabUUIDsForDeviceRestoration
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to regenerate tab UUIDs: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTabDeleteStatement, 0);
  objc_storeStrong((id *)&self->_browserWindowDatabaseIDs, 0);
  objc_storeStrong((id *)&self->_tabUUIDStrings, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_checkDatabaseIntegrity
{
  OUTLINED_FUNCTION_5(&dword_18B7B2000, a2, a3, "Failed database integrity check: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
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

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a2;
  v5 = 1024;
  v6 = 8;
  v7 = 2114;
  v8 = v3;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "BrowserState SQLite schema version (%d) does not match our supported schema version (%d) in store at %{public}@", (uint8_t *)v4, 0x18u);
  OUTLINED_FUNCTION_8();
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18B7B2000, a2, a3, "Failed to enable write-ahead logging on BrowserState SQLite store at %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18B7B2000, a2, a3, "Failed to open tab state SQLite store at %{public}@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_migrateFromLegacyPlistWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18B7B2000, a2, a3, "Failed to read content from legacy SuspendState.plist at %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_migrateFromLegacyPlistWithPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_18B7B2000, a2, a3, "Content is corrupted in SuspendState.plist at %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
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

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_18B7B2000, v0, v1, "Failed to migrate the database to schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_18B7B2000, v0, v1, "Not migrating to an unsupported schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_18B7B2000, v0, v1, "Failed to commit the transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_migrateToSchemaVersion:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_18B7B2000, a1, a3, "Safari appeared to crash when migrating from V2 to V3, skipping migrating this time", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_migrateToSchemaVersion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_18B7B2000, v0, v1, "Failed to start a transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_18B7B2000, a1, a3, "Failed to roll back transaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
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
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to add uncompressed_session_data_size column to tabs table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_migrateToSchemaVersion_3
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to drop index in tabs table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
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
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to drop index in tab_sessions table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
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
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to add tab_group_uuid column: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
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
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to add profile_uuid column: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_migrateToSchemaVersion_8
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to add active_profile_identifier column: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to drop tab_sessions table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_createTableForTabSession
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to create the tab_sessions table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_createTableForTabs
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to create the tabs table when removing session column: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
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
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to create the browser_windows table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
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
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to add scene_id column to browser_windows table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_mergeAllWindowsIfNeeded
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to reset scene_id column: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Merge all windows: failed to commit transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Merge all windows: failed to roll back transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Merge all windows: failed to begin transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_removeSavedSessionStateDataForTabsWithUUIDStrings:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to remove saved session state data for Recently Closed Tab from BrowserState.db: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_saveBrowserWindowStateWithData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to insert browser window with UUID: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_saveBrowserWindowStateWithData:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to update browser window with ID: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_insertTabStateWithData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to insert a tab session data into the tab_sessions table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_insertTabStateWithData:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to insert a tab into the tabs table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_updateBrowserWindowStateWithDictionary:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to commit a transaction while updating tabs: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

- (void)_updateBrowserWindowStateWithDictionary:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to start a transaction while updating tabs: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

void __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to update a tab: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

void __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to delete a tab: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

void __52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_2(&dword_18B7B2000, "Failed to checkpoint write ahead log: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_2();
}

@end
