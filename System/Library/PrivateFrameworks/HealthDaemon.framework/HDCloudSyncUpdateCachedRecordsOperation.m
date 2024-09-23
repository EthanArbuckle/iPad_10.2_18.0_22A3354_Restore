@implementation HDCloudSyncUpdateCachedRecordsOperation

- (HDCloudSyncUpdateCachedRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncUpdateCachedRecordsOperation *v4;
  HDSynchronousTaskGroup *v5;
  HDSynchronousTaskGroup *taskGroup;
  NSMutableSet *v7;
  NSMutableSet *invalidRecordIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncUpdateCachedRecordsOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v10, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v4)
  {
    v5 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v5;

    -[HDSynchronousTaskGroup setDelegate:](v4->_taskGroup, "setDelegate:", v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    invalidRecordIDs = v4->_invalidRecordIDs;
    v4->_invalidRecordIDs = v7;

    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCKContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "privateCloudDatabase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncUpdateCachedRecordsOperation fetchRecordZoneChangesForContainer:database:](self, "fetchRecordZoneChangesForContainer:database:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

- (NSArray)invalidRecordIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet allObjects](self->_invalidRecordIDs, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)fetchRecordZoneChangesForContainer:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedCloudState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v9, "zoneIdentifiersRequiringFetchForContainerIdentifier:databaseScope:error:", v10, objc_msgSend(v7, "databaseScope"), &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;

  if (v11 || !v12)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "repository");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "syncAvailability");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __87__HDCloudSyncUpdateCachedRecordsOperation_fetchRecordZoneChangesForContainer_database___block_invoke;
    v24 = &unk_1E6CEBA48;
    v25 = v15;
    v16 = v15;
    objc_msgSend(v11, "hk_filter:", &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy", v21, v22, v23, v24);

    objc_msgSend(v18, "hk_map:", &__block_literal_global_31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 && objc_msgSend(v19, "count"))
      -[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]((id *)&self->super.super.isa, v20, v6, v7);

  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v12);
  }

}

uint64_t __87__HDCloudSyncUpdateCachedRecordsOperation_fetchRecordZoneChangesForContainer_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v9;
  id v10;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldSyncSummarySharingPull") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "shouldSyncSummarySharingPush") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "zoneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
    v6 = objc_msgSend(v5, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v10, &v9);
    v7 = v10;

    v4 = v6 ^ 1u;
  }

  return v4;
}

uint64_t __87__HDCloudSyncUpdateCachedRecordsOperation_fetchRecordZoneChangesForContainer_database___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneIdentifier");
}

- (void)_fetchChangesForRecordZoneIDs:(void *)a3 container:(void *)a4 database:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[6];
  _QWORD v56[5];
  id v57;
  id v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[4];
  int v69;
  uint64_t v70;
  const __CFString *v71;
  _BYTE buf[24];
  void *v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1[13], "beginTask");
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2810000000;
    v68[3] = &unk_1B805FAAD;
    v69 = 0;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__26;
    v66[4] = __Block_byref_object_dispose__26;
    v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__26;
    v64[4] = __Block_byref_object_dispose__26;
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__26;
    v62[4] = __Block_byref_object_dispose__26;
    v63 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (v7 && objc_msgSend(v7, "count"))
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 0x190)
      {
        objc_msgSend(v8, "containerIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "databaseScope");
        v15 = v13;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __108__HDCloudSyncUpdateCachedRecordsOperation__configurationsByRecordZoneIDs_containerIdentifier_databaseScope___block_invoke;
        v73 = &unk_1E6CEC780;
        v16 = v15;
        *((_QWORD *)&v74 + 1) = a1;
        v75 = v14;
        *(_QWORD *)&v74 = v16;
        objc_msgSend(v7, "hk_mapToDictionary:", buf);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        v17 = (id)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "containerIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "databaseScope");
          CKDatabaseScopeString();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v7, "count");
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2114;
          v73 = v19;
          LOWORD(v74) = 2048;
          *(_QWORD *)((char *)&v74 + 2) = v20;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@: Beginning fetch of %ld record zone changes", buf, 0x2Au);

        }
        v33 = v8;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DE8]), "initWithRecordZoneIDs:configurationsByRecordZoneID:", v7, v34);
        objc_msgSend(v21, "setFetchAllChanges:", 1);
        objc_msgSend(v21, "setShouldFetchAssetContents:", 0);
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke;
        v56[3] = &unk_1E6CEC650;
        v56[4] = a1;
        v22 = v8;
        v57 = v22;
        v23 = v9;
        v58 = v23;
        v59 = v68;
        v60 = v62;
        v61 = v66;
        objc_msgSend(v21, "setRecordWasChangedBlock:", v56);
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_195;
        v55[3] = &unk_1E6CEC678;
        v55[4] = v68;
        v55[5] = v64;
        objc_msgSend(v21, "setRecordWithIDWasDeletedBlock:", v55);
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2;
        v47[3] = &unk_1E6CEC6F0;
        v24 = v22;
        v48 = v24;
        v25 = v23;
        v49 = v25;
        v50 = a1;
        v51 = v68;
        v52 = v62;
        v53 = v66;
        v54 = v64;
        objc_msgSend(v21, "setRecordZoneChangeTokensUpdatedBlock:", v47);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_203;
        v39[3] = &unk_1E6CEC718;
        v26 = v24;
        v40 = v26;
        v27 = v25;
        v41 = v27;
        v42 = a1;
        v43 = v68;
        v44 = v62;
        v45 = v66;
        v46 = v64;
        objc_msgSend(v21, "setRecordZoneFetchCompletionBlock:", v39);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_207;
        v35[3] = &unk_1E6CE8F08;
        v35[4] = a1;
        v36 = v26;
        v28 = v27;
        v37 = v28;
        v38 = v7;
        objc_msgSend(v21, "setFetchRecordZoneChangesCompletionBlock:", v35);
        objc_msgSend(a1, "configuration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "cachedCloudState");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setOperationCountForAnalytics:", objc_msgSend(v30, "operationCountForAnalytics") + 1);

        objc_msgSend(a1, "configuration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "operationGroup");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setGroup:", v32);

        objc_msgSend(v28, "hd_addOperation:", v21);
        v8 = v33;

        goto LABEL_7;
      }
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v70 = *MEMORY[0x1E0CB2D50];
      v71 = CFSTR("Synthesized error for preemptive split.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 27, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncUpdateCachedRecordsOperation _limitExceededFetchingChangesForRecordZoneIDs:container:database:error:]((uint64_t)a1, v7, v8, v9, v12);

    }
    objc_msgSend(a1[13], "finishTask");
LABEL_7:
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(v66, 8);

    _Block_object_dispose(v68, 8);
  }

}

- (void)_limitExceededFetchingChangesForRecordZoneIDs:(void *)a3 container:(void *)a4 database:(void *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v13 = objc_msgSend(v9, "count");
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    v15 = *MEMORY[0x1E0CB5370];
    if (v13 == 1)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = 138543362;
        v21 = a1;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Received limit exceeded error for a single record zone. This is unexpected.", (uint8_t *)&v20, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 104), "beginTask");
      objc_msgSend(*(id *)(a1 + 104), "failTaskWithError:", v12);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v14;
        v20 = 138543618;
        v21 = a1;
        v22 = 2048;
        v23 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying by splitting record zone request in half and re-fetching (%ld zones).",
          (uint8_t *)&v20,
          0x16u);

      }
      objc_msgSend(v9, "hk_splitWithBucketCount:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:](a1, v18, v10, v11);

      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:](a1, v19, v10, v11);

    }
  }

}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  HDCloudSyncZoneIdentifier *v11;
  void *v12;
  void *v13;
  id v14;
  HDCloudSyncCachedZone *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = 138543874;
      v23 = v21;
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: recordWasChangedBlock failed to fetch changes for record %{public}@, %{public}@", (uint8_t *)&v22, 0x20u);
    }
    v11 = [HDCloudSyncZoneIdentifier alloc];
    objc_msgSend(v7, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v11, "initForZone:container:scope:", v12, v13, objc_msgSend(*(id *)(a1 + 48), "databaseScope"));

    v15 = [HDCloudSyncCachedZone alloc];
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "repository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessibilityAssertion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v15, "initForZoneIdentifier:repository:accessibilityAssertion:", v14, v17, v19);

    objc_msgSend(v20, "handleCloudError:operation:container:database:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    if (objc_msgSend(v9, "hd_shouldPreventCloudKitCacheUpdate"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v14);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    }

  }
  else if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  }

}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_195(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HDCloudSyncZoneIdentifier *v7;
  void *v8;
  id v9;
  HDCloudSyncCachedZone *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = [HDCloudSyncZoneIdentifier alloc];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v7, "initForZone:container:scope:", v6, v8, objc_msgSend(*(id *)(a1 + 40), "databaseScope"));

  v10 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "repository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityAssertion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v10, "initForZoneIdentifier:repository:accessibilityAssertion:", v9, v12, v14);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "containsObject:", v9))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(void **)(a1 + 32);
      v19 = v16;
      objc_msgSend(v18, "containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "databaseScope");
      CKDatabaseScopeString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v47 = v17;
      v48 = 2080;
      v49 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke_2";
      v50 = 2114;
      v51 = v9;
      v52 = 2114;
      v53 = v20;
      v54 = 2114;
      v55 = v21;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneChangeTokensUpdatedBlock with incomplete zone %{public}@, container %{public}@, database %{public}@.", buf, 0x34u);

    }
  }
  else
  {
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v23 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_197;
    v44[3] = &unk_1E6CEC6A0;
    v24 = v15;
    v45 = v24;
    objc_msgSend(v22, "hk_filter:", v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeObjectsInArray:", v26);
    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v42[0] = v23;
    v42[1] = 3221225472;
    v42[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_199;
    v42[3] = &unk_1E6CEC6C8;
    v28 = v24;
    v43 = v28;
    objc_msgSend(v27, "hk_filter:", v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeObjectsInArray:", v30);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    v32 = *(void **)(a1 + 40);
    v31 = *(void **)(a1 + 48);
    v33 = *(void **)(a1 + 32);
    v41 = 0;
    LOBYTE(v28) = -[HDCloudSyncUpdateCachedRecordsOperation _updateCKCachedZoneForZone:recordsToAdd:recordIDsToDelete:serverChangeToken:fetchComplete:container:database:error:](v31, v28, v26, v30, v5, 0, v33, v32, &v41);
    v34 = v41;
    if ((v28 & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v40 = *(_QWORD *)(a1 + 48);
        v36 = *(void **)(a1 + 32);
        v37 = v35;
        objc_msgSend(v36, "containerIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "databaseScope");
        CKDatabaseScopeString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v47 = v40;
        v48 = 2080;
        v49 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke_3";
        v50 = 2114;
        v51 = v9;
        v52 = 2114;
        v53 = v38;
        v54 = 2114;
        v55 = v39;
        v56 = 2114;
        v57 = v34;
        _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneChangeTokensUpdatedBlock failed to cache records for zone %{public}@, container %{public}@, database %{public}@, %{public}@", buf, 0x3Eu);

      }
    }

  }
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_197(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_199(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (uint64_t)_updateCKCachedZoneForZone:(void *)a3 recordsToAdd:(void *)a4 recordIDsToDelete:(void *)a5 serverChangeToken:(unsigned int)a6 fetchComplete:(void *)a7 container:(void *)a8 database:(_QWORD *)a9 error:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  os_log_t *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  os_log_t v61;
  NSObject *v62;
  void *v63;
  os_log_t v64;
  NSObject *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  HDCloudSyncZoneIdentifier *v75;
  void *v76;
  id v77;
  HDCloudSyncCachedZone *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  _QWORD *v85;
  id v86;
  void *v87;
  void *v88;
  NSObject *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t k;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  int v100;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  void *v110;
  id v111;
  id v112;
  id v113;
  id obj;
  uint64_t v115;
  id v116;
  void *v117;
  id v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t v128[32];
  __int128 v129;
  __int128 v130;
  _BYTE v131[22];
  uint8_t v132[4];
  void *v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  id v137;
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  void *v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = 0;
  v117 = a1;
  if (a1 && v18)
  {
    v108 = v15;
    v106 = v18;
    v22 = v20;
    objc_msgSend(v117, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cachedCloudState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setChangedRecordsCount:", objc_msgSend(v24, "changedRecordsCount") + objc_msgSend(v16, "count"));

    objc_msgSend(v117, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cachedCloudState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDeletedRecordsCount:", objc_msgSend(v26, "deletedRecordsCount") + objc_msgSend(v17, "count"));

    v105 = v19;
    v27 = v19;
    v104 = v22;
    v111 = v22;
    v28 = v16;
    v107 = v17;
    v29 = v17;
    v110 = v27;
    if (objc_msgSend(v28, "count") || objc_msgSend(v29, "count"))
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        objc_msgSend(v27, "containerIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v28, "count");
        v34 = objc_msgSend(v29, "count");
        objc_msgSend(v111, "databaseScope");
        CKDatabaseScopeString();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v139 = v117;
        v140 = 2114;
        v141 = v32;
        v142 = 2048;
        v143 = v33;
        v27 = v110;
        v144 = 2048;
        v145 = v34;
        v146 = 2114;
        v147 = v35;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Fetched %ld changed records and %ld deleted records in database %{public}@. Updating cache.", buf, 0x34u);

      }
    }
    objc_msgSend(v27, "containerIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v111, "databaseScope");
    v37 = v28;
    v112 = v29;
    v38 = v36;
    v39 = v37;
    v40 = v38;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    obj = v39;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v125;
      v44 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v125 != v43)
            objc_enumerationMutation(obj);
          v46 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * i);
          *(_QWORD *)&v120 = v44;
          *((_QWORD *)&v120 + 1) = 3221225472;
          *(_QWORD *)&v121 = __119__HDCloudSyncUpdateCachedRecordsOperation__addRecordToCacheWithChangedRecords_containerIdentifier_databaseScope_error___block_invoke;
          *((_QWORD *)&v121 + 1) = &unk_1E6CEC7A8;
          *(_QWORD *)&v122 = v46;
          v47 = v40;
          v48 = v40;
          *((_QWORD *)&v122 + 1) = v48;
          *(_QWORD *)&v123 = v117;
          *((_QWORD *)&v123 + 1) = v115;
          v49 = HKWithAutoreleasePool();

          if (!v49)
          {

            v21 = 0;
            v18 = v106;
            v17 = v107;
            v20 = v104;
            v19 = v105;
            v15 = v108;
            goto LABEL_68;
          }
          v40 = v47;
        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
        if (v42)
          continue;
        break;
      }
    }

    v103 = v16;
    if (objc_msgSend(obj, "count"))
    {
      v102 = v40;
      _HKInitializeLogging();
      v50 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v51 = v50;
        v52 = objc_msgSend(obj, "count");
        *(_DWORD *)v131 = 138543618;
        *(_QWORD *)&v131[4] = v117;
        *(_WORD *)&v131[12] = 2048;
        *(_QWORD *)&v131[14] = v52;
        _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated cache with %ld changed records:", v131, 0x16u);

      }
      v129 = 0u;
      v130 = 0u;
      memset(v128, 0, sizeof(v128));
      v53 = obj;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v128, v132, 16);
      v55 = (os_log_t *)MEMORY[0x1E0CB5370];
      if (v54)
      {
        v56 = v54;
        v57 = 0;
        v58 = **(_QWORD **)&v128[16];
        do
        {
          for (j = 0; j != v56; ++j)
          {
            if (**(_QWORD **)&v128[16] != v58)
              objc_enumerationMutation(v53);
            v60 = *(void **)(*(_QWORD *)&v128[8] + 8 * j);
            _HKInitializeLogging();
            v61 = *v55;
            if (os_log_type_enabled(*v55, OS_LOG_TYPE_DEFAULT))
            {
              v62 = v61;
              objc_msgSend(v60, "recordID");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v131 = 67109378;
              *(_DWORD *)&v131[4] = v57;
              *(_WORD *)&v131[8] = 2114;
              *(_QWORD *)&v131[10] = v63;
              _os_log_impl(&dword_1B7802000, v62, OS_LOG_TYPE_DEFAULT, "\t\t%3d. %{public}@", v131, 0x12u);

              ++v57;
              v55 = (os_log_t *)MEMORY[0x1E0CB5370];
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              _HKInitializeLogging();
              v64 = *v55;
              if (os_log_type_enabled(*v55, OS_LOG_TYPE_DEFAULT))
              {
                v65 = v64;
                objc_msgSend(v60, "description");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v131 = 138543362;
                *(_QWORD *)&v131[4] = v66;
                _os_log_impl(&dword_1B7802000, v65, OS_LOG_TYPE_DEFAULT, "Participant Record Status %{public}@", v131, 0xCu);

              }
            }
          }
          v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v128, v132, 16);
        }
        while (v56);
      }

      v40 = v102;
    }
    else
    {

    }
    v67 = v112;
    v118 = v40;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v68 = v67;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
    v113 = v68;
    if (v69)
    {
      v70 = v69;
      v71 = 0;
      v119 = *(_QWORD *)v125;
      while (2)
      {
        v72 = 0;
        v73 = v71;
        do
        {
          if (*(_QWORD *)v125 != v119)
            objc_enumerationMutation(v113);
          v74 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v72);
          v75 = [HDCloudSyncZoneIdentifier alloc];
          objc_msgSend(v74, "zoneID");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v75, "initForZone:container:scope:", v76, v118, v115);

          v78 = [HDCloudSyncCachedZone alloc];
          objc_msgSend(v117, "configuration");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "repository");
          v80 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "configuration");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "accessibilityAssertion");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v78, "initForZoneIdentifier:repository:accessibilityAssertion:", v77, v80, v82);

          *(_QWORD *)v131 = v73;
          LOBYTE(v80) = objc_msgSend(v83, "deleteRecordID:error:", v74, v131);
          v71 = *(id *)v131;

          if ((v80 & 1) == 0)
          {
            _HKInitializeLogging();
            v84 = *MEMORY[0x1E0CB5370];
            v85 = a9;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v132 = 138543874;
              v133 = v117;
              v134 = 2114;
              v135 = (uint64_t)v74;
              v136 = 2114;
              v137 = v71;
              _os_log_error_impl(&dword_1B7802000, v84, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete cached recordID %{public}@, %{public}@", v132, 0x20u);
            }
            v86 = v71;
            v87 = v86;
            v17 = v107;
            v15 = v108;
            v16 = v103;
            v18 = v106;
            if (v86)
            {
              if (a9)
                *a9 = objc_retainAutorelease(v86);
              else
                _HKLogDroppedError();
            }

            v128[0] = v87 == 0;
            v99 = v113;

            goto LABEL_64;
          }

          ++v72;
          v73 = v71;
        }
        while (v70 != v72);
        v68 = v113;
        v70 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
        if (v70)
          continue;
        break;
      }
    }
    else
    {
      v71 = 0;
    }
    v116 = v71;

    if (objc_msgSend(v68, "count"))
    {
      _HKInitializeLogging();
      v88 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v89 = v88;
        v90 = objc_msgSend(v113, "count");
        *(_DWORD *)v132 = 138543618;
        v133 = v117;
        v134 = 2048;
        v135 = v90;
        _os_log_impl(&dword_1B7802000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated cache with %ld deleted records:", v132, 0x16u);

      }
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v91 = v113;
      v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
      if (v92)
      {
        v93 = v92;
        v94 = 0;
        v95 = *(_QWORD *)v121;
        do
        {
          for (k = 0; k != v93; ++k)
          {
            if (*(_QWORD *)v121 != v95)
              objc_enumerationMutation(v91);
            v97 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k);
            _HKInitializeLogging();
            v98 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v128 = 67109378;
              *(_DWORD *)&v128[4] = v94;
              *(_WORD *)&v128[8] = 2114;
              *(_QWORD *)&v128[10] = v97;
              _os_log_impl(&dword_1B7802000, v98, OS_LOG_TYPE_DEFAULT, "\t\t%3d. %{public}@", v128, 0x12u);
              ++v94;
            }
          }
          v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
        }
        while (v93);
      }

    }
    v128[0] = 1;
    v17 = v107;
    v15 = v108;
    v16 = v103;
    v18 = v106;
    v85 = a9;
    v87 = v116;
    v99 = v113;
LABEL_64:

    v100 = v128[0];
    v19 = v105;
    if (v100 == 1)
      v21 = objc_msgSend(v15, "setServerChangeToken:fetchComplete:error:", v18, a6, v85);
    else
      v21 = 0;
    v20 = v104;
  }
LABEL_68:

  return v21;
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_203(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  HDCloudSyncZoneIdentifier *v13;
  void *v14;
  id v15;
  HDCloudSyncCachedZone *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  char v43;
  id v44;
  os_log_t *v45;
  os_log_t v46;
  os_log_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *loga;
  os_log_t log;
  void *v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  uint8_t buf[4];
  os_log_t v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a2;
  v13 = [HDCloudSyncZoneIdentifier alloc];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v13, "initForZone:container:scope:", v12, v14, objc_msgSend(*(id *)(a1 + 40), "databaseScope"));

  v16 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "repository");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessibilityAssertion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v16, "initForZoneIdentifier:repository:accessibilityAssertion:", v15, v18, v20);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "containsObject:", v15))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v23 = v10;
      v24 = *(NSObject **)(a1 + 48);
      v25 = *(void **)(a1 + 32);
      v26 = v22;
      objc_msgSend(v25, "containerIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "databaseScope");
      CKDatabaseScopeString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v66 = v24;
      v10 = v23;
      v67 = 2080;
      v68 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke";
      v69 = 2114;
      v70 = v15;
      v71 = 2114;
      v72 = v27;
      v73 = 2114;
      v74 = v28;
      _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneFetchCompletionBlock with incomplete zone %{public}@, container %{public}@, database %{public}@.", buf, 0x34u);

    }
  }
  else
  {
    v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v30 = v21;
    v31 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_204;
    v63[3] = &unk_1E6CEC6A0;
    v58 = v30;
    v32 = v30;
    v64 = v32;
    objc_msgSend(v29, "hk_filter:", v63);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeObjectsInArray:", v34);
    v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v61[0] = v31;
    v61[1] = 3221225472;
    v61[2] = __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_205;
    v61[3] = &unk_1E6CEC6C8;
    v36 = v32;
    v62 = v36;
    objc_msgSend(v35, "hk_filter:", v61);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeObjectsInArray:", v38);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    v40 = *(void **)(a1 + 40);
    v39 = *(void **)(a1 + 48);
    if (v11)
      v41 = 0;
    else
      v41 = a5 ^ 1;
    v42 = *(void **)(a1 + 32);
    v59 = v10;
    v60 = 0;
    v43 = -[HDCloudSyncUpdateCachedRecordsOperation _updateCKCachedZoneForZone:recordsToAdd:recordIDsToDelete:serverChangeToken:fetchComplete:container:database:error:](v39, v36, v34, v38, v10, v41, v42, v40, &v60);
    v44 = v60;
    v45 = (os_log_t *)MEMORY[0x1E0CB5370];
    if ((v43 & 1) == 0)
    {
      _HKInitializeLogging();
      v46 = *v45;
      if (os_log_type_enabled(*v45, OS_LOG_TYPE_ERROR))
      {
        log = *(os_log_t *)(a1 + 48);
        v50 = *(void **)(a1 + 32);
        v51 = v46;
        objc_msgSend(v50, "containerIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "databaseScope");
        CKDatabaseScopeString();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v66 = log;
        v67 = 2080;
        v68 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke_3";
        v69 = 2114;
        v70 = v15;
        v71 = 2114;
        v72 = v52;
        v73 = 2114;
        v74 = v55;
        v75 = 2114;
        v76 = v44;
        _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, "%{public}@ %s@: recordZoneFetchCompletionBlock failed to cache records for zone %{public}@, container %{public}@, database %{public}@, %{public}@", buf, 0x3Eu);

      }
    }
    v21 = v58;
    if (v11)
    {
      _HKInitializeLogging();
      v47 = *v45;
      if (os_log_type_enabled(*v45, OS_LOG_TYPE_ERROR))
      {
        v54 = *(NSObject **)(a1 + 48);
        v48 = *(void **)(a1 + 32);
        loga = v47;
        objc_msgSend(v48, "containerIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "databaseScope");
        CKDatabaseScopeString();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v66 = v54;
        v67 = 2080;
        v68 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke";
        v69 = 2114;
        v70 = v15;
        v71 = 2114;
        v72 = v53;
        v73 = 2114;
        v74 = v49;
        v75 = 2114;
        v76 = v11;
        _os_log_error_impl(&dword_1B7802000, loga, OS_LOG_TYPE_ERROR, "%{public}@ %s: recordZoneFetchCompletionBlock failed for zone %{public}@ in container %{public}@, database %{public}@, %{public}@", buf, 0x3Eu);

      }
      objc_msgSend(v36, "handleCloudError:operation:container:database:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }

    v10 = v59;
  }

}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_204(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_2_205(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

void __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v14 = v4;
      objc_msgSend(v12, "containerIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "databaseScope");
      CKDatabaseScopeString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544386;
      v18 = v13;
      v19 = 2080;
      v20 = "-[HDCloudSyncUpdateCachedRecordsOperation _fetchChangesForRecordZoneIDs:container:database:]_block_invoke";
      v21 = 2114;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      v25 = 2114;
      v26 = v3;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed for container %{public}@, database %{public}@, %{public}@", (uint8_t *)&v17, 0x34u);

    }
    if (objc_msgSend(v3, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 27))
    {
      -[HDCloudSyncUpdateCachedRecordsOperation _limitExceededFetchingChangesForRecordZoneIDs:container:database:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 48), v3);
    }
    else
    {
      objc_msgSend(v3, "hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:", &__block_literal_global_210);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "repository");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "primaryCKContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6 == v9)
        {
          v10 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
          objc_msgSend(v5, "hd_errorSurfacingFatalCloudKitPartialFailure");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "failTaskWithError:", v11);

          goto LABEL_10;
        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
LABEL_10:

}

uint64_t __92__HDCloudSyncUpdateCachedRecordsOperation__fetchChangesForRecordZoneIDs_container_database___block_invoke_208(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v4)
  {
    v5 = objc_msgSend(v2, "code");
    v6 = v5 == 112;
    if (v5 == 22)
      v6 = 1;
    v7 = v5 == 11 || v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __108__HDCloudSyncUpdateCachedRecordsOperation__configurationsByRecordZoneIDs_containerIdentifier_databaseScope___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id, id);
  id v7;
  HDCloudSyncCachedZone *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v8 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v8, "initForZoneIdentifier:repository:accessibilityAssertion:", v7, v10, v12);

  v20 = 0;
  objc_msgSend(v13, "serverChangeTokenWithError:", &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;
  v16 = v15;
  if (!v14)
  {
    if (v15)
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v22 = v19;
        v23 = 2114;
        v24 = v7;
        v25 = 2114;
        v26 = v16;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve previous server change token for %{public}@, %{public}@", buf, 0x20u);
      }
    }
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  objc_msgSend(v18, "setPreviousServerChangeToken:", v14);
  objc_msgSend(v18, "setResultsLimit:", 0);
  objc_msgSend(v18, "setDesiredKeys:", 0);
  v6[2](v6, v5, v18);

}

BOOL __119__HDCloudSyncUpdateCachedRecordsOperation__addRecordToCacheWithChangedRecords_containerIdentifier_databaseScope_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  HDCloudSyncZoneIdentifier *v4;
  void *v5;
  void *v6;
  id v7;
  HDCloudSyncCachedZone *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = [HDCloudSyncZoneIdentifier alloc];
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v4, "initForZone:container:scope:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  v8 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v8, "initForZoneIdentifier:repository:accessibilityAssertion:", v7, v10, v12);

  v14 = *(_QWORD *)(a1 + 32);
  v24 = 0;
  LOBYTE(v10) = objc_msgSend(v13, "addRecord:error:", v14, &v24);
  v15 = v24;
  if ((v10 & 1) != 0)
    goto LABEL_7;
  _HKInitializeLogging();
  v16 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v22 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v26 = v22;
    v27 = 2114;
    v28 = v23;
    v29 = 2114;
    v30 = v15;
    _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to cache record %{public}@, %{public}@", buf, 0x20u);
  }
  if (objc_msgSend(v15, "code") == 713)
    goto LABEL_7;
  if (objc_msgSend(v15, "code") == 709)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 120));
    v17 = *(void **)(*(_QWORD *)(a1 + 48) + 112);
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 120));
LABEL_7:
    v19 = 1;
    goto LABEL_8;
  }
  v21 = v15;
  v19 = v21 == 0;
  if (v21)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

LABEL_8:
  return v19;
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

- (NSArray)zoneIdentifiersWithIdentityLost
{
  return self->_zoneIdentifiersWithIdentityLost;
}

- (HDSynchronousTaskGroup)taskGroup
{
  return self->_taskGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifiersWithIdentityLost, 0);
  objc_storeStrong((id *)&self->_invalidRecordIDs, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
