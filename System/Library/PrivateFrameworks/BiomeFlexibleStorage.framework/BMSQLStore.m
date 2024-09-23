@implementation BMSQLStore

- (BMSQLStore)initWithURL:(id)a3
{
  void *v4;
  BMSQLStore *v5;

  +[_bmFMDatabase databaseWithURL:](_bmFMDatabase, "databaseWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMSQLStore initWithFMDBHandle:](self, "initWithFMDBHandle:", v4);

  return v5;
}

- (BMSQLStore)initWithFMDBHandle:(id)a3
{
  id v5;
  void *v6;
  BMSQLStore *v7;
  BMSQLStore *v8;
  uint64_t v9;
  NSURL *dbURL;
  BMSQLStore *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend(v5, "databaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)BMSQLStore;
    v7 = -[BMSQLStore init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_db, a3);
      objc_msgSend(v5, "databaseURL");
      v9 = objc_claimAutoreleasedReturnValue();
      dbURL = v8->_dbURL;
      v8->_dbURL = (NSURL *)v9;

      v8->_dbIsReady = 0;
      v8->_dbLock._os_unfair_lock_opaque = 0;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)sqliteHandle
{
  void *v2;
  void *v3;

  -[BMSQLStore db](self, "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "sqliteHandle");

  return v3;
}

+ (NSArray)migrations
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ not implemented by child class %@"), v4, v6);

  return 0;
}

- (_bmFMDatabase)db
{
  os_unfair_lock_s *p_dbLock;
  void *v4;
  _bmFMDatabase **p_db;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _bmFMDatabase *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  _bmFMDatabase *v37;
  void *v38;
  _bmFMDatabase *v39;
  id v40;
  char v41;
  NSObject *v42;
  _bmFMDatabase *v43;
  BOOL v44;
  NSObject *v45;
  void *v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!-[BMSQLStore dbIsReady](self, "dbIsReady"))
  {
    p_dbLock = &self->_dbLock;
    os_unfair_lock_lock(&self->_dbLock);
    if (-[BMSQLStore dbIsReady](self, "dbIsReady"))
    {
LABEL_55:
      os_unfair_lock_unlock(p_dbLock);
      return self->_db;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    p_db = &self->_db;
    -[_bmFMDatabase databaseURL](self->_db, "databaseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    if (!-[_bmFMDatabase open](self->_db, "open"))
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BMSQLStore db].cold.7((id *)&self->_db);
      goto LABEL_54;
    }
    if (!-[_bmFMDatabase executeUpdate:](*p_db, "executeUpdate:", CFSTR("PRAGMA foreign_keys = ON")))
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMSQLStore db].cold.6((id *)&self->_db);

    }
    if (!-[_bmFMDatabase executeUpdate:](*p_db, "executeUpdate:", CFSTR("CREATE TABLE IF NOT EXISTS BM_METADATA (bm_key TEXT UNIQUE PRIMARY KEY ON CONFLICT REPLACE NOT NULL, bm_value TEXT)")))
    {
      v10 = 1;
      v11 = -6;
      while (!__CFADD__(v11++, 1))
      {
        usleep(1000 * v10);
        v10 = (int)(((double)arc4random_uniform(0x190u) / 100.0 + 1.7) * (double)v10);
        if (-[_bmFMDatabase executeUpdate:](*p_db, "executeUpdate:", CFSTR("CREATE TABLE IF NOT EXISTS BM_METADATA (bm_key TEXT UNIQUE PRIMARY KEY ON CONFLICT REPLACE NOT NULL, bm_value TEXT)")))
        {
          goto LABEL_18;
        }
      }
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BMSQLStore db].cold.5((id *)&self->_db);

    }
LABEL_18:
    -[_bmFMDatabase executeQuery:](*p_db, "executeQuery:", CFSTR("SELECT bm_value FROM BM_METADATA WHERE bm_key='schema_version'"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject next](v13, "next"))
      v15 = -[NSObject intForColumn:](v13, "intForColumn:", CFSTR("bm_value"));
    else
      v15 = 0;
    objc_msgSend((id)objc_opt_class(), "migrations");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") <= (unint64_t)(int)v15)
    {
      self->_dbIsReady = 1;
LABEL_53:

LABEL_54:
      goto LABEL_55;
    }
    v48 = v13;
    v17 = *p_db;
    v56 = 0;
    v18 = -[_bmFMDatabase startSavePointWithName:error:](v17, "startSavePointWithName:error:", CFSTR("migration"), &v56);
    v49 = v56;
    if (!v18)
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[BMSQLStore db].cold.4();

    }
    objc_msgSend(v16, "subarrayWithRange:", (int)v15, objc_msgSend(v16, "count") - (int)v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB37E8];
      v25 = objc_msgSend(v20, "count") + (int)v15;
      v26 = v24;
      v4 = v22;
      objc_msgSend(v26, "numberWithUnsignedInteger:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = v23;
      v60 = 2112;
      v61 = v27;
      _os_log_impl(&dword_1B399A000, v21, OS_LOG_TYPE_DEFAULT, "Migrating managed store from schema %@ to %@", buf, 0x16u);

    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v16 = v20;
    v28 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v28)
    {
      v29 = v28;
      v47 = v4;
      v30 = *(_QWORD *)v53;
LABEL_30:
      v31 = 0;
      v32 = v15;
      while (1)
      {
        if (*(_QWORD *)v53 != v30)
          objc_enumerationMutation(v16);
        v33 = -[_bmFMDatabase executeStatements:](*p_db, "executeStatements:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v31));
        __biome_log_for_category();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (!v33)
          break;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32 + v31 + 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v59 = v36;
          _os_log_impl(&dword_1B399A000, v35, OS_LOG_TYPE_DEFAULT, "Successful schema migration to version %@.", buf, 0xCu);

        }
        if (v29 == ++v31)
        {
          v29 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          LODWORD(v15) = v32 + v31;
          if (v29)
            goto LABEL_30;
          v15 = (v32 + v31);
          v4 = v47;
          goto LABEL_39;
        }
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[BMSQLStore db].cold.3(v32 + v31 + 1, (id *)&self->_db, v35);

      __biome_log_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      v4 = v47;
      p_dbLock = &self->_dbLock;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[BMSQLStore db].cold.2(v42);

      v43 = *p_db;
      v50 = 0;
      v44 = -[_bmFMDatabase rollbackToSavePointWithName:error:](v43, "rollbackToSavePointWithName:error:", CFSTR("migration"), &v50);
      v40 = v50;
      if (!v44)
      {
        v41 = 0;
        goto LABEL_49;
      }
    }
    else
    {
LABEL_39:

      v37 = *p_db;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_bmFMDatabase executeUpdate:](v37, "executeUpdate:", CFSTR("INSERT INTO BM_METADATA (bm_key, bm_value) VALUES ('schema_version', ?); "),
        v38);

      v39 = *p_db;
      v51 = 0;
      LOBYTE(v37) = -[_bmFMDatabase releaseSavePointWithName:error:](v39, "releaseSavePointWithName:error:", CFSTR("migration"), &v51);
      v40 = v51;
      p_dbLock = &self->_dbLock;
      if ((v37 & 1) == 0)
      {
        v41 = 1;
LABEL_49:
        __biome_log_for_category();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          -[BMSQLStore db].cold.1(v41, (uint64_t)v40, v45);

        goto LABEL_52;
      }
    }
    self->_dbIsReady = 1;
LABEL_52:
    v13 = v48;

    goto LABEL_53;
  }
  return self->_db;
}

- (NSURL)dbURL
{
  return self->_dbURL;
}

- (BOOL)dbIsReady
{
  return self->_dbIsReady;
}

- (os_unfair_lock_s)dbLock
{
  return self->_dbLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)db
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B399A000, v2, v3, "Failed to open database. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
