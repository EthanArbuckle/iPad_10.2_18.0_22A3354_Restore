@implementation MOEventBundleProcessor

+ (id)approvedForLearnFromThisApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  +[MOEventBundleProcessor _learningFromAppDenyList](MOEventBundleProcessor, "_learningFromAppDenyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MOEventBundleProcessor _filterAndAnnotateResults:denyList:](MOEventBundleProcessor, "_filterAndAnnotateResults:denyList:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) approvedForLearnFromThisApp:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOEventBundleProcessor _filterAndAnnotateResults:denyList:](MOEventBundleProcessor, "_filterAndAnnotateResults:denyList:", v3, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_learningFromAppDenyList
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.suggestions"));
  objc_msgSend(v2, "objectForKey:", CFSTR("SiriCanLearnFromAppBlacklist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) _learningFromAppDenyList].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (BOOL)_validResource:(id)a3 bundle:(id)a4 denyList:(id)a5 sourceAppBundleIds:(id)a6 removedAppBundleIds:(id)a7 lftaStatusDict:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  NSObject *log;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *context;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v13, "sourceAppBundleIds");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v14, "bundleIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "UUIDString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v43;
      _os_log_impl(&dword_1CAE42000, v20, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, dropping resource no source app tagging, bundleId=%@", buf, 0xCu);

    }
    goto LABEL_17;
  }
  objc_msgSend(v16, "unionSet:", v19);
  v20 = objc_msgSend(v19, "mutableCopy");
  v21 = -[NSObject intersectSet:](v20, "intersectSet:", v15);
  if (!v20 || (v21 = -[NSObject count](v20, "count")) == 0)
  {
    v52 = v17;
    context = (void *)MEMORY[0x1D1798EEC](v21);
    v27 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCalendar:");
    objc_msgSend(v27, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(v13, "getDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v41 = 1;
      goto LABEL_19;
    }
    v46 = v16;
    v48 = v15;
    objc_msgSend(v18, "objectForKeyedSubscript:", v29);
    v31 = v14;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("active_time"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "getDictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerStartDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v37 = v36;

    v14 = v31;
    if (v33 && v37 != 0.0)
    {
      objc_msgSend(v27, "dateFromString:", v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v37);
      v40 = v39;
      if (v38 && objc_msgSend(v39, "compare:", v38) == -1)
      {
        _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v54 = v40;
          v55 = 2112;
          v56 = v38;
          v57 = 2112;
          v58 = v13;
          _os_log_impl(&dword_1CAE42000, log, OS_LOG_TYPE_INFO, "media resource removed due to LFTA switch active time, resource start date, %@, switch active time, %@, resource, %@", buf, 0x20u);
        }

        v41 = 0;
        goto LABEL_14;
      }

    }
    v41 = 1;
LABEL_14:
    v16 = v46;
    v15 = v48;
LABEL_19:

    objc_autoreleasePoolPop(context);
    v17 = v52;
    goto LABEL_20;
  }
  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[NSObject description](v20, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v47 = v15;
    v51 = v14;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v54 = v23;
    v55 = 2112;
    v56 = v26;
    _os_log_impl(&dword_1CAE42000, v22, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, dropping resource due to LFTA being off for %@, bundleId=%@", buf, 0x16u);

    v17 = v25;
    v14 = v51;
    v15 = v47;

  }
  objc_msgSend(v17, "unionSet:", v20);
LABEL_17:
  v41 = 0;
LABEL_20:

  return v41;
}

+ (void)_stripMediaActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v10, "actionType") != 6)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setActions:", v4);
  v11 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "backgroundActions", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        if (objc_msgSend(v17, "actionType") != 6)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "setBackgroundActions:", v4);
  objc_msgSend(v3, "setConcurrentMediaAction:", 0);

}

+ (id)_getBundleIdSet:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v6, "resources");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
              v13 = (void *)MEMORY[0x1D1798EEC]();
              if (objc_msgSend(v12, "type") == 3)
              {
                objc_msgSend(v12, "getDictionary");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v4, "setByAddingObject:", v15);
                v16 = objc_claimAutoreleasedReturnValue();

                v4 = (void *)v16;
              }
              objc_autoreleasePoolPop(v13);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  return v4;
}

+ (id)_filterAndAnnotateResults:(id)a3 denyList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  MOEventBundleProcessorResult *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = (void *)objc_opt_new();
  v40 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  +[MOEventBundleProcessor readLearnedFromTheAppStatusTable](MOEventBundleProcessor, "readLearnedFromTheAppStatusTable");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v34);
  +[MOEventBundleProcessor _getBundleIdSet:](MOEventBundleProcessor, "_getBundleIdSet:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "updateLearnedFromTheAppDictionary:denyList:statusDict:");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v11 = (void *)objc_opt_new();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v10, "resources");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        if (v13)
        {
          v14 = v13;
          v39 = i;
          v15 = 0;
          v16 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v43 != v16)
                objc_enumerationMutation(v12);
              v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              if (objc_msgSend(v18, "type") == 3)
              {
                v19 = !+[MOEventBundleProcessor _validResource:bundle:denyList:sourceAppBundleIds:removedAppBundleIds:lftaStatusDict:](MOEventBundleProcessor, "_validResource:bundle:denyList:sourceAppBundleIds:removedAppBundleIds:lftaStatusDict:", v18, v10, v8, v41, v40, v7);
                v15 |= v19;
                if ((v19 & 1) != 0)
                  continue;
              }
              objc_msgSend(v11, "addObject:", v18);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
          }
          while (v14);

          objc_msgSend(v10, "setResources:", v11);
          i = v39;
          if ((v15 & 1) != 0)
            +[MOEventBundleProcessor _stripMediaActions:](MOEventBundleProcessor, "_stripMediaActions:", v10);
        }
        else
        {

          objc_msgSend(v10, "setResources:", v11);
        }
        objc_msgSend(v10, "resources");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          objc_msgSend(v36, "addObject:", v10);
        }
        else
        {
          _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "bundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUIDString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = (uint64_t)v24;
            _os_log_impl(&dword_1CAE42000, v22, OS_LOG_TYPE_DEFAULT, "approvedForLearnFromThisApp, dropping bundle due to no renderable resource. bundleId=%@", buf, 0xCu);

          }
        }

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v38);
  }

  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(v36, "count");
    objc_msgSend(v41, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v51 = v26;
    v52 = 2112;
    v53 = v27;
    v54 = 2112;
    v55 = v28;
    _os_log_impl(&dword_1CAE42000, v25, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, allowedBundles.count=%lu, sourceAppBundleIds=%@, removedAppBundleIds=%@", buf, 0x20u);

  }
  v29 = [MOEventBundleProcessorResult alloc];
  v30 = (void *)objc_msgSend(v36, "copy");
  v31 = -[MOEventBundleProcessorResult init:sourceAppBundleIds:removedAppBundleIds:](v29, "init:sourceAppBundleIds:removedAppBundleIds:", v30, v41, v40);

  return v31;
}

+ (void)updateLearnedFromTheAppDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[MOEventBundleProcessor _learningFromAppDenyList](MOEventBundleProcessor, "_learningFromAppDenyList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleProcessor readLearnedFromTheAppStatusTable](MOEventBundleProcessor, "readLearnedFromTheAppStatusTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "updateLearnedFromTheAppDictionary:denyList:statusDict:", v3, v6, v5);

}

+ (void)updateLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5
{
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (+[MOEventBundleProcessor constructLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "constructLearnedFromTheAppDictionary:denyList:statusDict:", a3, a4, v7))
  {
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_INFO, "LFTA status changed, need to update the status table, %@", (uint8_t *)&v9, 0xCu);
    }

    +[MOEventBundleProcessor persistLearnedFromTheAppStatusTable:](MOEventBundleProcessor, "persistLearnedFromTheAppStatusTable:", v7);
  }

}

+ (BOOL)constructLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  v8 = a5;
  v49 = (void *)objc_opt_new();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCalendar:", v10);
  v44 = v9;
  objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  v13 = v12 != 0;
  obj = v11;
  v48 = v12;
  if (!v12)
    goto LABEL_33;
  v43 = v10;
  v14 = 0;
  v46 = *(_QWORD *)v55;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v55 != v46)
        objc_enumerationMutation(obj);
      v16 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x1D1798EEC]();
      v18 = objc_msgSend(v47, "containsObject:", v16);
      objc_msgSend(v8, "objectForKeyedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (v19)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", CFSTR("status"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", CFSTR("status"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", MOLearnedFromTheAppStatusOn);

          }
          else
          {
            v24 = 0;
          }

          v14 |= v24;
        }
        else
        {
          v14 = 1;
        }
        v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v31, "setObject:forKey:", MOLearnedFromTheAppStatusOff, CFSTR("status"));
      }
      else
      {
        if (v19)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", CFSTR("status"));
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            objc_msgSend(v8, "objectForKeyedSubscript:", v16);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKey:", CFSTR("status"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", MOLearnedFromTheAppStatusOn);

            if (v30)
            {
              objc_msgSend(v8, "objectForKeyedSubscript:", v16);
              v31 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            }
          }
          else
          {

          }
          v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v31, "setObject:forKey:", MOLearnedFromTheAppStatusOn, CFSTR("status"));
          v32 = (void *)objc_opt_new();
          objc_msgSend(v44, "stringFromDate:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("active_time"));
        }
        else
        {
          v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v31, "setObject:forKey:", MOLearnedFromTheAppStatusOn, CFSTR("status"));
          v32 = (void *)objc_opt_new();
          objc_msgSend(v32, "dateByAddingTimeInterval:", -2419200.0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringFromDate:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v34, CFSTR("active_time"));

        }
        v14 = 1;
      }
LABEL_22:
      objc_msgSend(v49, "setObject:forKey:", v31, v16);

      objc_autoreleasePoolPop(v17);
      ++v15;
    }
    while (v48 != v15);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  }
  while (v48);

  if ((v14 & 1) != 0)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v49, "allKeys");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v51 != v37)
            objc_enumerationMutation(v11);
          v39 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          v40 = (void *)MEMORY[0x1D1798EEC]();
          objc_msgSend(v49, "objectForKeyedSubscript:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v41, v39);

          objc_autoreleasePoolPop(v40);
        }
        v36 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v36);
    }
    v10 = v43;
    v13 = 1;
LABEL_33:

  }
  else
  {
    v13 = 0;
    v10 = v43;
  }

  return v13;
}

+ (id)readLearnedFromTheAppStatusTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[MOPersistenceUtilities userCacheDirectoryPath](MOPersistenceUtilities, "userCacheDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("learnedFromTheApp.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if ((v7 & 1) != 0)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v27 = CFSTR("learnedFromTheApp.plist");
        _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
      }

      v25 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v4, &v25);
      v11 = v25;
      if (v11)
      {
        _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable].cold.3((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

        v24 = 0;
        objc_msgSend(v5, "removeItemAtURL:error:", v4, &v24);
        if (v24)
        {
          _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable].cold.2();

        }
        v20 = objc_alloc_init(MEMORY[0x1E0C99D80]);
      }
      else
      {
        v20 = v10;
      }
      v22 = v20;

    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_INFO, "No plist found at path.", buf, 2u);
      }

      v22 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable].cold.1();

    v22 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }

  return v22;
}

+ (void)persistLearnedFromTheAppStatusTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[8];
  id v19;

  v3 = a3;
  +[MOPersistenceUtilities userCacheDirectoryPath](MOPersistenceUtilities, "userCacheDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("learnedFromTheApp.plist"));
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v19 = 0;
      v7 = objc_msgSend(v3, "writeToURL:error:", v6, &v19);
      v8 = v19;
      _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 || (v7 & 1) == 0)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:].cold.3((uint64_t)v8, v10, v12, v13, v14, v15, v16, v17);
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1CAE42000, v10, OS_LOG_TYPE_INFO, "LFTA status were successfully written to plist.", v18, 2u);
      }

      goto LABEL_15;
    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:].cold.2();

  }
  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:].cold.1();
LABEL_15:

}

+ (id)onboardingDatesBySourceTypeWithStandardSuite:(BOOL)a3
{
  MODefaultsManager *v3;
  MODefaultsManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = -[MODefaultsManager initWithSuiteName:]([MODefaultsManager alloc], "initWithSuiteName:", CFSTR("com.apple.momentsd"));
  else
    v3 = objc_alloc_init(MODefaultsManager);
  v4 = v3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[MOEventBundleSourceTypes all](MOEventBundleSourceTypes, "all", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[MODefaultsManager onboardingDateFor:](v4, "onboardingDateFor:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[MODefaultsManager onboardingDateForJournalingSuggestions](v4, "onboardingDateForJournalingSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("OnboardingDate"));

  return v5;
}

+ (id)trimmedFrom:(id)a3 with:(id)a4 respectOnboardingDate:(BOOL)a5 shouldUseStandardSuite:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  int v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  char v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  __CFString *v119;
  int v120;
  void *v121;
  char v122;
  void *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  char v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  int v139;
  void *v140;
  NSObject *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  int v151;
  NSObject *v152;
  void *v153;
  void *v154;
  NSObject *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t k;
  void *v163;
  void *v164;
  char v165;
  NSObject *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  NSObject *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t m;
  void *v182;
  void *v183;
  char v184;
  NSObject *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t n;
  void *v195;
  void *v196;
  char v197;
  NSObject *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t ii;
  void *v208;
  void *v209;
  int v210;
  uint64_t v211;
  void *v212;
  int v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;
  int v218;
  NSObject *v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t jj;
  char v225;
  NSObject *v226;
  void *v227;
  void *v228;
  void *v229;
  BOOL v230;
  NSObject *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  char v236;
  void *v237;
  int v238;
  NSObject *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t kk;
  uint64_t v249;
  void *v250;
  char v251;
  NSObject *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  BOOL v258;
  void *v259;
  void *v260;
  NSObject *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  uint64_t v266;
  NSObject *v267;
  NSObject *v268;
  void *v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  void *v277;
  uint64_t v278;
  void *v279;
  uint64_t v280;
  void *v281;
  int *v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  _BOOL4 v290;
  id obj;
  uint64_t v292;
  __CFString *v293;
  void *v294;
  void *v295;
  uint64_t v296;
  id v297;
  uint64_t v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  void *v304;
  void *v305;
  char v306;
  NSObject *v307;
  void *v308;
  void *v309;
  void *v310;
  id v311;
  id v312;
  id v313;
  void *v314;
  void *v315;
  void *v316;
  _BOOL4 v317;
  void *v318;
  void *v319;
  void *v320;
  id v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  uint8_t buf[4];
  void *v371;
  __int16 v372;
  _BYTE v373[10];
  uint64_t v374;
  __int16 v375;
  uint64_t v376;
  __int16 v377;
  uint64_t v378;
  __int16 v379;
  uint64_t v380;
  __int16 v381;
  uint64_t v382;
  __int16 v383;
  _BOOL4 v384;
  char v385[4];
  int v386;
  char v387[24];
  _BYTE v388[128];
  _BYTE v389[128];
  _BYTE v390[128];
  _BYTE v391[128];
  _BYTE v392[128];
  _BYTE v393[128];
  _BYTE v394[128];
  _BYTE v395[128];
  _BYTE v396[128];
  _BYTE v397[128];
  _BYTE v398[128];
  _BYTE v399[128];
  uint64_t v400;

  v6 = a6;
  v7 = a5;
  v400 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v371 = v12;
    v372 = 1024;
    *(_DWORD *)v373 = v7;
    *(_WORD *)&v373[4] = 1024;
    *(_DWORD *)&v373[6] = v6;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "trimmedFrom, allowedSourceTypes=%@, respectOnboardingDate=%d, shouldUseStandardSuite=%d", buf, 0x18u);

  }
  v288 = (void *)objc_opt_new();
  +[MOEventBundleSourceTypes all](MOEventBundleSourceTypes, "all");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "minusSet:", v10);
  v297 = v14;
  if (v7)
  {
    +[MOEventBundleProcessor onboardingDatesBySourceTypeWithStandardSuite:](MOEventBundleProcessor, "onboardingDatesBySourceTypeWithStandardSuite:", v6);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v318, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v371 = v16;
      _os_log_impl(&dword_1CAE42000, v15, OS_LOG_TYPE_INFO, "trimmedFrom, onboardingDates=%@", buf, 0xCu);

    }
  }
  else
  {
    v318 = 0;
  }
  v369 = 0u;
  v368 = 0u;
  v367 = 0u;
  v366 = 0u;
  obj = v9;
  v292 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v366, v399, 16);
  if (v292)
  {
    if (v318)
      v17 = v7;
    else
      v17 = 0;
    v290 = v17;
    v296 = *(_QWORD *)v367;
    v283 = &v386;
    v313 = v10;
    v317 = v7;
    do
    {
      v18 = 0;
      v19 = v292;
      do
      {
        if (*(_QWORD *)v367 != v296)
          objc_enumerationMutation(obj);
        v298 = v18;
        v310 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * v18);
        v20 = (void *)objc_msgSend(v310, "copy", v283);
        v21 = objc_alloc(MEMORY[0x1E0C99E60]);
        v314 = v20;
        objc_msgSend(v20, "primarySourceTypes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithArray:", v22);

        _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v310, "bundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v310, "interfaceType");
          objc_msgSend(v23, "description");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v371 = v26;
          v372 = 2048;
          *(_QWORD *)v373 = v27;
          *(_WORD *)&v373[8] = 2112;
          v374 = (uint64_t)v28;
          _os_log_impl(&dword_1CAE42000, v24, OS_LOG_TYPE_DEFAULT, "trimmedFrom, processing candidate bundleID=%@, interfaceType=%lu, primaryTypes=%@", buf, 0x20u);

        }
        v308 = v23;
        if (objc_msgSend(v23, "intersectsSet:", v297))
        {
          _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v314;
          v320 = v29;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v23, "description");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v371 = v31;
            _os_log_impl(&dword_1CAE42000, v29, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, primary event disallowed, primaryTypes=%@", buf, 0xCu);

          }
          v32 = v298;
          goto LABEL_290;
        }
        v30 = v314;
        if (v290)
        {
          v320 = (void *)objc_opt_new();
          v362 = 0u;
          v363 = 0u;
          v364 = 0u;
          v365 = 0u;
          objc_msgSend(v314, "events");
          v321 = (id)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v321, "countByEnumeratingWithState:objects:count:", &v362, v398, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v363;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v363 != v35)
                  objc_enumerationMutation(v321);
                v37 = *(void **)(*((_QWORD *)&v362 + 1) + 8 * i);
                objc_msgSend(v37, "bundleSourceType");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v318, "objectForKeyedSubscript:");
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "startDate");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v309 = (void *)v39;
                v41 = objc_msgSend(v40, "isAfterDate:", v39);

                if (v41)
                {
                  objc_msgSend(v37, "eventIdentifier");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v42)
                  {
                    objc_msgSend(v37, "eventIdentifier");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v320, "addObject:", v43);

                  }
                }
                _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v37, "eventIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "UUIDString");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v371 = v38;
                  v372 = 2112;
                  *(_QWORD *)v373 = v47;
                  *(_WORD *)&v373[8] = 1024;
                  LODWORD(v374) = v41;
                  _os_log_debug_impl(&dword_1CAE42000, v44, OS_LOG_TYPE_DEBUG, "trimmedFrom, event onboarding date check, sourceType=%@, id=%@, valid=%d", buf, 0x1Cu);

                }
                v45 = v38;
                if (objc_msgSend(v308, "containsObject:", v38)
                  && (objc_msgSend(v10, "containsObject:", v38) & v41 & 1) == 0)
                {
                  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                  v64 = objc_claimAutoreleasedReturnValue();
                  v319 = v64;
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v310, "bundleIdentifier");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "UUIDString");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v371 = v66;
                    _os_log_impl(&dword_1CAE42000, v64, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, primary event before onboarding date, bundleID=%@", buf, 0xCu);

                  }
                  v19 = v292;
                  v32 = v298;
                  v30 = v314;
                  goto LABEL_289;
                }

              }
              v34 = objc_msgSend(v321, "countByEnumeratingWithState:objects:count:", &v362, v398, 16);
            }
            while (v34);
          }

          v19 = v292;
          v30 = v314;
        }
        else
        {
          v320 = 0;
        }
        v321 = (id)objc_opt_new();
        _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v30, "action");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v314, "actions");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v371 = v70;
          v372 = 2112;
          *(_QWORD *)v373 = v71;
          _os_log_debug_impl(&dword_1CAE42000, v48, OS_LOG_TYPE_DEBUG, "trimmedFrom, action=%@, actions=%@", buf, 0x16u);

          v30 = v314;
        }

        objc_msgSend(v30, "action");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "bundleSourceType");
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        v295 = v49;
        if (v49)
        {
          if ((objc_msgSend(v10, "containsObject:", v309) & 1) == 0)
          {
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v67 = objc_claimAutoreleasedReturnValue();
            v319 = v67;
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v30, "bundleIdentifier");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "UUIDString");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v371 = v69;
              _os_log_impl(&dword_1CAE42000, v67, OS_LOG_TYPE_INFO, "trimmedFrom, primary action not allowed, dropping bundle, bundleID=%@", buf, 0xCu);

              v30 = v314;
            }
            goto LABEL_57;
          }
          if (v7)
          {
            objc_msgSend(v49, "sourceEventIdentifier");
            v50 = objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              v51 = (void *)v50;
              objc_msgSend(v295, "sourceEventIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v320, "containsObject:", v52);

              v30 = v314;
              if ((v53 & 1) == 0)
              {
                _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                v72 = objc_claimAutoreleasedReturnValue();
                v319 = v72;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v314, "bundleIdentifier");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "UUIDString");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = v295;
                  objc_msgSend(v295, "sourceEventIdentifier");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "UUIDString");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v371 = v74;
                  v372 = 2112;
                  *(_QWORD *)v373 = v76;
                  _os_log_impl(&dword_1CAE42000, v72, OS_LOG_TYPE_INFO, "trimmedFrom, primary action past onboarding date, dropping bundle, bundleID=%@, sourceID=%@", buf, 0x16u);

                  v30 = v314;
                  v32 = v298;
                  goto LABEL_289;
                }
LABEL_57:
                v32 = v298;
                v45 = v295;
                goto LABEL_289;
              }
            }
          }
        }
        objc_msgSend(v30, "concurrentMediaAction");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v54)
          goto LABEL_67;
        v55 = objc_msgSend(v10, "containsObject:", MOEventBundleSourceTypeMedia);
        if (v55)
        {
          if (!v7)
            goto LABEL_63;
          objc_msgSend(v30, "concurrentMediaAction");
          v56 = v30;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "sourceEventIdentifier");
          v58 = objc_claimAutoreleasedReturnValue();
          if (!v58)
          {

LABEL_63:
            v63 = 1;
            goto LABEL_64;
          }
          v59 = (void *)v58;
          objc_msgSend(v56, "concurrentMediaAction");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "sourceEventIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v320, "containsObject:", v61);

          if ((v62 & 1) != 0)
            goto LABEL_63;
          v63 = 0;
          v30 = v314;
        }
        else
        {
          v63 = 1;
        }
        objc_msgSend(v30, "setConcurrentMediaAction:", 0);
LABEL_64:
        _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v314, "bundleIdentifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "UUIDString");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v371 = v79;
          v372 = 1024;
          *(_DWORD *)v373 = v55;
          *(_WORD *)&v373[4] = 1024;
          *(_DWORD *)&v373[6] = v63;
          LOWORD(v374) = 1024;
          *(_DWORD *)((char *)&v374 + 2) = v7;
          _os_log_impl(&dword_1CAE42000, v77, OS_LOG_TYPE_INFO, "trimmedFrom, checking concurrent media action, bundleID=%@, validConcurrentMediaAction=%d, hasValidConcurrentMediaDate=%d, respectOnboardingDate=%d", buf, 0x1Eu);

        }
        v30 = v314;
LABEL_67:
        v319 = (void *)objc_opt_new();
        v358 = 0u;
        v359 = 0u;
        v360 = 0u;
        v361 = 0u;
        objc_msgSend(v30, "actions");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v358, v397, 16);
        if (!v81)
          goto LABEL_83;
        v82 = v81;
        v83 = *(_QWORD *)v359;
        do
        {
          for (j = 0; j != v82; ++j)
          {
            if (*(_QWORD *)v359 != v83)
              objc_enumerationMutation(v80);
            v85 = *(void **)(*((_QWORD *)&v358 + 1) + 8 * j);
            objc_msgSend(v85, "bundleSourceType");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v10, "containsObject:", v86);
            if (v7)
            {
              if (v87)
              {
                objc_msgSend(v85, "sourceEventIdentifier");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = objc_msgSend(v320, "containsObject:", v88);

                if ((v89 & 1) != 0)
                {
LABEL_80:
                  v92 = objc_msgSend(v85, "copy");
                  objc_msgSend(v319, "addObject:", v92);
                  goto LABEL_81;
                }
              }
            }
            else if (v87)
            {
              goto LABEL_80;
            }
            objc_msgSend(v85, "sourceEventIdentifier");
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (v90)
            {
              objc_msgSend(v85, "sourceEventIdentifier");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v321, "addObject:", v91);

            }
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v85, "description");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v371 = v93;
              v372 = 2112;
              *(_QWORD *)v373 = v86;
              _os_log_debug_impl(&dword_1CAE42000, v92, OS_LOG_TYPE_DEBUG, "trimmedFrom, action not allowed, action=%@, sourceType=%@", buf, 0x16u);

            }
LABEL_81:

          }
          v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v358, v397, 16);
        }
        while (v82);
LABEL_83:

        objc_msgSend(v314, "setActions:", v319);
        v294 = (void *)objc_opt_new();
        v354 = 0u;
        v355 = 0u;
        v356 = 0u;
        v357 = 0u;
        objc_msgSend(v314, "backgroundActions");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v354, v396, 16);
        if (!v95)
          goto LABEL_99;
        v96 = v95;
        v97 = *(_QWORD *)v355;
        while (2)
        {
          v98 = 0;
          while (2)
          {
            if (*(_QWORD *)v355 != v97)
              objc_enumerationMutation(v94);
            v99 = *(void **)(*((_QWORD *)&v354 + 1) + 8 * v98);
            objc_msgSend(v99, "bundleSourceType");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v10, "containsObject:", v100);
            if (!v7)
            {
              if (!v101)
                goto LABEL_91;
LABEL_96:
              v106 = objc_msgSend(v99, "copy");
              objc_msgSend(v319, "addObject:", v106);
              goto LABEL_97;
            }
            if (v101)
            {
              objc_msgSend(v99, "sourceEventIdentifier");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = objc_msgSend(v320, "containsObject:", v102);

              if ((v103 & 1) != 0)
                goto LABEL_96;
            }
LABEL_91:
            objc_msgSend(v99, "sourceEventIdentifier");
            v104 = (void *)objc_claimAutoreleasedReturnValue();

            if (v104)
            {
              objc_msgSend(v99, "sourceEventIdentifier");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v321, "addObject:", v105);

            }
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v99, "description");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v371 = v107;
              v372 = 2112;
              *(_QWORD *)v373 = v100;
              _os_log_debug_impl(&dword_1CAE42000, v106, OS_LOG_TYPE_DEBUG, "trimmedFrom, background action not allowed, action=%@, sourceType=%@", buf, 0x16u);

            }
LABEL_97:

            if (v96 != ++v98)
              continue;
            break;
          }
          v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v354, v396, 16);
          if (v96)
            continue;
          break;
        }
LABEL_99:

        v30 = v314;
        objc_msgSend(v314, "setBackgroundActions:", v294);
        objc_msgSend(v314, "place");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v293 = MOEventBundleSourceTypeVisitLocation;
        v289 = v108;
        if (!v108)
          goto LABEL_104;
        if ((objc_msgSend(v10, "containsObject:", v293) & 1) == 0)
        {
          _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
          v155 = objc_claimAutoreleasedReturnValue();
          v315 = v155;
          if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v314, "bundleIdentifier");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "UUIDString");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v371 = v157;
            _os_log_impl(&dword_1CAE42000, v155, OS_LOG_TYPE_INFO, "trimmedFrom, primary place not allowed, dropping bundle, bundleID=%@", buf, 0xCu);
            goto LABEL_152;
          }
LABEL_153:
          v19 = v292;
          v32 = v298;
          v45 = v295;
          goto LABEL_288;
        }
        if (v7)
        {
          objc_msgSend(v108, "sourceEventIdentifier");
          v109 = objc_claimAutoreleasedReturnValue();
          if (v109)
          {
            v110 = (void *)v109;
            objc_msgSend(v108, "sourceEventIdentifier");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v320, "containsObject:", v111);

            v30 = v314;
            if ((v112 & 1) == 0)
            {
              _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
              v231 = objc_claimAutoreleasedReturnValue();
              v315 = v231;
              if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v314, "bundleIdentifier");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v156, "UUIDString");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "sourceEventIdentifier");
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v232, "UUIDString");
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v371 = v157;
                v372 = 2112;
                *(_QWORD *)v373 = v233;
                _os_log_impl(&dword_1CAE42000, v231, OS_LOG_TYPE_INFO, "trimmedFrom, primary place past onboarding date, dropping bundle, bundleID=%@, sourceID=%@", buf, 0x16u);

LABEL_152:
                v30 = v314;

              }
              goto LABEL_153;
            }
          }
        }
LABEL_104:
        v315 = (void *)objc_opt_new();
        v350 = 0u;
        v351 = 0u;
        v352 = 0u;
        v353 = 0u;
        objc_msgSend(v30, "places");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v350, v395, 16);
        if (!v114)
          goto LABEL_120;
        v115 = v114;
        v116 = *(_QWORD *)v351;
        while (2)
        {
          v117 = 0;
          while (2)
          {
            if (*(_QWORD *)v351 != v116)
              objc_enumerationMutation(v113);
            v118 = *(void **)(*((_QWORD *)&v350 + 1) + 8 * v117);
            v119 = MOEventBundleSourceTypeVisitLocation;
            v120 = objc_msgSend(v10, "containsObject:", v119);
            if (!v7)
            {
              if (!v120)
                goto LABEL_112;
LABEL_117:
              v125 = objc_msgSend(v118, "copy");
              objc_msgSend(v315, "addObject:", v125);
              goto LABEL_118;
            }
            if (v120)
            {
              objc_msgSend(v118, "sourceEventIdentifier");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = objc_msgSend(v320, "containsObject:", v121);

              if ((v122 & 1) != 0)
                goto LABEL_117;
            }
LABEL_112:
            objc_msgSend(v118, "sourceEventIdentifier");
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            if (v123)
            {
              objc_msgSend(v118, "sourceEventIdentifier");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v321, "addObject:", v124);

            }
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v118, "description");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v371 = v126;
              v372 = 2112;
              *(_QWORD *)v373 = v119;
              _os_log_debug_impl(&dword_1CAE42000, v125, OS_LOG_TYPE_DEBUG, "trimmedFrom, place not allowed, action=%@, sourceType=%@", buf, 0x16u);

            }
LABEL_118:

            if (v115 != ++v117)
              continue;
            break;
          }
          v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v350, v395, 16);
          if (v115)
            continue;
          break;
        }
LABEL_120:

        v127 = v314;
        objc_msgSend(v314, "setPlaces:", v315);
        v128 = objc_msgSend(v10, "containsObject:", MOEventBundleSourceTypeContact);
        if (!v7)
          goto LABEL_145;
        v306 = v128;
        v316 = (void *)objc_opt_new();
        v346 = 0u;
        v347 = 0u;
        v348 = 0u;
        v349 = 0u;
        objc_msgSend(v314, "persons");
        v311 = (id)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v346, v394, 16);
        if (!v129)
          goto LABEL_142;
        v130 = v129;
        v131 = *(_QWORD *)v347;
        while (2)
        {
          v132 = 0;
          while (2)
          {
            if (*(_QWORD *)v347 != v131)
              objc_enumerationMutation(v311);
            v133 = *(void **)(*((_QWORD *)&v346 + 1) + 8 * v132);
            objc_msgSend(v318, "objectForKeyedSubscript:", MOEventBundleSourceTypePhoto);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "sourceEventIdentifier");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v320, "containsObject:", v135))
            {

              goto LABEL_128;
            }
            if (objc_msgSend(v133, "sourceEventAccessType") != 4)
            {

              goto LABEL_133;
            }
            objc_msgSend(v310, "startDate");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = objc_msgSend(v138, "isAfterDate:", v134);

            if (v139)
            {
LABEL_128:
              v136 = (void *)objc_msgSend(v133, "copy");
              objc_msgSend(v316, "addObject:", v136);
              v137 = 1;
              goto LABEL_135;
            }
LABEL_133:
            objc_msgSend(v133, "sourceEventIdentifier");
            v140 = (void *)objc_claimAutoreleasedReturnValue();

            if (v140)
            {
              objc_msgSend(v133, "sourceEventIdentifier");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v321, "addObject:", v136);
              v137 = 0;
LABEL_135:

            }
            else
            {
              v137 = 0;
            }
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v141 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v310, "bundleIdentifier");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "UUIDString");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "sourceEventIdentifier");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "UUIDString");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v371 = v143;
              v372 = 2112;
              *(_QWORD *)v373 = v145;
              *(_WORD *)&v373[8] = 1024;
              LODWORD(v374) = v137;
              _os_log_debug_impl(&dword_1CAE42000, v141, OS_LOG_TYPE_DEBUG, "trimmedFrom, checking person date, bundleID=%@, personID=%@, validDate=%d", buf, 0x1Cu);

              v10 = v313;
            }

            ++v132;
            v7 = v317;
            if (v130 != v132)
              continue;
            break;
          }
          v146 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v346, v394, 16);
          v130 = v146;
          if (v146)
            continue;
          break;
        }
LABEL_142:

        objc_msgSend(v314, "setPersons:", v316);
        if (objc_msgSend(v308, "containsObject:", MOEventBundleSourceTypeContact))
        {
          objc_msgSend(v314, "persons");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = objc_msgSend(v147, "count");

          if (!v148)
          {
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v226 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v310, "bundleIdentifier");
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v227, "UUIDString");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v371 = v228;
              _os_log_impl(&dword_1CAE42000, v226, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, no allowable persons, bundleID=%@", buf, 0xCu);

            }
            v19 = v292;
            goto LABEL_227;
          }
        }

        v127 = v314;
        v128 = v306;
LABEL_145:
        if ((v128 & 1) == 0)
          objc_msgSend(v127, "setPersons:", 0);
        objc_msgSend(v127, "place");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "sourceEventIdentifier");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = objc_msgSend(v321, "containsObject:", v150);

        if (!v151)
        {
          v316 = (void *)objc_opt_new();
          v342 = 0u;
          v343 = 0u;
          v344 = 0u;
          v345 = 0u;
          objc_msgSend(v127, "places");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v342, v393, 16);
          if (v159)
          {
            v160 = v159;
            v161 = *(_QWORD *)v343;
            do
            {
              for (k = 0; k != v160; ++k)
              {
                if (*(_QWORD *)v343 != v161)
                  objc_enumerationMutation(v158);
                v163 = *(void **)(*((_QWORD *)&v342 + 1) + 8 * k);
                objc_msgSend(v163, "sourceEventIdentifier");
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                v165 = objc_msgSend(v321, "containsObject:", v164);

                if ((v165 & 1) != 0)
                {
                  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                  v166 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v314, "bundleIdentifier");
                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v167, "UUIDString");
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v163, "sourceEventIdentifier");
                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v169, "UUIDString");
                    v170 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v371 = v168;
                    v372 = 2112;
                    *(_QWORD *)v373 = v170;
                    _os_log_impl(&dword_1CAE42000, v166, OS_LOG_TYPE_INFO, "trimmedFrom, dropping place in final consistency pass, bundleID=%@, placeID=%@", buf, 0x16u);

                  }
                }
                else
                {
                  objc_msgSend(v316, "addObject:", v163);
                }
              }
              v160 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v342, v393, 16);
            }
            while (v160);
          }

          objc_msgSend(v314, "setPlaces:", v316);
          objc_msgSend(v314, "action");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "sourceEventIdentifier");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend(v321, "containsObject:", v172);

          if (v173)
          {
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v174 = objc_claimAutoreleasedReturnValue();
            v19 = v292;
            if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v314, "bundleIdentifier");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "UUIDString");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v371 = v176;
              _os_log_impl(&dword_1CAE42000, v174, OS_LOG_TYPE_INFO, "trimmedFrom, primary action on disallow list, dropping bundle, bundleID=%@", buf, 0xCu);

            }
            v10 = v313;
            v32 = v298;
            v45 = v295;
            goto LABEL_286;
          }
          v307 = objc_opt_new();
          v338 = 0u;
          v339 = 0u;
          v340 = 0u;
          v341 = 0u;
          objc_msgSend(v314, "actions");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v338, v392, 16);
          if (v178)
          {
            v179 = v178;
            v180 = *(_QWORD *)v339;
            do
            {
              for (m = 0; m != v179; ++m)
              {
                if (*(_QWORD *)v339 != v180)
                  objc_enumerationMutation(v177);
                v182 = *(void **)(*((_QWORD *)&v338 + 1) + 8 * m);
                objc_msgSend(v182, "sourceEventIdentifier");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                v184 = objc_msgSend(v321, "containsObject:", v183);

                if ((v184 & 1) != 0)
                {
                  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                  v185 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v314, "bundleIdentifier");
                    v186 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v186, "UUIDString");
                    v187 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v182, "sourceEventIdentifier");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v188, "UUIDString");
                    v189 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v371 = v187;
                    v372 = 2112;
                    *(_QWORD *)v373 = v189;
                    _os_log_impl(&dword_1CAE42000, v185, OS_LOG_TYPE_INFO, "trimmedFrom, dropping action in final consistency pass, bundleID=%@, actionID=%@", buf, 0x16u);

                  }
                }
                else
                {
                  -[NSObject addObject:](v307, "addObject:", v182);
                }
              }
              v179 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v338, v392, 16);
            }
            while (v179);
          }

          objc_msgSend(v314, "setActions:", v307);
          v305 = (void *)objc_opt_new();
          v334 = 0u;
          v335 = 0u;
          v336 = 0u;
          v337 = 0u;
          objc_msgSend(v314, "backgroundActions");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          v191 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v334, v391, 16);
          if (v191)
          {
            v192 = v191;
            v193 = *(_QWORD *)v335;
            do
            {
              for (n = 0; n != v192; ++n)
              {
                if (*(_QWORD *)v335 != v193)
                  objc_enumerationMutation(v190);
                v195 = *(void **)(*((_QWORD *)&v334 + 1) + 8 * n);
                objc_msgSend(v195, "sourceEventIdentifier");
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                v197 = objc_msgSend(v321, "containsObject:", v196);

                if ((v197 & 1) != 0)
                {
                  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                  v198 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v314, "bundleIdentifier");
                    v199 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v199, "UUIDString");
                    v200 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v195, "sourceEventIdentifier");
                    v201 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v201, "UUIDString");
                    v202 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v371 = v200;
                    v372 = 2112;
                    *(_QWORD *)v373 = v202;
                    _os_log_impl(&dword_1CAE42000, v198, OS_LOG_TYPE_INFO, "trimmedFrom, dropping background action in final consistency pass, bundleID=%@, actionID=%@", buf, 0x16u);

                  }
                }
                else
                {
                  objc_msgSend(v305, "addObject:", v195);
                }
              }
              v192 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v334, v391, 16);
            }
            while (v192);
          }

          objc_msgSend(v314, "setBackgroundActions:", v305);
          v312 = (id)objc_opt_new();
          v330 = 0u;
          v331 = 0u;
          v332 = 0u;
          v333 = 0u;
          objc_msgSend(v314, "resources");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          v204 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v330, v390, 16);
          v10 = v313;
          if (v204)
          {
            v205 = v204;
            v206 = *(_QWORD *)v331;
            v303 = *(_QWORD *)v331;
            do
            {
              for (ii = 0; ii != v205; ++ii)
              {
                if (*(_QWORD *)v331 != v206)
                  objc_enumerationMutation(v203);
                v208 = *(void **)(*((_QWORD *)&v330 + 1) + 8 * ii);
                objc_msgSend(v208, "bundleSourceType");
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                v210 = objc_msgSend(v10, "containsObject:", v209);
                if (v7)
                {
                  v211 = v205;
                  objc_msgSend(v208, "sourceEventIdentifier");
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  v213 = objc_msgSend(v320, "containsObject:", v212);

                  if (objc_msgSend(v209, "isEqualToString:", MOEventBundleSourceTypePhoto))
                  {
                    v214 = v203;
                    objc_msgSend(v318, "objectForKeyedSubscript:", v209);
                    v215 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v208, "photoLocalDate");
                    v216 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v310, "interfaceType") == 10)
                    {
                      objc_msgSend(v310, "creationDate");
                      v217 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v217 = v216;
                    }
                    v218 = objc_msgSend(v217, "isAfterDate:", v215);

                    v203 = v214;
                    v206 = v303;
                  }
                  else
                  {
                    v218 = objc_msgSend(v209, "isEqualToString:", MOEventBundleSourceTypeReflectionPrompt) | v213;
                  }
                  v205 = v211;
                  v7 = v317;
                }
                else
                {
                  v218 = 1;
                }
                if ((v210 & v218) == 1)
                {
                  v219 = objc_msgSend(v208, "copy");
                  objc_msgSend(v312, "addObject:", v219);
                }
                else
                {
                  _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                  v219 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    v371 = v209;
                    v372 = 1024;
                    *(_DWORD *)v373 = v218;
                    *(_WORD *)&v373[4] = 1024;
                    *(_DWORD *)&v373[6] = v7;
                    _os_log_impl(&dword_1CAE42000, v219, OS_LOG_TYPE_INFO, "trimmedFrom, resource failed conditions, type=%@, hasValidOnboardingDate=%d, respectOnboardingDate=%d", buf, 0x18u);
                  }
                }

                v10 = v313;
              }
              v205 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v330, v390, 16);
            }
            while (v205);
          }

          objc_msgSend(v318, "objectForKeyedSubscript:", CFSTR("OnboardingDate"));
          v45 = v295;
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v304)
            goto LABEL_269;
          v328 = 0u;
          v329 = 0u;
          v326 = 0u;
          v327 = 0u;
          v220 = v312;
          v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v326, v389, 16);
          if (v221)
          {
            v222 = v221;
            v223 = *(_QWORD *)v327;
            while (2)
            {
              for (jj = 0; jj != v222; ++jj)
              {
                if (*(_QWORD *)v327 != v223)
                  objc_enumerationMutation(v220);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v326 + 1) + 8 * jj), "type") == 2)
                {
                  v225 = 1;
                  goto LABEL_230;
                }
              }
              v222 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v326, v389, 16);
              if (v222)
                continue;
              break;
            }
          }
          v225 = 0;
LABEL_230:

          objc_msgSend(v310, "place");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          if (v229)
          {
            v230 = 1;
          }
          else
          {
            objc_msgSend(v310, "places");
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            if (v234)
            {
              objc_msgSend(v310, "places");
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              v230 = objc_msgSend(v235, "count") != 0;

              v45 = v295;
            }
            else
            {
              v230 = 0;
            }

          }
          v236 = v225 | !v230;
          v7 = v317;
          if ((v236 & 1) == 0)
          {
            objc_msgSend(v310, "place");
            v301 = (void *)objc_claimAutoreleasedReturnValue();
            if (v301)
            {
              objc_msgSend(v301, "startDate");
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              v238 = objc_msgSend(v237, "isBeforeDate:", v304);

              if (v238)
              {
                _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                v239 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v239, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v314, "bundleIdentifier");
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v240, "UUIDString");
                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v301, "startDate");
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v242, "description");
                  v243 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v371 = v241;
                  v372 = 2112;
                  *(_QWORD *)v373 = v243;
                  _os_log_impl(&dword_1CAE42000, v239, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping primary place, bundleID=%@, placeStartDate=%@", buf, 0x16u);

                }
                objc_msgSend(v310, "setPlace:", 0);
              }
            }
            v299 = (void *)objc_opt_new();
            v322 = 0u;
            v323 = 0u;
            v324 = 0u;
            v325 = 0u;
            objc_msgSend(v310, "places");
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v322, v388, 16);
            if (v245)
            {
              v246 = v245;
              v247 = *(_QWORD *)v323;
              do
              {
                for (kk = 0; kk != v246; ++kk)
                {
                  if (*(_QWORD *)v323 != v247)
                    objc_enumerationMutation(v244);
                  v249 = *(_QWORD *)(*((_QWORD *)&v322 + 1) + 8 * kk);
                  if (v249
                    && (objc_msgSend(*(id *)(*((_QWORD *)&v322 + 1) + 8 * kk), "startDate"),
                        v250 = (void *)objc_claimAutoreleasedReturnValue(),
                        v251 = objc_msgSend(v250, "isBeforeDate:", v304),
                        v250,
                        (v251 & 1) == 0))
                  {
                    objc_msgSend(v299, "addObject:", v249);
                  }
                  else
                  {
                    _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
                    v252 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v252, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v314, "bundleIdentifier");
                      v253 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v253, "UUIDString");
                      v254 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v301, "startDate");
                      v255 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v255, "description");
                      v256 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v371 = v254;
                      v372 = 2112;
                      *(_QWORD *)v373 = v256;
                      _os_log_impl(&dword_1CAE42000, v252, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping place, bundleID=%@, placeStartDate=%@", buf, 0x16u);

                      v10 = v313;
                    }

                  }
                }
                v246 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v322, v388, 16);
              }
              while (v246);
            }

            objc_msgSend(v310, "setPlaces:", v299);
            v45 = v295;
          }
          objc_msgSend(v310, "place");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          if (v257)
          {
            v258 = 1;
          }
          else
          {
            objc_msgSend(v310, "places");
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            if (v259)
            {
              objc_msgSend(v310, "places");
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              v258 = objc_msgSend(v260, "count") != 0;

              v45 = v295;
            }
            else
            {
              v258 = 0;
            }

          }
          if (objc_msgSend(v308, "containsObject:", MOEventBundleSourceTypeVisitLocation) && !v258)
          {
            _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
            v261 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v261, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v314, "bundleIdentifier");
              v262 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v262, "UUIDString");
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v371 = v263;
              _os_log_impl(&dword_1CAE42000, v261, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping bundle, bundleID=%@", buf, 0xCu);

              v45 = v295;
            }

            v19 = v292;
          }
          else
          {
LABEL_269:
            objc_msgSend(v314, "setResources:", v312);
            objc_msgSend(v314, "buildResources");
            objc_msgSend(v314, "resources");
            v264 = (void *)objc_claimAutoreleasedReturnValue();

            if (v264)
            {
              objc_msgSend(v314, "resources");
              v265 = (void *)objc_claimAutoreleasedReturnValue();
              v266 = objc_msgSend(v265, "count");

              _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
              v267 = objc_claimAutoreleasedReturnValue();
              v268 = v267;
              v19 = v292;
              if (v266)
              {
                if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v314, "bundleIdentifier");
                  v302 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v302, "UUIDString");
                  v269 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v310, "resources");
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  v285 = objc_msgSend(v300, "count");
                  objc_msgSend(v314, "resources");
                  v287 = (void *)objc_claimAutoreleasedReturnValue();
                  v284 = objc_msgSend(v287, "count");
                  objc_msgSend(v310, "places");
                  v286 = (void *)objc_claimAutoreleasedReturnValue();
                  v270 = objc_msgSend(v286, "count");
                  objc_msgSend(v310, "place");
                  v271 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v271)
                    v272 = v270 + 1;
                  else
                    v272 = v270;
                  objc_msgSend(v314, "places");
                  v273 = (void *)objc_claimAutoreleasedReturnValue();
                  v274 = objc_msgSend(v273, "count");
                  objc_msgSend(v314, "place");
                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v275)
                    v276 = v274 + 1;
                  else
                    v276 = v274;
                  objc_msgSend(v310, "persons");
                  v277 = (void *)objc_claimAutoreleasedReturnValue();
                  v278 = objc_msgSend(v277, "count");
                  objc_msgSend(v314, "persons");
                  v279 = (void *)objc_claimAutoreleasedReturnValue();
                  v280 = objc_msgSend(v279, "count");
                  *(_DWORD *)buf = 138414082;
                  v371 = v269;
                  v372 = 2048;
                  *(_QWORD *)v373 = v285;
                  *(_WORD *)&v373[8] = 2048;
                  v374 = v284;
                  v375 = 2048;
                  v376 = v272;
                  v19 = v292;
                  v377 = 2048;
                  v378 = v276;
                  v7 = v317;
                  v379 = 2048;
                  v380 = v278;
                  v381 = 2048;
                  v382 = v280;
                  v383 = 1024;
                  v384 = v317;
                  _os_log_impl(&dword_1CAE42000, v268, OS_LOG_TYPE_DEFAULT, "trimmedFrom, adding bundle, bundleID=%@, sourceResourceCount=%lu, resourceCount=%lu, sourcePlacesCount=%lu, placesCount=%lu, sourcePersonsCount=%lu, personsCount=%lu, respectOnboardingDate=%d", buf, 0x4Eu);

                  v10 = v313;
                  v45 = v295;

                }
                objc_msgSend(v288, "addObject:", v314);
                goto LABEL_285;
              }
              if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR))
                +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:].cold.2((uint64_t)v385, (uint64_t)v314);
            }
            else
            {
              _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
              v268 = objc_claimAutoreleasedReturnValue();
              v19 = v292;
              if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
                +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:].cold.1((uint64_t)v387, (uint64_t)v314);
            }

          }
LABEL_285:
          v174 = v307;

          v32 = v298;
LABEL_286:

          v30 = v314;
          goto LABEL_287;
        }
        _mo_log_facility_get_os_log(MOLogFacilityBundleProcessing);
        v152 = objc_claimAutoreleasedReturnValue();
        v19 = v292;
        v316 = v152;
        if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v314, "bundleIdentifier");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "UUIDString");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v371 = v154;
          _os_log_impl(&dword_1CAE42000, v152, OS_LOG_TYPE_INFO, "trimmedFrom, primary place on disallow list, dropping bundle, bundleID=%@", buf, 0xCu);

          v30 = v314;
          v32 = v298;
          goto LABEL_228;
        }
LABEL_227:
        v32 = v298;
        v30 = v314;
LABEL_228:
        v45 = v295;
LABEL_287:

LABEL_288:
LABEL_289:

LABEL_290:
        v18 = v32 + 1;
      }
      while (v18 != v19);
      v292 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v366, v399, 16);
    }
    while (v292);
  }

  v281 = (void *)objc_msgSend(v288, "copy");
  return v281;
}

+ (void)trimmedFrom:(uint64_t)a1 with:(uint64_t)a2 respectOnboardingDate:shouldUseStandardSuite:.cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_2_3(a1, a2), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_6(&dword_1CAE42000, v6, v7, "trimmedFrom, nil resources, dropping bundle, bundleID=%@");

  OUTLINED_FUNCTION_1_5();
}

+ (void)trimmedFrom:(uint64_t)a1 with:(uint64_t)a2 respectOnboardingDate:shouldUseStandardSuite:.cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_2_3(a1, a2), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_6(&dword_1CAE42000, v6, v7, "trimmedFrom, no resources, dropping bundle, bundleID=%@");

  OUTLINED_FUNCTION_1_5();
}

@end
