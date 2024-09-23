@implementation HDCloudSyncSynchronizeProfilesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  HDSynchronousTaskGroup *v7;
  HDSynchronousTaskGroup *taskGroup;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  id v20;
  HDSynchronousTaskGroup *v21;
  void *v22;
  char v23;
  HDSynchronousTaskGroup *v24;
  NSObject *v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  HDCloudSyncSynchronizeProfilesOperation *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsSecondaryProfiles");

  if ((v6 & 1) != 0)
  {
    v7 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = self->_taskGroup;
    self->_taskGroup = v7;

    -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
    -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allCKContainers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
          objc_msgSend(v17, "privateCloudDatabase");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v14;
          v19 = -[HDCloudSyncSynchronizeProfilesOperation _synchronizeProfilesWithRegistryAndShareRecordsForContainer:database:error:](self, v17, v18, &v28);
          v20 = v28;

          v21 = self->_taskGroup;
          if ((v19 & 1) != 0)
            -[HDSynchronousTaskGroup finishTask](v21, "finishTask");
          else
            -[HDSynchronousTaskGroup failTaskWithError:](v21, "failTaskWithError:", v20);
          -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
          objc_msgSend(v17, "sharedCloudDatabase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v20;
          v23 = -[HDCloudSyncSynchronizeProfilesOperation _synchronizeProfilesWithRegistryAndShareRecordsForContainer:database:error:](self, v17, v22, &v27);
          v14 = v27;

          v24 = self->_taskGroup;
          if ((v23 & 1) != 0)
            -[HDSynchronousTaskGroup finishTask](v24, "finishTask");
          else
            -[HDSynchronousTaskGroup failTaskWithError:](v24, "failTaskWithError:", v14);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = self;
      _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Device ineligble for synchronizing additional profiles", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

- (uint64_t)_synchronizeProfilesWithRegistryAndShareRecordsForContainer:(void *)a3 database:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  BOOL v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  uint64_t i;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  uint8_t v74;
  id v75;
  void *v76;
  void *v77;
  int v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  int v103;
  NSObject *v104;
  void *v105;
  id v106;
  id v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  char v111;
  id v112;
  NSObject *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  NSObject *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  __int128 v129;
  BOOL v130;
  NSObject *log;
  void *v132;
  id v133;
  id v134;
  char v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  void *v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  char v153;
  id v154;
  id v155;
  id obj;
  void *v157;
  uint64_t v158;
  void *v159;
  id v160;
  id v161;
  void *v162;
  uint64_t v163;
  id v164;
  void *v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  id v180;
  id v181;
  id v182;
  _BYTE v183[128];
  id v184[16];
  _BYTE buf[24];
  void *v186;
  _QWORD v187[12];
  uint8_t v188[4];
  void *v189;
  __int16 v190;
  id v191;
  __int16 v192;
  id v193;
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!a1)
  {
    v19 = 0;
    goto LABEL_150;
  }
  v146 = v6;
  v8 = v6;
  v9 = v7;
  v150 = a1;
  objc_msgSend(a1, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedCloudState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = 0;
  objc_msgSend(v11, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v12, objc_msgSend(v9, "databaseScope"), v184);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v184[0];

  if (v13 || !v14)
  {
    if (!v13)
    {
      _HKInitializeLogging();
      v37 = (void *)*MEMORY[0x1E0CB5370];
      v6 = v146;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
      {
        v123 = v37;
        objc_msgSend(v8, "containerIdentifier");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "databaseScope");
        CKDatabaseScopeString();
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v150;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v124;
        *(_WORD *)&buf[22] = 2114;
        v186 = v125;
        _os_log_debug_impl(&dword_1B7802000, v123, OS_LOG_TYPE_DEBUG, "%{public}@ No zones cached for container %{public}@, database %{public}@", buf, 0x20u);

        v6 = v146;
      }
      v16 = 0;
      v17 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_10;
    }
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __102__HDCloudSyncSynchronizeProfilesOperation__cachedZonesWithRegistryRecordsForContainer_database_error___block_invoke;
    v186 = &unk_1E6CF6690;
    v187[0] = v150;
    objc_msgSend(v13, "hk_map:", buf);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v118 = v15;
      objc_msgSend(v8, "containerIdentifier");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "databaseScope");
      CKDatabaseScopeString();
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v150;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v119;
      *(_WORD *)&buf[22] = 2114;
      v186 = v120;
      LOWORD(v187[0]) = 2114;
      *(_QWORD *)((char *)v187 + 2) = v14;
      _os_log_error_impl(&dword_1B7802000, v118, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get zone identifiers for container %{public}@, database %{public}@, %{public}@", buf, 0x2Au);

    }
    v16 = objc_retainAutorelease(v14);
    v17 = 0;
  }
  v6 = v146;
LABEL_10:

  v18 = v16;
  v145 = v17;
  if (!v17 && v18)
  {
    v19 = (uint64_t)a4;
    v20 = v18;
    if (a4)
    {
      v19 = 0;
      *a4 = objc_retainAutorelease(v18);
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_149;
  }
  v141 = v18;
  if (!objc_msgSend(v17, "count"))
  {
    v19 = 1;
    goto LABEL_148;
  }
  v21 = v17;
  v139 = v8;
  v138 = v9;
  v149 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v184, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v173;
    do
    {
      v26 = 0;
      v27 = v24;
      do
      {
        if (*(_QWORD *)v173 != v25)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v26);
        v29 = objc_opt_class();
        v171 = v27;
        objc_msgSend(v28, "recordsForClass:error:", v29, &v171);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v171;

        v27 = v31;
        if (v30)
          v32 = 1;
        else
          v32 = v31 == 0;
        if (!v32)
        {
          _HKInitializeLogging();
          v33 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v121 = v33;
            objc_msgSend(v28, "zoneIdentifier");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v150;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v122;
            *(_WORD *)&buf[22] = 2114;
            v186 = v31;
            _os_log_error_impl(&dword_1B7802000, v121, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);

          }
          v6 = v146;
          v35 = obj;
          v36 = v31;
          if (a4)
            *a4 = objc_retainAutorelease(v31);
          else
            _HKLogDroppedError();
          buf[0] = 0;
          v55 = obj;
          goto LABEL_147;
        }
        if (v30)
          objc_msgSend(v149, "addObjectsFromArray:", v30);

        ++v26;
      }
      while (v23 != v26);
      v24 = v31;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v184, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }
  v132 = v24;

  _HKInitializeLogging();
  v38 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    objc_msgSend(v139, "containerIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v149, "count");
    objc_msgSend(v138, "databaseScope");
    CKDatabaseScopeString();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v150;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v40;
    *(_WORD *)&buf[22] = 2048;
    v186 = (void *)v41;
    LOWORD(v187[0]) = 2114;
    *(_QWORD *)((char *)v187 + 2) = v42;
    _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Fetched %ld records from cache %{public}@", buf, 0x2Au);

  }
  v143 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v43 = obj;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v167, v183, 16);
  if (v44)
  {
    v45 = v44;
    v46 = 0;
    v47 = *(_QWORD *)v168;
    do
    {
      v48 = 0;
      v49 = v46;
      do
      {
        if (*(_QWORD *)v168 != v47)
          objc_enumerationMutation(v43);
        v50 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v48);
        v166 = v49;
        objc_msgSend(v50, "zoneShareWithError:", &v166);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v166;

        if (v51)
          v52 = 1;
        else
          v52 = v46 == 0;
        if (!v52)
        {
          v133 = v46;
          _HKInitializeLogging();
          v53 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v126 = v53;
            objc_msgSend(v50, "zoneIdentifier");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v150;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v127;
            *(_WORD *)&buf[22] = 2114;
            v186 = v46;
            _os_log_error_impl(&dword_1B7802000, v126, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get share for %{public}@, %{public}@", buf, 0x20u);

          }
          v6 = v146;
          v35 = obj;
          if (a4)
            *a4 = objc_retainAutorelease(v46);
          else
            _HKLogDroppedError();
          buf[0] = 0;

          goto LABEL_146;
        }
        if (v51)
          objc_msgSend(v143, "addObject:", v51);

        ++v48;
        v49 = v46;
      }
      while (v45 != v48);
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v167, v183, 16);
    }
    while (v45);
  }
  else
  {
    v46 = 0;
  }
  v133 = v46;

  _HKInitializeLogging();
  v56 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v57 = v56;
    objc_msgSend(v139, "containerIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v143, "count");
    objc_msgSend(v138, "databaseScope");
    CKDatabaseScopeString();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v150;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2048;
    v186 = (void *)v59;
    LOWORD(v187[0]) = 2114;
    *(_QWORD *)((char *)v187 + 2) = v60;
    _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Fetched %ld shares from cache %{public}@", buf, 0x2Au);

  }
  v61 = v149;
  v161 = v139;
  v160 = v138;
  objc_msgSend(v143, "hk_mapToDictionary:", &__block_literal_global_118);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v179 = 0u;
  v62 = v61;
  v130 = 1;
  v35 = obj;
  v155 = v62;
  v163 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v176, buf, 16);
  if (!v163)
  {
    v6 = v146;
    goto LABEL_144;
  }
  v153 = 0;
  v158 = *(_QWORD *)v177;
  *(_QWORD *)&v63 = 138543618;
  v129 = v63;
  do
  {
    for (i = 0; i != v163; ++i)
    {
      if (*(_QWORD *)v177 != v158)
        objc_enumerationMutation(v155);
      v65 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
      objc_msgSend(v65, "recordID", v129);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "zoneID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "objectForKeyedSubscript:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v65;
      v70 = v68;
      v71 = v161;
      v72 = v160;
      v165 = v72;
      if ((objc_msgSend(v69, "deleted") & 1) != 0)
      {
        v73 = 0;
        v74 = 1;
        goto LABEL_130;
      }
      v157 = v66;
      v164 = v71;
      v75 = v7;
      objc_msgSend(v69, "recordID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "zoneID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = 0;
      v78 = objc_msgSend(v77, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v181);
      v79 = v181;

      v162 = v79;
      if (v78
        && (!objc_msgSend(v79, "isEqualToString:", CFSTR("PrimarySyncCircle"))
         || objc_msgSend(v72, "databaseScope") != 2))
      {
        v7 = v75;
        v71 = v164;
        if (objc_msgSend(v72, "databaseScope") == 2)
        {
          objc_msgSend(v69, "ownerProfileIdentifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v80)
            goto LABEL_82;
        }
        else
        {
          objc_msgSend(v69, "sharedProfileIdentifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v80)
          {
LABEL_82:
            objc_msgSend(MEMORY[0x1E0CB6A10], "hd_profileIdentifierWithSyncCircleIdentifier:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v80)
              goto LABEL_83;
            v73 = 0;
            v188[0] = 1;
LABEL_101:
            v35 = obj;
LABEL_128:
            v74 = v188[0];
            goto LABEL_129;
          }
        }
LABEL_83:
        v81 = v80;
        v82 = objc_msgSend(v80, "type");
        if ((unint64_t)(v82 - 1) >= 4 && v82 != 100)
        {
          v188[0] = 1;

          v73 = 0;
          goto LABEL_101;
        }
        v151 = v67;
        objc_msgSend(v150, "configuration");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "repository");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "profile");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "daemon");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "profileManager");
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        v88 = v87;
        objc_msgSend(v87, "profileForIdentifier:", v81);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v81;
        if (v89)
        {
          v73 = 0;
          v188[0] = 1;
          v7 = v75;
          v35 = obj;
          v71 = v164;
          v67 = v151;
LABEL_127:

          goto LABEL_128;
        }
        objc_msgSend(v69, "displayFirstName");
        v90 = objc_claimAutoreleasedReturnValue();
        v91 = (void *)v90;
        if (v90)
          v92 = (const __CFString *)v90;
        else
          v92 = CFSTR("Auxiliary Health Store");
        objc_msgSend(v69, "displayLastName");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = 0;
        v147 = v87;
        objc_msgSend(v87, "createProfileForIdentifier:firstName:lastName:error:", v81, v92, v93, &v180);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = v180;

        _HKInitializeLogging();
        v95 = *MEMORY[0x1E0CB5370];
        v96 = *MEMORY[0x1E0CB5370];
        if (!v94)
        {
          v7 = v75;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v188 = 138543874;
            v189 = v150;
            v190 = 2114;
            v191 = v162;
            v192 = 2114;
            v193 = v148;
            _os_log_error_impl(&dword_1B7802000, v95, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create profile for sync circle identifier %{public}@: %{public}@", v188, 0x20u);
          }
          v106 = v148;
          v73 = v106;
          v35 = obj;
          v88 = v87;
          if (v106)
            v107 = objc_retainAutorelease(v106);

          v188[0] = v73 == 0;
          goto LABEL_125;
        }
        v7 = v75;
        v71 = v164;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v188 = 138543874;
          v189 = v150;
          v190 = 2114;
          v191 = v162;
          v192 = 2114;
          v193 = v152;
          _os_log_impl(&dword_1B7802000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@: Created local profile for sync circle identifier %{public}@: %{public}@", v188, 0x20u);
        }
        v35 = obj;
        v88 = v87;
        if ((objc_msgSend(v152, "type") & 0xFFFFFFFFFFFFFFFELL) != 2)
          goto LABEL_119;
        objc_msgSend(v69, "recordID");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "zoneID");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = v94;
        v98 = v70;
        v99 = v97;
        if (v98)
        {
          v137 = v98;
          objc_msgSend(v98, "owner");
          v100 = objc_claimAutoreleasedReturnValue();
          if (v100)
          {
            v101 = (void *)v100;
            v136 = v99;
            objc_msgSend(v142, "cloudSyncManager");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v182 = 0;
            v103 = objc_msgSend(v102, "setShareOwnerParticipant:error:", v101, &v182);
            v134 = v182;

            _HKInitializeLogging();
            v104 = *MEMORY[0x1E0CB5370];
            v135 = v103;
            log = *MEMORY[0x1E0CB5370];
            if (v103)
            {
              v71 = v164;
              v105 = v134;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v188 = v129;
                v189 = v150;
                v190 = 2114;
                v191 = v101;
                _os_log_impl(&dword_1B7802000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Stored owner participant: %{public}@", v188, 0x16u);
              }
            }
            else
            {
              v71 = v164;
              v105 = v134;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v188 = v129;
                v189 = v150;
                v190 = 2114;
                v191 = v134;
                _os_log_error_impl(&dword_1B7802000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to store owner participant: %{public}@", v188, 0x16u);
              }
            }

            if ((v135 & 1) == 0)
            {
LABEL_117:
              objc_msgSend(v142, "profileIdentifier");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v182 = 0;
              v111 = objc_msgSend(v147, "deleteProfile:error:", v110, &v182);
              v112 = v182;

              if ((v111 & 1) != 0)
              {

                v71 = v164;
                v88 = v147;
                goto LABEL_119;
              }
              _HKInitializeLogging();
              v113 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v188 = v129;
                v189 = v150;
                v190 = 2114;
                v191 = v142;
                _os_log_fault_impl(&dword_1B7802000, v113, OS_LOG_TYPE_FAULT, "%{public}@: Failed to delete profile %{public}@ after failing to set store owner participant.", v188, 0x16u);
              }
              v114 = v112;
              v73 = v114;
              v88 = v147;
              if (v114)
                v115 = objc_retainAutorelease(v114);

              v188[0] = v73 == 0;
LABEL_125:
              v71 = v164;
LABEL_126:
              v67 = v151;

              v89 = 0;
              goto LABEL_127;
            }
LABEL_119:
            v73 = 0;
            v188[0] = 1;
            goto LABEL_126;
          }
          _HKInitializeLogging();
          v109 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v188 = v129;
            v189 = v150;
            v190 = 2114;
            v191 = v137;
            _os_log_fault_impl(&dword_1B7802000, v109, OS_LOG_TYPE_FAULT, "%{public}@: Unable to find owner participant on share %{public}@", v188, 0x16u);
          }

        }
        else
        {
          _HKInitializeLogging();
          v108 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v188 = v129;
            v189 = v150;
            v190 = 2114;
            v191 = v99;
            _os_log_error_impl(&dword_1B7802000, v108, OS_LOG_TYPE_ERROR, "%{public}@: Zone %{public}@ does not have a zone share during zone synchronization", v188, 0x16u);
          }

        }
        goto LABEL_117;
      }
      v73 = 0;
      v74 = 1;
      v7 = v75;
      v35 = obj;
      v71 = v164;
LABEL_129:

      v66 = v157;
LABEL_130:

      v116 = v73;
      if ((v74 & 1) == 0)
      {
        objc_msgSend(v154, "addObject:", v116);
        v153 = 1;
      }

    }
    v163 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v176, buf, 16);
  }
  while (v163);

  if ((v153 & 1) != 0)
  {
    objc_msgSend(v154, "firstObject");
    v117 = (id)objc_claimAutoreleasedReturnValue();
    v62 = v117;
    v130 = v117 == 0;
    v6 = v146;
    if (v117)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v117);
      else
        _HKLogDroppedError();
    }

LABEL_144:
  }
  else
  {
    v130 = 1;
    v6 = v146;
  }

  buf[0] = v130;
LABEL_146:
  v36 = v132;

  v55 = v133;
LABEL_147:

  v19 = buf[0];
LABEL_148:
  v20 = v141;
LABEL_149:

LABEL_150:
  return v19;
}

id __102__HDCloudSyncSynchronizeProfilesOperation__cachedZonesWithRegistryRecordsForContainer_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDCloudSyncCachedZone *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v5 = objc_msgSend(v4, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v17);
  v6 = v17;

  v7 = 0;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncContainerPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v9))
    {
      v10 = objc_msgSend(v3, "scope");

      if (v10 == 2)
      {
        v7 = 0;
        goto LABEL_7;
      }
    }
    else
    {

    }
    v11 = [HDCloudSyncCachedZone alloc];
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessibilityAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v11, "initForZoneIdentifier:repository:accessibilityAssertion:", v3, v13, v15);

  }
LABEL_7:

  return v7;
}

void __114__HDCloudSyncSynchronizeProfilesOperation__synchronizeProfilesForRegistryRecords_shares_container_database_error___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "recordID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))a3)[2](v5, v7, v6);

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
