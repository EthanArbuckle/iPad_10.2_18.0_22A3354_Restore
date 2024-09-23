@implementation HDCloudSyncSeizeAbandonedStoresOperation

+ (id)operationTagDependencies
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  v3[1] = 0x1E6D4D5B8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  HDSynchronousTaskGroup *v7;
  HDSynchronousTaskGroup *taskGroup;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  char *v25;
  char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  char *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t j;
  uint64_t (*v86)(uint64_t, uint64_t);
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  _BOOL4 v95;
  void *v96;
  int v97;
  void *v98;
  _BOOL4 v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  BOOL v111;
  void *v112;
  _BOOL4 v113;
  NSObject *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  void *v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t k;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t m;
  void *v141;
  void *v142;
  void *v143;
  BOOL v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  uint64_t n;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  HDCloudSyncModifyRecordsOperation *v172;
  void *v173;
  HDCloudSyncModifyRecordsOperation *v174;
  id v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  id obj;
  char *obja;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  id v184;
  id v185;
  char *v186;
  id v187;
  id v188;
  HDCloudSyncSeizeAbandonedStoresOperation *v189;
  void *v190;
  uint64_t v191;
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD v202[4];
  id v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  uint8_t buf[32];
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _BYTE v223[24];
  uint64_t (*v224)(uint64_t, uint64_t);
  HDCloudSyncSeizeAbandonedStoresOperation *v225;
  double v226;
  uint64_t v227;

  v227 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "rebaseProhibited"))
  {

LABEL_33:
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    return;
  }
  -[HDCloudSyncOperation profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPerformOwnershipTakeover");

  if ((v6 & 1) == 0)
    goto LABEL_33;
  v7 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v7;

  -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB4640]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *MEMORY[0x1E0CB4610];
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    if (v12 >= v13)
      v12 = v13;
  }

  -[HDCloudSyncOperation configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "computedState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "targets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v223 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v223[8] = 3221225472;
  *(_QWORD *)&v223[16] = __69__HDCloudSyncSeizeAbandonedStoresOperation__computeTargetsForSeizure__block_invoke;
  v224 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D119C0;
  v225 = self;
  v226 = v12;
  objc_msgSend(v16, "hk_map:", v223);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v193 = 0;
  v18 = v17;
  v184 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = v18;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "computedState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "targets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v204 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v204 + 1) = 3221225472;
  *(_QWORD *)&v205 = __76__HDCloudSyncSeizeAbandonedStoresOperation__computeAllActiveTargetsByChild___block_invoke;
  *((_QWORD *)&v205 + 1) = &unk_1E6CE9960;
  v175 = v19;
  *(_QWORD *)&v206 = v175;
  objc_msgSend(v22, "hk_filter:", &v204);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v212 = 0u;
  v213 = 0u;
  v214 = 0u;
  v215 = 0u;
  obj = v23;
  v182 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v212, v223, 16);
  if (v182)
  {
    v181 = *(_QWORD *)v213;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v213 != v181)
        {
          v26 = v25;
          objc_enumerationMutation(obj);
          v25 = v26;
        }
        v186 = v25;
        v27 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * (_QWORD)v25);
        objc_msgSend(v27, "storeRecord");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "isChild") & 1) == 0)
        {
          objc_msgSend(v27, "storeRecord");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sequenceRecord");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "includedChildSyncIdentities");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count") == 0;

          if (v32)
            goto LABEL_29;
          v210 = 0u;
          v211 = 0u;
          v208 = 0u;
          v209 = 0u;
          objc_msgSend(v27, "storeRecord");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sequenceRecord");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "includedChildSyncIdentities");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v208, &v219, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v209;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v209 != v36)
                  objc_enumerationMutation(v28);
                v38 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * i);
                objc_msgSend(v24, "objectForKeyedSubscript:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v39;
                if (v39)
                  v41 = v39;
                else
                  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v42 = v41;

                objc_msgSend(v27, "storeRecord");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "syncIdentity");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44 == 0;

                if (v45)
                {
                  _HKInitializeLogging();
                  v48 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    v49 = v48;
                    objc_msgSend(v27, "storeRecord");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = self;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v50;
                    _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "%{public}@: StoreRecord has a nil sync identity %{public}@", buf, 0x16u);

                  }
                }
                else
                {
                  objc_msgSend(v27, "storeRecord");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "syncIdentity");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "addObject:", v47);

                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v42, v38);
                }

              }
              v35 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v208, &v219, 16);
            }
            while (v35);
          }
        }

LABEL_29:
        v25 = v186 + 1;
      }
      while (v186 + 1 != (char *)v182);
      v182 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v212, v223, 16);
    }
    while (v182);
  }

  *(_QWORD *)v223 = 0;
  *(_QWORD *)&v223[8] = v223;
  *(_QWORD *)&v223[16] = 0x3032000000;
  v224 = __Block_byref_object_copy__213;
  v225 = (HDCloudSyncSeizeAbandonedStoresOperation *)__Block_byref_object_dispose__213;
  v226 = 0.0;
  +[HDMutableDatabaseTransactionContext contextForReading](HDMutableDatabaseTransactionContext, "contextForReading");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "accessibilityAssertion");
  v53 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "contextWithAccessibilityAssertion:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation profile](self, "profile");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "database");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v219 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v219 + 1) = 3221225472;
  *(_QWORD *)&v220 = __74__HDCloudSyncSeizeAbandonedStoresOperation__childSyncIdentitiesWithError___block_invoke;
  *((_QWORD *)&v220 + 1) = &unk_1E6CEF700;
  *((_QWORD *)&v221 + 1) = v223;
  *(_QWORD *)&v221 = self;
  LOBYTE(v53) = objc_msgSend(v56, "performTransactionWithContext:error:block:inaccessibilityHandler:", v54, &v193, &v219, 0);

  if ((v53 & 1) != 0)
    v177 = *(id *)(*(_QWORD *)&v223[8] + 40);
  else
    v177 = 0;

  _Block_object_dispose(v223, 8);
  if (!v177)
    goto LABEL_95;
  v217 = 0u;
  v218 = 0u;
  memset(buf, 0, sizeof(buf));
  v187 = v175;
  v178 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", buf, &v219, 16);
  if (!v178)
    goto LABEL_78;
  v176 = **(_QWORD **)&buf[16];
  do
  {
    v57 = 0;
    do
    {
      if (**(_QWORD **)&buf[16] != v176)
      {
        v58 = v57;
        objc_enumerationMutation(v187);
        v57 = v58;
      }
      obja = v57;
      v59 = *(void **)(*(_QWORD *)&buf[8] + 8 * (_QWORD)v57);
      objc_msgSend(v59, "storeRecord");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "isChild");

      objc_msgSend(v59, "storeRecord");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "syncIdentity");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v177, "containsObject:", v63);

      objc_msgSend(v59, "storeRecord");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "sequenceRecord");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "includedChildSyncIdentities");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "count");

      if (v61)
      {
        v69 = v59;
        v70 = v24;
        if (v64)
        {
          _HKInitializeLogging();
          v71 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v72 = v71;
            objc_msgSend(v69, "store");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "syncIdentity");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v223 = 138543618;
            *(_QWORD *)&v223[4] = self;
            *(_WORD *)&v223[12] = 2114;
            *(_QWORD *)&v223[14] = v74;
            _os_log_impl(&dword_1B7802000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@: targetIsAChild: Candidate target is ownChild (%{public}@), continue seizing", v223, 0x16u);

          }
LABEL_75:

          goto LABEL_76;
        }
        objc_msgSend(v69, "storeRecord");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "syncIdentity");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKeyedSubscript:", v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "count") == 0;

        _HKInitializeLogging();
        v112 = (void *)*MEMORY[0x1E0CB5370];
        v113 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
        if (v111)
        {
          if (v113)
          {
            v121 = v112;
            objc_msgSend(v69, "store");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "syncIdentity");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v223 = 138543618;
            *(_QWORD *)&v223[4] = self;
            *(_WORD *)&v223[12] = 2114;
            *(_QWORD *)&v223[14] = v123;
            _os_log_impl(&dword_1B7802000, v121, OS_LOG_TYPE_DEFAULT, "%{public}@: targetIsAChild: Candidate target is not ownChild nor another active target's child, continue seizing (%{public}@)", v223, 0x16u);

          }
          goto LABEL_75;
        }
        if (v113)
        {
          v114 = v112;
          objc_msgSend(v69, "store");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "syncIdentity");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v223 = 138543618;
          *(_QWORD *)&v223[4] = self;
          *(_WORD *)&v223[12] = 2114;
          *(_QWORD *)&v223[14] = v116;
          _os_log_impl(&dword_1B7802000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@: targetIsAChild: Candidate target is another active target's child, do not seize target (%{public}@)", v223, 0x16u);

        }
        objc_msgSend(v184, "addObject:", v69);
      }
      else if (v68)
      {
        v75 = v59;
        -[HDCloudSyncOperation configuration](self, "configuration");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "computedState");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "targets");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v223 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v223[8] = 3221225472;
        *(_QWORD *)&v223[16] = __80__HDCloudSyncSeizeAbandonedStoresOperation__childTargetBySyncIdentityForParent___block_invoke;
        v224 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D119E8;
        v189 = (HDCloudSyncSeizeAbandonedStoresOperation *)v75;
        v225 = v189;
        objc_msgSend(v78, "hk_mapToDictionary:", v223);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        -[HDCloudSyncSeizeAbandonedStoresOperation storeRecord](v189, "storeRecord");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "sequenceRecord");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "includedChildSyncIdentities");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v198, &v212, 16);
        if (v83)
        {
          v84 = *(_QWORD *)v199;
          while (2)
          {
            for (j = 0; j != v83; ++j)
            {
              if (*(_QWORD *)v199 != v84)
                objc_enumerationMutation(v82);
              v86 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v198 + 1) + 8 * j);
              objc_msgSend(v24, "objectForKeyedSubscript:", v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v87
                || (objc_msgSend(v24, "objectForKeyedSubscript:", v86),
                    v88 = (void *)objc_claimAutoreleasedReturnValue(),
                    v89 = v88 == 0,
                    v88,
                    v87,
                    v89))
              {
                objc_msgSend(v79, "objectForKeyedSubscript:", v86);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = v94 == 0;

                if (v95)
                {
                  _HKInitializeLogging();
                  v104 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    v105 = v104;
                    -[HDCloudSyncSeizeAbandonedStoresOperation store](v189, "store");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v106, "syncIdentity");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v223 = 138543874;
                    *(_QWORD *)&v223[4] = self;
                    *(_WORD *)&v223[12] = 2114;
                    *(_QWORD *)&v223[14] = v107;
                    *(_WORD *)&v223[22] = 2114;
                    v224 = v86;
                    _os_log_impl(&dword_1B7802000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: Child does not exist as store, seize both candidate target (%{public}@) & child (%{public}@) ", v223, 0x20u);

                  }
                }
                else
                {
                  objc_msgSend(v79, "objectForKeyedSubscript:", v86);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v97 = objc_msgSend(v187, "containsObject:", v96);

                  _HKInitializeLogging();
                  v98 = (void *)*MEMORY[0x1E0CB5370];
                  v99 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
                  if (!v97)
                  {
                    if (v99)
                    {
                      v117 = v98;
                      -[HDCloudSyncSeizeAbandonedStoresOperation store](v189, "store");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v118, "syncIdentity");
                      v119 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v223 = 138543874;
                      *(_QWORD *)&v223[4] = self;
                      *(_WORD *)&v223[12] = 2114;
                      *(_QWORD *)&v223[14] = v86;
                      *(_WORD *)&v223[22] = 2114;
                      v224 = v119;
                      _os_log_impl(&dword_1B7802000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: Child (%{public}@) is not ready to be seized and not owned by another active target, cannot seize candidate target (%{public}@) or any if itschildren.", v223, 0x20u);

                    }
                    objc_msgSend(v79, "allValues");
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v184, "addObjectsFromArray:", v120);

                    objc_msgSend(v184, "addObject:", v189);
                    goto LABEL_72;
                  }
                  if (v99)
                  {
                    v100 = v98;
                    -[HDCloudSyncSeizeAbandonedStoresOperation store](v189, "store");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v101, "syncIdentity");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v223 = 138543874;
                    *(_QWORD *)&v223[4] = self;
                    *(_WORD *)&v223[12] = 2114;
                    *(_QWORD *)&v223[14] = v102;
                    *(_WORD *)&v223[22] = 2114;
                    v224 = v86;
                    _os_log_impl(&dword_1B7802000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: Child is also in seized targets, seize both candidate target (%{public}@) & child (%{public}@)", v223, 0x20u);

                  }
                  objc_msgSend(v79, "objectForKeyedSubscript:", v86);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v184, "removeObject:", v103);

                }
              }
              else
              {
                _HKInitializeLogging();
                v90 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                {
                  v91 = v90;
                  -[HDCloudSyncSeizeAbandonedStoresOperation store](v189, "store");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "syncIdentity");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v223 = 138543618;
                  *(_QWORD *)&v223[4] = self;
                  *(_WORD *)&v223[12] = 2114;
                  *(_QWORD *)&v223[14] = v93;
                  _os_log_impl(&dword_1B7802000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@: TargetHasChildren: An active target also owns this child, candidate target (%{public}@) can continue being seized", v223, 0x16u);

                }
              }
            }
            v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v198, &v212, 16);
            if (v83)
              continue;
            break;
          }
        }
LABEL_72:

      }
LABEL_76:
      v57 = obja + 1;
    }
    while (obja + 1 != (char *)v178);
    v178 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", buf, &v219, 16);
  }
  while (v178);
LABEL_78:

  v124 = (void *)objc_msgSend(v187, "mutableCopy");
  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  v125 = v184;
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v194, &v208, 16);
  if (v126)
  {
    v127 = *(_QWORD *)v195;
    do
    {
      for (k = 0; k != v126; ++k)
      {
        if (*(_QWORD *)v195 != v127)
          objc_enumerationMutation(v125);
        objc_msgSend(v124, "removeObject:", *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * k));
      }
      v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v194, &v208, 16);
    }
    while (v126);
  }

  v129 = v124;
  v130 = (void *)MEMORY[0x1E0C99E60];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "computedState");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "targets");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setWithArray:", v133);
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v129);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "hk_minus:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v136 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v137 = v135;
  v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v204, v223, 16);
  if (v138)
  {
    v139 = *(_QWORD *)v205;
    do
    {
      for (m = 0; m != v138; ++m)
      {
        if (*(_QWORD *)v205 != v139)
          objc_enumerationMutation(v137);
        v141 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * m);
        objc_msgSend(v141, "storeRecord");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "syncIdentity");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = v143 == 0;

        if (!v144)
        {
          objc_msgSend(v141, "storeRecord");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "syncIdentity");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "addObject:", v146);

        }
      }
      v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v204, v223, 16);
    }
    while (v138);
  }

  v202[0] = MEMORY[0x1E0C809B0];
  v202[1] = 3221225472;
  v202[2] = __88__HDCloudSyncSeizeAbandonedStoresOperation__removeTargetsBasedOnUnseizedSyncIdentities___block_invoke;
  v202[3] = &unk_1E6CE9960;
  v203 = v136;
  v147 = v136;
  objc_msgSend(v129, "hk_filter:", v202);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "computedState");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "replaceTargets:", v148);

LABEL_95:
  v151 = v193;
  v183 = v151;
  if (v177)
  {
    v219 = 0u;
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "repository");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "allCKContainers");
    v185 = (id)objc_claimAutoreleasedReturnValue();

    v191 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v219, v223, 16);
    if (v191)
    {
      v188 = *(id *)v220;
      do
      {
        for (n = 0; n != v191; ++n)
        {
          if (*(id *)v220 != v188)
            objc_enumerationMutation(v185);
          v155 = *(id *)(*((_QWORD *)&v219 + 1) + 8 * n);
          -[HDCloudSyncOperation configuration](self, "configuration");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "repository");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "cachedOwnerIdentifierForContainer:", v155);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "string");
          v159 = (void *)objc_claimAutoreleasedReturnValue();

          -[HDCloudSyncOperation configuration](self, "configuration");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "repository");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "syncIdentityManager");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "currentSyncIdentity");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "identity");
          v164 = (void *)objc_claimAutoreleasedReturnValue();

          -[HDCloudSyncOperation configuration](self, "configuration");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "computedState");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "targets");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v212 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v212 + 1) = 3221225472;
          *(_QWORD *)&v213 = __77__HDCloudSyncSeizeAbandonedStoresOperation__updatedStoreRecordsForContainer___block_invoke;
          *((_QWORD *)&v213 + 1) = &unk_1E6D11A10;
          v168 = v155;
          *(_QWORD *)&v214 = v168;
          *((_QWORD *)&v214 + 1) = v159;
          *(_QWORD *)&v215 = v164;
          v169 = v164;
          v170 = v159;
          objc_msgSend(v167, "hk_map:", &v212);
          v171 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v171, "count"))
          {
            -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
            v172 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v172, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v173, v168, v171, 0);

            *(_QWORD *)&v204 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v204 + 1) = 3221225472;
            *(_QWORD *)&v205 = __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke;
            *((_QWORD *)&v205 + 1) = &unk_1E6CE77A0;
            *(_QWORD *)&v206 = self;
            -[HDCloudSyncOperation setOnError:](v174, "setOnError:", &v204);
            *(_QWORD *)&v208 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v208 + 1) = 3221225472;
            *(_QWORD *)&v209 = __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke_203;
            *((_QWORD *)&v209 + 1) = &unk_1E6CE98F8;
            *(_QWORD *)&v210 = self;
            *((_QWORD *)&v210 + 1) = v171;
            -[HDCloudSyncOperation setOnSuccess:](v174, "setOnSuccess:", &v208);
            -[HDCloudSyncOperation start](v174, "start");

          }
        }
        v191 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v219, v223, 16);
      }
      while (v191);
    }

    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
  }
  else
  {
    -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v151);
  }

}

id __69__HDCloudSyncSeizeAbandonedStoresOperation__computeTargetsForSeizure__block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  os_log_t *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  const char *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  os_log_t *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  os_log_t *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  os_log_t v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  uint8_t buf[4];
  uint64_t v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "storeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v3, "purpose") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedOwnerIdentifierForContainer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncIdentityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentSyncIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identity");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "storeRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pendingOwner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (void *)v13;
    if (objc_msgSend(v15, "isEqualToString:", v16))
    {

LABEL_7:
      objc_msgSend(v3, "targetByAddingOptions:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v21 = v108;
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v3, "storeRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pendingSyncIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", v13);

    if (v20)
      goto LABEL_7;
    objc_msgSend(v4, "record");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "modificationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "syncDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v26);
    v28 = fabs(v27);

    if (v28 < *(double *)(a1 + 40))
    {
      v17 = 0;
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "syncDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dateByAddingTimeInterval:", -*(double *)(a1 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v32 = (os_log_t *)MEMORY[0x1E0CB5370];
    v33 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_QWORD *)(a1 + 32);
      v35 = v33;
      objc_msgSend(v4, "storeIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "record");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "modificationDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v113 = v34;
      v32 = (os_log_t *)MEMORY[0x1E0CB5370];
      v114 = 2114;
      v115 = v36;
      v116 = 2114;
      v117 = v38;
      v118 = 2114;
      v119 = v31;
      _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ was abandoned. lastModifiedDate:(%{public}@), timeoutDateForOwnershipTransfer:(%{public}@)", buf, 0x2Au);

    }
    if (objc_msgSend(v4, "hasSequenceWithFutureProtocolVersion"))
    {
      _HKInitializeLogging();
      v39 = *v32;
      if (!os_log_type_enabled(*v32, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        v42 = 0;
        v17 = 0;
        v21 = v108;
LABEL_51:

        goto LABEL_9;
      }
      v40 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v113 = v40;
      v114 = 2114;
      v115 = v4;
      v41 = "%{public}@: store record: %{public}@ is abandoned, but is from the future and cannot be seized by this device.";
LABEL_18:
      _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, v41, buf, 0x16u);
      goto LABEL_19;
    }
    objc_msgSend(v4, "currentSequenceHeaderRecord");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {

    }
    else
    {
      objc_msgSend(v4, "record");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "modificationDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "syncDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSinceDate:", v47);
      v49 = fabs(v48);
      v50 = *MEMORY[0x1E0CB4648];

      if (v49 < v50)
      {
        _HKInitializeLogging();
        v39 = *v32;
        if (!os_log_type_enabled(*v32, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v51 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v113 = v51;
        v114 = 2114;
        v115 = v4;
        v41 = "%{public}@: store record: %{public}@ is abandoned, but it has no sequence records, so we don't know if we "
              "can safely seize it";
        goto LABEL_18;
      }
    }
    v104 = v31;
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "repository");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "profile");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "legacyRepositoryProfile");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "syncContainerPrefix");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ownerIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncIdentity");
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "zoneIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "containerIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0;
    v57 = (void *)v54;
    +[HDCloudSyncStore syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:](HDCloudSyncStore, "syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:", v105, v95, v52, v53, v54, v56, &v111);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v111;

    if (v58)
    {
      v110 = v100;
      objc_msgSend(v58, "receivedSyncAnchorMapWithError:", &v110);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v110;

      -[HDCloudSyncSeizeAbandonedStoresOperation anchorMapForTakeoverForTarget:](*(void **)(a1 + 32), v3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "_syncAnchorMapByStrippingBlockedEntities:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61 && (HDSyncAnchorMapIsSuperset(v61, v59) & 1) == 0)
      {
        v103 = v59;
        v107 = v42;
        _HKInitializeLogging();
        v71 = (os_log_t *)MEMORY[0x1E0CB5370];
        v72 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v73 = v58;
          v74 = *(_QWORD *)(a1 + 32);
          v75 = v72;
          objc_msgSend(v4, "storeIdentifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v113 = v74;
          v58 = v73;
          v114 = 2114;
          v115 = v76;
          v116 = 2114;
          v117 = v73;
          _os_log_impl(&dword_1B7802000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ has been abandoned, but the local anchor map in the local store: %{public}@ is less than the received anchor map.", buf, 0x20u);

        }
        _HKInitializeLogging();
        v77 = *v71;
        if (os_log_type_enabled(*v71, OS_LOG_TYPE_DEFAULT))
        {
          v78 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v113 = v78;
          v114 = 2114;
          v115 = v103;
          _os_log_impl(&dword_1B7802000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@: Local anchor map: %{public}@", buf, 0x16u);
        }
        _HKInitializeLogging();
        v79 = *v71;
        if (os_log_type_enabled(*v71, OS_LOG_TYPE_DEFAULT))
        {
          v80 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v113 = v80;
          v114 = 2114;
          v115 = v61;
          _os_log_impl(&dword_1B7802000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@: Received anchor map: %{public}@", buf, 0x16u);
        }

        v17 = 0;
        v42 = v107;
        v21 = v108;
        v31 = v104;
        goto LABEL_50;
      }

      v21 = v108;
      v31 = v104;
      v62 = (os_log_t *)MEMORY[0x1E0CB5370];
LABEL_47:

      _HKInitializeLogging();
      v93 = *v62;
      if (os_log_type_enabled(*v62, OS_LOG_TYPE_DEFAULT))
      {
        v94 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v113 = v94;
        v114 = 2114;
        v115 = v4;
        _os_log_impl(&dword_1B7802000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ has been abandoned, and will be seized.", buf, 0x16u);
      }
      objc_msgSend(v3, "targetByAddingOptions:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_50:

      goto LABEL_51;
    }
    objc_msgSend(v4, "storeIdentifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "repository");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "profile");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "legacyRepositoryProfile");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v100;
    +[HDCloudSyncStoreEntity persistedStateForStoreUUID:profile:error:](HDCloudSyncStoreEntity, "persistedStateForStoreUUID:profile:error:", v99, v66, &v109);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v109;

    if (!v67)
    {
      _HKInitializeLogging();
      v81 = (void *)*MEMORY[0x1E0CB5370];
      v31 = v104;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v82 = *(_QWORD *)(a1 + 32);
        v83 = v81;
        objc_msgSend(v4, "storeIdentifier");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v82;
        v114 = 2114;
        v115 = v84;
        _os_log_impl(&dword_1B7802000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ was not found locally", buf, 0x16u);

      }
      v17 = 0;
      v42 = v106;
      v21 = v108;
      v58 = 0;
      goto LABEL_50;
    }
    objc_msgSend(v67, "ownerIdentifier");
    v68 = v67;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ownerIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v108;
    v31 = v104;
    v62 = (os_log_t *)MEMORY[0x1E0CB5370];
    v102 = v68;
    if (v69 == v70)
    {
      objc_msgSend(v68, "containerIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "zoneIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "containerIdentifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = v85 == v87;
      v21 = v108;
      if (v88)
      {
        v58 = 0;
        v42 = v106;
LABEL_46:
        v59 = v102;
        goto LABEL_47;
      }
    }
    else
    {

    }
    _HKInitializeLogging();
    v89 = *v62;
    v42 = v106;
    if (os_log_type_enabled(*v62, OS_LOG_TYPE_DEFAULT))
    {
      v90 = *(_QWORD *)(a1 + 32);
      v91 = v89;
      objc_msgSend(v4, "storeIdentifier");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v113 = v90;
      v114 = 2114;
      v115 = v92;
      _os_log_impl(&dword_1B7802000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@: store record: %{public}@ is also present in another container. Seize this.", buf, 0x16u);

      v21 = v108;
    }
    v58 = 0;
    goto LABEL_46;
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (id)anchorMapForTakeoverForTarget:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  HDCloudSyncCachedZone *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "storeRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shardPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (v7 == 2)
    {
      v8 = [HDCloudSyncCachedZone alloc];
      objc_msgSend(v4, "zoneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "repository");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessibilityAssertion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v8, "initForZoneIdentifier:repository:accessibilityAssertion:", v9, v11, v13);

      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__213;
      v28 = __Block_byref_object_dispose__213;
      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = objc_opt_class();
      v23 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke;
      v20[3] = &unk_1E6CEB4C0;
      v21 = v4;
      v22 = &v24;
      objc_msgSend(v14, "recordsForClass:epoch:error:enumerationHandler:", v15, 0, &v23, v20);
      v16 = v23;
      +[HDSyncAnchorMap syncAnchorMapWithDictionary:](HDSyncAnchorMap, "syncAnchorMapWithDictionary:", v25[5]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v24, 8);
    }
    else
    {
      objc_msgSend(v4, "storeRecord");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sequenceRecord");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "syncAnchorMap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(v3, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sequenceRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HDCloudSyncChangeRecord isChangeRecord:inSequence:](HDCloudSyncChangeRecord, "isChangeRecord:inSequence:", v4, v6);

  if (v7)
  {
    objc_msgSend(v3, "decodedSyncAnchorRangeMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke_2;
    v10[3] = &unk_1E6D0C908;
    v10[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v10);

  }
  return 1;
}

void __74__HDCloudSyncSeizeAbandonedStoresOperation_anchorMapForTakeoverForTarget___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v7 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (a4 <= v9)
    v10 = v9;
  else
    v10 = a4;
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v7);

}

uint64_t __88__HDCloudSyncSeizeAbandonedStoresOperation__removeTargetsBasedOnUnseizedSyncIdentities___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "storeRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v4);

  return v2 ^ 1;
}

uint64_t __76__HDCloudSyncSeizeAbandonedStoresOperation__computeAllActiveTargetsByChild___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

BOOL __74__HDCloudSyncSeizeAbandonedStoresOperation__childSyncIdentitiesWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "childIdentitiesForCurrentSyncIdentityWithTransaction:error:", v6, &v18);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = v18;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v13)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v10;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read child sync identities: %{public}@", buf, 0x16u);
    }
    v15 = v10;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

  }
  return v13 != 0;
}

void __80__HDCloudSyncSeizeAbandonedStoresOperation__childTargetBySyncIdentityForParent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "storeRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sequenceRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "includedChildSyncIdentities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storeRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "containsObject:", v10);

  if (v11)
  {
    objc_msgSend(v14, "storeRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v13, v14);

  }
}

id __77__HDCloudSyncSeizeAbandonedStoresOperation__updatedStoreRecordsForContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_5;
  if ((objc_msgSend(v3, "options") & 2) == 0)
    goto LABEL_5;
  objc_msgSend(v3, "storeRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pendingOwner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v10 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "storeRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pendingSyncIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 48));

  if ((v13 & 1) == 0)
  {
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "storeRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPendingOwner:", v16);

    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "storeRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPendingSyncIdentity:", v18);

    objc_msgSend(v3, "storeRecord");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "record");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v14 = 0;
  }

  return v14;
}

void __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark pending owner for store records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __78__HDCloudSyncSeizeAbandonedStoresOperation__markPendingOwnerForSeizureTargets__block_invoke_203(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Marked pending owner in %ld store records.", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
