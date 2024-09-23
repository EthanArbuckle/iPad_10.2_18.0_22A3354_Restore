@implementation HDCloudSyncModifyRecordsOperation

- (HDCloudSyncModifyRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HDCloudSyncModifyRecordsOperation *v17;

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
  v17 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:](self, "initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:", v13, v12, objc_msgSend(v16, "databaseScope"), v11, v10);

  return v17;
}

- (HDCloudSyncModifyRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 scope:(int64_t)a5 recordsToSave:(id)a6 recordIDsToDelete:(id)a7
{
  id v13;
  id v14;
  id v15;
  HDCloudSyncModifyRecordsOperation *v16;
  HDCloudSyncModifyRecordsOperation *v17;
  uint64_t v18;
  CKDatabase *database;
  NSMutableArray *v20;
  NSMutableArray *savedRecords;
  NSMutableArray *v22;
  NSMutableArray *deletedRecordIDs;
  HDSynchronousTaskGroup *v24;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v27;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HDCloudSyncModifyRecordsOperation;
  v16 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v27, sel_initWithConfiguration_cloudState_, a3, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a4);
    objc_msgSend(v13, "databaseWithDatabaseScope:", a5);
    v18 = objc_claimAutoreleasedReturnValue();
    database = v17->_database;
    v17->_database = (CKDatabase *)v18;

    objc_storeStrong((id *)&v17->_recordsToSave, a6);
    objc_storeStrong((id *)&v17->_recordIDsToDelete, a7);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    savedRecords = v17->_savedRecords;
    v17->_savedRecords = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedRecordIDs = v17->_deletedRecordIDs;
    v17->_deletedRecordIDs = v22;

    v17->_savePolicy = 0;
    v24 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v17->_taskGroup;
    v17->_taskGroup = v24;

    -[HDSynchronousTaskGroup setDelegate:](v17->_taskGroup, "setDelegate:", v17);
    v17->_lock._os_unfair_lock_opaque = 0;
  }

  return v17;
}

- (void)main
{
  -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:]((uint64_t)self, self->_recordsToSave, self->_recordIDsToDelete);
}

- (void)_saveRecords:(void *)a3 deleteRecords:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    v8 = objc_msgSend(v6, "count") + v7;
    if (v8)
    {
      if (v8 >= 375)
      {
        objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_193);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v6, "hk_mapToSet:", &__block_literal_global_195);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v9)
          {
            objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v12;
          }
          else
          {
            v9 = v10;
          }

        }
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = *MEMORY[0x1E0C947D8];
          v32 = *MEMORY[0x1E0CB2D50];
          v33[0] = CFSTR("Synthesized error for preemptive split.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 27, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncModifyRecordsOperation _limitExceededSavingRecords:deletingRecordIDs:error:]((id *)a1, v5, v6, v22);

LABEL_18:
          goto LABEL_19;
        }

      }
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        *(_DWORD *)buf = 138543874;
        v27 = a1;
        v28 = 2048;
        v29 = objc_msgSend(v5, "count");
        v30 = 2048;
        v31 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld records and deleting %ld records.", buf, 0x20u);

      }
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v5, v6);
      if (objc_msgSend((id)a1, "markAsParticipantNeedsNewInvitationToken"))
        objc_msgSend(v9, "setMarkAsParticipantNeedsNewInvitationToken:", objc_msgSend((id)a1, "markAsParticipantNeedsNewInvitationToken"));
      objc_msgSend(v9, "setSavePolicy:", *(_QWORD *)(a1 + 168));
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke_201;
      v23[3] = &unk_1E6CEC8D0;
      v23[4] = a1;
      v24 = v5;
      v25 = v6;
      objc_msgSend(v9, "setModifyRecordsCompletionBlock:", v23);
      objc_msgSend((id)a1, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cachedCloudState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setOperationCountForAnalytics:", objc_msgSend(v16, "operationCountForAnalytics") + 1);

      objc_msgSend((id)a1, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "operationGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGroup:", v18);

      objc_msgSend(*(id *)(a1 + 136), "beginTask");
      objc_msgSend(*(id *)(a1 + 112), "hd_addOperation:", v9);

      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 136), "beginTask");
    objc_msgSend(*(id *)(a1 + 136), "finishTask");
  }
LABEL_19:

}

void __57__HDCloudSyncModifyRecordsOperation__recordsSplitByZone___block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  id v9;

  v7 = a4;
  v8 = a2;
  v9 = (id)objc_msgSend(a3, "copy");
  ((void (**)(_QWORD, id, id))a4)[2](v7, v8, v9);

}

void __59__HDCloudSyncModifyRecordsOperation__recordIDsSplitByZone___block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  id v9;

  v7 = a4;
  v8 = a2;
  v9 = (id)objc_msgSend(a3, "copy");
  ((void (**)(_QWORD, id, id))a4)[2](v7, v8, v9);

}

- (void)_limitExceededSavingRecords:(void *)a3 deletingRecordIDs:(void *)a4 error:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t k;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  id *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v75 = a4;
  v76 = a1;
  if (a1)
  {
    v9 = v7;
    v73 = v7;
    v74 = v8;
    if (v9)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v12 = v9;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v82 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_msgSend(v18, "recordID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "zoneID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectForKeyedSubscript:", v20);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v20);
            }
            objc_msgSend(v21, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
        }
        while (v15);
      }

      objc_msgSend(v11, "hk_map:", &__block_literal_global_32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v12;
      v7 = v73;
    }
    else
    {
      v10 = 0;
    }

    v22 = v8;
    if (v22)
    {
      v71 = v9;
      v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v25 = v22;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v82 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
            objc_msgSend(v30, "zoneID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v31);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            if (!v32)
            {
              v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, v31);
            }
            objc_msgSend(v32, "addObject:", v30);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
        }
        while (v27);
      }

      objc_msgSend(v24, "hk_map:", &__block_literal_global_186);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v73;
      v8 = v74;
      v9 = v71;
    }
    else
    {
      v23 = 0;
    }

    v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v10, "allKeys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v34);

    objc_msgSend(v23, "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v35);

    if (objc_msgSend(v33, "count") == 1)
    {
      v36 = v9;
      v37 = v22;
      v38 = v75;
      v39 = objc_msgSend(v36, "count");
      if ((unint64_t)(objc_msgSend(v37, "count") + v39) > 1)
      {
        v72 = v38;
        objc_msgSend(v36, "firstObject");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "recordID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "zoneID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54;
        if (v54)
        {
          v70 = v54;
        }
        else
        {
          objc_msgSend(v37, "firstObject");
          v69 = v37;
          v56 = v8;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "zoneID");
          v70 = (id)objc_claimAutoreleasedReturnValue();

          v8 = v56;
          v37 = v69;
        }

        if ((objc_msgSend(v76, "permitNonAtomicZoneSaves") & 1) != 0)
        {
          v38 = v72;
          if (objc_msgSend(v36, "count") && objc_msgSend(v37, "count"))
          {
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v36, 0);
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, 0, v37);
          }
          else
          {
            _HKInitializeLogging();
            v59 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v87 = v76;
              v88 = 2114;
              v89 = (uint64_t)v70;
              _os_log_impl(&dword_1B7802000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying by splitting into multiple operations for zone %{public}@.",
                buf,
                0x16u);
            }
            objc_msgSend(v36, "hk_splitWithBucketCount:", 2);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "hk_splitWithBucketCount:", 2);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v62, v63);

            objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v64, v65);

            v8 = v74;
            v38 = v72;
          }
        }
        else
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E0CB5370];
          v38 = v72;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v87 = v76;
            v88 = 2114;
            v89 = (uint64_t)v70;
            _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Limit exceeded when syncing to a single zone (%{public}@), but non-atomic saves are not permitted.", buf, 0x16u);
          }
          objc_msgSend(v76[17], "beginTask");
          objc_msgSend(v76[17], "failTaskWithError:", v72);
        }

      }
      else
      {
        _HKInitializeLogging();
        v40 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          v66 = v40;
          v67 = objc_msgSend(v36, "count");
          v68 = objc_msgSend(v37, "count");
          *(_DWORD *)buf = 138544130;
          v87 = v76;
          v88 = 2048;
          v89 = v67;
          v90 = 2048;
          v91 = v68;
          v92 = 2114;
          v93 = v38;
          _os_log_fault_impl(&dword_1B7802000, v66, OS_LOG_TYPE_FAULT, "%{public}@: Limit exceeded when we've already dropped down to minimal records per zone (%ld, %ld): %{public}@.", buf, 0x2Au);

        }
        objc_msgSend(v76[17], "beginTask");
        objc_msgSend(v76[17], "failTaskWithError:", v38);
      }

    }
    else
    {
      _HKInitializeLogging();
      v41 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        v43 = objc_msgSend(v33, "count");
        *(_DWORD *)buf = 138543618;
        v87 = v76;
        v88 = 2048;
        v89 = v43;
        _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying with one operation per zone (%ld zones).",
          buf,
          0x16u);

      }
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v36 = v33;
      v44 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      if (v44)
      {
        v45 = v44;
        v46 = v7;
        v47 = *(_QWORD *)v78;
        do
        {
          for (k = 0; k != v45; ++k)
          {
            if (*(_QWORD *)v78 != v47)
              objc_enumerationMutation(v36);
            v49 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
            objc_msgSend(v10, "objectForKeyedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v49);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v50, v51);

          }
          v45 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        }
        while (v45);
        v7 = v46;
        v8 = v74;
      }
    }

  }
}

uint64_t __100__HDCloudSyncModifyRecordsOperation__didFinishSavingRecords_deletingRecordIDs_operationError_error___block_invoke()
{
  return 0;
}

id __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

void __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke_201(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  HDCloudSyncZoneIdentifier *v19;
  void *v20;
  void *v21;
  id v22;
  HDCloudSyncCachedZone *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  HDCloudSyncZoneIdentifier *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  HDCloudSyncCachedZone *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  HDCloudSyncZoneIdentifier *v59;
  void *v60;
  void *v61;
  id v62;
  HDCloudSyncCachedZone *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id obj;
  id obja;
  id objb;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t v112[128];
  uint8_t buf[4];
  uint64_t v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  id v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = (_QWORD *)MEMORY[0x1E0C947D8];
  if (v9 && objc_msgSend(v9, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 27))
  {
    -[HDCloudSyncModifyRecordsOperation _limitExceededSavingRecords:deletingRecordIDs:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "finishTask");
    goto LABEL_54;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v99 = 0;
  v90 = v7;
  v89 = v8;
  v91 = v10;
  if (!v12)
    goto LABEL_28;
  if (!v10)
    goto LABEL_29;
  if (objc_msgSend(v91, "hk_isErrorInDomain:code:", *v11, 2))
  {
    v81 = a1;
    v83 = v10;
    v85 = v7;
    v87 = v8;
    objc_msgSend(v91, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = v14;
    v94 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
    if (v94)
    {
      v92 = *(id *)v109;
      do
      {
        for (i = 0; i != v94; i = (char *)i + 1)
        {
          if (*(id *)v109 != v92)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v18 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v29 = *(void **)(v12 + 104);
            v30 = v18;
            objc_msgSend(v29, "containerIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v12 + 112), "databaseScope");
            CKDatabaseScopeString();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v114 = v12;
            v115 = 2114;
            v116 = v31;
            v117 = 2114;
            v118 = v32;
            v119 = 2114;
            v120 = v91;
            _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify records in container %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);

          }
          v19 = [HDCloudSyncZoneIdentifier alloc];
          objc_msgSend(v16, "zoneID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v12 + 104), "containerIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v19, "initForZone:container:scope:", v20, v21, objc_msgSend(*(id *)(v12 + 112), "databaseScope"));

          v23 = [HDCloudSyncCachedZone alloc];
          objc_msgSend((id)v12, "configuration");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "repository");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v12, "configuration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "accessibilityAssertion");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v23, "initForZoneIdentifier:repository:accessibilityAssertion:", v22, v25, v27);

          objc_msgSend(v28, "handleCloudError:operation:container:database:", v17, v12, *(_QWORD *)(v12 + 104), *(_QWORD *)(v12 + 112));
        }
        v94 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
      }
      while (v94);
    }

    v7 = v85;
    v8 = v87;
    a1 = v81;
    v10 = v83;
  }
  _HKInitializeLogging();
  v33 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v72 = *(void **)(v12 + 104);
    v73 = v33;
    objc_msgSend(v72, "containerIdentifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v12 + 112), "databaseScope");
    CKDatabaseScopeString();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v114 = v12;
    v115 = 2114;
    v116 = v74;
    v117 = 2114;
    v118 = v75;
    v119 = 2114;
    v120 = v91;
    _os_log_error_impl(&dword_1B7802000, v73, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify records in container %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v91, "hd_errorSurfacingFatalCloudKitPartialFailure");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    if (objc_msgSend((id)v12, "treatAnyErrorAsFatal"))
    {
      _HKInitializeLogging();
      v36 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v76 = v7;
        v77 = *(void **)(v12 + 104);
        v78 = v36;
        objc_msgSend(v77, "containerIdentifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v12 + 112), "databaseScope");
        CKDatabaseScopeString();
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v114 = v12;
        v115 = 2114;
        v116 = v79;
        v117 = 2114;
        v118 = v80;
        v119 = 2114;
        v120 = v91;
        _os_log_error_impl(&dword_1B7802000, v78, OS_LOG_TYPE_ERROR, "%{public}@ Treating error as fatal for %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);

        v7 = v76;
      }
      objc_msgSend(v91, "hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:", &__block_literal_global_191_0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (!v37)
        v37 = v91;
      v99 = objc_retainAutorelease(v37);

      goto LABEL_27;
    }
LABEL_29:
    v82 = a1;
    v84 = v10;
    v86 = v7;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v95 = v90;
    v40 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
    if (v40)
    {
      v41 = v40;
      obja = *(id *)v105;
      v88 = v8;
      while (2)
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(id *)v105 != obja)
            objc_enumerationMutation(v95);
          v43 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
          v44 = [HDCloudSyncZoneIdentifier alloc];
          objc_msgSend(v43, "recordID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "zoneID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v12 + 104), "containerIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v44, "initForZone:container:scope:", v46, v47, objc_msgSend(*(id *)(v12 + 112), "databaseScope"));

          v49 = [HDCloudSyncCachedZone alloc];
          objc_msgSend((id)v12, "configuration");
          v50 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v50, "repository");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v12, "configuration");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "accessibilityAssertion");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v49, "initForZoneIdentifier:repository:accessibilityAssertion:", v48, v51, v53);

          LOBYTE(v50) = objc_msgSend(v54, "addRecord:error:", v43, &v99);
          if ((v50 & 1) == 0)
          {
            v69 = v95;
LABEL_48:

            v39 = 0;
            v7 = v86;
            v8 = v88;
            goto LABEL_49;
          }
        }
        v41 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
        v8 = v88;
        if (v41)
          continue;
        break;
      }
    }

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v93 = v89;
    v55 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
    if (v55)
    {
      v56 = v55;
      objb = *(id *)v101;
      v88 = v8;
      while (2)
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(id *)v101 != objb)
            objc_enumerationMutation(v93);
          v58 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
          v59 = [HDCloudSyncZoneIdentifier alloc];
          objc_msgSend(v58, "zoneID");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v12 + 104), "containerIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v59, "initForZone:container:scope:", v60, v61, objc_msgSend(*(id *)(v12 + 112), "databaseScope"));

          v63 = [HDCloudSyncCachedZone alloc];
          objc_msgSend((id)v12, "configuration");
          v64 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v64, "repository");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v12, "configuration");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "accessibilityAssertion");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v63, "initForZoneIdentifier:repository:accessibilityAssertion:", v62, v65, v67);

          LOBYTE(v64) = objc_msgSend(v68, "deleteRecordID:error:", v58, &v99);
          if ((v64 & 1) == 0)
          {
            v69 = v93;
            goto LABEL_48;
          }
        }
        v56 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
        v8 = v88;
        if (v56)
          continue;
        break;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 144));
    objc_msgSend(*(id *)(v12 + 120), "addObjectsFromArray:", v95);
    objc_msgSend(*(id *)(v12 + 128), "addObjectsFromArray:", v93);
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 144));
    v39 = 1;
    v7 = v86;
LABEL_49:
    a1 = v82;
    v10 = v84;
    goto LABEL_50;
  }
  v99 = objc_retainAutorelease(v34);
LABEL_27:

LABEL_28:
  v39 = 0;
LABEL_50:

  v70 = v99;
  v71 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v39)
    objc_msgSend(v71, "finishTask");
  else
    objc_msgSend(v71, "failTaskWithError:", v70);

LABEL_54:
}

- (NSArray)savedRecords
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_savedRecords, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)deletedRecordIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_deletedRecordIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
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

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (BOOL)permitNonAtomicZoneSaves
{
  return self->_permitNonAtomicZoneSaves;
}

- (void)setPermitNonAtomicZoneSaves:(BOOL)a3
{
  self->_permitNonAtomicZoneSaves = a3;
}

- (BOOL)treatAnyErrorAsFatal
{
  return self->_treatAnyErrorAsFatal;
}

- (void)setTreatAnyErrorAsFatal:(BOOL)a3
{
  self->_treatAnyErrorAsFatal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
