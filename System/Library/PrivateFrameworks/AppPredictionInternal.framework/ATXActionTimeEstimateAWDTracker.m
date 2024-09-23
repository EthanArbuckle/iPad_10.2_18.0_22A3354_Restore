@implementation ATXActionTimeEstimateAWDTracker

- (ATXActionTimeEstimateAWDTracker)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXActionTimeEstimateAWDTracker *v6;

  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = -[ATXActionTimeEstimateAWDTracker initWithDuetHelper:intentStream:userActivityStream:](self, "initWithDuetHelper:intentStream:userActivityStream:", v3, v4, v5);

  return v6;
}

- (ATXActionTimeEstimateAWDTracker)initWithDuetHelper:(id)a3 intentStream:(id)a4 userActivityStream:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXActionTimeEstimateAWDTracker *v12;
  ATXActionTimeEstimateAWDTracker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXActionTimeEstimateAWDTracker;
  v12 = -[ATXActionTimeEstimateAWDTracker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_duetHelper, a3);
    objc_storeStrong((id *)&v13->_intentStream, a4);
    objc_storeStrong((id *)&v13->_activityStream, a5);
  }

  return v13;
}

- (void)logActionTimeEstimatesWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[ATXActionTimeEstimateAWDTracker _queryStartTime](self, "_queryStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
  if (objc_msgSend(v6, "compare:", v5) == -1)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithActivity:].cold.1();

    v8 = v5;
    v6 = v8;
  }
  v9 = (void *)objc_opt_new();
  -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithStartDate:endDate:withActivity:](self, "logActionTimeEstimatesWithStartDate:endDate:withActivity:", v6, v9, v4);

}

- (void)logActionTimeEstimatesWithStartDate:(id)a3 endDate:(id)a4 withActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:", v8, v9, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_msgSend(v10, "didDefer") & 1) == 0)
  {
    -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:](self->_intentStream, "getIntentEventsBetweenStartDate:endDate:forSource:", v8, v9, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXUserActivityStream getActivityIntentEventsBetweenStartDate:endDate:](self->_activityStream, "getActivityIntentEventsBetweenStartDate:endDate:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      if (objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
      {
        if (!v10 || (objc_msgSend(v10, "didDefer") & 1) == 0)
        {
          -[ATXActionTimeEstimateAWDTracker getTimeEstimatesFor:forAppLaunches:withActionType:](self, "getTimeEstimatesFor:forAppLaunches:withActionType:", v12, v11, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v14, "mutableCopy");

          -[ATXActionTimeEstimateAWDTracker getTimeEstimatesFor:forAppLaunches:withActionType:](self, "getTimeEstimatesFor:forAppLaunches:withActionType:", v13, v11, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v16);
          -[ATXActionTimeEstimateAWDTracker postTimeEstimates:](self, "postTimeEstimates:", v15);
          -[ATXActionTimeEstimateAWDTracker _writeTimestamp:](self, "_writeTimestamp:", v9);

        }
        goto LABEL_12;
      }
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithStartDate:endDate:withActivity:].cold.2();
    }
    else
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithStartDate:endDate:withActivity:].cold.1();
    }

LABEL_12:
  }

}

- (void)logActionTimeEstimatesWithStartDate:(id)a3 endDate:(id)a4
{
  -[ATXActionTimeEstimateAWDTracker logActionTimeEstimatesWithStartDate:endDate:withActivity:](self, "logActionTimeEstimatesWithStartDate:endDate:withActivity:", a3, a4, 0);
}

- (id)_getActionKeyFor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Unknown");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v3, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parametersByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_effectiveStartDateFor:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_effectiveEndDateFor:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getTimeEstimatesFor:(id)a3 forAppLaunches:(id)a4 withActionType:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
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
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  id v59;
  id v60;
  _QWORD v61[12];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  __CFString *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _QWORD v86[6];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v46 = v6;
  v56 = v7;
  if (objc_msgSend(v6, "count"))
  {
    v54 = (void *)objc_opt_new();
    v50 = (void *)objc_opt_new();
    v53 = (void *)objc_opt_new();
    v52 = (void *)objc_opt_new();
    v51 = (void *)objc_opt_new();
    v57 = (void *)objc_opt_new();
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x3032000000;
    v91[3] = __Block_byref_object_copy__19;
    v91[4] = __Block_byref_object_dispose__19;
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v92 = (id)objc_claimAutoreleasedReturnValue();

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    if (v9)
    {
      v10 = 0;
      v48 = *(_QWORD *)v88;
      do
      {
        v11 = 0;
        v49 = v9;
        do
        {
          if (*(_QWORD *)v88 != v48)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v11);
          context = (void *)MEMORY[0x1CAA48B6C]();
          -[ATXActionTimeEstimateAWDTracker _getActionKeyFor:](self, "_getActionKeyFor:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
            v60 = v14;
          else
            v60 = (id)objc_opt_new();

          objc_msgSend(v53, "objectForKeyedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
            v59 = v16;
          else
            v59 = (id)objc_opt_new();

          objc_msgSend(v52, "objectForKeyedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
            v20 = v18;
          else
            v20 = (id)objc_opt_new();
          v21 = v20;

          objc_msgSend(v51, "objectForKeyedSubscript:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
            v24 = v22;
          else
            v24 = (id)objc_opt_new();
          v25 = v24;

          objc_msgSend(v57, "objectForKeyedSubscript:", v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (v27)
            objc_msgSend(v57, "setObject:forKeyedSubscript:", &unk_1E83CBFF8, v13);
          objc_msgSend(v12, "intent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "parametersByName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "allKeys");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "sortedArrayUsingSelector:", sel_compare_);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v31, "count"))
          {
            objc_msgSend(v50, "objectForKeyedSubscript:", v13);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
              v34 = v32;
            else
              v34 = (id)objc_opt_new();
            v35 = v34;

            objc_msgSend(v31, "componentsJoinedByString:", CFSTR(":"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v36);

            objc_msgSend(v50, "setObject:forKeyedSubscript:", v35, v13);
          }
          objc_msgSend(v56, "subarrayWithRange:", v10, objc_msgSend(v56, "count") - v10);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke;
          v86[3] = &unk_1E82DD5F8;
          v86[4] = self;
          v86[5] = v12;
          v38 = objc_msgSend(v37, "indexOfObjectPassingTest:", v86);
          v80 = 0;
          v81 = &v80;
          v82 = 0x3032000000;
          v83 = __Block_byref_object_copy__19;
          v84 = __Block_byref_object_dispose__19;
          v85 = &unk_1E83CC010;
          v74 = 0;
          v75 = &v74;
          v76 = 0x3032000000;
          v77 = __Block_byref_object_copy__19;
          v78 = __Block_byref_object_dispose__19;
          v79 = &unk_1E83CC010;
          v68 = 0;
          v69 = &v68;
          v70 = 0x3032000000;
          v71 = __Block_byref_object_copy__19;
          v72 = __Block_byref_object_dispose__19;
          v73 = &unk_1E83CC010;
          v62 = 0;
          v63 = &v62;
          v64 = 0x3032000000;
          v65 = __Block_byref_object_copy__19;
          v66 = __Block_byref_object_dispose__19;
          v67 = &stru_1E82FDC98;
          if (v38 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 += v38;
            objc_msgSend(v56, "subarrayWithRange:", v10, objc_msgSend(v56, "count") - v10);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke_35;
            v61[3] = &unk_1E82DD620;
            v61[4] = v12;
            v61[5] = self;
            v61[6] = v91;
            v61[7] = &v74;
            v61[8] = &v80;
            v61[9] = &v68;
            v61[10] = &v62;
            v61[11] = v10;
            objc_msgSend(v39, "enumerateObjectsUsingBlock:", v61);

          }
          if (objc_msgSend((id)v81[5], "isEqualToNumber:", &unk_1E83CC010))
          {
            v40 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v57, "objectForKeyedSubscript:", v13);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "numberWithInt:", objc_msgSend(v41, "intValue") + 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v42, v13);

          }
          else
          {
            objc_msgSend(v60, "addObject:", v81[5]);
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v60, v13);
            objc_msgSend(v59, "addObject:", v69[5]);
            objc_msgSend(v53, "setObject:forKeyedSubscript:", v59, v13);
            objc_msgSend(v21, "addObject:", v75[5]);
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v21, v13);
            objc_msgSend(v25, "addObject:", v63[5]);
            objc_msgSend(v51, "setObject:forKeyedSubscript:", v25, v13);
          }
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&v74, 8);

          _Block_object_dispose(&v80, 8);
          objc_autoreleasePoolPop(context);
          ++v11;
        }
        while (v49 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
      }
      while (v9);
    }

    -[ATXActionTimeEstimateAWDTracker _createTimeEstimateContainers:withSessionLengths:withSessionIndices:withParameterSet:withLaunchReasons:withNoMatchCount:forActionType:](self, "_createTimeEstimateContainers:withSessionLengths:withSessionIndices:withParameterSet:withLaunchReasons:withNoMatchCount:forActionType:", v54, v52, v53, v50, v51, v57, a5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(v91, 8);

  }
  else
  {
    v43 = (void *)objc_opt_new();
  }

  return v43;
}

BOOL __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveEndDateFor:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compare:", v5) != -1;

  return v6;
}

void __85__ATXActionTimeEstimateAWDTracker_getTimeEstimatesFor_forAppLaunches_withActionType___block_invoke_35(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;

  v42 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_effectiveStartDateFor:", v42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (v10 == -1)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v42, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v42, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "compare:", v15) == 1)
      {
        v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      else
      {
        objc_msgSend(v42, "startDate");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;

      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v42, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v20);
      objc_msgSend(v18, "numberWithDouble:");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v17);
      v27 = v26;

      v28 = fmax(v27, 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "doubleValue");
      if (v28 < v29)
        v29 = v28;
      objc_msgSend(v24, "numberWithDouble:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v32 = *(void **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v30;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88) + a3);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      objc_msgSend(v42, "reason");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (__CFString *)v36;
      else
        v38 = &stru_1E82FDC98;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v38);

      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v41 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = v39;

      *a4 = 1;
    }
  }

}

- (id)_createTimeEstimateContainers:(id)a3 withSessionLengths:(id)a4 withSessionIndices:(id)a5 withParameterSet:(id)a6 withLaunchReasons:(id)a7 withNoMatchCount:(id)a8 forActionType:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_opt_new();
  v21 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v14, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v24);

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __169__ATXActionTimeEstimateAWDTracker__createTimeEstimateContainers_withSessionLengths_withSessionIndices_withParameterSet_withLaunchReasons_withNoMatchCount_forActionType___block_invoke;
  v35[3] = &unk_1E82DD648;
  v43 = a9;
  v36 = v14;
  v37 = v15;
  v38 = v16;
  v39 = v18;
  v40 = v19;
  v41 = v17;
  v25 = v20;
  v42 = v25;
  v26 = v17;
  v27 = v19;
  v28 = v18;
  v29 = v16;
  v30 = v15;
  v31 = v14;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v35);
  v32 = v42;
  v33 = v25;

  return v33;
}

void __169__ATXActionTimeEstimateAWDTracker__createTimeEstimateContainers_withSessionLengths_withSessionIndices_withParameterSet_withLaunchReasons_withNoMatchCount_forActionType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AWDProactiveAppPredictionActionTimeEstimateContainer *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(AWDProactiveAppPredictionActionTimeEstimateContainer);
  -[AWDProactiveAppPredictionActionTimeEstimateContainer setActionKey:](v4, "setActionKey:", v3);
  -[AWDProactiveAppPredictionActionTimeEstimateContainer setActionType:](v4, "setActionType:", +[ATXAWDUtils awdActionTypeWithActionType:](ATXAWDUtils, "awdActionTypeWithActionType:", *(_QWORD *)(a1 + 88)));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addTimeEstimate:](v4, "addTimeEstimate:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v9++), "intValue"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v7);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionLength:](v4, "addSessionLength:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v14++), "intValue"));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v12);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionIndex:](v4, "addSessionIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v19++), "intValue"));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v17);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addLaunchReason:](v4, "addLaunchReason:", +[ATXAWDUtils awdAppLaunchReasonWithString:](ATXAWDUtils, "awdAppLaunchReasonWithString:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24++)));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveAppPredictionActionTimeEstimateContainer setNoMatchCount:](v4, "setNoMatchCount:", objc_msgSend(v25, "intValue"));

  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addParameter:](v4, "addParameter:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v30++));
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
  }
  objc_msgSend(*(id *)(a1 + 80), "addObject:", v4);

}

- (void)postTimeEstimates:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "setActions:", v4);
  AWDPostMetric();

}

- (id)_defaultActionTimeEstimateTimestampPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXActionTimeEstimateAWDTrackerTimestamp"));
}

- (id)_queryStartTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  -[ATXActionTimeEstimateAWDTracker _readTimestamp](self, "_readTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (v3 = (void *)objc_opt_new(), v4 = objc_msgSend(v2, "compare:", v3), v3, v4 != 1))
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_readTimestamp
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v18;
  id v19;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[ATXActionTimeEstimateAWDTracker _defaultActionTimeEstimateTimestampPath](self, "_defaultActionTimeEstimateTimestampPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithContentsOfFile:options:error:", v5, 0, &v19);
  v7 = v19;

  objc_autoreleasePoolPop(v3);
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
    v12 = (void *)MEMORY[0x1CAA48B6C]();
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v11, v6, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;

    objc_autoreleasePoolPop(v12);
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("lastQueryEndTime"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[ATXActionTimeEstimateAWDTracker _readTimestamp].cold.2();

      v15 = 0;
    }

LABEL_13:
    v7 = v14;
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "code") != 260)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXActionTimeEstimateAWDTracker _readTimestamp].cold.1();
    v15 = 0;
    v14 = v7;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)_writeTimestamp:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  ATXActionTimeEstimateAWDTracker *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v19 = CFSTR("lastQueryEndTime");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionTimeEstimateAWDTracker.m"), 349, CFSTR("Archiver error: %@"), v9);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("action-time-estimate-timestamp-write", v11);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke;
  block[3] = &unk_1E82DACB0;
  v16 = v8;
  v17 = self;
  v13 = v8;
  dispatch_async(v12, block);

  objc_autoreleasePoolPop(v6);
}

void __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_defaultActionTimeEstimateTimestampPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = objc_msgSend(v1, "writeToFile:options:error:", v2, 1073741825, &v6);
  v4 = v6;

  if ((v3 & 1) == 0)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke_cold_1();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
}

- (void)logActionTimeEstimatesWithActivity:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "Collecting time estimates since the last query date:%@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)logActionTimeEstimatesWithStartDate:endDate:withActivity:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_2(&dword_1C9A3B000, v0, v1, "No app launches between %@ and %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)logActionTimeEstimatesWithStartDate:endDate:withActivity:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_2(&dword_1C9A3B000, v0, v1, "No intents or NSUAs donated between %@ and %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_readTimestamp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Failed to load end timestamp for last query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__ATXActionTimeEstimateAWDTracker__writeTimestamp___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Could not write timestamp: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
