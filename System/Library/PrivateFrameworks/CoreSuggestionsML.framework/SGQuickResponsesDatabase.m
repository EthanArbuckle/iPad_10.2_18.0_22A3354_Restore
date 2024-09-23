@implementation SGQuickResponsesDatabase

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5
{
  return -[SGQuickResponsesDatabase initInDirectory:inMemory:withMigration:forTools:](self, "initInDirectory:inMemory:withMigration:forTools:", a3, a4, a5, 0);
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5 forTools:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  SGQuickResponsesDatabase *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _PASSqliteDatabase *db;
  uint64_t v16;
  _PASSqliteDatabase *v17;
  SGQuickResponsesDatabase *v18;
  uint8_t v20[16];
  objc_super v21;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGQuickResponsesDatabase;
  v11 = -[SGQuickResponsesDatabase init](&v21, sel_init);
  if (!v11)
    goto LABEL_17;
  v12 = (void *)MEMORY[0x220753E80]();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE71AD8], "suggestionsDirectory");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesDatabase: Unable to create directory for database", v20, 2u);
      }
      objc_autoreleasePoolPop(v12);
      goto LABEL_19;
    }
  }
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("quickresponses.db"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[SGQuickResponsesDatabase _openAnotherHandleForPath:](SGQuickResponsesDatabase, "_openAnotherHandleForPath:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    db = v11->_db;
    v11->_db = (_PASSqliteDatabase *)v14;

  }
  else
  {
    +[SGQuickResponsesDatabase _openFreshHandleForPath:inMemory:](SGQuickResponsesDatabase, "_openFreshHandleForPath:inMemory:", v13, v8);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v11->_db;
    v11->_db = (_PASSqliteDatabase *)v16;

    if (!v11->_db)
    {
LABEL_18:

      objc_autoreleasePoolPop(v12);
LABEL_19:
      v18 = 0;
      goto LABEL_20;
    }
    if (v7)
    {
      if (!-[SGQuickResponsesDatabase _performMigrationsWithPath:inMemory:attemptIteration:](v11, "_performMigrationsWithPath:inMemory:attemptIteration:", v13, v8, 0))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase: Migrations failed", v20, 2u);
        }
        goto LABEL_18;
      }
    }
    else
    {
      -[SGQuickResponsesDatabase _handleCorruptionWithCheck:path:inMemory:](v11, "_handleCorruptionWithCheck:path:inMemory:", 1, v13, v8);
    }
  }
  if (!v11->_db)
    goto LABEL_18;

  objc_autoreleasePoolPop(v12);
LABEL_17:
  v18 = v11;

LABEL_20:
  return v18;
}

- (BOOL)_handleCorruptionWithCheck:(BOOL)a3 path:(id)a4 inMemory:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  _PASSqliteDatabase **p_db;
  _PASSqliteDatabase *db;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a5)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7A640], "corruptionMarkerPathForPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v10, 0),
          v11,
          !v12))
    {
      v9 = 1;
    }
    else
    {
      db = self->_db;
      p_db = &self->_db;
      -[_PASSqliteDatabase closePermanently](db, "closePermanently");
      objc_msgSend(MEMORY[0x24BE7A640], "truncateDatabaseAtPath:", v8);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v16 = objc_msgSend(v15, "removeItemAtPath:error:", v10, &v21);
      v17 = v21;

      if ((v16 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "localizedDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        v24 = 2112;
        v25 = v20;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase failed to remove corruption marker at %@: %@", buf, 0x16u);

      }
      +[SGQuickResponsesDatabase _openFreshHandleForPath:inMemory:](SGQuickResponsesDatabase, "_openFreshHandleForPath:inMemory:", v8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18 != 0;
      if (v18)
        objc_storeStrong((id *)p_db, v18);

    }
  }

  return v9;
}

- (BOOL)_performMigrationsWithPath:(id)a3 inMemory:(BOOL)a4 attemptIteration:(int)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  SGQuickResponsesDatabase *v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!-[SGQuickResponsesDatabase _handleCorruptionWithCheck:path:inMemory:](self, "_handleCorruptionWithCheck:path:inMemory:", 1, v8, v6))
  {
LABEL_5:
    v10 = 0;
    goto LABEL_20;
  }
  v9 = (a5 + 1);
  if (a5 >= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = a5 + 1;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase not migrating, too many attempts (%d)", buf, 8u);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SGQuickResponsesDatabase migrating db", buf, 2u);
  }
  v11 = objc_alloc(MEMORY[0x24BE7A5C0]);
  v17 = self;
  v10 = 1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithMigrationObjects:", v12);

  switch(objc_msgSend(v13, "migrateDatabases"))
  {
    case 0u:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x24BDACB70];
      v15 = "SGQuickResponsesDatabase could not perform migrations (device locked?), try again later";
      goto LABEL_22;
    case 1u:
      break;
    case 2u:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x24BDACB70];
      v15 = "SGQuickResponsesDatabase migrations failed, cannot use database";
      goto LABEL_22;
    case 3u:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x24BDACB70];
      v15 = "SGQuickResponsesDatabase has a future schema version, cannot use database";
      goto LABEL_22;
    case 4u:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x24BDACB70];
      v15 = "SGQuickResponsesDatabase got unexpected migration result of 'step completed', will not use database";
LABEL_22:
      _os_log_error_impl(&dword_21ABF4000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
LABEL_18:
      v10 = 0;
      break;
    case 5u:
    case 6u:
      if (!-[SGQuickResponsesDatabase _handleCorruptionWithCheck:path:inMemory:](self, "_handleCorruptionWithCheck:path:inMemory:", 0, v8, v6))goto LABEL_18;

      v10 = -[SGQuickResponsesDatabase _performMigrationsWithPath:inMemory:attemptIteration:](self, "_performMigrationsWithPath:inMemory:attemptIteration:", v8, v6, v9);
      v13 = 0;
      break;
    default:
      goto LABEL_18;
  }

LABEL_20:
  return v10;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  const __CFString *v12;
  _QWORD v13[3];
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[2];
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("CREATE TABLE responses(   lang_response TEXT PRIMARY KEY,     displayed INTEGER NOT NULL DEFAULT 0,     selected INTEGER NOT NULL DEFAULT 0,     matched INTEGER NOT NULL DEFAULT 0) WITHOUT ROWID");
  v17[1] = CFSTR("CREATE TABLE responses_totals(   language TEXT PRIMARY KEY,     opportunities INTEGER NOT NULL DEFAULT 0,     displayed INTEGER NOT NULL DEFAULT 0,     selected INTEGER NOT NULL DEFAULT 0,     matched INTEGER NOT NULL DEFAULT 0,     unmatched INTEGER NOT NULL DEFAULT 0) WITHOUT ROWID");
  v18[0] = &unk_24DDCF768;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[1] = &unk_24DDCF780;
  v16 = CFSTR("CREATE TABLE messages(   reply TEXT NOT NULL,    language TEXT NOT NULL,     prompt TEXT NOT NULL,     recipient TEXT NOT NULL,     sent_at DOUBLE NOT NULL,     filtering BOOL NOT NULL,     filtered BOOL NOT NULL)");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v18[2] = &unk_24DDCF798;
  v15 = CFSTR("CREATE TABLE custom_responses(   reply TEXT NOT NULL,     language TEXT NOT NULL,     prompt_embedding BLOB NOT NULL,     decayed_times_used DOUBLE NOT NULL,     first_seen DOUBLE NOT NULL,     last_seen DOUBLE NOT NULL)");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v18[3] = &unk_24DDCF7B0;
  v14 = CFSTR("CREATE TABLE custom_responses_version(   current_version INTEGER NOT NULL,     profanity_locale TEXT NOT NULL)");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = &unk_24DDCF7C8;
  v13[0] = CFSTR("CREATE TABLE cr_per_recipient_counts(   reply TEXT NOT NULL,     language TEXT NOT NULL,     recipient TEXT NOT NULL,     decayed_times_used DOUBLE NOT NULL, UNIQUE(reply, language, recipient))");
  v13[1] = CFSTR("ALTER TABLE custom_responses ADD COLUMN usage_spread DOUBLE NOT NULL DEFAULT 0.0");
  v13[2] = CFSTR("UPDATE custom_responses SET usage_spread = (SELECT CAST(u AS FLOAT)/c FROM    (SELECT count(distinct(recipient)) AS u FROM messages WHERE messages.reply=custom_responses.reply AND messages.language=custom_responses.language),    (SELECT count(distinct(recipient)) AS c FROM messages));");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  v18[5] = &unk_24DDCF7E0;
  v12 = CFSTR("CREATE TABLE responses_snapshot(   lang_response TEXT PRIMARY KEY,     displayed INTEGER NOT NULL DEFAULT 0,     selected INTEGER NOT NULL DEFAULT 0,     matched INTEGER NOT NULL DEFAULT 0) WITHOUT ROWID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  v18[6] = &unk_24DDCF7F8;
  v11[0] = CFSTR("DELETE FROM responses");
  v11[1] = CFSTR("DELETE FROM responses_totals");
  v11[2] = CFSTR("DELETE FROM responses_snapshot");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x24BDBD1A8];
}

- (_PASSqliteDatabase)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

+ (id)_openFreshHandleForPath:(id)a3 inMemory:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint8_t v8[16];

  v4 = a4;
  v5 = a3;
  if (v4)
    objc_msgSend(MEMORY[0x24BE7A640], "sqliteDatabaseInMemoryWithError:errorHandler:", 0, 0);
  else
    objc_msgSend(MEMORY[0x24BE7A640], "initializeDatabase:withContentProtection:newDatabaseCreated:errorHandler:", v5, 3, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase: Unable to initialize database.", v8, 2u);
  }

  return v6;
}

+ (id)_openAnotherHandleForPath:(id)a3
{
  void *v3;
  id v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  objc_msgSend(MEMORY[0x24BE7A640], "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", a3, 3, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA journal_mode=WAL"), 0, 0, 0);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA synchronous=NORMAL"), 0, 0, 0);
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesDatabase: Unable to open existing database: %@", buf, 0xCu);
  }

  return v3;
}

@end
