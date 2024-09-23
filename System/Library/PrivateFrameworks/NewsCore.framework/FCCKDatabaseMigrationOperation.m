@implementation FCCKDatabaseMigrationOperation

- (BOOL)validateOperation
{
  char v3;
  char v4;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't migrate without a database"));
      v8 = 136315906;
      v9 = "-[FCCKDatabaseMigrationOperation validateOperation]";
      v10 = 2080;
      v11 = "FCCKDatabaseMigrationOperation.m";
      v12 = 1024;
      v13 = 35;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_9;
  }
  if (self->_migrator)
  {
    v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't migrate without a migrator"));
    v8 = 136315906;
    v9 = "-[FCCKDatabaseMigrationOperation validateOperation]";
    v10 = 2080;
    v11 = "FCCKDatabaseMigrationOperation.m";
    v12 = 1024;
    v13 = 39;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  v4 = 0;
  return v4 & v3;
}

- (void)prepareOperation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, v4);
    v4 = v5;
  }

}

- (void)performOperation
{
  FCCKPrivateDatabase *v3;
  FCCKDatabaseMigrator *migrator;
  FCCKDatabaseMigrator *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = self->_database;
    migrator = self->_migrator;
  }
  else
  {
    v3 = 0;
    migrator = 0;
  }
  v5 = migrator;
  FCCKDatabaseZoneIDsToMigrate(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Migration: Performing Migration {zones: %{public}@}", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__FCCKDatabaseMigrationOperation_performOperation__block_invoke;
  v8[3] = &unk_1E463EA38;
  v8[4] = self;
  -[FCCKDatabaseMigrationOperation _migrateZoneIDs:completion:]((void **)&self->super.super.super.isa, v6, v8);

}

uint64_t __50__FCCKDatabaseMigrationOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)_migrateZoneIDs:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  id v11;
  FCCKDatabaseZoneMigrationOperation *v12;
  const char *v13;
  id *v14;
  void *v15;
  void *v16;
  const char *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD newValue[5];
  id v23;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __61__FCCKDatabaseMigrationOperation__migrateZoneIDs_completion___block_invoke;
      v19[3] = &unk_1E4644870;
      v19[4] = a1;
      v20 = v8;
      v21 = v6;
      v9 = v8;
      v10 = v19;
      v11 = v7;
      v12 = objc_alloc_init(FCCKDatabaseZoneMigrationOperation);
      -[FCCKDatabaseZoneMigrationOperation setDatabase:]((uint64_t)v12, a1[46]);
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v13, v11, 376);
      -[FCCKDatabaseZoneMigrationOperation setMigrator:]((uint64_t)v12, a1[47]);
      v14 = a1[46];
      objc_msgSend(v11, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCCKPrivateDatabase pruningAssistantForZoneName:](v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCCKDatabaseZoneMigrationOperation setPruningAssistant:]((uint64_t)v12, v16);
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __60__FCCKDatabaseMigrationOperation__migrateZoneID_completion___block_invoke;
      newValue[3] = &unk_1E46438F8;
      newValue[4] = a1;
      v18 = v10;
      v23 = v18;
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v17, newValue, 400);
      objc_msgSend(a1, "associateChildOperation:", v12);
      -[FCOperation start](v12, "start");

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  int v6;
  FCOperationExternalSignal *v7;
  FCCKSecureDatabaseResetOperation *v8;
  FCCKSecureDatabaseResetOperation *v9;
  FCCKPrivateDatabase *database;
  FCOperationExternalSignal *v11;
  FCOperationExternalSignal *v12;
  _QWORD v14[4];
  FCOperationExternalSignal *v15;

  v6 = objc_msgSend(a3, "fc_hasIdentityLostError");
  if (v6)
  {
    v7 = objc_alloc_init(FCOperationExternalSignal);
    v8 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
    v9 = v8;
    if (self)
      database = self->_database;
    else
      database = 0;
    -[FCCKSecureDatabaseResetOperation setDatabase:](v8, "setDatabase:", database);
    -[FCCKSecureDatabaseResetOperation setDeleteZones:](v9, "setDeleteZones:", 1);
    -[FCCKSecureDatabaseResetOperation setRestoreSecureSentinel:](v9, "setRestoreSecureSentinel:", 1);
    -[FCCKSecureDatabaseResetOperation setRestoreZoneContents:](v9, "setRestoreZoneContents:", 0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__FCCKDatabaseMigrationOperation_canRetryWithError_retryAfter___block_invoke;
    v14[3] = &unk_1E463EA38;
    v15 = v7;
    v11 = v7;
    -[FCCKSecureDatabaseResetOperation setResetCompletionHandler:](v9, "setResetCompletionHandler:", v14);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v9);
    -[FCOperation start](v9, "start");
    v12 = objc_retainAutorelease(v11);
    *a4 = v12;

  }
  return v6;
}

uint64_t __63__FCCKDatabaseMigrationOperation_canRetryWithError_retryAfter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerWithRetry:", a2 == 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t started;
  FCCKDatabaseMigrator *v5;
  id migrationCompletionHandler;
  void (**v7)(id, NSMutableArray *, NSMutableArray *, id);
  NSMutableArray *v8;
  id v9;

  v9 = a3;
  started = FCCKDatabaseStartUpResultFromError(v9);
  if (!self)
  {
    objc_msgSend(0, "databaseMigrationDidFinishForDatabase:result:", 0, started);
    v7 = 0;
    goto LABEL_4;
  }
  v5 = self->_migrator;
  -[FCCKDatabaseMigrator databaseMigrationDidFinishForDatabase:result:](v5, "databaseMigrationDidFinishForDatabase:result:", self->_database, started);

  migrationCompletionHandler = self->_migrationCompletionHandler;
  if (migrationCompletionHandler)
  {
    v7 = (void (**)(id, NSMutableArray *, NSMutableArray *, id))migrationCompletionHandler;
    v8 = self->_resultZoneIDsEligibleForDeletion;
    v7[2](v7, v8, self->_resultRecordIDsEligibleForDeletion, v9);

LABEL_4:
  }

}

uint64_t __61__FCCKDatabaseMigrationOperation__migrateZoneIDs_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  else
    return -[FCCKDatabaseMigrationOperation _migrateZoneIDs:completion:](a1[4], a1[5], a1[6]);
}

void __60__FCCKDatabaseMigrationOperation__migrateZoneID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 392);
  else
    v8 = 0;
  v12 = a4;
  v9 = a3;
  objc_msgSend(v8, "addObjectsFromArray:", a2);
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 400);
  else
    v11 = 0;
  objc_msgSend(v11, "addObjectsFromArray:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

- (void)setMigrator:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, 0);
  objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, 0);
  objc_storeStrong(&self->_migrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
