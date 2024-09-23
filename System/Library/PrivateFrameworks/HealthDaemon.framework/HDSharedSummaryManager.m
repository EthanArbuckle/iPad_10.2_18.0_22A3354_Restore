@implementation HDSharedSummaryManager

- (HDSharedSummaryManager)initWithProfile:(id)a3
{
  id v4;
  HDSharedSummaryManager *v5;
  HDSharedSummaryManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKSynchronousObserverSet *observers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSharedSummaryManager;
  v5 = -[HDSharedSummaryManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    HKLogSharing();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("shared-summary-manager-observers"), v8);
    observers = v6->_observers;
    v6->_observers = (HKSynchronousObserverSet *)v9;

  }
  return v6;
}

- (uint64_t)performDatabaseTransactionForWriting:(void *)a3 entity:(_QWORD *)a4 error:(void *)a5 block:
{
  id v9;
  id *v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v24;

  v9 = a5;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_22;
  }
  v10 = (id *)(a1 + 8);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "database");
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(a3, "protectionClass") == 2)
    {
      if ((a2 & 1) != 0)
        +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
      else
        +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
    }
    else if ((a2 & 1) != 0)
    {
      +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
    }
    else
    {
      +[HDDatabaseTransactionContext contextForReading](HDDatabaseTransactionContext, "contextForReading");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    v12 = 1;
    objc_msgSend(v15, "setCacheScope:", 1);
    v16 = objc_loadWeakRetained(v10);
    objc_msgSend(v16, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v18 = objc_msgSend(v17, "performTransactionWithContext:error:block:inaccessibilityHandler:", v15, &v24, v9, 0);
    v19 = v24;

    if ((v18 & 1) != 0)
      goto LABEL_21;
    if (objc_msgSend(v19, "hk_isDatabaseTransactionError"))
    {
      v20 = objc_loadWeakRetained(v10);
      objc_msgSend(v20, "database");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "performTransactionWithContext:error:block:inaccessibilityHandler:", v14, a4, v9, 0);

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    v22 = v19;
    v20 = v22;
    if (v22)
    {
      if (a4)
      {
        v20 = objc_retainAutorelease(v22);
        v12 = 0;
        *a4 = v20;
        goto LABEL_20;
      }
      _HKLogDroppedError();
    }
    v12 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 1500, CFSTR("Nil healthDatabase"));
LABEL_22:

  return v12;
}

- (id)createNewTransactionWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v6 = a3;
  v13 = 0;
  -[HDSharedSummaryManager deviceIdentifierWithError:](self, "deviceIdentifierWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    -[HDSharedSummaryManager _createTransactionWithUUID:sourceDeviceIdentifier:metadata:error:](self, v6, self->_deviceIdentifier, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v10 = 0;
  }

  return v10;
}

- (id)_createTransactionWithUUID:(void *)a3 sourceDeviceIdentifier:(void *)a4 metadata:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_11;
  }
  _HKInitializeLogging();
  HKLogSharing();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    v13 = *(id *)&buf[4];
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Creating new transaction with UUID %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__35;
  v24 = __Block_byref_object_dispose__35;
  v25 = 0;
  v14 = (void *)objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__HDSharedSummaryManager__createTransactionWithUUID_sourceDeviceIdentifier_metadata_error___block_invoke;
  v18[3] = &unk_1E6CE8DD8;
  v21 = buf;
  v19 = v9;
  v20 = v10;
  -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)a1, 1, v14, a5, v18);
  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v11 && v15)
  {
    if (!objc_msgSend(a1, "addMetadata:transactionEntity:error:", v11, v15, a5))
    {
      v16 = 0;
      goto LABEL_10;
    }
    v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  v16 = v15;
LABEL_10:

  _Block_object_dispose(buf, 8);
LABEL_11:

  return v16;
}

- (id)transactionWithUUID:(id)a3 requireUncommitted:(BOOL)a4 error:(id *)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  HDSharedSummaryManager *v17;
  uint64_t *v18;
  SEL v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__35;
  v25 = __Block_byref_object_dispose__35;
  v26 = 0;
  v10 = (void *)objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__HDSharedSummaryManager_transactionWithUUID_requireUncommitted_error___block_invoke;
  v15[3] = &unk_1E6CEE518;
  v18 = &v21;
  v11 = v9;
  v20 = a4;
  v16 = v11;
  v17 = self;
  v19 = a2;
  if (-[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v10, a5, v15))v12 = (void *)v22[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __71__HDSharedSummaryManager_transactionWithUUID_requireUncommitted_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v21;
  id v22;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v22 = 0;
  +[HDSharedSummaryTransactionEntity transactionEntityWithUUID:databaseTransaction:error:](HDSharedSummaryTransactionEntity, "transactionEntityWithUUID:databaseTransaction:error:", v6, v5, &v22);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v22;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v21 = v8;
      v12 = objc_msgSend(v11, "committedInDatabaseTransaction:error:", v5, &v21);
      v13 = v21;

      if (v12)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = objc_opt_class();
        v16 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hk_error:class:selector:format:", 126, v15, v16, CFSTR("Transaction with UUID %@ already committed"), v17);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = v13;
      }
    }
    v18 = v8;
    if (v18)
    {
      if (a3)
        goto LABEL_11;
      goto LABEL_7;
    }
LABEL_12:
    v19 = 1;
    goto LABEL_13;
  }
  v18 = v8;
  if (!v18)
    goto LABEL_12;
  if (a3)
  {
LABEL_11:
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a3 = v18;
    goto LABEL_13;
  }
LABEL_7:
  _HKLogDroppedError();
  v19 = 0;
LABEL_13:

  return v19;
}

- (BOOL)addSharedSummaries:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HDSharedSummaryManager *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__HDSharedSummaryManager_addSharedSummaries_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E6CEB3F8;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

uint64_t __69__HDSharedSummaryManager_addSharedSummaries_transactionEntity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  int v45;
  id v46;
  void *v47;
  _QWORD *v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  id v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  BOOL v68;
  _BYTE v69[128];
  _QWORD v70[3];

  LODWORD(v4) = a1;
  v70[1] = *MEMORY[0x1E0C80C00];
  v55 = a2;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = *(id *)(a1 + 32);
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v53)
  {
    v49 = a3;
    v52 = *(_QWORD *)v59;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v59 != v52)
          objc_enumerationMutation(obj);
        v56 = v5;
        v6 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v5);
        v7 = *(id *)(a1 + 40);
        v8 = *(void **)(a1 + 48);
        v9 = v6;
        v10 = v8;
        v11 = v55;
        if (v7)
        {
          objc_msgSend(v9, "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "package");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "version");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "compatibilityVersion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v10;
          v17 = objc_msgSend(v10, "persistentID");
          objc_msgSend(v9, "summaryData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0;
          +[HDSharedSummaryEntity insertOrReplaceWithUUID:package:name:version:compatibilityVersion:transactionID:summaryData:databaseTransaction:error:](HDSharedSummaryEntity, "insertOrReplaceWithUUID:package:name:version:compatibilityVersion:transactionID:summaryData:databaseTransaction:error:", v12, v13, v14, v15, v16, v17, v18, v11, &v67);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v67;

          if (v19)
          {
            v21 = objc_msgSend(v19, "persistentID");
            objc_msgSend(v9, "authorizationIdentifiers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v20;
            +[HDSharedSummaryAuthorizationIdentifierEntity insertWithSummaryID:authorizationIdentifiers:databaseTransaction:error:](HDSharedSummaryAuthorizationIdentifierEntity, "insertWithSummaryID:authorizationIdentifiers:databaseTransaction:error:", v21, v22, v11, &v66);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v66;

            if (v23)
            {
              v25 = objc_msgSend(v19, "persistentID");
              objc_msgSend(v9, "objectTypes");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v24;
              +[HDSharedSummaryObjectTypeEntity insertWithSummaryID:objectTypes:databaseTransaction:error:](HDSharedSummaryObjectTypeEntity, "insertWithSummaryID:objectTypes:databaseTransaction:error:", v25, v26, v11, &v65);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v65;

              v10 = v57;
              if (v27)
              {
                v50 = v27;
                v29 = objc_msgSend(v57, "persistentID");
                objc_msgSend(v9, "package");
                v30 = v11;
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "name");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v70[0] = v32;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = v28;
                v62[0] = MEMORY[0x1E0C809B0];
                v62[1] = 3221225472;
                v62[2] = __88__HDSharedSummaryManager__addSharedSummary_transactionEntity_databaseTransaction_error___block_invoke;
                v62[3] = &unk_1E6CEE768;
                v63 = v30;
                LOBYTE(v29) = +[HDSharedSummaryEntity enumerateEntitiesWithReuseTransactionID:package:names:databaseTransaction:error:enumerationHandler:](HDSharedSummaryEntity, "enumerateEntitiesWithReuseTransactionID:package:names:databaseTransaction:error:enumerationHandler:", v29, v31, v33, v63, &v64, v62);
                v7 = v64;

                if ((v29 & 1) != 0)
                {
                  v4 = 0;
                  v10 = v57;
                  v27 = v50;
                  v11 = v30;
                  v34 = 1;
                }
                else
                {
                  v41 = v7;
                  v4 = v41;
                  v34 = v41 == 0;
                  if (v41)
                    v42 = objc_retainAutorelease(v41);

                  v10 = v57;
                  v27 = v50;
                  v11 = v30;
                }
                v68 = v34;

              }
              else
              {
                v39 = v28;
                v4 = v39;
                if (v39)
                  v40 = objc_retainAutorelease(v39);

                v68 = v4 == 0;
                v7 = v4;
              }

            }
            else
            {
              v37 = v24;
              v4 = v37;
              v10 = v57;
              if (v37)
                v38 = objc_retainAutorelease(v37);

              v68 = v4 == 0;
              v7 = v4;
            }

          }
          else
          {
            v35 = v20;
            v4 = v35;
            if (v35)
              v36 = objc_retainAutorelease(v35);

            v68 = v4 == 0;
            v7 = v4;
            v10 = v57;
          }

          LOBYTE(v7) = v68;
        }
        else
        {
          v4 = 0;
        }

        v43 = v4;
        if ((v7 & 1) == 0)
        {
          v46 = v43;
          v47 = v46;
          LODWORD(v4) = v46 == 0;
          if (v46)
          {
            if (v49)
              *v49 = objc_retainAutorelease(v46);
            else
              _HKLogDroppedError();
          }

          v45 = 0;
          goto LABEL_39;
        }

        v5 = v56 + 1;
      }
      while (v53 != v56 + 1);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      v53 = v44;
      if (v44)
        continue;
      break;
    }
  }
  v45 = 1;
LABEL_39:

  return (v4 | v45) & 1;
}

- (BOOL)addMetadata:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__HDSharedSummaryManager_addMetadata_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E6CE7950;
  v15 = v9;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

BOOL __62__HDSharedSummaryManager_addMetadata_transactionEntity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  +[HDSharedSummaryTransactionMetadataEntity insertWithTransactionID:metadata:databaseTransaction:error:](HDSharedSummaryTransactionMetadataEntity, "insertWithTransactionID:metadata:databaseTransaction:error:", objc_msgSend(v5, "persistentID"), *(_QWORD *)(a1 + 40), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (BOOL)reuseSharedSummariesWithUUIDs:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HDSharedSummaryManager_reuseSharedSummariesWithUUIDs_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E6CE7950;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

uint64_t __80__HDSharedSummaryManager_reuseSharedSummariesWithUUIDs_transactionEntity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  int v15;
  id v16;
  _QWORD *v18;
  id obj;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
  {
    v8 = 0;
    v15 = 1;
    goto LABEL_20;
  }
  v7 = v6;
  v18 = a3;
  v8 = 0;
  v9 = *(_QWORD *)v23;
  while (2)
  {
    a3 = 0;
    do
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)a3);
      v21 = v8;
      +[HDSharedSummaryEntity entityWithUUID:databaseTransaction:error:](HDSharedSummaryEntity, "entityWithUUID:databaseTransaction:error:", v10, v5, &v21, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;

      if (!v11)
      {
        v16 = v12;
LABEL_14:
        v8 = v16;
        if (v16)
        {
          if (v18)
          {
            v8 = objc_retainAutorelease(v16);
            LODWORD(a3) = 0;
            *v18 = v8;
          }
          else
          {
            _HKLogDroppedError();
            LODWORD(a3) = 0;
          }
        }
        else
        {
          LODWORD(a3) = 1;
        }

        v15 = 0;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "persistentID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v12;
      v14 = objc_msgSend(v11, "setReuseTransactionID:databaseTransaction:error:", v13, v5, &v20);
      v8 = v20;

      if ((v14 & 1) == 0)
      {
        v16 = v8;
        goto LABEL_14;
      }

      a3 = (_QWORD *)((char *)a3 + 1);
    }
    while ((_QWORD *)v7 != a3);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v15 = 1;
    if (v7)
      continue;
    break;
  }
LABEL_20:

  return (v15 | a3) & 1;
}

- (BOOL)reuseSharedSummariesWithPackage:(id)a3 names:(id)a4 transactionEntity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke;
  v18[3] = &unk_1E6CEB3F8;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  LOBYTE(a6) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v13, a6, v18);

  return (char)a6;
}

BOOL __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke(id *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a2;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v25 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_2;
  v19 = &unk_1E6CEE568;
  v20 = a1[4];
  v21 = a1[5];
  v6 = v5;
  v22 = v6;
  v24 = &v26;
  v23 = a1[6];
  v7 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:](HDSharedSummaryTransactionEntity, "enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:", v6, 0, &v25, &v16);
  v8 = v25;
  if (v7)
  {
    v9 = v27[3];
    v10 = a1[5];
    if (v9)
    {
      if (v9 >= objc_msgSend(a1[5], "count"))
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Some summaries not found in package %@ with names %@"), a1[4], a1[5], v16, v17, v18, v19, v20, v21, v22);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10)
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("No summaries for reuse were found in package %@ with names %@"), a1[4], v10, v16, v17, v18, v19, v20, v21, v22);
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("No summaries for reuse were found in package %@"), a1[4]);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;

    v8 = v12;
  }
LABEL_10:
  v13 = v8;
  v14 = v13;
  if (v13)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(&v26, 8);
  return v14 == 0;
}

BOOL __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;

  v5 = objc_msgSend(a2, "persistentID");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_3;
  v13[3] = &unk_1E6CEE540;
  v14 = v8;
  v12 = *(_OWORD *)(a1 + 56);
  v9 = (id)v12;
  v15 = v12;
  v10 = +[HDSharedSummaryEntity enumerateEntitiesWithTransactionID:package:names:databaseTransaction:error:enumerationHandler:](HDSharedSummaryEntity, "enumerateEntitiesWithTransactionID:package:names:databaseTransaction:error:enumerationHandler:", v5, v6, v7, v14, a3, v13);

  return v10;
}

uint64_t __88__HDSharedSummaryManager_reuseSharedSummariesWithPackage_names_transactionEntity_error___block_invoke_3(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  id v16;
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  objc_msgSend(v5, "nameInDatabaseTransaction:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (!v7)
  {
    v13 = v8;
    if (v13)
    {
      if (a3)
      {
LABEL_9:
        v13 = objc_retainAutorelease(v13);
        v14 = 0;
        *a3 = v13;
        goto LABEL_11;
      }
LABEL_6:
      _HKLogDroppedError();
      v14 = 0;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v12 = objc_msgSend(v5, "setReuseTransactionID:databaseTransaction:error:", v10, v11, &v16);
  v13 = v16;

  if ((v12 & 1) == 0)
  {
    v13 = v13;
    if (v13)
    {
      if (a3)
        goto LABEL_9;
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)removeSummariesWithUUIDs:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  HDSharedSummaryManager *v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HDSharedSummaryManager_removeSummariesWithUUIDs_transactionEntity_error___block_invoke;
  v15[3] = &unk_1E6CE7C58;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = a2;
  v12 = v10;
  v13 = v9;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v11, a5, v15);

  return (char)a5;
}

uint64_t __75__HDSharedSummaryManager_removeSummariesWithUUIDs_transactionEntity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  int v18;
  id v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD *v27;
  void *v28;
  id obj;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = a1;
  obj = *(id *)(a1 + 32);
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v31)
  {
    v6 = 0;
    v18 = 1;
    goto LABEL_43;
  }
  v27 = a3;
  v6 = 0;
  v7 = *(_QWORD *)v39;
  v30 = v5;
  while (2)
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v39 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      v37 = v6;
      +[HDSharedSummaryEntity entityWithUUID:databaseTransaction:error:](HDSharedSummaryEntity, "entityWithUUID:databaseTransaction:error:", v9, v5, &v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v37;

      if (!v10)
      {
        v19 = v11;
        v10 = v19;
        LODWORD(a3) = v19 == 0;
        if (v19)
        {
          if (v27)
            *v27 = objc_retainAutorelease(v19);
          else
            _HKLogDroppedError();
        }
        v6 = v10;
        goto LABEL_42;
      }
      v36 = v11;
      objc_msgSend(v10, "transactionIDInDatabaseTransaction:error:", v5, &v36);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v36;

      if (!v12)
      {
        v20 = a3;
        goto LABEL_25;
      }
      v13 = objc_msgSend(*(id *)(v32 + 40), "persistentID");
      if (v13 == objc_msgSend(v12, "unsignedLongLongValue"))
      {
        v35 = a3;
        v14 = objc_msgSend(v10, "deleteFromDatabase:error:", v28, &v35);
        v6 = v35;

        if ((v14 & 1) == 0)
        {
          v20 = v6;
LABEL_25:
          v15 = v20;
          if (v20)
          {
            if (v27)
            {
              v15 = objc_retainAutorelease(v20);
              LODWORD(a3) = 0;
              *v27 = v15;
            }
            else
            {
              _HKLogDroppedError();
              LODWORD(a3) = 0;
            }
            v6 = v15;
            goto LABEL_39;
          }
          v6 = 0;
          goto LABEL_30;
        }
      }
      else
      {
        v34 = a3;
        objc_msgSend(v10, "reuseTransactionIDInDatabaseTransaction:error:", v5, &v34);
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v16 = v34;

        if (!v15
          || (v17 = objc_msgSend(*(id *)(v32 + 40), "persistentID"), v17 != objc_msgSend(v15, "unsignedLongLongValue")))
        {
          if (v16)
          {
            v6 = v16;
LABEL_34:
            if (v27)
            {
              v6 = objc_retainAutorelease(v6);
              LODWORD(a3) = 0;
              *v27 = v6;
            }
            else
            {
              _HKLogDroppedError();
              LODWORD(a3) = 0;
            }
LABEL_37:

LABEL_39:
            v5 = v30;
LABEL_42:

            v18 = 0;
            goto LABEL_43;
          }
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = objc_opt_class();
          v23 = *(_QWORD *)(v32 + 56);
          objc_msgSend(v9, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "hk_error:class:selector:format:", 126, v22, v23, CFSTR("Summary %@ not in transaction"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v25;
          if (v6)
            goto LABEL_34;
LABEL_30:
          LODWORD(a3) = 1;
          goto LABEL_39;
        }
        v33 = v16;
        LODWORD(a3) = objc_msgSend(v10, "setReuseTransactionID:databaseTransaction:error:", 0, v30, &v33);
        v6 = v33;

        if ((a3 & 1) == 0)
        {
          v6 = v6;
          if (v6)
            goto LABEL_34;
          LODWORD(a3) = 1;
          goto LABEL_37;
        }

        v5 = v30;
      }

    }
    v18 = 1;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v31)
      continue;
    break;
  }
LABEL_43:

  return (v18 | a3) & 1;
}

- (BOOL)removeSummariesWithPackage:(id)a3 names:(id)a4 transactionEntity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke;
  v18[3] = &unk_1E6CEB3F8;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  LOBYTE(a6) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v13, a6, v18);

  return (char)a6;
}

BOOL __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  const __CFString *v19;
  id v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a2;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  objc_msgSend(v4, "databaseForEntityClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v35 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_2;
  v32[3] = &unk_1E6CEE590;
  v34 = &v36;
  v10 = v5;
  v33 = v10;
  v11 = +[HDSharedSummaryEntity enumerateEntitiesWithTransactionID:package:names:databaseTransaction:error:enumerationHandler:](HDSharedSummaryEntity, "enumerateEntitiesWithTransactionID:package:names:databaseTransaction:error:enumerationHandler:", v6, v7, v8, v4, &v35, v32);
  v12 = v35;
  v13 = v12;
  if (!v11)
  {
    v20 = v12;
    v21 = v20;
    if (v20)
    {
      if (a3)
      {
        v21 = objc_retainAutorelease(v20);
        v22 = 0;
        *a3 = v21;
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
      v23 = v21;
    }
    else
    {
      v23 = 0;
      v22 = 1;
    }
    goto LABEL_19;
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_3;
  v28[3] = &unk_1E6CEE590;
  v30 = &v36;
  v31 = v13;
  v29 = v4;
  LODWORD(v14) = +[HDSharedSummaryEntity enumerateEntitiesWithReuseTransactionID:package:names:databaseTransaction:error:enumerationHandler:](HDSharedSummaryEntity, "enumerateEntitiesWithReuseTransactionID:package:names:databaseTransaction:error:enumerationHandler:", v14, v15, v16, v29, &v31, v28);
  v17 = v31;

  if ((_DWORD)v14)
  {
    v18 = v37[3];
    if (!v18)
    {
      v19 = CFSTR("No summaries to remove were found with package %@ and names %@");
      goto LABEL_13;
    }
    if (v18 < objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v19 = CFSTR("Some summaries to remove were not found with package %@ and names %@");
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, v19, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v24 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v24;
    }
  }
  v25 = v17;
  v23 = v25;
  v22 = v25 == 0;
  if (v25)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v25);
    else
      _HKLogDroppedError();
  }

  v21 = v29;
LABEL_19:

  _Block_object_dispose(&v36, 8);
  return v22;
}

uint64_t __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(a2, "deleteFromDatabase:error:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __83__HDSharedSummaryManager_removeSummariesWithPackage_names_transactionEntity_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(a2, "setReuseTransactionID:databaseTransaction:error:", 0, *(_QWORD *)(a1 + 32), a3);
}

- (id)commitTransactionEntity:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *, _QWORD *);
  void *v22;
  id v23;
  HDSharedSummaryManager *v24;
  uint64_t *v25;
  __int128 *p_buf;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t v31[4];
  id v32;
  __int16 v33;
  __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v8 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Committing transaction", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__35;
  v38 = __Block_byref_object_dispose__35;
  v39 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v9 = (void *)objc_opt_class();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke;
  v22 = &unk_1E6CEE5B8;
  v10 = v6;
  v23 = v10;
  v24 = self;
  v25 = &v27;
  p_buf = &buf;
  if (-[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v9, a4, &v19))
  {
    _HKInitializeLogging();
    HKLogSharing();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = (__CFString *)v28[3];
      *(_DWORD *)v31 = 138543618;
      v32 = v12;
      v33 = 2048;
      v34 = v13;
      v14 = v12;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Successfully committing transaction with %ld summaries", v31, 0x16u);

    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (id)objc_opt_class();
      if (a4)
      {
        objc_msgSend(*a4, "localizedDescription", v19, v20, v21, v22);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = CFSTR("<lost>");
      }
      *(_DWORD *)v31 = 138543618;
      v32 = v15;
      v33 = 2114;
      v34 = v16;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to commit transaction - %{public}@", v31, 0x16u);
      if (a4)

    }
  }

  v17 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

BOOL __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  _BOOL8 v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  int64_t v43;
  id WeakRetained;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v52 = 0;
  v7 = +[HDSharedSummaryEntity reuseSummariesForTransactionID:databaseTransaction:error:](HDSharedSummaryEntity, "reuseSummariesForTransactionID:databaseTransaction:error:", v6, v5, &v52);
  v8 = v52;
  v9 = v8;
  if (v7)
  {
    v10 = *(void **)(a1 + 32);
    v51 = v9;
    objc_msgSend(v10, "sourceDeviceIdentiferInDatabaseTransaction:error:", v5, &v51);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v51;

    if (v11)
    {
      v13 = *(_QWORD *)(a1 + 40);
      v50 = v12;
      v14 = v5;
      v15 = v11;
      if (v13)
      {
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __107__HDSharedSummaryManager__deleteCommittedTransactionsWithDatabaseTransaction_sourceDeviceIdentifier_error___block_invoke;
        v53[3] = &unk_1E6CEE718;
        v53[4] = v13;
        v16 = v14;
        v54 = v16;
        v55 = v15;
        v17 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:](HDSharedSummaryTransactionEntity, "enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:", v16, 0, &v50, v53);

      }
      else
      {
        v17 = 0;
      }

      v18 = v50;
      if (v17)
      {
        v19 = *(void **)(a1 + 32);
        v49 = v18;
        v20 = objc_msgSend(v19, "setCommitted:databaseTransaction:error:", 1, v14, &v49);
        v21 = v49;

        if ((v20 & 1) != 0)
        {
          v22 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
          v48 = v21;
          +[HDSharedSummaryTransactionMetadataEntity metadataForTransactionID:databaseTransaction:error:](HDSharedSummaryTransactionMetadataEntity, "metadataForTransactionID:databaseTransaction:error:", v22, v14, &v48);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = v48;

          if (v23)
          {
            v25 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
            objc_msgSend(WeakRetained, "database");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v24;
            v43 = +[HDSharedSummaryEntity countOfObjectsForTransactionID:healthDatabase:error:](HDSharedSummaryEntity, "countOfObjectsForTransactionID:healthDatabase:error:", v25, v26, &v47);
            v27 = v47;

            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v43;
            if (v27)
            {
              if (a3)
              {
                v27 = objc_retainAutorelease(v27);
                v28 = 0;
                *a3 = v27;
              }
              else
              {
                _HKLogDroppedError();
                v28 = 0;
              }
            }
            else
            {
              v31 = *(void **)(a1 + 32);
              v46 = 0;
              objc_msgSend(v31, "uuidInDatabaseTransaction:error:", v14, &v46);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v46;
              v27 = v33;
              if (v32)
              {
                v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B70]), "initWithUUID:sourceDeviceIdentifier:metadata:", v32, v15, v23);
                v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v36 = *(void **)(v35 + 40);
                *(_QWORD *)(v35 + 40) = v34;

                v37 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
                v38 = objc_msgSend(v37, "profileType");

                if (v38 == 1)
                {
                  v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
                  objc_msgSend(v39, "sharingAuthorizationManager");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "deleteMarkedSharingAuthorizations");

                }
                v45[0] = MEMORY[0x1E0C809B0];
                v45[1] = 3221225472;
                v45[2] = __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke_2;
                v45[3] = &unk_1E6CE80E8;
                v45[4] = *(_QWORD *)(a1 + 40);
                objc_msgSend(v14, "onCommit:orRollback:", v45, 0, v43);
                v28 = 1;
              }
              else
              {
                v41 = v33;
                v28 = v41 == 0;
                if (v41)
                {
                  if (a3)
                    *a3 = objc_retainAutorelease(v41);
                  else
                    _HKLogDroppedError();
                }

              }
            }
          }
          else
          {
            v27 = v24;
            v28 = v27 == 0;
            if (v27)
            {
              if (a3)
                *a3 = objc_retainAutorelease(v27);
              else
                _HKLogDroppedError();
            }

            v23 = 0;
          }
          goto LABEL_42;
        }
        v30 = v21;
      }
      else
      {
        v30 = v18;
      }
    }
    else
    {
      v30 = v12;
    }
    v23 = v30;
    if (v30)
    {
      if (a3)
      {
        v23 = objc_retainAutorelease(v30);
        v28 = 0;
        *a3 = v23;
      }
      else
      {
        _HKLogDroppedError();
        v28 = 0;
      }
      v27 = v23;
    }
    else
    {
      v27 = 0;
      v28 = 1;
    }
LABEL_42:

    goto LABEL_43;
  }
  v29 = v8;
  v11 = v29;
  if (v29)
  {
    if (a3)
    {
      v11 = objc_retainAutorelease(v29);
      v28 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      v28 = 0;
    }
    v27 = v11;
  }
  else
  {
    v27 = 0;
    v28 = 1;
  }
LABEL_43:

  return v28;
}

uint64_t __56__HDSharedSummaryManager_commitTransactionEntity_error___block_invoke_2(uint64_t a1)
{
  return -[HDSharedSummaryManager _notifyObserversOfTransactionChange](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_notifyObserversOfTransactionChange
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 24);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __61__HDSharedSummaryManager__notifyObserversOfTransactionChange__block_invoke;
    v2[3] = &unk_1E6CEE740;
    v2[4] = result;
    return objc_msgSend(v1, "notifyObservers:", v2);
  }
  return result;
}

- (BOOL)discardTransactionEntity:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  HDSharedSummaryManager *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v8 = v17;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Discarding transaction", buf, 0xCu);

  }
  v9 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HDSharedSummaryManager_discardTransactionEntity_error___block_invoke;
  v13[3] = &unk_1E6CE7950;
  v14 = v6;
  v15 = self;
  v10 = v6;
  v11 = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v9, a4, v13);

  return v11;
}

BOOL __57__HDSharedSummaryManager_discardTransactionEntity_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  id v12;

  v5 = *(void **)(a1 + 32);
  v12 = 0;
  v6 = objc_msgSend(v5, "deleteWithDatabaseTransaction:error:", a2, &v12);
  v7 = v12;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    -[HDSharedSummaryManager _notifyObserversOfTransactionChange](*(_QWORD *)(a1 + 40));
    v9 = 1;
  }
  else
  {
    v10 = v7;
    v9 = v10 == 0;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  return v9;
}

- (id)fetchAllTransactionsWithError:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HDSharedSummaryManager_fetchAllTransactionsWithError___block_invoke;
  v9[3] = &unk_1E6CEE5E0;
  v6 = v5;
  v10 = v6;
  if (-[HDSharedSummaryManager enumerateCommittedTransactionsWithError:handler:](self, "enumerateCommittedTransactionsWithError:handler:", a3, v9))
  {
    v7 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __56__HDSharedSummaryManager_fetchAllTransactionsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (BOOL)enumerateCommittedTransactionsWithError:(id *)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke;
  v10[3] = &unk_1E6CEE458;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  LOBYTE(a3) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v7, a3, v10);

  return (char)a3;
}

BOOL __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke_2;
  v10[3] = &unk_1E6CEE608;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v5;
  v8 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:](HDSharedSummaryTransactionEntity, "enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:", v7, 0, a3, v10);

  return v8;
}

uint64_t __74__HDSharedSummaryManager_enumerateCommittedTransactionsWithError_handler___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;

  -[HDSharedSummaryManager _transactionForEntity:databaseTransaction:error:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  return 1;
}

- (id)_transactionForEntity:(void *)a3 databaseTransaction:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_26;
  }
  v22 = 0;
  objc_msgSend(v7, "uuidInDatabaseTransaction:error:", v8, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v11 = v10;
  if (!v9)
  {
    v17 = v10;
    v12 = v17;
    if (v17)
    {
      if (a4)
      {
        v12 = objc_retainAutorelease(v17);
        v16 = 0;
        *a4 = v12;
      }
      else
      {
        _HKLogDroppedError();
        v16 = 0;
      }
      v15 = v12;
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    goto LABEL_25;
  }
  v21 = v10;
  objc_msgSend(v7, "sourceDeviceIdentiferInDatabaseTransaction:error:", v8, &v21);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v21;

  if (!v12)
  {
    v18 = v13;
    v14 = v18;
    if (v18)
    {
      if (a4)
      {
        v14 = objc_retainAutorelease(v18);
        v16 = 0;
        *a4 = v14;
      }
      else
      {
        _HKLogDroppedError();
        v16 = 0;
      }
      v15 = v14;
      goto LABEL_24;
    }
    v15 = 0;
    goto LABEL_23;
  }
  v20 = v13;
  +[HDSharedSummaryTransactionMetadataEntity metadataForTransactionID:databaseTransaction:error:](HDSharedSummaryTransactionMetadataEntity, "metadataForTransactionID:databaseTransaction:error:", objc_msgSend(v7, "persistentID"), v8, &v20);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v20;

  if (!v14)
  {
    v15 = v15;
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v14 = 0;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B70]), "initWithUUID:sourceDeviceIdentifier:metadata:", v9, v12, v14);
LABEL_24:

LABEL_25:
LABEL_26:

  return v16;
}

- (BOOL)enumerateNonCommittedTransactionsWithError:(id *)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke;
  v10[3] = &unk_1E6CEE458;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  LOBYTE(a3) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v7, a3, v10);

  return (char)a3;
}

BOOL __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke_2;
  v11[3] = &unk_1E6CEE608;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v8 = v5;
  v9 = +[HDSharedSummaryTransactionEntity enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:](HDSharedSummaryTransactionEntity, "enumerateTransactionsWithDatabaseTransaction:includeNonCommitted:error:enumerationHandler:", v8, 1, a3, v11);

  return v9;
}

BOOL __77__HDSharedSummaryManager_enumerateNonCommittedTransactionsWithError_handler___block_invoke_2(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a1[4];
  v21 = 0;
  v7 = objc_msgSend(v5, "committedInDatabaseTransaction:error:", v6, &v21);
  v8 = v21;
  if (v8)
  {
    v9 = v8;
    if (a3)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  if ((v7 & 1) == 0)
  {
    v12 = (void *)a1[4];
    v11 = a1[5];
    v20 = 0;
    -[HDSharedSummaryManager _transactionForEntity:databaseTransaction:error:](v11, v5, v12, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    v15 = v14;
    if (v13)
    {
      v16 = a1[4];
      v19 = v14;
      objc_msgSend(v5, "creationDateInDatabaseTransaction:error:", v16, &v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v19;

      if (v17)
      {
        objc_msgSend(v13, "_setCreationDate:", v17);
        (*(void (**)(void))(a1[6] + 16))();

        v10 = 1;
      }
      else
      {
        v9 = v9;
        v10 = v9 == 0;
        if (v9)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v9);
          else
            _HKLogDroppedError();
        }

      }
    }
    else
    {
      v9 = v14;
      v10 = v9 == 0;
      if (v9)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v9);
        else
          _HKLogDroppedError();
      }

    }
    goto LABEL_20;
  }
  v10 = 1;
LABEL_21:

  return v10;
}

- (BOOL)enumerateSummariesInTransaction:(id)a3 package:(id)a4 names:(id)a5 includedObjectTypes:(id)a6 error:(id *)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = (void *)objc_opt_class();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke;
  v26[3] = &unk_1E6CEE658;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v31 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  LOBYTE(a7) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v19, a7, v26);

  return (char)a7;
}

BOOL __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  _BOOL8 v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  +[HDSharedSummaryTransactionEntity transactionEntityWithUUID:databaseTransaction:error:](HDSharedSummaryTransactionEntity, "transactionEntityWithUUID:databaseTransaction:error:", v6, v5, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (v7)
  {
    v9 = objc_msgSend(v7, "persistentID");
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v26 = v8;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke_2;
    v23[3] = &unk_1E6CEE630;
    v24 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 64);
    v13 = +[HDSharedSummaryEntity enumerateSummariesWithTransactionID:package:names:includedObjectTypes:databaseTransaction:error:enumerationHandler:](HDSharedSummaryEntity, "enumerateSummariesWithTransactionID:package:names:includedObjectTypes:databaseTransaction:error:enumerationHandler:", v9, v10, v11, v12, v5, &v26, v23);
    v14 = v26;

    if (v13)
    {
      v15 = 1;
    }
    else
    {
      v17 = v14;
      v15 = v17 == 0;
      if (v17)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v17);
        else
          _HKLogDroppedError();
      }

    }
    v16 = v24;
  }
  else
  {
    if (v8)
    {
      v16 = v8;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hk_error:format:", 118, CFSTR("Transaction with UUID %@ not found"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v21;
      if (!v16)
      {
        v14 = 0;
        v15 = 1;
        goto LABEL_18;
      }
    }
    if (a3)
    {
      v16 = objc_retainAutorelease(v16);
      v15 = 0;
      *a3 = v16;
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
    v14 = v16;
  }

LABEL_18:
  return v15;
}

uint64_t __106__HDSharedSummaryManager_enumerateSummariesInTransaction_package_names_includedObjectTypes_error_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_setTransaction:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 1;
}

- (BOOL)enumerateSummariesInTransactionEntity:(id)a3 package:(id)a4 names:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_opt_class();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke;
  v22[3] = &unk_1E6CEE6A8;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  LOBYTE(a6) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v16, a6, v22);

  return (char)a6;
}

BOOL __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "persistentID");
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke_2;
  v12[3] = &unk_1E6CEE680;
  v13 = *(id *)(a1 + 56);
  v10 = +[HDSharedSummaryEntity enumerateSummariesWithTransactionID:package:names:includedObjectTypes:databaseTransaction:error:enumerationHandler:](HDSharedSummaryEntity, "enumerateSummariesWithTransactionID:package:names:includedObjectTypes:databaseTransaction:error:enumerationHandler:", v7, v8, v9, 0, v6, a3, v12);

  return v10;
}

uint64_t __92__HDSharedSummaryManager_enumerateSummariesInTransactionEntity_package_names_error_handler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (id)mostRecentTransactionCreationDateWithError:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__35;
  v13 = __Block_byref_object_dispose__35;
  v14 = 0;
  v5 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HDSharedSummaryManager_mostRecentTransactionCreationDateWithError___block_invoke;
  v8[3] = &unk_1E6CEE6D0;
  v8[4] = &v9;
  if ((-[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 0, v5, a3, v8) & 1) != 0)
    v6 = (id)v10[5];
  else
    v6 = 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __69__HDSharedSummaryManager_mostRecentTransactionCreationDateWithError___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  +[HDSharedSummaryTransactionEntity mostRecentTransactionCreationDateWithDatabaseTransaction:error:](HDSharedSummaryTransactionEntity, "mostRecentTransactionCreationDateWithDatabaseTransaction:error:", a2, &v12);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    v9 = 1;
  else
    v9 = v6 == 0;
  v10 = v9;
  if (!v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }

  return v10;
}

- (void)registerObserver:(id)a3
{
  -[HKSynchronousObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[HKSynchronousObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (BOOL)prepareAndCommitTransactionWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5 sharedSummaries:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v22;
  id v23;
  id v24;

  v12 = a6;
  v24 = 0;
  -[HDSharedSummaryManager createReceivedTransactionWithUUID:sourceDeviceIdentifier:metadata:error:](self, "createReceivedTransactionWithUUID:sourceDeviceIdentifier:metadata:error:", a3, a4, a5, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;
  v15 = v14;
  if (!v13)
  {
    v18 = v14;
    if (v18)
    {
      if (!a7)
      {
LABEL_12:
        _HKLogDroppedError();
        v20 = 0;
        v19 = v18;
        goto LABEL_17;
      }
LABEL_9:
      v18 = objc_retainAutorelease(v18);
      v20 = 0;
      *a7 = v18;
      v19 = v18;
      goto LABEL_17;
    }
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v23 = v14;
  v16 = -[HDSharedSummaryManager addOrReuseReceivedSharedSummaries:transactionEntity:error:](self, "addOrReuseReceivedSharedSummaries:transactionEntity:error:", v12, v13, &v23);
  v17 = v23;

  if (!v16)
  {
    v18 = v17;
    if (v18)
    {
      if (!a7)
        goto LABEL_12;
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  v22 = v17;
  -[HDSharedSummaryManager commitTransactionEntity:error:](self, "commitTransactionEntity:error:", v13, &v22);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v22;

  if (v18)
  {
LABEL_14:
    v20 = 1;
    goto LABEL_17;
  }
  v19 = v19;
  v20 = v19 == 0;
  if (v19)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();
  }

  v18 = 0;
LABEL_17:

  return v20;
}

- (id)createReceivedTransactionWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5 error:(id *)a6
{
  return -[HDSharedSummaryManager _createTransactionWithUUID:sourceDeviceIdentifier:metadata:error:](self, a3, a4, a5, a6);
}

- (BOOL)addOrReuseReceivedSharedSummaries:(id)a3 transactionEntity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HDSharedSummaryManager *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__HDSharedSummaryManager_addOrReuseReceivedSharedSummaries_transactionEntity_error___block_invoke;
  v14[3] = &unk_1E6CEB3F8;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  LOBYTE(a5) = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a5, v14);

  return (char)a5;
}

uint64_t __84__HDSharedSummaryManager_addOrReuseReceivedSharedSummaries_transactionEntity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = a1;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v6)
  {
    v19 = 1;
    goto LABEL_38;
  }
  v7 = v6;
  v8 = *(_QWORD *)v35;
  v28 = v5;
  v29 = v4;
  while (2)
  {
    a1 = 0;
    do
    {
      if (*(_QWORD *)v35 != v8)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * a1);
      objc_msgSend(v9, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      +[HDSharedSummaryEntity entityWithUUID:databaseTransaction:error:](HDSharedSummaryEntity, "entityWithUUID:databaseTransaction:error:", v10, v4, &v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v33;

      if (!v11)
      {
        if ((objc_msgSend(v12, "hk_isObjectNotFoundError") & 1) != 0)
        {
          v15 = *(void **)(v30 + 40);
          v38 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(v30 + 48);
          v32 = 0;
          LODWORD(v15) = objc_msgSend(v15, "addSharedSummaries:transactionEntity:error:", v16, v17, &v32);
          v18 = v32;

          if (!(_DWORD)v15)
          {
            v25 = v18;
            v22 = v25;
            if (v25)
            {
              if (a3)
              {
                v22 = objc_retainAutorelease(v25);
                LODWORD(a1) = 0;
                *a3 = v22;
              }
              else
              {
                _HKLogDroppedError();
                LODWORD(a1) = 0;
              }
              v11 = v22;
            }
            else
            {
              v11 = 0;
              LODWORD(a1) = 1;
            }
            v5 = v28;
            v4 = v29;
            goto LABEL_36;
          }

          v4 = v29;
          v5 = v28;
          goto LABEL_13;
        }
        v24 = v12;
        if (!v12)
        {
          LODWORD(a1) = 1;
LABEL_37:

          v19 = 0;
          goto LABEL_38;
        }
LABEL_22:
        v23 = a3;
        if (!a3)
        {
          _HKLogDroppedError();
          LODWORD(a1) = 0;
          v22 = v12;
          goto LABEL_36;
        }
        v21 = v12;
LABEL_24:
        v22 = objc_retainAutorelease(v21);
        LODWORD(a1) = 0;
        *v23 = v22;
        v12 = v22;
LABEL_36:

        goto LABEL_37;
      }
      if (v12)
      {
        v20 = v12;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(v30 + 48), "persistentID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v14 = objc_msgSend(v11, "setReuseTransactionID:databaseTransaction:error:", v13, v4, &v31);
      v12 = v31;

      if ((v14 & 1) == 0)
      {
        v21 = v12;
        v22 = v21;
        if (!v21)
        {
          v12 = 0;
          LODWORD(a1) = 1;
          goto LABEL_36;
        }
        v23 = a3;
        if (!a3)
        {
          _HKLogDroppedError();
          LODWORD(a1) = 0;
          v12 = v22;
          goto LABEL_36;
        }
        goto LABEL_24;
      }
LABEL_13:

      ++a1;
    }
    while (v7 != a1);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    v19 = 1;
    if (v7)
      continue;
    break;
  }
LABEL_38:

  return (v19 | a1) & 1;
}

BOOL __91__HDSharedSummaryManager__createTransactionWithUUID_sourceDeviceIdentifier_metadata_error___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  id v14;

  v5 = a1[4];
  v6 = a1[5];
  v14 = 0;
  +[HDSharedSummaryTransactionEntity insertWithUUID:sourceDevice:databaseTransaction:error:](HDSharedSummaryTransactionEntity, "insertWithUUID:sourceDevice:databaseTransaction:error:", v5, v6, a2, &v14);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v11 = 1;
  }
  else
  {
    v12 = v8;
    v11 = v12 == 0;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  return v11;
}

- (BOOL)deleteAllTransactionsWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogSharing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v6 = v10;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Deleting all transactions", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_opt_class();
  return -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v7, a3, &__block_literal_global_41);
}

uint64_t __57__HDSharedSummaryManager_deleteAllTransactionsWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v12;
  id v13;

  v4 = a2;
  v13 = 0;
  v5 = +[HDSharedSummaryTransactionEntity deleteAllEntriesWithDatabaseTransaction:error:](HDSharedSummaryTransactionEntity, "deleteAllEntriesWithDatabaseTransaction:error:", v4, &v13);
  v6 = v13;
  v7 = v6;
  if (!v5)
  {
    v9 = v6;
    if (v9)
    {
      if (!a3)
      {
LABEL_9:
        _HKLogDroppedError();
        v10 = 0;
        goto LABEL_11;
      }
LABEL_6:
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a3 = v9;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
  v12 = v6;
  v8 = +[HDSharedSummaryEntity deleteAllSummariesWithDatabaseTransaction:error:](HDSharedSummaryEntity, "deleteAllSummariesWithDatabaseTransaction:error:", v4, &v12);
  v9 = v12;

  if (!v8)
  {
    v9 = v9;
    if (v9)
    {
      if (!a3)
        goto LABEL_9;
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)deleteTransactions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  HDSharedSummaryManager *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2048;
    v20 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Deleting %ld transactions", buf, 0x16u);

  }
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke;
  v14[3] = &unk_1E6CE7950;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = -[HDSharedSummaryManager performDatabaseTransactionForWriting:entity:error:block:]((uint64_t)self, 1, v10, a4, v14);

  return v12;
}

uint64_t __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = a1;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        +[HDSharedSummaryTransactionEntity transactionEntityWithUUID:databaseTransaction:error:](HDSharedSummaryTransactionEntity, "transactionEntityWithUUID:databaseTransaction:error:", v11, v5, &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;

        if (v12)
        {
          if (!objc_msgSend(v12, "deleteWithDatabaseTransaction:error:", v5, a3))
            goto LABEL_16;
        }
        else if (v13)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v13);
          else
            _HKLogDroppedError();
LABEL_16:

          v14 = 0;
          goto LABEL_17;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke_2;
  v17[3] = &unk_1E6CE80E8;
  v17[4] = *(_QWORD *)(v16 + 40);
  objc_msgSend(v5, "onCommit:orRollback:", v17, 0);
  v14 = 1;
LABEL_17:

  return v14;
}

uint64_t __51__HDSharedSummaryManager_deleteTransactions_error___block_invoke_2(uint64_t a1)
{
  return -[HDSharedSummaryManager _notifyObserversOfTransactionChange](*(_QWORD *)(a1 + 32));
}

- (id)unitTest_transactionForEntity:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return -[HDSharedSummaryManager _transactionForEntity:databaseTransaction:error:]((uint64_t)self, a3, a4, a5);
}

- (id)deviceIdentifierWithError:(id *)a3
{
  NSString *deviceIdentifier;
  HDProfile **p_profile;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  id v18;
  id v19;
  id v20;

  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    return deviceIdentifier;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "localDeviceSourceWithError:", &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (!v10)
  {
    v18 = v11;
    v13 = v18;
    if (v18)
    {
      if (a3)
      {
        v13 = objc_retainAutorelease(v18);
        v17 = 0;
        *a3 = v13;
      }
      else
      {
        _HKLogDroppedError();
        v17 = 0;
      }
      v14 = v13;
      goto LABEL_18;
    }
    v14 = 0;
    goto LABEL_17;
  }
  v12 = objc_loadWeakRetained((id *)p_profile);
  v19 = v11;
  objc_msgSend(v10, "sourceWithProfile:error:", v12, &v19);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v19;

  if (!v13)
  {
    v14 = v14;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v13 = 0;
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v13, "bundleIdentifier");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_deviceIdentifier;
  self->_deviceIdentifier = v15;

  v17 = self->_deviceIdentifier;
LABEL_18:

  return v17;
}

uint64_t __107__HDSharedSummaryManager__deleteCommittedTransactionsWithDatabaseTransaction_sourceDeviceIdentifier_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  id v16;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = objc_msgSend(WeakRetained, "profileType");

  if (v7 == 1)
  {
LABEL_4:
    v13 = objc_msgSend(v5, "deleteWithDatabaseTransaction:error:", *(_QWORD *)(a1 + 40), a3);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v5, "sourceDeviceIdentiferInDatabaseTransaction:error:", v8, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v12 = objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", v9);

    if (!v12)
    {
      v13 = 1;
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  v14 = v10;
  v13 = v14 == 0;
  if (v14)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

LABEL_11:
  return v13;
}

uint64_t __61__HDSharedSummaryManager__notifyObserversOfTransactionChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharedSummaryManagerCommittedTransactionsDidChange:", *(_QWORD *)(a1 + 32));
}

uint64_t __88__HDSharedSummaryManager__addSharedSummary_transactionEntity_databaseTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setReuseTransactionID:databaseTransaction:error:", 0, *(_QWORD *)(a1 + 32), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
