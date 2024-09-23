@implementation ATXClientDuetHelper

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_3, &__block_literal_global_23);
  return (id)sharedInstance__pasExprOnceResult_4;
}

void __37__ATXClientDuetHelper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4;
  sharedInstance__pasExprOnceResult_4 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x1A85A4F90]();
  -[ATXClientDuetHelper getIntentEventsBetweenStartDate:endDate:forSource:](self, "getIntentEventsBetweenStartDate:endDate:forSource:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:](self, "getActivityEventsBetweenStartDate:endDate:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v8);
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v9);
  objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_6);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "first");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(context);
  return v11;
}

uint64_t __63__ATXClientDuetHelper_getIntentEventsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5
{
  return -[ATXClientDuetHelper getIntentEventsBetweenStartDate:endDate:bundleIdFilter:forSource:](self, "getIntentEventsBetweenStartDate:endDate:bundleIdFilter:forSource:", a3, a4, 0, a5);
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 forSource:(int64_t)a6
{
  return -[ATXClientDuetHelper _getIntentEventForSource:startDate:endDate:otherPredicates:bundleIdFilter:limit:](self, "_getIntentEventForSource:startDate:endDate:otherPredicates:bundleIdFilter:limit:", a6, a3, a4, 0, a5, 100);
}

- (id)_getIntentEventForSource:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 bundleIdFilter:(id)a7 limit:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
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
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
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
  uint64_t v51;
  uint64_t v53;
  void *context;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  ATXAction *v63;
  ATXAction *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint8_t v74;
  char v75[7];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  int64_t v86;
  float v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v66 = a7;
  context = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v14;
  v58 = v13;
  v56 = v15;
  -[ATXClientDuetHelper _queryDuetStream:startDate:endDate:otherPredicates:limit:](self, "_queryDuetStream:startDate:endDate:otherPredicates:limit:", v16, v13, v14, v15, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (id)objc_opt_new();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v19)
  {
    v20 = v19;
    v73 = *(_QWORD *)v78;
    v21 = 0x1E0D15000uLL;
    v68 = v18;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v78 != v73)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1A85A4F90]();
        objc_msgSend(v23, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v23, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v21 + 2624), "intentClass");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28 || (objc_msgSend(v28, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
            goto LABEL_41;
          objc_msgSend(v23, "metadata");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v21 + 2624), "serializedInteraction");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
            goto LABEL_40;
          v32 = (void *)MEMORY[0x1A85A4F90]();
          v33 = (void *)MEMORY[0x1E0CB3710];
          v34 = objc_opt_class();
          v76 = 0;
          objc_msgSend(v33, "unarchivedObjectOfClass:fromData:error:", v34, v31, &v76);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v76;
          objc_autoreleasePoolPop(v32);
          if (!v35)
          {
            v40 = v72;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[ATXClientDuetHelper _getIntentEventForSource:startDate:endDate:otherPredicates:bundleIdFilter:limit:].cold.1(&v87, (uint64_t)v72, &v88);
            goto LABEL_39;
          }
          objc_msgSend(v35, "intent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "atx_titleLengthWithoutLocalizing");

          if (!v37)
          {
            v18 = v68;
            v40 = v72;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[ATXClientDuetHelper _getIntentEventForSource:startDate:endDate:otherPredicates:bundleIdFilter:limit:].cold.2(&v74, v75);
            goto LABEL_39;
          }
          objc_msgSend(v35, "intent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_className");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v68;
          if ((objc_msgSend(v39, "isEqualToString:", CFSTR("INIntent")) & 1) != 0)
            goto LABEL_38;
          v67 = v39;
          if ((unint64_t)(a3 - 1) > 1)
          {
            v41 = 0;
          }
          else
          {
            if ((objc_msgSend(v35, "_donatedBySiri") & 1) != 0)
            {
              v69 = 0;
            }
            else
            {
              objc_msgSend(v23, "source");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "bundleID");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v43 = v66;
            if (!objc_msgSend(v35, "_donatedBySiri") || objc_msgSend(v35, "intentHandlingStatus"))
            {
              v41 = v69;
              if (!v69)
                goto LABEL_25;
LABEL_27:
              v71 = v41;
              if (objc_msgSend(v41, "length"))
              {
                if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
                  && objc_msgSend(v71, "hasPrefix:", CFSTR("appshack.")))
                {
                  objc_msgSend(v71, "substringFromIndex:", objc_msgSend(CFSTR("appshack."), "length"));
                  v62 = objc_claimAutoreleasedReturnValue();

                  v71 = (void *)v62;
                  v43 = v66;
                }
                if (!v43 || objc_msgSend(v43, "isEqualToString:", v71))
                {
                  v63 = [ATXAction alloc];
                  objc_msgSend(v35, "intent");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "UUID");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v53) = 0;
                  v64 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v63, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v60, v45, v71, 0, 0, 0, v53, 0, 0);

                  v18 = v68;
                  v61 = (void *)MEMORY[0x1E0D81638];
                  objc_msgSend(v23, "startDate");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "tupleWithFirst:second:", v64, v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "addObject:", v47);

                  v48 = v71;
                  v39 = v67;
                  goto LABEL_37;
                }
LABEL_35:
                v39 = v67;
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                objc_msgSend(v35, "intent");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v82 = v50;
                v83 = 2112;
                v39 = v67;
                v84 = v67;
                v85 = 2048;
                v86 = a3;
                _os_log_error_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No bundleId for intent: %@, intentType: %@, intentSource: %lld", buf, 0x20u);

              }
              v48 = v71;
LABEL_37:

LABEL_38:
              v40 = v72;
LABEL_39:

LABEL_40:
              v21 = 0x1E0D15000;
LABEL_41:

              goto LABEL_42;
            }
            objc_msgSend(v23, "source");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "bundleID");
            v65 = objc_claimAutoreleasedReturnValue();

            v43 = v66;
            v41 = (void *)v65;
            if (v65)
              goto LABEL_27;
LABEL_25:
            objc_msgSend(v23, "metadata");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("source-bundleId"));
            v70 = objc_claimAutoreleasedReturnValue();

            v41 = (void *)v70;
          }
          v43 = v66;
          goto LABEL_27;
        }
LABEL_42:
        objc_autoreleasePoolPop(v24);
        ++v22;
      }
      while (v20 != v22);
      v51 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      v20 = v51;
    }
    while (v51);
  }

  objc_autoreleasePoolPop(context);
  return v59;
}

- (id)getActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  return -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:](self, "getActivityEventsBetweenStartDate:endDate:bundleIdFilter:", a3, a4, 0);
}

- (id)getActivityEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  ATXAction *v48;
  void *v49;
  ATXAction *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v56;
  void *v57;
  void *context;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[4];
  uint64_t v76;
  float v77;
  uint64_t v78;
  float v79;
  uint64_t v80;
  float v81;
  uint64_t v82;
  _BYTE v83[128];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x1A85A4F90]();
  v11 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15998], "isEligibleForPrediction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForObjectsWithMetadataKey:andIntegerValue:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = v10;
  objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v9;
  v60 = v8;
  v57 = (void *)v14;
  -[ATXClientDuetHelper _queryDuetStream:startDate:endDate:otherPredicates:limit:](self, "_queryDuetStream:startDate:endDate:otherPredicates:limit:", v16, v8, v9, v14, 100);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (id)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v72;
    v61 = *MEMORY[0x1E0CEC498];
    v62 = v15;
    v64 = v18;
    do
    {
      v22 = 0;
      v69 = v20;
      do
      {
        if (*(_QWORD *)v72 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1A85A4F90]();
        objc_msgSend(v23, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v23, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v27, "length"))
          {
            if (!v15 || objc_msgSend(v15, "isEqualToString:", v27))
            {
              v28 = v21;
              v29 = v15;
              objc_msgSend(v23, "metadata");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D15998], "userActivityRequiredString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", v32, 0, 0);
                objc_msgSend(v33, "activityType");
                v70 = objc_claimAutoreleasedReturnValue();
                if (v70)
                {
                  v67 = v33;
                  objc_msgSend(v23, "metadata");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D15998], "itemIdentifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "objectForKeyedSubscript:", v35);
                  v36 = objc_claimAutoreleasedReturnValue();

                  v68 = (void *)v36;
                  if (v36)
                  {
                    objc_msgSend(v23, "metadata");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D15998], "itemRelatedContentURL");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "objectForKeyedSubscript:", v38);
                    v66 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v23, "metadata");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D15998], "itemRelatedUniqueIdentifier");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "objectForKeyedSubscript:", v40);
                    v41 = objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v23, "metadata");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D15998], "contentDescription");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "objectForKeyedSubscript:", v43);
                    v44 = objc_claimAutoreleasedReturnValue();

                    v45 = (void *)v44;
                    v65 = (void *)v41;
                    if (v66 || v41)
                    {
                      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithContentType:", v61);
                      objc_msgSend(v46, "setRelatedUniqueIdentifier:", v41);
                      objc_msgSend(v46, "setContentURL:", v66);
                      objc_msgSend(v46, "setContentDescription:", v44);
                    }
                    else
                    {
                      v46 = 0;
                    }
                    v21 = v28;
                    v49 = v45;
                    v50 = [ATXAction alloc];
                    objc_msgSend(v23, "UUID");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v56) = 0;
                    v48 = -[ATXAction initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:](v50, "initWithNSUserActivityString:actionUUID:bundleId:itemIdentifier:contentAttributeSet:heuristic:heuristicMetadata:isFutureMedia:title:subtitle:", v32, v51, v27, v68, v46, 0, 0, v56, 0, 0);

                    v52 = (void *)MEMORY[0x1E0D81638];
                    objc_msgSend(v23, "startDate");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "tupleWithFirst:second:", v48, v53);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "addObject:", v54);

                    v15 = v62;
                  }
                  else
                  {
                    v48 = 0;
                    v15 = v29;
                    v21 = v28;
                  }
                  v20 = v69;
                  v18 = v64;
                  v47 = (void *)v70;
                  if (!-[ATXAction hasActionTitle](v48, "hasActionTitle")
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:].cold.4(&v77, v70, &v78);
                  }

                  v33 = v67;
                }
                else
                {
                  v15 = v29;
                  v21 = v28;
                  v20 = v69;
                  v47 = 0;
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:].cold.3(&v79, (uint64_t)v33, &v80);
                }

              }
              else
              {
                v15 = v29;
                v21 = v28;
                v20 = v69;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:].cold.2(&v81, (uint64_t)v27, &v82);
              }

            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[ATXClientDuetHelper getActivityEventsBetweenStartDate:endDate:bundleIdFilter:].cold.1(v75, v23, &v76);
          }

        }
        objc_autoreleasePoolPop(v24);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v20);
  }

  objc_autoreleasePoolPop(context);
  return v63;
}

- (id)_queryDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__ATXClientDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke;
  v19[3] = &unk_1E4D58E38;
  v17 = v16;
  v20 = v17;
  -[ATXClientDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:block:", v15, v14, v13, v12, a7, v19);

  return v17;
}

void __80__ATXClientDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);
  objc_autoreleasePoolPop(v3);

}

- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 block:(id)a8
{
  id v14;
  void (**v15)(id, void *);
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v14 = a4;
  v37 = a5;
  v36 = a6;
  v15 = (void (**)(id, void *))a8;
  if (a7)
  {
    v16 = pthread_mutex_lock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_block__duetLock);
    if ((uint64_t)a7 >= 1)
    {
      v17 = v14;
      while (1)
      {
        v18 = (void *)MEMORY[0x1A85A4F90](v16);
        if ((uint64_t)a7 >= 200)
          v19 = 200;
        else
          v19 = a7;
        -[ATXClientDuetHelper _queryDuetStreamUnbatched:startDate:endDate:otherPredicates:limit:](self, "_queryDuetStreamUnbatched:startDate:endDate:otherPredicates:limit:", v38, v17, v37, v36, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v15[2](v15, v20);
          a7 -= objc_msgSend(v20, "count");
        }
        if (!objc_msgSend(v20, "count"))
          break;
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        v22 = v21;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v23 = v20;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v40 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v28, "startDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "timeIntervalSinceReferenceDate");
              v31 = v30;

              if (v31 <= v22)
                v31 = v22;
              objc_msgSend(v28, "endDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "timeIntervalSinceReferenceDate");
              v22 = v33;

              if (v22 <= v31)
                v22 = v31;
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v25);
        }

        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v22);
        objc_autoreleasePoolPop(v18);
        v17 = v14;
        if ((uint64_t)a7 <= 0)
          goto LABEL_24;
      }

      objc_autoreleasePoolPop(v18);
      v14 = v17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXClientDuetHelper.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

    pthread_mutex_lock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_block__duetLock);
  }
LABEL_24:
  pthread_mutex_unlock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_block__duetLock);

}

- (id)_queryDuetStreamUnbatched:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  void *v36;
  void *context;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  void *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXClientDuetHelper.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

  }
  v17 = 0;
  if (v14 && v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate > %@ AND startDate < %@) OR (endDate > %@ AND endDate < %@)"), v14, v15, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v16;
  if (objc_msgSend(v16, "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB3528];
    if (v17)
    {
      objc_msgSend(v16, "arrayByAddingObject:", v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
  }
  else
  {
    v19 = v17;
  }
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXClientDuetHelper.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchPredicate"));

  }
  context = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D15A08];
  v39 = v13;
  v48[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v19, v23, 0, a7, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v25, "eventStreams");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v29;
    v43 = 2080;
    v44 = "-[ATXClientDuetHelper _queryDuetStreamUnbatched:startDate:endDate:otherPredicates:limit:]";
    v45 = 2112;
    v46 = v25;
    _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);

  }
  v40 = 0;
  objc_msgSend(v20, "executeQuery:error:", v25, &v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v40;
  if (!v30 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[ATXClientDuetHelper _queryDuetStreamUnbatched:startDate:endDate:otherPredicates:limit:].cold.1((uint64_t)v31, v32, v33);

  objc_autoreleasePoolPop(context);
  return v30;
}

- (void)_getIntentEventForSource:(_QWORD *)a3 startDate:endDate:otherPredicates:bundleIdFilter:limit:.cold.1(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_7(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, MEMORY[0x1E0C81028], v3, "Error unarchiving intent: %@", v4);
}

- (void)_getIntentEventForSource:(uint8_t *)buf startDate:(_BYTE *)a2 endDate:otherPredicates:bundleIdFilter:limit:.cold.2(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Nil or empty title attached to intent event -- filtering out", buf, 2u);
}

- (void)getActivityEventsBetweenStartDate:(uint8_t *)a1 endDate:(void *)a2 bundleIdFilter:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(a2, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v6;
  _os_log_error_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No bundleId found for eventUUID: %@", a1, 0xCu);

}

- (void)getActivityEventsBetweenStartDate:(float *)a1 endDate:(uint64_t)a2 bundleIdFilter:(_QWORD *)a3 .cold.2(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_7(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, MEMORY[0x1E0C81028], v3, "Nil requiredString for bundleId: %@", v4);
}

- (void)getActivityEventsBetweenStartDate:(float *)a1 endDate:(uint64_t)a2 bundleIdFilter:(_QWORD *)a3 .cold.3(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_7(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, MEMORY[0x1E0C81028], v3, "Nil activityType for NSUserActivity: %@", v4);
}

- (void)getActivityEventsBetweenStartDate:(float *)a1 endDate:(uint64_t)a2 bundleIdFilter:(_QWORD *)a3 .cold.4(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_7(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, MEMORY[0x1E0C81028], v3, "Nil or empty title attached to event of activityType: %@ -- filtering out", v4);
}

- (void)_queryDuetStreamUnbatched:(uint64_t)a3 startDate:endDate:otherPredicates:limit:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, MEMORY[0x1E0C81028], a3, "Error querying Duet: %@", (uint8_t *)&v3);
}

@end
