@implementation HDCloudSyncFetchRecordsOperation

- (HDCloudSyncFetchRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 recordIDs:(id)a5
{
  id v9;
  id v10;
  HDCloudSyncFetchRecordsOperation *v11;
  HDCloudSyncFetchRecordsOperation *v12;
  HDSynchronousTaskGroup *v13;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncFetchRecordsOperation;
  v11 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v16, sel_initWithConfiguration_cloudState_, a3, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a4);
    objc_storeStrong((id *)&v12->_recordIDs, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    v13 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v12->_taskGroup;
    v12->_taskGroup = v13;

    -[HDSynchronousTaskGroup setDelegate:](v12->_taskGroup, "setDelegate:", v12);
  }

  return v12;
}

- (void)main
{
  NSArray *recordIDs;
  CKContainer *container;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  recordIDs = self->_recordIDs;
  container = self->_container;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseForContainer(container, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HDCloudSyncFetchRecordsOperation_main__block_invoke;
  v9[3] = &unk_1E6CE80E8;
  v9[4] = self;
  -[HDCloudSyncFetchRecordsOperation _fetchRecordsWithIDs:container:database:completion:]((id *)&self->super.super.isa, recordIDs, container, v8, v9);

}

uint64_t __40__HDCloudSyncFetchRecordsOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "finishTask");
}

- (void)_fetchRecordsWithIDs:(void *)a3 container:(void *)a4 database:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[5];
  id v27;
  id v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    if (objc_msgSend(v9, "count"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v9);
      v14 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke;
      v26[3] = &unk_1E6CFCFB0;
      v26[4] = a1;
      v15 = v10;
      v27 = v15;
      v16 = v11;
      v28 = v16;
      objc_msgSend(v13, "setPerRecordCompletionBlock:", v26);
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke_188;
      v22[3] = &unk_1E6CFCFD8;
      v22[4] = a1;
      v23 = v15;
      v17 = v16;
      v24 = v17;
      v25 = v12;
      objc_msgSend(v13, "setFetchRecordsCompletionBlock:", v22);
      objc_msgSend(a1[15], "beginTask");
      objc_msgSend(a1, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cachedCloudState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setOperationCountForAnalytics:", objc_msgSend(v19, "operationCountForAnalytics") + 1);

      objc_msgSend(a1, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "operationGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setGroup:", v21);

      objc_msgSend(v17, "hd_addOperation:", v13);
    }
    else
    {
      v12[2](v12);
    }
  }

}

void __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!a2 && objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 26))
  {
    objc_msgSend(a1[4], "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedCloudState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1[6], "databaseScope");
    v26 = 0;
    v12 = objc_msgSend(v9, "resetServerChangeTokenForContainerIdentifier:databaseScope:error:", v10, v11, &v26);
    v13 = v26;

    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    v15 = *MEMORY[0x1E0CB5370];
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = a1[4];
        *(_DWORD *)buf = 138543618;
        v28 = v16;
        v29 = 2114;
        v30 = v7;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset cache server change token after encountering unexpected zone-not-found error during record fetch (%{public}@)", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = a1[4];
      *(_DWORD *)buf = 138543874;
      v28 = v25;
      v29 = 2114;
      v30 = v7;
      v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: FAILED attempting reset of cache server change token after encountering unexpected zone-not-found error during record fetch (%{public}@): %{public}@", buf, 0x20u);
    }
    objc_msgSend(a1[4], "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "repository");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "daemon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "analyticsSubmissionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = a1[4];
    objc_msgSend(a1[5], "containerIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HDCKDatabaseScopeToString(objc_msgSend(a1[6], "databaseScope"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v22, CFSTR("Zone Not Found"), v23, v24, v7);

  }
}

void __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  os_log_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  HDCloudSyncZoneIdentifier *v30;
  void *v31;
  void *v32;
  id v33;
  HDCloudSyncCachedZone *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  char v44;
  id v45;
  uint64_t v46;
  id *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  id v60;
  id obj;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  id v72;
  _QWORD *v73;
  _QWORD v74[4];
  _QWORD v75[2];
  _QWORD v76[2];
  uint8_t v77[128];
  _BYTE buf[24];
  void *v79;
  __int128 v80;
  _QWORD *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v64 = a2;
  v59 = a3;
  if (v59)
  {
    _HKInitializeLogging();
    v5 = (os_log_t *)MEMORY[0x1E0CB5370];
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v55 = *(_QWORD *)(a1 + 32);
      v54 = *(_QWORD *)(a1 + 40);
      v56 = *(void **)(a1 + 48);
      v57 = v6;
      objc_msgSend(v56, "databaseScope");
      CKDatabaseScopeString();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v55;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v54;
      *(_WORD *)&buf[22] = 2114;
      v79 = v58;
      LOWORD(v80) = 2114;
      *(_QWORD *)((char *)&v80 + 2) = v59;
      _os_log_error_impl(&dword_1B7802000, v57, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch records in container %{public}@ database %{public}@ with error %{public}@", buf, 0x2Au);

    }
    if (objc_msgSend(v59, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 27))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 128);
      v9 = *(void **)(v7 + 104);
      v11 = *(void **)(a1 + 48);
      v10 = *(void **)(a1 + 56);
      v12 = v59;
      v13 = v8;
      v14 = v9;
      v15 = v11;
      v16 = v10;
      _HKInitializeLogging();
      v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Limit exceeded fectching %ld records. Splitting record request in half and re-fetching.", buf, 0x16u);

      }
      if ((unint64_t)objc_msgSend(v13, "count") < 2)
      {
        objc_msgSend(*(id *)(v7 + 120), "failTaskWithError:", v12);
      }
      else
      {
        v20 = (unint64_t)objc_msgSend(v13, "count") >> 1;
        objc_msgSend(v13, "subarrayWithRange:", 0, v20);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subarrayWithRange:", v20, objc_msgSend(v13, "count") - v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = 0;
        v74[1] = v74;
        v74[2] = 0x2020000000;
        v74[3] = 2;
        v22 = v16;
        v23 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke;
        v79 = &unk_1E6CFD000;
        *(_QWORD *)&v80 = v7;
        v81 = v74;
        v24 = v22;
        v25 = v22;
        *((_QWORD *)&v80 + 1) = v25;
        -[HDCloudSyncFetchRecordsOperation _fetchRecordsWithIDs:container:database:completion:](v7, v62, v14, v15, buf);
        v71[0] = v23;
        v71[1] = 3221225472;
        v71[2] = __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke_2;
        v71[3] = &unk_1E6CFD000;
        v71[4] = v7;
        v73 = v74;
        v72 = v25;
        -[HDCloudSyncFetchRecordsOperation _fetchRecordsWithIDs:container:database:completion:](v7, v21, v14, v15, v71);
        objc_msgSend(*(id *)(v7 + 120), "finishTask");

        v16 = v24;
        _Block_object_dispose(v74, 8);

      }
      goto LABEL_35;
    }
    objc_msgSend(v59, "hd_errorSurfacingFatalCloudKitPartialFailure");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "failTaskWithError:", v26);

      goto LABEL_35;
    }
  }
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v64, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v27)
  {
    v63 = *(_QWORD *)v68;
    while (2)
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v68 != v63)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v28);
        v30 = [HDCloudSyncZoneIdentifier alloc];
        objc_msgSend(v29, "zoneID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containerIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v30, "initForZone:container:scope:", v31, v32, objc_msgSend(*(id *)(a1 + 48), "databaseScope"));

        v34 = [HDCloudSyncCachedZone alloc];
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "repository");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "accessibilityAssertion");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v34, "initForZoneIdentifier:repository:accessibilityAssertion:", v33, v36, v38);

        objc_msgSend(v64, "objectForKeyedSubscript:", v29);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        LODWORD(v37) = objc_msgSend(v39, "addRecord:error:", v40, &v66);
        v41 = v66;

        if (!(_DWORD)v37)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "failTaskWithError:", v41);

          goto LABEL_34;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
        if (v42)
        {
          objc_msgSend(v64, "objectForKeyedSubscript:", v29);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v41;
          v44 = (*(uint64_t (**)(uint64_t, void *, id *))(v42 + 16))(v42, v43, &v65);
          v45 = v65;

          if ((v44 & 1) == 0)
            objc_msgSend(v60, "addObject:", v45);
        }
        else
        {
          v45 = v41;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));

        ++v28;
      }
      while (v27 != v28);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v27)
        continue;
      break;
    }
  }

  if (objc_msgSend(v60, "count"))
  {
    v46 = objc_msgSend(v60, "count");
    v47 = (id *)MEMORY[0x1E0CB3388];
    if (v46 != 1)
      v47 = (id *)MEMORY[0x1E0CB2F70];
    v48 = *v47;
    if (objc_msgSend(v60, "count") == 1)
    {
      objc_msgSend(v60, "firstObject");
      v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = v60;
    }
    v50 = v49;
    v75[0] = *MEMORY[0x1E0CB2D50];
    v75[1] = v48;
    v76[0] = CFSTR("Error processing fetched records");
    v76[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v52 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 100, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "failTaskWithError:", v53);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "finishTask");
  }
LABEL_34:

LABEL_35:
}

void __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 112));
  v2 = --*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 112));
  if (!v2)
    (*(void (**)(void))(a1[5] + 16))();
}

void __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 112));
  v2 = --*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 112));
  if (!v2)
    (*(void (**)(void))(a1[5] + 16))();
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

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)recordHandler
{
  return self->_recordHandler;
}

- (void)setRecordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordHandler, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
