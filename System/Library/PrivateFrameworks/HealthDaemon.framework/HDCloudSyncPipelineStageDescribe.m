@implementation HDCloudSyncPipelineStageDescribe

- (HDCloudSyncPipelineStageDescribe)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncPipelineStageDescribe)initWithConfiguration:(id)a3 cloudState:(id)a4 respositoryDescriptionHandler:(id)a5
{
  id v8;
  HDCloudSyncPipelineStageDescribe *v9;
  uint64_t v10;
  id respositoryDescriptionHandler;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPipelineStageDescribe;
  v9 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    respositoryDescriptionHandler = v9->_respositoryDescriptionHandler;
    v9->_respositoryDescriptionHandler = (id)v10;

  }
  return v9;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  HDCloudSyncPipelineStageDescribe *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id respositoryDescriptionHandler;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedCloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v6, "zonesByIdentifierWithError:", &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;

  if (!v7)
  {
    v13 = self;
    v14 = v8;
    goto LABEL_6;
  }
  objc_msgSend(v4, "primaryCKContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "primaryCKContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncPipelineStageDescribe _cloudSyncDescriptionForContainer:zonesByIdentifier:error:](self, v10, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v8;

    if (!v11)
    {
      v13 = self;
      v14 = v12;
LABEL_6:
      -[HDCloudSyncOperation finishWithSuccess:error:](v13, "finishWithSuccess:error:", 0, v14);
      goto LABEL_19;
    }
  }
  else
  {
    v11 = 0;
  }
  v27 = (void *)v11;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v28 = v4;
  objc_msgSend(v4, "secondaryCKContainers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        -[HDCloudSyncPipelineStageDescribe _cloudSyncDescriptionForContainer:zonesByIdentifier:error:](self, *(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v8;

        if (!v21)
        {
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v22);
          v25 = v27;
          v4 = v28;
          goto LABEL_18;
        }
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v18)
        continue;
      break;
    }
  }

  v23 = objc_alloc(MEMORY[0x1E0CB6428]);
  v4 = v28;
  objc_msgSend(v28, "syncCircleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v27;
  v16 = (void *)objc_msgSend(v23, "initWithIdentifier:primaryContainerDescription:secondaryContainerDescriptions:", v24, v27, v15);

  (*((void (**)(void))self->_respositoryDescriptionHandler + 2))();
  respositoryDescriptionHandler = self->_respositoryDescriptionHandler;
  self->_respositoryDescriptionHandler = 0;

  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
LABEL_18:

LABEL_19:
}

- (id)_cloudSyncDescriptionForContainer:(void *)a1 zonesByIdentifier:(void *)a2 error:(void *)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v35 = v5;
  if (a1)
  {
    v7 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke;
    v38[3] = &unk_1E6CEA3C8;
    v8 = v5;
    v39 = v8;
    objc_msgSend(v6, "hk_filter:", v38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke_2;
    v36[3] = &unk_1E6CEA3C8;
    v11 = v8;
    v37 = v11;
    objc_msgSend(v6, "hk_filter:", v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v10, "count"))
    {
      -[HDCloudSyncPipelineStageDescribe _cloudSyncZoneDescriptionsForZoneIdentifiers:zonesByIdentifier:](a1, v10, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x1E0CB63F8]);
      HDCKDatabaseScopeToString(2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithScope:zoneDescriptions:", v17, v15);

      objc_msgSend(v14, "addObject:", v18);
    }
    if (objc_msgSend(v13, "count"))
    {
      -[HDCloudSyncPipelineStageDescribe _cloudSyncZoneDescriptionsForZoneIdentifiers:zonesByIdentifier:](a1, v13, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0CB63F8]);
      HDCKDatabaseScopeToString(3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithScope:zoneDescriptions:", v21, v19);

      objc_msgSend(v14, "addObject:", v22);
    }
    objc_msgSend(a1, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cloudSyncManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ownerIdentifierManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cachedOwnerIdentifierForContainer:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v11;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Owner identifier not found for container %{public}@.", buf, 0xCu);
      }
    }
    v28 = objc_alloc(MEMORY[0x1E0CB63E8]);
    objc_msgSend(v11, "containerIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "string");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
      v32 = (const __CFString *)v30;
    else
      v32 = CFSTR("Not Found");
    v33 = (void *)objc_msgSend(v28, "initWithContainerIdentifier:deviceIdentifier:databaseDescriptions:", v29, v32, v14);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

BOOL __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = objc_msgSend(v3, "scope") == 2;
  else
    v6 = 0;

  return v6;
}

BOOL __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = objc_msgSend(v3, "scope") == 3;
  else
    v6 = 0;

  return v6;
}

- (id)_cloudSyncZoneDescriptionsForZoneIdentifiers:(void *)a3 zonesByIdentifier:
{
  id v4;
  _UNKNOWN **v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  char *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t jj;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  NSObject *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t kk;
  id v117;
  uint64_t v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  id v125;
  NSObject *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t mm;
  id v138;
  uint64_t v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  id v147;
  NSObject *v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  NSObject *v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  id v171;
  id v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t nn;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  NSObject *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  id obj;
  id v203;
  id v204;
  id v205;
  id v206;
  uint64_t v207;
  id v208;
  uint64_t v209;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  uint64_t v220;
  void *v221;
  id v222;
  void *v223;
  id v224;
  id v225;
  void *v226;
  void *v227;
  id v228;
  id v229;
  id v230;
  void *v231;
  id v232;
  id v233;
  id v234;
  void *v235;
  char *v236;
  id v237;
  id v238;
  id v239;
  void *v240;
  uint64_t v241;
  void *v242;
  char *v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v255;
  id v256;
  id v257;
  id v258;
  id v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  void *v271;
  void *v272;
  _BYTE v273[128];
  id v274;
  uint64_t v275;
  void *v276;
  void *v277;
  id v278;
  uint64_t v279;
  void *v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  _BYTE buf[132];
  uint64_t v294;

  v294 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v208 = a3;
  v206 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v260 = 0u;
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  obj = v4;
  v209 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v273, 16);
  if (v209)
  {
    v207 = *(_QWORD *)v261;
    v5 = &off_1E6CE2000;
    do
    {
      for (i = 0; i != v209; ++i)
      {
        if (*(_QWORD *)v261 != v207)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * i);
        objc_msgSend(v208, "objectForKeyedSubscript:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v213 = (void *)v8;
        if (v8)
        {
          v9 = (void *)v8;
          v212 = i;
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v11 = objc_alloc(MEMORY[0x1E0CB6420]);
          objc_msgSend(v7, "zoneIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "zoneName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = v7;
          objc_msgSend(v7, "zoneIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "ownerName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = (void *)objc_msgSend(v11, "initWithZoneName:ownerName:", v13, v15);

          v259 = 0;
          v16 = v9;
          objc_msgSend(v16, "recordsForClass:error:", objc_opt_class(), &v259);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = v10;
          if (v17)
          {
            objc_msgSend(v16, "recordsForClass:error:", objc_opt_class(), &v259);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v16, "recordsForClass:error:", objc_opt_class(), &v259);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_msgSend(v16, "recordsForClass:error:", objc_opt_class(), &v259);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v203 = v20;
                  objc_msgSend(v16, "recordsForClass:error:", objc_opt_class(), &v259);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    v198 = v16;
                    v200 = v21;
                    v232 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v264 = 0u;
                    v265 = 0u;
                    v266 = 0u;
                    v267 = 0u;
                    v197 = v17;
                    v22 = v17;
                    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v264, &v274, 16);
                    if (v23)
                    {
                      v24 = v23;
                      v25 = *(_QWORD *)v265;
                      do
                      {
                        for (j = 0; j != v24; ++j)
                        {
                          if (*(_QWORD *)v265 != v25)
                            objc_enumerationMutation(v22);
                          v27 = v5[445];
                          v28 = *(id *)(*((_QWORD *)&v264 + 1) + 8 * j);
                          objc_msgSend(v27, "recordType");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v28, v29, 0);
                          v30 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v232, "addObject:", v30);
                        }
                        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v264, &v274, 16);
                      }
                      while (v24);
                    }

                    v196 = v18;
                    v31 = v18;
                    v195 = v19;
                    v32 = v19;
                    v225 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v289 = 0u;
                    v290 = 0u;
                    v291 = 0u;
                    v292 = 0u;
                    v215 = v31;
                    v236 = (char *)objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v289, buf, 16);
                    if (v236)
                    {
                      v220 = *(_QWORD *)v290;
                      do
                      {
                        v33 = 0;
                        do
                        {
                          if (*(_QWORD *)v290 != v220)
                            objc_enumerationMutation(v215);
                          v243 = v33;
                          v34 = *(id *)(*((_QWORD *)&v289 + 1) + 8 * (_QWORD)v33);
                          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          v285 = 0u;
                          v286 = 0u;
                          v287 = 0u;
                          v288 = 0u;
                          v240 = v34;
                          objc_msgSend(v34, "orderedSequenceRecords");
                          v247 = (id)objc_claimAutoreleasedReturnValue();
                          v36 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v285, &v281, 16);
                          if (v36)
                          {
                            v37 = v36;
                            v38 = *(_QWORD *)v286;
                            do
                            {
                              for (k = 0; k != v37; ++k)
                              {
                                if (*(_QWORD *)v286 != v38)
                                  objc_enumerationMutation(v247);
                                v40 = *(void **)(*((_QWORD *)&v285 + 1) + 8 * k);
                                v268 = MEMORY[0x1E0C809B0];
                                v269 = 3221225472;
                                v270 = __94__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForStoreRecords_changeRecords___block_invoke;
                                v271 = &unk_1E6CEA418;
                                v272 = v40;
                                objc_msgSend(v32, "hk_firstObjectPassingTest:", &v268);
                                v41 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v41)
                                {
                                  +[HDCloudSyncChangeRecord recordType](HDCloudSyncChangeRecord, "recordType");
                                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v41, v42, 0);
                                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                                }
                                else
                                {
                                  v43 = 0;
                                }
                                +[HDCloudSyncSequenceRecord recordType](HDCloudSyncSequenceRecord, "recordType");
                                v44 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v43)
                                {
                                  v280 = v43;
                                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v280, 1);
                                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v40, v44, v45);
                                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                                }
                                else
                                {
                                  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v40, v44, 0);
                                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                                }

                                objc_msgSend(v35, "addObject:", v46);
                              }
                              v37 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v285, &v281, 16);
                            }
                            while (v37);
                          }

                          +[HDCloudSyncStoreRecord recordType](HDCloudSyncStoreRecord, "recordType");
                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                          -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v240, v47, v35);
                          v48 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v225, "addObject:", v48);
                          v33 = v243 + 1;
                        }
                        while (v243 + 1 != v236);
                        v236 = (char *)objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v289, buf, 16);
                      }
                      while (v236);
                    }

                    v49 = objc_msgSend(v225, "copy");
                    v226 = (void *)v49;
                    objc_msgSend(v232, "addObjectsFromArray:", v49);
                    v50 = v203;
                    v244 = v200;
                    v248 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v289 = 0u;
                    v290 = 0u;
                    v291 = 0u;
                    v292 = 0u;
                    v237 = v50;
                    v51 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v289, buf, 16);
                    if (v51)
                    {
                      v52 = v51;
                      v241 = *(_QWORD *)v290;
                      do
                      {
                        for (m = 0; m != v52; ++m)
                        {
                          if (*(_QWORD *)v290 != v241)
                            objc_enumerationMutation(v237);
                          v54 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * m);
                          v268 = MEMORY[0x1E0C809B0];
                          v269 = 3221225472;
                          v270 = __110__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForDeviceContextRecords_deviceKeyValueRecords___block_invoke;
                          v271 = &unk_1E6CEA3F0;
                          v272 = v54;
                          objc_msgSend(v244, "hk_map:", &v268);
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          v285 = 0u;
                          v286 = 0u;
                          v287 = 0u;
                          v288 = 0u;
                          v57 = v55;
                          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v285, &v281, 16);
                          if (v58)
                          {
                            v59 = v58;
                            v60 = *(_QWORD *)v286;
                            do
                            {
                              for (n = 0; n != v59; ++n)
                              {
                                if (*(_QWORD *)v286 != v60)
                                  objc_enumerationMutation(v57);
                                v62 = *(void **)(*((_QWORD *)&v285 + 1) + 8 * n);
                                +[HDCloudSyncDeviceKeyValueRecord recordType](HDCloudSyncDeviceKeyValueRecord, "recordType");
                                v63 = (void *)objc_claimAutoreleasedReturnValue();
                                -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v62, v63, 0);
                                v64 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v56, "addObject:", v64);

                              }
                              v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v285, &v281, 16);
                            }
                            while (v59);
                          }

                          +[HDCloudSyncDeviceContextRecord recordType](HDCloudSyncDeviceContextRecord, "recordType");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v57, "count"))
                            v66 = v56;
                          else
                            v66 = 0;
                          -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v54, v65, v66);
                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v248, "addObject:", v67);

                        }
                        v52 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v289, buf, 16);
                      }
                      while (v52);
                    }

                    objc_msgSend(v232, "addObjectsFromArray:", v248);
                    v68 = objc_msgSend(v232, "copy");

                    v10 = v214;
                    v16 = v198;
                    v21 = v200;
                    v18 = v196;
                    v17 = v197;
                    v19 = v195;
                  }
                  else
                  {
                    v68 = 0;
                  }

                  v20 = v203;
                }
                else
                {
                  v68 = 0;
                }

              }
              else
              {
                v68 = 0;
              }

            }
            else
            {
              v68 = 0;
            }

          }
          else
          {
            v68 = 0;
          }

          v70 = v259;
          v242 = (void *)v68;
          if (v68)
          {
            objc_msgSend(v10, "addObjectsFromArray:", v68);
          }
          else
          {
            _HKInitializeLogging();
            v71 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v70;
              _os_log_error_impl(&dword_1B7802000, v71, OS_LOG_TYPE_ERROR, "Failed to create sync record descriptions %{public}@", buf, 0xCu);
            }
          }
          v258 = v70;
          v72 = v16;
          objc_msgSend(v72, "recordsForClass:error:", objc_opt_class(), &v258);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v73)
          {
            objc_msgSend(v72, "recordsForClass:error:", objc_opt_class(), &v258);
            v249 = (id)objc_claimAutoreleasedReturnValue();
            if (v249)
            {
              v233 = v72;
              v238 = v70;
              v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v281 = 0u;
              v282 = 0u;
              v283 = 0u;
              v284 = 0u;
              v227 = v73;
              v245 = v73;
              v75 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
              if (v75)
              {
                v76 = v75;
                v77 = *(_QWORD *)v282;
                do
                {
                  for (ii = 0; ii != v76; ++ii)
                  {
                    if (*(_QWORD *)v282 != v77)
                      objc_enumerationMutation(v245);
                    v79 = *(id *)(*((_QWORD *)&v281 + 1) + 8 * ii);
                    v274 = (id)MEMORY[0x1E0C809B0];
                    v275 = 3221225472;
                    v276 = __102__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForRelationshipRecordTypeInZone_error___block_invoke;
                    v277 = &unk_1E6CEA418;
                    v80 = v79;
                    v278 = v80;
                    objc_msgSend(v249, "hk_firstObjectPassingTest:", &v274);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v81)
                    {
                      +[HDCloudSyncSharedSummaryAuthorizationRecord recordType](HDCloudSyncSharedSummaryAuthorizationRecord, "recordType");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v81, v82, 0);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v83 = 0;
                    }
                    +[HDCloudSyncSharedSummaryParticipantRecord recordType](HDCloudSyncSharedSummaryParticipantRecord, "recordType");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v83)
                    {
                      *(_QWORD *)&v289 = v83;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v289, 1);
                      v85 = v74;
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v80, v84, v86);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();

                      v74 = v85;
                    }
                    else
                    {
                      -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v80, v84, 0);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v74, "addObject:", v87);
                  }
                  v76 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
                }
                while (v76);
              }

              v10 = v214;
              v72 = v233;
              v70 = v238;
              v73 = v227;
            }
            else
            {
              v74 = 0;
            }

          }
          else
          {
            v74 = 0;
          }

          v88 = v258;
          v246 = v74;
          if (v74)
          {
            objc_msgSend(v10, "addObjectsFromArray:", v74);
          }
          else
          {
            _HKInitializeLogging();
            v89 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v88;
              _os_log_error_impl(&dword_1B7802000, v89, OS_LOG_TYPE_ERROR, "Failed to create relationship record descriptions %{public}@", buf, 0xCu);
            }
          }
          v250 = v88;
          v257 = v88;
          v90 = v72;
          +[HDCloudSyncDataUploadRequestRecord recordType](HDCloudSyncDataUploadRequestRecord, "recordType");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v285 = v91;
          *(_QWORD *)&v289 = objc_opt_class();
          +[HDCloudSyncMasterRecord recordType](HDCloudSyncMasterRecord, "recordType");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          *((_QWORD *)&v285 + 1) = v92;
          *((_QWORD *)&v289 + 1) = objc_opt_class();
          +[HDCloudSyncMedicalIDRecord recordType](HDCloudSyncMedicalIDRecord, "recordType");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v286 = v93;
          *(_QWORD *)&v290 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v289, &v285, 3);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v281 = 0u;
          v282 = 0u;
          v283 = 0u;
          v284 = 0u;
          objc_msgSend(v94, "allKeys");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
          if (v97)
          {
            v98 = v97;
            v99 = *(_QWORD *)v282;
            while (2)
            {
              for (jj = 0; jj != v98; ++jj)
              {
                if (*(_QWORD *)v282 != v99)
                  objc_enumerationMutation(v96);
                v101 = *(_QWORD *)(*((_QWORD *)&v281 + 1) + 8 * jj);
                objc_msgSend(v90, "recordsForClass:error:", objc_msgSend(v94, "objectForKeyedSubscript:", v101), &v257);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v102)
                {

                  v105 = 0;
                  goto LABEL_105;
                }
                v103 = v102;
                v274 = (id)MEMORY[0x1E0C809B0];
                v275 = 3221225472;
                v276 = __98__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForIndependentRecordsInZone_error___block_invoke;
                v277 = &unk_1E6CEA4F8;
                v278 = a1;
                v279 = v101;
                objc_msgSend(v102, "hk_map:", &v274);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "addObjectsFromArray:", v104);

              }
              v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
              if (v98)
                continue;
              break;
            }
          }

          v105 = objc_msgSend(v95, "copy");
LABEL_105:

          v106 = v257;
          if (v105)
          {
            objc_msgSend(v214, "addObjectsFromArray:", v105);
          }
          else
          {
            _HKInitializeLogging();
            v107 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v106;
              _os_log_error_impl(&dword_1B7802000, v107, OS_LOG_TYPE_ERROR, "Failed to create independent record descriptions %{public}@", buf, 0xCu);
            }
          }
          v256 = v106;
          v108 = v90;
          objc_msgSend(v108, "recordsForClass:error:", objc_opt_class(), &v256);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v239 = (id)v105;
          if (v109)
          {
            objc_msgSend(v108, "recordsForClass:error:", objc_opt_class(), &v256);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            if (v110)
            {
              v228 = v108;
              v234 = v106;
              v216 = v110;
              objc_msgSend(v110, "hk_map:", &__block_literal_global_17);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v281 = 0u;
              v282 = 0u;
              v283 = 0u;
              v284 = 0u;
              v221 = v109;
              v251 = v109;
              v113 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
              if (v113)
              {
                v114 = v113;
                v115 = *(_QWORD *)v282;
                do
                {
                  for (kk = 0; kk != v114; ++kk)
                  {
                    if (*(_QWORD *)v282 != v115)
                      objc_enumerationMutation(v251);
                    v117 = *(id *)(*((_QWORD *)&v281 + 1) + 8 * kk);
                    v118 = MEMORY[0x1E0C809B0];
                    v274 = (id)MEMORY[0x1E0C809B0];
                    v275 = 3221225472;
                    v276 = __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_2;
                    v277 = &unk_1E6CEA480;
                    v278 = v117;
                    v119 = v117;
                    objc_msgSend(v111, "hk_filter:", &v274);
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&v289 = v118;
                    *((_QWORD *)&v289 + 1) = 3221225472;
                    *(_QWORD *)&v290 = __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_3;
                    *((_QWORD *)&v290 + 1) = &unk_1E6CEA4A8;
                    *(_QWORD *)&v291 = a1;
                    objc_msgSend(v120, "hk_map:", &v289);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    +[HDCloudSyncSharedSummaryTransactionRecord recordType](HDCloudSyncSharedSummaryTransactionRecord, "recordType");
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v119, v122, v121);
                    v123 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v112, "addObject:", v123);
                  }
                  v114 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
                }
                while (v114);
              }

              v124 = objc_msgSend(v112, "copy");
              v108 = v228;
              v106 = v234;
              v110 = v216;
              v109 = v221;
            }
            else
            {
              v124 = 0;
            }

          }
          else
          {
            v124 = 0;
          }

          v125 = v256;
          v235 = (void *)v124;
          if (v124)
          {
            objc_msgSend(v214, "addObjectsFromArray:", v124);
          }
          else
          {
            _HKInitializeLogging();
            v126 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v125;
              _os_log_error_impl(&dword_1B7802000, v126, OS_LOG_TYPE_ERROR, "Failed to create transaction record descriptions %{public}@", buf, 0xCu);
            }
          }
          v255 = v125;
          v127 = v108;
          objc_msgSend(v127, "recordsForClass:error:", objc_opt_class(), &v255);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          if (v128)
          {
            objc_msgSend(v127, "recordsForClass:error:", objc_opt_class(), &v255);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            if (v129)
            {
              objc_msgSend(v127, "recordsForClass:error:", objc_opt_class(), &v255);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              if (v130)
              {
                objc_msgSend(v127, "recordsForClass:error:", objc_opt_class(), &v255);
                v131 = objc_claimAutoreleasedReturnValue();
                v132 = (void *)v131;
                if (v131)
                {
                  v201 = (void *)v131;
                  v222 = v125;
                  v229 = v127;
                  v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v274 = (id)MEMORY[0x1E0C809B0];
                  v275 = 3221225472;
                  v276 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke;
                  v277 = &unk_1E6CEA3F0;
                  v278 = a1;
                  v217 = v128;
                  objc_msgSend(v128, "hk_map:", &v274);
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v133, "addObjectsFromArray:");
                  v283 = 0u;
                  v284 = 0u;
                  v281 = 0u;
                  v282 = 0u;
                  v204 = v129;
                  v252 = v129;
                  v134 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
                  if (v134)
                  {
                    v135 = v134;
                    v136 = *(_QWORD *)v282;
                    do
                    {
                      for (mm = 0; mm != v135; ++mm)
                      {
                        if (*(_QWORD *)v282 != v136)
                          objc_enumerationMutation(v252);
                        v138 = *(id *)(*((_QWORD *)&v281 + 1) + 8 * mm);
                        v139 = MEMORY[0x1E0C809B0];
                        *(_QWORD *)&v289 = MEMORY[0x1E0C809B0];
                        *((_QWORD *)&v289 + 1) = 3221225472;
                        *(_QWORD *)&v290 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_2;
                        *((_QWORD *)&v290 + 1) = &unk_1E6CEA3F0;
                        *(_QWORD *)&v291 = v138;
                        v140 = v138;
                        objc_msgSend(v130, "hk_map:", &v289);
                        v141 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_QWORD *)&v285 = v139;
                        *((_QWORD *)&v285 + 1) = 3221225472;
                        *(_QWORD *)&v286 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_3;
                        *((_QWORD *)&v286 + 1) = &unk_1E6CEA4D0;
                        *(_QWORD *)&v287 = a1;
                        objc_msgSend(v141, "hk_map:", &v285);
                        v142 = (void *)objc_claimAutoreleasedReturnValue();
                        +[HDCloudSyncAttachmentRecord recordType](HDCloudSyncAttachmentRecord, "recordType");
                        v143 = (void *)objc_claimAutoreleasedReturnValue();
                        -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v140, v143, v142);
                        v144 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v133, "addObject:", v144);
                      }
                      v135 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
                    }
                    while (v135);
                  }

                  *(_QWORD *)&v264 = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&v264 + 1) = 3221225472;
                  *(_QWORD *)&v265 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_4;
                  *((_QWORD *)&v265 + 1) = &unk_1E6CEA3F0;
                  *(_QWORD *)&v266 = a1;
                  v132 = v201;
                  objc_msgSend(v201, "hk_map:", &v264);
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v133, "addObjectsFromArray:", v145);
                  v146 = objc_msgSend(v133, "copy");

                  v125 = v222;
                  v127 = v229;
                  v128 = v217;
                  v129 = v204;
                }
                else
                {
                  v146 = 0;
                }

              }
              else
              {
                v146 = 0;
              }

            }
            else
            {
              v146 = 0;
            }

          }
          else
          {
            v146 = 0;
          }

          v147 = v255;
          v253 = (id)v146;
          if (v146)
          {
            objc_msgSend(v214, "addObjectsFromArray:", v146);
          }
          else
          {
            _HKInitializeLogging();
            v148 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v147;
              _os_log_error_impl(&dword_1B7802000, v148, OS_LOG_TYPE_ERROR, "Failed to create attachment record descriptions %{public}@", buf, 0xCu);
            }
          }
          *(_QWORD *)buf = 0;
          objc_msgSend(v127, "zoneShareWithError:", buf);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = *(id *)buf;
          v151 = v150;
          if (v149 || !v150)
          {
            v230 = v127;
            v154 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v149, "owner");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "userIdentity");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v156, "hash"));
            v218 = (id)objc_claimAutoreleasedReturnValue();

            v157 = objc_alloc(MEMORY[0x1E0CB6438]);
            objc_msgSend(v149, "owner");
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            HDCKRoleToString(objc_msgSend(v223, "role"));
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "owner");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            HDCKAcceptanceStatusToString(objc_msgSend(v159, "acceptanceStatus"));
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "owner");
            v161 = v147;
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            HDCKPermissionToString(objc_msgSend(v162, "permission"));
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            v164 = v157;
            v127 = v230;
            v153 = (void *)objc_msgSend(v164, "initWithIdentity:role:acceptanceStatus:permission:", v218, v158, v160, v163);

            v147 = v161;
            v152 = v161;
          }
          else
          {
            v152 = objc_retainAutorelease(v150);
            v153 = 0;
          }
          v5 = &off_1E6CE2000;

          v165 = v152;
          if (!v153)
          {
            if (v165)
            {
              _HKInitializeLogging();
              v166 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v165;
                _os_log_error_impl(&dword_1B7802000, v166, OS_LOG_TYPE_ERROR, "Failed to fetch owner participant description with error %{public}@", buf, 0xCu);
              }
            }
          }
          v274 = 0;
          objc_msgSend(v127, "zoneShareWithError:", &v274);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = v274;
          if (v167 || !v168)
          {
            v205 = v168;
            v224 = v165;
            v231 = v153;
            v172 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v281 = 0u;
            v282 = 0u;
            v283 = 0u;
            v284 = 0u;
            v219 = v167;
            objc_msgSend(v167, "allParticipants");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
            if (v174)
            {
              v175 = v174;
              v176 = *(_QWORD *)v282;
              do
              {
                for (nn = 0; nn != v175; ++nn)
                {
                  if (*(_QWORD *)v282 != v176)
                    objc_enumerationMutation(v173);
                  v178 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * nn);
                  if (objc_msgSend(v178, "role") != 1)
                  {
                    v179 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v178, "userIdentity");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v179, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v180, "hash"));
                    v181 = (void *)objc_claimAutoreleasedReturnValue();

                    v182 = objc_alloc(MEMORY[0x1E0CB6438]);
                    HDCKRoleToString(objc_msgSend(v178, "role"));
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    HDCKAcceptanceStatusToString(objc_msgSend(v178, "acceptanceStatus"));
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    HDCKPermissionToString(objc_msgSend(v178, "permission"));
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    v186 = (void *)objc_msgSend(v182, "initWithIdentity:role:acceptanceStatus:permission:", v181, v183, v184, v185);

                    objc_msgSend(v172, "addObject:", v186);
                  }
                }
                v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v281, buf, 16);
              }
              while (v175);
            }

            if (objc_msgSend(v172, "count"))
              v187 = v172;
            else
              v187 = 0;
            v171 = v187;

            v165 = v224;
            v153 = v231;
            v170 = v224;
            v5 = &off_1E6CE2000;
            v167 = v219;
            v169 = v205;
          }
          else
          {
            v169 = v168;
            v170 = objc_retainAutorelease(v168);
            v171 = 0;
          }

          v188 = v170;
          if (!v171)
          {
            if (v188)
            {
              _HKInitializeLogging();
              v189 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v188;
                _os_log_error_impl(&dword_1B7802000, v189, OS_LOG_TYPE_ERROR, "Failed to fetch other participant descriptions with error %{public}@", buf, 0xCu);
              }
            }
          }
          v190 = objc_alloc(MEMORY[0x1E0CB6448]);
          HDCloudSyncZoneTypeToString(objc_msgSend(v211, "type"));
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          v192 = (void *)objc_msgSend(v190, "initWithZoneIDDescription:type:ownerParticipantDescription:otherParticipantsDescription:recordDescriptions:", v210, v191, v153, v171, v214);

          objc_msgSend(v206, "addObject:", v192);
          i = v212;
        }
        else
        {
          _HKInitializeLogging();
          v69 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v7;
            _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "Zone not found %{public}@", buf, 0xCu);
          }
        }

      }
      v209 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v273, 16);
    }
    while (v209);
  }

  v193 = (void *)objc_msgSend(v206, "copy");
  return v193;
}

- (id)_createRecordDescriptionWithRecord:(void *)a3 recordType:(void *)a4 childRecordDescriptions:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a1)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB6418];
    v7 = a4;
    v8 = a3;
    v9 = a2;
    v10 = [v6 alloc];
    objc_msgSend(v9, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithRecordName:", v12);

    v14 = objc_alloc(MEMORY[0x1E0CB6410]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "schemaVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "record");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "modificationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "printDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(v14, "initWithRecordIDDescription:recordType:schemaVersion:modificationDate:detailedDescription:childRecordDescriptions:", v13, v8, v15, v17, v18, v7);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

id __110__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForDeviceContextRecords_deviceKeyValueRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend(v4, "deviceContext:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "syncIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
      v8 = v3;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __94__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForStoreRecords_changeRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sequenceRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __102__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForRelationshipRecordTypeInZone_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authorizationRecordIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "summaryIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

id __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[HDCloudSyncSharedSummaryRecord recordType](HDCloudSyncSharedSummaryRecord, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[HDCloudSyncAttachmentReferenceRecord recordType](HDCloudSyncAttachmentReferenceRecord, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    v7 = v3;
  else
    v7 = 0;

  return v7;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[HDCloudSyncAttachmentReferenceRecord recordType](HDCloudSyncAttachmentReferenceRecord, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[HDCloudSyncAttachmentReferenceTombstoneRecord recordType](HDCloudSyncAttachmentReferenceTombstoneRecord, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __98__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForIndependentRecordsInZone_error___block_invoke(uint64_t a1, void *a2)
{
  return -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_respositoryDescriptionHandler, 0);
}

@end
