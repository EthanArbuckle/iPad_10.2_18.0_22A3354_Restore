@implementation BMSQLStoreManager

- (BMSQLStoreManager)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMSQLStoreManager;
  return -[BMSQLStore initWithURL:](&v4, sel_initWithURL_, a3);
}

+ (id)migrations
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("CREATE TABLE BM_MANAGED_TABLES (bm_managed_table TEXT UNIQUE PRIMARY KEY ON CONFLICT IGNORE NOT NULL, bm_source_id TEXT NOT NULL); CREATE TABLE BM_SESSION_CONTEXT (bm_rowid INTEGER PRIMARY KEY AUTOINCREMENT, bm_origin_id TEXT); CREATE TABLE BM_DERIVED_OBJECTS (bm_managed_table_rowid INTEGER NOT NULL, bm_derived_rowid INTEGER NOT NULL, bm_context_rowid INTEGER NOT NULL); CREATE TRIGGER bm_managed_table_ad AFTER DELETE ON BM_MANAGED_TABLES BEGIN DELETE FROM BM_DERIVED_OBJECTS WHERE bm_managed_table_rowid == old.rowid; END; CREATE TRIGGER bm_derived_objects_ad AFTER DELETE ON BM_DERIVED_OBJECTS   WHEN (SELECT count(*) FROM BM_DERIVED_OBJECTS WHERE bm_context_rowid == old.bm_context_rowid) == 0 BEGIN  DELETE FROM BM_SESSION_CONTEXT WHERE bm_rowid == old.bm_context_rowid; END; "));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)managedTables
{
  void *v3;
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *managedTableNames;
  void *v9;
  void *v10;

  -[BMSQLStoreManager managedTableNames](self, "managedTableNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    -[BMSQLStore db](self, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeQuery:", CFSTR("SELECT bm_managed_table FROM BM_MANAGED_TABLES;"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "next"))
    {
      do
      {
        objc_msgSend(v6, "stringForColumnIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v4, "addObject:", v7);

      }
      while ((objc_msgSend(v6, "next") & 1) != 0);
    }
    managedTableNames = self->_managedTableNames;
    self->_managedTableNames = v4;

  }
  -[BMSQLStoreManager managedTableNames](self, "managedTableNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sourcesForManagedTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[BMSQLStore db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:", CFSTR("SELECT bm_source_id FROM BM_MANAGED_TABLES WHERE bm_managed_table=?; "), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "next"))
    goto LABEL_6;
  v7 = 0;
  do
  {
    v8 = v7;
    objc_msgSend(v6, "stringForColumnIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while ((objc_msgSend(v6, "next") & 1) != 0);
  if (v7)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (void)prepareTriggerForTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER bm_%@_ai AFTER INSERT ON %@ BEGIN  INSERT INTO BM_DERIVED_OBJECTS (bm_managed_table_rowid, bm_derived_rowid, bm_context_rowid)  SELECT  t.rowid,          new.rowid,          c.rowid  FROM BM_MANAGED_TABLES t, BM_SESSION_CONTEXT c  WHERE t.bm_managed_table == '%@'  ORDER BY c.rowid DESC LIMIT 1;END;"),
    v4,
    v4,
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSQLStore db](self, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "executeUpdate:", v5);

  if ((v7 & 1) == 0)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BMSQLStoreManager prepareTriggerForTable:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER bm_%@_ad AFTER DELETE ON %@ BEGIN  DELETE FROM BM_DERIVED_OBJECTS  WHERE bm_derived_rowid == old.rowid AND    bm_managed_table_rowid == (SELECT rowid FROM BM_MANAGED_TABLES WHERE bm_managed_table == '%@'); END;"),
    v4,
    v4,
    v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSQLStore db](self, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "executeUpdate:", v9);

  if ((v11 & 1) == 0)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BMSQLStoreManager prepareTriggerForTable:].cold.1();

  }
}

- (BOOL)addManagedTable:(id)a3 derivedFromSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSQLStoreManager.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(id<BMSourceMethods>)source identifier]"));

  }
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BMSQLStoreManager addManagedTable:derivedFromStream:](self, "addManagedTable:derivedFromStream:", v8, v10);

  return v11;
}

- (BOOL)addManagedTable:(id)a3 derivedFromStream:(id)a4
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BMSQLStoreManager sourcesForManagedTable:](self, "sourcesForManagedTable:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject containsObject:](v8, "containsObject:", v6))
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v7;
        v30 = 2112;
        v31 = v8;
        v32 = 2112;
        v33 = v6;
        _os_log_debug_impl(&dword_1B399A000, v9, OS_LOG_TYPE_DEBUG, "Table: %@ already has sources: %@, so not registering stream: %@", buf, 0x20u);
      }
      goto LABEL_5;
    }
    -[BMSQLStore db](self, "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "tableExists:", v7);

    if ((v12 & 1) != 0)
    {
      -[BMSQLStoreManager managedTables](self, "managedTables");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v7);

      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if ((v14 & 1) != 0)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412802;
          v29 = v7;
          v30 = 2112;
          v31 = v8;
          v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_1B399A000, v15, OS_LOG_TYPE_DEFAULT, "Updating existing managed table '%@' with sources: %@ to add new source: %@", buf, 0x20u);
        }

        v9 = -[NSObject mutableCopy](v8, "mutableCopy");
        -[NSObject addObject:](v9, "addObject:", v6);
        -[NSObject componentsJoinedByString:](v9, "componentsJoinedByString:", CFSTR(","));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMSQLStore db](self, "db");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "executeUpdate:", CFSTR("UPDATE BM_MANAGED_TABLES SET bm_source_id = ? WHERE bm_managed_table = ?;"),
                v17,
                v7);

        if ((v19 & 1) != 0)
        {

LABEL_5:
          v10 = 1;
LABEL_27:

          goto LABEL_28;
        }
        __biome_log_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          -[BMSQLStore db](self, "db");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastError");
          v25 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v7;
          v30 = 2112;
          v31 = v6;
          v32 = 2112;
          v33 = v25;
          _os_log_fault_impl(&dword_1B399A000, v22, OS_LOG_TYPE_FAULT, "Failed to update managed table name (%@, %@). %@", buf, 0x20u);

        }
      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412546;
          v29 = v7;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1B399A000, v15, OS_LOG_TYPE_DEFAULT, "Adding managed table '%@' derived from %@.", buf, 0x16u);
        }

        -[BMSQLStore db](self, "db");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "executeUpdate:", CFSTR("INSERT INTO BM_MANAGED_TABLES (bm_managed_table, bm_source_id) VALUES (?, ?)"), v7, v6);

        if ((v21 & 1) != 0)
        {
          -[BMSQLStoreManager prepareTriggerForTable:](self, "prepareTriggerForTable:", v7);
          -[BMSQLStoreManager managedTableNames](self, "managedTableNames");
          v9 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v9, "addObject:", v7);
          goto LABEL_5;
        }
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          -[BMSQLStore db](self, "db");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastError");
          v27 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v7;
          v30 = 2112;
          v31 = v6;
          v32 = 2112;
          v33 = v27;
          _os_log_fault_impl(&dword_1B399A000, v9, OS_LOG_TYPE_FAULT, "Failed to insert managed table name (%@, %@). %@", buf, 0x20u);

        }
      }
    }
    else
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMSQLStoreManager addManagedTable:derivedFromStream:].cold.1();
    }
    v10 = 0;
    goto LABEL_27;
  }
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[BMSQLStoreManager addManagedTable:derivedFromStream:].cold.2(v8);
  v10 = 0;
LABEL_28:

  return v10;
}

- (void)beginManagedSessionWithEvent:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "eventBody");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v10;
  }
  v11 = v6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSQLStoreManager.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[event respondsToSelector:@selector(identifier)]"));

  }
  -[BMSQLStore db](self, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT INTO BM_SESSION_CONTEXT (bm_origin_id) VALUES (?)"), v8);

  -[BMSQLStoreManager setSessionEvent:](self, "setSessionEvent:", v11);
}

- (void)endManagedSession
{
  -[BMSQLStoreManager setSessionEvent:](self, "setSessionEvent:", 0);
}

- (id)deleteRowsDerivedFromEvents:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v40;
  id v41;
  id obj;
  uint64_t v43;
  BMSQLStoreManager *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[BMSQLStore db](self, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v6 = objc_msgSend(v5, "startSavePointWithName:error:", CFSTR("bm_deletion"), &v56);
    v7 = v56;

    if ((v6 & 1) == 0)
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[BMSQLStoreManager deleteRowsDerivedFromEvents:].cold.2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v41 = v4;
    obj = v4;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v45)
    {
      v43 = *(_QWORD *)v53;
      v44 = self;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v53 != v43)
            objc_enumerationMutation(obj);
          v46 = v16;
          -[BMSQLStoreManager deleteRowsDerivedFromEvent:](self, "deleteRowsDerivedFromEvent:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v49 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
                v23 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v15, "objectForKeyedSubscript:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "integerValue");
                objc_msgSend(v17, "objectForKeyedSubscript:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v26, "integerValue") + v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, v22);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v19);
          }

          v16 = v46 + 1;
          self = v44;
        }
        while (v46 + 1 != v45);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v45);
    }

    -[BMSQLStore db](self, "db");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v40;
    v29 = objc_msgSend(v28, "releaseSavePointWithName:error:", CFSTR("bm_deletion"), &v47);
    v30 = v47;

    if ((v29 & 1) == 0)
    {
      __biome_log_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[BMSQLStoreManager deleteRowsDerivedFromEvents:].cold.1((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37);

    }
    v38 = (void *)objc_msgSend(v15, "copy");

    v4 = v41;
  }
  else
  {
    v38 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v38;
}

- (id)deleteRowsDerivedFromEvent:(id)a3
{
  id v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSQLStoreManager.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[event respondsToSelector:@selector(identifier)]"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[BMSQLStoreManager managedTables](self, "managedTables");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v27;
    v21 = v5;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[BMSQLStore db](self, "db");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "executeQuery:", CFSTR("SELECT bm_derived_rowid FROM BM_DERIVED_OBJECTS d, BM_SESSION_CONTEXT c, BM_MANAGED_TABLES t WHERE t.bm_managed_table==? AND c.bm_origin_id==? AND bm_managed_table_rowid==t.rowid AND bm_context_rowid==c.rowid"), v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "next"))
        {
          do
          {
            v12 = objc_msgSend(v10, "longForColumnIndex:", 0);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v13);

          }
          while ((objc_msgSend(v10, "next") & 1) != 0);
        }
        v14 = -[BMSQLStoreManager deleteRows:fromTable:](self, "deleteRows:fromTable:", v11, v7);
        if ((int)v14 >= 1)
        {
          __biome_log_for_category();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMSQLStore dbURL](self, "dbURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = v16;
            v32 = 2112;
            v33 = v7;
            v34 = 2112;
            v35 = v17;
            _os_log_impl(&dword_1B399A000, v15, OS_LOG_TYPE_INFO, "Deleted %@ rows from %@. DB: %@.", buf, 0x20u);

            v5 = v21;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v7);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v25);
  }

  return v24;
}

- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSQLStoreManager deleteRowsDerivedFromStream:eventIdentifiers:](self, "deleteRowsDerivedFromStream:eventIdentifiers:", v8, v9, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  BMSQLStoreManager *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BMSQLStore db](self, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%%%@%%"), v6);
  v10 = CFSTR("SELECT rowid,bm_managed_table from BM_MANAGED_TABLES WHERE bm_source_id LIKE ?");
  objc_msgSend(v8, "executeQuery:", CFSTR("SELECT rowid,bm_managed_table from BM_MANAGED_TABLES WHERE bm_source_id LIKE ?"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (objc_msgSend(v11, "next"))
  {
    v13 = CFSTR("SELECT rowid,bm_managed_table from BM_MANAGED_TABLES WHERE bm_source_id LIKE ?");
    v34 = self;
    v37 = v11;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v11, "longForColumnIndex:", 0));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringForColumnIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(&stru_1E664A9D8, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v7, "count") - 1, CFSTR("?,"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("SELECT bm_derived_rowid FROM BM_DERIVED_OBJECTS d, BM_SESSION_CONTEXT c WHERE c.bm_origin_id IN (%@) AND d.bm_managed_table_rowid==? AND d.bm_context_rowid==c.rowid"), v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v14;
      -[BMSQLStore db](self, "db");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObject:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (__CFString *)v18;
      objc_msgSend(v20, "executeQuery:values:error:", v18, v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "next"))
      {
        do
        {
          v24 = objc_msgSend(v22, "longForColumnIndex:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v25);

        }
        while ((objc_msgSend(v22, "next") & 1) != 0);
      }
      objc_msgSend(v22, "close");
      v26 = -[BMSQLStoreManager deleteRows:fromTable:](self, "deleteRows:fromTable:", v23, v15);
      if ((int)v26 >= 1)
      {
        __biome_log_for_category();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26);
          v36 = v19;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMSQLStore dbURL](self, "dbURL");
          v29 = v7;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v42 = v28;
          v43 = 2112;
          v44 = v15;
          v45 = 2112;
          v46 = v35;
          v47 = 2112;
          v48 = v30;
          _os_log_impl(&dword_1B399A000, v27, OS_LOG_TYPE_INFO, "Deleted %@ rows from %@ derived from %@. DB: %@.", buf, 0x2Au);

          v7 = v29;
          self = v34;

          v19 = v36;
        }

      }
      v12 = (v26 + v12);

      v11 = v37;
      v10 = v38;
      v13 = v38;
    }
    while ((objc_msgSend(v37, "next") & 1) != 0);
  }
  v39 = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (int)deleteRows:(id)a3 fromTable:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&stru_1E664A9D8, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v6, "count") - 1, CFSTR("?,"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE rowid IN (%@)"), v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMSQLStore db](self, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executeUpdate:withArgumentsInArray:", v12, v6);

    -[BMSQLStore db](self, "db");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "changes");

    if ((v14 & 1) != 0)
    {
      if (v9 == v16)
      {
LABEL_10:

        goto LABEL_11;
      }
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 - v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v18;
        v23 = 2112;
        v24 = v19;
        v25 = 2112;
        v26 = v7;
        _os_log_error_impl(&dword_1B399A000, v17, OS_LOG_TYPE_ERROR, "Failed to delete %@ of %@ rows derived from %@.", buf, 0x20u);

      }
    }
    else
    {
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BMSQLStoreManager deleteRows:fromTable:].cold.1();
    }

    goto LABEL_10;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (NSMutableSet)managedTableNames
{
  return self->_managedTableNames;
}

- (BMIdentifiable)sessionEvent
{
  return self->_sessionEvent;
}

- (void)setSessionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEvent, 0);
  objc_storeStrong((id *)&self->_managedTableNames, 0);
}

- (void)prepareTriggerForTable:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(v0, v1), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1B399A000, v4, v5, "Failed to create managed table deletion trigger for %@. %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)prepareTriggerForTable:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(v0, v1), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1B399A000, v4, v5, "Failed to create managed table insertion trigger for %@. %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)addManagedTable:derivedFromStream:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(v0, v1), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1B399A000, v4, v5, "Table '%@' does not exist in database %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)addManagedTable:(os_log_t)log derivedFromStream:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B399A000, log, OS_LOG_TYPE_ERROR, "Argument must be an NSString.", v1, 2u);
}

- (void)deleteRowsDerivedFromEvents:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1B399A000, a2, a3, "Failed to release deletion savepoint. %@", a5, a6, a7, a8, 2u);
}

- (void)deleteRowsDerivedFromEvents:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1B399A000, a2, a3, "Failed to start deletion savepoint. %@", a5, a6, a7, a8, 2u);
}

- (void)deleteRows:fromTable:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(v0, v1), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1B399A000, v4, v5, "Failed to delete rows %@. %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

@end
