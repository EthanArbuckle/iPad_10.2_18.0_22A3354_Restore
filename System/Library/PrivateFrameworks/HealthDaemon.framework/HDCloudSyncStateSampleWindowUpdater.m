@implementation HDCloudSyncStateSampleWindowUpdater

+ (BOOL)updateDataWithStateStorage:(id)a3 configuration:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  uint64_t *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  BOOL v39;
  id *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  char v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  char v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  NSObject *v70;
  int v71;
  uint64_t v72;
  NSObject *v73;
  NSObject *v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  BOOL v83;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  id v99;
  NSObject *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t m;
  void *v109;
  int v110;
  NSObject *v111;
  unint64_t v112;
  id v113;
  void *v114;
  void *v115;
  char v116;
  _BOOL4 v117;
  NSObject *v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  uint64_t *v125;
  char v126;
  BOOL v127;
  NSObject *v128;
  NSObject *v129;
  HDCodableStateSyncCollection *v130;
  uint64_t v131;
  int v132;
  HDCodableSampleOriginCollection *v133;
  void *v134;
  NSObject *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  char v142;
  NSObject *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  NSObject *p_super;
  void *v157;
  NSObject *v158;
  void *v159;
  void *v160;
  HDCodableStateSyncCollection *v161;
  void *v162;
  os_log_t log;
  NSObject *loga;
  void *v165;
  void *v166;
  NSObject *v167;
  void *v168;
  id v169;
  void *v170;
  NSObject *v171;
  NSObject *v172;
  unint64_t v173;
  id v174;
  id v175;
  id v176;
  void *v177;
  uint64_t *v178;
  id v179;
  id v180;
  id v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  id v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  NSObject *v199;
  id v200;
  NSObject *v201;
  id v202;
  id v203;
  id v204;
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint8_t v208[128];
  _BYTE buf[24];
  uint64_t v210;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = v13;
  v179 = a5;
  v16 = a6;
  v204 = 0;
  objc_msgSend(v15, "sampleOriginKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v12, "data:forKey:error:", &v204, v17, a7);
  v18 = v204;

  if ((a7 & 1) != 0)
  {
    v177 = v16;
    v203 = 0;
    objc_msgSend(v15, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "data:forKey:error:", &v203, v19, v14);
    v21 = (uint64_t *)v14;
    v22 = v203;

    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      objc_msgSend(v15, "loggingCategory");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "key");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *v21;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2114;
        v210 = v47;
        _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch cloud data for key: %{public}@, with error: %{public}@", buf, 0x20u);

      }
      v39 = 0;
      goto LABEL_27;
    }
    v23 = (objc_class *)objc_opt_class();
    objc_msgSend(v15, "sampleOriginKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = 0;
    v202 = 0;
    v25 = +[HDCloudSyncStateSampleWindowUpdater _decodeCloudData:ofClass:forKey:dataVersion:currentSyncVersion:configuration:codableSyncState:codableCollection:error:]((uint64_t)a1, v18, v23, v24, v15, &v202, &v201, v21);
    v26 = v202;
    v27 = v201;

    if (v25 != 2)
    {
      v39 = v25 == 1;
LABEL_26:

LABEL_27:
      v16 = v177;
      goto LABEL_28;
    }
    v28 = (objc_class *)objc_opt_class();
    objc_msgSend(v15, "key");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = 0;
    v200 = 0;
    v176 = a1;
    v178 = v21;
    v30 = +[HDCloudSyncStateSampleWindowUpdater _decodeCloudData:ofClass:forKey:dataVersion:currentSyncVersion:configuration:codableSyncState:codableCollection:error:]((uint64_t)a1, v22, v28, v29, v15, &v200, &v199, v21);
    v31 = v200;
    v173 = v199;

    if (v30 != 2)
    {
      _HKInitializeLogging();
      objc_msgSend(v15, "loggingCategory");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 1026;
        *(_DWORD *)&buf[14] = v30;
        _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode finished with error?: %{public}i", buf, 0x12u);
      }

      v39 = v30 == 1;
      goto LABEL_24;
    }
    v171 = v27;
    v172 = v26;
    if (v27)
    {
      v32 = v27;
      v33 = v179;
      v34 = objc_opt_self();
      -[NSObject devices](v32, "devices");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[HDDeviceEntity insertCodableDevices:syncProvenance:profile:error:](HDDeviceEntity, "insertCodableDevices:syncProvenance:profile:error:", v35, 0, v33, v21))
      {
LABEL_11:

        _HKInitializeLogging();
        objc_msgSend(v15, "loggingCategory");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v136 = *v178;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v176;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v136;
          _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save sample origins with error: %{public}@", buf, 0x16u);
        }

        v39 = 0;
        v27 = v171;
        v26 = v172;
LABEL_24:
        v42 = (void *)v173;
LABEL_25:

        goto LABEL_26;
      }
      v174 = v15;
      -[NSObject contributors](v32, "contributors");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[HDSyncSampleOriginUtilities ingestContributorSyncObjects:syncStore:profile:error:](HDSyncSampleOriginUtilities, "ingestContributorSyncObjects:syncStore:profile:error:", v36, 0, v33, v21) == 1)
      {
        _HKInitializeLogging();
        v37 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v144 = *v178;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v144;
          _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to ingest contributor sync object with error: %{public}@", buf, 0x16u);
        }

        v15 = v174;
        goto LABEL_11;
      }

      v15 = v174;
    }
    v168 = v12;
    v169 = v18;
    v167 = v22;
    v170 = v31;
    if (v173)
    {
      v197 = 0u;
      v198 = 0u;
      v195 = 0u;
      v196 = 0u;
      objc_msgSend((id)v173, "deletedSampleCollections");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v195, v208, 16);
      if (v49)
      {
        v50 = v49;
        v51 = v15;
        v52 = 0;
        v53 = 0;
        v54 = *(_QWORD *)v196;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v196 != v54)
              objc_enumerationMutation(v48);
            v56 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * i);
            if (!+[HDDataSyncUtilities insertDeletedObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:](HDDataSyncUtilities, "insertDeletedObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:", v56, +[HDDataSyncUtilities deletedSampleSyncEntityClass](HDDataSyncUtilities, "deletedSampleSyncEntityClass"), 0, v179, v178))
            {
              _HKInitializeLogging();
              objc_msgSend(v51, "loggingCategory");
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                v58 = *v178;
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v176;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v58;
                _os_log_error_impl(&dword_1B7802000, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save deleted samples with error: %{public}@", buf, 0x16u);
              }

              v53 = 1;
            }
            v52 += objc_msgSend(v56, "deletedSamplesCount");
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v195, v208, 16);
        }
        while (v50);

        v15 = v51;
        v18 = v169;
        v31 = v170;
        if ((v53 & 1) != 0)
        {
          _HKInitializeLogging();
          objc_msgSend(v15, "loggingCategory");
          v59 = objc_claimAutoreleasedReturnValue();
          v22 = v167;
          v27 = v171;
          v26 = v172;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v147 = *v178;
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v176;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v147;
            _os_log_error_impl(&dword_1B7802000, v59, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to insert a deleted sample with error: %{public}@", buf, 0x16u);
          }

          v39 = 0;
          goto LABEL_24;
        }
      }
      else
      {

        v52 = 0;
      }
      _HKInitializeLogging();
      objc_msgSend(v15, "loggingCategory");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v52;
        _os_log_impl(&dword_1B7802000, v60, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %i deleted samples for state sync", buf, 0x12u);
      }
      v61 = v15;

      v193 = 0u;
      v194 = 0u;
      v191 = 0u;
      v192 = 0u;
      v42 = (void *)v173;
      objc_msgSend((id)v173, "sampleCollections");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v191, v207, 16);
      if (v63)
      {
        v64 = v63;
        v65 = 0;
        v66 = 0;
        v67 = *(_QWORD *)v192;
        do
        {
          for (j = 0; j != v64; ++j)
          {
            if (*(_QWORD *)v192 != v67)
              objc_enumerationMutation(v62);
            v69 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * j);
            if (!+[HDDataSyncUtilities insertObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:](HDDataSyncUtilities, "insertObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:", v69, objc_msgSend(v61, "syncEntityClass"), 0, v179, v178))
            {
              _HKInitializeLogging();
              objc_msgSend(v61, "loggingCategory");
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                v72 = *v178;
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v176;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v72;
                _os_log_error_impl(&dword_1B7802000, v70, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save samples with error: %{public}@", buf, 0x16u);
              }

              v66 = 1;
            }
            v71 = objc_msgSend(v69, "count");
            v65 += v71 - objc_msgSend(v69, "deletedSamplesCount");
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v191, v207, 16);
        }
        while (v64);

        v31 = v170;
        v42 = (void *)v173;
        if ((v66 & 1) != 0)
        {
          _HKInitializeLogging();
          v15 = v61;
          objc_msgSend(v61, "loggingCategory");
          v73 = objc_claimAutoreleasedReturnValue();
          v22 = v167;
          v27 = v171;
          v26 = v172;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            v149 = *v178;
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v176;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v149;
            _os_log_error_impl(&dword_1B7802000, v73, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to insert a sample with error: %{public}@", buf, 0x16u);
          }

          v39 = 0;
          v18 = v169;
          goto LABEL_25;
        }
      }
      else
      {

        v65 = 0;
      }
      _HKInitializeLogging();
      objc_msgSend(v61, "loggingCategory");
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v65;
        _os_log_impl(&dword_1B7802000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %i sample events for state sync", buf, 0x12u);
      }

      v75 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v190 = 0u;
      objc_msgSend(v42, "sampleCollections");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v187, v206, 16);
      v15 = v61;
      v18 = v169;
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v188;
        do
        {
          for (k = 0; k != v78; ++k)
          {
            if (*(_QWORD *)v188 != v79)
              objc_enumerationMutation(v76);
            objc_msgSend(v15, "sampleUUIDsFromCodableObjectCollection:", *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * k));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addObjectsFromArray:", v81);

          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v187, v206, 16);
        }
        while (v78);
      }

      v186 = 0;
      objc_msgSend(v15, "timeWindow");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = +[HDCloudSyncStateSampleWindowUpdater _fetchPersistedDeletedSamples:withSampleUUIDs:profile:transaction:timeWindow:error:]((uint64_t)HDCloudSyncStateSampleWindowUpdater, &v186, v75, v179, v82, (uint64_t)v178);
      v84 = v186;

      if (!v83)
      {
        _HKInitializeLogging();
        objc_msgSend(v15, "loggingCategory");
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v148 = *v178;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v176;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v148;
          _os_log_error_impl(&dword_1B7802000, v100, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch deleted samples with error: %{public}@", buf, 0x16u);
        }
        v39 = 0;
        v42 = (void *)v173;
        goto LABEL_145;
      }
      v165 = v84;

    }
    else
    {
      v165 = 0;
    }
    v175 = v15;
    v85 = v15;
    log = (os_log_t)v179;
    objc_opt_self();
    objc_msgSend(v85, "sampleType");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataType(v86);
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = (void *)MEMORY[0x1E0D29840];
    HDDataEntityPredicateForType(2);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "negatedPredicate:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v85, "timeWindow");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDateInterval(v91, v86);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = (void *)MEMORY[0x1E0D29840];
    v160 = (void *)v87;
    *(_QWORD *)buf = v87;
    *(_QWORD *)&buf[8] = v92;
    *(_QWORD *)&buf[16] = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "predicateMatchingAllPredicates:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v85, "sampleType");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = v85;

    v97 = objc_msgSend((id)objc_msgSend(v96, "dataObjectClass"), "hd_dataEntityClass");
    +[HDDataSyncUtilities generateCodableObjectCollectionsForEntityClass:predicate:profile:error:](HDDataSyncUtilities, "generateCodableObjectCollectionsForEntityClass:predicate:profile:error:", v97, v95, log, v178);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      if (objc_msgSend(v98, "count"))
        v99 = objc_retainAutorelease(v98);
      else
        v99 = 0;
    }
    else
    {
      v99 = 0;
    }

    v101 = v99;
    v75 = v101;
    if (!v98)
    {
      _HKInitializeLogging();
      objc_msgSend(v166, "loggingCategory");
      v100 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v173;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        v146 = *v178;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v146;
        _os_log_error_impl(&dword_1B7802000, v100, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch samples with error: %{public}@", buf, 0x16u);
      }
      v39 = 0;
      v15 = v175;
      v18 = v169;
      v84 = v165;
      goto LABEL_145;
    }
    objc_msgSend(v101, "allValues");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "allValues");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v185 = 0u;
    v100 = v102;
    v103 = -[NSObject countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v182, v205, 16);
    if (v103)
    {
      v104 = v103;
      v105 = 0;
      v106 = 0;
      v107 = *(_QWORD *)v183;
      do
      {
        for (m = 0; m != v104; ++m)
        {
          if (*(_QWORD *)v183 != v107)
            objc_enumerationMutation(v100);
          v109 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * m);
          v110 = objc_msgSend(v109, "deletedSamplesCount");
          v105 += objc_msgSend(v109, "count") - v110;
          v106 += v110;
        }
        v104 = -[NSObject countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v182, v205, 16);
      }
      while (v104);
    }
    else
    {
      v105 = 0;
      v106 = 0;
    }

    _HKInitializeLogging();
    objc_msgSend(v166, "loggingCategory");
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v176;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v105;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v106;
      _os_log_impl(&dword_1B7802000, v111, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch %i local samples and %i deleted samples for state sync", buf, 0x18u);
    }

    v42 = (void *)v173;
    if (v100)
    {
      v112 = objc_alloc_init(HDCodableStateSyncCollection);
      v113 = -[NSObject mutableCopy](v100, "mutableCopy");
      objc_msgSend((id)v112, "setSampleCollections:", v113);

      v18 = v169;
      if (!v162)
      {
LABEL_107:
        +[HDCloudSyncStateSampleWindowUpdater _healthObjectUUIDsFromMergedStateSyncCollection:configuration:]((uint64_t)v176, (void *)v173, v166);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = (HDCodableStateSyncCollection *)v112;
        +[HDCloudSyncStateSampleWindowUpdater _healthObjectUUIDsFromMergedStateSyncCollection:configuration:]((uint64_t)v176, (void *)v112, v166);
        v157 = v115;
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "isEqualToSet:");
        v117 = (v173 | v112) == 0;
        _HKInitializeLogging();
        objc_msgSend(v166, "loggingCategory");
        v118 = objc_claimAutoreleasedReturnValue();
        v119 = os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
        if ((v116 & 1) != 0 || v117)
        {
          v84 = v165;
          v158 = v118;
          if (v119)
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v176;
            _os_log_impl(&dword_1B7802000, v118, OS_LOG_TYPE_DEFAULT, "[%{public}@] Steady state reached for samples.", buf, 0xCu);
          }
          v39 = 1;
          v12 = v168;
          v15 = v175;
          v130 = v161;
          v134 = v157;
          goto LABEL_144;
        }
        v84 = v165;
        if (v119)
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v176;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v105;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v106;
          _os_log_impl(&dword_1B7802000, v118, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %i samples and %i deleted samples in cloud state for state sync", buf, 0x18u);
        }

        objc_msgSend(v166, "domain");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "key");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDCloudSyncStateSampleWindowUpdater _codableSyncStateFromExistingSyncState:forDomain:key:]((uint64_t)v176, v170, v120, v121);
        v122 = objc_claimAutoreleasedReturnValue();

        -[NSObject setVersionRange:](v122, "setVersionRange:", 0x100000001);
        -[NSObject setCodableObject:version:profile:](v122, "setCodableObject:version:profile:", v161, 1, log);
        v158 = v122;
        -[NSObject data](v122, "data");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "key");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v168;
        v125 = v178;
        v126 = objc_msgSend(v168, "setData:forKey:error:", v123, v124, v178);

        if ((v126 & 1) == 0)
        {
          _HKInitializeLogging();
          objc_msgSend(v166, "loggingCategory");
          v135 = objc_claimAutoreleasedReturnValue();
          v15 = v175;
          p_super = v135;
          if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v166, "key", v135);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = *v178;
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v176;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v151;
            *(_WORD *)&buf[22] = 2114;
            v210 = v152;
            _os_log_error_impl(&dword_1B7802000, v135, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set merged data for key: %{public}@, with error: %{public}@", buf, 0x20u);

          }
          v39 = 0;
          v42 = (void *)v173;
          v130 = v161;
          v134 = v157;
          goto LABEL_143;
        }
        v15 = v175;
        if (v75)
        {
          v181 = 0;
          v127 = +[HDCloudSyncStateSampleWindowUpdater _generateSyncCodableDevices:fromCollectionByProvenance:profile:transaction:error:]((uint64_t)HDCloudSyncStateSampleWindowUpdater, &v181, v75, log, v177, (uint64_t)v178);
          p_super = v181;
          if (!v127)
          {
            _HKInitializeLogging();
            objc_msgSend(v166, "loggingCategory");
            loga = objc_claimAutoreleasedReturnValue();
            v42 = (void *)v173;
            v130 = v161;
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              v153 = *v178;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v176;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v153;
              _os_log_error_impl(&dword_1B7802000, loga, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to generate merged devices with error: %{public}@", buf, 0x16u);
            }
            v39 = 0;
            goto LABEL_131;
          }
          v180 = 0;
          v39 = +[HDCloudSyncStateSampleWindowUpdater _generateSyncCodableContributors:fromCollectionByProvenance:profile:transaction:error:]((uint64_t)HDCloudSyncStateSampleWindowUpdater, &v180, v75, log, v177, (uint64_t)v178);
          v128 = v180;
          v129 = v128;
          v130 = v161;
          if (v39)
          {
            v131 = objc_alloc_init(HDCodableSampleOriginCollection);
            objc_msgSend((id)v131, "setDevices:", p_super);
            objc_msgSend((id)v131, "setContributors:", v129);
            v132 = -[NSObject isEqual:](v171, "isEqual:", v131);
            if ((unint64_t)v171 | v131 && !v132)
            {

              v133 = (HDCodableSampleOriginCollection *)v131;
              v12 = v168;
              v125 = v178;
LABEL_126:
              objc_msgSend(v166, "domain", p_super);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "sampleOriginKey");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              +[HDCloudSyncStateSampleWindowUpdater _codableSyncStateFromExistingSyncState:forDomain:key:]((uint64_t)v176, v172, v137, v138);
              v139 = objc_claimAutoreleasedReturnValue();

              -[NSObject setVersionRange:](v139, "setVersionRange:", 0x100000001);
              v39 = 1;
              p_super = &v133->super.super;
              -[NSObject setCodableObject:version:profile:](v139, "setCodableObject:version:profile:", v133, 1, log);
              loga = v139;
              -[NSObject data](v139, "data");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "sampleOriginKey");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              v142 = objc_msgSend(v12, "setData:forKey:error:", v140, v141, v125);

              if ((v142 & 1) == 0)
              {
                _HKInitializeLogging();
                objc_msgSend(v166, "loggingCategory");
                v143 = objc_claimAutoreleasedReturnValue();
                v42 = (void *)v173;
                v130 = v161;
                v84 = v165;
                if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v166, "sampleOriginKey");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  v155 = *v125;
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v176;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v154;
                  *(_WORD *)&buf[22] = 2114;
                  v210 = v155;
                  _os_log_error_impl(&dword_1B7802000, v143, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set merged data for key: %{public}@, with error: %{public}@", buf, 0x20u);

                  v42 = (void *)v173;
                }

                v39 = 0;
                v15 = v175;
                goto LABEL_135;
              }
              v42 = (void *)v173;
              v15 = v175;
              v130 = v161;
LABEL_131:
              v84 = v165;
LABEL_135:
              v134 = v157;
LABEL_142:

LABEL_143:
LABEL_144:

LABEL_145:
              v22 = v167;
              v27 = v171;
              v26 = v172;
              v31 = v170;
              goto LABEL_25;
            }
            loga = v129;
            _HKInitializeLogging();
            objc_msgSend(v166, "loggingCategory");
            v150 = objc_claimAutoreleasedReturnValue();
            v84 = v165;
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v176;
              _os_log_impl(&dword_1B7802000, v150, OS_LOG_TYPE_DEFAULT, "[%{public}@] Steady state reached for sample origin.", buf, 0xCu);
            }

            v12 = v168;
            v15 = v175;
          }
          else
          {
            loga = v128;
            _HKInitializeLogging();
            objc_msgSend(v166, "loggingCategory");
            v131 = objc_claimAutoreleasedReturnValue();
            v84 = v165;
            if (os_log_type_enabled((os_log_t)v131, OS_LOG_TYPE_ERROR))
            {
              v145 = *v178;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v176;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v145;
              _os_log_error_impl(&dword_1B7802000, (os_log_t)v131, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to generate merged contributors with error: %{public}@", buf, 0x16u);
            }
          }
          v134 = v157;

          v42 = (void *)v173;
          goto LABEL_142;
        }
        v133 = 0;
        goto LABEL_126;
      }
      if (v112)
      {
LABEL_106:
        v114 = (void *)objc_msgSend(v162, "mutableCopy");
        objc_msgSend((id)v112, "setDeletedSampleCollections:", v114);

        goto LABEL_107;
      }
    }
    else
    {
      v18 = v169;
      if (!v162)
      {
        v112 = 0;
        goto LABEL_107;
      }
    }
    v112 = objc_alloc_init(HDCodableStateSyncCollection);
    goto LABEL_106;
  }
  v40 = v14;
  _HKInitializeLogging();
  objc_msgSend(v15, "loggingCategory");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v15, "sampleOriginKey");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *v40;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v44;
    *(_WORD *)&buf[22] = 2114;
    v210 = (uint64_t)v45;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch cloud data for key: %{public}@, with error: %{public}@", buf, 0x20u);

  }
  v39 = 0;
LABEL_28:

  return v39;
}

+ (uint64_t)_decodeCloudData:(objc_class *)a3 ofClass:(void *)a4 forKey:(void *)a5 dataVersion:(_QWORD *)a6 currentSyncVersion:(NSObject *)a7 configuration:(uint64_t *)a8 codableSyncState:codableCollection:error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  HDCodableSyncState *v20;
  HDCodableSyncState *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  HDCodableSyncState *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HDCodableSyncState *v47;
  HDCodableSyncState *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  BOOL v54;
  NSObject *v55;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  objc_class *v60;
  uint64_t v61;
  id v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  _BYTE v69[24];
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a4;
  v13 = a2;
  v14 = objc_opt_self();
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = objc_opt_self();
  if (!v15)
  {
    v30 = 0;
    v31 = 1;
    goto LABEL_26;
  }
  v19 = v18;
  v20 = -[HDCodableSyncState initWithData:]([HDCodableSyncState alloc], "initWithData:", v15);
  v21 = v20;
  if (v20)
  {
    -[HDCodableSyncState domain](v20, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domain");
    v23 = objc_claimAutoreleasedReturnValue();
    v60 = a3;
    v61 = v14;
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      v59 = v19;
      objc_msgSend(v17, "domain");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {

LABEL_15:
        v38 = (void *)MEMORY[0x1E0CB35C8];
        -[HDCodableSyncState key](v21, "key");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "domain");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hk_assignError:code:format:", a8, 129, CFSTR("Deserialized domain %@ does not match expected value %@"), v39, v40);

        v30 = 0;
        v31 = 0;
        a3 = v60;
        v14 = v61;
        goto LABEL_25;
      }
      v26 = (void *)v25;
      -[HDCodableSyncState domain](v21, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "domain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      v19 = v59;
      if ((v29 & 1) == 0)
        goto LABEL_15;
    }
    -[HDCodableSyncState key](v21, "key");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (v34 == v16)
    {

      a3 = v60;
    }
    else
    {
      v35 = v34;
      if (!v16)
      {

        a3 = v60;
LABEL_23:
        v44 = (void *)MEMORY[0x1E0CB35C8];
        -[HDCodableSyncState key](v21, "key");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "domain");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "hk_assignError:code:format:", a8, 129, CFSTR("Deserialized key %@ does not match %@ for domain %@"), v45, v16, v46);

        v30 = 0;
        v31 = 0;
LABEL_24:
        v14 = v61;
        goto LABEL_25;
      }
      -[HDCodableSyncState key](v21, "key");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", v16);

      a3 = v60;
      if ((v37 & 1) == 0)
        goto LABEL_23;
    }
    if ((int)-[HDCodableSyncState versionRange](v21, "versionRange") < 2)
    {
      v30 = objc_retainAutorelease(v21);
      v31 = 1;
    }
    else
    {
      _HKInitializeLogging();
      objc_msgSend(v17, "loggingCategory");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (int)-[HDCodableSyncState versionRange](v21, "versionRange");
        objc_msgSend(v17, "domain");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v67 = v19;
        v68 = 1024;
        *(_DWORD *)v69 = v42;
        *(_WORD *)&v69[4] = 2048;
        *(_QWORD *)&v69[6] = 1;
        *(_WORD *)&v69[14] = 2114;
        *(_QWORD *)&v69[16] = v43;
        v70 = 2114;
        v71 = v16;
        _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Codable state has minimum version %d but current version for OS is %ld for (%{public}@, %{public}@) ", buf, 0x30u);

      }
      v30 = 0;
      v31 = 2;
    }
    goto LABEL_24;
  }
  v32 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v17, "domain");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "hk_assignError:code:format:", a8, 129, CFSTR("Unable to decode state sync data for domain %@ key %@"), v33, v16);

  v30 = 0;
  v31 = 0;
LABEL_25:

LABEL_26:
  v47 = v30;
  v48 = v47;
  if (v31 == 2)
  {
    _HKInitializeLogging();
    objc_msgSend(v17, "loggingCategory");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(a3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v14;
      v68 = 2114;
      *(_QWORD *)v69 = v52;
      _os_log_impl(&dword_1B7802000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode finished without error but could not decode sync state codable of class: %{public}@.", buf, 0x16u);

    }
    v53 = 1;
  }
  else
  {
    if (!v31)
    {
      _HKInitializeLogging();
      objc_msgSend(v17, "loggingCategory");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(a3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *a8;
        *(_DWORD *)buf = 138543874;
        v67 = v14;
        v68 = 2114;
        *(_QWORD *)v69 = v50;
        *(_WORD *)&v69[8] = 2114;
        *(_QWORD *)&v69[10] = v51;
        _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to decode cloud sync state codable of class: %{public}@, with error: %{public}@", buf, 0x20u);

      }
LABEL_38:
      v53 = 0;
      goto LABEL_45;
    }
    if (v47)
    {
      v65 = 0;
      v54 = -[HDCodableSyncState decodedObjectOfClass:version:decodedObject:error:](v47, "decodedObjectOfClass:version:decodedObject:error:", a3, 1, &v65, a8);
      v49 = v65;
      if (!v54)
      {
        _HKInitializeLogging();
        objc_msgSend(v17, "loggingCategory");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(a3);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = *a8;
          *(_DWORD *)buf = 138543874;
          v67 = v14;
          v68 = 2114;
          *(_QWORD *)v69 = v57;
          *(_WORD *)&v69[8] = 2114;
          *(_QWORD *)&v69[10] = v58;
          _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to decode codable cloud collection of class: %{public}@, with error: %{public}@", buf, 0x20u);

        }
        goto LABEL_38;
      }
    }
    else
    {
      v49 = 0;
    }
    if (a6)
      *a6 = objc_retainAutorelease(v48);
    if (a7)
    {
      v49 = objc_retainAutorelease(v49);
      *a7 = v49;
    }
    v53 = 2;
  }
LABEL_45:

  return v53;
}

+ (BOOL)_fetchPersistedDeletedSamples:(uint64_t)a1 withSampleUUIDs:(_QWORD *)a2 profile:(void *)a3 transaction:(void *)a4 timeWindow:(void *)a5 error:(uint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  void *v25;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_self();
  if (objc_msgSend(v9, "count"))
  {
    HDDataEntityPredicateForType(2);
    v12 = objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUIDs(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForEndDate(6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)v12;
    v27[0] = v12;
    v27[1] = v13;
    v27[2] = v15;
    v27[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataSyncUtilities generateCodableObjectCollectionsForEntityClass:predicate:profile:error:](HDDataSyncUtilities, "generateCodableObjectCollectionsForEntityClass:predicate:profile:error:", +[HDDataSyncUtilities deletedSampleEntityClass](HDDataSyncUtilities, "deletedSampleEntityClass"), v19, v10, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v20 != 0;
    if (v20)
    {
      v23 = objc_msgSend(v20, "count");
      if (a2)
      {
        if (v23)
          *a2 = objc_retainAutorelease(v21);
      }
    }

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

+ (id)_healthObjectUUIDsFromMergedStateSyncCollection:(void *)a3 configuration:
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "sampleCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "sampleUUIDsFromCodableObjectCollection:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (HDCodableSyncState)_codableSyncStateFromExistingSyncState:(void *)a3 forDomain:(void *)a4 key:
{
  id v6;
  id v7;
  id v8;
  HDCodableSyncState *v9;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (v6)
  {
    v9 = (HDCodableSyncState *)v6;
  }
  else
  {
    v9 = objc_alloc_init(HDCodableSyncState);
    -[HDCodableSyncState setDomain:](v9, "setDomain:", v7);
    -[HDCodableSyncState setKey:](v9, "setKey:", v8);
  }

  return v9;
}

+ (BOOL)_generateSyncCodableDevices:(void *)a3 fromCollectionByProvenance:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  id v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_self();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "deviceID");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("DataOriginProvenance's deviceID is unexpectedly nil."));
          v22 = 0;
          v24 = v14;
          goto LABEL_14;
        }
        v20 = (void *)v19;
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", *MEMORY[0x1E0D29618], v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v22 = +[HDSyncSampleOriginUtilities generateStateSyncCodableDevices:predicate:profile:transaction:error:](HDSyncSampleOriginUtilities, "generateStateSyncCodableDevices:predicate:profile:transaction:error:", &v26, v21, v11, v12, a6);
  v23 = v26;
  v24 = v23;
  if (a2 && v22)
    *a2 = objc_retainAutorelease(v23);

LABEL_14:
  return v22;
}

+ (BOOL)_generateSyncCodableContributors:(void *)a3 fromCollectionByProvenance:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_t *v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  uint64_t v24;
  id v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v24 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v27 = a4;
  v25 = a5;
  v9 = objc_opt_self();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    v15 = (os_log_t *)MEMORY[0x1E0CB5370];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "contributorID", v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v10, "addObject:", v17);
        }
        else
        {
          _HKInitializeLogging();
          v18 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v9;
            _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Contributor persistentID is nil", buf, 0xCu);
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", *MEMORY[0x1E0D29618], v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v20 = +[HDSyncSampleOriginUtilities generateStateSyncCodableContributors:predicate:profile:transaction:error:](HDSyncSampleOriginUtilities, "generateStateSyncCodableContributors:predicate:profile:transaction:error:", &v28, v19, v27, v25, v24);
  v21 = v28;
  v22 = v21;
  if (a2 && v20)
    *a2 = objc_retainAutorelease(v21);

  return v20;
}

@end
