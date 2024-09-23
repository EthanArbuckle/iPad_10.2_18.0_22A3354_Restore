@implementation HDCloudSyncDeleteStoresOperation

- (HDCloudSyncDeleteStoresOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncDeleteStoresOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 storeRecordsToDelete:(id)a5
{
  id v8;
  HDCloudSyncDeleteStoresOperation *v9;
  uint64_t v10;
  NSArray *storeRecordsToDelete;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncDeleteStoresOperation;
  v9 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    storeRecordsToDelete = v9->_storeRecordsToDelete;
    v9->_storeRecordsToDelete = (NSArray *)v10;

  }
  return v9;
}

- (void)main
{
  HDCloudSyncDeleteStoresOperation *v2;
  HDSynchronousTaskGroup *v3;
  HDSynchronousTaskGroup *taskGroup;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HDCloudSyncDeleteZonesOperation *v14;
  void *v15;
  void *v16;
  HDCloudSyncDeleteZonesOperation *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t i;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HDCloudSyncDeleteStoresOperation *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  HDCloudSyncModifyRecordsOperation *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  HDCloudSyncModifyRecordsOperation *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  NSArray *obj;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[5];
  _QWORD v108[4];
  id v109;
  HDCloudSyncDeleteStoresOperation *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  id v116;
  id v117;
  id v118[16];
  void *v119;
  _BYTE buf[24];
  void *v121;
  HDCloudSyncDeleteStoresOperation *v122;
  id v123;
  uint64_t v124;

  v2 = self;
  v124 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_storeRecordsToDelete, "count"))
  {
    v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v2->_taskGroup;
    v2->_taskGroup = v3;

    -[HDSynchronousTaskGroup setDelegate:](v2->_taskGroup, "setDelegate:", v2);
    -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
    -[NSArray hk_mapToSet:](v2->_storeRecordsToDelete, "hk_mapToSet:", &__block_literal_global_45);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedCloudState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = 0;
    objc_msgSend(v7, "zonesByIdentifierWithError:", v118);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v118[0];

    if (v8 || !v9)
    {
      if (!v8)
      {
        _HKInitializeLogging();
        v12 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v2;
          _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ No cached zones found.", buf, 0xCu);
        }
      }
      objc_msgSend(v8, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __60__HDCloudSyncDeleteStoresOperation__individualZonesToDelete__block_invoke_187;
      v121 = &unk_1E6CEED10;
      v122 = v2;
      v123 = v5;
      objc_msgSend(v13, "hk_map:", buf);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zones, %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v9);
      v11 = 0;
    }

    if (objc_msgSend(v11, "count"))
    {
      -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
      v14 = [HDCloudSyncDeleteZonesOperation alloc];
      -[HDCloudSyncOperation configuration](v2, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation cloudState](v2, "cloudState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HDCloudSyncDeleteZonesOperation initWithConfiguration:cloudState:](v14, "initWithConfiguration:cloudState:", v15, v16);

      -[HDCloudSyncDeleteZonesOperation setZonesToDelete:](v17, "setZonesToDelete:", v11);
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = objc_msgSend(v11, "count");
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2112;
        v121 = v21;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld individual sync zones: %@", buf, 0x20u);

      }
      v22 = (void *)MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke;
      v121 = &unk_1E6CE77A0;
      v122 = v2;
      -[HDCloudSyncOperation setOnError:](v17, "setOnError:", buf);
      v118[0] = v22;
      v118[1] = (id)3221225472;
      v118[2] = __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke_2;
      v118[3] = &unk_1E6CE7778;
      v118[4] = v2;
      -[HDCloudSyncOperation setOnSuccess:](v17, "setOnSuccess:", v118);
      -[HDCloudSyncOperation start](v17, "start");

    }
    -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "repository");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allCKContainers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
    if (v92)
    {
      v26 = 0x1E0CB3000uLL;
      v91 = *(_QWORD *)v104;
      v85 = v25;
      do
      {
        for (i = 0; i != v92; i = v40 + 1)
        {
          if (*(_QWORD *)v104 != v91)
            objc_enumerationMutation(v25);
          v96 = i;
          v28 = *(id *)(*((_QWORD *)&v103 + 1) + 8 * i);
          -[HDCloudSyncOperation configuration](v2, "configuration");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "repository");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "cachedOwnerIdentifierForContainer:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "string");
          v32 = objc_claimAutoreleasedReturnValue();

          v102 = (void *)v32;
          if (v32)
          {
            -[NSArray hk_mapToSet:](v2->_storeRecordsToDelete, "hk_mapToSet:", &__block_literal_global_200_0);
            v95 = objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation configuration](v2, "configuration");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "cachedCloudState");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v28;
            objc_msgSend(v28, "containerIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = 0;
            objc_msgSend(v34, "unifiedSyncZoneForContainerID:error:", v35, &v117);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = v117;

            v38 = (void *)v36;
            v93 = v37;
            if (v36 || !v37)
            {
              v41 = (void *)v95;
              v40 = v96;
              if (v38)
              {
                v43 = objc_opt_class();
                v116 = 0;
                v89 = v38;
                objc_msgSend(v38, "recordsForClass:error:", v43, &v116);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v116;
                v90 = v44;
                if (v44 || !v45)
                {
                  v87 = v45;
                  if ((unint64_t)objc_msgSend(v44, "count") >= 2)
                  {
                    _HKInitializeLogging();
                    v49 = (void *)*MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
                    {
                      v81 = v49;
                      objc_msgSend(v38, "zoneIdentifier");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      *(_QWORD *)&buf[4] = v2;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v82;
                      _os_log_fault_impl(&dword_1B7802000, v81, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@. This is unexpected.", buf, 0x16u);

                    }
                  }
                  objc_msgSend(v90, "firstObject");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_opt_class();
                  v115 = 0;
                  objc_msgSend(v89, "recordsForClass:error:", v51, &v115);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = v115;
                  v88 = v52;
                  if (v52 || !v53)
                  {
                    v86 = v53;
                    objc_msgSend(v52, "hk_mapToSet:", &__block_literal_global_204);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v57, "intersectsSet:", v95))
                    {
                      v100 = v50;
                      v99 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      v111 = 0u;
                      v112 = 0u;
                      v113 = 0u;
                      v114 = 0u;
                      obj = v2->_storeRecordsToDelete;
                      v58 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v111, buf, 16);
                      if (v58)
                      {
                        v59 = v58;
                        v60 = *(_QWORD *)v112;
                        v97 = v57;
                        v98 = *(_QWORD *)v112;
                        do
                        {
                          for (j = 0; j != v59; ++j)
                          {
                            if (*(_QWORD *)v112 != v60)
                              objc_enumerationMutation(obj);
                            v62 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
                            objc_msgSend(v62, "storeIdentifier");
                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v57, "containsObject:", v63))
                            {
                              -[HDCloudSyncOperation configuration](v2, "configuration");
                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v64, "repository");
                              v65 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v65, "syncIdentityManager");
                              v66 = v2;
                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v67, "currentSyncIdentity");
                              v68 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v68, "identity");
                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v100, "removeStoreIdentifier:ownerIdentifier:syncIdentity:", v63, v102, v69);

                              v2 = v66;
                              v57 = v97;
                              objc_msgSend(v62, "recordID");
                              v70 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v99, "addObject:", v70);

                              v60 = v98;
                            }

                          }
                          v59 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v111, buf, 16);
                        }
                        while (v59);
                      }

                      -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
                      v71 = [HDCloudSyncModifyRecordsOperation alloc];
                      -[HDCloudSyncOperation configuration](v2, "configuration");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v100)
                      {
                        objc_msgSend(v100, "record");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        v119 = v73;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        v75 = v94;
                        v76 = v99;
                        v77 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v71, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v72, v94, v74, v99);

                      }
                      else
                      {
                        v75 = v94;
                        v76 = v99;
                        v77 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v71, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v72, v94, MEMORY[0x1E0C9AA60], v99);
                      }
                      v25 = v85;
                      v26 = 0x1E0CB3000;

                      v78 = MEMORY[0x1E0C809B0];
                      v108[0] = MEMORY[0x1E0C809B0];
                      v108[1] = 3221225472;
                      v108[2] = __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_2;
                      v108[3] = &unk_1E6CEBAB0;
                      v109 = v75;
                      v110 = v2;
                      -[HDCloudSyncOperation setOnError:](v77, "setOnError:", v108);
                      v107[0] = v78;
                      v107[1] = 3221225472;
                      v107[2] = __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_208;
                      v107[3] = &unk_1E6CE7778;
                      v107[4] = v2;
                      -[HDCloudSyncOperation setOnSuccess:](v77, "setOnSuccess:", v107);
                      -[HDCloudSyncOperation start](v77, "start");

                      v41 = (void *)v95;
                      v40 = v96;
                      v50 = v100;
                    }

                    v56 = v86;
                  }
                  else
                  {
                    v54 = v53;
                    _HKInitializeLogging();
                    v55 = (void *)*MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                    {
                      v83 = v55;
                      objc_msgSend(v89, "zoneIdentifier");
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v2;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v84;
                      *(_WORD *)&buf[22] = 2114;
                      v121 = v54;
                      _os_log_error_impl(&dword_1B7802000, v83, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

                      v41 = (void *)v95;
                      v40 = v96;

                    }
                    v56 = v54;
                    -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v54);
                  }

                  v48 = v87;
                }
                else
                {
                  v46 = v45;
                  _HKInitializeLogging();
                  v47 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    v79 = v47;
                    objc_msgSend(v38, "zoneIdentifier");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v2;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v80;
                    *(_WORD *)&buf[22] = 2114;
                    v121 = v46;
                    _os_log_error_impl(&dword_1B7802000, v79, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);

                  }
                  v48 = v46;
                  -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v46);
                }

                v38 = v89;
              }
            }
            else
            {
              _HKInitializeLogging();
              v39 = *MEMORY[0x1E0CB5370];
              v40 = v96;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v2;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v37;
                _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
              }
              -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v37);
              v41 = (void *)v95;
            }

            v42 = v94;
          }
          else
          {
            objc_msgSend(*(id *)(v26 + 1480), "hk_error:class:selector:format:", 3, objc_opt_class(), sel__deleteUnifiedZoneStoresInContainer_, CFSTR("No cached owner identifier for %@"), v28);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v41);
            v42 = v28;
            v40 = v96;
          }

        }
        v92 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
      }
      while (v92);
    }

    -[HDSynchronousTaskGroup finishTask](v2->_taskGroup, "finishTask");
    -[HDSynchronousTaskGroup finishTask](v2->_taskGroup, "finishTask");
  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 1, 0);
  }
}

uint64_t __60__HDCloudSyncDeleteStoresOperation__individualZonesToDelete__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeIdentifier");
}

id __60__HDCloudSyncDeleteStoresOperation__individualZonesToDelete__block_invoke_187(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "zoneType") == 1)
  {
    v21 = 0;
    objc_msgSend(v3, "recordsForClass:error:", objc_opt_class(), &v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v21;
    v6 = v5;
    if (v4)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {
      if ((unint64_t)objc_msgSend(v4, "count") >= 2)
      {
        _HKInitializeLogging();
        v8 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = v8;
          objc_msgSend(v3, "zoneIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v18;
          v24 = 2114;
          v25 = v20;
          _os_log_fault_impl(&dword_1B7802000, v19, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple store records for %{public}@. This is unexpected.", buf, 0x16u);

        }
      }
      objc_msgSend(v4, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "storeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10))
      {
        objc_msgSend(v3, "zoneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = v12;
        objc_msgSend(v3, "zoneIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        v24 = 2114;
        v25 = v17;
        v26 = 2114;
        v27 = v6;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v6);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:");
}

uint64_t __63__HDCloudSyncDeleteStoresOperation__deleteIndividualZoneStores__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

uint64_t __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeIdentifier");
}

uint64_t __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_202(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeIdentifier");
}

void __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    objc_msgSend(v6, "containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Failed to delete store records and update registry in container %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "failTaskWithError:", v4);

}

uint64_t __72__HDCloudSyncDeleteStoresOperation__deleteUnifiedZoneStoresInContainer___block_invoke_208(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  id v6;

  if (a4)
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0, a5);
  }
  else
  {
    objc_msgSend(a5, "firstObject", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v6);

  }
}

- (NSArray)storeRecordsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeRecordsToDelete, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
