@implementation HDCloudSyncDeleteEmptyZonesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncDeleteEmptyZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncDeleteEmptyZonesOperation *v4;
  HDCloudSyncDeleteEmptyZonesOperation *v5;
  HDSynchronousTaskGroup *v6;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncDeleteEmptyZonesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v9, sel_initWithConfiguration_cloudState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    -[HDSynchronousTaskGroup setDelegate:](v5->_taskGroup, "setDelegate:", v5);
  }
  return v5;
}

- (void)main
{
  HDCloudSyncDeleteEmptyZonesOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  id v59;
  HDCloudSyncDeleteEmptyZonesOperation *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[5];
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  HDCloudSyncDeleteEmptyZonesOperation *v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v2 = self;
  v102 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCKContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  -[HDCloudSyncOperation progress](v2, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTotalUnitCount:", v6);

  -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v8 = v5;
  v68 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v74;
    *(_QWORD *)&v9 = 138543874;
    v58 = v9;
    v59 = v8;
    v60 = v2;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v74 != v67)
          objc_enumerationMutation(v8);
        v11 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * v10);
        -[HDCloudSyncOperation configuration](v2, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cachedCloudState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "containerIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 0;
        objc_msgSend(v13, "zonesForContainerID:error:", v14, &v82);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v82;

        if (v15)
          v17 = 1;
        else
          v17 = v16 == 0;
        if (v17)
          goto LABEL_13;
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v97 = v2;
          v98 = 2114;
          v99 = v16;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
        }
        -[HDCloudSyncOperation configuration](v2, "configuration", v58);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "repository");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "primaryCKContainer");
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21 == v11)
        {
          -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v16);
        }
        else
        {
LABEL_13:
          v69 = v16;
          v71 = v10;
          v72 = v11;
          v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v70 = v15;
          v23 = v15;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v79;
            while (2)
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v79 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
                if (objc_msgSend(v28, "zoneType", v58) == 1)
                {
                  v77 = 0;
                  v29 = objc_msgSend(v28, "containsRecordsWithError:", &v77);
                  v30 = v77;
                  if (v29 == 2)
                  {
                    objc_msgSend(v28, "zoneIdentifier");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "addObject:", v31);

                  }
                  else if (!v29)
                  {
                    _HKInitializeLogging();
                    v53 = (void *)*MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                    {
                      v55 = v53;
                      objc_msgSend(v28, "zoneIdentifier");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v58;
                      v97 = v2;
                      v98 = 2114;
                      v99 = v56;
                      v100 = 2114;
                      v101 = v30;
                      _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch status of containsRecords for %{public}@, %{public}@", buf, 0x20u);

                    }
                    goto LABEL_37;
                  }

                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
              if (v25)
                continue;
              break;
            }
          }

          v11 = v72;
          if (objc_msgSend(v22, "count"))
          {
            -[HDCloudSyncOperation configuration](v2, "configuration");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "repository");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "profileIdentifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            HDDatabaseForContainer(v72, v66);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v22;
            v62 = v72;
            v64 = v32;
            -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
            v34 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
            objc_msgSend(v34, "setDesiredKeys:", MEMORY[0x1E0C9AA60]);
            objc_msgSend(v34, "setResultsLimit:", 1);
            objc_msgSend(v34, "setPreviousServerChangeToken:", 0);
            v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v90 = 0u;
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v36 = v33;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, buf, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v91;
              do
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v91 != v39)
                    objc_enumerationMutation(v36);
                  objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * j), "zoneIdentifier", v58);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v41);

                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, buf, 16);
              }
              while (v38);
            }

            v42 = objc_alloc(MEMORY[0x1E0C94DE8]);
            objc_msgSend(v35, "allKeys");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)objc_msgSend(v42, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v43, v35);

            v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v46 = MEMORY[0x1E0C809B0];
            v88[0] = MEMORY[0x1E0C809B0];
            v88[1] = 3221225472;
            v88[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke;
            v88[3] = &unk_1E6D026B8;
            v2 = v60;
            v88[4] = v60;
            v47 = v45;
            v89 = v47;
            objc_msgSend(v44, "setRecordWasChangedBlock:", v88);
            objc_msgSend(v44, "setRecordZoneFetchCompletionBlock:", &__block_literal_global_195_2);
            v83[0] = v46;
            v83[1] = 3221225472;
            v83[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_2;
            v83[3] = &unk_1E6D02748;
            v83[4] = v60;
            v63 = v62;
            v84 = v63;
            v48 = v64;
            v85 = v48;
            v86 = v47;
            v65 = v36;
            v87 = v65;
            v61 = v47;
            objc_msgSend(v44, "setFetchRecordZoneChangesCompletionBlock:", v83);
            -[HDCloudSyncOperation configuration](v60, "configuration");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "cachedCloudState");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setOperationCountForAnalytics:", objc_msgSend(v50, "operationCountForAnalytics") + 1);

            -[HDCloudSyncOperation configuration](v60, "configuration");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "operationGroup");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setGroup:", v52);

            objc_msgSend(v48, "addOperation:", v44);
            v8 = v59;
LABEL_37:
            v11 = v72;

          }
          v15 = v70;
          v10 = v71;
          v16 = v69;
        }

        ++v10;
      }
      while (v10 != v68);
      v57 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
      v68 = v57;
    }
    while (v57);
  }

  -[HDSynchronousTaskGroup finishTask](v2->_taskGroup, "finishTask");
}

uint64_t __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneIdentifier");
}

void __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryCKContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
  if (v9)
    objc_msgSend(v10, "failTaskWithError:", v11);
  else
    objc_msgSend(v10, "finishTask");

}

uint64_t __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
}

void __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v6, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching record change %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }

}

void __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  HDCloudSyncZoneIdentifier *v24;
  void *v25;
  id v26;
  HDCloudSyncCachedZone *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  id *v41;
  id v42;
  void *v43;
  HDCloudSyncModifyRecordZonesOperation *v44;
  void *v45;
  HDCloudSyncModifyRecordZonesOperation *v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  void *v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t v60;
  _QWORD v61[5];
  uint8_t v62[128];
  _BYTE buf[24];
  void *v64;
  id v65;
  id *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateCompletedProgressCount:", 1);
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v7 = v4;
      objc_msgSend(v6, "containerIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      v64 = v3;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch record zone changes failed for container %{public}@: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "repository");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryCKContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isEqualToString:", v13);

    if (v14)
    {
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_196;
      v57[3] = &unk_1E6D02720;
      v58 = *(id *)(a1 + 40);
      v15 = *(id *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      v59 = v15;
      v60 = v16;
      objc_msgSend(v3, "hd_enumerateCloudKitPartialErrorsByKeyWithHandler:", v57);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:", v3);

      v17 = v58;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      v33 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_203;
      v51[3] = &unk_1E6CEBA48;
      v34 = *(void **)(a1 + 64);
      v52 = *(id *)(a1 + 56);
      objc_msgSend(v34, "hk_filter:", v51);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v36 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(_QWORD *)(a1 + 32);
        v38 = v36;
        v39 = objc_msgSend(v35, "count");
        objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2114;
        v64 = v40;
        _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Confirmed %ld empty zones in container %{public}@", buf, 0x20u);

      }
      v41 = *(id **)(a1 + 32);
      v42 = *(id *)(a1 + 40);
      if (v41)
      {
        objc_msgSend(v35, "hk_map:", &__block_literal_global_188);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41[14], "beginTask");
        v44 = [HDCloudSyncModifyRecordZonesOperation alloc];
        objc_msgSend(v41, "configuration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:](v44, "initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:", v45, v42, 0, v43);

        *(_QWORD *)buf = v33;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_2;
        v64 = &unk_1E6CEBAB0;
        v65 = v42;
        v66 = v41;
        -[HDCloudSyncOperation setOnError:](v46, "setOnError:", buf);
        v61[0] = v33;
        v61[1] = 3221225472;
        v61[2] = __77__HDCloudSyncDeleteEmptyZonesOperation__deleteEmptyZones_container_database___block_invoke_3;
        v61[3] = &unk_1E6CE7778;
        v61[4] = v41;
        -[HDCloudSyncOperation setOnSuccess:](v46, "setOnSuccess:", v61);
        -[HDCloudSyncOperation start](v46, "start");

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");

      v17 = v52;
      goto LABEL_23;
    }
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      v47 = *(_QWORD *)(a1 + 32);
      v48 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v48;
      _os_log_fault_impl(&dword_1B7802000, v18, OS_LOG_TYPE_FAULT, "%{public}@ Something went wrong. Cache incorrectly claims to have empty zones %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 725, CFSTR("Cache incorrectly claims to have empty zones %@"), *(_QWORD *)(a1 + 56));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = *(id *)(a1 + 56);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v54 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          v24 = [HDCloudSyncZoneIdentifier alloc];
          objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v24, "initForZone:container:scope:", v23, v25, objc_msgSend(*(id *)(a1 + 48), "databaseScope"));

          v27 = [HDCloudSyncCachedZone alloc];
          objc_msgSend(*(id *)(a1 + 32), "configuration");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "repository");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "configuration");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "accessibilityAssertion");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v27, "initForZoneIdentifier:repository:accessibilityAssertion:", v26, v29, v31);

          objc_msgSend(v32, "handleCloudError:operation:container:database:", v50, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v20);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:", v50);
    v3 = 0;
  }
LABEL_24:

}

void __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_196(id *a1, void *a2, void *a3)
{
  id v5;
  HDCloudSyncZoneIdentifier *v6;
  void *v7;
  id v8;
  HDCloudSyncCachedZone *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = [HDCloudSyncZoneIdentifier alloc];
  objc_msgSend(a1[4], "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v6, "initForZone:container:scope:", v15, v7, objc_msgSend(a1[5], "databaseScope"));

  v9 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(a1[6], "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityAssertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v9, "initForZoneIdentifier:repository:accessibilityAssertion:", v8, v11, v13);

  objc_msgSend(v14, "handleCloudError:operation:container:database:", v5, a1[6], a1[4], a1[5]);
}

uint64_t __104__HDCloudSyncDeleteEmptyZonesOperation__validateZonesAreEmptyWithDeletionCandidates_container_database___block_invoke_203(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
