@implementation ATXModeConfigurationLogger

- (ATXModeConfigurationLogger)initWithDNDModeConfigurationClient:(id)a3
{
  id v5;
  ATXModeConfigurationLogger *v6;
  ATXModeConfigurationLogger *v7;
  uint64_t v8;
  NSMutableDictionary *cachedSuggestedItems;
  uint64_t v10;
  ATXModeEntityTrialClientWrapper *modeEntityTrialClientWrapper;
  void *v12;
  uint64_t v13;
  NSArray *cachedConfigurations;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXModeConfigurationLogger;
  v6 = -[ATXModeConfigurationLogger init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v8 = objc_opt_new();
    cachedSuggestedItems = v7->_cachedSuggestedItems;
    v7->_cachedSuggestedItems = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    modeEntityTrialClientWrapper = v7->_modeEntityTrialClientWrapper;
    v7->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v10;

    -[ATXModeConfigurationLogger retrieveEvents](v7, "retrieveEvents");
    +[ATXPosterConfigurationCache sharedInstance](ATXPosterConfigurationCache, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurations");
    v13 = objc_claimAutoreleasedReturnValue();
    cachedConfigurations = v7->_cachedConfigurations;
    v7->_cachedConfigurations = (NSArray *)v13;

  }
  return v7;
}

- (ATXModeConfigurationLogger)init
{
  void *v3;
  ATXModeConfigurationLogger *v4;

  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXModeConfigurationLogger initWithDNDModeConfigurationClient:](self, "initWithDNDModeConfigurationClient:", v3);

  return v4;
}

- (void)logModeConfigurations
{
  -[ATXModeConfigurationLogger logModeConfigurationsWithXPCActivity:](self, "logModeConfigurationsWithXPCActivity:", 0);
}

- (void)logModeConfigurationsWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "%@ - Logging mode configurations", buf, 0xCu);

  }
  -[ATXDNDModeConfigurationClient getAllModeConfigurationsWithoutCache](self->_client, "getAllModeConfigurationsWithoutCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "%@ - Fetched mode configurations from client", buf, 0xCu);

    }
    if ((objc_msgSend(v4, "didDefer") & 1) != 0)
    {
      __atxlog_handle_metrics();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        v15 = "%@ - XPC Activity deferred, terminating.";
LABEL_21:
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, v15, buf, 0xCu);

      }
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v8, "allValues", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v10);
            v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x1CAA48B6C]();
            -[ATXModeConfigurationLogger logMetricForConfiguration:](self, "logMetricForConfiguration:", v20);
            if (objc_msgSend(v4, "didDefer"))
            {
              __atxlog_handle_metrics();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v24 = (objc_class *)objc_opt_class();
                NSStringFromClass(v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v32 = v25;
                _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v21);
              goto LABEL_25;
            }
            objc_autoreleasePoolPop(v21);
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v17)
            continue;
          break;
        }
      }

      __atxlog_handle_metrics();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        v15 = "%@ - Finished logging mode configurations";
        goto LABEL_21;
      }
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ATXModeConfigurationLogger logModeConfigurationsWithXPCActivity:].cold.1((uint64_t)self, v10);
  }
LABEL_25:

}

- (void)logMetricForConfiguration:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t m;
  void *v115;
  void *v116;
  uint64_t v117;
  _BOOL4 v118;
  int v119;
  NSObject *v120;
  objc_class *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  objc_class *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v137;
  void *v138;
  id obj;
  id v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id v146;
  _QWORD v147[4];
  void *v148;
  _QWORD v149[4];
  void *v150;
  _QWORD v151[4];
  void *v152;
  _QWORD v153[4];
  void *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _QWORD v159[4];
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  uint8_t v170[128];
  uint8_t buf[4];
  void *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  void *v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_metrics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v172 = v6;
    v173 = 2112;
    v174 = v9;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "%@ - Generating metrics for DND mode with UUID %@", buf, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v3, "mode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModeIdentifier:", v13);

  objc_msgSend(v3, "mode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "semanticType");
  DNDModeSemanticTypeToATXActivityType();
  ATXActivityTypeToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModeSemanticType:", v15);

  v169 = 0;
  v134 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  objc_msgSend(v134, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 1, &v169);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v169;
  if (v17)
  {
    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXModeConfigurationLogger logMetricForConfiguration:].cold.4();

  }
  v137 = v3;
  v133 = v17;
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  obj = v16;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v179, 16);
  if (v19)
  {
    v20 = v19;
    v140 = *(id *)v166;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(id *)v166 != v140)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v164 = 0u;
        objc_msgSend(v22, "associatedModeUUIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v162;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v162 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * j);
              objc_msgSend(v10, "modeIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v28) = objc_msgSend(v28, "isEqualToString:", v29);

              if ((_DWORD)v28)
              {
                objc_msgSend(v10, "setHasCustomHomeScreen:", 1);
                objc_msgSend(v10, "setNumCustomHomeScreens:", objc_msgSend(v10, "numCustomHomeScreens") + 1);
                objc_msgSend(v22, "associatedModeUUIDs");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "count");
                v32 = objc_msgSend(v10, "hasCustomHomeScreenUsedInOtherModes");
                if (v31 > 1)
                  v33 = 1;
                else
                  v33 = v32;
                objc_msgSend(v10, "setHasCustomHomeScreenUsedInOtherModes:", v33);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
          }
          while (v25);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v179, 16);
    }
    while (v20);
  }

  -[ATXModeConfigurationLogger cachedConfigurations](self, "cachedConfigurations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v159[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke;
  v159[3] = &unk_1E82E74B8;
  v35 = v137;
  v160 = v35;
  objc_msgSend(v34, "_pas_filteredArrayWithTest:", v159);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumLockScreenPosters:", objc_msgSend(v36, "count"));

  v37 = (void *)objc_opt_new();
  objc_msgSend(v35, "mode");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "UUIDString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v37;
  objc_msgSend(v37, "identifierOfSuggestedPageForModeUUID:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    objc_msgSend(v10, "setNumAcceptedSuggestedHomePages:", 1);
  objc_msgSend(v35, "mode");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "semanticType");

  if (v43 == 1)
  {
    ATXSleepSuggestedHomePageWasCreatedDuringMigration();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      __atxlog_handle_home_screen();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[ATXModeConfigurationLogger logMetricForConfiguration:].cold.3(v45, v46, v47);

    }
    v48 = objc_msgSend(v44, "BOOLValue");
    objc_msgSend(v10, "setIsSleepMigrated:", v48);
    objc_msgSend(v10, "setDidRemoveSuggestedPage:", v48 & (objc_msgSend(v10, "hasCustomHomeScreen") ^ 1));

  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v138 = v35;
  objc_msgSend(v35, "triggers");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v156;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v156 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
        {
          objc_msgSend(v10, "setHasAreaTrigger:", 1);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
          {
            objc_msgSend(v10, "setHasTimeTrigger:", 1);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
            {
              objc_msgSend(v10, "setHasAppTrigger:", 1);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
              {
                objc_msgSend(v10, "setHasSmartTrigger:", 1);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
                {
                  objc_msgSend(v10, "setHasWorkoutTrigger:", 1);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
                  {
                    objc_msgSend(v10, "setHasSleepTrigger:", 1);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "isEnabled"))
                      objc_msgSend(v10, "setHasDrivingTrigger:", 1);
                  }
                }
              }
            }
          }
        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
    }
    while (v51);
  }

  -[ATXModeConfigurationLogger cachedSuggestedItems](self, "cachedSuggestedItems");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "mode");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "identifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "UUIDString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v138, "configuration");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "applicationConfigurationType");

  if (v61)
  {
    if (v61 == 2)
      goto LABEL_71;
    if (v61 != 1)
    {
      __atxlog_handle_metrics();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        -[ATXModeConfigurationLogger logMetricForConfiguration:].cold.2(v138);
      goto LABEL_70;
    }
    objc_msgSend(v138, "configuration");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "applicationsWithExceptions");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumDeniedApps:", objc_msgSend(v63, "count"));
    objc_msgSend(v59, "suggestedDeniedApps");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = MEMORY[0x1E0C809B0];
    v153[1] = 3221225472;
    v153[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_47;
    v153[3] = &unk_1E82E1B00;
    v154 = v63;
    v65 = v63;
    objc_msgSend(v64, "_pas_filteredSetWithTest:", v153);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumAcceptedSuggestedApps:", objc_msgSend(v66, "count"));
    v67 = v154;
  }
  else
  {
    objc_msgSend(v138, "configuration");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "applicationsWithExceptions");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumAllowedApps:", objc_msgSend(v69, "count"));
    objc_msgSend(v59, "suggestedAllowedApps");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2;
    v151[3] = &unk_1E82E1B00;
    v152 = v69;
    v65 = v69;
    objc_msgSend(v70, "_pas_filteredSetWithTest:", v151);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumAcceptedSuggestedApps:", objc_msgSend(v71, "count"));
    v67 = v152;
  }

LABEL_70:
LABEL_71:
  objc_msgSend(v138, "configuration");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "senderConfigurationType");

  if (v73)
  {
    if (v73 == 2)
      goto LABEL_80;
    if (v73 != 1)
    {
      __atxlog_handle_metrics();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        -[ATXModeConfigurationLogger logMetricForConfiguration:].cold.1(v138);
      goto LABEL_79;
    }
    objc_msgSend(v138, "configuration");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "contactsWithExceptions");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumDeniedContacts:", objc_msgSend(v75, "count"));
    objc_msgSend(v59, "suggestedDeniedContacts");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = MEMORY[0x1E0C809B0];
    v149[1] = 3221225472;
    v149[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_49;
    v149[3] = &unk_1E82E1B00;
    v150 = v75;
    v77 = v75;
    objc_msgSend(v76, "_pas_filteredSetWithTest:", v149);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumAcceptedSuggestedContacts:", objc_msgSend(v78, "count"));
    v79 = v150;
  }
  else
  {
    objc_msgSend(v138, "configuration");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "contactsWithExceptions");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumAllowedContacts:", objc_msgSend(v81, "count"));
    objc_msgSend(v59, "suggestedAllowedContacts");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2_50;
    v147[3] = &unk_1E82E1B00;
    v148 = v81;
    v77 = v81;
    objc_msgSend(v82, "_pas_filteredSetWithTest:", v147);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNumAcceptedSuggestedContacts:", objc_msgSend(v83, "count"));
    v79 = v148;
  }

LABEL_79:
LABEL_80:
  v131 = v59;
  objc_msgSend(v138, "configuration");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "applicationConfigurationType");
  DNDStringFromConfigurationType();
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAppConfigurationType:", v85);

  objc_msgSend(v138, "configuration");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "senderConfigurationType");
  DNDStringFromConfigurationType();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContactConfigurationType:", v87);

  objc_msgSend(v10, "setIsAutomaticallyGenerated:", objc_msgSend(v138, "isAutomaticallyGenerated"));
  objc_msgSend(v10, "setDoesImpactAvailability:", objc_msgSend(v138, "impactsAvailability") != 0);
  -[ATXModeConfigurationLogger client](self, "client");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsSharingAcrossDevices:", objc_msgSend(v88, "isCloudSyncActive"));

  -[ATXModeConfigurationLogger client](self, "client");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "mode");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "modeIdentifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = 0;
  objc_msgSend(v89, "appConfigurationsForModeIdentifier:error:", v91, &v146);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v146;
  objc_msgSend(v10, "setNumAppConfigurations:", objc_msgSend(v92, "count"));

  -[ATXModeEntityTrialClientWrapper trialExperimentId](self->_modeEntityTrialClientWrapper, "trialExperimentId");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExperimentId:", v94);

  -[ATXModeEntityTrialClientWrapper trialTreatmentId](self->_modeEntityTrialClientWrapper, "trialTreatmentId");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTreatmentId:", v95);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ATXModeEntityTrialClientWrapper trialDeploymentId](self->_modeEntityTrialClientWrapper, "trialDeploymentId"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDeploymentId:", v96);

  v135 = v93;
  if (v93)
  {
    __atxlog_handle_metrics();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v126 = (objc_class *)objc_opt_class();
      NSStringFromClass(v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedDescription");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "mode");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "semanticType");
      DNDModeSemanticTypeToString();
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v172 = v127;
      v173 = 2112;
      v174 = v128;
      v175 = 2112;
      v176 = v130;
      _os_log_error_impl(&dword_1C9A3B000, v97, OS_LOG_TYPE_ERROR, "%@: Got error: %@, when getting AppConfigturation for %@", buf, 0x20u);

    }
  }
  v98 = (void *)MEMORY[0x1E0CF91B0];
  objc_msgSend(v138, "mode");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v98) = objc_msgSend(v98, "suggestionsAreSupportedForModeSemanticType:", objc_msgSend(v99, "semanticType"));

  if ((_DWORD)v98)
  {
    v100 = objc_alloc(MEMORY[0x1E0CF91B0]);
    objc_msgSend(v138, "mode");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)objc_msgSend(v100, "initWithModeSemanticType:", objc_msgSend(v101, "semanticType"));

    objc_msgSend(v10, "setWasQuickStartPlatterShown:", objc_msgSend(v102, "suggestionWasAlreadyShown"));
  }
  v103 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v104 = (void *)objc_msgSend(v103, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v104, "dictionaryForKey:", *MEMORY[0x1E0CF95C0]);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "mode");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "modeIdentifier");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "objectForKeyedSubscript:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWasColoringBookSeen:", objc_msgSend(v108, "BOOLValue"));

  objc_msgSend(v10, "setNumAcceptedSuggestedLockScreens:", 0);
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  +[ATXPosterConfigurationCache sharedInstance](ATXPosterConfigurationCache, "sharedInstance");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "configurations");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v141 = v110;
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v142, v170, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v143;
    do
    {
      for (m = 0; m != v112; ++m)
      {
        if (*(_QWORD *)v143 != v113)
          objc_enumerationMutation(v141);
        objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * m), "galleryItem");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v115;
        if (v115
          && (objc_msgSend(v115, "modeSemanticType"), (v107 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v116, "modeSemanticType");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v106, "integerValue");
          objc_msgSend(v138, "mode");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v117 == objc_msgSend(v108, "semanticType") && objc_msgSend(v116, "source") == 6;
          v119 = 1;
        }
        else
        {
          v119 = 0;
          v118 = 0;
        }
        objc_msgSend(v10, "setNumAcceptedSuggestedLockScreens:", objc_msgSend(v10, "numAcceptedSuggestedLockScreens") + v118);
        if (v119)
        {

        }
        if (v116)

      }
      v112 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v142, v170, 16);
    }
    while (v112);
  }

  __atxlog_handle_metrics();
  v120 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
  {
    v121 = (objc_class *)objc_opt_class();
    NSStringFromClass(v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "mode");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "identifier");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "UUIDString");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v172 = v122;
    v173 = 2112;
    v174 = v125;
    _os_log_impl(&dword_1C9A3B000, v120, OS_LOG_TYPE_INFO, "%@ - Logging metrics for DND mode with UUID %@", buf, 0x16u);

  }
  objc_msgSend(v10, "logToCoreAnalytics");

}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "modeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  return v8;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v3);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "bundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v3);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "contactIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v3);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __56__ATXModeConfigurationLogger_logMetricForConfiguration___block_invoke_2_50(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "contactIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v3);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)retrieveEvents
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "publisherFromStartTime:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke;
  v7[3] = &unk_1E82DCE78;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_56;
  v6[3] = &unk_1E82DF748;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:shouldContinue:", v7, v6);

}

void __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - Retrieved events from ATXModeConfigurationUIFlowLoggingBiomeStream", (uint8_t *)&v9, 0xCu);

  }
}

uint64_t __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_56(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dndModeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedSuggestedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "cachedSuggestedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "cachedSuggestedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "modeConfigurationEntityType"))
  {
    if (objc_msgSend(v3, "modeConfigurationType"))
      objc_msgSend(v11, "suggestedDeniedApps");
    else
      objc_msgSend(v11, "suggestedAllowedApps");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "modeConfigurationEntityType") == 1)
  {
    if (objc_msgSend(v3, "modeConfigurationType"))
      objc_msgSend(v11, "suggestedDeniedContacts");
    else
      objc_msgSend(v11, "suggestedAllowedContacts");
LABEL_7:
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    objc_msgSend(v3, "suggestedEntityIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

  }
  return 1;
}

- (ATXDNDModeConfigurationClient)client
{
  return self->_client;
}

- (NSMutableDictionary)cachedSuggestedItems
{
  return self->_cachedSuggestedItems;
}

- (void)setCachedSuggestedItems:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSuggestedItems, a3);
}

- (NSArray)cachedConfigurations
{
  return self->_cachedConfigurations;
}

- (void)setCachedConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigurations, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedItems, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
}

- (void)logModeConfigurationsWithXPCActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v5, "%@ - Failed to fetch mode configurations from client.  Terminating.", v6);

  OUTLINED_FUNCTION_1();
}

- (void)logMetricForConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "senderConfigurationType");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Unable to set number of allowed or denied contacts on metric due to unknown DNDConfigurationType: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)logMetricForConfiguration:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationConfigurationType");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Unable to set number of allowed or denied apps on metric due to unknown DNDConfigurationType: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)logMetricForConfiguration:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[ATXModeConfigurationLogger logMetricForConfiguration:]";
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a1, a3, "%s: Failed to determine whether sleep migration happened so can't set didRemoveSuggestedPage on the metric correctly. Setting metric to NO as a fallback.", (uint8_t *)&v3);
}

- (void)logMetricForConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXModeConfigurationLogger: Unable to load HomeScreen page configurations - %{public}@", v2);
}

void __44__ATXModeConfigurationLogger_retrieveEvents__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - Failed to retrive events from ATXModeConfigurationUIFlowLoggingBiomeStream: %@", (uint8_t *)&v9, 0x16u);

}

@end
