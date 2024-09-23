@implementation HDCloudSyncModifyRecordZonesOperation

- (HDCloudSyncModifyRecordZonesOperation)initWithConfiguration:(id)a3 container:(id)a4 recordZonesToSave:(id)a5 recordZoneIDsToDelete:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HDCloudSyncModifyRecordZonesOperation *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "repository");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseForContainer(v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:](self, "initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:", v13, v12, objc_msgSend(v16, "databaseScope"), v11, v10);

  return v17;
}

- (HDCloudSyncModifyRecordZonesOperation)initWithConfiguration:(id)a3 container:(id)a4 scope:(int64_t)a5 recordZonesToSave:(id)a6 recordZoneIDsToDelete:(id)a7
{
  id v13;
  id v14;
  id v15;
  HDCloudSyncModifyRecordZonesOperation *v16;
  HDCloudSyncModifyRecordZonesOperation *v17;
  uint64_t v18;
  CKDatabase *database;
  HDSynchronousTaskGroup *v20;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v23;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDCloudSyncModifyRecordZonesOperation;
  v16 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v23, sel_initWithConfiguration_cloudState_, a3, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a4);
    objc_msgSend(v13, "databaseWithDatabaseScope:", a5);
    v18 = objc_claimAutoreleasedReturnValue();
    database = v17->_database;
    v17->_database = (CKDatabase *)v18;

    objc_storeStrong((id *)&v17->_recordZonesToSave, a6);
    objc_storeStrong((id *)&v17->_recordZoneIDsToDelete, a7);
    v20 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v17->_taskGroup;
    v17->_taskGroup = v20;

    -[HDSynchronousTaskGroup setDelegate:](v17->_taskGroup, "setDelegate:", v17);
  }

  return v17;
}

- (void)main
{
  -[HDCloudSyncModifyRecordZonesOperation _saveRecordZones:deleteRecordZoneIDs:](self, "_saveRecordZones:deleteRecordZoneIDs:", self->_recordZonesToSave, self->_recordZoneIDsToDelete);
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)_saveRecordZones:(id)a3 deleteRecordZoneIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  HDCloudSyncModifyRecordZonesOperation *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v8 = objc_msgSend(v6, "count");
  v9 = objc_msgSend(v7, "count") + v8;
  if (!v9)
  {
LABEL_10:
    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
    goto LABEL_14;
  }
  if (v9 >= 400)
  {
    if (v6)
      v10 = v6;
    else
      v10 = (id)MEMORY[0x1E0C9AA60];
    if (v7)
      v11 = v7;
    else
      v11 = (id)MEMORY[0x1E0C9AA60];
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0C947D8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("Synthesized error for preemptive split.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 27, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncModifyRecordZonesOperation _limitExceededForSavingRecordZones:deletingRecordZoneIDs:error:](self, "_limitExceededForSavingRecordZones:deletingRecordZoneIDs:error:", v10, v11, v15);

    goto LABEL_10;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    *(_DWORD *)buf = 138543874;
    v27 = self;
    v28 = 2048;
    v29 = objc_msgSend(v6, "count");
    v30 = 2048;
    v31 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld zones, deleting %ld zones", buf, 0x20u);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94EF0]), "initWithRecordZonesToSave:recordZoneIDsToDelete:", v6, v7);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__HDCloudSyncModifyRecordZonesOperation__saveRecordZones_deleteRecordZoneIDs___block_invoke;
  v23[3] = &unk_1E6CEC8D0;
  v23[4] = self;
  v24 = v6;
  v25 = v7;
  objc_msgSend(v18, "setModifyRecordZonesCompletionBlock:", v23);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cachedCloudState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOperationCountForAnalytics:", objc_msgSend(v20, "operationCountForAnalytics") + 1);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "operationGroup");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setGroup:", v22);

  -[CKDatabase hd_addOperation:](self->_database, "hd_addOperation:", v18);
LABEL_14:

}

void __78__HDCloudSyncModifyRecordZonesOperation__saveRecordZones_deleteRecordZoneIDs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HDCloudSyncZoneIdentifier *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  HDCloudSyncZoneIdentifier *v30;
  void *v31;
  id v32;
  HDCloudSyncCachedZone *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id obj;
  id obja;
  uint64_t v50;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v39 = *(_QWORD *)(a1 + 32);
      v40 = *(void **)(v39 + 104);
      v41 = v10;
      objc_msgSend(v40, "containerIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "databaseScope");
      CKDatabaseScopeString();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v65 = v39;
      v66 = 2114;
      v67 = v42;
      v68 = 2114;
      v69 = v43;
      v70 = 2114;
      v71 = v9;
      _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify record zones in container %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);

    }
    if (objc_msgSend(v9, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 27))
    {
      objc_msgSend(*(id *)(a1 + 32), "_limitExceededForSavingRecordZones:deletingRecordZoneIDs:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "finishTask");
      goto LABEL_31;
    }
    objc_msgSend(v9, "hd_errorSurfacingFatalCloudKitPartialFailure");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "failTaskWithError:", v11);

      goto LABEL_31;
    }
  }
  v44 = v9;
  v45 = v7;
  v46 = v8;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v50 = *(_QWORD *)v59;
    while (2)
    {
      v16 = 0;
      v17 = v15;
      do
      {
        if (*(_QWORD *)v59 != v50)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v16);
        v19 = [HDCloudSyncZoneIdentifier alloc];
        objc_msgSend(v18, "zoneID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containerIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v19, "initForZone:container:scope:", v20, v21, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "databaseScope"));

        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cachedCloudState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v17;
        v25 = objc_msgSend(v24, "addZoneWithIdentifier:error:", v22, &v57);
        v15 = v57;

        if (!v25)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "failTaskWithError:", v15);

          v26 = obj;
LABEL_29:

          goto LABEL_30;
        }

        ++v16;
        v17 = v15;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v47 = v46;
  v51 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v51)
  {
    obja = *(id *)v54;
    while (2)
    {
      v27 = 0;
      v28 = v15;
      do
      {
        if (*(id *)v54 != obja)
          objc_enumerationMutation(v47);
        v29 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v27);
        v30 = [HDCloudSyncZoneIdentifier alloc];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containerIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v30, "initForZone:container:scope:", v29, v31, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "databaseScope"));

        v33 = [HDCloudSyncCachedZone alloc];
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "repository");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "accessibilityAssertion");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v33, "initForZoneIdentifier:repository:accessibilityAssertion:", v32, v35, v37);

        v52 = v28;
        LODWORD(v36) = objc_msgSend(v38, "deleteZoneWithError:", &v52);
        v15 = v52;

        if (!(_DWORD)v36)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "failTaskWithError:", v15);

          v26 = v47;
          goto LABEL_29;
        }

        ++v27;
        v28 = v15;
      }
      while (v51 != v27);
      v51 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v51)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "finishTask");
LABEL_30:

  v7 = v45;
  v8 = v46;
  v9 = v44;
LABEL_31:

}

- (void)_limitExceededForSavingRecordZones:(id)a3 deletingRecordZoneIDs:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  HDCloudSyncModifyRecordZonesOperation *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if ((unint64_t)(objc_msgSend(v9, "count") + v11) > 1)
  {
    if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
    {
      -[HDCloudSyncModifyRecordZonesOperation _saveRecordZones:deleteRecordZoneIDs:](self, "_saveRecordZones:deleteRecordZoneIDs:", v8, 0);
      -[HDCloudSyncModifyRecordZonesOperation _saveRecordZones:deleteRecordZoneIDs:](self, "_saveRecordZones:deleteRecordZoneIDs:", 0, v9);
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v21 = 138543874;
        v22 = self;
        v23 = 2048;
        v24 = objc_msgSend(v8, "count");
        v25 = 2048;
        v26 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying by splitting record zone request in half and re-fetching ("
          "%ld zone saves, %ld zone deletions).",
          (uint8_t *)&v21,
          0x20u);

      }
      objc_msgSend(v8, "hk_splitWithBucketCount:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_splitWithBucketCount:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncModifyRecordZonesOperation _saveRecordZones:deleteRecordZoneIDs:](self, "_saveRecordZones:deleteRecordZoneIDs:", v17, v18);

      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncModifyRecordZonesOperation _saveRecordZones:deleteRecordZoneIDs:](self, "_saveRecordZones:deleteRecordZoneIDs:", v19, v20);

    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v21 = 138543362;
      v22 = self;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Received limit exceeded error for a single record zone modification. This is unexpected.", (uint8_t *)&v21, 0xCu);
    }
    -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
    -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v10);
  }

}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
