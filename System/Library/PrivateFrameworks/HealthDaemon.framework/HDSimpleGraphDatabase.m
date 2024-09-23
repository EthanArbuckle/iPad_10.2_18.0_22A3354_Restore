@implementation HDSimpleGraphDatabase

- (HDSimpleGraphDatabase)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (HDSimpleGraphDatabase)graphDatabaseWithURL:(id)a3 error:(id *)a4
{
  id v5;
  HDSimpleGraphDatabase *v6;
  id v7;
  uint64_t v8;
  NSURL *URL;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSURL *v14;
  uint64_t v15;
  HDSQLiteDatabase *database;
  void *v17;
  void *v18;
  HDSimpleGraphDatabase *v19;
  void *v21;
  objc_super v22;

  v5 = a3;
  v6 = [HDSimpleGraphDatabase alloc];
  v7 = v5;
  if (v6)
  {
    v22.receiver = v6;
    v22.super_class = (Class)HDSimpleGraphDatabase;
    v6 = objc_msgSendSuper2(&v22, sel_init);
    if (v6)
    {
      v8 = objc_msgSend(v7, "copy");
      URL = v6->_URL;
      v6->_URL = (NSURL *)v8;

    }
  }

  v10 = _Block_copy((const void *)unitTesting_didInitGraphDatabaseHandler);
  if (v10)
    (*(void (**)(uint64_t, HDSimpleGraphDatabase *))(unitTesting_didInitGraphDatabaseHandler + 16))(unitTesting_didInitGraphDatabaseHandler, v6);
  if (!v6)
    goto LABEL_16;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[NSURL URLByDeletingLastPathComponent](v6->_URL, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, a4);

  if (!v13)
  {
LABEL_15:

LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  v14 = v6->_URL;
  if (v6->_database)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__createDatabaseConnectionWithURL_, v6, CFSTR("HDSimpleGraphDatabase.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_database == nil"));

  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29850]), "initWithDatabaseURL:", v14);
  database = v6->_database;
  v6->_database = (HDSQLiteDatabase *)v15;

  -[HDSQLiteDatabase setFileProtectionType:](v6->_database, "setFileProtectionType:", *MEMORY[0x1E0CB2AB8]);
  v17 = _Block_copy(v6->_unitTesting_didCreateDatabaseConnectionHandler);
  v18 = v17;
  if (v17)
    (*((void (**)(void *, HDSimpleGraphDatabase *))v17 + 2))(v17, v6);

  if ((+[HDSimpleGraphDatabase _openDatabase:error:]((uint64_t)HDSimpleGraphDatabase, v6->_database, (uint64_t)a4) & 1) == 0)
  {
    -[HDSimpleGraphDatabase close](v6, "close");
    goto LABEL_15;
  }

  v19 = v6;
LABEL_17:

  return v19;
}

- (BOOL)isOpen
{
  return -[HDSQLiteDatabase isOpen](self->_database, "isOpen");
}

- (HDSQLiteDatabase)underlyingDatabase
{
  return self->_database;
}

- (void)dealloc
{
  objc_super v3;

  -[HDSimpleGraphDatabase close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)HDSimpleGraphDatabase;
  -[HDSimpleGraphDatabase dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSURL path](self->_URL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)schemaVersionWithError:(id *)a3
{
  uint64_t v3;
  void *v4;

  v3 = +[HDSimpleGraphDatabase _readSchemaVersionForDatabase:error:]((uint64_t)HDSimpleGraphDatabase, self->_database, (uint64_t)a3);
  if (v3 < 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (uint64_t)_readSchemaVersionForDatabase:(uint64_t)a3 error:
{
  id v4;
  uint64_t v5;

  v4 = a2;
  objc_opt_self();
  v5 = objc_msgSend(v4, "userVersionWithDatabaseName:error:", 0, a3);

  return v5;
}

+ (uint64_t)_openDatabase:(uint64_t)a3 error:
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  id v25;
  id obj;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t v44[4];
  uint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  _BYTE buf[24];
  void *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  if (!objc_msgSend(v4, "openWithError:", a3))
  {
    v33 = v4;
    v31 = objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v6 = +[HDSimpleGraphDatabase _readSchemaVersionForDatabase:error:](v31, v33, (uint64_t)&v35);
    v30 = v35;
    if (objc_msgSend(v32, "supportsOntologyDatabaseFutureMigrations"))
      v7 = 10001;
    else
      v7 = 8;
    if (v6 == v7)
      goto LABEL_7;
    if ((v6 & 0x8000000000000000) == 0)
    {
      if (v6 > v7)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v44 = 138543874;
          v45 = v31;
          v46 = 2048;
          v47 = v6;
          v48 = 2048;
          v49 = 8;
          _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Graph database schema version '%ld' greater than current '%ld' (rollback detected)", v44, 0x20u);
        }

        if (!+[HDSimpleGraphDatabase _removeExistingAndCreateDatabase:error:](v31, v33, a3))
          goto LABEL_18;
      }
      if (v6 < v7)
      {
        if (v6)
        {
          v34 = 0;
          v27 = v33;
          v25 = v32;
          v28 = objc_opt_self();
          if (v6 > 3)
          {
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            +[HDSimpleGraphDatabaseMigrator migrationStepsWithBehavior:](HDSimpleGraphDatabaseMigrator, "migrationStepsWithBehavior:", v25);
            obj = (id)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            v10 = v6;
            if (v12)
            {
              v29 = *(_QWORD *)v37;
              v10 = v6;
              while (2)
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v37 != v29)
                    objc_enumerationMutation(obj);
                  v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                  if (v10 < objc_msgSend(v14, "toVersion"))
                  {
                    _HKInitializeLogging();
                    HKLogHealthOntology();
                    v15 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                    {
                      v16 = objc_msgSend(v14, "toVersion");
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v28;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v10;
                      *(_WORD *)&buf[22] = 2048;
                      v53 = (void *)v16;
                      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Migrate ontology database from schema %ld -> %ld", buf, 0x20u);
                    }

                    v17 = objc_msgSend(v14, "toVersion");
                    v18 = objc_msgSend(v14, "function");
                    v19 = v27;
                    objc_opt_self();
                    v40 = 0;
                    v41 = &v40;
                    v42 = 0x2020000000;
                    v43 = 1;
                    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                    *(_QWORD *)&buf[8] = 3221225472;
                    *(_QWORD *)&buf[16] = __67__HDSimpleGraphDatabase__migrateDatabase_toVersion_function_error___block_invoke;
                    v53 = &unk_1E6CFDC00;
                    v54 = &v40;
                    v55 = v18;
                    v56 = v17;
                    if (objc_msgSend(v19, "performTransactionWithType:error:usingBlock:", 1, &v34, buf))
                      v9 = v41[3];
                    else
                      v9 = 1;
                    _Block_object_dispose(&v40, 8);

                    if (v9)
                    {

                      goto LABEL_40;
                    }
                    v10 = objc_msgSend(v14, "toVersion");
                  }
                }
                v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
                if (v12)
                  continue;
                break;
              }
            }

            v9 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v34, 100, CFSTR("No migrations were written for schema < %ld"), 5);
            v9 = 1;
            v10 = v6;
          }
LABEL_40:

          v20 = v34;
          _HKInitializeLogging();
          HKLogHealthOntology();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v9 == 1)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v44 = 138544130;
              v45 = v31;
              v46 = 2048;
              v47 = v10;
              v48 = 2048;
              v49 = 8;
              v50 = 2112;
              v51 = v20;
              _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unable to migrate from schema version %ld (current for OS is %ld) %@", v44, 0x2Au);
            }

            if ((+[HDSimpleGraphDatabase _removeExistingAndCreateDatabase:error:](v31, v27, a3) & 1) == 0)
            {

              goto LABEL_18;
            }
          }
          else
          {
            v23 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

            if (v23)
            {
              HKLogHealthOntology();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v44 = 138543874;
                v45 = v31;
                v46 = 2048;
                v47 = v6;
                v48 = 2048;
                v49 = v10;
                _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "%{public}@: Migrated from schema version %ld -> %ld", v44, 0x20u);
              }

            }
          }

        }
        else if ((+[HDSimpleGraphDatabase _createSchemaForDatabase:behavior:error:](v31, v33, v32, a3) & 1) == 0)
        {
          goto LABEL_18;
        }
      }
LABEL_7:
      v5 = 1;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 100, CFSTR("Unable to read schema version"), v30);
LABEL_18:
    v5 = 0;
    goto LABEL_19;
  }
  v5 = 0;
LABEL_20:

  return v5;
}

+ (uint64_t)_removeExistingAndCreateDatabase:(uint64_t)a3 error:
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = objc_opt_self();
  objc_msgSend(v4, "close");
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HDSimpleGraphDatabase _removeExistingDatabaseAtURL:error:](v5, v6, a3);

  if (v7)
    v8 = +[HDSimpleGraphDatabase _openDatabase:error:](v5, v4, a3);
  else
    v8 = 0;

  return v8;
}

+ (uint64_t)_createSchemaForDatabase:(void *)a3 behavior:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a2;
  v8 = objc_opt_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HDSimpleGraphDatabase__createSchemaForDatabase_behavior_error___block_invoke;
  v12[3] = &unk_1E6CF3080;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = objc_msgSend(v7, "performTransactionWithType:error:usingBlock:", 1, a4, v12);

  return v10;
}

+ (uint64_t)_removeExistingDatabaseAtURL:(uint64_t)a3 error:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a2;
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v6 = objc_msgSend(v5, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v4, 0);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_assignError:code:format:", a3, 102, CFSTR("Unable to remove existing database '%@'"), v8);

  }
  return v6;
}

uint64_t __65__HDSimpleGraphDatabase__createSchemaForDatabase_behavior_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  int v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
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
  _QWORD v51[18];

  v51[16] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(id *)(a1 + 32);
  objc_opt_self();
  objc_opt_self();
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v51[2] = objc_opt_class();
  v51[3] = objc_opt_class();
  v51[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "supportsOntologyDatabaseFutureMigrations");

  v37 = a3;
  v38 = v5;
  if (v8)
  {
    objc_opt_self();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", MEMORY[0x1E0C9AA60]);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "addObject:", CFSTR("PRAGMA encoding=\"UTF-8\";"));
  v11 = v7;
  objc_opt_self();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "createTableSQL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v15);
  }

  v36 = v10;
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  v19 = v13;
  objc_opt_self();
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v26, "indices");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, &v47, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v40;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v40 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "creationSQL");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v32);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, &v47, 16);
          }
          while (v29);
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v23);
  }

  objc_msgSend(v36, "addObjectsFromArray:", v20);
  objc_msgSend(v36, "addObject:", CFSTR("PRAGMA page_size = 2048;"));

  v33 = objc_msgSend(v38, "executeSQLStatements:error:", v36, v37);
  if (v33)
    v34 = objc_msgSend(v38, "setUserVersion:withDatabaseName:error:", 8, 0, v37);
  else
    v34 = 0;

  return v34;
}

uint64_t __67__HDSimpleGraphDatabase__migrateDatabase_toVersion_function_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(void))(a1 + 40))();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "setUserVersion:withDatabaseName:error:", *(_QWORD *)(a1 + 48), 0, a3);

  return v6;
}

- (void)close
{
  HDSQLiteDatabase *database;

  -[HDSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (BOOL)deleteWithError:(id *)a3
{
  -[HDSimpleGraphDatabase close](self, "close");
  return +[HDSimpleGraphDatabase _removeExistingDatabaseAtURL:error:]((uint64_t)HDSimpleGraphDatabase, self->_URL, (uint64_t)a3);
}

- (BOOL)performTransactionWithError:(id *)a3 write:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  HDSQLiteDatabase *database;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  HDSimpleGraphDatabase *v17;
  id v18;

  v5 = a4;
  v8 = a5;
  if ((-[HDSQLiteDatabase isOpen](self->_database, "isOpen") & 1) != 0)
  {
    v9 = -[HDSQLiteDatabase isWriter](self->_database, "isWriter");
    -[HDSQLiteDatabase setWriter:](self->_database, "setWriter:", v5);
    database = self->_database;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __65__HDSimpleGraphDatabase_performTransactionWithError_write_block___block_invoke;
    v16 = &unk_1E6CFDC28;
    v17 = self;
    v18 = v8;
    v11 = -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:](database, "performTransactionWithType:error:usingBlock:", v5, a3, &v13);
    -[HDSQLiteDatabase setWriter:](self->_database, "setWriter:", v9, v13, v14, v15, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Database not open"));
    v11 = 0;
  }

  return v11;
}

uint64_t __65__HDSimpleGraphDatabase_performTransactionWithError_write_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
  -[HDSQLiteDatabase onCommit:orRollback:](self->_database, "onCommit:orRollback:", a3, a4);
}

- (BOOL)insertNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 error:(id *)a7
{
  return +[HDSimpleGraphDatabaseNodeEntity insertNodeWithID:version:slots:deleted:database:error:](HDSimpleGraphDatabaseNodeEntity, "insertNodeWithID:version:slots:deleted:database:error:", a3, a4, a5, a6, self->_database, a7);
}

- (id)nodeForID:(int64_t)a3 error:(id *)a4
{
  return +[HDSimpleGraphDatabaseNodeEntity nodeForID:database:error:](HDSimpleGraphDatabaseNodeEntity, "nodeForID:database:error:", a3, self->_database, a4);
}

- (BOOL)enumerateNodesForPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return -[HDSimpleGraphDatabase enumerateNodesForPredicate:includeDeleted:limit:error:enumerationHandler:](self, "enumerateNodesForPredicate:includeDeleted:limit:error:enumerationHandler:", a3, 0, *MEMORY[0x1E0D29968], a4, a5);
}

- (BOOL)enumerateNodesForPredicate:(id)a3 includeDeleted:(BOOL)a4 limit:(unint64_t)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  return +[HDSimpleGraphDatabaseNodeEntity enumerateNodesWithPredicate:skipDeleted:limit:database:error:enumerationHandler:](HDSimpleGraphDatabaseNodeEntity, "enumerateNodesWithPredicate:skipDeleted:limit:database:error:enumerationHandler:", a3, !a4, a5, self->_database, a6, a7);
}

- (BOOL)deleteNodeWithID:(int64_t)a3 error:(id *)a4
{
  return +[HDSimpleGraphDatabaseNodeEntity deleteNodeWithID:database:error:](HDSimpleGraphDatabaseNodeEntity, "deleteNodeWithID:database:error:", a3, self->_database, a4);
}

- (BOOL)addRelationshipWithSubjectNodeID:(int64_t)a3 type:(int64_t)a4 objectNodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 error:(id *)a8
{
  return +[HDSimpleGraphDatabaseRelationshipEntity addRelationshipWithType:subjectNodeID:objectNodeID:version:slots:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "addRelationshipWithType:subjectNodeID:objectNodeID:version:slots:database:error:", a4, a3, a5, a6, a7, self->_database, a8);
}

- (BOOL)enumerateRelationshipsForPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return -[HDSimpleGraphDatabase enumerateRelationshipsForPredicate:includeDeleted:error:enumerationHandler:](self, "enumerateRelationshipsForPredicate:includeDeleted:error:enumerationHandler:", a3, 0, a4, a5);
}

- (BOOL)enumerateRelationshipsForPredicate:(id)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity enumerateRelationshipsWithPredicate:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseRelationshipEntity, "enumerateRelationshipsWithPredicate:skipDeleted:database:error:enumerationHandler:", a3, !a4, self->_database, a5, a6);
}

- (BOOL)enumerateRelationshipsWithSubjectID:(int64_t)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity enumerateRelationshipsWithSubjectID:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseRelationshipEntity, "enumerateRelationshipsWithSubjectID:skipDeleted:database:error:enumerationHandler:", a3, !a4, self->_database, a5, a6);
}

- (BOOL)addAttributeForNodeID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 version:(int64_t)a6 slots:(unint64_t)a7 error:(id *)a8
{
  return +[HDSimpleGraphDatabaseAttributeEntity addAttributeWithType:value:nodeID:version:slots:database:error:](HDSimpleGraphDatabaseAttributeEntity, "addAttributeWithType:value:nodeID:version:slots:database:error:", a4, a5, a3, a6, a7, self->_database, a8);
}

- (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return -[HDSimpleGraphDatabase enumerateAttributesForNodeWithID:includeDeleted:error:enumerationHandler:](self, "enumerateAttributesForNodeWithID:includeDeleted:error:enumerationHandler:", a3, 0, a4, a5);
}

- (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  _BOOL4 v6;
  id v10;
  BOOL v11;
  void *v13;

  v6 = a4;
  v10 = a6;
  if (!self->_database)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSimpleGraphDatabase.m"), 561, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_database"));

  }
  v11 = +[HDSimpleGraphDatabaseAttributeEntity enumerateAttributesForNodeWithID:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseAttributeEntity, "enumerateAttributesForNodeWithID:skipDeleted:database:error:enumerationHandler:", a3, !v6);

  return v11;
}

- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return +[HDSimpleGraphDatabaseMetadataEntity setMetadataValue:forKey:database:error:](HDSimpleGraphDatabaseMetadataEntity, "setMetadataValue:forKey:database:error:", a3, a4, self->_database, a5);
}

- (BOOL)metadataValueForKey:(id)a3 valueOut:(id *)a4 error:(id *)a5
{
  return +[HDSimpleGraphDatabaseMetadataEntity metadataValueForKey:valueOut:database:error:](HDSimpleGraphDatabaseMetadataEntity, "metadataValueForKey:valueOut:database:error:", a3, a4, self->_database, a5);
}

- (BOOL)foreignKeysEnable:(BOOL)a3 error:(id *)a4
{
  const __CFString *v4;

  if (a3)
    v4 = CFSTR("PRAGMA foreign_keys = ON");
  else
    v4 = CFSTR("PRAGMA foreign_keys = OFF");
  return -[HDSQLiteDatabase executeUncachedSQL:error:](self->_database, "executeUncachedSQL:error:", v4, a4);
}

+ (void)setUnitTesting_didInitGraphDatabaseHandler:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)unitTesting_didInitGraphDatabaseHandler;
  unitTesting_didInitGraphDatabaseHandler = v3;

}

+ (id)unitTesting_didInitGraphDatabaseHandler
{
  return _Block_copy((const void *)unitTesting_didInitGraphDatabaseHandler);
}

- (HDSQLiteDatabase)unitTesting_underlyingDatabase
{
  return self->_database;
}

- (void)setUnitTesting_underlyingDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (id)unitTesting_insertNodeWithID:(int64_t)a3 error:(id *)a4
{
  HDSimpleGraphNode *v5;
  HDSimpleGraphNode *v6;
  void *v7;

  v5 = 0;
  if (-[HDSimpleGraphDatabase insertNodeWithID:version:slots:deleted:error:](self, "insertNodeWithID:version:slots:deleted:error:", a3, 0, 0, 0, a4))
  {
    v6 = [HDSimpleGraphNode alloc];
    -[HDSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HDSimpleGraphNode initWithRowID:attributes:relationships:](v6, "initWithRowID:attributes:relationships:", objc_msgSend(v7, "longLongValue"), 0, 0);

  }
  return v5;
}

- (BOOL)unitTesting_addAttributeWithType:(int64_t)a3 value:(id)a4 nodeID:(int64_t)a5 error:(id *)a6
{
  return +[HDSimpleGraphDatabaseAttributeEntity addAttributeWithType:value:nodeID:version:slots:database:error:](HDSimpleGraphDatabaseAttributeEntity, "addAttributeWithType:value:nodeID:version:slots:database:error:", a3, a4, a5, 0, 0, self->_database, a6);
}

- (BOOL)unitTesting_addRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 error:(id *)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity addRelationshipWithType:subjectNodeID:objectNodeID:version:slots:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "addRelationshipWithType:subjectNodeID:objectNodeID:version:slots:database:error:", a3, a4, a5, 0, 0, self->_database, a6);
}

- (id)unitTesting_countOfNodesWithError:(id *)a3
{
  return +[HDSQLiteEntity countValueForProperty:predicate:database:error:](HDSimpleGraphDatabaseNodeEntity, "countValueForProperty:predicate:database:error:", *MEMORY[0x1E0D29620], 0, self->_database, a3);
}

- (id)unitTesting_countOfNodesWithRelationshipType:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  HDSimpleGraphRelationshipEntityPredicateForRelationshipType(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity countDistinctForProperty:predicate:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "countDistinctForProperty:predicate:database:error:", CFSTR("subject_id"), v6, self->_database, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)unitTesting_removeRelationshipWithID:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 error:(id *)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity removeRelationshipWithType:subjectNodeID:objectNodeID:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "removeRelationshipWithType:subjectNodeID:objectNodeID:database:error:", a3, a4, a5, self->_database, a6);
}

- (NSURL)URL
{
  return self->_URL;
}

- (id)unitTesting_didCreateDatabaseConnectionHandler
{
  return self->_unitTesting_didCreateDatabaseConnectionHandler;
}

- (void)setUnitTesting_didCreateDatabaseConnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCreateDatabaseConnectionHandler, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
