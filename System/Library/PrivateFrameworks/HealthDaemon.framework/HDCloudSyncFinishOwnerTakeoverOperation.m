@implementation HDCloudSyncFinishOwnerTakeoverOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)operationTagDependencies
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  v3[1] = 0x1E6D4D5B8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)main
{
  HDSynchronousTaskGroup *v3;
  HDSynchronousTaskGroup *taskGroup;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t j;
  uint64_t v90;
  void *v91;
  int v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t k;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  uint64_t m;
  void *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  void *v132;
  HDCloudSyncFinishOwnerTakeoverOperation *v133;
  void *v134;
  void *v135;
  void *v136;
  char *v137;
  void *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t n;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  id v156;
  id v157;
  void *v158;
  NSObject *v159;
  uint64_t v160;
  void *v161;
  HDCloudSyncModifyRecordZonesOperation *v162;
  void *v163;
  HDCloudSyncModifyRecordZonesOperation *v164;
  uint64_t v165;
  id v166;
  id v167;
  void *v168;
  NSObject *v169;
  uint64_t v170;
  void *v171;
  HDCloudSyncModifyRecordsOperation *v172;
  void *v173;
  HDCloudSyncModifyRecordsOperation *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  NSObject *v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  id v187;
  id v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  char *v194;
  HDCloudSyncFinishOwnerTakeoverOperation *v195;
  id obj;
  id obja;
  id objb;
  id v199;
  id v200;
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _QWORD v210[4];
  id v211;
  _QWORD v212[4];
  id v213;
  _QWORD v214[4];
  id v215;
  HDCloudSyncFinishOwnerTakeoverOperation *v216;
  _QWORD v217[4];
  id v218;
  HDCloudSyncFinishOwnerTakeoverOperation *v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  _QWORD v228[5];
  id v229;
  _QWORD v230[5];
  id v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  uint64_t v240;
  uint64_t v241;
  void (*v242)(uint64_t, uint64_t, void *);
  void *v243;
  HDCloudSyncFinishOwnerTakeoverOperation *v244;
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  uint8_t buf[4];
  HDCloudSyncFinishOwnerTakeoverOperation *v254;
  __int16 v255;
  _BYTE v256[24];
  _BYTE v257[24];
  void *v258;
  HDCloudSyncFinishOwnerTakeoverOperation *v259;
  uint64_t v260;

  v260 = *MEMORY[0x1E0C80C00];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v195 = self;
  if (!v8)
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    return;
  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncIdentityManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentSyncIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "computedState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "targets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v230[0] = MEMORY[0x1E0C809B0];
  v230[1] = 3221225472;
  v230[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke;
  v230[3] = &unk_1E6CF9558;
  v230[4] = self;
  v18 = v13;
  v231 = v18;
  objc_msgSend(v16, "hk_filter:", v230);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "computedState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "targets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v228[0] = v17;
  v228[1] = 3221225472;
  v228[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2;
  v228[3] = &unk_1E6CF9558;
  v228[4] = self;
  v184 = v18;
  v229 = v184;
  objc_msgSend(v22, "hk_filter:", v228);
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v19;
  if (!objc_msgSend(v19, "count") && !objc_msgSend(v185, "count"))
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    v176 = v184;
    goto LABEL_106;
  }
  v183 = v19;
  v24 = v19;
  v199 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v252 = 0u;
  obj = v24;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v249, buf, 16);
  if (!v26)
    goto LABEL_20;
  v27 = v26;
  v28 = *(_QWORD *)v250;
  do
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(_QWORD *)v250 != v28)
        objc_enumerationMutation(obj);
      v30 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * i);
      objc_msgSend(v30, "storeRecord");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "syncIdentity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "objectForKeyedSubscript:", v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "storeRecord");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "syncIdentity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if (v36)
          goto LABEL_11;
      }
      else
      {
        v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v30, "storeRecord");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "syncIdentity");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "setObject:forKeyedSubscript:", v33, v44);

        if (v36)
          goto LABEL_11;
      }
      v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v30, "storeRecord");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "syncIdentity");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v36, v46);

LABEL_11:
      objc_msgSend(v30, "storeRecord");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "activeSequenceHeaderRecord");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v38, "includedSyncIdentities");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "allObjects");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObjectsFromArray:", v40);

        objc_msgSend(v38, "includedIdentifiers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "allObjects");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v42);
      }
      else
      {
        objc_msgSend(v30, "storeRecord");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "currentSequenceHeaderRecord");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
          goto LABEL_18;
        objc_msgSend(v41, "includedSyncIdentities");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allObjects");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObjectsFromArray:", v49);

        objc_msgSend(v41, "includedIdentifiers");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "allObjects");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v50);

      }
LABEL_18:

    }
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v249, buf, 16);
  }
  while (v27);
LABEL_20:

  v51 = v185;
  v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v252 = 0u;
  v193 = v51;
  v53 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v249, buf, 16);
  if (!v53)
    goto LABEL_34;
  v54 = v53;
  v55 = *(_QWORD *)v250;
  while (2)
  {
    v56 = 0;
    while (2)
    {
      if (*(_QWORD *)v250 != v55)
        objc_enumerationMutation(v193);
      v57 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * v56);
      objc_msgSend(v57, "storeRecord");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ownerIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", v59);
      v60 = (id)objc_claimAutoreleasedReturnValue();

      if (!v60)
      {
        v60 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v57, "storeRecord");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "ownerIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v60, v62);

      }
      objc_msgSend(v57, "storeRecord");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "activeSequenceHeaderRecord");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend(v64, "includedIdentifiers");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "allObjects");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObjectsFromArray:", v66);
        goto LABEL_31;
      }
      objc_msgSend(v57, "storeRecord");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "currentSequenceHeaderRecord");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        objc_msgSend(v65, "includedIdentifiers");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "allObjects");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObjectsFromArray:", v68);

LABEL_31:
      }

      if (v54 != ++v56)
        continue;
      break;
    }
    v54 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v249, buf, 16);
    if (v54)
      continue;
    break;
  }
LABEL_34:

  _HKInitializeLogging();
  v69 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v70 = v69;
    v71 = objc_msgSend(v52, "count");
    v72 = objc_msgSend(v199, "count");
    *(_DWORD *)buf = 138543874;
    v254 = v195;
    v255 = 2048;
    *(_QWORD *)v256 = v71;
    *(_WORD *)&v256[8] = 2048;
    *(_QWORD *)&v256[10] = v72;
    _os_log_impl(&dword_1B7802000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: Considering finishing takeover for %ld owners and %ld identities:", buf, 0x20u);

  }
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v200 = v199;
  v73 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
  if (v73)
  {
    v74 = v73;
    v75 = 0;
    v76 = *(_QWORD *)v225;
    do
    {
      v77 = 0;
      v191 = v74;
      do
      {
        if (*(_QWORD *)v225 != v76)
          objc_enumerationMutation(v200);
        v78 = *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * v77);
        _HKInitializeLogging();
        v79 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v80 = v79;
          objc_msgSend(v200, "objectForKeyedSubscript:", v78);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "allObjects");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "componentsJoinedByString:", CFSTR(", "));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v254 = v195;
          v255 = 1024;
          *(_DWORD *)v256 = v75;
          *(_WORD *)&v256[4] = 2112;
          *(_QWORD *)&v256[6] = v78;
          *(_WORD *)&v256[14] = 2112;
          *(_QWORD *)&v256[16] = v83;
          _os_log_impl(&dword_1B7802000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@ (%@)", buf, 0x26u);

          ++v75;
          v74 = v191;
        }
        ++v77;
      }
      while (v74 != v77);
      v74 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
    }
    while (v74);
  }

  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v84 = v52;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v220, v247, 16);
  if (v85)
  {
    v86 = v85;
    v87 = 0;
    v88 = *(_QWORD *)v221;
    do
    {
      for (j = 0; j != v86; ++j)
      {
        if (*(_QWORD *)v221 != v88)
          objc_enumerationMutation(v84);
        v90 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * j);
        _HKInitializeLogging();
        v91 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v92 = v87 + 1;
          v93 = v91;
          objc_msgSend(v84, "objectForKeyedSubscript:", v90);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "allObjects");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "componentsJoinedByString:", CFSTR(", "));
          v96 = objc_claimAutoreleasedReturnValue();
          v97 = v87;
          v98 = v88;
          v99 = v84;
          v100 = (void *)v96;
          *(_DWORD *)buf = 138544130;
          v254 = v195;
          v255 = 1024;
          *(_DWORD *)v256 = v97;
          *(_WORD *)&v256[4] = 2112;
          *(_QWORD *)&v256[6] = v90;
          *(_WORD *)&v256[14] = 2112;
          *(_QWORD *)&v256[16] = v96;
          _os_log_impl(&dword_1B7802000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@ (%@)", buf, 0x26u);

          v84 = v99;
          v88 = v98;

          v87 = v92;
        }
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v220, v247, 16);
    }
    while (v86);
  }

  objc_msgSend(v200, "allKeys");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = MEMORY[0x1E0C809B0];
  v217[0] = MEMORY[0x1E0C809B0];
  v217[1] = 3221225472;
  v217[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_187;
  v217[3] = &unk_1E6CF9580;
  v182 = v200;
  v218 = v182;
  v219 = v195;
  objc_msgSend(v101, "hk_mapToSet:", v217);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v84, "allKeys");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v214[0] = v102;
  v214[1] = 3221225472;
  v214[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_189;
  v214[3] = &unk_1E6CF95A8;
  v105 = v84;
  v215 = v105;
  v216 = v195;
  objc_msgSend(v104, "hk_mapToSet:", v214);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v103, "count") || objc_msgSend(v106, "count"))
  {
    v180 = v105;
    v181 = v103;
    v212[0] = v102;
    v212[1] = 3221225472;
    v212[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_191;
    v212[3] = &unk_1E6CE9960;
    v213 = v103;
    objc_msgSend(obj, "hk_filter:", v212);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v210[0] = v102;
    v210[1] = 3221225472;
    v210[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_192;
    v210[3] = &unk_1E6CE9960;
    v211 = v106;
    objc_msgSend(v193, "hk_filter:", v210);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v109 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v110 = v109;
      v111 = objc_msgSend(v107, "count");
      v112 = objc_msgSend(v108, "count");
      *(_DWORD *)buf = 138543874;
      v254 = v195;
      v255 = 2048;
      *(_QWORD *)v256 = v111;
      *(_WORD *)&v256[8] = 2048;
      *(_QWORD *)&v256[10] = v112;
      _os_log_impl(&dword_1B7802000, v110, OS_LOG_TYPE_DEFAULT, "%{public}@: Proceeding with takeover (Deletion) for %ld owners and %ld identities:", buf, 0x20u);

    }
    obja = v108;
    v208 = 0u;
    v209 = 0u;
    v206 = 0u;
    v207 = 0u;
    v188 = v107;
    v113 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v206, v246, 16);
    v179 = v106;
    if (v113)
    {
      v114 = v113;
      v115 = 0;
      v116 = *(_QWORD *)v207;
      do
      {
        for (k = 0; k != v114; ++k)
        {
          if (*(_QWORD *)v207 != v116)
            objc_enumerationMutation(v188);
          v118 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * k);
          _HKInitializeLogging();
          v119 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v120 = v119;
            objc_msgSend(v118, "storeRecord");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "syncIdentity");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v254 = v195;
            v255 = 1024;
            *(_DWORD *)v256 = v115;
            *(_WORD *)&v256[4] = 2112;
            *(_QWORD *)&v256[6] = v122;
            _os_log_impl(&dword_1B7802000, v120, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@", buf, 0x1Cu);

            ++v115;
          }
        }
        v114 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v206, v246, 16);
      }
      while (v114);
    }

    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v187 = obja;
    v123 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v202, v245, 16);
    if (v123)
    {
      v124 = v123;
      v125 = 0;
      v126 = *(_QWORD *)v203;
      do
      {
        for (m = 0; m != v124; ++m)
        {
          if (*(_QWORD *)v203 != v126)
            objc_enumerationMutation(v187);
          v128 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * m);
          _HKInitializeLogging();
          v129 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v130 = v129;
            objc_msgSend(v128, "storeRecord");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "ownerIdentifier");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v254 = v195;
            v255 = 1024;
            *(_DWORD *)v256 = v125;
            *(_WORD *)&v256[4] = 2112;
            *(_QWORD *)&v256[6] = v132;
            _os_log_impl(&dword_1B7802000, v130, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@", buf, 0x1Cu);

            ++v125;
          }
        }
        v124 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v202, v245, 16);
      }
      while (v124);
    }

    objc_msgSend(v188, "arrayByAddingObjectsFromArray:", v187);
    v190 = (id)objc_claimAutoreleasedReturnValue();
    v133 = v195;
    -[HDSynchronousTaskGroup beginTask](v195->_taskGroup, "beginTask");
    v236 = 0u;
    v237 = 0u;
    v238 = 0u;
    v239 = 0u;
    -[HDCloudSyncOperation configuration](v195, "configuration");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "repository");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "allCKContainers");
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    v186 = v136;
    v192 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v236, buf, 16);
    if (v192)
    {
      v189 = *(_QWORD *)v237;
      do
      {
        v137 = 0;
        do
        {
          if (*(_QWORD *)v237 != v189)
            objc_enumerationMutation(v186);
          v194 = v137;
          v138 = *(void **)(*((_QWORD *)&v236 + 1) + 8 * (_QWORD)v137);
          v201 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objb = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v232 = 0u;
          v233 = 0u;
          v234 = 0u;
          v235 = 0u;
          v139 = v190;
          v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v232, &v249, 16);
          if (v140)
          {
            v141 = v140;
            v142 = *(_QWORD *)v233;
            do
            {
              for (n = 0; n != v141; ++n)
              {
                if (*(_QWORD *)v233 != v142)
                  objc_enumerationMutation(v139);
                v144 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * n);
                objc_msgSend(v144, "container", v179);
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v145, "containerIdentifier");
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "containerIdentifier");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                v148 = objc_msgSend(v146, "isEqualToString:", v147);

                if (v148)
                {
                  objc_msgSend(v144, "zoneIdentifier");
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = objc_msgSend(v149, "type");

                  objc_msgSend(v144, "zoneIdentifier");
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  v152 = v151;
                  if (v150 == 1)
                  {
                    objc_msgSend(v151, "zoneIdentifier");
                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                    v154 = v201;
                  }
                  else
                  {
                    v155 = objc_msgSend(v151, "type");

                    if (v155 != 2)
                      continue;
                    objc_msgSend(v144, "storeRecord");
                    v152 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v152, "recordID");
                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                    v154 = objb;
                  }
                  objc_msgSend(v154, "addObject:", v153);

                }
              }
              v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v232, &v249, 16);
            }
            while (v141);
          }

          v156 = v201;
          v157 = v138;
          v133 = v195;
          if (objc_msgSend(v156, "count"))
          {
            -[HDSynchronousTaskGroup beginTask](v195->_taskGroup, "beginTask");
            _HKInitializeLogging();
            v158 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v159 = v158;
              v160 = objc_msgSend(v156, "count");
              objc_msgSend(v156, "componentsJoinedByString:", CFSTR(", "));
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v257 = 138543874;
              *(_QWORD *)&v257[4] = v195;
              *(_WORD *)&v257[12] = 2048;
              *(_QWORD *)&v257[14] = v160;
              *(_WORD *)&v257[22] = 2114;
              v258 = v161;
              _os_log_impl(&dword_1B7802000, v159, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld zones: %{public}@", v257, 0x20u);

            }
            v162 = [HDCloudSyncModifyRecordZonesOperation alloc];
            -[HDCloudSyncOperation configuration](v195, "configuration");
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            v164 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:](v162, "initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:", v163, v157, 0, v156);

            v165 = MEMORY[0x1E0C809B0];
            *(_QWORD *)v257 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v257[8] = 3221225472;
            *(_QWORD *)&v257[16] = __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke;
            v258 = &unk_1E6CE7778;
            v259 = v195;
            -[HDCloudSyncOperation setOnSuccess:](v164, "setOnSuccess:", v257);
            v240 = v165;
            v241 = 3221225472;
            v242 = __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke_2;
            v243 = &unk_1E6CE77A0;
            v244 = v195;
            -[HDCloudSyncOperation setOnError:](v164, "setOnError:", &v240);
            -[HDCloudSyncOperation start](v164, "start");

          }
          v166 = objb;
          v167 = v157;
          if (objc_msgSend(v166, "count"))
          {
            -[HDSynchronousTaskGroup beginTask](v195->_taskGroup, "beginTask");
            _HKInitializeLogging();
            v168 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v169 = v168;
              v170 = objc_msgSend(v166, "count");
              objc_msgSend(v166, "componentsJoinedByString:", CFSTR(", "));
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v257 = 138543874;
              *(_QWORD *)&v257[4] = v195;
              *(_WORD *)&v257[12] = 2048;
              *(_QWORD *)&v257[14] = v170;
              *(_WORD *)&v257[22] = 2114;
              v258 = v171;
              _os_log_impl(&dword_1B7802000, v169, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld records: %{public}@", v257, 0x20u);

            }
            v172 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](v195, "configuration");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v172, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v173, v167, 0, v166);

            v175 = MEMORY[0x1E0C809B0];
            *(_QWORD *)v257 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v257[8] = 3221225472;
            *(_QWORD *)&v257[16] = __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke;
            v258 = &unk_1E6CE7778;
            v259 = v195;
            -[HDCloudSyncOperation setOnSuccess:](v174, "setOnSuccess:", v257);
            v240 = v175;
            v241 = 3221225472;
            v242 = __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke_2;
            v243 = &unk_1E6CE77A0;
            v244 = v195;
            -[HDCloudSyncOperation setOnError:](v174, "setOnError:", &v240);
            -[HDCloudSyncOperation start](v174, "start");

          }
          v137 = v194 + 1;
        }
        while (v194 + 1 != (char *)v192);
        v192 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v236, buf, 16);
      }
      while (v192);
    }

    -[HDSynchronousTaskGroup finishTask](v133->_taskGroup, "finishTask");
    v23 = v183;
    v176 = v184;
    v103 = v181;
    v177 = v182;
    v106 = v179;
    v105 = v180;
  }
  else
  {
    _HKInitializeLogging();
    v178 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v254 = v195;
      _os_log_impl(&dword_1B7802000, v178, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to finish takeover; we have not pushed all relevant sync identities or store identifiers.",
        buf,
        0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](v195, "finishWithSuccess:error:", 1, 0);
    v23 = v183;
    v176 = v184;
    v177 = v182;
  }

LABEL_106:
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke(uint64_t a1, void *a2)
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

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedOwnerIdentifierForContainer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "storeRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "storeRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pendingOwner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(v3, "storeRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pendingSyncIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedOwnerIdentifierForContainer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "storeRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v3, "storeRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pendingOwner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v3, "storeRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pendingSyncIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 40));

    }
  }

  return v10;
}

id __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_187(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "configuration", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "storeRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeSequenceHeaderRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "includedSyncIdentities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14 || (v15 = objc_msgSend(v4, "isSubsetOfSet:", v14), v14, !v15))
        {

          v16 = 0;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = v3;
LABEL_12:

  return v16;
}

id __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_189(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "configuration", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "storeRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeSequenceHeaderRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "includedIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14 || (v15 = objc_msgSend(v4, "isSubsetOfSet:", v14), v14, !v15))
        {

          v16 = 0;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = v3;
LABEL_12:

  return v16;
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_191(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "storeRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_192(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "storeRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ownerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

uint64_t __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

void __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zones to during takeover completion: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

void __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete records to during takeover completion: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

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
