@implementation BMSQLDatabase

- (BMSQLDatabase)init
{
  return -[BMSQLDatabase initWithPrivileges:isColumnAccessLoggingEnabled:](self, "initWithPrivileges:isColumnAccessLoggingEnabled:", 0, 0);
}

- (BMSQLDatabase)initWithUseCase:(id)a3
{
  return -[BMSQLDatabase initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:](self, "initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:", MEMORY[0x1E0C9AA60], 0, 0, a3);
}

- (BMSQLDatabase)initWithPrivileges:(id)a3 isColumnAccessLoggingEnabled:(BOOL)a4
{
  return -[BMSQLDatabase initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:](self, "initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:", MEMORY[0x1E0C9AA60], a3, a4);
}

- (BMSQLDatabase)initWithAdditionalVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5
{
  return -[BMSQLDatabase initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:](self, "initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:", a3, a4, a5, *MEMORY[0x1E0D01C98]);
}

- (BMSQLDatabase)initWithAdditionalVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5 useCase:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  BMSQLDatabase *v24;
  id v26;
  id v27;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0D01CD0];
  v13 = (void *)MEMORY[0x1E0D01D18];
  v14 = a6;
  objc_msgSend(v13, "current");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "policyForProcess:connectionFlags:useCase:", v15, 0, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 1, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibraryNodeBridge();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  BMSQLVirtualTables(v18, v17, v14, &v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v27;
  if (v20
    || (v10 ? (v21 = v10) : (v21 = (id)MEMORY[0x1E0C9AA60]),
        objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v21),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = 0,
        self = -[BMSQLDatabase initWithVirtualTables:privileges:isColumnAccessLoggingEnabled:enableAuthorizer:error:](self, "initWithVirtualTables:privileges:isColumnAccessLoggingEnabled:enableAuthorizer:error:", v22, v11, v7, 1, &v26), v20 = v26, v22, v20))
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[BMSQLDatabase initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:].cold.1();

    v24 = 0;
  }
  else
  {
    self = self;
    v24 = self;
  }

  return v24;
}

- (BMSQLDatabase)initWithStreams:(id)a3 library:(id)a4 privileges:(id)a5 isColumnAccessLoggingEnabled:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BMSQLDatabase *v17;
  id v19;

  v8 = a6;
  v12 = a5;
  v13 = (void *)*MEMORY[0x1E0D01C98];
  v19 = 0;
  BMSQLVirtualTables(a4, a3, v13, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  v16 = v15;
  if (v15)
  {
    v17 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v15);
  }
  else
  {
    self = -[BMSQLDatabase initWithVirtualTables:privileges:isColumnAccessLoggingEnabled:enableAuthorizer:error:](self, "initWithVirtualTables:privileges:isColumnAccessLoggingEnabled:enableAuthorizer:error:", v14, v12, v8, 1, a7);
    v17 = self;
  }

  return v17;
}

- (BMSQLDatabase)initWithVirtualTables:(id)a3 privileges:(id)a4 isColumnAccessLoggingEnabled:(BOOL)a5 enableAuthorizer:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  BMSQLDatabase *v14;
  uint64_t module_v2;
  sqlite3 *v16;
  const char *v17;
  void *v18;
  id v19;
  BMSQLDatabase *v20;
  id *v21;
  id *v22;
  uint64_t v23;
  NSArray *virtualTables;
  uint64_t v25;
  NSArray *privileges;
  NSMutableArray *v27;
  NSMutableArray *accessedColumns;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  BMSQLDatabase *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _BOOL4 v57;
  void *v58;
  uint64_t v59;
  NSArray *obj;
  id *obja;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  sqlite3 *ppDb;
  objc_super v73;
  uint8_t v74[128];
  uint8_t buf[4];
  BMSQLDatabase *v76;
  __int16 v77;
  BMSQLDatabase *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;
  const __CFString *v82;
  _BYTE v83[128];
  uint64_t v84;

  v8 = a6;
  v84 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v73.receiver = self;
  v73.super_class = (Class)BMSQLDatabase;
  v14 = -[BMSQLDatabase init](&v73, sel_init);
  if (!v14)
    goto LABEL_49;
  ppDb = 0;
  module_v2 = sqlite3_open_v2(":memory:", &ppDb, 65538, 0);
  if ((_DWORD)module_v2)
  {
    v16 = ppDb;
    v17 = "Failed to open in memory database";
    goto LABEL_4;
  }
  v21 = (id *)bm_sqlite3_malloc(8);
  if (v21)
  {
    v22 = v21;
    objc_storeWeak(v21, v14);
    module_v2 = sqlite3_create_module_v2(ppDb, "bmstream_vtab", &bmstream_vtab_module, v22, (void (__cdecl *)(void *))bmstream_vtab_destroy);
    if ((_DWORD)module_v2)
    {
      v16 = ppDb;
      v17 = "Unable to load bmstream_vtab module";
      goto LABEL_4;
    }
    v57 = v8;
    v14->_lock._os_unfair_lock_opaque = 0;
    v14->_db = ppDb;
    v58 = v12;
    v23 = objc_msgSend(v12, "copy");
    virtualTables = v14->_virtualTables;
    v14->_virtualTables = (NSArray *)v23;

    v25 = objc_msgSend(v13, "copy");
    privileges = v14->_privileges;
    v14->_privileges = (NSArray *)v25;

    v14->_isColumnAccessLoggingEnabled = a5;
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    accessedColumns = v14->_accessedColumns;
    v14->_accessedColumns = v27;

    v71 = 0u;
    v69 = 0u;
    v70 = 0u;
    v68 = 0u;
    obj = v14->_virtualTables;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v69;
      v59 = *MEMORY[0x1E0CB2D50];
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v69 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x193FECFB4]();
          objc_msgSend(v33, "schema");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "tableName");
          v36 = (BMSQLDatabase *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE VIRTUAL TABLE IF NOT EXISTS \"%@\" USING bmstream_vtab"), v36);
            v67 = 0;
            -[BMSQLDatabase executeStatement:error:](v14, "executeStatement:error:", v37, &v67);
            v38 = v67;
          }
          else
          {
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v81 = v59;
            v82 = CFSTR("virtual table is missing a schema/tableName");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), 1, v37);
          }
          v40 = v38;

          __biome_log_for_category();
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v40)
          {
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v76 = v14;
              v77 = 2112;
              v78 = v36;
              v79 = 2112;
              v80 = v40;
              _os_log_error_impl(&dword_18D810000, v42, OS_LOG_TYPE_ERROR, "BMSQLDatabase failed to add virtual table to %@ with name %@. %@", buf, 0x20u);
            }

            objc_autoreleasePoolPop(v34);
            v12 = v58;
            if (a7)
              *a7 = objc_retainAutorelease(v40);
            sqlite3_close(ppDb);
            v14->_db = 0;

            goto LABEL_7;
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v36;
            _os_log_debug_impl(&dword_18D810000, v42, OS_LOG_TYPE_DEBUG, "BMSQLDatabase finished adding virtual table with name %@", buf, 0xCu);
          }

          objc_autoreleasePoolPop(v34);
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
        if (v30)
          continue;
        break;
      }
    }

    if (a7)
      *a7 = 0;
    obja = a7;
    v43 = (void *)objc_opt_new();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v44 = v58;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v64 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          objc_msgSend(v49, "stream");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            objc_msgSend(v49, "stream");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "configuration");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)objc_msgSend(v52, "eventClass");

            if (objc_msgSend(v53, "isSubclassOfClass:", objc_opt_class()))
              objc_msgSend(v43, "addObject:", v53);
          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      }
      while (v46);
    }

    v62 = 0;
    +[BMSQLProtoUDFs registerProtoUDFsWithDatabase:eventClasses:error:](BMSQLProtoUDFs, "registerProtoUDFsWithDatabase:eventClasses:error:", v14, v43, &v62);
    v54 = v62;
    v55 = v54;
    if (v54)
    {
      if (obja)
        *obja = objc_retainAutorelease(v54);

      v20 = 0;
      v12 = v58;
      goto LABEL_50;
    }
    if (v57)
      sqlite3_set_authorizer(ppDb, (int (__cdecl *)(void *, int, const char *, const char *, const char *, const char *))bmstream_authorizer, v14);

    v12 = v58;
LABEL_49:
    v20 = v14;
    goto LABEL_50;
  }
  v16 = ppDb;
  v17 = "Unable to alloc memory for bmstream_vtab_metadata";
  module_v2 = 7;
LABEL_4:
  BMSQLDatabaseError(module_v2, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a7)
  {
    v19 = objc_retainAutorelease(v18);
    *a7 = v19;
  }
  sqlite3_close(ppDb);

LABEL_7:
  v20 = 0;
LABEL_50:

  return v20;
}

- (void)dealloc
{
  sqlite3 *db;
  objc_super v4;

  db = self->_db;
  if (db)
  {
    sqlite3_set_authorizer(db, 0, 0);
    sqlite3_close(self->_db);
  }
  v4.receiver = self;
  v4.super_class = (Class)BMSQLDatabase;
  -[BMSQLDatabase dealloc](&v4, sel_dealloc);
}

- (id)virtualTableForName:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_virtualTables;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "schema", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tableName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)attachDatabase:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a5) = -[BMSQLDatabase _attachDatabase:name:error:](self, "_attachDatabase:name:error:", v8, v9, a5);
  os_unfair_lock_unlock(&self->_lock);

  return (char)a5;
}

- (BOOL)_attachDatabase:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_DEFAULT, "BMSQLDatabase attaching to %@ as %@", buf, 0x16u);
  }

  if ((objc_msgSend(v8, "isFileURL") & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("ATTACH DATABASE \"%@\" AS \"%@\"), v12, v9);

    LOBYTE(a5) = -[BMSQLDatabase executeStatement:error:](self, "executeStatement:error:", v13, a5);
LABEL_7:

    goto LABEL_8;
  }
  if (a5)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("cannot open non file database"));
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), 14, v15);

    LOBYTE(a5) = 0;
    goto LABEL_7;
  }
LABEL_8:

  return (char)a5;
}

- (BOOL)attachDatabaseWithResourceIdentifier:(id)a3 useCase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01D30]), "initWithType:name:", 3, v8);
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01CC0]), "initWithUseCase:", v9);
    objc_msgSend(v12, "requestAccessToResource:mode:error:", v11, 1, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("sqlite3"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v9;
        objc_msgSend(v14, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingPathComponent:", v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v17);
        v19 = -[BMSQLDatabase _attachDatabase:name:error:](self, "_attachDatabase:name:error:", v18, v8, a5);
        if (v19)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resourceAccessAssertions, "setObject:forKeyedSubscript:", v14, v8);

        v9 = v25;
        goto LABEL_12;
      }
      if (a5)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0CB2D50];
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Access assertion %@ has a nil path"), v14);
        v28 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), 14, v23);

      }
    }
    LOBYTE(v19) = 0;
  }
  else
  {
    if (!a5)
    {
      LOBYTE(v19) = 0;
      goto LABEL_13;
    }
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid identifier %@"), v8);
    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = 0;
    *a5 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), 14, v14);
  }
LABEL_12:

LABEL_13:
  os_unfair_lock_unlock(p_lock);

  return v19;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  uint64_t v6;
  int v7;
  char *errmsg;

  errmsg = 0;
  v6 = sqlite3_exec(self->_db, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, 0, &errmsg);
  v7 = v6;
  if ((_DWORD)v6)
  {
    if (a4)
    {
      BMSQLDatabaseError(v6, self->_db, errmsg);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    sqlite3_free(errmsg);
  }
  return v7 == 0;
}

- (id)SQLSchemaString
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSArray *v5;
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
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_virtualTables, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_virtualTables;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "schema", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createTableSQL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)logColumnAccess:(id)a3 tableName:(id)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  BMSQLColumnAccessSet *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  BMSQLColumnAccessSet *v15;
  BMSQLColumnAccessSet *v16;
  void *v17;
  void *v18;
  NSMutableArray *obj;
  id obja;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = a4;
  obj = self->_accessedColumns;
  objc_sync_enter(obj);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_accessedColumns;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v8)
  {

LABEL_13:
    v16 = [BMSQLColumnAccessSet alloc];
    v17 = (void *)objc_opt_new();
    v9 = -[BMSQLColumnAccessSet initWithTable:columns:](v16, "initWithTable:columns:", v6, v17);

    -[NSMutableArray addObject:](self->_accessedColumns, "addObject:", v9);
    goto LABEL_14;
  }
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v12, "table", obj);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v6);

      if (v14)
      {
        v15 = v12;

        v9 = v15;
      }
    }
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v8);

  if (!v9)
    goto LABEL_13;
LABEL_14:
  -[BMSQLColumnAccessSet columns](v9, "columns", obj);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v21);

  objc_sync_exit(obja);
}

- (void)resetColumnAccessLog
{
  NSMutableArray *obj;

  obj = self->_accessedColumns;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_accessedColumns, "removeAllObjects");
  objc_sync_exit(obj);

}

- (BOOL)registerFunctionWithName:(id)a3 numArgs:(int)a4 function:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__BMSQLDatabase_registerFunctionWithName_numArgs_function_error___block_invoke;
  v13[3] = &unk_1E2648E60;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = -[BMSQLDatabase registerFunctionWithName:numArgs:function:userData:error:](self, "registerFunctionWithName:numArgs:function:userData:error:", a3, v7, v13, 0, a6);

  return (char)a6;
}

uint64_t __65__BMSQLDatabase_registerFunctionWithName_numArgs_function_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)registerFunctionWithName:(id)a3 numArgs:(int)a4 function:(id)a5 userData:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id *v16;
  id *v17;
  void *v18;
  id v19;
  BOOL v20;
  uint64_t function_v2;
  sqlite3 *db;
  const char *v23;
  id v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  __biome_log_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BMSQLDatabase registerFunctionWithName:numArgs:function:userData:error:].cold.1();

  v16 = (id *)bm_sqlite3_malloc(16);
  if (v16)
  {
    v17 = v16;
    v18 = _Block_copy(v13);
    v19 = *v17;
    *v17 = v18;

    objc_storeStrong(v17 + 1, a6);
    v20 = 1;
    function_v2 = sqlite3_create_function_v2(self->_db, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), a4, 1, v17, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))bmstream_udf_callback, 0, 0, (void (__cdecl *)(void *))bmstream_udf_destructor_callback);
    if (!(_DWORD)function_v2)
      goto LABEL_10;
    db = self->_db;
    v23 = "BMSQLDatabase failed to register user-defined function";
  }
  else
  {
    db = self->_db;
    v23 = "Unable to alloc memory for udf_user_data";
    function_v2 = 7;
  }
  BMSQLDatabaseError(function_v2, db, v23);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
    v24 = objc_retainAutorelease(v24);
    *a7 = v24;
  }

  v20 = 0;
LABEL_10:

  return v20;
}

- (id)executeQuery:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  -[BMSQLDatabase _executeQuery:](self, "_executeQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_executeQuery:(id)a3
{
  id v4;
  NSObject *v5;
  sqlite3 *db;
  id v7;
  uint64_t v8;
  void *v9;
  BMSQLResultSet *v10;
  BMSQLResultSet *v11;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BMSQLDatabase _executeQuery:].cold.1();

  ppStmt = 0;
  db = self->_db;
  v7 = objc_retainAutorelease(v4);
  v8 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v7, "UTF8String"), -1, &ppStmt, 0);
  if ((_DWORD)v8)
  {
    BMSQLDatabaseError(v8, self->_db, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BMSQLResultSet initWithQuery:error:database:]([BMSQLResultSet alloc], "initWithQuery:error:database:", v7, v9, self);

  }
  else
  {
    v11 = [BMSQLResultSet alloc];
    v10 = -[BMSQLResultSet initWithStatement:database:](v11, "initWithStatement:database:", ppStmt, self);
  }

  return v10;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_virtualTables, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_virtualTables;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "schema");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tableName");
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
          v11 = (__CFString *)v10;
        else
          v11 = CFSTR("<unknown>");
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@ %p> tables: %@"), v13, self, v14);

  if (self->_privileges)
  {
    objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(", privileges: %@"), self->_privileges);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }

  return v15;
}

- (NSArray)privileges
{
  return self->_privileges;
}

- (BOOL)isColumnAccessLoggingEnabled
{
  return self->_isColumnAccessLoggingEnabled;
}

- (NSArray)accessedColumns
{
  return &self->_accessedColumns->super;
}

- (sqlite3)db
{
  return self->_db;
}

- (NSArray)virtualTables
{
  return self->_virtualTables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualTables, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
  objc_storeStrong((id *)&self->_resourceAccessAssertions, 0);
  objc_storeStrong((id *)&self->_accessedColumns, 0);
}

- (void)initWithAdditionalVirtualTables:privileges:isColumnAccessLoggingEnabled:useCase:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "Error initializing SQL database %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)registerFunctionWithName:numArgs:function:userData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_12(&dword_18D810000, v0, v1, "BMSQLDatabase registering user-defined function %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_executeQuery:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_12(&dword_18D810000, v0, v1, "BMSQLDatabase executing query %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
