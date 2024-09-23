@implementation HDCloudSyncStateSyncOperation

- (HDCloudSyncStateSyncOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncStateSyncOperation)initWithConfiguration:(id)a3 containers:(id)a4
{
  id v7;
  HDCloudSyncStateSyncOperation *v8;
  NSMutableArray *v9;
  NSMutableArray *recordsToBeSaved;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncStateSyncOperation;
  v8 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v12, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recordsToBeSaved = v8->_recordsToBeSaved;
    v8->_recordsToBeSaved = v9;

    objc_storeStrong((id *)&v8->_containers, a4);
  }

  return v8;
}

- (void)main
{
  void *v3;
  void *v4;
  NSSet *containers;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  HDCloudSyncStateStore *v25;
  void *v26;
  HDCloudSyncStateStore *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  HDCloudSyncStateStore *v34;
  id v35;
  NSObject *v36;
  _QWORD *v37;
  id v38;
  void *v39;
  id v40;
  HDCloudSyncStateSyncOperation *v41;
  id v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  HDCloudSyncStateStore *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  uint8_t buf[4];
  HDCloudSyncStateSyncOperation *v61;
  __int16 v62;
  void *v63;
  uint8_t v64[4];
  HDCloudSyncStateSyncOperation *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedCloudState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  containers = self->_containers;
  v46 = 0;
  objc_msgSend(v4, "zonesByIdentifierForContainers:error:filter:", containers, &v46, &__block_literal_global_112);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v46;

  if (v6)
  {
    v38 = v7;
    v8 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __37__HDCloudSyncStateSyncOperation_main__block_invoke_190;
    v44[3] = &unk_1E6CEB718;
    v41 = self;
    v44[4] = self;
    v39 = v6;
    v45 = v6;
    v9 = v45;
    v10 = v44;
    v11 = objc_alloc_init(MEMORY[0x1E0D298C8]);
    v58[0] = v8;
    v58[1] = 3221225472;
    v58[2] = __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke;
    v58[3] = &unk_1E6CEA1D8;
    v37 = v10;
    v59 = v37;
    objc_msgSend(v11, "setDidFinish:", v58);
    objc_msgSend(v11, "beginTask");
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v12 = v9;
    v43 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v43)
    {
      v13 = *(_QWORD *)v55;
      v40 = v12;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v55 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v14);
          objc_msgSend(v11, "beginTask");
          objc_msgSend(v12, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "zoneIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0;
          v53 = 0;
          v18 = objc_msgSend(v17, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v53, &v52);
          v19 = v53;
          v20 = v52;

          if (v18)
            v21 = v20 == 0;
          else
            v21 = 1;
          if (v21)
          {
            v22 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to extract domain and sync circle identifier from %@."), v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "hk_error:description:", 738, v23);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            _HKInitializeLogging();
            v24 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v61 = v41;
              v62 = 2114;
              v63 = v31;
              _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Error processing zone :%{public}@", buf, 0x16u);
            }
            objc_msgSend(v11, "failTaskWithError:", v31);
          }
          else
          {
            v25 = [HDCloudSyncStateStore alloc];
            -[HDCloudSyncStateSyncOperation stateDataForStateSyncZone:](v16);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[HDCloudSyncStateStore initWithData:](v25, "initWithData:", v26);

            -[HDCloudSyncOperation configuration](v41, "configuration");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "repository");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "cloudSyncShimProvider");
            v42 = v19;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stateSyncShim");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            -[HDCloudSyncOperation configuration](v41, "configuration");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke_200;
            v47[3] = &unk_1E6CFA2F8;
            v47[4] = v41;
            v33 = v20;
            v48 = v33;
            v49 = v11;
            v50 = v27;
            v51 = v16;
            v34 = v27;
            v35 = v33;
            v19 = v42;
            objc_msgSend(v31, "mergeStateDataWithStore:domain:configuration:completion:", v34, v35, v32, v47);

            v12 = v40;
          }

          ++v14;
        }
        while (v43 != v14);
        v43 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v43);
    }

    objc_msgSend(v11, "finishTask");
    v7 = v38;
    v6 = v39;
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 739, CFSTR("No State Sync Zones present"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    _HKInitializeLogging();
    v36 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v64 = 138543618;
      v65 = self;
      v66 = 2114;
      v67 = v7;
      _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching state sync zones :%{public}@", v64, 0x16u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v7);
  }

}

BOOL __37__HDCloudSyncStateSyncOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 6;
}

void __37__HDCloudSyncStateSyncOperation_main__block_invoke_190(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
  id v8;
  HDCloudSyncModifyRecordsOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDCloudSyncModifyRecordsOperation *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id *v25;
  id v26;
  _BYTE buf[24];
  void *v28;
  id *v29;
  id v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = *(id **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    if (v7)
    {
      if (objc_msgSend(v7[13], "count"))
      {
        v9 = [HDCloudSyncModifyRecordsOperation alloc];
        objc_msgSend(v7, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "repository");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryCKContainer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v9, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v10, v13, v7[13], 0);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = MEMORY[0x1E0C809B0];
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke;
        v24 = &unk_1E6CEBAB0;
        v25 = v7;
        v17 = v8;
        v26 = v17;
        -[HDCloudSyncOperation setOnError:](v14, "setOnError:", &v21);
        *(_QWORD *)buf = v16;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke_210;
        v28 = &unk_1E6CEBAD8;
        v29 = v7;
        v30 = v15;
        v31 = v17;
        v18 = v15;
        -[HDCloudSyncOperation setOnSuccess:](v14, "setOnSuccess:", buf, v21, v22, v23, v24, v25);
        -[HDCloudSyncOperation start](v14, "start");

      }
      else
      {
        -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](v7, 1u, v8);
        objc_msgSend(v7, "finishWithSuccess:error:", 1, 0);
      }
    }

  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 738, CFSTR("Error processing state"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](*(void **)(a1 + 32), 0, *(void **)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v6);
  }

}

- (void)_notifyStateEntities:(void *)a3 stateSyncZones:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  NSObject *v20;
  HDCloudSyncStateStore *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HDCloudSyncStateStore *v26;
  id v27;
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  HDCloudSyncStateStore *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudSyncShimProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stateSyncShim");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v4;
    v8 = v4;
    v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v30)
    {
      v9 = a1;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "zoneIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v33 = 0;
          v14 = objc_msgSend(v13, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v33, &v32);
          v15 = v33;
          v16 = v32;

          if (v14)
            v17 = v16 == 0;
          else
            v17 = 1;
          if (v17)
          {
            v18 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to extract domain and sync circle identifier from %@."), v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hk_error:description:", 738, v19);
            v26 = (HDCloudSyncStateStore *)objc_claimAutoreleasedReturnValue();

            _HKInitializeLogging();
            v20 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v39 = v9;
              v40 = 2114;
              v41 = v26;
              _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying state entity :%{public}@", buf, 0x16u);
            }
          }
          else
          {
            v21 = [HDCloudSyncStateStore alloc];
            objc_msgSend(v8, "objectForKeyedSubscript:", v12);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncStateSyncOperation stateDataForStateSyncZone:](v22);
            v23 = v8;
            v24 = v9;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[HDCloudSyncStateStore initWithData:](v21, "initWithData:", v25);

            v9 = v24;
            v8 = v23;

            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __69__HDCloudSyncStateSyncOperation__notifyStateEntities_stateSyncZones___block_invoke;
            v31[3] = &unk_1E6CE77C8;
            v31[4] = v9;
            objc_msgSend(v29, "syncDidFinishWithResult:domain:stateStore:completion:", a2, v16, v26, v31);
          }

        }
        v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v30);
    }

    v4 = v27;
  }

}

void __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if ((a3 & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(a4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

  }
}

- (id)stateDataForStateSyncZone:(void *)a1
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_opt_class();
  v10 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HDCloudSyncStateSyncOperation_stateDataForStateSyncZone___block_invoke;
  v8[3] = &unk_1E6CFA348;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v2, "recordsForClass:epoch:error:enumerationHandler:", v4, 0, &v10, v8);

  v6 = v10;
  return v5;
}

void __69__HDCloudSyncStateSyncOperation__performStateSyncInZones_completion___block_invoke_200(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  _UNKNOWN **v25;
  id *v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  id *v58;
  void *v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  id *v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id *v69;
  void *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  _QWORD v75[5];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  id *v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  uint8_t v86[4];
  id *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(id **)(a1 + 32);
    v7 = *(void **)(a1 + 56);
    v8 = *(void **)(a1 + 64);
    v74 = 0;
    v9 = v7;
    v10 = v8;
    v69 = v6;
    if (!v6)
      goto LABEL_56;
    objc_msgSend(v9, "mergedData");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_49;
    v12 = (void *)v11;
    objc_msgSend(v9, "mergedData");
    v68 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v10 = v68;
    if (!v14)
    {
LABEL_49:
      _HKInitializeLogging();
      v57 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v86 = 138543618;
        v87 = v69;
        v88 = 2114;
        v89 = v9;
        _os_log_debug_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEBUG, "%{public}@: Store %{public}@ has no data to be pushed", v86, 0x16u);
      }
      LOBYTE(v6) = 1;
      goto LABEL_56;
    }
    v15 = v69[14];
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v15, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v65 = a1;
        v66 = v5;
        objc_msgSend(v69, "configuration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "repository");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "primaryCKContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "containerIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v16, "containerIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v20);

          v10 = v68;
          if ((v22 & 1) != 0)
          {
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            objc_msgSend(v9, "mergedData");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "allKeys");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
            if (!v73)
            {
              v71 = 1;
              goto LABEL_64;
            }
            v71 = 1;
            v25 = &off_1E6CE2000;
            v72 = *(_QWORD *)v77;
            v26 = v69;
            v70 = v24;
            v67 = v9;
            while (1)
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v77 != v72)
                  objc_enumerationMutation(v24);
                v28 = *(id **)(*((_QWORD *)&v76 + 1) + 8 * v27);
                v29 = objc_opt_class();
                v75[0] = MEMORY[0x1E0C809B0];
                v75[1] = 3221225472;
                v75[2] = __74__HDCloudSyncStateSyncOperation__updateRecordsToSaveWithStore_zone_error___block_invoke;
                v75[3] = &unk_1E6CFA320;
                v75[4] = v28;
                objc_msgSend(v10, "recordsForClass:error:filter:", v29, &v74, v75);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v30;
                if (!v30)
                {
                  v71 = 0;
                  goto LABEL_41;
                }
                if ((unint64_t)objc_msgSend(v30, "count") >= 2)
                {
                  _HKInitializeLogging();
                  v32 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v81 = v28;
                    _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Expected one record per key. Multiple records for key: %@", buf, 0xCu);
                  }
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 738, CFSTR("Expected one record per key. Multiple records for key: %@"), v28);
                  v33 = (id)objc_claimAutoreleasedReturnValue();
                  if (v33)
                  {
                    v34 = objc_retainAutorelease(v33);
                    v71 = 0;
                    v74 = v34;
                    v35 = v34;
                  }
                  else
                  {
                    v34 = 0;
                    v35 = 0;
                    v71 = 0;
                  }
                  goto LABEL_39;
                }
                objc_msgSend(v9, "mergedData");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "objectForKeyedSubscript:", v28);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v35)
                {
                  _HKInitializeLogging();
                  v44 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v81 = v28;
                    _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "Nil merged data for key %@", buf, 0xCu);
                  }
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 738, CFSTR("Nil merged data for key %@"), v28);
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  if (v45)
                  {
                    v46 = objc_retainAutorelease(v45);
                    v71 = 0;
                    v74 = v46;
                    v34 = v46;
                  }
                  else
                  {
                    v46 = 0;
                    v34 = 0;
                    v71 = 0;
                  }
                  goto LABEL_38;
                }
                if ((unint64_t)objc_msgSend(v35, "length") >> 11 >= 0x19)
                {
                  _HKInitializeLogging();
                  v37 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    v53 = v37;
                    v54 = objc_msgSend(v35, "length");
                    *(_DWORD *)buf = 138543874;
                    v81 = v26;
                    v82 = 2050;
                    v83 = v54;
                    v84 = 2050;
                    v85 = 51200;
                    _os_log_error_impl(&dword_1B7802000, v53, OS_LOG_TYPE_ERROR, "[%{public}@] Record size: %{public}lu exceeds soft size limit: %{public}lu", buf, 0x20u);

                  }
                  objc_msgSend(v26, "profile");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "daemon");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "analyticsSubmissionCoordinator");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "stateSync_recordSize:", objc_msgSend(v35, "length"));

                  v24 = v70;
                  v25 = &off_1E6CE2000;
                }
                if (!objc_msgSend(v31, "count"))
                {
                  v47 = v25[492];
                  objc_msgSend(v9, "mergedData");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "objectForKeyedSubscript:", v28);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "zoneIdentifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "zoneIdentifier");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "recordWithStateData:zoneID:recordIdentifier:error:", v49, v51, v28, &v74);
                  v34 = (id)objc_claimAutoreleasedReturnValue();

                  v26 = v69;
                  v10 = v68;

                  v9 = v67;
                  v24 = v70;
                  if (!v34)
                  {
                    v71 = 0;
                    v25 = &off_1E6CE2000;
                    goto LABEL_40;
                  }
                  goto LABEL_35;
                }
                objc_msgSend(v31, "firstObject");
                v41 = objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v34 = (id)v41;
                  objc_msgSend(v9, "mergedData");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "objectForKeyedSubscript:", v28);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setStateData:", v43);

LABEL_35:
                  v52 = v26[13];
                  objc_msgSend(v34, "record");
                  v46 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "addObject:", v46);
                  v25 = &off_1E6CE2000;
LABEL_38:

LABEL_39:
                  goto LABEL_40;
                }
                v71 = 0;
LABEL_40:

LABEL_41:
                ++v27;
              }
              while (v73 != v27);
              v55 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
              v73 = v55;
              if (!v55)
              {
LABEL_64:

                a1 = v65;
                v5 = v66;
                LOBYTE(v6) = v71;
                goto LABEL_56;
              }
            }
          }
          goto LABEL_54;
        }
      }

      v10 = v68;
    }

LABEL_54:
    _HKInitializeLogging();
    v60 = *MEMORY[0x1E0CB5370];
    LOBYTE(v6) = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v86 = 138543618;
      v87 = v69;
      v88 = 2114;
      v89 = v9;
      _os_log_impl(&dword_1B7802000, v60, OS_LOG_TYPE_INFO, "%{public}@: Store %{public}@ is from a secondary container which is not pushed.", v86, 0x16u);
    }
LABEL_56:

    v61 = v74;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "finishTask");
    }
    else
    {
      _HKInitializeLogging();
      v62 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v63 = *(id **)(a1 + 32);
        v64 = *(void **)(a1 + 40);
        *(_DWORD *)v86 = 138543874;
        v87 = v63;
        v88 = 2114;
        v89 = v61;
        v90 = 2114;
        v91 = v64;
        _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "%{public}@: Error creating record %{public}@ for %{public}@", v86, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 48), "failTaskWithError:", v61);
    }

    goto LABEL_62;
  }
  _HKInitializeLogging();
  v56 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v58 = *(id **)(a1 + 32);
    v59 = *(void **)(a1 + 40);
    *(_DWORD *)v86 = 138543874;
    v87 = v58;
    v88 = 2114;
    v89 = v59;
    v90 = 2114;
    v91 = v5;
    _os_log_error_impl(&dword_1B7802000, v56, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Ignorable failure to update data %{public}@", v86, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 48), "finishTask");
LABEL_62:

}

uint64_t __74__HDCloudSyncStateSyncOperation__updateRecordsToSaveWithStore_zone_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

void __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v5;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to modify records: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyticsSubmissionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stateSync_operationFailed:error:", v6, v5);

  -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](*(void **)(a1 + 32), 0, *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v5);

}

uint64_t __66__HDCloudSyncStateSyncOperation__pushUpdatedStateRecordsForZones___block_invoke_210(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v3, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsSubmissionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "timeIntervalSinceNow");
  objc_msgSend(v7, "stateSync_triggerDuration:");

  objc_msgSend(a1[4], "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyticsSubmissionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stateSync_operationSucceeded:", v4);

  -[HDCloudSyncStateSyncOperation _notifyStateEntities:stateSyncZones:](a1[4], 1u, a1[6]);
  return objc_msgSend(a1[4], "finishWithSuccess:error:", 1, 0);
}

void __69__HDCloudSyncStateSyncOperation__notifyStateEntities_stateSyncZones___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying state entity :%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

uint64_t __59__HDCloudSyncStateSyncOperation_stateDataForStateSyncZone___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Expected one record per key. Multiple records for key: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 738, CFSTR("Expected one record per key. Multiple records for key: %@"), v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(v6, "hasStateData") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No state data or state data asset url in %@"), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_error:description:", 738, v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    goto LABEL_16;
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "stateData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v7);

  v13 = 1;
LABEL_17:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_recordsToBeSaved, 0);
}

@end
