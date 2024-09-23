@implementation HDCloudSyncComputePushTargetsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (id)finishedOperationTags
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)main
{
  HDSynchronousTaskGroup *v3;
  HDSynchronousTaskGroup *taskGroup;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  HDSynchronousTaskGroup *v11;
  void *v12;
  void *v13;
  void *v14;
  HDSyncIdentity *v15;
  HDSyncIdentity *currentSyncIdentity;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  HDCloudSyncTarget *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HDCloudSyncComputePushTargetsOperation *v74;
  void *v75;
  void *v76;
  HDCloudSyncTarget *v77;
  void *v78;
  void *v79;
  void *v80;
  HDCloudSyncTarget *v81;
  void *v82;
  id v83;
  void *v84;
  NSObject *v85;
  NSObject *v86;
  id v87;
  void *v88;
  HDCloudSyncComputePushTargetsOperation *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  _BOOL4 hasUpgradedToSyncIdentity;
  void *v103;
  void *v104;
  int v105;
  id v106;
  void *v107;
  NSObject *v108;
  void *v109;
  id v110;
  id v111;
  NSObject *v112;
  void *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  id obj;
  uint64_t v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[6];
  id v158;
  id v159;
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  id v165;
  uint8_t v166[4];
  HDCloudSyncComputePushTargetsOperation *v167;
  __int16 v168;
  void *v169;
  __int16 v170;
  id v171;
  uint8_t buf[4];
  HDCloudSyncComputePushTargetsOperation *v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  id v177;
  _BYTE v178[24];
  void *v179;
  HDCloudSyncComputePushTargetsOperation *v180;
  uint64_t v181;

  v181 = *MEMORY[0x1E0C80C00];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyRepositoryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0;
  v9 = HDUpgradedToSyncIdentity(v8, (uint64_t)&v150);
  v10 = v150;
  self->_hasUpgradedToSyncIdentity = v9;

  if (v10)
  {
    v11 = self->_taskGroup;
  }
  else
  {
    if (self->_hasUpgradedToSyncIdentity)
    {
      -[HDCloudSyncOperation profile](self, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "syncIdentityManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentSyncIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identity");
      v15 = (HDSyncIdentity *)objc_claimAutoreleasedReturnValue();
      currentSyncIdentity = self->_currentSyncIdentity;
      self->_currentSyncIdentity = v15;

    }
    v149 = 0;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "repository");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryCKContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "repository");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cachedOwnerIdentifierForContainer:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v19;
    v25 = v23;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "repository");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "profileIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v24;
    HDDatabaseForContainer(v24, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v29, "databaseScope");

    -[HDCloudSyncOperation configuration](self, "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cachedCloudState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = 0;
    objc_msgSend(v31, "zonesByIdentifierWithError:", &v165);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v165;

    if (v32 || !v33)
    {
      if (v32)
      {
        v131 = v33;
        v144 = v25;
        v145 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v164 = 0u;
        v130 = v32;
        objc_msgSend(v32, "allValues");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, buf, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v162;
          v39 = MEMORY[0x1E0C809B0];
          while (2)
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v162 != v38)
                objc_enumerationMutation(obj);
              v41 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * i);
              v42 = objc_opt_class();
              v160 = 0;
              v157[0] = v39;
              v157[1] = 3221225472;
              v157[2] = __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke;
              v157[3] = &unk_1E6CFC8E0;
              v157[4] = self;
              v157[5] = v41;
              v158 = v25;
              v159 = v145;
              LOBYTE(v42) = objc_msgSend(v41, "recordsForClass:epoch:error:enumerationHandler:", v42, 0, &v160, v157);
              v43 = v160;
              if ((v42 & 1) == 0)
              {
                _HKInitializeLogging();
                v82 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v112 = v82;
                  objc_msgSend(v41, "zoneIdentifier");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v166 = 138543874;
                  v167 = self;
                  v168 = 2114;
                  v169 = v113;
                  v170 = 2114;
                  v171 = v43;
                  _os_log_error_impl(&dword_1B7802000, v112, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve records for zone identifier: %{public}@, %{public}@", v166, 0x20u);

                }
                v83 = v43;
                v84 = v83;
                if (v83)
                  v149 = objc_retainAutorelease(v83);

                v35 = 0;
                goto LABEL_72;
              }

            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, buf, 16);
            if (v37)
              continue;
            break;
          }
        }

        -[HDCloudSyncOperation configuration](self, "configuration");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "syncDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "hk_foldRightFrom:with:", v45, &__block_literal_global_134);
        v46 = objc_claimAutoreleasedReturnValue();

        -[HDCloudSyncOperation profile](self, "profile");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "syncContainerPrefix");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "containerIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        obj = (id)v46;
        v51 = v46;
        v25 = v144;
        +[HDCloudSyncStore createOrUpdateShardStoresForProfile:throughDate:syncCircleName:ownerIdentifier:containerIdentifier:syncIdentity:error:](HDCloudSyncStore, "createOrUpdateShardStoresForProfile:throughDate:syncCircleName:ownerIdentifier:containerIdentifier:syncIdentity:error:", v47, v51, v49, v144, v50, self->_currentSyncIdentity, &v149);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v129 = v52;
          objc_msgSend(v52, "hk_mapToDictionary:", &__block_literal_global_201_0);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v153 = 0u;
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          v55 = (void *)v53;
          v133 = v145;
          v141 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v153, v166, 16);
          v132 = (void *)v53;
          if (v141)
          {
            v139 = v54;
            v140 = *(_QWORD *)v154;
LABEL_23:
            v56 = 0;
            while (1)
            {
              if (*(_QWORD *)v154 != v140)
                objc_enumerationMutation(v133);
              v57 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v56);
              objc_msgSend(v57, "recordID");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "zoneID");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v146, "containerIdentifier");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              +[HDCloudSyncZoneIdentifier identifierForZone:container:scope:](HDCloudSyncZoneIdentifier, "identifierForZone:container:scope:", v59, v60, v143);
              v147 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "storeIdentifier");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectForKeyedSubscript:", v61);
              v62 = objc_claimAutoreleasedReturnValue();

              if (v62)
              {
                v63 = [HDCloudSyncTarget alloc];
                -[HDCloudSyncOperation configuration](self, "configuration");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "repository");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "primaryCKContainer");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:](v63, "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", 0, v66, v147, v57, v62, 0);
                v68 = (void *)v62;
                v69 = (void *)v67;

                v54 = v139;
                objc_msgSend(v139, "addObject:", v69);
              }
              else
              {
                -[HDCloudSyncOperation configuration](self, "configuration");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "repository");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v136, "profile");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v135, "legacyRepositoryProfile");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "storeIdentifier");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncOperation configuration](self, "configuration");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "syncContainerPrefix");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "ownerIdentifier");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "syncIdentity");
                v74 = self;
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v147, "containerIdentifier");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v152 = 0;
                +[HDCloudSyncStore syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:](HDCloudSyncStore, "syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:", v134, v70, v72, v73, v75, v76, &v152);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v138 = v152;

                if (!v69)
                {
                  v151 = 0;
                  v87 = v57;
                  v148 = v147;
                  objc_msgSend(v87, "storeIdentifier");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = v74;
                  -[HDCloudSyncOperation configuration](v74, "configuration");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "repository");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "profile");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "legacyRepositoryProfile");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HDCloudSyncStoreEntity persistedStateForStoreUUID:profile:error:](HDCloudSyncStoreEntity, "persistedStateForStoreUUID:profile:error:", v88, v93, &v151);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v94)
                  {
                    objc_msgSend(v94, "ownerIdentifier");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "ownerIdentifier");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = objc_msgSend(v95, "isEqualToString:", v96);

                    objc_msgSend(v94, "containerIdentifier");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = v148;
                    objc_msgSend(v148, "containerIdentifier");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    v101 = objc_msgSend(v98, "isEqualToString:", v100);

                    hasUpgradedToSyncIdentity = v89->_hasUpgradedToSyncIdentity;
                    self = v89;
                    v32 = v130;
                    if (hasUpgradedToSyncIdentity)
                    {
                      objc_msgSend(v94, "syncIdentity");
                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "syncIdentity");
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      v105 = objc_msgSend(v103, "isEqual:", v104) ^ 1;

                    }
                    else
                    {
                      v105 = 0;
                    }
                    if ((v97 & v101) == 1 && !v105)
                    {

                      v111 = v151;
                      _HKInitializeLogging();
                      v114 = (void *)*MEMORY[0x1E0CB5370];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                      {
                        v115 = v114;
                        objc_msgSend(v87, "storeIdentifier");
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v178 = 138543874;
                        *(_QWORD *)&v178[4] = self;
                        *(_WORD *)&v178[12] = 2114;
                        *(_QWORD *)&v178[14] = v116;
                        *(_WORD *)&v178[22] = 2114;
                        v179 = v138;
                        _os_log_impl(&dword_1B7802000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not create local push store: %{public}@ error: %{public}@", v178, 0x20u);

                      }
                      v110 = v138;
                      v25 = v144;
                      v54 = v139;
                      if (v110)
                      {
                        v110 = objc_retainAutorelease(v110);
                        v149 = v110;
                      }
                      goto LABEL_69;
                    }
                    v117 = CFSTR("no");
                    if (v97)
                      v118 = CFSTR("YES");
                    else
                      v118 = CFSTR("no");
                    if (v101)
                      v119 = CFSTR("YES");
                    else
                      v119 = CFSTR("no");
                    if (!v105)
                      v117 = CFSTR("YES");
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid push store found: sameOwnerID=%@, sameContainerID=%@, sameSyncIdentity=%@"), v118, v119, v117);
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
                    -[HDCloudSyncOperation profile](self, "profile");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v121, "cloudSyncManager");
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v122, "ownerIdentifierManager");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)v178 = MEMORY[0x1E0C809B0];
                    *(_QWORD *)&v178[8] = 3221225472;
                    *(_QWORD *)&v178[16] = __103__HDCloudSyncComputePushTargetsOperation__hasStateMismatchForStoreForStoreRecord_zoneIdentifier_error___block_invoke;
                    v179 = &unk_1E6CE77C8;
                    v180 = self;
                    objc_msgSend(v123, "rollOwnerDifferentiatorForReason:completion:", v120, v178);

                    v111 = v151;
                    v35 = (id)MEMORY[0x1E0C9AA60];
                    v25 = v144;
                    v54 = v139;
                  }
                  else
                  {
                    v99 = v148;

                    v106 = v151;
                    _HKInitializeLogging();
                    v107 = (void *)*MEMORY[0x1E0CB5370];
                    self = v89;
                    v32 = v130;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                    {
                      v108 = v107;
                      objc_msgSend(v87, "storeIdentifier");
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v178 = 138543874;
                      *(_QWORD *)&v178[4] = self;
                      *(_WORD *)&v178[12] = 2114;
                      *(_QWORD *)&v178[14] = v109;
                      *(_WORD *)&v178[22] = 2114;
                      v179 = v106;
                      _os_log_impl(&dword_1B7802000, v108, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not validate state mismatch error when looking up local push store: %{public}@ error: %{public}@", v178, 0x20u);

                    }
                    v110 = v106;
                    v25 = v144;
                    if (v110)
                    {
                      v110 = objc_retainAutorelease(v110);
                      v111 = v110;
                      v149 = v110;
                    }
                    else
                    {
                      v111 = 0;
                    }
                    v54 = v139;
LABEL_69:

                    v35 = 0;
                  }

                  goto LABEL_71;
                }
                v77 = [HDCloudSyncTarget alloc];
                self = v74;
                -[HDCloudSyncOperation configuration](v74, "configuration");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "repository");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "primaryCKContainer");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v132;
                v81 = -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:](v77, "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", 0, v80, v147, v57, v69, 4 * (objc_msgSend(v132, "count") != 0));

                v54 = v139;
                objc_msgSend(v139, "addObject:", v81);

                v68 = v138;
              }

              if (v141 == ++v56)
              {
                v141 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v153, v166, 16);
                if (v141)
                  goto LABEL_23;
                break;
              }
            }
          }

          v35 = v54;
          v25 = v144;
          v32 = v130;
LABEL_71:

          v84 = v129;
        }
        else
        {
          _HKInitializeLogging();
          v86 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v166 = 138543362;
            v167 = self;
            _os_log_error_impl(&dword_1B7802000, v86, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create or update push shards.", v166, 0xCu);
          }
          v84 = 0;
          v35 = 0;
        }
LABEL_72:

        v33 = v131;
      }
      else
      {
        _HKInitializeLogging();
        v85 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v173 = self;
          _os_log_debug_impl(&dword_1B7802000, v85, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found while generating push targets.", buf, 0xCu);
        }
        v35 = (id)MEMORY[0x1E0C9AA60];
      }
    }
    else
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v173 = self;
        v174 = 2114;
        v175 = (uint64_t)v33;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating push targets, %{public}@", buf, 0x16u);
      }
      v35 = 0;
      v149 = objc_retainAutorelease(v33);
    }

    if (v35)
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "computedState");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "addTargets:", v35);

      _HKInitializeLogging();
      v126 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v127 = v126;
        v128 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 138543874;
        v173 = self;
        v174 = 2048;
        v175 = v128;
        v176 = 2114;
        v177 = v25;
        _os_log_impl(&dword_1B7802000, v127, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %ld push targets for owner %{public}@", buf, 0x20u);

      }
    }

    v10 = v149;
    v11 = self->_taskGroup;
    if (v35)
    {
      -[HDSynchronousTaskGroup finishTask](v11, "finishTask");
      goto LABEL_78;
    }
  }
  -[HDSynchronousTaskGroup failTaskWithError:](v11, "failTaskWithError:", v10);
LABEL_78:

}

uint64_t __103__HDCloudSyncComputePushTargetsOperation__hasStateMismatchForStoreForStoreRecord_zoneIdentifier_error___block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (a2)
    return objc_msgSend(v2, "finishTask");
  else
    return objc_msgSend(v2, "failTaskWithError:");
}

uint64_t __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  _BYTE *v32;
  uint8_t buf[4];
  _BYTE *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v5;
  v9 = v6;
  v10 = v9;
  if (!v4)
    goto LABEL_11;
  v11 = v7;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v8, "containerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  objc_msgSend(v4, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryCKContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "isEqualToString:", v18);

  if ((v19 & 1) != 0)
  {
    v7 = v11;
    objc_msgSend(v11, "ownerIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    v21 = objc_msgSend(v20, "isEqualToString:", v12);

    v8 = v13;
    if (v21)
    {
      if (!v32[120])
      {
        _HKInitializeLogging();
        v24 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v32;
          v35 = 2114;
          v36 = v13;
          v26 = "%{public}@: %{public}@: Valid push candidate. Upgrade to Sync Identity unavailable.";
          goto LABEL_15;
        }
LABEL_16:

        objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
        goto LABEL_12;
      }
      objc_msgSend(v11, "syncIdentity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqual:", *((_QWORD *)v32 + 14));

      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5370];
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
      if ((v23 & 1) != 0)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138543618;
          v34 = v32;
          v35 = 2114;
          v36 = v13;
          v26 = "%{public}@: %{public}@: Valid push candidate.";
LABEL_15:
          _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v25)
      {
        v28 = v24;
        objc_msgSend(v11, "syncIdentity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v32;
        v35 = 2114;
        v36 = v13;
        v37 = 2114;
        v38 = v29;
        v30 = "%{public}@: %{public}@: Not a push candidate, wrong sync identity '%{public}@'";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x1E0CB5370];
    v10 = v12;
    v7 = v11;
    v8 = v13;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      objc_msgSend(v13, "containerIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v32;
      v35 = 2114;
      v36 = v13;
      v37 = 2114;
      v38 = v29;
      v30 = "%{public}@: %{public}@: Not a push candidate, wrong container '%{public}@'";
LABEL_10:
      _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x20u);

    }
  }
LABEL_11:

LABEL_12:
  return 1;
}

id __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a2;
  objc_msgSend(a3, "shardPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hk_isBeforeDate:", v7) & 1) != 0)
    {
      objc_msgSend(v5, "endDate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v4;
    }
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

void __89__HDCloudSyncComputePushTargetsOperation__pushTargetsForContainer_ownerIdentifier_error___block_invoke_199(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "storeIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v5, v7, v6);

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
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
