@implementation ATXInformationStore

void __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "widgetUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetUniqueId", v5);

  objc_msgSend(*(id *)(a1 + 32), "extensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v6);

  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", v7);

  objc_msgSend(v4, "bindNamedParam:toInteger:", ":size", objc_msgSend(*(id *)(a1 + 32), "size"));
  objc_msgSend(*(id *)(a1 + 32), "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":date", (uint64_t)v9);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":engagementType", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "appBundleId");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":containerBundleIdentifier", v10);

}

- (BOOL)updateMostRecentSignificantDwellOfWidget:(id)a3 date:(id)a4
{
  return -[ATXInformationStore addEngagementRecordForWidget:date:engagementType:](self, "addEngagementRecordForWidget:date:engagementType:", a3, a4, 2);
}

- (BOOL)addEngagementRecordForWidget:(id)a3 date:(id)a4 engagementType:(int64_t)a5
{
  id v8;
  id v9;
  _PASSqliteDatabase *db;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke;
  v16[3] = &unk_1E4D5BA30;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = a5;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2;
  v15[3] = &unk_1E4D5BB60;
  v15[4] = &v20;
  v15[5] = a5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO widgetEngagements (widgetUniqueId, extensionBundleId, widgetKind, size, intentHash, date, engagementType, containerBundleIdentifier) VALUES (:widgetUniqueId, :extensionBundleId, :widgetKind, :size, :intentHash, :date, :engagementType, :containerBundleIdentifier)"), v16, 0, v15);
  LOBYTE(a5) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a5;
}

+ (ATXInformationStore)sharedInstance
{
  if (sharedInstance__pasOnceToken2_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_1, &__block_literal_global_71);
  return (ATXInformationStore *)(id)sharedInstance__pasExprOnceResult_12;
}

void __37__ATXInformationStore_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_12;
  sharedInstance__pasExprOnceResult_12 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXInformationStore)init
{
  void *v3;
  void *v4;
  ATXInformationStore *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXInfoSuggestionStore.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("InfoEngineCachedSuggestions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXInformationStore initWithDatabasePath:cachedSuggestionsPath:](self, "initWithDatabasePath:cachedSuggestionsPath:", v3, v4);

  return v5;
}

- (ATXInformationStore)initWithDatabasePath:(id)a3 cachedSuggestionsPath:(id)a4
{
  id v6;
  id v7;
  ATXInformationStore *v8;
  uint64_t v9;
  NSString *databasePath;
  uint64_t v11;
  NSString *cachedSuggestionsPath;
  ATXInformationStore *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXInformationStore;
  v8 = -[ATXInformationStore init](&v15, sel_init);
  if (!v8)
    goto LABEL_3;
  v9 = objc_msgSend(v6, "copy");
  databasePath = v8->_databasePath;
  v8->_databasePath = (NSString *)v9;

  v11 = objc_msgSend(v7, "copy");
  cachedSuggestionsPath = v8->_cachedSuggestionsPath;
  v8->_cachedSuggestionsPath = (NSString *)v11;

  if (!-[ATXInformationStore _openDatabase](v8, "_openDatabase"))
    v13 = 0;
  else
LABEL_3:
    v13 = v8;

  return v13;
}

- (void)dealloc
{
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v4;
  objc_super v5;

  db = self->_db;
  if (db)
  {
    -[_PASSqliteDatabase closePermanently](db, "closePermanently");
    v4 = self->_db;
    self->_db = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationStore;
  -[ATXInformationStore dealloc](&v5, sel_dealloc);
}

- (BOOL)_openDatabase
{
  _BOOL4 v3;
  NSString **p_databasePath;
  _PASSqliteDatabase *v5;
  _PASSqliteDatabase *db;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[ATXInformationStore _handleCorruptionIfNeeded](self, "_handleCorruptionIfNeeded");
  if (v3)
  {
    p_databasePath = &self->_databasePath;
    -[ATXInformationStore _openSqliteDatabaseAtPath:](self, "_openSqliteDatabaseAtPath:", self->_databasePath);
    v5 = (_PASSqliteDatabase *)objc_claimAutoreleasedReturnValue();
    db = self->_db;
    self->_db = v5;

    if (self->_db)
    {
      if (-[ATXInformationStore _configureDatabase](self, "_configureDatabase"))
      {
        if (-[ATXInformationStore _migrateDatabaseIfNeeded](self, "_migrateDatabaseIfNeeded"))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        __atxlog_handle_gi();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ATXInformationStore _openDatabase].cold.2();
      }
      else
      {
        __atxlog_handle_gi();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ATXInformationStore _openDatabase].cold.3();
      }
    }
    else
    {
      __atxlog_handle_gi();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ATXInformationStore _openDatabase].cold.1((uint64_t)p_databasePath, v7, v8, v9, v10, v11, v12, v13);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)close
{
  _PASSqliteDatabase *db;

  -[_PASSqliteDatabase closePermanently](self->_db, "closePermanently");
  db = self->_db;
  self->_db = 0;

}

- (BOOL)_handleCorruptionIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _PASSqliteDatabase *db;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D81620], "corruptionMarkerPathForPath:", self->_databasePath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    __atxlog_handle_gi();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationStore was corrupted. Truncate and restart", buf, 2u);
    }

    db = self->_db;
    if (db)
      -[_PASSqliteDatabase closePermanently](db, "closePermanently");
    objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", self->_databasePath);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v8, "removeItemAtPath:error:", v3, &v13);
    v10 = v13;

    if ((v9 & 1) == 0)
    {
      __atxlog_handle_gi();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ATXInformationStore _handleCorruptionIfNeeded].cold.1((uint64_t)v3);

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)_openSqliteDatabaseAtPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D81620], "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", v3, 3, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    __atxlog_handle_gi();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXInformationStore _openSqliteDatabaseAtPath:].cold.1((uint64_t)v3);

  }
  return v4;
}

- (BOOL)_configureDatabase
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_1E4DC2A50, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(&unk_1E4DC2A50);
      v7 = -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), 0, 0, &__block_literal_global_24_1);
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(&unk_1E4DC2A50, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

uint64_t __41__ATXInformationStore__configureDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__ATXInformationStore__configureDatabase__block_invoke_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)_migrateDatabaseIfNeeded
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D81578]);
  v10[0] = self;
  v4 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithMigrationObjects:", v5);

  switch(objc_msgSend(v6, "migrateDatabases"))
  {
    case 0u:
      __atxlog_handle_gi();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.1();
      goto LABEL_8;
    case 1u:
      goto LABEL_18;
    case 2u:
      __atxlog_handle_gi();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.2();
      goto LABEL_15;
    case 3u:
      __atxlog_handle_gi();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.3();
LABEL_8:

      goto LABEL_17;
    case 4u:
      __atxlog_handle_gi();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.4();
      goto LABEL_15;
    case 5u:
      __atxlog_handle_gi();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.5();
      goto LABEL_15;
    case 6u:
      __atxlog_handle_gi();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.6();
LABEL_15:

      break;
    default:
      break;
  }
  -[_PASSqliteDatabase placeCorruptionMarker](self->_db, "placeCorruptionMarker");
LABEL_17:
  v4 = 0;
LABEL_18:

  return v4;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  _QWORD v3[28];
  _QWORD v4[29];

  v4[28] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E4DC1788;
  v3[1] = &unk_1E4DC17A0;
  v4[0] = &unk_1E4DC2A68;
  v4[1] = &unk_1E4DC2A80;
  v3[2] = &unk_1E4DC17B8;
  v3[3] = &unk_1E4DC17D0;
  v4[2] = &unk_1E4DC2A98;
  v4[3] = &unk_1E4DC2AB0;
  v3[4] = &unk_1E4DC17E8;
  v3[5] = &unk_1E4DC1800;
  v4[4] = &unk_1E4DC2AC8;
  v4[5] = &unk_1E4DC2AE0;
  v3[6] = &unk_1E4DC1818;
  v3[7] = &unk_1E4DC1830;
  v4[6] = &unk_1E4DC2AF8;
  v4[7] = &unk_1E4DC2B10;
  v3[8] = &unk_1E4DC1848;
  v3[9] = &unk_1E4DC1860;
  v4[8] = &unk_1E4DC2B28;
  v4[9] = &unk_1E4DC2B40;
  v3[10] = &unk_1E4DC1878;
  v3[11] = &unk_1E4DC1890;
  v4[10] = &unk_1E4DC2B58;
  v4[11] = &unk_1E4DC2B70;
  v3[12] = &unk_1E4DC18A8;
  v3[13] = &unk_1E4DC18C0;
  v4[12] = &unk_1E4DC2B88;
  v4[13] = &unk_1E4DC2BA0;
  v3[14] = &unk_1E4DC18D8;
  v3[15] = &unk_1E4DC18F0;
  v4[14] = &unk_1E4DC2BB8;
  v4[15] = &unk_1E4DC2BD0;
  v3[16] = &unk_1E4DC1908;
  v3[17] = &unk_1E4DC1920;
  v4[16] = &unk_1E4DC2BE8;
  v4[17] = &unk_1E4DC2C00;
  v3[18] = &unk_1E4DC1938;
  v3[19] = &unk_1E4DC1950;
  v4[18] = &unk_1E4DC2C18;
  v4[19] = &unk_1E4DC2C30;
  v3[20] = &unk_1E4DC1968;
  v3[21] = &unk_1E4DC1980;
  v4[20] = &unk_1E4DC2C48;
  v4[21] = &unk_1E4DC2C60;
  v3[22] = &unk_1E4DC1998;
  v3[23] = &unk_1E4DC19B0;
  v4[22] = &unk_1E4DC2C78;
  v4[23] = &unk_1E4DC2C90;
  v3[24] = &unk_1E4DC19C8;
  v3[25] = &unk_1E4DC19E0;
  v4[24] = &unk_1E4DC2CA8;
  v4[25] = &unk_1E4DC2CC0;
  v3[26] = &unk_1E4DC19F8;
  v3[27] = &unk_1E4DC1A10;
  v4[26] = &unk_1E4DC2CD8;
  v4[27] = &unk_1E4DC2CF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 28);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)readCachedSuggestions
{
  void *v3;
  NSString **p_cachedSuggestionsPath;
  NSString *cachedSuggestionsPath;
  int v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  int buf;
  uint8_t buf_4[8];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  cachedSuggestionsPath = self->_cachedSuggestionsPath;
  p_cachedSuggestionsPath = &self->_cachedSuggestionsPath;
  v6 = open(-[NSString UTF8String](cachedSuggestionsPath, "UTF8String"), 0);
  if (v6 == -1)
  {
    v8 = *__error() == 2;
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *p_cachedSuggestionsPath;
        buf = 138412290;
        *(_QWORD *)buf_4 = v11;
        _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXInformationStore: No info engine cache file found at path %@.", (uint8_t *)&buf, 0xCu);
      }

      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXInformationStore readCachedSuggestions].cold.1();

      v12 = 0;
    }
  }
  else
  {
    v7 = v6;
    v21 = 0;
    ATXCacheFileRead();
    if ((v7 & 0x80000000) == 0)
      close(v7);
    __atxlog_handle_gi();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXInformationStore readCachedSuggestions].cold.2((uint64_t)p_cachedSuggestionsPath, v13, v14, v15, v16, v17, v18, v19);
    v12 = 0;

  }
  objc_autoreleasePoolPop(v3);
  return v12;
}

void __44__ATXInformationStore_readCachedSuggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v5);

  objc_msgSend(*(id *)(a1 + 32), "sourceId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":sourceId", v6);

}

uint64_t __44__ATXInformationStore_readCachedSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  unsigned __int8 *v6;

  objc_msgSend(a2, "getNSDataForColumnName:table:", "data", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81150]), "initWithData:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
  }
  else
  {
    __atxlog_handle_gi();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __44__ATXInformationStore_readCachedSuggestions__block_invoke_2_cold_1();

  }
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v6;
}

uint64_t __44__ATXInformationStore_readCachedSuggestions__block_invoke_236(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __44__ATXInformationStore_readCachedSuggestions__block_invoke_236_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (BOOL)writeCacheWithNewSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  int v18;
  int v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "suggestionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSuggestionId:", v13);

        objc_msgSend(v11, "sourceIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSourceId:", v14);

        objc_msgSend(v5, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setEntries:", v5);
  objc_msgSend(v15, "encodeAsProto");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    __atxlog_handle_gi();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ATXInformationStore writeCacheWithNewSuggestions:].cold.1();

    goto LABEL_18;
  }
  v17 = -[NSString UTF8String](self->_cachedSuggestionsPath, "UTF8String");
  v18 = open(v17, 514, 384, context, (_QWORD)v25);
  if (v18 == -1)
  {
    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ATXInformationStore writeCacheWithNewSuggestions:].cold.2();

LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  v19 = v18;
  v20 = ATXCacheFileWrite();
  if ((v19 & 0x80000000) == 0)
    close(v19);
LABEL_19:

  objc_autoreleasePoolPop(context);
  return v20;
}

- (id)readAllInfoSuggestions
{
  _PASSqliteDatabase *db;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = (id)objc_opt_new();
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATXInformationStore_readAllInfoSuggestions__block_invoke;
  v7[3] = &unk_1E4D5B4B0;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_240;
  v6[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestionId, sourceId, data FROM suggestions"), 0, v7, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __45__ATXInformationStore_readAllInfoSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D81150]);
  objc_msgSend(v3, "getNSDataForColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
  }
  else
  {
    __atxlog_handle_gi();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_cold_1();

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_240(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_240_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)readCurrentlyRelevantSuggestions
{
  _PASSqliteDatabase *db;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = (id)objc_opt_new();
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2;
  v7[3] = &unk_1E4D5B4B0;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_246;
  v6[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestionId, sourceId, data FROM suggestions WHERE startDate <= :now AND :now < endDate ORDER BY startDate"), &__block_literal_global_243, v7, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":now", (uint64_t)v3);

}

uint64_t __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D81150]);
  objc_msgSend(v3, "getNSDataForColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
  }
  else
  {
    __atxlog_handle_gi();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1();

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_246(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_240_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)readAllInfoSuggestionsWithSourceIdentifier:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = (id)objc_opt_new();
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke;
  v12[3] = &unk_1E4D5B438;
  v7 = v4;
  v13 = v7;
  v10[4] = &v14;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_2;
  v11[3] = &unk_1E4D5B4B0;
  v11[4] = &v14;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_249;
  v10[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestionId, sourceId, data FROM suggestions WHERE sourceId = :sourceId"), v12, v11, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":sourceId", *(_QWORD *)(a1 + 32));
}

uint64_t __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D81150]);
  objc_msgSend(v3, "getNSDataForColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
  }
  else
  {
    __atxlog_handle_gi();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1();

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_240_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)latestInfoSuggestionRelevantNowForSourceId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v14 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_253;
  v10[3] = &unk_1E4D5B518;
  v7 = v14;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestionId, sourceId, data from suggestions WHERE sourceId = :sourceId AND startDate < :nowInSecondsSinceReferenceDate AND endDate > :nowInSecondsSinceReferenceDate ORDER BY startDate DESC LIMIT 1"), v13, v12, v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":sourceId", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":nowInSecondsSinceReferenceDate", (uint64_t)v5);

}

uint64_t __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D81150]);
  objc_msgSend(v3, "getNSDataForColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  }
  else
  {
    __atxlog_handle_gi();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1();

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v8;
}

uint64_t __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_253(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_253_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)criterionOfInfoSuggestionWithIdentifier:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke;
  v11[3] = &unk_1E4D5B438;
  v7 = v4;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_2;
  v10[3] = &unk_1E4D5B4B0;
  v10[4] = &v13;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT criterion FROM suggestions WHERE suggestionId = :suggestionId"), v11, v10, &__block_literal_global_256);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":suggestionId", *(_QWORD *)(a1 + 32));
}

uint64_t __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81780];
}

uint64_t __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)earliestFutureSuggestionChangeDate
{
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _PASSqliteDatabase *v13;
  id v14;
  double *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = (uint64_t)v3;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v29 = v7;
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v24[4] = &v26;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke;
  v25[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v25[4] = v4;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2;
  v24[3] = &unk_1E4D5B4B0;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT startDate FROM suggestions WHERE startDate > :now ORDER BY startDate LIMIT 1"), v25, v24, &__block_literal_global_259);
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  v23 = v12;
  v13 = self->_db;
  v19[1] = 3221225472;
  v19[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_262;
  v19[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v19[4] = v4;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2_263;
  v18[3] = &unk_1E4D5B4B0;
  v18[4] = &v20;
  v19[0] = v9;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v13, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT endDate FROM suggestions WHERE endDate > :now ORDER BY endDate LIMIT 1"), v19, v18, &__block_literal_global_265);
  if (v27[3] >= v21[3])
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D68]);
    v15 = v21;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D68]);
    v15 = v27;
  }
  v16 = (void *)objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:", v15[3]);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v16;
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":now", *(_QWORD *)(a1 + 32));
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2(uint64_t a1, void *a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (double)objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81780];
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_262(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":now", *(_QWORD *)(a1 + 32));
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2_263(uint64_t a1, void *a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (double)objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81780];
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_264(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_264_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)latestUpdateDateForSourceId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v14 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3;
  v10[3] = &unk_1E4D5B518;
  v7 = v14;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT lastUpdated FROM suggestions WHERE sourceId = :sourceId ORDER BY lastUpdated DESC LIMIT 1"), v13, v12, v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":sourceId", *(_QWORD *)(a1 + 32));
}

uint64_t __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isColumnNull:", 0) & 1) == 0)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v7;
}

uint64_t __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (unint64_t)numberOfInfoSuggestionsForSourceId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v14 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3;
  v10[3] = &unk_1E4D5B518;
  v7 = v14;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM suggestions WHERE sourceId = :sourceId"), v13, v12, v10);
  v8 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":sourceId", *(_QWORD *)(a1 + 32));
}

uint64_t __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (unint64_t)numberOfInfoSuggestionsForAppBundleIdentifier:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v14 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3;
  v10[3] = &unk_1E4D5B518;
  v7 = v14;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM suggestions WHERE appBundleIdentifier = :appBundleIdentifier"), v13, v12, v10);
  v8 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":appBundleIdentifier", *(_QWORD *)(a1 + 32));
}

uint64_t __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)writeInfoSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _PASSqliteDatabase *db;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0D81630];
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__ATXInformationStore_writeInfoSuggestions___block_invoke;
    v10[3] = &unk_1E4D5B5E8;
    v11 = v4;
    v8 = (objc_msgSend(v6, "writeTransactionWithHandle:failableBlock:", db, v10) & 1) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __44__ATXInformationStore_writeInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "db");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[5] = &v20;
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __44__ATXInformationStore_writeInfoSuggestions___block_invoke_2;
        v15[3] = &unk_1E4D5B438;
        v15[4] = v9;
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3;
        v14[3] = &unk_1E4D5B5C0;
        v14[4] = v9;
        objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO suggestions (suggestionId, sourceId, data, criterion, appBundleIdentifier, widgetBundleIdentifier, widgetKind, layouts, intentIdentifier, startDate, endDate, lastUpdated, clientModelId, relevanceScore) VALUES (:suggestionId, :sourceId, :data, :criterion, :appBundleIdentifier, :widgetBundleIdentifier, :widgetKind, :layouts, :intentIdentifier, :startDate, :endDate, :lastUpdated, :clientModelId, :relevanceScore)"), v15, 0, v14);

        if (*((_BYTE *)v21 + 24))
        {

          v11 = (unsigned __int8 *)MEMORY[0x1E0D81680];
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

  v11 = (unsigned __int8 *)MEMORY[0x1E0D81678];
LABEL_11:
  v12 = *v11;
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __44__ATXInformationStore_writeInfoSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":suggestionId", v3);

  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":sourceId", v4);

  objc_msgSend(*(id *)(a1 + 32), "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSData:", ":data", v5);

  objc_msgSend(*(id *)(a1 + 32), "criterion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":criterion", v6);

  objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":appBundleIdentifier", v7);

  objc_msgSend(*(id *)(a1 + 32), "widgetBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":widgetBundleIdentifier", v8);

  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":widgetKind", v9);

  objc_msgSend(*(id *)(a1 + 32), "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":clientModelId", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(*(id *)(a1 + 32), "layouts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":layouts", v11);

  objc_msgSend(*(id *)(a1 + 32), "intent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":intentIdentifier", objc_msgSend(v12, "atx_indexingHash"));

  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":startDate", (uint64_t)v14);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":endDate", (uint64_t)v16);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":lastUpdated", (uint64_t)v17);
  objc_msgSend(*(id *)(a1 + 32), "relevanceScore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "relevanceScore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":relevanceScore");

  }
  else
  {
    objc_msgSend(v20, "bindNamedParamToNull:", ":relevanceScore");
  }

}

uint64_t __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)updateEndDateForInfoSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _PASSqliteDatabase *db;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0D81630];
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke;
    v10[3] = &unk_1E4D5B5E8;
    v11 = v4;
    v8 = (objc_msgSend(v6, "writeTransactionWithHandle:failableBlock:", db, v10) & 1) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "db");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[5] = &v20;
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_2;
        v15[3] = &unk_1E4D5B438;
        v15[4] = v9;
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3;
        v14[3] = &unk_1E4D5B5C0;
        v14[4] = v9;
        objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE suggestions SET data=:data, endDate=:endDate, lastUpdated=:lastUpdated WHERE suggestionId=:suggestionId"), v15, 0, v14);

        if (*((_BYTE *)v21 + 24))
        {

          v11 = (unsigned __int8 *)MEMORY[0x1E0D81680];
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

  v11 = (unsigned __int8 *)MEMORY[0x1E0D81678];
LABEL_11:
  v12 = *v11;
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "suggestionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":suggestionId", v4);

  objc_msgSend(*(id *)(a1 + 32), "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSData:", ":data", v5);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":endDate", (uint64_t)v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":lastUpdated", (uint64_t)v8);

}

uint64_t __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)atomicallyDeleteInfoSuggestions:(id)a3 insertInfoSuggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PASSqliteDatabase *db;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x1E0D81630];
    db = self->_db;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke;
    v12[3] = &unk_1E4D5B610;
    v13 = v6;
    v14 = v7;
    v10 = (objc_msgSend(v8, "writeTransactionWithHandle:failableBlock:", db, v12) & 1) == 0;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  id v20;
  _QWORD v21[6];
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[6];
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    v6 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v20, "db");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v27[5] = &v33;
        v28[0] = v6;
        v28[1] = 3221225472;
        v28[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2;
        v28[3] = &unk_1E4D5B438;
        v28[4] = v8;
        v27[0] = v6;
        v27[1] = 3221225472;
        v27[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3;
        v27[3] = &unk_1E4D5B5C0;
        v27[4] = v8;
        objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE suggestionId = :suggestionId AND sourceId = :sourceId"), v28, 0, v27);

        if (*((_BYTE *)v34 + 24))
        {

LABEL_20:
          v17 = (unsigned __int8 *)MEMORY[0x1E0D81680];
          goto LABEL_21;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v4)
        continue;
      break;
    }
  }

  v26 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  v10 = *(id *)(a1 + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v24;
    v13 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v20, "db");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[5] = &v33;
        v22[0] = v13;
        v22[1] = 3221225472;
        v22[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_295;
        v22[3] = &unk_1E4D5B438;
        v22[4] = v15;
        v21[0] = v13;
        v21[1] = 3221225472;
        v21[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_296;
        v21[3] = &unk_1E4D5B5C0;
        v21[4] = v15;
        objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO suggestions (suggestionId, sourceId, data, criterion, appBundleIdentifier, widgetBundleIdentifier, widgetKind, layouts, intentIdentifier, startDate, endDate, lastUpdated, clientModelId, relevanceScore) VALUES (:suggestionId, :sourceId, :data, :criterion, :appBundleIdentifier, :widgetBundleIdentifier, :widgetKind, :layouts, :intentIdentifier, :startDate, :endDate, :lastUpdated, :clientModelId, :relevanceScore)"), v22, 0, v21);

        if (*((_BYTE *)v34 + 24))
        {

          goto LABEL_20;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      if (v11)
        continue;
      break;
    }
  }

  v17 = (unsigned __int8 *)MEMORY[0x1E0D81678];
LABEL_21:
  v18 = *v17;
  _Block_object_dispose(&v33, 8);

  return v18;
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "suggestionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v5);

  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":sourceId", v6);

}

uint64_t __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_295(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":suggestionId", v3);

  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":sourceId", v4);

  objc_msgSend(*(id *)(a1 + 32), "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSData:", ":data", v5);

  objc_msgSend(*(id *)(a1 + 32), "criterion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":criterion", v6);

  objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":appBundleIdentifier", v7);

  objc_msgSend(*(id *)(a1 + 32), "widgetBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":widgetBundleIdentifier", v8);

  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":widgetKind", v9);

  objc_msgSend(*(id *)(a1 + 32), "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":clientModelId", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(*(id *)(a1 + 32), "layouts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":layouts", v11);

  objc_msgSend(*(id *)(a1 + 32), "intent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":intentIdentifier", objc_msgSend(v12, "atx_indexingHash"));

  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":startDate", (uint64_t)v14);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":endDate", (uint64_t)v16);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":lastUpdated", (uint64_t)v17);
  objc_msgSend(*(id *)(a1 + 32), "relevanceScore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "relevanceScore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":relevanceScore");

  }
  else
  {
    objc_msgSend(v20, "bindNamedParamToNull:", ":relevanceScore");
  }

}

uint64_t __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_296(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_296_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)deleteInfoSuggestion:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    db = self->_db;
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__ATXInformationStore_deleteInfoSuggestion___block_invoke;
    v13[3] = &unk_1E4D5B438;
    v14 = v4;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2;
    v10[3] = &unk_1E4D5B5C0;
    v11 = v14;
    v12 = &v15;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE suggestionId = :suggestionId AND sourceId = :sourceId"), v13, 0, v10);
    v8 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __44__ATXInformationStore_deleteInfoSuggestion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "suggestionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v5);

  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":sourceId", v6);

}

uint64_t __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)deleteAllInfoSuggestionsWithSourceIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__15;
    v22 = __Block_byref_object_dispose__15;
    v23 = 0;
    db = self->_db;
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke;
    v16[3] = &unk_1E4D5B438;
    v17 = v6;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2;
    v12[3] = &unk_1E4D5B638;
    v13 = v17;
    v14 = &v24;
    v15 = &v18;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE sourceId = :sourceId"), v16, 0, v12);
    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);
    v10 = *((_BYTE *)v25 + 24) != 0;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":sourceId", *(_QWORD *)(a1 + 32));
}

uint64_t __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

- (id)deleteExpiredSuggestions
{
  _PASSqliteDatabase *db;
  id v4;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  v14 = (id)objc_opt_new();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__15;
  v7[4] = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke;
  v6[3] = &unk_1E4D5B6C8;
  v6[4] = v7;
  v6[5] = &v9;
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:failableBlock:", db, v6);
  v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v6 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v10[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_3;
  v10[3] = &unk_1E4D5B4B0;
  v11[1] = 3221225472;
  v11[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2;
  v11[3] = &unk_1E4D5B660;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[4] = v6;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestionId, endDate FROM suggestions WHERE endDate <= :now"), v11, v10, &__block_literal_global_304);

  objc_msgSend(v3, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_307;
  v9[3] = &unk_1E4D5B660;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE endDate <= :now"), v9, 0, &__block_literal_global_309);

  return *MEMORY[0x1E0D81678];
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":now", (uint64_t)v3);

}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "endDate", 0);
  v5 = (void *)MEMORY[0x1E0D81238];
  objc_msgSend(v3, "getNSStringForColumnName:table:", "suggestionId", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "outcomeWithSuggestionId:timestamp:abuseControlOutcome:", v6, 21, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_307(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":now", (uint64_t)v3);

}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_308(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_308_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)deleteAllSuggestionsForSourceId:(id)a3 excludingSuggestionId:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke;
  v17[3] = &unk_1E4D5B6F0;
  v18 = v6;
  v19 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2;
  v13[3] = &unk_1E4D5B718;
  v10 = v18;
  v14 = v10;
  v11 = v19;
  v15 = v11;
  v16 = &v20;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE sourceId = :sourceId AND suggestionId <> :excludedSuggestionId"), v17, 0, v13);
  LOBYTE(v6) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v6;
}

void __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":sourceId", v3);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "bindNamedParam:toNSString:", ":excludedSuggestionId");
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":excludedSuggestionId");

}

uint64_t __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)recordSuggestionPassedTimelineFiltersForTheFirstTime:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke;
  v12[3] = &unk_1E4D5B438;
  v13 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2;
  v9[3] = &unk_1E4D5B5C0;
  v7 = v13;
  v10 = v7;
  v11 = &v14;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE suggestions SET firstPassOfTimelineFilters = :firstPassOfTimelineFilters WHERE suggestionId = :suggestionId AND sourceId = :sourceId"), v12, 0, v9);
  LOBYTE(db) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)db;
}

void __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":firstPassOfTimelineFilters", (uint64_t)v5);
  objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v6);

  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":sourceId", v7);

}

uint64_t __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)firstTimeAtWhichSuggestionPassedTimelineFilters:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v14 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3;
  v10[3] = &unk_1E4D5B518;
  v7 = v14;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT firstPassOfTimelineFilters FROM suggestions WHERE suggestionId = :suggestionId AND sourceId = :sourceId"), v13, v12, v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "suggestionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v5);

  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":sourceId", v6);

}

uint64_t __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isNullForColumnName:table:", "firstPassOfTimelineFilters", 0) & 1) == 0)
  {
    v4 = (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "firstPassOfTimelineFilters", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)insertOrIgnoreProactiveStackRotationRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  _PASSqliteDatabase *db;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  id v27;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  objc_msgSend(v4, "intent");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  v7 = (void *)MEMORY[0x1A85A4F90]();
  v8 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v4, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v27);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v27;

  objc_autoreleasePoolPop(v7);
  if (v10)
  {
    __atxlog_handle_gi();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXInformationStore insertOrIgnoreProactiveStackRotationRecord:].cold.1(v4);

    v12 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    db = self->_db;
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke;
    v20[3] = &unk_1E4D5B6F0;
    v21 = v4;
    v6 = v6;
    v22 = v6;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2;
    v17[3] = &unk_1E4D5B5C0;
    v18 = v21;
    v19 = &v23;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO proactiveStackRotations (suggestionId, criterion, widgetBundleId, widgetKind, intentHash, intent, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId) VALUES (:suggestionId, :criterion, :widgetBundleId, :widgetKind, :intentHash, :intent, :isStalenessRotation, :rotationTimestamp, :relevancyDurationLimit, :coolDownTimeInterval, :clientModelId)"), v20, 0, v17);
    v15 = (id)objc_opt_self();
    v12 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }

  return v12;
}

void __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "infoSuggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v5);

  objc_msgSend(*(id *)(a1 + 32), "criterion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":criterion", v6);

  objc_msgSend(*(id *)(a1 + 32), "extensionBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetBundleId", v7);

  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", v8);

  objc_msgSend(*(id *)(a1 + 32), "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v9, "atx_indexingHash"));

  objc_msgSend(v4, "bindNamedParam:toNSData:", ":intent", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":isStalenessRotation", objc_msgSend(*(id *)(a1 + 32), "isStalenessRotation"));
  objc_msgSend(*(id *)(a1 + 32), "rotationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rotationTimestamp", (uint64_t)v11);

  objc_msgSend(*(id *)(a1 + 32), "durationLimit");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":relevancyDurationLimit", (uint64_t)v12);
  objc_msgSend(*(id *)(a1 + 32), "coolDownInterval");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":coolDownTimeInterval", (uint64_t)v13);
  objc_msgSend(*(id *)(a1 + 32), "clientModelId");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":clientModelId", v14);

}

uint64_t __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)mostRecentRotationRecordForWidget:(id)a3 kind:(id)a4 intent:(id)a5 considerStalenessRotation:(BOOL)a6 filterByClientModelId:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  const __CFString *v16;
  _PASSqliteDatabase *db;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__15;
  v41 = __Block_byref_object_dispose__15;
  v42 = 0;
  if (v8)
    v16 = CFSTR("SELECT suggestionId, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash ORDER BY rotationTimestamp DESC LIMIT 1");
  else
    v16 = CFSTR("SELECT suggestionId, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND isStalenessRotation = 0 ORDER BY rotationTimestamp DESC LIMIT 1");
  db = self->_db;
  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke;
  v33[3] = &unk_1E4D5B740;
  v34 = v12;
  v35 = v13;
  v36 = v14;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_2;
  v27[3] = &unk_1E4D5B768;
  v19 = v15;
  v28 = v19;
  v32 = &v37;
  v29 = v34;
  v20 = v35;
  v30 = v20;
  v21 = v36;
  v31 = v21;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3;
  v25[3] = &unk_1E4D5B518;
  v22 = v29;
  v26 = v22;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v16, v33, v27, v25);
  v23 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  return v23;
}

void __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));

}

uint64_t __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  ATXStackRotationRecord *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 *v14;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "clientModelId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a1[4] || objc_msgSend(v4, "isEqualToString:"))
  {
    objc_msgSend(v3, "getNSStringForColumnName:table:", "suggestionId", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getNSStringForColumnName:table:", "criterion", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "getIntegerForColumnName:table:", "isStalenessRotation", 0) > 0;
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "getDoubleForColumnName:table:", "rotationTimestamp", 0);
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = v8;
    v11 = -[ATXStackRotationRecord initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:]([ATXStackRotationRecord alloc], "initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:", v6, v5, v7, a1[5], a1[6], a1[7], (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "relevancyDurationLimit", 0), (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "coolDownTimeInterval", 0), v16, v10);
    v12 = *(_QWORD *)(a1[8] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  v14 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v14;
}

uint64_t __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)mostRecentRotationRecordForSuggestionIdentifier:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke;
  v15[3] = &unk_1E4D5B438;
  v16 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_2;
  v12[3] = &unk_1E4D5B790;
  v14 = &v17;
  v13 = v16;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3;
  v10[3] = &unk_1E4D5B518;
  v7 = v13;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT widgetBundleId, widgetKind, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE suggestionId = :suggestionId"), v15, v12, v10);
  v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

uint64_t __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":suggestionId", *(_QWORD *)(a1 + 32));
}

uint64_t __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  ATXStackRotationRecord *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 *v16;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "widgetBundleId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "widgetKind", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "criterion", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "getIntegerForColumnName:table:", "isStalenessRotation", 0) > 0;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "getDoubleForColumnName:table:", "rotationTimestamp", 0);
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "relevancyDurationLimit", 0);
  v11 = (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "coolDownTimeInterval", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "clientModelId", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = v7;
  v13 = -[ATXStackRotationRecord initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:]([ATXStackRotationRecord alloc], "initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:", *(_QWORD *)(a1 + 32), v12, v6, v4, v5, 0, v10, v11, v18, v9);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v16;
}

uint64_t __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)nextImportantDateAmongTimelineInducedProactiveStackRotationRecords
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _PASSqliteDatabase *db;
  id v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v21 = v8;
  v9 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke;
  v15[3] = &unk_1E4D5B7B8;
  v17 = v5;
  v11 = v3;
  v16 = v11;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_2;
  v14[3] = &unk_1E4D5B7E0;
  v14[5] = v5;
  v14[4] = &v18;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT rotationTimestamp + relevancyDurationLimit, rotationTimestamp + coolDownTimeInterval FROM proactiveStackRotations WHERE isStalenessRotation = 0 AND clientModelId = :timelineClientModelId AND (rotationTimestamp + relevancyDurationLimit > :now OR rotationTimestamp + coolDownTimeInterval > :now)"), v15, v14, &__block_literal_global_349);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v19[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = (uint64_t)*(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":now", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":timelineClientModelId", *(_QWORD *)(a1 + 32));

}

uint64_t __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = a2;
  v4 = (double)objc_msgSend(v3, "getInt64ForColumn:", 0);
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);

  v6 = *(double *)(a1 + 40);
  if (v6 < v4)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(double *)(v7 + 24);
    if (v8 >= v4)
      v8 = v4;
LABEL_8:
    *(double *)(v7 + 24) = v8;
    return *MEMORY[0x1E0D81780];
  }
  v8 = (double)v5;
  if (v6 < (double)v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v7 + 24) < v8)
      v8 = *(double *)(v7 + 24);
    goto LABEL_8;
  }
  return *MEMORY[0x1E0D81780];
}

uint64_t __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)rotationExistsForSuggestionWithId:(id)a3 considerStalenessRotation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const __CFString *v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a4;
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (v4)
    v7 = CFSTR("SELECT rotationTimestamp FROM proactiveStackRotations WHERE suggestionId = :suggestionId");
  else
    v7 = CFSTR("SELECT rotationTimestamp FROM proactiveStackRotations WHERE suggestionId = :suggestionId AND isStalenessRotation = 0");
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v10 = v6;
  v14 = v10;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v7, v13, v12, &__block_literal_global_354);
  LOBYTE(db) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)db;
}

uint64_t __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":suggestionId", *(_QWORD *)(a1 + 32));
}

uint64_t __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81780];
}

uint64_t __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)didSuggestionReachDurationLimit:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke;
  v10[3] = &unk_1E4D5B438;
  v7 = v4;
  v11 = v7;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke_2;
  v9[3] = &unk_1E4D5B4B0;
  v9[4] = &v12;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT rotationTimestamp, relevancyDurationLimit FROM proactiveStackRotations WHERE suggestionId = :suggestionId AND isStalenessRotation = 0"), v10, v9, &__block_literal_global_357);
  LOBYTE(db) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)db;
}

uint64_t __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":suggestionId", *(_QWORD *)(a1 + 32));
}

uint64_t __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumn:", 0);
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);

  if ((v5 & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v6 - (double)v4 > (double)v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return *MEMORY[0x1E0D81780];
}

uint64_t __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)proactiveRotationsForWidgetInThePastDay:(id)a3 kind:(id)a4 intent:(id)a5 filterByClientModelId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASSqliteDatabase *db;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15;
  v38 = __Block_byref_object_dispose__15;
  v39 = (id)objc_opt_new();
  db = self->_db;
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke;
  v30[3] = &unk_1E4D5B740;
  v31 = v10;
  v32 = v11;
  v33 = v12;
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_2;
  v24[3] = &unk_1E4D5B868;
  v16 = v13;
  v25 = v16;
  v26 = v31;
  v17 = v32;
  v27 = v17;
  v18 = v33;
  v28 = v18;
  v29 = &v34;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3;
  v22[3] = &unk_1E4D5B518;
  v19 = v26;
  v23 = v19;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestionId, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND isStalenessRotation = 0 AND :now - rotationTimestamp < :time_window ORDER BY rotationTimestamp"), v30, v24, v22);
  v20 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v20;
}

void __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetBundleId", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":now", (uint64_t)v4);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":time_window", 86400);

}

uint64_t __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXStackRotationRecord *v10;
  unsigned __int8 *v11;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "clientModelId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a1[4] || objc_msgSend(v4, "isEqualToString:"))
  {
    objc_msgSend(v3, "getNSStringForColumnName:table:", "suggestionId", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getNSStringForColumnName:table:", "criterion", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "getDoubleForColumnName:table:", "rotationTimestamp", 0);
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = 0;
    v10 = -[ATXStackRotationRecord initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:]([ATXStackRotationRecord alloc], "initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:", v6, v5, v7, a1[5], a1[6], a1[7], (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "relevancyDurationLimit", 0), (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "coolDownTimeInterval", 0), v13, v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v10);

  }
  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v11;
}

uint64_t __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)deleteExpiredProactiveStackRotations
{
  _PASSqliteDatabase *db;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ATXInformationStore_deleteExpiredProactiveStackRotations__block_invoke_2;
  v5[3] = &unk_1E4D5B488;
  v5[4] = &v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM proactiveStackRotations WHERE :now - rotationTimestamp > :quota_window AND :now - rotationTimestamp > coolDownTimeInterval"), &__block_literal_global_363, 0, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__ATXInformationStore_deleteExpiredProactiveStackRotations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":now", (uint64_t)v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":quota_window", 86400);

}

uint64_t __59__ATXInformationStore_deleteExpiredProactiveStackRotations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_308_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)recordUserRemovalOfSuggestedWidget:(id)a3 kind:(id)a4 intent:(id)a5 atDate:(id)a6 duration:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  NSObject *v17;
  BOOL v18;
  _PASSqliteDatabase *db;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  int v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  double v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v15, "timeIntervalSinceNow");
  if (v16 <= 0.0)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 1;
    db = self->_db;
    v20 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke;
    v32[3] = &unk_1E4D5B8B0;
    v33 = v12;
    v34 = v13;
    v35 = v14;
    v36 = v15;
    v37 = a7;
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2;
    v27[3] = &unk_1E4D5B8D8;
    v21 = v33;
    v28 = v21;
    v22 = v34;
    v29 = v22;
    v23 = v35;
    v30 = v23;
    v31 = &v38;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO widgetSuggestionDismiss (extensionBundleId, kind, intentHash, date, duration) VALUES (:extensionBundleId, :kind, :intentHash, :date, :duration)"), v32, 0, v27);
    __atxlog_handle_home_screen();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *((unsigned __int8 *)v39 + 24);
      *(_DWORD *)buf = 138413058;
      v43 = v21;
      v44 = 2112;
      v45 = v22;
      v46 = 2112;
      v47 = v23;
      v48 = 1024;
      LODWORD(v49) = v25;
      _os_log_impl(&dword_1A49EF000, v24, OS_LOG_TYPE_DEFAULT, "ATXInformationStore: Writing user removal of suggested widget (extBundleId %@, kind %@, intent %@) - is successful: %{BOOL}d", buf, 0x26u);
    }

    v18 = *((_BYTE *)v39 + 24) != 0;
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    __atxlog_handle_home_screen();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      v43 = v12;
      v44 = 2112;
      v45 = v13;
      v46 = 2112;
      v47 = v14;
      v48 = 2112;
      v49 = v15;
      v50 = 2048;
      v51 = a7;
      _os_log_error_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_ERROR, "ATXInformationStore: Received call to write user removal of suggested widget with a date in the future! (extBundleId %@, kind %@, intent %@, date %@, duration %f)", buf, 0x34u);
    }

    v18 = 0;
  }

  return v18;
}

void __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":kind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":date");
  if (*(double *)(a1 + 64) == 0.0)
    objc_msgSend(v4, "bindNamedParamToNull:", ":duration");
  else
    objc_msgSend(v4, "bindNamedParam:toDouble:", ":duration");

}

uint64_t __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)_dateIntervalFromDismissStatement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "getDoubleForColumnName:table:", "date", 0);
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isNullForColumnName:table:", "duration", 0) & 1) == 0)
  {
    objc_msgSend(v3, "getDoubleForColumnName:table:", "duration", 0);
    objc_msgSend(v5, "dateByAddingTimeInterval:");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v6);

  return v8;
}

- (id)dateIntervalsOfUserRemovalOfSuggestedWidget:(id)a3 kind:(id)a4 intent:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASSqliteDatabase *db;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__15;
  v32 = __Block_byref_object_dispose__15;
  v33 = (id)objc_opt_new();
  db = self->_db;
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke;
  v24[3] = &unk_1E4D5B740;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_2;
  v23[3] = &unk_1E4D5B790;
  v23[4] = self;
  v23[5] = &v28;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3;
  v18[3] = &unk_1E4D5B8D8;
  v13 = v25;
  v19 = v13;
  v14 = v26;
  v20 = v14;
  v15 = v27;
  v21 = v15;
  v22 = &v28;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, duration FROM widgetSuggestionDismiss WHERE extensionBundleId = :extensionBundleId AND kind = :kind AND intentHash = :intentHash ORDER BY date ASC"), v24, v23, v18);
  v16 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v16;
}

void __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":kind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));

}

uint64_t __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_dateIntervalFromDismissStatement:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = (id)objc_opt_new();
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke;
  v14[3] = &unk_1E4D5B438;
  v15 = v4;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_2;
  v13[3] = &unk_1E4D5B790;
  v13[4] = self;
  v13[5] = &v16;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3;
  v10[3] = &unk_1E4D5B5C0;
  v7 = v15;
  v11 = v7;
  v12 = &v16;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, duration FROM widgetSuggestionDismiss WHERE extensionBundleId = :extensionBundleId ORDER BY date ASC"), v14, v13, v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":extensionBundleId", *(_QWORD *)(a1 + 32));
}

uint64_t __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_dateIntervalFromDismissStatement:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = (id)objc_opt_new();
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke;
  v14[3] = &unk_1E4D5B438;
  v15 = v4;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_2;
  v13[3] = &unk_1E4D5B790;
  v13[4] = self;
  v13[5] = &v16;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3;
  v10[3] = &unk_1E4D5B5C0;
  v7 = v15;
  v11 = v7;
  v12 = &v16;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, duration FROM widgetSuggestionDismiss WHERE intentHash = :intentHash ORDER BY date ASC"), v14, v13, v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v2, "atx_indexingHash"));

}

uint64_t __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_dateIntervalFromDismissStatement:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (BOOL)clearWidgetRemovalHistoryOlderThan:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke;
  v10[3] = &unk_1E4D5B438;
  v7 = v4;
  v11 = v7;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2;
  v9[3] = &unk_1E4D5B488;
  v9[4] = &v12;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM widgetSuggestionDismiss WHERE date < :date"), v10, 0, v9);
  LOBYTE(db) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)db;
}

void __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":date");

}

uint64_t __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)widgetSuggestionRemovalRecordsForDiagnostics
{
  void *v3;
  _PASSqliteDatabase *db;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ATXInformationStore_widgetSuggestionRemovalRecordsForDiagnostics__block_invoke;
  v7[3] = &unk_1E4D5B900;
  v5 = v3;
  v8 = v5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM widgetSuggestionDismiss"), 0, v7, &__block_literal_global_397);

  return v5;
}

uint64_t __67__ATXInformationStore_widgetSuggestionRemovalRecordsForDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "extensionBundleId", 0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "kind", 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnName:table:", "date", 0);
  v7 = v6;
  objc_msgSend(v3, "getDoubleForColumnName:table:", "duration", 0);
  v9 = v8;

  v10 = *(void **)(a1 + 32);
  v11 = CFSTR("<missing>");
  v17[0] = CFSTR("bundleId");
  v17[1] = CFSTR("kind");
  if (v4)
    v12 = v4;
  else
    v12 = CFSTR("<missing>");
  if (v5)
    v11 = v5;
  v18[0] = v12;
  v18[1] = v11;
  v17[2] = CFSTR("date");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v15);

  return *MEMORY[0x1E0D81780];
}

uint64_t __67__ATXInformationStore_widgetSuggestionRemovalRecordsForDiagnostics__block_invoke_2()
{
  return *MEMORY[0x1E0D81788];
}

- (id)readAllDismissRecords
{
  void *v3;
  uint64_t v4;
  _PASSqliteDatabase *db;
  double v6;
  _PASSqliteDatabase *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = (void *)os_transaction_create();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__ATXInformationStore_readAllDismissRecords__block_invoke;
  v13[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v13[4] = (uint64_t)v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM dismissRecords WHERE blockWidgetUntil < :widgetCutoff AND blockCriterionUntil < :criterionCutoff"), v13, 0, &__block_literal_global_403);
  v7 = self->_db;
  v12[1] = 3221225472;
  v12[2] = __44__ATXInformationStore_readAllDismissRecords__block_invoke_406;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v14;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_408;
  v11[3] = &unk_1E4D5B488;
  v11[4] = &v14;
  v12[0] = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT widgetBundleId, criterion, blockWidgetUntil, blockCriterionUntil FROM dismissRecords"), 0, v12, v11);
  v8 = (id)objc_opt_self();
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __44__ATXInformationStore_readAllDismissRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":widgetCutoff", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":criterionCutoff", *(_QWORD *)(a1 + 32));

}

uint64_t __44__ATXInformationStore_readAllDismissRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __44__ATXInformationStore_readAllDismissRecords__block_invoke_406(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  ATXInformationDismissRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ATXInformationDismissRecord *v11;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  v4 = [ATXInformationDismissRecord alloc];
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = objc_msgSend(v3, "getInt64ForColumn:", 3);

  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:", (double)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXInformationDismissRecord initWithWidgetBundleId:criterion:blockWidgetUntilDate:blockCriterionUntilDate:](v4, "initWithWidgetBundleId:criterion:blockWidgetUntilDate:blockCriterionUntilDate:", v5, v6, v7, v10);
  objc_msgSend(v2, "addObject:", v11);

  return *MEMORY[0x1E0D81780];
}

uint64_t __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_408(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_408_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (BOOL)appendDismissRecord:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)os_transaction_create();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    db = self->_db;
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__ATXInformationStore_appendDismissRecord___block_invoke;
    v14[3] = &unk_1E4D5B438;
    v15 = v4;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __43__ATXInformationStore_appendDismissRecord___block_invoke_2;
    v11[3] = &unk_1E4D5B5C0;
    v12 = v15;
    v13 = &v16;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO dismissRecords (widgetBundleId, criterion, blockWidgetUntil, blockCriterionUntil) VALUES (:widgetBundleId, :criterion, :blockWidgetUntil, :blockCriterionUntil)"), v14, 0, v11);
    v8 = (id)objc_opt_self();
    v9 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __43__ATXInformationStore_appendDismissRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "widgetBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetBundleId", v5);

  objc_msgSend(*(id *)(a1 + 32), "criterion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":criterion", v6);

  objc_msgSend(*(id *)(a1 + 32), "blockWidgetUntilDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":blockWidgetUntil", (uint64_t)v8);

  objc_msgSend(*(id *)(a1 + 32), "blockCriterionUntilDate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":blockCriterionUntil", (uint64_t)v9);

}

uint64_t __43__ATXInformationStore_appendDismissRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __43__ATXInformationStore_appendDismissRecord___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)mostRecentTimelineEntryWithScoreForWidget:(id)a3 kind:(id)a4 family:(int64_t)a5 intentIndexingHash:(int64_t)a6
{
  id v10;
  id v11;
  _PASSqliteDatabase *db;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15;
  v31 = __Block_byref_object_dispose__15;
  v32 = 0;
  db = self->_db;
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke;
  v22[3] = &unk_1E4D5B968;
  v23 = v10;
  v24 = v11;
  v25 = a5;
  v26 = a6;
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_2;
  v21[3] = &unk_1E4D5B4B0;
  v21[4] = &v27;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3;
  v18[3] = &unk_1E4D5B990;
  v14 = v23;
  v19 = v14;
  v15 = v24;
  v20 = v15;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT timestamp, score, duration FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND intentHash = :intentHash AND timestamp <= :now AND score IS NOT NULL ORDER BY timestamp DESC LIMIT 1"), v22, v21, v18);
  v16 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v16;
}

void __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = a1[4];
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetKind", a1[5]);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":widgetFamily", a1[6]);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", a1[7]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":now", (uint64_t)v4);

}

uint64_t __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 *v14;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "timestamp", 0);
  objc_msgSend(v3, "getDoubleForColumnName:table:", "score", 0);
  v6 = v5;
  objc_msgSend(v3, "getDoubleForColumnName:table:", "duration", 0);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81168], "relevanceWithScore:duration:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81160], "entryWithDate:relevance:", v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v14;
}

uint64_t __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget:(id)a3 kind:(id)a4 familyMask:(unint64_t)a5 intent:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _PASSqliteDatabase *db;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[7];
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v14 = v13;
  db = self->_db;
  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke;
  v31[3] = &unk_1E4D5B9B8;
  v32 = v10;
  v33 = v11;
  v17 = v12;
  v34 = v17;
  v35 = v14;
  v29 = &v36;
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_2;
  v30[3] = &unk_1E4D5B9E0;
  v30[6] = v14;
  v30[4] = &v36;
  v30[5] = a5;
  v23 = v16;
  v24 = 3221225472;
  v25 = __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3;
  v26 = &unk_1E4D5BA08;
  v18 = v32;
  v27 = v18;
  v19 = v33;
  v28 = v19;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT timestamp, duration, widgetFamily FROM timelineDonations WHERE score = 0 AND extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND timestamp + duration > :now"), v31, v30, &v23);
  if (v37[3] == 0.0)
  {
    v21 = 0;
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D68]);
    v21 = (void *)objc_msgSend(v20, "initWithTimeIntervalSinceReferenceDate:", v37[3], v23, v24, v25, v26, v27);
  }

  _Block_object_dispose(&v36, 8);
  return v21;
}

void __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":now", (uint64_t)*(double *)(a1 + 56));

}

uint64_t __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  unsigned __int8 *v10;

  v3 = a2;
  objc_msgSend(v3, "getInt64ForColumnName:table:", "widgetFamily", 0);
  if (CHSWidgetFamilyMaskContainsFamily())
  {
    v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "timestamp", 0);
    objc_msgSend(v3, "getDoubleForColumnName:table:", "duration", 0);
    if (*(double *)(a1 + 48) <= (double)v4)
      v5 = -0.0;
    v6 = v5 + (double)v4;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(double *)(v7 + 24);
    if (v8 == 0.0 || v6 < v8)
      *(double *)(v7 + 24) = v6;
  }
  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v10;
}

uint64_t __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3_cold_1();

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (id)recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _PASSqliteDatabase *db;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__15;
  v33 = __Block_byref_object_dispose__15;
  v34 = (id)objc_opt_new();
  v13 = objc_msgSend(v12, "atx_indexingHash");
  db = self->_db;
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke;
  v25[3] = &unk_1E4D5BA30;
  v26 = v10;
  v27 = v11;
  v28 = a5;
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_2;
  v24[3] = &unk_1E4D5B7E0;
  v24[4] = &v29;
  v24[5] = v13;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3;
  v20[3] = &unk_1E4D5B718;
  v16 = v26;
  v21 = v16;
  v17 = v27;
  v22 = v17;
  v23 = &v29;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT timestamp, score, duration, intentHash FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND score IS NOT NULL ORDER BY score DESC"), v25, v24, v20);
  v18 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":widgetFamily", a1[6]);

}

uint64_t __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  unsigned __int8 *v14;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "intentHash", 0);
  if (!v4 || v4 == *(_QWORD *)(a1 + 40))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = (void *)MEMORY[0x1E0D81160];
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
    v8 = (void *)MEMORY[0x1E0D81168];
    objc_msgSend(v3, "getDoubleForColumn:", 1);
    v10 = v9;
    objc_msgSend(v3, "getDoubleForColumn:", 2);
    objc_msgSend(v8, "relevanceWithScore:duration:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryWithDate:relevance:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  v14 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v14;
}

uint64_t __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)mostRecentTimelineUpdateDateOfWidget:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = 0;
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke;
  v15[3] = &unk_1E4D5B6F0;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_2;
  v14[3] = &unk_1E4D5B4B0;
  v14[4] = &v18;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT timestamp FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND timestamp <= :now ORDER BY timestamp DESC LIMIT 1"), v15, v14, &__block_literal_global_429);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":now", (uint64_t)v4);

}

uint64_t __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "getInt64ForColumn:", 0);

  v7 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", (double)v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *MEMORY[0x1E0D81780];
}

uint64_t __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)insertTimelineEntries:(id)a3 forWidget:(id)a4
{
  return -[ATXInformationStore _insertTimelineEntries:forWidget:storageLimit:](self, "_insertTimelineEntries:forWidget:storageLimit:", a3, a4, 1000);
}

- (BOOL)_insertTimelineEntries:(id)a3 forWidget:(id)a4 storageLimit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _PASSqliteDatabase *db;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D81630];
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke;
  v15[3] = &unk_1E4D5BAB8;
  v16 = v9;
  v17 = v8;
  v18 = a5;
  v12 = v8;
  v13 = v9;
  LOBYTE(db) = (objc_msgSend(v10, "writeTransactionWithHandle:failableBlock:", db, v15) & 1) == 0;

  return (char)db;
}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2;
  v34[3] = &unk_1E4D5B438;
  v35 = *(id *)(a1 + 32);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND intentHash = :intentHash AND timestamp > :now"), v34, 0, &__block_literal_global_432);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        objc_msgSend(v3, "db");
        v11 = objc_claimAutoreleasedReturnValue();
        v24[0] = v5;
        v24[1] = 3221225472;
        v24[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_435;
        v24[3] = &unk_1E4D5B6F0;
        v24[4] = v10;
        v25 = *(id *)(a1 + 32);
        v21[0] = v5;
        v21[1] = 3221225472;
        v21[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_440;
        v21[3] = &unk_1E4D5B5C0;
        v22 = *(id *)(a1 + 32);
        v23 = &v30;
        objc_msgSend((id)v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO timelineDonations (timestamp, score, duration, extensionBundleId, containerBundleIdentifier, widgetKind, widgetFamily, intentHash, suggestionId, suggestionMappingReason) VALUES (:timestamp, :score, :duration, :extensionBundleId, :containerBundleIdentifier, :widgetKind, :widgetFamily, :intentHash, :suggestionId, :suggestionMappingReason)"), v24, 0, v21);

        LOBYTE(v11) = *((_BYTE *)v31 + 24) == 0;
        if ((v11 & 1) == 0)
        {
          v15 = (unsigned __int8 *)MEMORY[0x1E0D81680];
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_443;
  v18[3] = &unk_1E4D5B7B8;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 48);
  v19 = v13;
  v20 = v14;
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND intentHash = :intentHash ORDER BY timestamp DESC LIMIT -1 OFFSET :offset"), v18, 0, &__block_literal_global_446);

  v15 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v6 = v19;
LABEL_11:
  v16 = *v15;

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindNamedParam:toNSString:", ":extensionBundleId", v5);

  objc_msgSend(*(id *)(a1 + 32), "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindNamedParam:toNSString:", ":widgetKind", v6);

  objc_msgSend(v10, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "family"));
  objc_msgSend(*(id *)(a1 + 32), "intentReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "bindNamedParam:toInt64:", ":now", (uint64_t)v9);

}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_435(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timelineEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":timestamp", (uint64_t)v5);

  objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":extensionBundleId", v7);

  objc_msgSend(*(id *)(a1 + 40), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":widgetKind", v8);

  objc_msgSend(v20, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 40), "family"));
  objc_msgSend(*(id *)(a1 + 40), "intentReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v10, "atx_indexingHash"));

  objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":containerBundleIdentifier", v12);

  objc_msgSend(*(id *)(a1 + 32), "suggestionId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bindNamedParam:toNSString:", ":suggestionId", v13);

  objc_msgSend(v20, "bindNamedParam:toInt64:", ":suggestionMappingReason", objc_msgSend(*(id *)(a1 + 32), "suggestionMappingReason"));
  objc_msgSend(*(id *)(a1 + 32), "timelineEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relevance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "timelineEntry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "relevance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "score");
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":score");

    objc_msgSend(*(id *)(a1 + 32), "timelineEntry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "relevance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duration");
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":duration");

  }
  else
  {
    objc_msgSend(v20, "bindNamedParamToNull:", ":score");
    objc_msgSend(v20, "bindNamedParamToNull:", ":duration");
  }

}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_440(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_440_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_443(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":extensionBundleId", v5);

  objc_msgSend(*(id *)(a1 + 32), "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":widgetKind", v6);

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "family"));
  objc_msgSend(*(id *)(a1 + 32), "intentReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

  objc_msgSend(v9, "bindNamedParam:toInteger:", ":offset", *(_QWORD *)(a1 + 40));
}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_445(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_445_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)pruneTimelineEntries
{
  _PASSqliteDatabase *db;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ATXInformationStore_pruneTimelineEntries__block_invoke_451;
  v5[3] = &unk_1E4D5B488;
  v5[4] = &v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM timelineDonations WHERE (timestamp IS NULL OR timestamp < :timelineRelevanceDonationExpiredTimestamp)"), &__block_literal_global_449, 0, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__ATXInformationStore_pruneTimelineEntries__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  double v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", -7776000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_timeline();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationStore: Deleting all timeline donations older than: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":timelineRelevanceDonationExpiredTimestamp", (uint64_t)v6);

}

uint64_t __43__ATXInformationStore_pruneTimelineEntries__block_invoke_451(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __43__ATXInformationStore_pruneTimelineEntries__block_invoke_451_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)pruneInvalidSuggestions
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE endDate = :distantFuture"), &__block_literal_global_454, 0, &__block_literal_global_456);
  return 1;
}

void __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "distantFuture");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":distantFuture", (uint64_t)v4);

}

uint64_t __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)distinctScoresForWidget:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v26 = (id)objc_opt_new();
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke;
  v18[3] = &unk_1E4D5B6F0;
  v19 = v6;
  v20 = v7;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_2;
  v17[3] = &unk_1E4D5B4B0;
  v17[4] = &v21;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3;
  v14[3] = &unk_1E4D5B990;
  v10 = v19;
  v15 = v10;
  v11 = v20;
  v16 = v11;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT score FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND score IS NOT NULL ORDER BY score DESC"), v18, v17, v14);
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));

}

uint64_t __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "getDoubleForColumn:", 0);
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  return *MEMORY[0x1E0D81780];
}

uint64_t __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)updateMostRecentTapOfWidget:(id)a3 date:(id)a4
{
  return -[ATXInformationStore addEngagementRecordForWidget:date:engagementType:](self, "addEngagementRecordForWidget:date:engagementType:", a3, a4, 1);
}

- (BOOL)clearOutdatedWidgetEngagements
{
  _PASSqliteDatabase *db;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2;
  v5[3] = &unk_1E4D5B488;
  v5[4] = &v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM widgetEngagements WHERE (date IS NULL OR date < :cutoffTimestamp)"), &__block_literal_global_461, 0, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", -86400.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":cutoffTimestamp", (uint64_t)v4);

}

uint64_t __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

uint64_t __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)mostRecentEngagementOfWidget:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke;
  v11[3] = &unk_1E4D5B438;
  v7 = v4;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_2;
  v10[3] = &unk_1E4D5B4B0;
  v10[4] = &v13;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, engagementType FROM widgetEngagements WHERE widgetUniqueId = :widgetUniqueId ORDER BY date DESC LIMIT 1"), v11, v10, &__block_literal_global_472);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "widgetUniqueId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":widgetUniqueId", v4);

}

uint64_t __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  ATXWidgetEngagementRecord *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  v6 = objc_msgSend(v4, "getIntegerForColumnName:table:", "engagementType", 0);

  v7 = -[ATXWidgetEngagementRecord initWithDate:type:]([ATXWidgetEngagementRecord alloc], "initWithDate:type:", v5, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v10;
}

uint64_t __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)mostRecentEngagementOfWidget:(id)a3 ofType:(int64_t)a4
{
  id v6;
  _PASSqliteDatabase *db;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  db = self->_db;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke;
  v13[3] = &unk_1E4D5B7B8;
  v9 = v6;
  v14 = v9;
  v15 = a4;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke_2;
  v12[3] = &unk_1E4D5B7E0;
  v12[4] = &v16;
  v12[5] = a4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date FROM widgetEngagements WHERE widgetUniqueId = :widgetUniqueId AND engagementType = :engagementType ORDER BY date DESC LIMIT 1"), v13, v12, &__block_literal_global_475);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "widgetUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetUniqueId", v4);

  objc_msgSend(v5, "bindNamedParam:toInteger:", ":engagementType", *(_QWORD *)(a1 + 40));
}

uint64_t __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  ATXWidgetEngagementRecord *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0);

  v7 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", (double)v6);
  v8 = -[ATXWidgetEngagementRecord initWithDate:type:]([ATXWidgetEngagementRecord alloc], "initWithDate:type:", v7, *(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v11;
}

uint64_t __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)mostRecentEngagementOfWidget:(id)a3 kind:(id)a4 ofType:(int64_t)a5
{
  id v8;
  id v9;
  _PASSqliteDatabase *db;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  id v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v26 = 0;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke;
  v17[3] = &unk_1E4D5BA30;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = a5;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke_2;
  v16[3] = &unk_1E4D5B7E0;
  v16[4] = &v21;
  v16[5] = a5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date FROM widgetEngagements WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND engagementType = :engagementType ORDER BY date DESC LIMIT 1"), v17, v16, &__block_literal_global_478);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":engagementType", a1[6]);

}

uint64_t __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  ATXWidgetEngagementRecord *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0);

  v7 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", (double)v6);
  v8 = -[ATXWidgetEngagementRecord initWithDate:type:]([ATXWidgetEngagementRecord alloc], "initWithDate:type:", v7, *(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v11;
}

uint64_t __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)firstEngagementOfWidget:(id)a3 kind:(id)a4 intent:(id)a5 sinceTimestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASSqliteDatabase *db;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__15;
  v32 = __Block_byref_object_dispose__15;
  v33 = 0;
  db = self->_db;
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke;
  v23[3] = &unk_1E4D5BBE8;
  v16 = v10;
  v24 = v16;
  v17 = v11;
  v25 = v17;
  v18 = v12;
  v26 = v18;
  v19 = v13;
  v27 = v19;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke_2;
  v22[3] = &unk_1E4D5B4B0;
  v22[4] = &v28;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, engagementType FROM widgetEngagements WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND engagementType <> 0 AND date >= :sinceTimestamp ORDER BY date DESC LIMIT 1"), v23, v22, &__block_literal_global_482);
  v20 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v20;
}

void __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":sinceTimestamp", (uint64_t)v4);

}

uint64_t __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  ATXWidgetEngagementRecord *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  v6 = objc_msgSend(v4, "getIntegerForColumnName:table:", "engagementType", 0);

  v7 = -[ATXWidgetEngagementRecord initWithDate:type:]([ATXWidgetEngagementRecord alloc], "initWithDate:type:", v5, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v10;
}

uint64_t __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)engagementTimestampsForExtensionBundleId:(id)a3 kind:(id)a4 intent:(id)a5 engagementType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _PASSqliteDatabase *db;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__15;
  v30 = __Block_byref_object_dispose__15;
  v31 = (id)objc_opt_new();
  db = self->_db;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke;
  v21[3] = &unk_1E4D5B9B8;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v25 = a6;
  v17 = v12;
  v24 = v17;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_2;
  v20[3] = &unk_1E4D5B4B0;
  v20[4] = &v26;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date FROM widgetEngagements WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND engagementType = :engagementType AND :now - date < :quota_window ORDER BY date"), v21, v20, &__block_literal_global_485);
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":extensionBundleId", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":widgetKind", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":engagementType", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":now", (uint64_t)v4);
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":quota_window", 86400);

}

uint64_t __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0);

  v7 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", (double)v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)fetchWidgetEngagementRecords
{
  _PASSqliteDatabase *db;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = (id)objc_opt_new();
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke;
  v7[3] = &unk_1E4D5B4B0;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2;
  v6[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, engagementType, extensionBundleId, widgetKind, size, containerBundleIdentifier FROM widgetEngagements LIMIT 2000"), 0, v7, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ATXWidgetEngagementRecord *v11;
  unsigned __int8 *v12;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  v6 = objc_msgSend(v4, "getInt64ForColumnName:table:", "engagementType", 0);
  objc_msgSend(v4, "getNSStringForColumnName:table:", "extensionBundleId", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnName:table:", "containerBundleIdentifier", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnName:table:", "widgetKind", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "getIntegerForColumnName:table:", "size", 0);

  v11 = -[ATXWidgetEngagementRecord initWithDate:type:widgetBundleId:containerBundleIdentifier:widgetKind:layoutSize:]([ATXWidgetEngagementRecord alloc], "initWithDate:type:widgetBundleId:containerBundleIdentifier:widgetKind:layoutSize:", v5, v6, v7, v8, v9, v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v11);
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v12;
}

uint64_t __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)fetchWidgetTapEngagementsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = (id)objc_opt_new();
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke;
  v15[3] = &unk_1E4D5B6F0;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_2;
  v14[3] = &unk_1E4D5B4B0;
  v14[4] = &v18;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, engagementType, extensionBundleId, containerBundleIdentifier, widgetKind, size FROM widgetEngagements WHERE date >= :startTimestamp AND date <= :endTimestamp AND engagementType = :engagementType ORDER BY date DESC LIMIT 1000"), v15, v14, &__block_literal_global_494);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":startTimestamp", (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":endTimestamp", (uint64_t)v5);
  objc_msgSend(v6, "bindNamedParam:toInteger:", ":engagementType", 1);

}

uint64_t __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ATXWidgetEngagementRecord *v11;
  unsigned __int8 *v12;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  v6 = objc_msgSend(v4, "getInt64ForColumnName:table:", "engagementType", 0);
  objc_msgSend(v4, "getNSStringForColumnName:table:", "extensionBundleId", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnName:table:", "widgetKind", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnName:table:", "containerBundleIdentifier", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "getIntegerForColumnName:table:", "size", 0);

  v11 = -[ATXWidgetEngagementRecord initWithDate:type:widgetBundleId:containerBundleIdentifier:widgetKind:layoutSize:]([ATXWidgetEngagementRecord alloc], "initWithDate:type:widgetBundleId:containerBundleIdentifier:widgetKind:layoutSize:", v5, v6, v7, v9, v8, v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v11);
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v12;
}

uint64_t __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)fetchWidgetTapEngagementCountSinceStartDate:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = (id)objc_opt_new();
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke;
  v11[3] = &unk_1E4D5B438;
  v7 = v4;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_2;
  v10[3] = &unk_1E4D5B4B0;
  v10[4] = &v13;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT extensionBundleId, containerBundleIdentifier, widgetKind, size, count(1) FROM widgetEngagements WHERE date >= :startTimestamp AND engagementType = 1 GROUP BY extensionBundleId, containerBundleIdentifier, widgetKind, size LIMIT 1000"), v11, v10, &__block_literal_global_501);
  v8 = (void *)objc_msgSend((id)v14[5], "copy");

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":startTimestamp", (uint64_t)v3);

}

uint64_t __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ATXWidgetModeEntity *v15;
  unsigned __int8 *v16;

  v3 = a2;
  v4 = CHSWidgetFamilyFromATXStackLayoutSize(objc_msgSend(v3, "getIntegerForColumnName:table:", "size", 0));
  v5 = objc_alloc(MEMORY[0x1E0D10148]);
  v6 = objc_alloc(MEMORY[0x1E0D10038]);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "extensionBundleId", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "containerBundleIdentifier", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v7, v8, 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "widgetKind", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v9, v10, v4, 0, 0);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v3, "getInt64ForColumn:", 4);

  objc_msgSend(v12, "numberWithLongLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXWidgetModeEntity initWithWidget:]([ATXWidgetModeEntity alloc], "initWithWidget:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v14, v15);
  v16 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v16;
}

uint64_t __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)fetchDistinctScoreCountForWidgets
{
  _PASSqliteDatabase *db;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = (id)objc_opt_new();
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke;
  v7[3] = &unk_1E4D5B4B0;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2;
  v6[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT extensionBundleId, widgetKind, count(distinct(score)) FROM timelineDonations WHERE score IS NOT NULL group by extensionBundleId, widgetKind"), 0, v7, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  unsigned __int8 *v11;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "extensionBundleId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "widgetKind", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "getDoubleForColumn:", 2);
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v10, v6);

  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v11;
}

uint64_t __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)fetchDistinctWidgetsIgnoringIntentSinceDate:(id)a3
{
  id v4;
  const __CFString *v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = (id)objc_opt_new();
  if (v4)
    v5 = CFSTR("SELECT DISTINCT extensionBundleId, containerBundleIdentifier, widgetKind, widgetFamily FROM timelineDonations WHERE suggestionMappingReason IS NOT NULL AND suggestionId IS NOT NULL AND timestamp > :date;");
  else
    v5 = CFSTR("SELECT DISTINCT extensionBundleId, containerBundleIdentifier, widgetKind, widgetFamily FROM timelineDonations WHERE suggestionMappingReason IS NOT NULL AND suggestionId IS NOT NULL;");
  db = self->_db;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v8 = v4;
  v14 = v8;
  v11[4] = &v15;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3;
  v11[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v5, v13, v12, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = a2;
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":date", (uint64_t)v3);

  }
}

uint64_t __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 *v13;

  v3 = (objc_class *)MEMORY[0x1E0D10148];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_alloc(MEMORY[0x1E0D10038]);
  objc_msgSend(v4, "getNSStringForColumnName:table:", "extensionBundleId", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnName:table:", "containerBundleIdentifier", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v7, v8, 0);
  objc_msgSend(v4, "getNSStringForColumnName:table:", "widgetKind", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "getInt64ForColumnName:table:", "widgetFamily", 0);

  v12 = (void *)objc_msgSend(v5, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v9, v10, v11, 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v12);
  v13 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v13;
}

uint64_t __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (id)fetchTimelineEntriesForWidget:(id)a3 sinceDate:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  _PASSqliteDatabase *db;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__15;
  v26 = __Block_byref_object_dispose__15;
  v27 = (id)objc_opt_new();
  if (v7)
    v8 = CFSTR("SELECT timestamp, score, duration, suggestionId, suggestionMappingReason FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND containerBundleIdentifier = :containerBundleIdentifier AND suggestionMappingReason IS NOT NULL AND timestamp > :date ORDER BY timestamp");
  else
    v8 = CFSTR("SELECT timestamp, score, duration, suggestionId, suggestionMappingReason FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND containerBundleIdentifier = :containerBundleIdentifier AND suggestionMappingReason IS NOT NULL ORDER BY timestamp");
  db = self->_db;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke;
  v19[3] = &unk_1E4D5B6F0;
  v20 = v6;
  v11 = v7;
  v21 = v11;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_2;
  v18[3] = &unk_1E4D5B4B0;
  v18[4] = &v22;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_3;
  v15[3] = &unk_1E4D5B5C0;
  v12 = v20;
  v16 = v12;
  v17 = &v22;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v8, v19, v18, v15);
  v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindNamedParam:toNSString:", ":extensionBundleId", v4);

  objc_msgSend(*(id *)(a1 + 32), "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindNamedParam:toNSString:", ":widgetKind", v5);

  objc_msgSend(v10, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "family"));
  objc_msgSend(*(id *)(a1 + 32), "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindNamedParam:toNSString:", ":containerBundleIdentifier", v7);

  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "bindNamedParam:toInt64:", ":date", (uint64_t)v9);
  }

}

uint64_t __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 *v16;

  v3 = a2;
  objc_msgSend(v3, "getDoubleAsNSNumberForColumnName:table:", "score", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D81160];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0D81168];
    objc_msgSend(v4, "doubleValue");
    v9 = v8;
    objc_msgSend(v3, "getDoubleForColumnName:table:", "duration", 0);
    objc_msgSend(v7, "relevanceWithScore:duration:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryWithDate:relevance:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "entryWithDate:relevance:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v13 = (void *)MEMORY[0x1E0D81230];
  objc_msgSend(v3, "getNSStringForColumnName:table:", "suggestionId", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v12, v14, objc_msgSend(v3, "getInt64ForColumnName:table:", "suggestionMappingReason", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v15);
  v16 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v16;
}

uint64_t __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (int64_t)mostRecentAbuseControlOutcomeForSuggestionId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke;
  v13[3] = &unk_1E4D5B438;
  v14 = v4;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_2;
  v12[3] = &unk_1E4D5B4B0;
  v12[4] = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3;
  v10[3] = &unk_1E4D5B518;
  v7 = v14;
  v11 = v7;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT outcome FROM abuseControlOutcomes WHERE suggestionId = :suggestionId ORDER BY timestamp DESC LIMIT 1"), v13, v12, v10);
  v8 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":suggestionId", *(_QWORD *)(a1 + 32));
}

uint64_t __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnName:table:", "outcome", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)addAbuseControlOutcomeForSuggestion:(id)a3 forTimestamp:(int64_t)a4 outcome:(int64_t)a5
{
  id v8;
  _PASSqliteDatabase *db;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  db = self->_db;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke;
  v16[3] = &unk_1E4D5BC90;
  v17 = v8;
  v18 = a4;
  v19 = a5;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2;
  v13[3] = &unk_1E4D5B5C0;
  v11 = v17;
  v14 = v11;
  v15 = &v20;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO abuseControlOutcomes (suggestionId, timestamp, outcome) VALUES (:suggestionId, :timestamp, :outcome)"), v16, 0, v13);
  LOBYTE(a4) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a4;
}

void __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":suggestionId", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":timestamp", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":outcome", a1[6]);

}

uint64_t __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)addAbuseControlOutcomes:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v5 = (void *)MEMORY[0x1E0D81630];
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke;
  v9[3] = &unk_1E4D5BCB8;
  v7 = v4;
  v10 = v7;
  v11 = v12;
  LOBYTE(v5) = (objc_msgSend(v5, "writeTransactionWithHandle:failableBlock:", db, v9) & 1) == 0;

  _Block_object_dispose(v12, 8);
  return (char)v5;
}

uint64_t __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[6];
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "db");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = 3221225472;
        v16[2] = __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_2;
        v16[3] = &unk_1E4D5B438;
        v16[4] = v10;
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3;
        v15[3] = &unk_1E4D5B5C0;
        v12 = *(_QWORD *)(a1 + 40);
        v15[4] = v10;
        v15[5] = v12;
        v16[0] = v8;
        objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO abuseControlOutcomes (suggestionId, timestamp, outcome) VALUES (:suggestionId, :timestamp, :outcome)"), v16, 0, v15);

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          v13 = *MEMORY[0x1E0D81680];

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }

  v13 = *MEMORY[0x1E0D81678];
LABEL_11:

  return v13;
}

void __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":suggestionId", v4);

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":timestamp", (uint64_t)v5);
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":outcome", objc_msgSend(*(id *)(a1 + 32), "abuseControlOutcome"));

}

uint64_t __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)clearOldAbuseControlOutcomeData
{
  _PASSqliteDatabase *db;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2;
  v5[3] = &unk_1E4D5B488;
  v5[4] = &v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM abuseControlOutcomes WHERE timestamp < :timestamp"), &__block_literal_global_523, 0, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":timestamp", (uint64_t)(v3 + -1209600.0));

}

uint64_t __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)fetchAbuseControlOutcomesForSuggestion:(id)a3 sinceDate:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  _PASSqliteDatabase *db;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__15;
  v28 = __Block_byref_object_dispose__15;
  v29 = (id)objc_opt_new();
  if (v7)
    v8 = CFSTR("SELECT timestamp, outcome FROM abuseControlOutcomes WHERE suggestionId = :suggestionId AND timestamp > :timestamp ORDER BY timestamp");
  else
    v8 = CFSTR("SELECT timestamp, outcome FROM abuseControlOutcomes WHERE suggestionId = :suggestionId ORDER BY timestamp");
  db = self->_db;
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke;
  v21[3] = &unk_1E4D5B6F0;
  v22 = v6;
  v11 = v7;
  v23 = v11;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_2;
  v18[3] = &unk_1E4D5B460;
  v19 = v22;
  v20 = &v24;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3;
  v15[3] = &unk_1E4D5B5C0;
  v12 = v19;
  v16 = v12;
  v17 = &v24;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v8, v21, v18, v15);
  v13 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":suggestionId", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "bindNamedParam:toInt64:", ":timestamp", (uint64_t)v4);
  }

}

uint64_t __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  v4 = (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "timestamp", 0);
  v5 = objc_msgSend(v3, "getIntegerForColumnName:table:", "outcome", 0);

  objc_msgSend(MEMORY[0x1E0D81238], "outcomeWithSuggestionId:timestamp:abuseControlOutcome:", *(_QWORD *)(a1 + 32), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v7;
}

uint64_t __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (BOOL)addStackConfigStatistics:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[3];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 1;
  v5 = (void *)MEMORY[0x1E0D81630];
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke;
  v9[3] = &unk_1E4D5BD00;
  v7 = v4;
  v10 = v7;
  v11 = v13;
  v12 = &v15;
  objc_msgSend(v5, "writeTransactionWithHandle:failableBlock:", db, v9);
  LOBYTE(v5) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return (char)v5;
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unsigned __int8 *v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2;
  v34[3] = &unk_1E4D5B438;
  v35 = v4;
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3;
  v32[3] = &unk_1E4D5B518;
  v7 = v35;
  v33 = v7;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM stackConfigurationHistory WHERE timestamp < :cutoffTimestamp"), v34, 0, v32);

  objc_msgSend(v3, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_532;
  v30[3] = &unk_1E4D5B438;
  v31 = *(id *)(a1 + 32);
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_533;
  v27[3] = &unk_1E4D5B460;
  v9 = *(id *)(a1 + 32);
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v28 = v9;
  v29 = v10;
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_538;
  v24[3] = &unk_1E4D5B5C0;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 48);
  v25 = v12;
  v26 = v13;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT countOfSmartStacksWithWidget, countOfNonSmartStacksWithWidget, countOfStandaloneWidgets, countOfWidgetsWithUnknownStackKind FROM stackConfigurationHistory WHERE (widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND containerBundleIdentifier = :containerBundleIdentifier AND widgetFamily = :widgetFamily) ORDER BY timestamp DESC LIMIT 1"), v30, v27, v24);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v3, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_541;
    v22[3] = &unk_1E4D5B438;
    v23 = *(id *)(a1 + 32);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_546;
    v19[3] = &unk_1E4D5B5C0;
    v15 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 48);
    v20 = v15;
    v21 = v16;
    objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO stackConfigurationHistory (widgetBundleId, widgetKind, containerBundleIdentifier, widgetFamily, timestamp, countOfSmartStacksWithWidget, countOfNonSmartStacksWithWidget, countOfStandaloneWidgets, countOfWidgetsWithUnknownStackKind) VALUES (:widgetBundleId, :widgetKind, :containerBundleIdentifier, :widgetFamily, :timestamp, :countOfSmartStacksWithWidget, :countOfNonSmartStacksWithWidget, :countOfStandaloneWidgets, :countOfWidgetsWithUnknownStackKind)"), v22, 0, v19);

  }
  v17 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  return *v17;
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":cutoffTimestamp", (uint64_t)v3);

}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_timeline();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_532(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "widgetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":widgetBundleId", v4);

  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":widgetKind", v5);

  objc_msgSend(*(id *)(a1 + 32), "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":containerBundleIdentifier", v6);

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "widgetFamily"));
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_533(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "countOfSmartStacksWithWidget", 0);
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "countOfNonSmartStacksWithWidget", 0);
  v6 = objc_msgSend(v3, "getInt64ForColumnName:table:", "countOfStandaloneWidgets", 0);
  v7 = objc_msgSend(v3, "getInt64ForColumnName:table:", "countOfWidgetsWithUnknownStackKind", 0);

  if (v4 == objc_msgSend(*(id *)(a1 + 32), "countOfSmartStacksWithWidget")
    && v5 == objc_msgSend(*(id *)(a1 + 32), "countOfNonSmartStacksWithWidget")
    && v6 == objc_msgSend(*(id *)(a1 + 32), "countOfStandaloneWidgets")
    && v7 == objc_msgSend(*(id *)(a1 + 32), "countOfWidgetsWithUnknownStackKind"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return *MEMORY[0x1E0D81788];
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_538(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_538_cold_1(a1, (uint64_t)v3, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_541(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "widgetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":widgetBundleId", v4);

  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":widgetKind", v5);

  objc_msgSend(*(id *)(a1 + 32), "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":containerBundleIdentifier", v6);

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "widgetFamily"));
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":timestamp", (uint64_t)v8);

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfSmartStacksWithWidget", objc_msgSend(*(id *)(a1 + 32), "countOfSmartStacksWithWidget"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfNonSmartStacksWithWidget", objc_msgSend(*(id *)(a1 + 32), "countOfNonSmartStacksWithWidget"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfStandaloneWidgets", objc_msgSend(*(id *)(a1 + 32), "countOfStandaloneWidgets"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfWidgetsWithUnknownStackKind", objc_msgSend(*(id *)(a1 + 32), "countOfWidgetsWithUnknownStackKind"));

}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_546(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_546_cold_1(a1, (uint64_t)v3, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (id)fetchStackConfigStatisticsForWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _PASSqliteDatabase *db;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  int64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  int64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  int64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__15;
  v41 = __Block_byref_object_dispose__15;
  v42 = (id)objc_opt_new();
  db = self->_db;
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke;
  v32[3] = &unk_1E4D5B9B8;
  v33 = v10;
  v34 = v11;
  v35 = v12;
  v36 = a6;
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_2;
  v26[3] = &unk_1E4D5BD50;
  v30 = &v37;
  v27 = v33;
  v28 = v34;
  v29 = v35;
  v31 = a6;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4;
  v20[3] = &unk_1E4D5BD78;
  v15 = v27;
  v21 = v15;
  v16 = v28;
  v22 = v16;
  v17 = v29;
  v24 = &v37;
  v25 = a6;
  v23 = v17;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT countOfSmartStacksWithWidget, countOfNonSmartStacksWithWidget, countOfStandaloneWidgets, countOfWidgetsWithUnknownStackKind, timestamp FROM stackConfigurationHistory WHERE (widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND containerBundleIdentifier = :containerBundleIdentifier AND widgetFamily = :widgetFamily) ORDER BY timestamp"), v32, v26, v20);
  v18 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  return v18;
}

void __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetKind", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":containerBundleIdentifier", a1[6]);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":widgetFamily", a1[7]);

}

uint64_t __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned __int8 *v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = a1[6];
  v5 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v6 = (void *)MEMORY[0x1E0D81210];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_3;
  v14[3] = &unk_1E4D5BD28;
  v15 = v3;
  v10 = v3;
  objc_msgSend(v6, "stackConfigStatisticsWithWidgetBundleId:widgetKind:containerBundleIdentifier:widgetFamily:withBlock:", v7, v8, v4, v9, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  v12 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v12;
}

void __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  v4 = (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "timestamp", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v4);
  objc_msgSend(v6, "setTimestamp:", v5);

  objc_msgSend(v6, "setCountOfSmartStacksWithWidget:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfSmartStacksWithWidget", 0));
  objc_msgSend(v6, "setCountOfNonSmartStacksWithWidget:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfNonSmartStacksWithWidget", 0));
  objc_msgSend(v6, "setCountOfStandaloneWidgets:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfStandaloneWidgets", 0));
  objc_msgSend(v6, "setCountOfWidgetsWithUnknownStackKind:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfWidgetsWithUnknownStackKind", 0));

}

uint64_t __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

- (unint64_t)numberOfWidgetReloadForSuggestionInPastDay
{
  _PASSqliteDatabase *db;
  double v4;
  unint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  db = self->_db;
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v8[4] = v4 + -86400.0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_2;
  v7[3] = &unk_1E4D5B4B0;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT count(*) FROM widgetReloadForSuggestion WHERE timestamp > :cutoffTimestamp"), v8, v7, &__block_literal_global_553);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":cutoffTimestamp", *(double *)(a1 + 32));
}

uint64_t __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)didMostRecentReloadFailForExtension:(id)a3 kind:(id)a4 intent:(id)a5 cutoffDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASSqliteDatabase *db;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  db = self->_db;
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke;
  v22[3] = &unk_1E4D5BBE8;
  v16 = v13;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_2;
  v21[3] = &unk_1E4D5B4B0;
  v21[4] = &v27;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT readyForDisplay FROM widgetReloadForSuggestion WHERE timestamp > :cutoffTimestamp AND extensionBundleId = :extensionBundleId AND kind = :kind AND intentHash = :intentHash ORDER BY timestamp DESC LIMIT 1"), v22, v21, &__block_literal_global_557);
  LOBYTE(v10) = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)v10;
}

void __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":cutoffTimestamp");
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":kind", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 56), "atx_indexingHash"));

}

uint64_t __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumnName:table:", "readyForDisplay", 0) == 0;
  return *MEMORY[0x1E0D81788];
}

uint64_t __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)recordWidgetReloadForSuggestion:(id)a3 date:(id)a4 readyForDisplay:(BOOL)a5
{
  id v8;
  id v9;
  _PASSqliteDatabase *db;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke;
  v16[3] = &unk_1E4D5BDE0;
  v12 = v9;
  v17 = v12;
  v19 = a5;
  v13 = v8;
  v18 = v13;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2;
  v15[3] = &unk_1E4D5B488;
  v15[4] = &v20;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO widgetReloadForSuggestion (timestamp, readyForDisplay, extensionBundleId, kind, family, intentHash) VALUES (:timestamp, :readyForDisplay, :extensionBundleId, :kind, :family, :intentHash)"), v16, 0, v15);
  LOBYTE(db) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)db;
}

void __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":readyForDisplay", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":extensionBundleId", v6);

  objc_msgSend(*(id *)(a1 + 40), "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":kind", v7);

  objc_msgSend(v4, "bindNamedParam:toInteger:", ":family", objc_msgSend(*(id *)(a1 + 40), "family"));
  objc_msgSend(*(id *)(a1 + 40), "intentReference");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

}

uint64_t __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)clearOutdatedWidgetReloadEntries
{
  _PASSqliteDatabase *db;
  double v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v7[4] = v4 + -86400.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2;
  v6[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM widgetReloadForSuggestion WHERE timestamp < :cutoffTimestamp"), v7, 0, v6);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":cutoffTimestamp", *(double *)(a1 + 32));
}

uint64_t __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (unint64_t)numberOfSuggestedWidgetsInPastDay
{
  _PASSqliteDatabase *db;
  double v4;
  unint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  db = self->_db;
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v8[4] = v4 + -86400.0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_2;
  v7[3] = &unk_1E4D5B4B0;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT count(*) FROM suggestedWidgets WHERE firstAppearDate > :cutoffTimestamp"), v8, v7, &__block_literal_global_566);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":cutoffTimestamp", *(double *)(a1 + 32));
}

uint64_t __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)firstAppearDateOfSuggestedWidgetWithUniqueId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke;
  v11[3] = &unk_1E4D5B438;
  v7 = v4;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_2;
  v10[3] = &unk_1E4D5B4B0;
  v10[4] = &v13;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT firstAppearDate FROM suggestedWidgets WHERE widgetUniqueId = :widgetUniqueId"), v11, v10, &__block_literal_global_569);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":widgetUniqueId", *(_QWORD *)(a1 + 32));
}

uint64_t __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getDoubleForColumn:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (BOOL)recordSuggestedWidgetUniqueIdIfNotExist:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _PASSqliteDatabase *db;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  db = self->_db;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke;
  v12[3] = &unk_1E4D5B7B8;
  v9 = v4;
  v13 = v9;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2;
  v11[3] = &unk_1E4D5B488;
  v11[4] = &v15;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO suggestedWidgets (widgetUniqueId, firstAppearDate) VALUES (:widgetUniqueId, :firstAppearDate)"), v12, 0, v11);
  LOBYTE(db) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)db;
}

void __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":widgetUniqueId", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":firstAppearDate", *(double *)(a1 + 40));

}

uint64_t __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)clearOutdatedSuggestedWidgetEntries
{
  _PASSqliteDatabase *db;
  double v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v7[4] = v4 + -86400.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2;
  v6[3] = &unk_1E4D5B488;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestedWidgets WHERE firstAppearDate < :cutoffTimestamp"), v7, 0, v6);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":cutoffTimestamp", *(double *)(a1 + 32));
}

uint64_t __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionsPath, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)_openDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXInformationStore: Could not configure Sqlite database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCorruptionIfNeeded
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v1, (uint64_t)v1, "ATXInformationStore failed to remove corruption marker at %@. Error: %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)_openSqliteDatabaseAtPath:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v1, (uint64_t)v1, "ATXInformationStore failed to open a sqlite database at %@. Error: %{public}@)", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

void __41__ATXInformationStore__configureDatabase__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error configuring sqlite database: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_migrateDatabaseIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXInformationStore: unrecoverable failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)readCachedSuggestions
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXInformationStore: Error deserializing info engine cache file at path %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __44__ATXInformationStore_readCachedSuggestions__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_38();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v2), "suggestionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "sourceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v5, "ATXInformationStore: error reconstructing suggestion (id: %@, source: %@) from data blob in DB.", v6);

  OUTLINED_FUNCTION_5_0();
}

void __44__ATXInformationStore_readCachedSuggestions__block_invoke_236_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading most recently cached info suggestion from database - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeCacheWithNewSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error serializing suggestions to protobuf data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeCacheWithNewSuggestions:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_42();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_36(&dword_1A49EF000, v1, v2, "ATXInformationStore: Couldn't create info engine cache file at path %@: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_5();
}

void __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_cold_1()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_44();
  objc_msgSend(v2, "getNSStringForColumn:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_32(), "getNSStringForColumn:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v4, "ATXInformationStore: error reconstructing suggestion (id: %@, source: %@) from data blob in DB.", v5);

  OUTLINED_FUNCTION_5_0();
}

void __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_240_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading info suggestion from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_44();
  objc_msgSend(v1, "getNSStringForColumn:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_32(), "getNSStringForColumn:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "ATXInformationStore: error reconstructing suggestion (id: %@, source: %@) from data blob in DB.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_253_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error while fetching info suggestion with the latest date for source (id: %@) - %@");
  OUTLINED_FUNCTION_2();
}

void __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading criterion from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading earliest future start date among suggestions from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_264_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading earliest future end date among suggestions from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error while fetching timeof last update for info suggestion for source (id: %@) - %@");
  OUTLINED_FUNCTION_2();
}

void __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error while fetching count of timeline entries for source (id: %@) - %@");
  OUTLINED_FUNCTION_2();
}

void __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error while fetching count of timeline entries for bundleId (id: %@) - %@");
  OUTLINED_FUNCTION_2();
}

void __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "suggestionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v2;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error writing info suggestion (id: %@) - %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_5_0();
}

void __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "suggestionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v2;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error while updating the end date for Information Suggestion (id: %@) - %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_5_0();
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_8();
  objc_msgSend((id)OUTLINED_FUNCTION_41(v3), "suggestionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 32), "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2114;
  v12 = v1;
  OUTLINED_FUNCTION_9_4(&dword_1A49EF000, v0, v6, "ATXInformationStore: error deleting info suggestion (id: %@, source: %@) - %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_5();
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_296_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "suggestionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error writing info suggestion (id: %@) - %{public}@", v4);

  OUTLINED_FUNCTION_5_0();
}

void __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  OUTLINED_FUNCTION_8();
  objc_msgSend((id)OUTLINED_FUNCTION_41(v2), "suggestionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v3;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_4(&dword_1A49EF000, v0, v5, "ATXInformationStore: error deleting info suggestion (id: %@, source: %@) - %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_5();
}

void __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error deleting info suggestions from source (id: %@) - %@");
  OUTLINED_FUNCTION_2();
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading the expired suggestions to be deleted - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_308_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error deleting expired suggestions - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_8_3(&dword_1A49EF000, v0, v1, "ATXInformationStore: error deleting suggestions for sourceIdentifier %@ (excluding %@) - %@");
  OUTLINED_FUNCTION_5_2();
}

void __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "suggestionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();

  OUTLINED_FUNCTION_5_0();
}

void __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "suggestionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();

  OUTLINED_FUNCTION_5_0();
}

- (void)insertOrIgnoreProactiveStackRotationRecord:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "intent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "ATXInformationStore: unable to serialize intent %@ due to %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_0();
}

void __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "extensionBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v2;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error recording proactive stack rotation for widget %@ due to %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_5_0();
}

void __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error recording proactive stack rotation for widget %@ due to %@");
  OUTLINED_FUNCTION_2();
}

void __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[24];

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[ATXInformationStore mostRecentRotationRecordForSuggestionIdentifier:]_block_invoke_3";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = v0;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8_3(&dword_1A49EF000, v1, v2, "%s: suggestionId %@, error %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v1);
  OUTLINED_FUNCTION_5_2();
}

void __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading proactive stack rotation table from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error fetching proactive stack rotations for widget %@ due to %@");
  OUTLINED_FUNCTION_2();
}

void __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_40(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error writing user removal of suggested widget (extBundleId %@, kind %@, intent %@) - %@");
  OUTLINED_FUNCTION_10_3();
}

void __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_40(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error querying widgetSuggestionDismiss for widget (extBundleId %@, kind %@, intent %@) - %@");
  OUTLINED_FUNCTION_10_3();
}

void __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error querying widgetSuggestionDismiss for extensionBundleId %@ - %@");
  OUTLINED_FUNCTION_2();
}

void __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error querying widgetSuggestionDismiss for intent %@ - %@");
  OUTLINED_FUNCTION_2();
}

void __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error removing entries from widgetSuggestionDismiss - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error removing dismiss record from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_408_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading dismiss record from database - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__ATXInformationStore_appendDismissRecord___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  OUTLINED_FUNCTION_8();
  objc_msgSend((id)OUTLINED_FUNCTION_41(v2), "widgetBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "criterion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v3;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_4(&dword_1A49EF000, v0, v5, "ATXInformationStore: error inserting dismiss record (widget: %@, criterion: %@) - %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_5();
}

void __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_8_3(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading mostRecentTimelineEntryWithScore for extensionBundleId %@ and kind %@ - %{public}@");
  OUTLINED_FUNCTION_5_2();
}

void __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_8_3(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget for extensionBundleId %@ and kind %@ - %{public}@");
  OUTLINED_FUNCTION_5_2();
}

void __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_8_3(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading recent relevant timeline entries for extensionBundleId %@ and kind %@ - %@");
  OUTLINED_FUNCTION_5_2();
}

void __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading mostRecentTimelineUpdateOfWidget - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error expunging future entries from timelineDonations - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_440_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend((id)OUTLINED_FUNCTION_41(v2), "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_4(&dword_1A49EF000, v0, v6, "ATXInformationStore: error writing entry for extensionBundleId %@ and kind %@ - %@", (uint8_t *)&v7);

}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_445_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error expunging old entries from timelineDonations - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__ATXInformationStore_pruneTimelineEntries__block_invoke_451_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error encountered while pruning the timeline donations table - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error deleting invalid suggestions - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_8_3(&dword_1A49EF000, v0, v1, "ATXInformationStore: error fetching distinct relevance scores for extensionBundleId %@ and widgetKind %@ - %@");
  OUTLINED_FUNCTION_5_2();
}

void __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error expunging outdated entries from widgetEngagements - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  v5 = *MEMORY[0x1E0C80C00];
  NSStringForATXWidgetEngagementType(*(_QWORD *)(v1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error upserting event of type %{}@ for widget - %{public}@", v4);

  OUTLINED_FUNCTION_5_0();
}

void __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading most recent engagement for widget - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error reading widget engagement timestamps for widget - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore (fetchWidgetEngagementRecords): error fetching widget engagement records - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore (fetchWidgetTapEngagementsBetweenStartDate:endDate): error fetching widget engagement records - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore (fetchWidgetTapEngagementCountSinceStartDate): error fetching widget engagement counts - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore (fetchDistinctScoreCountForWidgets): error fetching distinct count of scores for widgets - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore (fetchDistinctWidgetsIgnoringIntentSinceDate): error reading distinct widgets - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v1, v2, "ATXInformationStore: error reading relevant timeline entries for widget %@ - %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v1, v2, "ATXInformationStore: error reading most recent abuse control outcome for suggestionID %{public}@ - %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v1, v2, "ATXInformationStore: error inserting new abuse control outcome for suggestion %{public}@ - %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "suggestionId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error writing abuse control outcome for suggestionId %{public}@ - %{public}@", v4);

  OUTLINED_FUNCTION_5_0();
}

void __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXInformationStore: error clearing old abuse control outcome data - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_16(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_10(&dword_1A49EF000, v1, v2, "ATXInformationStore: error fetching relevant abuse control outcomes for suggestion %{public}@ - %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "timeIntervalSinceReferenceDate");
  v4 = 134218242;
  v5 = v2;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, v0, v3, "ATXInformationStore: error removing rows from stackConfigurationHistory that are older than %f - %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5_2();
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_538_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v3;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[56];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "widgetBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerBundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_35(&dword_1A49EF000, a3, v8, "ATXInformationStore: error reading stackConfigurationHistory for widgetBundleId (%@) widgetKind (%@), containerBundleIdentifier (%@) widgetFamily(%ld) - %{public}@", v9);

  OUTLINED_FUNCTION_34();
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_546_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v3;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[56];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "widgetBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerBundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_35(&dword_1A49EF000, a3, v8, "ATXInformationStore: error inserting new stack configuration statistics for widgetBundleId (%@) widgetKind (%@), containerBundleIdentifier (%@) widgetFamily(%ld). Error: %{public}@", v9);

  OUTLINED_FUNCTION_34();
}

void __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  OUTLINED_FUNCTION_40(*MEMORY[0x1E0C80C00]);
  v1 = *(_QWORD *)(v0 + 64);
  v7 = 138413314;
  v8 = v2;
  v9 = 2112;
  v10 = v3;
  v11 = 2112;
  v12 = v4;
  v13 = 2048;
  v14 = v1;
  v15 = 2112;
  v16 = v5;
  OUTLINED_FUNCTION_35(&dword_1A49EF000, v6, (uint64_t)v6, "ATXInformationStore: error fetching stack confiugration history for widgetBundleId %@, widgetKind: %@, containerBundleIdentifier: %@, widgetFamily: %lld. Error: %@", (uint8_t *)&v7);
  OUTLINED_FUNCTION_10_3();
}

void __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error numberOfWidgetReloadForSuggestionInPastDay - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error didReloadFailRecentlyForWidget - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error recordWidgetReloadForSuggestionAtDate - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error clearOutdatedWidgetReloadEntries - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error numberOfSuggestedWidgetsInPastDay - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error firstAppearDateOfSuggestedWidgetWithUniqueId - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error recordSuggestedWidgetUniqueIdIfNotExist - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXInformationStore: Error clearOutdatedSuggestedWidgetEntries - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
