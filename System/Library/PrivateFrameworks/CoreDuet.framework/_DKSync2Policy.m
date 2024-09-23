@implementation _DKSync2Policy

+ (id)userDefaults
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
}

+ (id)policyCache
{
  objc_opt_self();
  if (policyCache_onceToken != -1)
    dispatch_once(&policyCache_onceToken, &__block_literal_global_2);
  return (id)policyCache_policyCache;
}

+ (id)policyForSyncTransportType:(int64_t)a3
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("CloudDown");
  v6 = &stru_1E26E9728;
  if (a3 == 8)
    v6 = CFSTR("CloudUp");
  if (a3 != 4)
    v5 = v6;
  if (a3 == 1)
    v7 = CFSTR("Rapport");
  else
    v7 = v5;
  +[_DKSync2Policy policyCache]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[_DKSync2Policy _policyForSyncTransportType:]((uint64_t)a1, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[_DKSync2Policy policyCache]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, v7);

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v13;
        v16 = 2114;
        v17 = v7;
        v18 = 2114;
        v19 = v9;
        _os_log_debug_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Policy for transport %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);

      }
    }
  }
  return v9;
}

+ (id)_policyForSyncTransportType:(uint64_t)a1
{
  void *v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  float v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_self();
  switch(a2)
  {
    case 1:
      v4 = CFSTR("Policies/com.apple.coreduet.knowledge.syncPolicies2.ios.rp.dn");
      goto LABEL_7;
    case 8:
      v4 = CFSTR("Policies/com.apple.coreduet.knowledge.syncPolicies2.ios.ck.up");
      goto LABEL_7;
    case 4:
      v4 = CFSTR("Policies/com.apple.coreduet.knowledge.syncPolicies2.ios.ck.dn");
LABEL_7:
      v5 = objc_opt_new();
      +[_DKSync2Policy configurationPlistForFilename:]((uint64_t)v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NSObject addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Version"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = v8;

      +[_DKSync2Policy userDefaults]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("CloudSync2Policies"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = CFSTR("CloudDown");
        v13 = &stru_1E26E9728;
        if (a2 == 8)
          v13 = CFSTR("CloudUp");
        if (a2 != 4)
          v12 = v13;
        if (a2 == 1)
          v14 = CFSTR("Rapport");
        else
          v14 = v12;
        objc_msgSend(v11, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Version"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || (objc_msgSend(v16, "floatValue"), v17 < v9))
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = 138543618;
                v31 = v19;
                v32 = 2112;
                v33 = v14;
                _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_INFO, "%{public}@: Cloud policy for %@ is invalid and/or old. Removing saved policies from defaults.", (uint8_t *)&v30, 0x16u);

              }
              +[_DKSync2Policy userDefaults]();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "removeObjectForKey:", CFSTR("CloudSync2Policies"));

              v15 = (void *)MEMORY[0x1E0C9AA70];
              v11 = (void *)MEMORY[0x1E0C9AA70];
            }

          }
        }
        if (objc_msgSend(v15, "count"))
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 138543874;
            v31 = v29;
            v32 = 2114;
            v33 = v14;
            v34 = 2114;
            v35 = v15;
            _os_log_debug_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Using remote policy override for %{public}@: %{public}@", (uint8_t *)&v30, 0x20u);

          }
        }
        -[NSObject addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v15);

      }
      +[_DKSync2Policy userDefaults]();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("CloudSync2Policy"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v23, "count"))
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            +[_DKSync2Policy _policyForSyncTransportType:].cold.2();

        }
        -[NSObject addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v23);
      }
      objc_msgSend(v3, "policyFromDictionary:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting")
        && objc_msgSend(v25, "syncDisabled"))
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543362;
          v31 = v27;
          _os_log_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_INFO, "%{public}@: Enabling sync due to unit testing", (uint8_t *)&v30, 0xCu);

        }
        objc_msgSend(v25, "setSyncDisabled:", 0);
      }

      goto LABEL_45;
  }
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setSyncDisabled:", 1);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[_DKSync2Policy _policyForSyncTransportType:].cold.1();
LABEL_45:

  return v25;
}

+ (NSObject)configurationPlistForFilename:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = a2;
  v3 = objc_opt_self();
  +[_DKSync2Policy syncPolicyConfigPathForFilename:](v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[_DKSync2Policy configurationPlistForFilename:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_DKSync2Policy configurationPlistForFilename:].cold.2();

LABEL_9:
    v5 = 0;
  }

  return v5;
}

+ (BOOL)rapportSyncDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[_DKSync2Policy userDefaults]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CloudSync2Policy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RapportSyncDisabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)cloudSyncDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[_DKSync2Policy userDefaults]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CloudSync2Policy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CloudSyncDisabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)setOkToDownloadPolicyUpdates:(BOOL)a3
{
  NSObject *v4;

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[_DKSync2Policy setOkToDownloadPolicyUpdates:].cold.1();

  _DKSync2PolicyOkToDownloadPolicyUpdates = a3;
}

- (uint64_t)initWithDictionary:(uint64_t *)a1
{
  id v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  char v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  char v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  char v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  char v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  char v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  char v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  char v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  char v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  char v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  char v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  char v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  char v86;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  char v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  char v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  void *v102;
  NSObject *v103;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  objc_super v194;
  uint8_t buf[4];
  void *v196;
  __int16 v197;
  const __CFString *v198;
  __int16 v199;
  void *v200;
  __int16 v201;
  id v202;
  __int16 v203;
  uint64_t v204;
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v194.receiver = a1;
    v194.super_class = (Class)_DKSync2Policy;
    v4 = (uint64_t *)objc_msgSendSuper2(&v194, sel_init);

    if (!v4)
    {
LABEL_152:
      a1 = v4;

      goto LABEL_153;
    }
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "setName:", v11);
    }
    else
    {

      if (!v12)
        goto LABEL_9;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v178;
        v197 = 2112;
        v198 = CFSTR("Name");
        v199 = 2112;
        v200 = v177;
        v201 = 2112;
        v202 = v106;
        v107 = v106;
        v203 = 2112;
        v204 = v7;
        _os_log_error_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_9:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v14 & 1) != 0)
    {
      objc_msgSend(v4, "setVersion:", v15);
    }
    else
    {

      if (!v16)
        goto LABEL_15;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v108;
        v197 = 2112;
        v198 = CFSTR("Version");
        v199 = 2112;
        v200 = v179;
        v201 = 2112;
        v202 = v110;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_15:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncDisabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncDisabled"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      objc_msgSend(v4, "setSyncDisabled:", -[NSObject BOOLValue](v19, "BOOLValue"));
    }
    else
    {

      if (!v20)
        goto LABEL_21;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncDisabled"));
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncDisabled"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v111;
        v197 = 2112;
        v198 = CFSTR("SyncDisabled");
        v199 = 2112;
        v200 = v180;
        v201 = 2112;
        v202 = v113;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_21:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxBatchesPerSync"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxBatchesPerSync"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if ((v22 & 1) != 0)
    {
      objc_msgSend(v4, "setMaxBatchesPerSync:", -[NSObject unsignedIntegerValue](v23, "unsignedIntegerValue"));
    }
    else
    {

      if (!v24)
        goto LABEL_27;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxBatchesPerSync"));
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxBatchesPerSync"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v114;
        v197 = 2112;
        v198 = CFSTR("MaxBatchesPerSync");
        v199 = 2112;
        v200 = v181;
        v201 = 2112;
        v202 = v116;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_27:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncPeriodInDays"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncPeriodInDays"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((v26 & 1) != 0)
    {
      objc_msgSend(v4, "setMaxSyncPeriodInDays:", -[NSObject unsignedIntegerValue](v27, "unsignedIntegerValue"));
    }
    else
    {

      if (!v28)
        goto LABEL_33;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncPeriodInDays"));
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncPeriodInDays"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v117;
        v197 = 2112;
        v198 = CFSTR("MaxSyncPeriodInDays");
        v199 = 2112;
        v200 = v182;
        v201 = 2112;
        v202 = v119;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_33:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncDownIntervalInDays"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncDownIntervalInDays"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if ((v30 & 1) != 0)
    {
      objc_msgSend(v4, "setMaxSyncDownIntervalInDays:", -[NSObject unsignedIntegerValue](v31, "unsignedIntegerValue"));
    }
    else
    {

      if (!v32)
        goto LABEL_39;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncDownIntervalInDays"));
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncDownIntervalInDays"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v120;
        v197 = 2112;
        v198 = CFSTR("MaxSyncDownIntervalInDays");
        v199 = 2112;
        v200 = v183;
        v201 = 2112;
        v202 = v122;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_39:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncIntervalInSeconds"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncIntervalInSeconds"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((v34 & 1) != 0)
    {
      objc_msgSend(v4, "setMinSyncIntervalInSeconds:", -[NSObject unsignedIntegerValue](v35, "unsignedIntegerValue"));
    }
    else
    {

      if (!v36)
        goto LABEL_45;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncIntervalInSeconds"));
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncIntervalInSeconds"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v123;
        v197 = 2112;
        v198 = CFSTR("MinSyncIntervalInSeconds");
        v199 = 2112;
        v200 = v184;
        v201 = 2112;
        v202 = v125;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_45:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncWindowInSeconds"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncWindowInSeconds"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if ((v38 & 1) != 0)
    {
      objc_msgSend(v4, "setMinSyncWindowInSeconds:", -[NSObject unsignedIntegerValue](v39, "unsignedIntegerValue"));
    }
    else
    {

      if (!v40)
        goto LABEL_51;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncWindowInSeconds"));
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncWindowInSeconds"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v126;
        v197 = 2112;
        v198 = CFSTR("MinSyncWindowInSeconds");
        v199 = 2112;
        v200 = v185;
        v201 = 2112;
        v202 = v128;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_51:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncsPerDay"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncsPerDay"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if ((v42 & 1) != 0)
    {
      objc_msgSend(v4, "setMinSyncsPerDay:", -[NSObject unsignedIntegerValue](v43, "unsignedIntegerValue"));
    }
    else
    {

      if (!v44)
        goto LABEL_57;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncsPerDay"));
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinSyncsPerDay"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v129;
        v197 = 2112;
        v198 = CFSTR("MinSyncsPerDay");
        v199 = 2112;
        v200 = v186;
        v201 = 2112;
        v202 = v131;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_57:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncsPerDay"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncsPerDay"));
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if ((v46 & 1) != 0)
    {
      objc_msgSend(v4, "setMaxSyncsPerDay:", -[NSObject unsignedIntegerValue](v47, "unsignedIntegerValue"));
    }
    else
    {

      if (!v48)
        goto LABEL_63;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncsPerDay"));
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxSyncsPerDay"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v132;
        v197 = 2112;
        v198 = CFSTR("MaxSyncsPerDay");
        v199 = 2112;
        v200 = v187;
        v201 = 2112;
        v202 = v134;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_63:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NumChangesTriggeringSync"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NumChangesTriggeringSync"));
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if ((v50 & 1) != 0)
    {
      objc_msgSend(v4, "setNumChangesTriggeringSync:", -[NSObject unsignedIntegerValue](v51, "unsignedIntegerValue"));
    }
    else
    {

      if (!v52)
        goto LABEL_69;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NumChangesTriggeringSync"));
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NumChangesTriggeringSync"));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v135;
        v197 = 2112;
        v198 = CFSTR("NumChangesTriggeringSync");
        v199 = 2112;
        v200 = v188;
        v201 = 2112;
        v202 = v137;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v52, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_69:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PolicyDownloadIntervalInDays"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PolicyDownloadIntervalInDays"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if ((v54 & 1) != 0)
    {
      objc_msgSend(v4, "setPolicyDownloadIntervalInDays:", -[NSObject unsignedIntegerValue](v55, "unsignedIntegerValue"));
    }
    else
    {

      if (!v56)
        goto LABEL_75;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PolicyDownloadIntervalInDays"));
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PolicyDownloadIntervalInDays"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v138;
        v197 = 2112;
        v198 = CFSTR("PolicyDownloadIntervalInDays");
        v199 = 2112;
        v200 = v189;
        v201 = 2112;
        v202 = v140;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v56, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_75:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if ((v58 & 1) != 0)
    {
      objc_msgSend(v4, "setPushTriggersSync:", -[NSObject BOOLValue](v59, "BOOLValue"));
    }
    else
    {

      if (!v60)
        goto LABEL_81;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v141;
        v197 = 2112;
        v198 = CFSTR("PushTriggersSync");
        v199 = 2112;
        v200 = v190;
        v201 = 2112;
        v202 = v143;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v60, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_81:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequireCharging"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequireCharging"));
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if ((v62 & 1) != 0)
    {
      objc_msgSend(v4, "setRequireCharging:", -[NSObject BOOLValue](v63, "BOOLValue"));
    }
    else
    {

      if (!v64)
        goto LABEL_87;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequireCharging"));
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequireCharging"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v144;
        v197 = 2112;
        v198 = CFSTR("RequireCharging");
        v199 = 2112;
        v200 = v191;
        v201 = 2112;
        v202 = v146;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v64, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_87:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SingleDeviceSyncIntervalInDays"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SingleDeviceSyncIntervalInDays"));
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if ((v66 & 1) != 0)
    {
      objc_msgSend(v4, "setSingleDeviceSyncIntervalInDays:", -[NSObject unsignedIntegerValue](v67, "unsignedIntegerValue"));
    }
    else
    {

      if (!v68)
        goto LABEL_93;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SingleDeviceSyncIntervalInDays"));
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SingleDeviceSyncIntervalInDays"));
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v147;
        v197 = 2112;
        v198 = CFSTR("SingleDeviceSyncIntervalInDays");
        v199 = 2112;
        v200 = v192;
        v201 = 2112;
        v202 = v149;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v68, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_93:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToSync"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToSync"));
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = v71;
    if ((v70 & 1) != 0)
    {
      objc_msgSend(v4, "setStreamNamesToSync:", v71);
    }
    else
    {

      if (!v72)
        goto LABEL_99;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToSync"));
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToSync"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v150;
        v197 = 2112;
        v198 = CFSTR("StreamNamesToSync");
        v199 = 2112;
        v200 = v193;
        v201 = 2112;
        v202 = v152;
        v203 = 2112;
        v204 = v8;
        _os_log_error_impl(&dword_18DDBE000, v72, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_99:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToAlwaysSync"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToAlwaysSync"));
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if ((v74 & 1) != 0)
    {
      objc_msgSend(v4, "setStreamNamesToAlwaysSync:", v75);
    }
    else
    {

      if (!v76)
        goto LABEL_105;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToAlwaysSync"));
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesToAlwaysSync"));
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v153;
        v197 = 2112;
        v198 = CFSTR("StreamNamesToAlwaysSync");
        v199 = 2112;
        v200 = v154;
        v201 = 2112;
        v202 = v156;
        v203 = 2112;
        v204 = v6;
        _os_log_error_impl(&dword_18DDBE000, v76, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_105:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithAdditionsTriggeringSync"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithAdditionsTriggeringSync"));
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if ((v78 & 1) != 0)
    {
      objc_msgSend(v4, "setStreamNamesWithAdditionsTriggeringSync:", v79);
    }
    else
    {

      if (!v80)
        goto LABEL_111;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithAdditionsTriggeringSync"));
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithAdditionsTriggeringSync"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v157;
        v197 = 2112;
        v198 = CFSTR("StreamNamesWithAdditionsTriggeringSync");
        v199 = 2112;
        v200 = v158;
        v201 = 2112;
        v202 = v160;
        v203 = 2112;
        v204 = v6;
        _os_log_error_impl(&dword_18DDBE000, v80, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_111:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithDeletionsTriggeringSync"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithDeletionsTriggeringSync"));
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if ((v82 & 1) != 0)
    {
      objc_msgSend(v4, "setStreamNamesWithDeletionsTriggeringSync:", v83);
    }
    else
    {

      if (!v84)
        goto LABEL_117;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithDeletionsTriggeringSync"));
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StreamNamesWithDeletionsTriggeringSync"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v161;
        v197 = 2112;
        v198 = CFSTR("StreamNamesWithDeletionsTriggeringSync");
        v199 = 2112;
        v200 = v162;
        v201 = 2112;
        v202 = v164;
        v203 = 2112;
        v204 = v6;
        _os_log_error_impl(&dword_18DDBE000, v84, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_117:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncBatchSizeInEvents"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncBatchSizeInEvents"));
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = v87;
    if ((v86 & 1) != 0)
    {
      objc_msgSend(v4, "setSyncBatchSizeInEvents:", -[NSObject unsignedIntegerValue](v87, "unsignedIntegerValue"));
    }
    else
    {

      if (!v88)
        goto LABEL_123;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncBatchSizeInEvents"));
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncBatchSizeInEvents"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v165;
        v197 = 2112;
        v198 = CFSTR("SyncBatchSizeInEvents");
        v199 = 2112;
        v200 = v166;
        v201 = 2112;
        v202 = v168;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v88, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_123:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncTimeoutInSeconds"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncTimeoutInSeconds"));
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = v91;
    if ((v90 & 1) != 0)
    {
      objc_msgSend(v4, "setSyncTimeoutInSeconds:", -[NSObject unsignedIntegerValue](v91, "unsignedIntegerValue"));
    }
    else
    {

      if (!v92)
        goto LABEL_129;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncTimeoutInSeconds"));
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncTimeoutInSeconds"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        v172 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v169;
        v197 = 2112;
        v198 = CFSTR("SyncTimeoutInSeconds");
        v199 = 2112;
        v200 = v170;
        v201 = 2112;
        v202 = v172;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v92, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

LABEL_129:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TriggeredSyncDelayInSeconds"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_opt_isKindOfClass();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TriggeredSyncDelayInSeconds"));
    v95 = objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if ((v94 & 1) != 0)
    {
      objc_msgSend(v4, "setTriggeredSyncDelayInSeconds:", -[NSObject unsignedIntegerValue](v95, "unsignedIntegerValue"));
    }
    else
    {

      if (!v96)
      {
LABEL_135:
        objc_msgSend(CFSTR("com.apple.CoreDuet"), "UTF8String");
        if (os_variant_has_internal_diagnostics())
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Policy initWithDictionary:].cold.2();

          v98 = (void *)v4[20];
          if (v98)
            v99 = (void *)objc_msgSend(v98, "mutableCopy");
          else
            v99 = (void *)objc_opt_new();
          v100 = v99;

          objc_msgSend(v100, "addObject:", CFSTR("/always/sync"));
          v101 = objc_msgSend(v100, "copy");
          v102 = (void *)v4[20];
          v4[20] = v101;

        }
        if (objc_msgSend(v3, "count") && !*((_BYTE *)v4 + 8) && !v4[16])
        {
          *((_BYTE *)v4 + 8) = 1;
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            -[_DKSync2Policy initWithDictionary:].cold.1();

        }
        if (_DKSync2PolicyOkToDownloadPolicyUpdates && objc_msgSend(v3, "count") && !*((_BYTE *)v4 + 8))
          +[_DKSync2Policy possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:]((uint64_t)_DKSync2Policy, v4[19]);
        goto LABEL_152;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TriggeredSyncDelayInSeconds"));
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TriggeredSyncDelayInSeconds"));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v173;
        v197 = 2112;
        v198 = CFSTR("TriggeredSyncDelayInSeconds");
        v199 = 2112;
        v200 = v174;
        v201 = 2112;
        v202 = v176;
        v203 = 2112;
        v204 = v5;
        _os_log_error_impl(&dword_18DDBE000, v96, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);

      }
    }

    goto LABEL_135;
  }
LABEL_153:

  return a1;
}

+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:(uint64_t)a1
{
  uint64_t v3;
  _QWORD block[4];
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke;
  block[3] = &unk_1E26E2E50;
  v5 = CFSTR("com.apple.coreduet.sync-policy.policy-download");
  v6 = v3;
  v7 = a2;
  if (possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized != -1)
    dispatch_once(&possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized, block);

}

+ (id)policyFromDictionary:(id)a3
{
  id v3;
  uint64_t *v4;

  v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = (id)MEMORY[0x1E0C9AA70];
  }
  v4 = -[_DKSync2Policy initWithDictionary:]((uint64_t *)[_DKSync2Policy alloc], v3);

  return v4;
}

+ (id)productVersion
{
  void *v0;
  const void *v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (void)handleDownloadSyncPolicyResponse:(void *)a3 data:(void *)a4 error:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  if (v8)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.4();

    goto LABEL_5;
  }
  if (objc_msgSend(v6, "statusCode") != 200)
  {
    if (objc_msgSend(v6, "statusCode") != 204
      && objc_msgSend(v6, "statusCode") != 205
      && objc_msgSend(v6, "statusCode") != 404
      && objc_msgSend(v6, "statusCode") != 410)
    {
      goto LABEL_5;
    }
    v11 = objc_opt_new();
    if (!v11)
      goto LABEL_5;
LABEL_26:
    +[_DKSync2Policy userDefaults]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("CloudSync2Policies"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = (id)objc_opt_new();
    v21 = v20;

    objc_msgSend(v17, "setValue:forKey:", v11, CFSTR("CloudSync2Policies"));
    if ((-[NSObject isEqualToDictionary:](v11, "isEqualToDictionary:", v21) & 1) == 0)
    {
      +[_DKSync2Policy policyCache]();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeAllObjects");

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("_DKSync2PolicyDidChangeNotification"), v9, 0);

    }
    goto LABEL_32;
  }
  if (v7)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v24);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (!v11)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.3();

    }
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.2();
    v11 = 0;
  }

  objc_msgSend(v6, "allHeaderFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDServerRequest getHTTPModifiedSinceFromHeaders:]((uint64_t)_CDServerRequest, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[_DKSync2Policy userDefaults]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v15, CFSTR("CloudSyncPoliciesLastModified"));

  }
  if (v11)
    goto LABEL_26;
LABEL_5:
  if (objc_msgSend(v6, "statusCode") == 304)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.1();
LABEL_32:

  }
}

+ (id)syncPolicyConfigPathForFilename:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", v2, CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)disabledFeaturesForSyncType:(id)a3 transports:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a3;
  +[_DKSyncedFeatures sharedInstance]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = -[_DKSyncToggle isEnabled]((_BOOL8)v5);

  if (-[_DKSyncedFeatures isDigitalHealthDisabledWithIsSingleDevice:forTransports:]((uint64_t)v6, v8, a4))
    objc_msgSend(v7, "addObject:", CFSTR("DigitalHealth"));
  if (-[_DKSyncedFeatures isIDSMessageGatingDisabled]((uint64_t)v6))
    objc_msgSend(v7, "addObject:", CFSTR("IDSMessageGating"));
  if (-[_DKSyncedFeatures isSiriPortraitDisabled]((uint64_t)v6))
    objc_msgSend(v7, "addObject:", CFSTR("SiriPortrait"));
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)v6, a4))
    objc_msgSend(v7, "addObject:", CFSTR("Supergreen"));
  if (-[_DKSyncedFeatures isEucalyptusDisabled]((uint64_t)v6))
    objc_msgSend(v7, "addObject:", CFSTR("Eucalyptus"));
  if (-[_DKSyncedFeatures isOptimizedBatteryChargingDisabled]((uint64_t)v6))
    objc_msgSend(v7, "addObject:", CFSTR("OptimizedBatteryCharging"));
  if (-[_DKSyncedFeatures isTipsDisabled]((uint64_t)v6))
    objc_msgSend(v7, "addObject:", CFSTR("Tips"));
  if (objc_msgSend(v7, "count"))
    v9 = (void *)objc_msgSend(v7, "copy");
  else
    v9 = 0;

  return v9;
}

- (id)streamNamesToSyncWithDisabledFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_streamNamesToAlwaysSync)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_streamNamesToSync;
  v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!v4
          || (objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16) & 1) == 0)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_streamNamesToSync, "objectForKeyedSubscript:", v12, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v13);

        }
      }
      v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)streamNamesToSyncWithSyncType:(id)a3 transportType:(int64_t)a4
{
  void *v5;
  void *v6;

  +[_DKSync2Policy disabledFeaturesForSyncType:transports:](_DKSync2Policy, "disabledFeaturesForSyncType:transports:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSync2Policy streamNamesToSyncWithDisabledFeatures:](self, "streamNamesToSyncWithDisabledFeatures:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canDeferSyncOperationWithSyncType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = -[_DKSyncType isPeriodicSync]((_BOOL8)v3)
    && !-[_DKSyncType forceSync]((_BOOL8)v3)
    && (unint64_t)-[_DKSyncType urgency]((uint64_t)v3) < 8;

  return v4;
}

- (BOOL)canPerformSyncOperationWithSyncType:(id)a3 lastSyncDate:(id)a4 lastDaySyncCount:(unint64_t)a5 isCharging:(BOOL)a6
{
  id v10;
  id v11;
  BOOL v12;
  _BOOL4 v13;
  _BOOL8 v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  char v19;
  double v20;
  double v21;
  double v22;

  v10 = a3;
  v11 = a4;
  v12 = -[_DKSyncType forceSync]((_BOOL8)v10);
  v13 = -[_DKSyncType isTriggeredSync]((_BOOL8)v10);
  v14 = -[_DKSyncToggle isEnabled]((_BOOL8)v10);
  if (!-[_DKSync2Policy syncDisabled](self, "syncDisabled"))
  {
    if (v12)
      goto LABEL_7;
    if (-[_DKSyncType didReceivePush]((_BOOL8)v10) && v13)
    {
      if (!-[_DKSync2Policy pushTriggersSync](self, "pushTriggersSync"))
      {
LABEL_17:
        v16 = 0;
        goto LABEL_18;
      }
    }
    else if (!v13 && !-[_DKSync2Policy minSyncsPerDay](self, "minSyncsPerDay"))
    {
      goto LABEL_17;
    }
    if (-[_DKSync2Policy requireCharging](self, "requireCharging") && !a6)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.6();
      goto LABEL_4;
    }
    if (v11)
    {
      if (v13)
      {
        if (-[_DKSync2Policy maxSyncsPerDay](self, "maxSyncsPerDay") <= a5)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.2();
          goto LABEL_4;
        }
      }
      else
      {
        if (-[_DKSyncType isPeriodicSync]((_BOOL8)v10))
        {
          +[_DKSync2Policy userDefaults]();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("IgnorePeriodicSyncLimits"));

          if ((v19 & 1) != 0)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.3();
            v16 = 1;
            goto LABEL_5;
          }
        }
        if (-[_DKSync2Policy maxSyncsPerDay](self, "maxSyncsPerDay") <= a5)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.5();
          goto LABEL_4;
        }
        objc_msgSend(v11, "timeIntervalSinceNow");
        v21 = -v20;
        -[_DKSync2Policy hoursBetweenSyncsWhenIsSingleDevice:](self, "hoursBetweenSyncsWhenIsSingleDevice:", v14);
        if (v22 * 3600.0 * 0.75 > v21)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.4();
          goto LABEL_4;
        }
      }
    }
LABEL_7:
    v16 = 1;
    goto LABEL_18;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.1();
LABEL_4:
  v16 = 0;
LABEL_5:

LABEL_18:
  return v16;
}

- (BOOL)highPriorityForSyncDownWithSyncType:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  BOOL v6;

  v3 = a3;
  +[_DKSyncUrgencyTracker sharedInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_DKSyncType forceSync]((_BOOL8)v3);

  v6 = v5 || (unint64_t)-[_DKEventData version]((uint64_t)v4) >= 0xA;
  return v6;
}

- (BOOL)highPriorityForSyncUpWithSyncType:(id)a3 lastSyncDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  unint64_t v11;
  unint64_t maxSyncDownIntervalInDays;
  double v13;
  double v14;

  v6 = a4;
  v7 = a3;
  +[_DKSyncUrgencyTracker sharedInstance]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_DKSyncType forceSync]((_BOOL8)v7);

  if (v9)
  {
    v10 = 1;
  }
  else
  {
    v11 = -[_DKEventData version]((uint64_t)v8);
    v10 = 1;
    if (v6 && v11 <= 9)
    {
      maxSyncDownIntervalInDays = self->_maxSyncDownIntervalInDays;
      if (maxSyncDownIntervalInDays)
      {
        v13 = (double)(86400 * maxSyncDownIntervalInDays);
        objc_msgSend(v6, "timeIntervalSinceNow");
        v10 = -v14 > v13;
      }
      else
      {
        v10 = 0;
      }
    }
  }

  return v10;
}

- (id)queryStartDateWithSyncType:(void *)a1 lastSyncDate:(uint64_t)a2 lastDaySyncCount:(void *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;

  v4 = a3;
  if (a1)
  {
    v5 = objc_msgSend(a1, "maxSyncPeriodInDays");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(double)(unint64_t)(86400 * v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v4, "isEqualToDate:", v7),
          v7,
          (v8 & 1) == 0))
    {
      objc_msgSend(v4, "laterDate:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v6;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Policy queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:].cold.1();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)queryStartDateWithSyncType:(id)a3 lastSyncDate:(id)a4 lastDaySyncCount:(unint64_t)a5 previousHighWaterMark:(id)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v8 = a6;
  -[_DKSync2Policy queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:](self, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "laterDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)queryStartDateWithSyncType:(id)a3 previousHighWaterMark:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  -[_DKSync2Policy queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:](self, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "laterDate:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3
{
  double result;

  -[_DKSync2Policy hoursBetweenSyncsWhenIsSingleDevice:urgency:](self, "hoursBetweenSyncsWhenIsSingleDevice:urgency:", a3, 0);
  return result;
}

- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3 urgency:(unint64_t)a4
{
  _BOOL4 v5;
  double result;
  double v8;

  v5 = a3;
  if (!-[_DKSync2Policy minSyncsPerDay](self, "minSyncsPerDay"))
    return -1.0;
  if (v5)
    return (double)-[_DKSync2Policy singleDeviceSyncIntervalInDays](self, "singleDeviceSyncIntervalInDays") * 24.0;
  result = 24.0 / (double)-[_DKSync2Policy minSyncsPerDay](self, "minSyncsPerDay");
  switch(a4)
  {
    case 0uLL:
      return result;
    case 1uLL:
      v8 = 1.25;
      goto LABEL_17;
    case 2uLL:
      v8 = 1.5;
      goto LABEL_17;
    case 3uLL:
      v8 = 1.75;
      goto LABEL_17;
    case 4uLL:
      v8 = 2.0;
      goto LABEL_17;
    case 5uLL:
      v8 = 2.33;
      goto LABEL_17;
    case 6uLL:
      v8 = 2.66;
      goto LABEL_17;
    case 7uLL:
      v8 = 3.0;
      goto LABEL_17;
    case 8uLL:
      v8 = 3.33;
      goto LABEL_17;
    case 9uLL:
      v8 = 3.66;
      goto LABEL_17;
    case 0xAuLL:
    case 0xBuLL:
      v8 = 4.0;
      goto LABEL_17;
    default:
      v8 = 1.0;
LABEL_17:
      result = result / v8;
      break;
  }
  return result;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
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

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ { \n"), v5);

  -[_DKSync2Policy name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                                   name: %@\n"), v6);

  if (-[_DKSync2Policy syncDisabled](self, "syncDisabled"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                           syncDisabled: %@\n"), v7);
  if (+[_DKSync2Policy cloudSyncDisabled](_DKSync2Policy, "cloudSyncDisabled"))
  {
    if (+[_DKSync2Policy cloudSyncDisabled](_DKSync2Policy, "cloudSyncDisabled"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                      cloudSyncDisabled: %@\n"), v8);
  }
  if (+[_DKSync2Policy rapportSyncDisabled](_DKSync2Policy, "rapportSyncDisabled"))
  {
    if (+[_DKSync2Policy rapportSyncDisabled](_DKSync2Policy, "rapportSyncDisabled"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                    rapportSyncDisabled: %@\n"), v9);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy maxSyncDownIntervalInDays](self, "maxSyncDownIntervalInDays"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              maxSyncDownIntervalInDays: %@\n"), v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy maxSyncPeriodInDays](self, "maxSyncPeriodInDays"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                    maxSyncPeriodInDays: %@\n"), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy minSyncIntervalInSeconds](self, "minSyncIntervalInSeconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("               minSyncIntervalInSeconds: %@\n"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy minSyncWindowInSeconds](self, "minSyncWindowInSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                 minSyncWindowInSeconds: %@\n"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy minSyncsPerDay](self, "minSyncsPerDay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                         minSyncsPerDay: %@\n"), v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy maxSyncsPerDay](self, "maxSyncsPerDay"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                         maxSyncsPerDay: %@\n"), v15);

  if (-[_DKSync2Policy numChangesTriggeringSync](self, "numChangesTriggeringSync"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy numChangesTriggeringSync](self, "numChangesTriggeringSync"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("               numChangesTriggeringSync: %@\n"), v16);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("               numChangesTriggeringSync: %@\n"), CFSTR("disabled"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy policyDownloadIntervalInDays](self, "policyDownloadIntervalInDays"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("           policyDownloadIntervalInDays: %@\n"), v17);

  if (-[_DKSync2Policy pushTriggersSync](self, "pushTriggersSync"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                       pushTriggersSync: %@\n"), v18);
  if (-[_DKSync2Policy requireCharging](self, "requireCharging"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                        requireCharging: %@\n"), v19);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy singleDeviceSyncIntervalInDays](self, "singleDeviceSyncIntervalInDays"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         singleDeviceSyncIntervalInDays: %@\n"), v20);

  -[_DKSync2Policy streamNamesToSync](self, "streamNamesToSync");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(v21, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                      streamNamesToSync: %@\n"), v22);

  -[_DKSync2Policy streamNamesToAlwaysSync](self, "streamNamesToAlwaysSync");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(v23, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                streamNamesToAlwaysSync: %@\n"), v24);

  -[_DKSync2Policy streamNamesWithAdditionsTriggeringSync](self, "streamNamesWithAdditionsTriggeringSync");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(v25, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamNamesWithAdditionsTriggeringSync: %@\n"), v26);

  -[_DKSync2Policy streamNamesWithDeletionsTriggeringSync](self, "streamNamesWithDeletionsTriggeringSync");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(v27, 0, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamNamesWithDeletionsTriggeringSync: %@\n"), v28);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy syncBatchSizeInEvents](self, "syncBatchSizeInEvents"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                  syncBatchSizeInEvents: %@\n"), v29);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy maxBatchesPerSync](self, "maxBatchesPerSync"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                      maxBatchesPerSync: %@\n"), v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy syncTimeoutInSeconds](self, "syncTimeoutInSeconds"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                   syncTimeoutInSeconds: %@\n"), v31);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync2Policy triggeredSyncDelayInSeconds](self, "triggeredSyncDelayInSeconds"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("            triggeredSyncDelayInSeconds: %@\n"), v32);

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)syncDisabled
{
  return self->_syncDisabled;
}

- (void)setSyncDisabled:(BOOL)a3
{
  self->_syncDisabled = a3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (unint64_t)maxSyncPeriodInDays
{
  return self->_maxSyncPeriodInDays;
}

- (void)setMaxSyncPeriodInDays:(unint64_t)a3
{
  self->_maxSyncPeriodInDays = a3;
}

- (unint64_t)maxSyncDownIntervalInDays
{
  return self->_maxSyncDownIntervalInDays;
}

- (void)setMaxSyncDownIntervalInDays:(unint64_t)a3
{
  self->_maxSyncDownIntervalInDays = a3;
}

- (unint64_t)minSyncIntervalInSeconds
{
  return self->_minSyncIntervalInSeconds;
}

- (void)setMinSyncIntervalInSeconds:(unint64_t)a3
{
  self->_minSyncIntervalInSeconds = a3;
}

- (unint64_t)minSyncWindowInSeconds
{
  return self->_minSyncWindowInSeconds;
}

- (void)setMinSyncWindowInSeconds:(unint64_t)a3
{
  self->_minSyncWindowInSeconds = a3;
}

- (unint64_t)minSyncsPerDay
{
  return self->_minSyncsPerDay;
}

- (void)setMinSyncsPerDay:(unint64_t)a3
{
  self->_minSyncsPerDay = a3;
}

- (unint64_t)maxSyncsPerDay
{
  return self->_maxSyncsPerDay;
}

- (void)setMaxSyncsPerDay:(unint64_t)a3
{
  self->_maxSyncsPerDay = a3;
}

- (unint64_t)numChangesTriggeringSync
{
  return self->_numChangesTriggeringSync;
}

- (void)setNumChangesTriggeringSync:(unint64_t)a3
{
  self->_numChangesTriggeringSync = a3;
}

- (BOOL)pushTriggersSync
{
  return self->_pushTriggersSync;
}

- (void)setPushTriggersSync:(BOOL)a3
{
  self->_pushTriggersSync = a3;
}

- (BOOL)requireCharging
{
  return self->_requireCharging;
}

- (void)setRequireCharging:(BOOL)a3
{
  self->_requireCharging = a3;
}

- (unint64_t)singleDeviceSyncIntervalInDays
{
  return self->_singleDeviceSyncIntervalInDays;
}

- (void)setSingleDeviceSyncIntervalInDays:(unint64_t)a3
{
  self->_singleDeviceSyncIntervalInDays = a3;
}

- (NSDictionary)streamNamesToSync
{
  return self->_streamNamesToSync;
}

- (void)setStreamNamesToSync:(id)a3
{
  objc_storeStrong((id *)&self->_streamNamesToSync, a3);
}

- (NSArray)streamNamesWithAdditionsTriggeringSync
{
  return self->_streamNamesWithAdditionsTriggeringSync;
}

- (void)setStreamNamesWithAdditionsTriggeringSync:(id)a3
{
  objc_storeStrong((id *)&self->_streamNamesWithAdditionsTriggeringSync, a3);
}

- (NSArray)streamNamesWithDeletionsTriggeringSync
{
  return self->_streamNamesWithDeletionsTriggeringSync;
}

- (void)setStreamNamesWithDeletionsTriggeringSync:(id)a3
{
  objc_storeStrong((id *)&self->_streamNamesWithDeletionsTriggeringSync, a3);
}

- (unint64_t)syncBatchSizeInEvents
{
  return self->_syncBatchSizeInEvents;
}

- (void)setSyncBatchSizeInEvents:(unint64_t)a3
{
  self->_syncBatchSizeInEvents = a3;
}

- (unint64_t)maxBatchesPerSync
{
  return self->_maxBatchesPerSync;
}

- (void)setMaxBatchesPerSync:(unint64_t)a3
{
  self->_maxBatchesPerSync = a3;
}

- (unint64_t)syncTimeoutInSeconds
{
  return self->_syncTimeoutInSeconds;
}

- (void)setSyncTimeoutInSeconds:(unint64_t)a3
{
  self->_syncTimeoutInSeconds = a3;
}

- (unint64_t)triggeredSyncDelayInSeconds
{
  return self->_triggeredSyncDelayInSeconds;
}

- (void)setTriggeredSyncDelayInSeconds:(unint64_t)a3
{
  self->_triggeredSyncDelayInSeconds = a3;
}

- (unint64_t)policyDownloadIntervalInDays
{
  return self->_policyDownloadIntervalInDays;
}

- (void)setPolicyDownloadIntervalInDays:(unint64_t)a3
{
  self->_policyDownloadIntervalInDays = a3;
}

- (NSArray)streamNamesToAlwaysSync
{
  return self->_streamNamesToAlwaysSync;
}

- (void)setStreamNamesToAlwaysSync:(id)a3
{
  objc_storeStrong((id *)&self->_streamNamesToAlwaysSync, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamNamesToAlwaysSync, 0);
  objc_storeStrong((id *)&self->_streamNamesWithDeletionsTriggeringSync, 0);
  objc_storeStrong((id *)&self->_streamNamesWithAdditionsTriggeringSync, 0);
  objc_storeStrong((id *)&self->_streamNamesToSync, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)_policyForSyncTransportType:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Disabling sync due to invalid policy information", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)_policyForSyncTransportType:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Using local policy override: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)configurationPlistForFilename:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Unable to obtain resource path for %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)configurationPlistForFilename:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Failed to read policy file: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)setOkToDownloadPolicyUpdates:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Enabling policy update downloads", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Disabling %{public}@ sync policy due to invalid MaxBatchesPerSync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Enabling always sync stream", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Got 304 unmodified response to policy download request.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "%{public}@: Policy download returned status 200 but no data. Response: %@", v2, 0x16u);

  OUTLINED_FUNCTION_7();
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10_0(&dword_18DDBE000, v3, v4, "%{public}@: Invalid sync policy config: %{public}@:%lld (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10_0(&dword_18DDBE000, v3, v4, "%{public}@: Failed to download sync policy: %{public}@:%lld (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Syncing disabled", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Skipping triggered sync, over daily maximum", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Ignoring periodic sync limits", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Skipping sync, not yet time", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Skipping sync, over daily maximum", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Skipping sync, device is not charging", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_DEBUG, "No last sync date, using: %@", v1, 0xCu);
}

@end
