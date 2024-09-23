@implementation HDCloudSyncComputePullTargetsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (id)operationTagDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)finishedOperationTags
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D5B8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)performWithError:(id *)a3
{
  HDCloudSyncComputePullTargetsOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  char v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  HDCloudSyncTarget *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HDCloudSyncTarget *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id obj;
  uint64_t v77;
  id v78;
  void *v79;
  HDCloudSyncComputePullTargetsOperation *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  void *v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  uint8_t buf[4];
  HDCloudSyncComputePullTargetsOperation *v108;
  __int16 v109;
  id v110;
  __int16 v111;
  id v112;
  __int16 v113;
  id v114;
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t v117[4];
  HDCloudSyncComputePullTargetsOperation *v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v4 = self;
  v123 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudSyncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isChild");

  if ((v9 & 1) != 0)
    return 1;
  -[HDCloudSyncOperation configuration](v4, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "repository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryCKContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](v4, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "repository");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cachedOwnerIdentifierForContainer:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HDCloudSyncOperation configuration](v4, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "computedState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pushTargets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hk_mapToSet:", &__block_literal_global_164);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](v4, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cachedCloudState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0;
    objc_msgSend(v22, "zonesByIdentifierWithError:", &v106);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v106;

    if (v23 || !v24)
    {
      if (v23)
      {
        v68 = v24;
        v70 = v17;
        v71 = v13;
        v80 = v4;
        v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v69 = v23;
        objc_msgSend(v23, "allValues");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v103;
          v30 = MEMORY[0x1E0C809B0];
          while (2)
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v103 != v29)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
              v33 = objc_opt_class();
              v101 = 0;
              v97[0] = v30;
              v97[1] = 3221225472;
              v97[2] = __64__HDCloudSyncComputePullTargetsOperation__pullTargetsWithError___block_invoke_186;
              v97[3] = &unk_1E6CF52A0;
              v98 = v73;
              v99 = v72;
              v100 = v32;
              v34 = objc_msgSend(v32, "recordsForClass:epoch:error:enumerationHandler:", v33, 0, &v101, v97);
              v35 = v101;
              if ((v34 & 1) == 0)
              {
                _HKInitializeLogging();
                v58 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v66 = v58;
                  objc_msgSend(v32, "zoneIdentifier");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v108 = v4;
                  v109 = 2114;
                  v110 = v67;
                  v111 = 2114;
                  v112 = v35;
                  _os_log_error_impl(&dword_1B7802000, v66, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

                }
                v17 = v70;
                v13 = v71;
                v24 = v68;
                v23 = v69;
                if (v35)
                {
                  if (a3)
                    *a3 = objc_retainAutorelease(v35);
                  else
                    _HKLogDroppedError();
                }

                v26 = 0;
                goto LABEL_50;
              }

            }
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
            if (v28)
              continue;
            break;
          }
        }

        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        obj = v72;
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
        if (v75)
        {
          v79 = v26;
          v74 = *(_QWORD *)v94;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v94 != v74)
                objc_enumerationMutation(obj);
              v77 = v36;
              v37 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v36);
              objc_msgSend(obj, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = 0u;
              v90 = 0u;
              v91 = 0u;
              v92 = 0u;
              v78 = v38;
              v83 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
              if (v83)
              {
                v81 = v37;
                v82 = *(_QWORD *)v90;
                do
                {
                  for (j = 0; j != v83; ++j)
                  {
                    if (*(_QWORD *)v90 != v82)
                      objc_enumerationMutation(v78);
                    v40 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                    -[HDCloudSyncOperation configuration](v4, "configuration");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v86, "repository");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "profile");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "legacyRepositoryProfile");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "storeIdentifier");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDCloudSyncOperation configuration](v4, "configuration");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "syncContainerPrefix");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "ownerIdentifier");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "syncIdentity");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "containerIdentifier");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v88 = 0;
                    +[HDCloudSyncStore syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:](HDCloudSyncStore, "syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:", v41, v42, v44, v45, v46, v47, &v88);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v87 = v88;

                    if (v48)
                    {
                      v49 = [HDCloudSyncTarget alloc];
                      -[HDCloudSyncOperation configuration](v80, "configuration");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "repository");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "containerIdentifier");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "containerForContainerIdentifier:", v52);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:](v49, "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", 1, v53, v81, v40, v48, 0);

                      objc_msgSend(v79, "addObject:", v54);
                      v4 = v80;
                      v37 = v81;
                      v55 = v87;
                    }
                    else
                    {
                      v56 = v40;
                      _HKInitializeLogging();
                      v57 = *MEMORY[0x1E0CB5370];
                      v4 = v80;
                      v37 = v81;
                      v55 = v87;
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138544130;
                        v108 = v80;
                        v109 = 2114;
                        v110 = v56;
                        v111 = 2114;
                        v112 = v81;
                        v113 = 2114;
                        v114 = v87;
                        _os_log_error_impl(&dword_1B7802000, v57, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup store for store record: %{public}@ zone: %{public}@ error: %{public}@", buf, 0x2Au);
                      }
                    }

                  }
                  v83 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
                }
                while (v83);
              }

              v36 = v77 + 1;
            }
            while (v77 + 1 != v75);
            v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
          }
          while (v75);
          v17 = v70;
          v13 = v71;
          v24 = v68;
          v23 = v69;
          v26 = v79;
        }
        else
        {
          v17 = v70;
          v13 = v71;
          v24 = v68;
          v23 = v69;
        }
LABEL_50:

      }
      else
      {
        _HKInitializeLogging();
        v59 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v108 = v4;
          _os_log_debug_impl(&dword_1B7802000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found while generating pull targets.", buf, 0xCu);
        }
        v26 = (id)MEMORY[0x1E0C9AA60];
      }
    }
    else
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v108 = v4;
        v109 = 2114;
        v110 = v24;
        _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating pull targets, %{public}@", buf, 0x16u);
      }
      if (a3)
      {
        v26 = 0;
        *a3 = objc_retainAutorelease(v24);
      }
      else
      {
        _HKLogDroppedError();
        v26 = 0;
      }
    }

    if (v26)
    {
      -[HDCloudSyncOperation configuration](v4, "configuration");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "computedState");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addTargets:", v26);

      _HKInitializeLogging();
      v62 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v63 = v62;
        v64 = objc_msgSend(v26, "count");
        *(_DWORD *)v117 = 138543874;
        v118 = v4;
        v119 = 2048;
        v120 = v64;
        v121 = 2114;
        v122 = v17;
        _os_log_impl(&dword_1B7802000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %ld pull targets for owner %{public}@", v117, 0x20u);

      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v26 = 0;
  }

  return v10;
}

id __64__HDCloudSyncComputePullTargetsOperation__pullTargetsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "storeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __64__HDCloudSyncComputePullTargetsOperation__pullTargetsWithError___block_invoke_186(uint64_t a1, void *a2)
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

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "zoneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "addObject:", v3);
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
      v10 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "zoneIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    }
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
}

@end
