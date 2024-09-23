@implementation FCCKDatabaseZoneMigrationOperation

- (BOOL)validateOperation
{
  char v3;
  char v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't migrate a zone without a database"));
      v10 = 136315906;
      v11 = "-[FCCKDatabaseZoneMigrationOperation validateOperation]";
      v12 = 2080;
      v13 = "FCCKDatabaseZoneMigrationOperation.m";
      v14 = 1024;
      v15 = 41;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
    v3 = 0;
    if (!self)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't migrate a zone without a migrator"));
        v10 = 136315906;
        v11 = "-[FCCKDatabaseZoneMigrationOperation validateOperation]";
        v12 = 2080;
        v13 = "FCCKDatabaseZoneMigrationOperation.m";
        v14 = 1024;
        v15 = 45;
        v16 = 2114;
        v17 = v8;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

      }
      v4 = 0;
      if (!self)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  if (!self->_migrator)
    goto LABEL_9;
  v4 = 1;
LABEL_12:
  if (self->_recordZoneID)
  {
    v5 = 1;
    return v5 & v3 & v4;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't migrate a zone without a record zone ID"));
    v10 = 136315906;
    v11 = "-[FCCKDatabaseZoneMigrationOperation validateOperation]";
    v12 = 2080;
    v13 = "FCCKDatabaseZoneMigrationOperation.m";
    v14 = 1024;
    v15 = 49;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  v5 = 0;
  return v5 & v3 & v4;
}

- (void)prepareOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_createdZones, v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, v5);
    v5 = v6;
  }

}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  FCCKPrivateDatabase *v5;
  CKRecordZoneID *recordZoneID;
  uint64_t v7;
  void *v8;
  FCCKDatabaseMigrator *v9;
  CKRecordZoneID *v10;
  CKRecordZoneID *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  FCCKDatabaseMigrator *migrator;
  CKRecordZoneID *v20;
  FCCKDatabaseMigrator *v21;
  void *v22;
  FCCKPrivateDatabase *v23;
  FCCKPrivateDatabase *v24;
  int64_t migratingFromVersion;
  FCCKPrivateDatabase *v26;
  FCCKPrivateDatabase *v27;
  int64_t currentVersion;
  void *v29;
  void *v30;
  id v31;
  uint64_t *v32;
  FCCKPrivateFetchRecordsOperation *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD aBlock[5];
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  FCCKDatabaseZoneMigrationOperation *v41;
  id v42;
  id v43;
  _QWORD v44[5];
  _BYTE buf[24];
  CKRecordZoneID *v46;
  FCCKDatabaseZoneMigrationOperation *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (id)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v5 = self->_database;
      recordZoneID = self->_recordZoneID;
    }
    else
    {
      v5 = 0;
      recordZoneID = 0;
    }
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v46 = recordZoneID;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will migrate with database: %{public}@, zone ID: %{public}@", buf, 0x20u);

  }
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__FCCKDatabaseZoneMigrationOperation_performOperation__block_invoke;
  aBlock[3] = &unk_1E463EA38;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  if (self)
  {
    v9 = self->_migrator;
    v10 = self->_recordZoneID;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v11 = v10;
  -[CKRecordZoneID zoneName](v11, "zoneName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCCKDatabaseMigrator databaseMigrationShouldMigrateEntireZone:](v9, "databaseMigrationShouldMigrateEntireZone:", v12);

  if (v13)
  {
    v14 = v8;
    v15 = v14;
    if (self)
    {
      v37 = v7;
      v38 = 3221225472;
      v39 = __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke;
      v40 = &unk_1E4640658;
      v16 = v14;
      v41 = self;
      v42 = v16;
      v17 = &v37;
      *(_QWORD *)buf = v7;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __83__FCCKDatabaseZoneMigrationOperation__gatherRecordsToMigrateWithCompletionHandler___block_invoke;
      v46 = (CKRecordZoneID *)&unk_1E4644898;
      v47 = self;
      v18 = v17;
      v48 = v18;
      -[FCCKDatabaseZoneMigrationOperation _continueGatheringRecordsWithPreviousServerChangeToken:recordsAlreadyFetched:completionHandler:]((uint64_t *)self, 0, 0, buf);

    }
  }
  else
  {
    v15 = v8;
    if (self)
    {
      migrator = self->_migrator;
      v20 = self->_recordZoneID;
      v21 = migrator;
      -[CKRecordZoneID zoneName](v20, "zoneName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self->_database;
      v24 = v23;
      if (v23)
        migratingFromVersion = v23->_migratingFromVersion;
      else
        migratingFromVersion = 0;
      v26 = self->_database;
      v27 = v26;
      if (v26)
        currentVersion = v26->_currentVersion;
      else
        currentVersion = 0;
      -[FCCKDatabaseMigrator databaseMigrationRecordNamesToMigrateInZone:fromVersion:toVersion:](v21, "databaseMigrationRecordNamesToMigrateInZone:fromVersion:toVersion:", v22, migratingFromVersion, currentVersion);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v44[0] = v7;
      v44[1] = 3221225472;
      v44[2] = __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke;
      v44[3] = &unk_1E463C9B8;
      v44[4] = self;
      objc_msgSend(v29, "fc_arrayByTransformingWithBlock:", v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v7;
      v38 = 3221225472;
      v39 = __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke_2;
      v40 = &unk_1E4644870;
      v41 = self;
      v42 = v30;
      v43 = v15;
      v31 = v30;
      v32 = &v37;
      v33 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
      -[FCCKPrivateFetchRecordsOperation setRecordIDs:](v33, "setRecordIDs:", v31);
      -[FCCKPrivateDatabaseOperation setSkipPreflight:](v33, "setSkipPreflight:", 1);
      -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v33, "setHandleIdentityLoss:", 0);
      *(_QWORD *)buf = v7;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __74__FCCKDatabaseZoneMigrationOperation__migrateRecordIDs_completionHandler___block_invoke;
      v46 = (CKRecordZoneID *)&unk_1E463B4B8;
      v47 = self;
      v34 = (uint64_t *)v31;
      v48 = v34;
      v35 = v32;
      v49 = v35;
      -[FCCKPrivateFetchRecordsOperation setFetchRecordsCompletionBlock:](v33, "setFetchRecordsCompletionBlock:", buf);
      -[FCOperation associateChildOperation:](self, "associateChildOperation:", v33);
      -[FCCKPrivateDatabase addOperation:]((uint64_t)self->_database, v33);

    }
  }

}

uint64_t __54__FCCKDatabaseZoneMigrationOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id migrationCompletionHandler;
  void (**v5)(id, NSMutableArray *, NSMutableArray *, id);
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (self)
  {
    migrationCompletionHandler = self->_migrationCompletionHandler;
    if (migrationCompletionHandler)
    {
      v5 = (void (**)(id, NSMutableArray *, NSMutableArray *, id))migrationCompletionHandler;
      v6 = self->_resultZoneIDsEligibleForDeletion;
      v5[2](v5, v6, self->_resultRecordIDsEligibleForDeletion, v7);

    }
  }

}

void __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  uint64_t v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E4644848;
    v4 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    -[FCCKDatabaseZoneMigrationOperation _migrateAndUpdateRecords:completion:](v6, a2, v5);

  }
}

void __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  if (!v7)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = *(void **)(v3 + 416);
      v5 = *(_QWORD *)(v3 + 376);
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    v6 = v4;
    objc_msgSend(v6, "addObject:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_migrateAndUpdateRecords:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  _QWORD v73[2];
  void (*v74)(uint64_t, void *, void *);
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE v89[12];
  __int16 v90;
  char *v91;
  __int16 v92;
  _QWORD v93[5];

  v93[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v72 = a1;
  if (!a1)
    goto LABEL_29;
  objc_msgSend(v5, "fc_uniqueByValueBlock:", &__block_literal_global_82);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 != objc_msgSend(v5, "count"))
  {
    v9 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend((id)v72, "shortOperationDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 138543618;
      v85 = v11;
      v86 = 2048;
      v87 = v12 - objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ removed %lu duplicates before migration", buf, 0x16u);

    }
  }
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v74 = __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_28;
  v75 = &unk_1E4643CF8;
  v76 = v72;
  v77 = v7;
  v78 = v6;
  v13 = v7;
  v66 = v73;
  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v13;
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
  if (!v70)
  {
    v56 = 0;
    goto LABEL_28;
  }
  v64 = v6;
  v65 = v5;
  v69 = *(_QWORD *)v80;
  v67 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)&v14 = 138543874;
  v63 = v14;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v80 != v69)
        objc_enumerationMutation(obj);
      v16 = *(id *)(*((_QWORD *)&v79 + 1) + 8 * v15);
      v17 = *(void **)(v72 + 384);
      v18 = *(void **)(v72 + 368);
      v83 = 0;
      v19 = v18;
      v20 = v17;
      objc_msgSend(v20, "databaseMigrationMigrateRecord:database:error:", v16, v19, &v83);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v83;

      objc_msgSend(v21, "recordID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("we currently only support migrations that produce an entirely new record"));
        *(_DWORD *)v89 = 136315906;
        *(_QWORD *)&v89[4] = "-[FCCKDatabaseZoneMigrationOperation _migratedRecord:error:]";
        v90 = 2080;
        v91 = "FCCKDatabaseZoneMigrationOperation.m";
        v92 = 1024;
        LODWORD(v93[0]) = 396;
        WORD2(v93[0]) = 2114;
        *(_QWORD *)((char *)v93 + 6) = v53;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v89, 0x26u);

        if (v21)
        {
LABEL_13:
          v26 = objc_alloc(MEMORY[0x1E0C95048]);
          objc_msgSend(v21, "recordType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v26, "initWithRecordType:recordID:", v27, v28);

          objc_msgSend(v21, "creationDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setCreationDate:", v30);

          objc_msgSend(v21, "modificationDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setModificationDate:", v31);

          objc_msgSend(v21, "creatorUserRecordID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setCreatorUserRecordID:", v32);

          objc_msgSend(v21, "lastModifiedUserRecordID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setLastModifiedUserRecordID:", v33);

          objc_msgSend(v21, "modifiedByDevice");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setModifiedByDevice:", v34);

          objc_msgSend(v21, "valueStore");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "values");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v36, "mutableCopy");
          objc_msgSend(v29, "valueStore");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setValues:", v37);

          v39 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v21, "valueStore");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "allKeys");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setWithArray:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "valueStore");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setChangedKeysSet:", v42);

          objc_msgSend(v21, "encryptedValueStore");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "values");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "mutableCopy");
          objc_msgSend(v29, "encryptedValueStore");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setValues:", v46);

          v48 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v21, "encryptedValueStore");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "allKeys");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setWithArray:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "encryptedValueStore");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setChangedKeysSet:", v51);

          goto LABEL_14;
        }
      }
      else if (v21)
      {
        goto LABEL_13;
      }
      v54 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        v57 = v54;
        objc_msgSend((id)v72, "shortOperationDescription");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = *(id *)(v72 + 384);
        v60 = objc_opt_class();
        *(_DWORD *)v89 = v63;
        *(_QWORD *)&v89[4] = v58;
        v90 = 2112;
        v91 = (char *)v60;
        v92 = 2112;
        v93[0] = v16;
        _os_log_error_impl(&dword_1A1B90000, v57, OS_LOG_TYPE_ERROR, "%{public}@ migrator %@ failed to migrate record %@", v89, 0x20u);

        if (v22)
          goto LABEL_18;
LABEL_23:
        v61 = (void *)MEMORY[0x1E0CB35C8];
        v88 = v67;
        *(_QWORD *)v89 = CFSTR("Failed to migrate record but received no error");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1, v63);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 16, v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v29 = 0;
LABEL_14:

        goto LABEL_19;
      }
      if (!v22)
        goto LABEL_23;
LABEL_18:
      v29 = 0;
LABEL_19:
      v55 = objc_retainAutorelease(v22);

      v56 = v55;
      if (!v29)
        goto LABEL_26;
      objc_msgSend(v71, "addObject:", v29);

      ++v15;
    }
    while (v70 != v15);
    v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
    v70 = v62;
  }
  while (v62);
  v56 = 0;
LABEL_26:
  v6 = v64;
  v5 = v65;
LABEL_28:

  v74((uint64_t)v66, v71, v56);
LABEL_29:

}

id __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 376);
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v7);

  return v8;
}

void __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!v5)
  {
    v3 = a1[4];
    if (v3)
      v4 = *(void **)(v3 + 424);
    else
      v4 = 0;
    objc_msgSend(v4, "addObjectsFromArray:", a1[5]);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __83__FCCKDatabaseZoneMigrationOperation__gatherRecordsToMigrateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v8;
    if (v7)
    {
      *(_QWORD *)v23 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v23[8] = 3221225472;
      *(_QWORD *)&v23[16] = __52__FCCKDatabaseZoneMigrationOperation__pruneRecords___block_invoke;
      v24 = &unk_1E463BC28;
      v25 = v7;
      objc_msgSend(v8, "fc_arrayByRemovingObjectsPassingTest:", v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(v7 + 392);
      if (v11)
      {
        v12 = *(id *)(v7 + 376);
        v13 = v11;
        objc_msgSend(v12, "zoneName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pruneRecords:forZoneName:", v10, v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }
    }
    else
    {
      v10 = 0;
    }

    v16 = objc_msgSend(v10, "count");
    if (v16 != objc_msgSend(v9, "count"))
    {
      v17 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        v19 = v17;
        objc_msgSend(v18, "shortOperationDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "count");
        v22 = objc_msgSend(v10, "count");
        *(_DWORD *)v23 = 138543874;
        *(_QWORD *)&v23[4] = v20;
        *(_WORD *)&v23[12] = 2048;
        *(_QWORD *)&v23[14] = v21;
        *(_WORD *)&v23[22] = 2048;
        v24 = (void *)v22;
        _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ pruned %lu records down to %lu", v23, 0x20u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_continueGatheringRecordsWithPreviousServerChangeToken:(void *)a3 recordsAlreadyFetched:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  id v9;
  FCCKPrivateFetchRecordZoneChangesOperation *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = a2;
    v10 = objc_alloc_init(FCCKPrivateFetchRecordZoneChangesOperation);
    -[FCCKPrivateFetchRecordZoneChangesOperation setRecordZoneID:](v10, "setRecordZoneID:", a1[47]);
    -[FCCKPrivateFetchRecordZoneChangesOperation setPreviousServerChangeToken:](v10, "setPreviousServerChangeToken:", v9);

    -[FCCKPrivateDatabaseOperation setSkipPreflight:](v10, "setSkipPreflight:", 1);
    -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v10, "setHandleIdentityLoss:", 0);
    -[FCCKPrivateFetchRecordZoneChangesOperation setFetchNewestChangesFirst:](v10, "setFetchNewestChangesFirst:", 1);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke;
    v11[3] = &unk_1E46448C0;
    v11[4] = a1;
    v13 = v8;
    v12 = v7;
    -[FCCKPrivateFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:](v10, "setFetchRecordZoneChangesCompletionBlock:", v11);
    objc_msgSend(a1, "associateChildOperation:", v10);
    -[FCCKPrivateDatabase addOperation:](a1[46], v10);

  }
}

void __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4, int a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  unint64_t v35;
  id v36;
  char v37;
  id v38;
  id v39;
  _QWORD v40[7];
  _QWORD v41[7];
  _QWORD v42[6];
  _BYTE buf[24];
  void *v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a4;
  v12 = a6;
  if (!objc_msgSend(v12, "fc_isMissingZoneError"))
  {
    if (v12)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_14;
      v41[3] = &unk_1E463CCB8;
      v41[4] = a1[4];
      v41[5] = v12;
      v41[6] = a1[6];
      __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_14(v41);
      goto LABEL_26;
    }
    v14 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)a1[4];
      v16 = v14;
      objc_msgSend(v15, "shortOperationDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v10, "count");
      v19 = CFSTR("no");
      *(_DWORD *)buf = 138544130;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[4] = v17;
      if (a5)
        v19 = CFSTR("yes");
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v44 = v11;
      LOWORD(v45) = 2112;
      *(_QWORD *)((char *)&v45 + 2) = v19;
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch-changes returned %lu records, token %@, more coming %@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", v10, a1[5]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a5 & 1) == 0)
    {
      (*(void (**)(void))(a1[6] + 16))();
LABEL_25:

      goto LABEL_26;
    }
    v21 = a1[4];
    v39 = v10;
    v38 = v20;
    if (v21)
    {
      v22 = *(void **)(v21 + 392);
      v23 = *(id *)(v21 + 376);
      v24 = v22;
      objc_msgSend(v23, "zoneName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "softMaxRecordAgeWhenMigratingZoneName:", v25);
      v27 = v26;

      if (v27 == 0.0)
      {
        v30 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __97__FCCKDatabaseZoneMigrationOperation__shouldStopGatheringAfterFetchingRecords_cumulativeRecords___block_invoke;
        v44 = &unk_1E46448E8;
        *(_QWORD *)&v45 = v28;
        *((double *)&v45 + 1) = v27;
        v29 = v28;
        v30 = objc_msgSend(v39, "fc_containsObjectPassingTest:", buf);

      }
      v31 = *(void **)(v21 + 392);
      v32 = *(id *)(v21 + 376);
      v33 = v31;
      objc_msgSend(v32, "zoneName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "softMaxRecordCountWhenMigratingZoneName:", v34);

      if (v35)
      {
        v36 = v38;
        if (objc_msgSend(v38, "count") >= v35)
          v37 = 1;
        else
          v37 = v30;

        if ((v37 & 1) == 0)
          goto LABEL_24;
        goto LABEL_22;
      }
      v36 = v38;

      if (v30)
      {
LABEL_22:
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2_21;
        v40[3] = &unk_1E463CCB8;
        v40[4] = a1[4];
        v40[5] = v36;
        v40[6] = a1[6];
        __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2_21((uint64_t)v40);
        goto LABEL_25;
      }
    }
    else
    {
      v36 = v38;

    }
LABEL_24:
    -[FCCKDatabaseZoneMigrationOperation _continueGatheringRecordsWithPreviousServerChangeToken:recordsAlreadyFetched:completionHandler:](a1[4], v11, v36, a1[6]);
    goto LABEL_25;
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2;
  v42[3] = &unk_1E463B790;
  v13 = a1[6];
  v42[4] = a1[4];
  v42[5] = v13;
  __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2((uint64_t)v42);
LABEL_26:

}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[47];
    v5 = v4;
    objc_msgSend(v5, "zoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch-changes returned empty because zone '%@' doesn't exist", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_14(_QWORD *a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)a1[4];
    v5 = v2;
    objc_msgSend(v4, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "%{public}@ fetch-changes failed with error %@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2_21(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch-changes is stopping early with %lu records because we've reached our soft limits", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

BOOL __97__FCCKDatabaseZoneMigrationOperation__shouldStopGatheringAfterFetchingRecords_cumulativeRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 >= *(double *)(a1 + 40);

  return v6;
}

void __74__FCCKDatabaseZoneMigrationOperation__migrateRecordIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "fc_isCKUnknownItemError"))
  {
    v16 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 32);
      v18 = v16;
      objc_msgSend(v17, "shortOperationDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2112;
      v23 = (uint64_t)v7;
      _os_log_error_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_ERROR, "%{public}@ fetch failed with error %@", (uint8_t *)&v20, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "shortOperationDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "count");
      v13 = objc_msgSend(*(id *)(a1 + 40), "count");
      v20 = 138543874;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch returned %lu of %lu records", (uint8_t *)&v20, 0x20u);

    }
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKDatabaseZoneMigrationOperation _migrateAndUpdateRecords:completion:](v14, v15, *(void **)(a1 + 48));

  }
}

uint64_t __52__FCCKDatabaseZoneMigrationOperation__pruneRecords___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(void **)(v3 + 384);
    v5 = *(_QWORD *)(v3 + 368);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = v4;
  v7 = objc_msgSend(v6, "databaseMigrationShouldDropRecord:database:", a2, v5);

  return v7;
}

uint64_t __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

void __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  id v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  FCCKPrivateSaveRecordZonesOperation *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "shortOperationDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138543874;
    v52 = v10;
    v53 = 2048;
    v54 = v11;
    v55 = 2048;
    v56 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ migration of %lu records produced %lu records to save", buf, 0x20u);

  }
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v41 = v5;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v5;
    v39 = v13;
    if (v12)
    {
      v14 = v13;
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *(id *)(v12 + 408);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v48;
        v21 = *MEMORY[0x1E0C94A30];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v48 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "recordID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "zoneID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "zoneName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "containsObject:", v25) & 1) == 0
              && (objc_msgSend(v25, "isEqualToString:", v21) & 1) == 0)
            {
              objc_msgSend(v15, "addObject:", v24);
              objc_msgSend(v16, "addObject:", v25);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
        }
        while (v19);
      }

    }
    else
    {
      v15 = 0;
    }

    v26 = objc_msgSend(v15, "count");
    v27 = *(uint64_t **)(a1 + 32);
    v6 = 0;
    if (v26)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_29;
      v42[3] = &unk_1E4644870;
      v42[4] = v27;
      v43 = v39;
      v44 = *(id *)(a1 + 48);
      v28 = v15;
      v29 = v42;
      v30 = v29;
      if (v27)
      {
        v40 = v29;
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v28, "count"));
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v32 = v28;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v48 != v35)
                objc_enumerationMutation(v32);
              v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
              objc_msgSend(v31, "addObject:", v37);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
          }
          while (v34);
        }

        v38 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
        -[FCCKPrivateSaveRecordZonesOperation setRecordZonesToSave:](v38, "setRecordZonesToSave:", v31);
        -[FCCKPrivateDatabaseOperation setSkipPreflight:](v38, "setSkipPreflight:", 1);
        -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v38, "setHandleIdentityLoss:", 0);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __62__FCCKDatabaseZoneMigrationOperation__createZones_completion___block_invoke;
        v45[3] = &unk_1E4644930;
        v30 = v40;
        v46 = v40;
        -[FCCKPrivateSaveRecordZonesOperation setSaveRecordZonesCompletionBlock:](v38, "setSaveRecordZonesCompletionBlock:", v45);
        objc_msgSend(v27, "associateChildOperation:", v38);
        -[FCCKPrivateDatabase addOperation:](v27[46], v38);

      }
      v6 = 0;
    }
    else
    {
      -[FCCKDatabaseZoneMigrationOperation _saveMigratedRecords:completion:](*(_QWORD **)(a1 + 32), v39, *(void **)(a1 + 48));
    }

    v5 = v41;
  }

}

void __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_29(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    -[FCCKDatabaseZoneMigrationOperation _saveMigratedRecords:completion:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_saveMigratedRecords:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  FCCKPrivateBatchedSaveRecordsOperation *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        objc_msgSend(a1, "shortOperationDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        v16 = 2048;
        v17 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to write %lu records", buf, 0x16u);

      }
      v10 = objc_alloc_init(FCCKPrivateBatchedSaveRecordsOperation);
      -[FCCKPrivateBatchedSaveRecordsOperation setDatabase:](v10, "setDatabase:", a1[46]);
      -[FCCKPrivateBatchedSaveRecordsOperation setRecordsToSave:](v10, "setRecordsToSave:", v5);
      -[FCCKPrivateBatchedSaveRecordsOperation setSavePolicy:](v10, "setSavePolicy:", 0);
      -[FCCKPrivateBatchedSaveRecordsOperation setSkipPreflight:](v10, "setSkipPreflight:", 1);
      -[FCCKPrivateBatchedSaveRecordsOperation setHandleIdentityLoss:](v10, "setHandleIdentityLoss:", 0);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __70__FCCKDatabaseZoneMigrationOperation__saveMigratedRecords_completion___block_invoke_31;
      v11[3] = &unk_1E4643CF8;
      v11[4] = a1;
      v12 = v5;
      v13 = v6;
      -[FCCKPrivateBatchedSaveRecordsOperation setSaveRecordsCompletionBlock:](v10, "setSaveRecordsCompletionBlock:", v11);
      objc_msgSend(a1, "associateChildOperation:", v10);
      -[FCOperation start](v10, "start");

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

void __70__FCCKDatabaseZoneMigrationOperation__saveMigratedRecords_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "fc_isCKErrorWithCode:", 14))
  {
    v15 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 32);
      v17 = v15;
      objc_msgSend(v16, "shortOperationDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = (uint64_t)v7;
      _os_log_error_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_ERROR, "%{public}@ save failed with error %@", (uint8_t *)&v19, 0x16u);

    }
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "shortOperationDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "count");
      v13 = objc_msgSend(*(id *)(a1 + 40), "count");
      v19 = 138543874;
      v20 = v11;
      v21 = 2048;
      v22 = v12;
      v23 = 2048;
      v24 = v13;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully wrote %lu of %lu records", (uint8_t *)&v19, 0x20u);

    }
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v14();

}

uint64_t __62__FCCKDatabaseZoneMigrationOperation__createZones_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

- (void)setMigrator:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 384), a2);
}

- (void)setPruningAssistant:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, 0);
  objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, 0);
  objc_storeStrong((id *)&self->_createdZones, 0);
  objc_storeStrong(&self->_migrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pruningAssistant, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
