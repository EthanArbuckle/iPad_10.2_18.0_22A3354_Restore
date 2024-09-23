@implementation HDCloudSyncPipelineStagePush

+ (id)operationTagDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDCloudSyncPipelineStagePush)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncPipelineStagePush *v4;
  HDCloudSyncPipelineStagePush *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncPipelineStagePush;
  v4 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v7, sel_initWithConfiguration_cloudState_, a3, a4);
  v5 = v4;
  if (v4)
    -[HDCloudSyncPipelineStage setExpectedSendSize:](v4, "setExpectedSendSize:", 2);
  return v5;
}

- (void)main
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HDSyncIdentity *v15;
  HDSyncIdentity *currentSyncIdentity;
  HDCloudSyncPipelineStagePush *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDSyncIdentity *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  uint64_t v109;
  int v110;
  NSObject *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  id v117;
  HDCloudSyncCompoundOperation *v118;
  void *v119;
  void *v120;
  void *v121;
  _BOOL4 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t j;
  id v126;
  HDCloudSyncCompoundOperation *v127;
  void *v128;
  HDCloudSyncCompoundOperation *v129;
  HDCloudSyncPreparePushZoneForStoreOperation *v130;
  void *v131;
  HDCloudSyncPreparePushZoneForStoreOperation *v132;
  HDCloudSyncPushStoreOperation *v133;
  void *v134;
  void *v135;
  HDCloudSyncPushStoreOperation *v136;
  HDCloudSyncPreparePushZoneForStoreOperation *v137;
  HDCloudSyncPushStoreOperation *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  BOOL v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  BOOL v152;
  void *v153;
  uint64_t v154;
  HDCloudSyncDeleteStoresOperation *v155;
  void *v156;
  void *v157;
  HDCloudSyncDeleteStoresOperation *v158;
  HDCloudSyncCompoundOperation *v159;
  void *v160;
  char v161;
  HDCloudSyncBlockOperation *v162;
  void *v163;
  void *v164;
  HDCloudSyncBlockOperation *v165;
  HDCloudSyncCompoundOperation *v166;
  void *v167;
  void *v168;
  NSObject *v169;
  void *v170;
  void *v171;
  NSObject *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  int v185;
  void *v186;
  id v187;
  void *v188;
  BOOL v189;
  void *v190;
  void *v191;
  id obj;
  id obja;
  id objb;
  id v195;
  id v196;
  HDCloudSyncCompoundOperation *v197;
  _QWORD v199[5];
  _QWORD v200[4];
  id v201;
  HDCloudSyncPipelineStagePush *v202;
  id v203;
  id v204;
  _QWORD v205[4];
  HDCloudSyncCompoundOperation *v206;
  _QWORD v207[4];
  id v208;
  _QWORD v209[4];
  HDCloudSyncCompoundOperation *v210;
  _QWORD v211[4];
  id v212;
  _QWORD v213[4];
  id v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  id v219;
  uint8_t v220[4];
  HDCloudSyncPipelineStagePush *v221;
  __int16 v222;
  uint64_t v223;
  _QWORD v224[4];
  id v225;
  _BYTE *v226;
  _BYTE v227[24];
  void *v228;
  _BYTE v229[20];
  _BYTE buf[24];
  void *v231;
  id v232;
  uint64_t v233;

  v233 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 4) != 0)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping due to pipeline options.", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    return;
  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyRepositoryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = 0;
  v9 = HDUpgradedToSyncIdentity(v8, (uint64_t)&v204);
  v10 = v204;

  if (v10)
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);
    goto LABEL_111;
  }
  if (v9)
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

    v17 = self;
    v189 = self == 0;
  }
  else
  {
    v17 = self;
    if (!self)
    {
      v203 = 0;
      v191 = 0;
LABEL_113:
      v197 = 0;
      goto LABEL_107;
    }
    v189 = 0;
  }
  -[HDCloudSyncOperation configuration](v17, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "computedState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pushTargets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hk_map:", &__block_literal_global_214);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v195 = v21;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "repository");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "primaryCKContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "repository");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cachedOwnerIdentifierForContainer:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "string");
  obj = (id)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation profile](self, "profile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "syncDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "syncContainerPrefix");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "containerIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self->_currentSyncIdentity;
  *(_QWORD *)&v215 = 0;
  +[HDCloudSyncStore createOrUpdateShardStoresForProfile:throughDate:syncCircleName:ownerIdentifier:containerIdentifier:syncIdentity:error:](HDCloudSyncStore, "createOrUpdateShardStoresForProfile:throughDate:syncCircleName:ownerIdentifier:containerIdentifier:syncIdentity:error:", v28, v30, v32, obj, v33, v34, &v215);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)v215;

  if (v35)
  {
    if (objc_msgSend(v35, "count"))
    {
      objc_msgSend(v195, "hk_mapToSet:", &__block_literal_global_213_0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __66__HDCloudSyncPipelineStagePush__pushStoresByAddingShardsToStores___block_invoke_2;
      v231 = &unk_1E6CE9B08;
      v232 = v37;
      v38 = v37;
      objc_msgSend(v35, "hk_filter:", buf);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "arrayByAddingObjectsFromArray:", v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  else
  {
    _HKInitializeLogging();
    v41 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "Failed to lookup look up shards during push store computation: %{public}@", buf, 0xCu);
    }
  }
  v40 = v195;
LABEL_17:

  if (objc_msgSend(v40, "count"))
  {
    v42 = v40;
  }
  else
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "repository");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "primaryCKContainer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v215 = 0;
    objc_msgSend(v43, "pushStoresForContainer:error:", v46, &v215);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)v215;
    objc_msgSend(v47, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "storeIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = v50;
    }
    else
    {
      if (v48)
      {
        _HKInitializeLogging();
        v52 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v48;
          _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "Failed to compute sync store identifier: %{public}@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v51 = (id)objc_claimAutoreleasedReturnValue();
    }
    v53 = v51;

    -[HDCloudSyncOperation configuration](self, "configuration");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "repository");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "primaryCKContainer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v227 = 0;
    objc_msgSend(v54, "pushStoreWithIdentifier:container:error:", v53, v57, v227);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = *(id *)v227;

    if (v58)
    {
      v224[0] = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 1);
      v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v60 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v59;
        _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "Failed to create sync store with ID: %{public}@ error:%{public}@", buf, 0x16u);
      }
      v42 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  v203 = 0;
  v61 = v42;
  v191 = v61;
  if (v189)
    goto LABEL_113;
  objc_msgSend(v61, "hk_firstObjectPassingTest:", &__block_literal_global_198);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "hk_filter:", &__block_literal_global_199);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v190)
  {
    _HKInitializeLogging();
    v111 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v111, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; no staging store found",
        buf,
        0xCu);
    }
    goto LABEL_62;
  }
  v196 = v190;
  v62 = v191;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "computedState");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "pushTargets");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "count") == 0;

  if (v66)
  {
    _HKInitializeLogging();
    v112 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v227 = 138543362;
      *(_QWORD *)&v227[4] = self;
      _os_log_impl(&dword_1B7802000, v112, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; no push targets found",
        v227,
        0xCu);
    }
    goto LABEL_59;
  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "context");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (objc_msgSend(v68, "options") & 8) == 0;

  if (!v69)
  {
LABEL_59:

    goto LABEL_60;
  }
  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  obja = v62;
  v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v215, buf, 16);
  if (!v70)
    goto LABEL_48;
  v71 = *(_QWORD *)v216;
  while (2)
  {
    for (i = 0; i != v70; ++i)
    {
      if (*(_QWORD *)v216 != v71)
        objc_enumerationMutation(obja);
      v73 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * i);
      objc_msgSend(v73, "persistedStateWithError:", &v203);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (!v74)
      {
        v105 = 0;
        goto LABEL_95;
      }
      objc_msgSend(v74, "rebaseDeadline");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76 == 0;

      if (!v77)
      {
        objc_msgSend(v75, "rebaseDeadline");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "syncDate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "timeIntervalSinceDate:", v80);
        v82 = v81;

        if (v82 < *MEMORY[0x1E0CB7570])
        {
          _HKInitializeLogging();
          v171 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v172 = v171;
            objc_msgSend(v75, "rebaseDeadline");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = *MEMORY[0x1E0CB7570];
            *(_DWORD *)v227 = 138544386;
            *(_QWORD *)&v227[4] = self;
            *(_WORD *)&v227[12] = 2114;
            *(_QWORD *)&v227[14] = v73;
            *(_WORD *)&v227[22] = 2114;
            v228 = v173;
            *(_WORD *)v229 = 2048;
            *(_QWORD *)&v229[2] = v174;
            *(_WORD *)&v229[10] = 2048;
            *(double *)&v229[12] = v82;
            _os_log_impl(&dword_1B7802000, v172, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; %{public}@ near rebase deadline of %{public}@ (trigger threshold is %0.1lf"
              "s, remaining interval is %0.1lfs)",
              v227,
              0x34u);

          }
LABEL_94:
          v105 = 1;
LABEL_95:

          v175 = obja;
          goto LABEL_102;
        }
      }
      objc_msgSend(v73, "storeIdentifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "storeIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v83, "isEqual:", v84);

      if ((v85 & 1) == 0)
      {
        objc_msgSend(v75, "lastSyncDate");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v86)
          goto LABEL_90;
        objc_msgSend(v75, "lastSyncDate");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "syncDate");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "timeIntervalSinceDate:", v89);
        v91 = v90 < -1814400.0;

        if (v91)
        {
LABEL_90:
          _HKInitializeLogging();
          v168 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v169 = v168;
            objc_msgSend(v75, "lastSyncDate");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v227 = 138544130;
            *(_QWORD *)&v227[4] = self;
            *(_WORD *)&v227[12] = 2114;
            *(_QWORD *)&v227[14] = v73;
            *(_WORD *)&v227[22] = 2114;
            v228 = v170;
            *(_WORD *)v229 = 2114;
            *(_QWORD *)&v229[2] = v73;
            _os_log_impl(&dword_1B7802000, v169, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; %{public}@ last sync date (%{public}@) is too old for %{public}@",
              v227,
              0x2Au);

          }
          goto LABEL_94;
        }
      }

    }
    v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v215, buf, 16);
    if (v70)
      continue;
    break;
  }
LABEL_48:

  -[HDCloudSyncOperation configuration](self, "configuration");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "computedState");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "pushTargets");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v213[0] = MEMORY[0x1E0C809B0];
  v213[1] = 3221225472;
  v213[2] = __83__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_error___block_invoke;
  v213[3] = &unk_1E6CE9960;
  v95 = v196;
  v214 = v95;
  objc_msgSend(v94, "hk_firstObjectPassingTest:", v213);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "cachedCloudState");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "storeRecord");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "recordID");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "repository");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "primaryCKContainer");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "containerIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "zoneForRecordID:containerIdentifier:error:", v100, v104, &v203);
    v186 = (void *)objc_claimAutoreleasedReturnValue();

    if (v186)
    {
      v105 = (uint64_t)v227;
      *(_QWORD *)v227 = 0;
      *(_QWORD *)&v227[8] = v227;
      *(_QWORD *)&v227[16] = 0x2020000000;
      v228 = 0;
      v106 = objc_opt_class();
      v224[0] = MEMORY[0x1E0C809B0];
      v224[1] = 3221225472;
      v224[2] = __83__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_error___block_invoke_2;
      v224[3] = &unk_1E6CE9988;
      v225 = v95;
      v226 = v227;
      objc_msgSend(v186, "recordsForClass:error:filter:", v106, &v203, v224);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      if (v107)
      {
        if (*(uint64_t *)(*(_QWORD *)&v227[8] + 24) < 400)
        {
          v110 = 1;
        }
        else
        {
          _HKInitializeLogging();
          v108 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v109 = *(_QWORD *)(*(_QWORD *)&v227[8] + 24);
            *(_DWORD *)v220 = 138543618;
            v221 = self;
            v222 = 2048;
            v223 = v109;
            _os_log_impl(&dword_1B7802000, v108, OS_LOG_TYPE_DEFAULT, "%{public}@: Full sync required; staging store has too many change records (%ld)",
              v220,
              0x16u);
          }
          v110 = 0;
          v105 = 1;
        }
      }
      else
      {
        v110 = 0;
        v105 = 0;
      }

      _Block_object_dispose(v227, 8);
      if (v110)
        goto LABEL_100;
    }
    else
    {
      v105 = 0;
    }
  }
  else
  {
LABEL_100:
    v105 = 2;
  }

  v175 = v214;
LABEL_102:

  if (!v105)
    goto LABEL_105;
  if (v105 == 1)
  {
LABEL_60:
    objc_msgSend(v196, "persistedStateWithError:", &v203);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v113;
    if (v113)
    {
      objc_msgSend(v113, "stateByRequiringUrgentRebase");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v196, "persistState:error:", v115, &v203);

      if (v116)
      {
LABEL_62:
        v117 = v188;
        v185 = 1;
        goto LABEL_63;
      }
    }
LABEL_105:
    v197 = 0;
    goto LABEL_106;
  }
  v219 = v196;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v219, 1);
  v117 = (id)objc_claimAutoreleasedReturnValue();
  v185 = 0;
LABEL_63:
  v187 = v117;
  v118 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v118, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v119, 0, CFSTR("Push Stores"), 1);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "context");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (objc_msgSend(v121, "options") & 0x80) == 0;

  if (v122)
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v197, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  objc_msgSend(v187, "sortedArrayUsingComparator:", &__block_literal_global_12);
  objb = (id)objc_claimAutoreleasedReturnValue();
  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  v123 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v215, buf, 16);
  if (v123)
  {
    v124 = *(_QWORD *)v216;
    do
    {
      for (j = 0; j != v123; ++j)
      {
        if (*(_QWORD *)v216 != v124)
          objc_enumerationMutation(objb);
        v126 = *(id *)(*((_QWORD *)&v215 + 1) + 8 * j);
        v127 = [HDCloudSyncCompoundOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v127, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v128, 0, CFSTR("Prepare & Push"), 0);

        v130 = [HDCloudSyncPreparePushZoneForStoreOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = -[HDCloudSyncPreparePushZoneForStoreOperation initWithConfiguration:cloudState:store:](v130, "initWithConfiguration:cloudState:store:", v131, 0, v126);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v129, "addOperation:transitionHandler:", v132, 0);
        v133 = [HDCloudSyncPushStoreOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation cloudState](self, "cloudState");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = -[HDCloudSyncPushStoreOperation initWithConfiguration:cloudState:target:](v133, "initWithConfiguration:cloudState:target:", v134, v135, 0);

        *(_QWORD *)v227 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v227[8] = 3221225472;
        *(_QWORD *)&v227[16] = __56__HDCloudSyncPipelineStagePush__pushOperationWithStore___block_invoke;
        v228 = &unk_1E6CE9AA0;
        *(_QWORD *)v229 = v136;
        *(_QWORD *)&v229[8] = v132;
        v137 = v132;
        v138 = v136;
        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v129, "addOperation:transitionHandler:", v138, v227);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v197, "addOperation:transitionHandler:", v129, 0);
      }
      v123 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v215, buf, 16);
    }
    while (v123);
  }

  -[HDCloudSyncOperation configuration](self, "configuration");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "repository");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "profile");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "cloudSyncManager");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v142, "supportsRebase"))
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "context");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = (objc_msgSend(v144, "options") & 0x40) == 0;

    if (v145)
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "computedState");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "pushTargets");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "hk_map:", &__block_literal_global_196);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_76;
    }
    v146 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {

    v146 = (void *)MEMORY[0x1E0C9AA60];
LABEL_76:

  }
  if (v185)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "computedState");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "pushTargets");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v211[0] = MEMORY[0x1E0C809B0];
    v211[1] = 3221225472;
    v211[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_200;
    v211[3] = &unk_1E6CE9960;
    v212 = v190;
    objc_msgSend(v149, "hk_firstObjectPassingTest:", v211);
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v150, "storeRecord");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v151 == 0;

    if (!v152)
    {
      objc_msgSend(v150, "storeRecord");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "arrayByAddingObject:", v153);
      v154 = objc_claimAutoreleasedReturnValue();

      v146 = (void *)v154;
    }

  }
  if (objc_msgSend(v146, "count"))
  {
    v155 = [HDCloudSyncDeleteStoresOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = -[HDCloudSyncDeleteStoresOperation initWithConfiguration:cloudState:storeRecordsToDelete:](v155, "initWithConfiguration:cloudState:storeRecordsToDelete:", v156, v157, v146);
    v209[0] = MEMORY[0x1E0C809B0];
    v209[1] = 3221225472;
    v209[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_2_202;
    v209[3] = &unk_1E6CE9A50;
    v159 = v197;
    v210 = v159;
    -[HDCloudSyncOperation operationWithRunCondition:](v158, "operationWithRunCondition:", v209);
    v160 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v159, "addOperation:transitionHandler:", v160, 0);
  }
  v161 = v185 ^ 1;
  if (!v190)
    v161 = 1;
  if ((v161 & 1) == 0)
  {
    v162 = [HDCloudSyncBlockOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v207[0] = MEMORY[0x1E0C809B0];
    v207[1] = 3221225472;
    v207[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_3;
    v207[3] = &unk_1E6CE9A78;
    v208 = v190;
    v165 = -[HDCloudSyncBlockOperation initWithConfiguration:cloudState:synchronousBlock:](v162, "initWithConfiguration:cloudState:synchronousBlock:", v163, v164, v207);
    v205[0] = MEMORY[0x1E0C809B0];
    v205[1] = 3221225472;
    v205[2] = __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_4;
    v205[3] = &unk_1E6CE9A50;
    v166 = v197;
    v206 = v166;
    -[HDCloudSyncOperation operationWithRunCondition:](v165, "operationWithRunCondition:", v205);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v166, "addOperation:transitionHandler:", v167, 0);
  }

LABEL_106:
LABEL_107:

  v10 = v203;
  if (v197)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "repository");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "profile");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "legacyRepositoryProfile");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    HDUpdateOldestSampleStartDateForProfile(v179);

    v200[0] = MEMORY[0x1E0C809B0];
    v200[1] = 3221225472;
    v200[2] = __36__HDCloudSyncPipelineStagePush_main__block_invoke;
    v200[3] = &unk_1E6CE98F8;
    v201 = v191;
    v202 = self;
    -[HDCloudSyncOperation setOnSuccess:](v197, "setOnSuccess:", v200);
    v199[0] = MEMORY[0x1E0C809B0];
    v199[1] = 3221225472;
    v199[2] = __36__HDCloudSyncPipelineStagePush_main__block_invoke_185;
    v199[3] = &unk_1E6CE77A0;
    v199[4] = self;
    -[HDCloudSyncOperation setOnError:](v197, "setOnError:", v199);
    -[HDCloudSyncOperation progress](v197, "progress");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v180, "totalUnitCount");

    -[HDCloudSyncOperation progress](self, "progress");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "setTotalUnitCount:", objc_msgSend(v182, "totalUnitCount") + v181);

    -[HDCloudSyncOperation progress](self, "progress");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation progress](v197, "progress");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addChild:withPendingUnitCount:", v184, v181);

    -[HDCloudSyncCompoundOperation start](v197, "start");
  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);
  }

LABEL_111:
}

void __36__HDCloudSyncPipelineStagePush_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
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
  void *v24;
  char v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const __CFString *v35;
  int v36;
  id v37;
  char v38;
  id v39;
  NSObject *v40;
  char v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  const __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyRepositoryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v7 = +[HDCloudSyncStoreEntity resetLastSyncDateExcludingStores:profile:error:](HDCloudSyncStoreEntity, "resetLastSyncDateExcludingStores:profile:error:", v2, v6, &v48);
  v8 = (const __CFString *)v48;

  if (!v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v45 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v54 = v45;
      v55 = 2114;
      v56 = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to reset last sync dates, %{public}@", buf, 0x16u);
    }
  }
  v46 = (__CFString *)v8;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "repository");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "legacyRepositoryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    HDCloudSyncKeyValueDomainWithProfile(v16);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "primaryCKContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "containerIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncLastSuccessfulPushKeyForContainerIdentifier((uint64_t)v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "primaryCKContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "containerIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncLastSuccessfulLitePushKeyForContainerIdentifier((uint64_t)v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "options");

    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v27 = CFSTR("lite ");
      if ((v25 & 0x80) == 0)
        v27 = &stru_1E6D11BB8;
      *(_DWORD *)buf = 138543618;
      v54 = v10;
      v55 = 2114;
      v56 = v27;
      _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Recording successful cloud sync %{public}@push", buf, 0x16u);
    }
    if (v25 < 0)
      v28 = v22;
    else
      v28 = v19;
    v52 = 0;
    v29 = objc_msgSend(v47, "setDate:forKey:error:", v12, v28, &v52);
    v30 = v52;
    if (v29)
    {
      objc_msgSend(v10, "profile");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cloudSyncManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v25 < 0)
        objc_msgSend(v32, "didCompleteSuccessfulLitePushWithDate:", v12);
      else
        objc_msgSend(v32, "didCompleteSuccessfulPushWithDate:", v12);

    }
    else
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v35 = CFSTR("Lite ");
        if ((v25 & 0x80) == 0)
          v35 = &stru_1E6D11BB8;
        *(_DWORD *)buf = 138543618;
        v54 = v30;
        v55 = 2114;
        v56 = v35;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Failed to record successful %{public}@push: %{public}@.", buf, 0x16u);
      }
    }
    v51 = v30;
    v36 = HDUpgradedToSyncIdentity(v16, (uint64_t)&v51);
    v37 = v51;

    if (v36)
    {
      v50 = v37;
      v38 = HDSetCompletedTransitionToSyncIdentity(1, v16, (uint64_t)&v50);
      v39 = v50;

      if ((v38 & 1) == 0)
      {
        _HKInitializeLogging();
        v40 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v54 = v39;
          _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "Failed to record completion of transition to sync identity: %{public}@.", buf, 0xCu);
        }
      }
    }
    else
    {
      v39 = v37;
    }
    v49 = v39;
    v41 = HDSetUpgradedToSyncIdentity(1, v16, (uint64_t)&v49);
    v42 = v49;

    if ((v41 & 1) == 0)
    {
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v54 = v42;
        _os_log_error_impl(&dword_1B7802000, v43, OS_LOG_TYPE_ERROR, "Failed to record has upgraded to sync identity based stores: %{public}@.", buf, 0xCu);
      }
    }
    HDSetCloudSyncLastSuccessfulPushDateForCoordinatedSync(v12, v16);

    v44 = *(void **)(a1 + 40);
  }
  else
  {
    v44 = 0;
  }
  objc_msgSend(v44, "finishWithSuccess:error:", 1, 0);

}

uint64_t __36__HDCloudSyncPipelineStagePush_main__block_invoke_185(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

uint64_t __64__HDCloudSyncPipelineStagePush__combinedPushOperationForStores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "shardPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shardPredicate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v6)
    goto LABEL_4;
  if (!v7)
  {
    v9 = -1;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "compare:", v7);
  if (!v9)
  {
LABEL_4:
    objc_msgSend(v4, "storeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:", v11);

  }
LABEL_6:

  return v9;
}

uint64_t __83__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

uint64_t __83__HDCloudSyncPipelineStagePush__requiresFullSyncWithStagingStore_pushStores_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v8 = objc_msgSend(v3, "childRecordCount");
    if (v7 <= v8)
      v9 = v8;
    else
      v9 = v7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  }

  return 0;
}

id __63__HDCloudSyncPipelineStagePush__obsoleteStoreRecordsForCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (!objc_msgSend(v2, "purpose") && (objc_msgSend(v2, "options") & 4) != 0)
  {
    objc_msgSend(v2, "storeRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "shardPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 2;

  return v3;
}

BOOL __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "shardPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") != 2;

  return v3;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_200(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_2_202(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasEncounteredSubOperationError") ^ 1;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "persistedStateWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "stateByResettingRebaselineDeadline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "persistState:error:", v8, a3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __83__HDCloudSyncPipelineStagePush__computePushAndCleanupOperationForPushStores_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasEncounteredSubOperationError") ^ 1;
}

void __56__HDCloudSyncPipelineStagePush__pushOperationWithStore___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "pushTarget");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTarget:", v2);

}

uint64_t __66__HDCloudSyncPipelineStagePush__pushStoresByAddingShardsToStores___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeIdentifier");
}

uint64_t __66__HDCloudSyncPipelineStagePush__pushStoresByAddingShardsToStores___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

id __43__HDCloudSyncPipelineStagePush__pushStores__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "options") & 4) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
}

@end
