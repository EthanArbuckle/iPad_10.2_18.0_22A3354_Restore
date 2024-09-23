@implementation HDCloudSyncUpdateCachedZonesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncUpdateCachedZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncUpdateCachedZonesOperation *v4;
  HDSynchronousTaskGroup *v5;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncUpdateCachedZonesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v8, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v4)
  {
    v5 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v5;

    -[HDSynchronousTaskGroup setDelegate:](v4->_taskGroup, "setDelegate:", v4);
  }
  return v4;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  HDCloudSyncUpdateCachedZonesOperation *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCKContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "count");
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = self;
    v25 = 2048;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning fetches for private database in %ld containers: %{public}@", buf, 0x20u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v16, "privateCloudDatabase", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:](self, "fetchChangesForContainer:database:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

- (void)fetchChangesForContainer:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, void *);
  void *v29;
  HDCloudSyncUpdateCachedZonesOperation *v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[6];
  _QWORD v43[6];
  _QWORD v44[6];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  int v51;
  uint8_t buf[4];
  HDCloudSyncUpdateCachedZonesOperation *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2810000000;
  v50[3] = &unk_1B805FAAD;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__2;
  v48[4] = __Block_byref_object_dispose__2;
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__2;
  v46[4] = __Block_byref_object_dispose__2;
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedCloudState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v9, "serverChangeTokenForContainerIdentifier:databaseScope:error:", v10, objc_msgSend(v7, "databaseScope"), &v45);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v45;

  if (v12)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "containerIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v7, "databaseScope");
      *(_DWORD *)buf = 138544130;
      v53 = self;
      v54 = 2114;
      v55 = v24;
      v56 = 2048;
      v57 = v25;
      v58 = 2114;
      v59 = v12;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch server change token for container %{public}@, database, %ld, %{public}@", buf, 0x2Au);

    }
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DB0]), "initWithPreviousServerChangeToken:", v11);
  objc_msgSend(v14, "setFetchAllChanges:", 1);
  v15 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke;
  v44[3] = &unk_1E6CE7EF0;
  v44[4] = v50;
  v44[5] = v48;
  objc_msgSend(v14, "setRecordZoneWithIDChangedBlock:", v44);
  v43[0] = v15;
  v43[1] = 3221225472;
  v43[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_2;
  v43[3] = &unk_1E6CE7EF0;
  v43[4] = v50;
  v43[5] = v46;
  objc_msgSend(v14, "setRecordZoneWithIDWasDeletedBlock:", v43);
  v42[0] = v15;
  v42[1] = 3221225472;
  v42[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_3;
  v42[3] = &unk_1E6CE7EF0;
  v42[4] = v50;
  v42[5] = v46;
  objc_msgSend(v14, "setRecordZoneWithIDWasPurgedBlock:", v42);
  v36[0] = v15;
  v36[1] = 3221225472;
  v36[2] = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_4;
  v36[3] = &unk_1E6CE7F18;
  v40 = v48;
  v41 = v46;
  v39 = v50;
  v36[4] = self;
  v16 = v6;
  v37 = v16;
  v17 = v7;
  v38 = v17;
  objc_msgSend(v14, "setChangeTokenUpdatedBlock:", v36);
  v26 = v15;
  v27 = 3221225472;
  v28 = __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_189;
  v29 = &unk_1E6CE7F40;
  v34 = v48;
  v35 = v46;
  v33 = v50;
  v30 = self;
  v18 = v16;
  v31 = v18;
  v19 = v17;
  v32 = v19;
  objc_msgSend(v14, "setFetchDatabaseChangesCompletionBlock:", &v26);
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask", v26, v27, v28, v29, v30);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cachedCloudState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOperationCountForAnalytics:", objc_msgSend(v21, "operationCountForAnalytics") + 1);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "operationGroup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGroup:", v23);

  objc_msgSend(v19, "hd_addOperation:", v14);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_3(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_4(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "copy");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v13 = *(void **)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v24 = 0;
  v16 = -[HDCloudSyncUpdateCachedZonesOperation _updateCKCachedZonesWithServerChangeToken:recordZonesIDsToAdd:recordZonesIDsToDelete:container:database:error:](v13, v4, v5, v9, v14, v15, &v24);

  v17 = v24;
  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v21 = v18;
      objc_msgSend(v19, "containerIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "databaseScope");
      CKDatabaseScopeString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v26 = v20;
      v27 = 2080;
      v28 = "-[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:]_block_invoke_4";
      v29 = 2114;
      v30 = v22;
      v31 = 2114;
      v32 = v23;
      v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed to cache zones for container %{public}@, database %{public}@, %{public}@", buf, 0x34u);

    }
  }

}

- (uint64_t)_updateCKCachedZonesWithServerChangeToken:(void *)a3 recordZonesIDsToAdd:(void *)a4 recordZonesIDsToDelete:(void *)a5 container:(void *)a6 database:(_QWORD *)a7 error:
{
  id v13;
  id v14;
  uint64_t v15;
  NSObject **v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  os_log_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  char v58;
  NSObject *v59;
  int v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  HDCloudSyncCachedZone *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  id v83;
  NSObject *v85;
  id v86;
  void *v87;
  id v88;
  _QWORD *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id obj;
  id obja;
  _QWORD v102[4];
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  unsigned __int8 v112;
  id v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t v121[4];
  void *v122;
  __int16 v123;
  id v124;
  __int16 v125;
  id v126;
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  id v134;
  __int16 v135;
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v95 = a4;
  v94 = a5;
  v93 = a6;
  v98 = a1;
  if (a1)
  {
    v15 = objc_msgSend(v14, "count");
    v16 = (NSObject **)MEMORY[0x1E0CB5370];
    v92 = v13;
    v89 = a7;
    if (v15 || objc_msgSend(v95, "count"))
    {
      _HKInitializeLogging();
      v17 = *v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_msgSend(v14, "count");
        v20 = objc_msgSend(v95, "count");
        objc_msgSend(v93, "databaseScope");
        CKDatabaseScopeString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "containerIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v128 = a1;
        v129 = 2048;
        v130 = v19;
        v131 = 2048;
        v132 = v20;
        v133 = 2114;
        v134 = v21;
        v135 = 2114;
        v136 = v22;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %ld modified and %ld deleted zone changes for %{public}@ database in %{public}@", buf, 0x34u);

      }
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v14;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
      v24 = (os_log_t *)MEMORY[0x1E0CB5370];
      if (v23)
      {
        v25 = v23;
        v26 = 0;
        v27 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v109 != v27)
              objc_enumerationMutation(obj);
            v29 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
            _HKInitializeLogging();
            v30 = *v24;
            if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v128 = (void *)(v26 + i);
              v129 = 2114;
              v130 = v29;
              _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "Modified:\t%ld: + %{public}@", buf, 0x16u);
            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
          v26 += i;
        }
        while (v25);
      }

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v31 = v95;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
      if (v32)
      {
        v33 = v32;
        v34 = 0;
        v35 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v105 != v35)
              objc_enumerationMutation(v31);
            v37 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
            _HKInitializeLogging();
            v38 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v128 = (void *)(v34 + j);
              v129 = 2114;
              v130 = v37;
              _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "Deleted: \t%ld: + %{public}@", buf, 0x16u);
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
          v34 += j;
        }
        while (v33);
      }

      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __151__HDCloudSyncUpdateCachedZonesOperation__updateCKCachedZonesWithServerChangeToken_recordZonesIDsToAdd_recordZonesIDsToDelete_container_database_error___block_invoke;
      v102[3] = &unk_1E6CE7F68;
      v103 = v31;
      objc_msgSend(obj, "hk_filter:", v102);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v92;
    }
    objc_msgSend(v98, "configuration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "cachedCloudState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setChangedZonesCount:", objc_msgSend(v40, "changedZonesCount") + objc_msgSend(v14, "count"));

    objc_msgSend(v98, "configuration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cachedCloudState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setDeletedZonesCount:", objc_msgSend(v42, "deletedZonesCount") + objc_msgSend(v95, "count"));

    objc_msgSend(v94, "containerIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v93, "databaseScope");
    v44 = v14;
    v91 = v95;
    v90 = v13;
    v45 = v43;
    v46 = v44;
    v47 = v45;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v14 = v46;
    v48 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
    v99 = v14;
    if (v48)
    {
      v49 = v48;
      v50 = 0;
      v51 = *(_QWORD *)v116;
      while (2)
      {
        v52 = 0;
        v53 = v50;
        do
        {
          if (*(_QWORD *)v116 != v51)
            objc_enumerationMutation(v99);
          v54 = v47;
          v55 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v52), v47, obja);
          objc_msgSend(v98, "configuration");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "cachedCloudState");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v53;
          v58 = objc_msgSend(v57, "addZoneWithIdentifier:error:", v55, &v114);
          v50 = v114;

          if ((v58 & 1) == 0)
          {
            _HKInitializeLogging();
            v59 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v121 = 138543874;
              v122 = v98;
              v123 = 2114;
              v124 = v55;
              v125 = 2114;
              v126 = v50;
              _os_log_error_impl(&dword_1B7802000, v59, OS_LOG_TYPE_ERROR, "%{public}@ Failed to add cached record zone %{public}@, %{public}@", v121, 0x20u);
            }
            v50 = v50;
            v14 = v99;
            v47 = v54;
            if (v50)
            {
              if (v89)
                *v89 = objc_retainAutorelease(v50);
              else
                _HKLogDroppedError();
            }

            v121[0] = v50 == 0;
            goto LABEL_43;
          }

          ++v52;
          v53 = v50;
          v47 = v54;
        }
        while (v49 != v52);
        v14 = v99;
        v49 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
        if (v49)
          continue;
        break;
      }
    }
    else
    {
      v50 = 0;
    }

    v121[0] = 1;
LABEL_43:

    v60 = v121[0];
    if (v60 != 1)
      goto LABEL_65;
    v61 = v91;
    v88 = v47;
    v62 = v47;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v63 = v61;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
    v96 = v63;
    if (v64)
    {
      v65 = v64;
      v66 = 0;
      v97 = *(_QWORD *)v116;
      while (2)
      {
        v67 = 0;
        v68 = v66;
        do
        {
          if (*(_QWORD *)v116 != v97)
            objc_enumerationMutation(v96);
          v69 = v62;
          v70 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v67), v62, obja);
          v71 = [HDCloudSyncCachedZone alloc];
          objc_msgSend(v98, "configuration");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "repository");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "configuration");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "accessibilityAssertion");
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v71, "initForZoneIdentifier:repository:accessibilityAssertion:", v70, v73, v75);

          v114 = v68;
          LOBYTE(v75) = objc_msgSend(v76, "deleteZoneWithError:", &v114);
          v66 = v114;

          if ((v75 & 1) == 0)
          {
            _HKInitializeLogging();
            v77 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v121 = 138543874;
              v122 = v98;
              v123 = 2114;
              v124 = v70;
              v125 = 2114;
              v126 = v66;
              _os_log_error_impl(&dword_1B7802000, v77, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete cached record zone %{public}@, %{public}@", v121, 0x20u);
            }
            v66 = v66;
            v14 = v99;
            v63 = v96;
            if (v66)
            {
              if (v89)
                *v89 = objc_retainAutorelease(v66);
              else
                _HKLogDroppedError();
            }

            v121[0] = v66 == 0;
            v62 = v69;
            goto LABEL_62;
          }

          ++v67;
          v68 = v66;
          v62 = v69;
        }
        while (v65 != v67);
        v63 = v96;
        v65 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
        if (v65)
          continue;
        break;
      }
    }
    else
    {
      v66 = 0;
    }

    v121[0] = 1;
    v14 = v99;
LABEL_62:

    v78 = v121[0];
    v47 = v88;
    if (v78 == 1)
    {
      objc_msgSend(v98, "configuration");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "cachedCloudState");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = 0;
      v81 = v62;
      v82 = objc_msgSend(v80, "setServerChangeToken:containerIdentifier:databaseScope:error:", v90, v62, obja, &v113);
      v83 = v113;

      v13 = v92;
      if ((v82 & 1) != 0)
      {

LABEL_75:
        v112 = 1;
        goto LABEL_68;
      }
      _HKInitializeLogging();
      v85 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v128 = v98;
        v129 = 2114;
        v130 = (uint64_t)v81;
        v131 = 2048;
        v132 = (uint64_t)obja;
        v133 = 2114;
        v134 = v83;
        _os_log_error_impl(&dword_1B7802000, v85, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update cached server change token for container %{public}@, database, %ld, %{public}@", buf, 0x2Au);
      }
      v86 = v83;
      if (!v86)
      {

        goto LABEL_75;
      }
      v87 = v86;
      if (v89)
        *v89 = objc_retainAutorelease(v86);
      else
        _HKLogDroppedError();

    }
    else
    {
LABEL_65:

      v13 = v92;
    }

  }
  v112 = 0;
LABEL_68:

  return v112;
}

void __75__HDCloudSyncUpdateCachedZonesOperation_fetchChangesForContainer_database___block_invoke_189(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  os_unfair_lock_s *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  os_log_t *v22;
  os_log_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  id v29;
  os_log_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  os_log_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  os_log_t *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  char *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  char v77;
  void *v78;
  id v79;
  id v80;
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v8 = a2;
  os_unfair_lock_lock(v7);
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "copy");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v17 = *(void **)(a1 + 32);
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  v80 = 0;
  v20 = -[HDCloudSyncUpdateCachedZonesOperation _updateCKCachedZonesWithServerChangeToken:recordZonesIDsToAdd:recordZonesIDsToDelete:container:database:error:](v17, v8, v9, v13, v18, v19, &v80);

  v21 = v80;
  v22 = (os_log_t *)MEMORY[0x1E0CB5370];
  if (v6)
  {
    v77 = v20;
    _HKInitializeLogging();
    v23 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
    {
      v56 = v13;
      v57 = *(_QWORD *)(a1 + 32);
      v58 = *(void **)(a1 + 40);
      v59 = v23;
      objc_msgSend(v58, "containerIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "databaseScope");
      CKDatabaseScopeString();
      v61 = v21;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v82 = v57;
      v83 = 2080;
      v84 = "-[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:]_block_invoke";
      v85 = 2114;
      v86 = v60;
      v87 = 2114;
      v88 = v62;
      v89 = 2114;
      v90 = v6;
      _os_log_error_impl(&dword_1B7802000, v59, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed to fetch database changes for container %{public}@, database %{public}@, %{public}@", buf, 0x34u);

      v13 = v56;
      v21 = v61;

    }
    v78 = v13;
    if (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 21))
    {
      v74 = v6;
      v75 = v21;
      v76 = v9;
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeAllObjects");
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cachedCloudState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(*(id *)(a1 + 48), "databaseScope");
      v79 = 0;
      v28 = objc_msgSend(v25, "resetServerChangeTokenForContainerIdentifier:databaseScope:error:", v26, v27, &v79);
      v29 = v79;

      if ((v28 & 1) == 0)
      {
        _HKInitializeLogging();
        v30 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        {
          v68 = *(_QWORD *)(a1 + 32);
          v69 = *(void **)(a1 + 40);
          v70 = v30;
          objc_msgSend(v69, "containerIdentifier");
          v71 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "databaseScope");
          CKDatabaseScopeString();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v82 = v68;
          v83 = 2114;
          v84 = v71;
          v85 = 2114;
          v86 = v72;
          v87 = 2114;
          v88 = v29;
          _os_log_error_impl(&dword_1B7802000, v70, OS_LOG_TYPE_ERROR, " %{public}@ Failed to delete %{public}@ %{public}@ from cache in response to CKErrorChangeTokenExpired, error %{public}@", buf, 0x2Au);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "repository");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "profile");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "daemon");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "analyticsSubmissionCoordinator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v29;
      v36 = v22;
      v37 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "databaseScope");
      CKDatabaseScopeString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v37;
      v22 = v36;
      v6 = v74;
      objc_msgSend(v35, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v40, &stru_1E6D11BB8, v38, v39, v74);

      v21 = v75;
      v9 = v76;
      v13 = v78;
    }
    objc_msgSend(v6, "hd_errorSurfacingFatalCloudKitPartialFailure");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v42 = v21;
      v43 = v9;
      v44 = v6;
      v45 = v22;
      v46 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "repository");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "primaryCKContainer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v46 == v49;
      v22 = v45;
      v6 = v44;
      v9 = v43;
      v21 = v42;
      v13 = v78;
      if (v50)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:", v41);

        goto LABEL_17;
      }
    }

    v20 = v77;
  }
  if ((v20 & 1) != 0)
    goto LABEL_16;
  _HKInitializeLogging();
  v51 = *v22;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v64 = *(_QWORD *)(a1 + 32);
    v63 = *(void **)(a1 + 40);
    v65 = v51;
    objc_msgSend(v63, "containerIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "databaseScope");
    CKDatabaseScopeString();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v82 = v64;
    v83 = 2080;
    v84 = "-[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:]_block_invoke";
    v85 = 2114;
    v86 = v66;
    v87 = 2114;
    v88 = v67;
    v89 = 2114;
    v90 = v21;
    _os_log_error_impl(&dword_1B7802000, v65, OS_LOG_TYPE_ERROR, "%{public}@ %s@: Failed to cache zones for container %{public}@, database %{public}@, %{public}@", buf, 0x34u);

  }
  v52 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "repository");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "primaryCKContainer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52 == v55)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:", v21);
  else
LABEL_16:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
LABEL_17:

}

uint64_t __151__HDCloudSyncUpdateCachedZonesOperation__updateCKCachedZonesWithServerChangeToken_recordZonesIDsToAdd_recordZonesIDsToDelete_container_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "\tZone %{public}@ was both modified and deleted and will be ignored.", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4 ^ 1u;
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

- (HDSynchronousTaskGroup)taskGroup
{
  return self->_taskGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
