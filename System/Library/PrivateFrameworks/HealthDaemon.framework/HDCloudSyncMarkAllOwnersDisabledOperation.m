@implementation HDCloudSyncMarkAllOwnersDisabledOperation

- (void)main
{
  HDSynchronousTaskGroup *v3;
  HDSynchronousTaskGroup *taskGroup;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  HDCloudSyncMarkAllOwnersDisabledOperation *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  HDCloudSyncModifyRecordsOperation *v50;
  void *v51;
  HDCloudSyncModifyRecordsOperation *v52;
  uint64_t v53;
  void *v54;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  id obj;
  id obja;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[6];
  _QWORD v66[6];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint8_t v83[128];
  _BYTE buf[24];
  void *v85;
  __int128 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedCloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v6, "zonesByIdentifierWithError:", &v80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v80;

  if (!v7 && v8)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers, %{public}@", buf, 0x16u);
    }
    v10 = self;
    v11 = 0;
    v12 = v8;
LABEL_47:
    -[HDCloudSyncOperation finishWithSuccess:error:](v10, "finishWithSuccess:error:", v11, v12);
    goto LABEL_48;
  }
  if (!v7)
  {
    _HKInitializeLogging();
    v56 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_debug_impl(&dword_1B7802000, v56, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found.", buf, 0xCu);
    }
    v10 = self;
    v11 = 1;
    v12 = 0;
    goto LABEL_47;
  }
  v59 = v8;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v7, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
  v60 = v7;
  if (v14)
  {
    v15 = v14;
    v63 = *(_QWORD *)v77;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v77 != v63)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v18 = objc_opt_class();
        v75 = 0;
        objc_msgSend(v17, "recordsForClass:error:", v18, &v75);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v75;
        v21 = v20;
        if (v19)
          v22 = 1;
        else
          v22 = v20 == 0;
        if (!v22)
        {
          _HKInitializeLogging();
          v54 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v57 = v54;
            objc_msgSend(v17, "zoneIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v58;
            *(_WORD *)&buf[22] = 2114;
            v85 = v21;
            _os_log_error_impl(&dword_1B7802000, v57, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

          }
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v21);

          goto LABEL_43;
        }
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v23 = v19;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v72 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "ownerIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
          }
          while (v25);
        }

        v7 = v60;
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "repository");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allCKContainers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  obja = v31;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
  if (v32)
  {
    v33 = v32;
    v64 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v68 != v64)
          objc_enumerationMutation(obja);
        v35 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
        -[HDCloudSyncOperation configuration](self, "configuration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "repository");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "profileIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        HDDatabaseForContainer(v35, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v39, "databaseScope") == 2)
        {
          objc_msgSend(v7, "allValues");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v35;
          v42 = v13;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __104__HDCloudSyncMarkAllOwnersDisabledOperation__updatedRecordsForContainer_zones_disabledOwnerIdentifiers___block_invoke;
          v85 = &unk_1E6D10540;
          v43 = v41;
          *(_QWORD *)&v86 = v43;
          *((_QWORD *)&v86 + 1) = self;
          v44 = v42;
          v87 = v44;
          objc_msgSend(v40, "hk_map:", buf);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v45, "count"))
          {
            -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
            _HKInitializeLogging();
            v46 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v47 = v46;
              v48 = objc_msgSend(v45, "count");
              objc_msgSend(v43, "containerIdentifier");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2114;
              v85 = v49;
              LOWORD(v86) = 2114;
              *(_QWORD *)((char *)&v86 + 2) = v45;
              _os_log_impl(&dword_1B7802000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld records in %{public}@: %{public}@", buf, 0x2Au);

            }
            v50 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v50, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v51, v43, v45, 0);

            v53 = MEMORY[0x1E0C809B0];
            v66[0] = MEMORY[0x1E0C809B0];
            v66[1] = 3221225472;
            v66[2] = __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke;
            v66[3] = &unk_1E6CEBAB0;
            v66[4] = self;
            v66[5] = v43;
            -[HDCloudSyncOperation setOnError:](v52, "setOnError:", v66);
            v65[0] = v53;
            v65[1] = 3221225472;
            v65[2] = __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke_187;
            v65[3] = &unk_1E6CE98F8;
            v65[4] = self;
            v65[5] = v43;
            -[HDCloudSyncOperation setOnSuccess:](v52, "setOnSuccess:", v65);
            -[HDCloudSyncOperation start](v52, "start");

            v7 = v60;
          }

        }
      }
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    }
    while (v33);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
LABEL_43:
  v8 = v59;

LABEL_48:
}

void __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed updating records in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:", v4);

}

uint64_t __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke_187(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished saving updated records in %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

id __104__HDCloudSyncMarkAllOwnersDisabledOperation__updatedRecordsForContainer_zones_disabledOwnerIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HDCloudSyncMasterRecord *v42;
  void *v43;
  void *v44;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  HDCloudSyncRegistryRecord *v57;
  void *v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v3, "zoneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    if (v9 == 2)
    {
      v20 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v21 = *(void **)(a1 + 48);
      v13 = v3;
      v22 = v20;
      v23 = v21;
      if (v11)
      {
        v60 = 0;
        objc_msgSend(v13, "recordsForClass:error:", objc_opt_class(), &v60);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v60;
        v26 = v25;
        if (v24 || !v25)
        {
          if ((unint64_t)objc_msgSend(v24, "count") >= 2)
          {
            _HKInitializeLogging();
            v33 = (void *)*MEMORY[0x1E0CB5300];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_FAULT))
            {
              v53 = v33;
              objc_msgSend(v13, "zoneIdentifier");
              v54 = v23;
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v62 = v11;
              v63 = 2114;
              v64 = v22;
              v65 = 2114;
              v66 = v55;
              _os_log_fault_impl(&dword_1B7802000, v53, OS_LOG_TYPE_FAULT, "%{public}@ Fetched multiple Registry records from the cached container %{public}@, zone %{public}@. This is unexpected", buf, 0x20u);

              v23 = v54;
            }
          }
          objc_msgSend(v24, "firstObject");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            v57 = [HDCloudSyncRegistryRecord alloc];
            objc_msgSend(v13, "zoneIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "zoneIdentifier");
            v59 = v22;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "configuration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "repository");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "profile");
            v37 = v23;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "profileIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[HDCloudSyncRegistryRecord initInZone:ownerProfileIdentifier:](v57, "initInZone:ownerProfileIdentifier:", v56, v39);

            v23 = v37;
            v22 = v59;

          }
          objc_msgSend(v34, "disabledOwnerIdentifiers");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setByAddingObjectsFromSet:", v23);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setDisabledOwnerIdentifiers:", v41);

          objc_msgSend(v34, "record");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          _HKInitializeLogging();
          v27 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v48 = v27;
            objc_msgSend(v13, "zoneIdentifier");
            v49 = v23;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v11;
            v63 = 2114;
            v64 = v50;
            v65 = 2114;
            v66 = v26;
            _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get Registry records for %{public}@, %{public}@", buf, 0x20u);

            v23 = v49;
          }
          objc_msgSend(v11, "finishWithSuccess:error:", 0, v26);
          v11 = 0;
        }

      }
      goto LABEL_34;
    }
    if (!v9)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v12 = *(void **)(a1 + 48);
      v13 = v3;
      v14 = v10;
      v15 = v12;
      if (v11)
      {
        v60 = 0;
        objc_msgSend(v13, "recordsForClass:error:", objc_opt_class(), &v60);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v60;
        v18 = v17;
        if (v16 || !v17)
        {
          if ((unint64_t)objc_msgSend(v16, "count") >= 2)
          {
            _HKInitializeLogging();
            v28 = (void *)*MEMORY[0x1E0CB5300];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_FAULT))
            {
              v51 = v28;
              objc_msgSend(v13, "zoneIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v62 = v11;
              v63 = 2114;
              v64 = v14;
              v65 = 2114;
              v66 = v52;
              _os_log_fault_impl(&dword_1B7802000, v51, OS_LOG_TYPE_FAULT, "%{public}@ Fetched multiple Master records from the cached container %{public}@, zone %{public}@. This is unexpected", buf, 0x20u);

            }
          }
          objc_msgSend(v16, "firstObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = v29;
            objc_msgSend(v29, "disabledOwnerIdentifiers");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setByAddingObjectsFromSet:", v15);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setDisabledOwnerIdentifiers:", v32);

          }
          else
          {
            v42 = [HDCloudSyncMasterRecord alloc];
            objc_msgSend(v13, "zoneIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "zoneIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[HDCloudSyncMasterRecord initInZone:disabledOwnerIdentifiers:](v42, "initInZone:disabledOwnerIdentifiers:", v44, v15);

          }
          objc_msgSend(v30, "record");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          _HKInitializeLogging();
          v19 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v46 = v19;
            objc_msgSend(v13, "zoneIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v11;
            v63 = 2114;
            v64 = v47;
            v65 = 2114;
            v66 = v18;
            _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get Master records for %{public}@, %{public}@", buf, 0x20u);

          }
          objc_msgSend(v11, "finishWithSuccess:error:", 0, v18);
          v11 = 0;
        }

      }
LABEL_34:

      goto LABEL_35;
    }
  }
  v11 = 0;
LABEL_35:

  return v11;
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
