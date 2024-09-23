@implementation HDCloudSyncRepairStoreRecordsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  HDSynchronousTaskGroup *v3;
  HDSynchronousTaskGroup *taskGroup;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allCKContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "privateCloudDatabase");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncRepairStoreRecordsOperation _repairRecordsForContainer:database:](self, v12, v13);

        objc_msgSend(v12, "sharedCloudDatabase");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncRepairStoreRecordsOperation _repairRecordsForContainer:database:](self, v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

- (void)_repairRecordsForContainer:(void *)a3 database:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  os_log_t *v18;
  uint64_t v19;
  id v20;
  HDCloudSyncCachedZone *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  os_log_t v41;
  NSObject *v42;
  void *v43;
  os_log_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  os_log_t v65;
  NSObject *v67;
  void *v68;
  id v69;
  os_log_t *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id *v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  void *v82;
  os_log_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  HDCloudSyncModifyRecordsOperation *v87;
  void *v88;
  HDCloudSyncModifyRecordsOperation *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id obj;
  void *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  NSObject *v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  id v128;
  _BYTE v129[128];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint8_t v134[32];
  __int128 v135;
  __int128 v136;
  uint8_t v137[4];
  uint64_t v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  uint8_t buf[4];
  void *v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  id v148;
  __int16 v149;
  id v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedCloudState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = 0;
    objc_msgSend(v9, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v10, objc_msgSend(v6, "databaseScope"), &v122);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v122;

    v99 = v12;
    v93 = v11;
    if (!v11 && v12)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5370];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
LABEL_74:

        goto LABEL_75;
      }
      v14 = v13;
      objc_msgSend(v5, "containerIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "databaseScope");
      CKDatabaseScopeString();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v144 = a1;
      v145 = 2114;
      v146 = (uint64_t)v15;
      v147 = 2114;
      v148 = v16;
      v149 = 2114;
      v150 = v12;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get zone identifiers for container %{public}@, database %{public}@, %{public}@", buf, 0x2Au);
      goto LABEL_77;
    }
    if (!v11)
    {
      _HKInitializeLogging();
      v91 = (void *)*MEMORY[0x1E0CB5370];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        goto LABEL_74;
      v14 = v91;
      objc_msgSend(v5, "containerIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "databaseScope");
      CKDatabaseScopeString();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v144 = a1;
      v145 = 2114;
      v146 = (uint64_t)v15;
      v147 = 2114;
      v148 = v16;
      _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ No zones cached for container %{public}@, database %{public}@", buf, 0x20u);
LABEL_77:

LABEL_72:
      goto LABEL_74;
    }
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    obj = v11;
    v17 = v5;
    v94 = v7;
    v95 = v5;
    v92 = v6;
    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v129, 16);
    if (!v100)
    {
LABEL_57:

      v14 = v7;
      v5 = v17;
      v16 = v17;
      v6 = v92;
      v69 = v92;
      if (v14 && -[NSObject count](v14, "count"))
      {
        _HKInitializeLogging();
        v70 = (os_log_t *)MEMORY[0x1E0CB5370];
        v71 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v72 = v71;
          v73 = -[NSObject count](v14, "count");
          objc_msgSend(v16, "containerIdentifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          HDCKDatabaseScopeToString(objc_msgSend(v69, "databaseScope"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v144 = a1;
          v145 = 2048;
          v146 = v73;
          v147 = 2114;
          v148 = v74;
          v149 = 2114;
          v150 = v75;
          _os_log_impl(&dword_1B7802000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld repaired records in %{public}@:%{public}@", buf, 0x2Au);

        }
        v112 = v69;
        v114 = v16;
        v76 = (id *)a1;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v116 = v14;
        v77 = v14;
        v78 = -[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v130, buf, 16);
        if (v78)
        {
          v79 = v78;
          v80 = *(_QWORD *)v131;
          do
          {
            for (i = 0; i != v79; ++i)
            {
              if (*(_QWORD *)v131 != v80)
                objc_enumerationMutation(v77);
              v82 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
              _HKInitializeLogging();
              v83 = *v70;
              if (os_log_type_enabled(*v70, OS_LOG_TYPE_DEFAULT))
              {
                v84 = v83;
                objc_msgSend(v82, "recordID");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v134 = 138543618;
                *(_QWORD *)&v134[4] = v76;
                *(_WORD *)&v134[12] = 2114;
                *(_QWORD *)&v134[14] = v85;
                _os_log_impl(&dword_1B7802000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@: Repaired %{public}@", v134, 0x16u);

              }
            }
            v79 = -[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v130, buf, 16);
          }
          while (v79);
        }

        objc_msgSend(v76[13], "beginTask");
        -[NSObject hk_map:](v77, "hk_map:", &__block_literal_global_177);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = [HDCloudSyncModifyRecordsOperation alloc];
        objc_msgSend(v76, "configuration");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v114;
        v89 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v87, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v88, v114, v86, 0);

        v90 = MEMORY[0x1E0C809B0];
        *(_QWORD *)v134 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v134[8] = 3221225472;
        *(_QWORD *)&v134[16] = __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_2;
        *(_QWORD *)&v134[24] = &unk_1E6CE77A0;
        *(_QWORD *)&v135 = v76;
        -[HDCloudSyncOperation setOnError:](v89, "setOnError:", v134);
        *(_QWORD *)&v123 = v90;
        *((_QWORD *)&v123 + 1) = 3221225472;
        *(_QWORD *)&v124 = __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_3;
        *((_QWORD *)&v124 + 1) = &unk_1E6CE7778;
        *(_QWORD *)&v125 = v76;
        -[HDCloudSyncOperation setOnSuccess:](v89, "setOnSuccess:", &v123);
        -[HDCloudSyncOperation start](v89, "start");

        v7 = v94;
        v5 = v95;
        v6 = v92;
        v12 = v99;
        v14 = v116;
        v69 = v112;
      }

      goto LABEL_72;
    }
    v98 = *(_QWORD *)v119;
    v18 = (os_log_t *)MEMORY[0x1E0CB5370];
    v103 = (uint64_t)a1;
LABEL_9:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v119 != v98)
        objc_enumerationMutation(obj);
      v102 = v19;
      v20 = *(id *)(*((_QWORD *)&v118 + 1) + 8 * v19);
      v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = [HDCloudSyncCachedZone alloc];
      objc_msgSend(a1, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "repository");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "accessibilityAssertion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v20;
      v26 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v21, "initForZoneIdentifier:repository:accessibilityAssertion:", v20, v23, v25);

      v27 = v26;
      v28 = objc_opt_class();
      v127 = 0;
      objc_msgSend(v26, "recordsForClass:error:", v28, &v127);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v127;
      v31 = v29 || v30 == 0;
      v101 = v30;
      if (v31)
        break;
      v64 = v30;
      _HKInitializeLogging();
      v65 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        v67 = v65;
        objc_msgSend(v27, "zoneIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v144 = a1;
        v145 = 2114;
        v146 = (uint64_t)v68;
        v147 = 2114;
        v148 = v64;
        _os_log_error_impl(&dword_1B7802000, v67, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

      }
LABEL_54:
      v62 = 0;
      v63 = v102;
      v33 = v105;
      v32 = v106;
LABEL_55:

      objc_msgSend(v7, "addObjectsFromArray:", v62);
      v19 = v63 + 1;
      v12 = v99;
      if (v19 == v100)
      {
        v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v129, 16);
        if (!v100)
          goto LABEL_57;
        goto LABEL_9;
      }
    }
    if (!v29)
      goto LABEL_54;
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v97 = v29;
    v110 = v29;
    v33 = v105;
    v32 = v106;
    v115 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v123, &v130, 16);
    if (!v115)
      goto LABEL_51;
    v113 = *(_QWORD *)v124;
    v104 = v26;
LABEL_20:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v124 != v113)
        objc_enumerationMutation(v110);
      v35 = *(id *)(*((_QWORD *)&v123 + 1) + 8 * v34);
      objc_msgSend(v35, "ownerIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        goto LABEL_49;
      if (objc_msgSend(v32, "type") != 2)
        break;
      v117 = v35;
      v37 = v27;
      v38 = objc_opt_class();
      v128 = 0;
      v109 = v37;
      objc_msgSend(v37, "recordsForClass:error:", v38, &v128);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v128;
      v108 = v40;
      if (v39 || !v40)
      {
        if (v39)
        {
          v107 = v39;
          if ((unint64_t)objc_msgSend(v39, "count") >= 2)
          {
            _HKInitializeLogging();
            v44 = *v18;
            if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
            {
              v60 = v44;
              objc_msgSend(v109, "zoneIdentifier");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v137 = 138543618;
              v138 = (uint64_t)a1;
              v139 = 2114;
              v140 = v61;
              _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "%{public}@ Retrieved multiple cached registry records for %{public}@,", v137, 0x16u);

            }
          }
          objc_msgSend(v39, "firstObject", v92, v93);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "ownerIdentifiers");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          memset(v134, 0, sizeof(v134));
          v135 = 0u;
          v136 = 0u;
          v111 = v46;
          v47 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v134, buf, 16);
          if (v47)
          {
            v48 = v47;
            v49 = **(_QWORD **)&v134[16];
            while (2)
            {
              for (j = 0; j != v48; ++j)
              {
                if (**(_QWORD **)&v134[16] != v49)
                  objc_enumerationMutation(v111);
                v51 = *(void **)(*(_QWORD *)&v134[8] + 8 * j);
                objc_msgSend(v45, "storeIdentifiersForOwnerIdentifier:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "storeIdentifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v52, "containsObject:", v53);

                if (v54)
                {
                  _HKInitializeLogging();
                  v18 = (os_log_t *)MEMORY[0x1E0CB5370];
                  v57 = (void *)*MEMORY[0x1E0CB5370];
                  a1 = (void *)v103;
                  v56 = v117;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    v58 = v57;
                    objc_msgSend(v117, "storeIdentifier");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v137 = 138543874;
                    v138 = v103;
                    v139 = 2114;
                    v140 = v59;
                    v141 = 2114;
                    v142 = v51;
                    _os_log_impl(&dword_1B7802000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: Found broken store identifier %{public}@ in set for owner %{public}@; repairing.",
                      v137,
                      0x20u);

                  }
                  objc_msgSend(v117, "repairOwnerIdentifier:", v51);
                  objc_msgSend(v117, "setRepaired:", 1);
                  v55 = v111;

                  goto LABEL_47;
                }
              }
              v48 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v134, buf, 16);
              if (v48)
                continue;
              break;
            }
          }
          v55 = v111;

          a1 = (void *)v103;
          v56 = v117;
          -[HDCloudSyncRepairStoreRecordsOperation _repairStoreRecordWithRandomOwnerIdentifier:](v103, v117);
          v18 = (os_log_t *)MEMORY[0x1E0CB5370];
LABEL_47:

          v33 = v105;
          v32 = v106;
          v27 = v104;
          goto LABEL_48;
        }
      }
      else
      {
        _HKInitializeLogging();
        v41 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
        {
          v42 = v41;
          objc_msgSend(v109, "zoneIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v137 = 138543874;
          v138 = (uint64_t)a1;
          v139 = 2114;
          v140 = v43;
          v141 = 2114;
          v142 = v108;
          _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", v137, 0x20u);

          v27 = v104;
        }
      }

LABEL_49:
      if (++v34 == v115)
      {
        v115 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v123, &v130, 16);
        if (!v115)
        {
LABEL_51:

          v62 = v33;
          v7 = v94;
          v17 = v95;
          v63 = v102;
          v29 = v97;
          goto LABEL_55;
        }
        goto LABEL_20;
      }
    }
    -[HDCloudSyncRepairStoreRecordsOperation _repairStoreRecordWithRandomOwnerIdentifier:]((uint64_t)a1, v35);
LABEL_48:
    objc_msgSend(v33, "addObject:", v35, v92);
    goto LABEL_49;
  }
LABEL_75:

}

- (void)_repairStoreRecordWithRandomOwnerIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = a1;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Repairing broken store record with identifier %{public}@ by generating random owner identifier.", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@:%@"), v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repairOwnerIdentifier:", v14);

  objc_msgSend(v3, "setRepaired:", 1);
}

uint64_t __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "record");
}

uint64_t __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:");
}

uint64_t __82__HDCloudSyncRepairStoreRecordsOperation__saveRepairedRecords_container_database___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
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
