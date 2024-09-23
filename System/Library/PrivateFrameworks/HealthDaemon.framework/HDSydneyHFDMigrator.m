@implementation HDSydneyHFDMigrator

- (HDSydneyHFDMigrator)initWithMigrationTransaction:(id)a3
{
  id v5;
  HDSydneyHFDMigrator *v6;
  HDSydneyHFDMigrator *v7;
  NSError *verificationError;
  NSError *migrationError;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSydneyHFDMigrator;
  v6 = -[HDSydneyHFDMigrator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v7->_corruptionRebuildCompleted = 0;
    verificationError = v7->_verificationError;
    v7->_verificationError = 0;

    migrationError = v7->_migrationError;
    v7->_migrationError = 0;

  }
  return v7;
}

- (id)allSeriesEntityClassesForDataStore:(id)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)HFDataStore:(id)a3 detectedCorruptionOfType:(int64_t)a4 code:(int)a5 error:(id)a6 shouldPromptUser:(BOOL)a7 initialRebuildState:(int64_t)a8 updatedRebuildState:(int64_t)a9
{
  id v10;
  NSObject *v11;
  int v12;
  HDSydneyHFDMigrator *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "%{public}@: Saw HFD corruption during migration to SQLite - %@", (uint8_t *)&v12, 0x16u);
  }

}

- (void)HFDataStoreDetectedOutOfSpace:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Saw out-of-space event migrating the HFD; ignoring (the migration will likely fail)",
      v4,
      2u);
  }
}

- (void)didMigrateHFDataStore:(id)a3 fromState:(int64_t)a4 toState:(int64_t)a5 success:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  void *v13;
  NSError *v14;
  NSError *migrationError;
  NSError *v16;
  void *v17;
  NSObject *v18;
  NSError *v19;
  uint8_t buf[4];
  HDSydneyHFDMigrator *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  NSError *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = v12;
  if (!a6)
  {
    if (v12)
    {
      v14 = (NSError *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Migration failed at rebuild stage %ld without reporting an error."), a5);
      v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    migrationError = self->_migrationError;
    self->_migrationError = v14;

  }
  v16 = self->_migrationError;
  -[HDDatabaseMigrationTransaction delegate](self->_transaction, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "migrationTransaction:reportHFDMigrationStatus:schemaVersion:error:", self->_transaction, v16 != 0, a5, self->_migrationError);

  _HKInitializeLogging();
  v18 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v19 = self->_migrationError;
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 2048;
    v23 = a5;
    v24 = 2114;
    v25 = v19;
    _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: HFD reported migration to %ld with error: %{public}@", buf, 0x20u);
  }

}

- (BOOL)allowHFDMigration:(id)a3
{
  return 1;
}

- (void)requestRebuildTransactionForHFDataStore:(id)a3
{
  NSObject *v4;
  int v5;
  HDSydneyHFDMigrator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: HFD unexpectedly requested a rebuild transaction while rebuilding", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)migrateDataForHFDataStore:(id)a3 from:(const void *)a4 to:(void *)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  BOOL v15;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HDSydneyHFDMigrator allSeriesEntityClassesForDataStore:](self, "allSeriesEntityClassesForDataStore:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    obj = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(obj);
        v18 = v9;
        v14 = HKWithAutoreleasePool();

        if (!v14)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
    v15 = 1;
LABEL_11:
    v10 = obj;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

uint64_t __81__HDSydneyHFDMigrator_migrateDataForHFDataStore_from_to_recoveryAnalytics_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)a1[6];
  v5 = a1[7];
  v6 = a1[8];
  objc_msgSend(*(id *)(a1[4] + 16), "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "migrateDataFromDataStore:to:database:recoveryAnalytics:error:", v5, v6, v7, a1[5], a2);

  return v8;
}

- (BOOL)migrateDataForHFDataStore:(id)a3 toSQLiteFrom:(const void *)a4 error:(id *)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HDSydneyHFDMigrator allSeriesEntityClassesForDataStore:](self, "allSeriesEntityClassesForDataStore:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        if (!HKWithAutoreleasePool())
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __68__HDSydneyHFDMigrator_migrateDataForHFDataStore_toSQLiteFrom_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)a1[5];
  v3 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 16), "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "migrateDataToSQLFromStore:database:error:", v3, v5, a2);

  return v6;
}

- (void)HFDataStore:(id)a3 setInteger:(int64_t)a4 forKey:(id)a5
{
  -[HDDatabaseMigrationTransaction setHFDRebuildState:](self->_transaction, "setHFDRebuildState:", a4);
}

- (int64_t)HFDataStore:(id)a3 integerForKey:(id)a4
{
  return -[HDDatabaseMigrationTransaction HFDRebuildState](self->_transaction, "HFDRebuildState", a3, a4);
}

- (HDSQLiteDatabase)protectedDatabase
{
  return -[HDDatabaseMigrationTransaction protectedDatabase](self->_transaction, "protectedDatabase");
}

- (int64_t)migrateHFD:(id *)a3
{
  HDDatabaseMigrationTransaction *transaction;
  _QWORD v5[5];

  transaction = self->_transaction;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HDSydneyHFDMigrator_migrateHFD___block_invoke;
  v5[3] = &unk_1E6CFFC10;
  v5[4] = self;
  return -[HDDatabaseMigrationTransaction accessHistoricHFDWithError:block:](transaction, "accessHistoricHFDWithError:block:", a3, v5);
}

uint64_t __34__HDSydneyHFDMigrator_migrateHFD___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v5 = a2;
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
  v7 = objc_msgSend(v5, "rebuildWithTransaction:error:", *(_QWORD *)(a1 + 32), a3);
  if (objc_msgSend(v5, "rebuildState") == 20 && (v7 == 3 || !v7) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    objc_msgSend(v5, "requestHFDToSQLiteMigration");
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v9 = v8;
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    objc_msgSend(v5, "setDelegate:", v6);
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "setDelegate:", v6);
  }

  return v7;
}

- (HDDatabaseMigrationTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (BOOL)corruptionRebuildCompleted
{
  return self->_corruptionRebuildCompleted;
}

- (void)setCorruptionRebuildCompleted:(BOOL)a3
{
  self->_corruptionRebuildCompleted = a3;
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void)setVerificationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)migrationError
{
  return self->_migrationError;
}

- (void)setMigrationError:(id)a3
{
  objc_storeStrong((id *)&self->_migrationError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationError, 0);
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
