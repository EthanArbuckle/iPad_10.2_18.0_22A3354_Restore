@implementation MFPersistenceDatabase_iOS

- (BOOL)enforceDataProtection
{
  return 1;
}

- (void)checkInConnection:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPersistenceDatabase_iOS.m"), 60, CFSTR("Got wrong type of connection"));

  }
  ECEndDisallowingNetworkActivity();
  v7.receiver = self;
  v7.super_class = (Class)MFPersistenceDatabase_iOS;
  -[EDPersistenceDatabase checkInConnection:](&v7, sel_checkInConnection_, v5);

}

- (id)checkOutConnectionIsWriter:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  if (!+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPersistenceDatabase_iOS.m"), 47, CFSTR("Trying to access the database in MobileMail"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MFPersistenceDatabase_iOS;
  -[EDPersistenceDatabase checkOutConnectionIsWriter:](&v11, sel_checkOutConnectionIsWriter_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPersistenceDatabase_iOS.m"), 50, CFSTR("Got wrong type of connection"));

  }
  ECBeginDisallowingNetworkActivity();
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadMailboxCacheIfNecessaryWithConnection:", v6);

  return v6;
}

- (id)openConnectionIsWriter:(BOOL)a3
{
  _BOOL8 v3;
  MFPersistenceDatabaseConnection_iOS *v5;
  void *v6;
  void *v7;
  MFPersistenceDatabaseConnection_iOS *v8;
  void *v9;
  MFMailMessageLibraryMigrator *v10;
  void *v11;

  v3 = a3;
  v5 = [MFPersistenceDatabaseConnection_iOS alloc];
  -[EDPersistenceDatabase basePath](self, "basePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabase databaseName](self, "databaseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDPersistenceDatabaseConnection initWithBasePath:databaseName:isWriter:delegate:](v5, "initWithBasePath:databaseName:isWriter:delegate:", v6, v7, v3, self);

  -[EDPersistenceDatabaseConnection open](v8, "open");
  -[MFPersistenceDatabase_iOS migrationLock](self, "migrationLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  if (!-[MFPersistenceDatabase_iOS migrationHasRun](self, "migrationHasRun"))
  {
    v10 = -[MFMailMessageLibraryMigrator initWithDelegate:]([MFMailMessageLibraryMigrator alloc], "initWithDelegate:", self);
    if (!-[EDPersistenceDatabaseConnection isValid](v8, "isValid")
      || !-[MFPersistenceDatabase_iOS _migrateWithDatabaseConnection:migrator:](self, "_migrateWithDatabaseConnection:migrator:", v8, v10))
    {
      -[EDPersistenceDatabaseConnection close](v8, "close");

      +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailedMigration");

      v8 = 0;
    }
    -[MFPersistenceDatabase_iOS setMigrationHasRun:](self, "setMigrationHasRun:", 1);

  }
  if (!-[MFPersistenceDatabase_iOS createdTempTable](self, "createdTempTable") && v3)
  {
    sqlite3_exec(-[EDPersistenceDatabaseConnection sqlDB](v8, "sqlDB"), "CREATE TEMPORARY TABLE temp_selected_messages (message_id INTEGER);",
      0,
      0,
      0);
    -[MFPersistenceDatabase_iOS setCreatedTempTable:](self, "setCreatedTempTable:", 1);
  }
  objc_sync_exit(v9);

  return v8;
}

- (id)migrationLock
{
  return self->_migrationLock;
}

- (BOOL)migrationHasRun
{
  return self->_migrationHasRun;
}

- (BOOL)createdTempTable
{
  return self->_createdTempTable;
}

- (void)setMigrationHasRun:(BOOL)a3
{
  self->_migrationHasRun = a3;
}

- (void)setCreatedTempTable:(BOOL)a3
{
  self->_createdTempTable = a3;
}

- (BOOL)_migrateWithDatabaseConnection:(id)a3 migrator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDPersistenceDatabase schema](self, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "migrateWithDatabaseConnection:schema:", v6, v8);

  if (v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[MFPersistenceDatabase_iOS postMigrationSteps](self, "postMigrationSteps", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "runWithConnection:", v6);
        }
        v15 = v14;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
      LOBYTE(v9) = v15 == 0;
    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  return v9;
}

- (NSMutableArray)postMigrationSteps
{
  return self->_postMigrationSteps;
}

- (MFPersistenceDatabase_iOS)initWithBasePath:(id)a3 databaseName:(id)a4 maxConcurrentReaders:(unint64_t)a5 schema:(id)a6 protectedSchema:(id)a7 propertyMapper:(id)a8 protectedDatabasePersistence:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MFPersistenceDatabase_iOS *v21;
  uint64_t v22;
  id migrationLock;
  uint64_t v24;
  NSMutableArray *postMigrationSteps;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MFPersistenceDatabase_iOS;
  v21 = -[EDPersistenceDatabase initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:](&v27, sel_initWithBasePath_databaseName_maxConcurrentReaders_schema_protectedSchema_propertyMapper_protectedDatabasePersistence_, v15, v16, a5, v17, v18, v19, v20);
  if (v21)
  {
    v22 = objc_opt_new();
    migrationLock = v21->_migrationLock;
    v21->_migrationLock = (id)v22;

    v24 = objc_opt_new();
    postMigrationSteps = v21->_postMigrationSteps;
    v21->_postMigrationSteps = (NSMutableArray *)v24;

  }
  return v21;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MFPersistenceDatabase_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_26 != -1)
    dispatch_once(&log_onceToken_26, block);
  return (OS_os_log *)(id)log_log_26;
}

- (void)addPostMigrationStep:(Class)a3
{
  id v4;

  -[MFPersistenceDatabase_iOS postMigrationSteps](self, "postMigrationSteps");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", a3);

}

- (BOOL)mailMessageLibraryMigrator:(id)a3 attachProtectedDatabaseWithName:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v9 = a4;
  v10 = a5;
  -[EDPersistenceDatabase urlFileProtectionTypeForDatabaseType:](self, "urlFileProtectionTypeForDatabaseType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C99918]))
  {
    v12 = (id)*MEMORY[0x1E0C99920];

    v11 = v12;
  }
  -[EDPersistenceDatabase protectedDatabasePath](self, "protectedDatabasePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabase urlForDatabasePath:type:fileProtection:](self, "urlForDatabasePath:type:fileProtection:", v13, 1, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v10, "attachProtectedDatabaseWithName:url:error:", v9, v14, a6);
  return v15;
}

- (void)mailMessageLibraryMigrator:(id)a3 detachProtectedDatabaseWithConnection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "detachProtectedDatabase", a3);
  -[EDPersistenceDatabase urlFileProtectionTypeForDatabaseType:](self, "urlFileProtectionTypeForDatabaseType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EDPersistenceDatabase protectedDatabasePath](self, "protectedDatabasePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabase urlForDatabasePath:type:](self, "urlForDatabasePath:type:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0D1EFD8], "setFileProtection:forDatabaseAtURL:error:", v5, v7, &v16);
    v9 = v16;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
    {
      v12 = objc_msgSend(v10, "code") == 23;

      if (v12)
      {
        +[MFPersistenceDatabase_iOS log](MFPersistenceDatabase_iOS, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "ef_publicDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v14;
          _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_INFO, "Couldn't reset file protection of protected database. The device is probably locked. %{public}@", buf, 0xCu);

        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {

    }
    +[MFPersistenceDatabase_iOS log](MFPersistenceDatabase_iOS, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFPersistenceDatabase_iOS mailMessageLibraryMigrator:detachProtectedDatabaseWithConnection:].cold.1(v15, buf, v13);
    }
    goto LABEL_10;
  }
LABEL_12:

}

- (void)mailMessageLibraryMigrator:(id)a3 isInitializingDatabaseWithConnection:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = a4;
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hookRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceIsInitializingDatabaseWithConnection:", v6);

}

- (void)mailMessageLibraryMigratorScheduleSpotlightReindex:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchableIndexManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsToRedonate");

}

- (void)setPostMigrationSteps:(id)a3
{
  objc_storeStrong((id *)&self->_postMigrationSteps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postMigrationSteps, 0);
  objc_storeStrong(&self->_migrationLock, 0);
}

- (void)mailMessageLibraryMigrator:(os_log_t)log detachProtectedDatabaseWithConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Failed to reset file protection of protected database: %{public}@", buf, 0xCu);

}

@end
