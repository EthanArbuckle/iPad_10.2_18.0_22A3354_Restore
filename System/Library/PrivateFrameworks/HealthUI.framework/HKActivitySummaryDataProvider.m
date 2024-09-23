@implementation HKActivitySummaryDataProvider

- (void)_averageActivitySummariesForCachedData:(id)a3 averagePeriod:(int64_t)a4 handler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void (**v72)(id, void *, void *, _QWORD *);
  void *v73;
  void *v74;
  id obj;
  HKActivitySummaryDataProvider *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  double v101;
  double v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  double v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v72 = (void (**)(id, void *, void *, _QWORD *))a5;
  -[HKActivitySummaryDataProvider cachedCalendar](self, "cachedCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider displayTypeController](self, "displayTypeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayTypeWithIdentifier:", &unk_1E9CECE30);
  v10 = objc_claimAutoreleasedReturnValue();

  v77 = self;
  -[HKActivitySummaryDataProvider unitController](self, "unitController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)v10;
  objc_msgSend(v11, "unitForDisplayType:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v7;
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
  if (!v79)
  {
    v80 = 0;
    v15 = 0;
    v84 = 0;
    v85 = 0;
    v16 = 0.0;
    v17 = 0.0;
    v82 = 0;
    v83 = 0;
    v90 = 0.0;
    v91 = 0.0;
    v88 = 0.0;
    v89 = 0.0;
    v87 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    v21 = a4;
    goto LABEL_28;
  }
  v15 = 0;
  v84 = 0;
  v85 = 0;
  v16 = 0.0;
  v78 = *(_QWORD *)v111;
  v17 = 0.0;
  v80 = 0;
  v81 = -1;
  v82 = 0;
  v83 = 0;
  v90 = 0.0;
  v91 = 0.0;
  v88 = 0.0;
  v89 = 0.0;
  v87 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v21 = a4;
  v73 = v13;
  v74 = v14;
  while (2)
  {
    v22 = 0;
    v23 = v15;
    do
    {
      if (*(_QWORD *)v111 != v78)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v22);
      objc_msgSend(v24, "dateComponentsForCalendar:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 == 1)
      {
        v15 = v25;
        v26 = -[HKActivitySummaryDataProvider _weekOfYearForDateComponents:calendar:](v77, "_weekOfYearForDateComponents:calendar:", v25, v8);
        goto LABEL_10;
      }
      if (!v21)
      {
        v15 = v25;
        v26 = objc_msgSend(v25, "month");
LABEL_10:
        v27 = v26;
        goto LABEL_12;
      }
      v15 = v25;
      v27 = 0;
LABEL_12:
      if (v27 != v81)
      {
        objc_msgSend(v8, "dateFromComponents:", v15);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v13;
        v30 = (void *)v28;
        v101 = v20;
        v102 = v19;
        v103 = v82;
        v104 = v18;
        v105 = v85;
        v106 = v16;
        v107 = v84;
        v108 = v17;
        v109 = v83;
        v92 = v91;
        v93 = v90;
        v94 = 0;
        v95 = v89;
        v96 = 0;
        v97 = v88;
        v98 = 0;
        v99 = v87;
        v100 = 0;
        v31 = v21;
        v32 = v80;
        v33 = v8;
        -[HKActivitySummaryDataProvider _buildActivitySummaryFromAverages:pausedAverages:averagePeriod:startDate:calendar:energyUnit:standHourUnit:](v77, "_buildActivitySummaryFromAverages:pausedAverages:averagePeriod:startDate:calendar:energyUnit:standHourUnit:", &v101, &v92, v31, v80, v8, v12, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v80, v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v101) = 0;
          ((void (**)(id, void *, void *, double *))v72)[2](v72, v35, v34, &v101);
          v36 = LOBYTE(v101);

          v32 = v80;
          if (v36)
          {

            v8 = v33;
            v14 = v74;
            v21 = a4;
            v13 = v73;
            goto LABEL_28;
          }
        }

        v84 = 0;
        v85 = 0;
        v16 = 0.0;
        v17 = 0.0;
        v90 = 0.0;
        v91 = 0.0;
        v88 = 0.0;
        v89 = 0.0;
        v87 = 0.0;
        v18 = 0.0;
        v19 = 0.0;
        v80 = v30;
        v81 = v27;
        v20 = 0.0;
        v8 = v33;
        v14 = v74;
        v21 = a4;
        v13 = v73;
      }
      objc_msgSend(v24, "appleMoveTime");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValueForUnit:", v14);
      v86 = v38;

      objc_msgSend(v24, "appleMoveTimeGoal");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValueForUnit:", v14);
      v83 = v40;

      objc_msgSend(v24, "activeEnergyBurned");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValueForUnit:", v12);
      v43 = v42;

      objc_msgSend(v24, "activeEnergyBurnedGoal");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValueForUnit:", v12);
      v82 = v45;

      objc_msgSend(v24, "appleExerciseTime");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "doubleValueForUnit:", v14);
      v48 = v47;

      objc_msgSend(v24, "exerciseTimeGoal");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v24, "exerciseTimeGoal");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "doubleValueForUnit:", v14);
        v85 = v51;

      }
      objc_msgSend(v24, "appleStandHours");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValueForUnit:", v13);
      v54 = v53;

      objc_msgSend(v24, "standHoursGoal");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v24, "standHoursGoal");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "doubleValueForUnit:", v13);
        v84 = v57;

      }
      if (objc_msgSend(v24, "isPaused"))
      {
        objc_msgSend(v24, "appleMoveTime");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "doubleValueForUnit:", v14);
        v87 = v87 + v59;

        objc_msgSend(v24, "activeEnergyBurned");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "doubleValueForUnit:", v12);
        v90 = v90 + v61;

        objc_msgSend(v24, "appleExerciseTime");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "doubleValueForUnit:", v14);
        v89 = v89 + v63;

        objc_msgSend(v24, "appleStandHours");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "doubleValueForUnit:", v13);
        v88 = v88 + v65;

        v66 = 1.0;
        v91 = v91 + 1.0;
      }
      else
      {
        v66 = 1.0;
      }
      v17 = v17 + v86;
      v19 = v19 + v43;
      v18 = v18 + v48;
      v16 = v16 + v54;
      v20 = v20 + v66;
      ++v22;
      v23 = v15;
    }
    while (v79 != v22);
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
    if (v79)
      continue;
    break;
  }
LABEL_28:

  v101 = v20;
  v102 = v19;
  v103 = v82;
  v104 = v18;
  v105 = v85;
  v106 = v16;
  v107 = v84;
  v108 = v17;
  v109 = v83;
  v92 = v91;
  v93 = v90;
  v94 = 0;
  v95 = v89;
  v96 = 0;
  v97 = v88;
  v98 = 0;
  v99 = v87;
  v100 = 0;
  v67 = v80;
  -[HKActivitySummaryDataProvider _buildActivitySummaryFromAverages:pausedAverages:averagePeriod:startDate:calendar:energyUnit:standHourUnit:](v77, "_buildActivitySummaryFromAverages:pausedAverages:averagePeriod:startDate:calendar:energyUnit:standHourUnit:", &v101, &v92, v21, v80, v8, v12, v13);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68 && v15)
  {
    objc_msgSend(v8, "dateFromComponents:", v15);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v80, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v101) = 0;
    ((void (**)(id, void *, void *, double *))v72)[2](v72, v70, v68, &v101);

    v67 = v80;
  }

}

- (int64_t)_weekOfYearForDateComponents:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int64_t v8;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "dateFromComponents:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "component:fromDate:", 0x2000, v7);
    v6 = (id)v7;
  }
  else
  {
    v8 = objc_msgSend(v6, "weekOfYear");
  }

  return v8;
}

void __85__HKActivitySummaryDataProvider__averageActivitySummariesForDateRange_averagePeriod___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v11;

  v11 = a3;
  v5 = a2;
  objc_msgSend(v5, "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32));
  v9 = objc_msgSend(*(id *)(a1 + 40), "compare:", v6);
  if (v8 != -1 && v9 != -1)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

}

- (id)_dayActivitySummariesForDateRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKActivitySummaryDataProvider activitySummariesForTimeScope:](self, "activitySummariesForTimeScope:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HKActivitySummaryDataProvider cachedCalendar](self, "cachedCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "dateComponentsForCalendar:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "dateFromComponents:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "containsValue:exclusiveStart:exclusiveEnd:", v15, 0, 1))
            objc_msgSend(v6, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v5 = v17;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v10 = v6;
  objc_msgSend(v6, "dateComponentsForCalendar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (HKUIObjectIsLarger(*(void **)(a1 + 40), (uint64_t)v9))
  {
    if (HKUIObjectIsLargerOrEqual(v9, *(_QWORD *)(a1 + 48)))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
    if (HKUIObjectIsLargerOrEqual(v9, *(_QWORD *)(a1 + 64)))
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v10);
    if (HKUIObjectIsLargerOrEqual(v9, *(_QWORD *)(a1 + 80)))
      objc_msgSend(*(id *)(a1 + 88), "addObject:", v10);
  }
  else
  {
    *a4 = 1;
  }

}

- (id)activitySummariesForTimeScope:(int64_t)a3
{
  NSCache *activitySummaryForTimeScopeCache;
  void *v5;
  void *v6;
  id v7;

  activitySummaryForTimeScopeCache = self->_activitySummaryForTimeScopeCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](activitySummaryForTimeScopeCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else if (!-[HKActivitySummaryDataProvider activitySummariesAreLoading](self, "activitySummariesAreLoading"))
  {
    -[HKActivitySummaryDataProvider _fetchValueWithRetryCount:](self, "_fetchValueWithRetryCount:", 3);
  }

  return v6;
}

- (BOOL)activitySummariesAreLoading
{
  return self->_outstandingFetchOperation != 0;
}

- (void)_mainQueueFetchValueWithRetryCount:(int64_t)a3
{
  HKFetchOperation *v6;
  HKFetchOperation *outstandingFetchOperation;
  void *v8;
  void *v9;
  _QWORD v10[6];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (a3)
    {
LABEL_3:
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke;
      v10[3] = &unk_1E9C41900;
      v10[4] = self;
      v10[5] = a3;
      -[HKActivitySummaryDataProvider _fetchOperationForTimeScope:withCompletion:](self, "_fetchOperationForTimeScope:withCompletion:", 2, v10);
      v6 = (HKFetchOperation *)objc_claimAutoreleasedReturnValue();
      outstandingFetchOperation = self->_outstandingFetchOperation;
      self->_outstandingFetchOperation = v6;

      -[HKFetchOperation setHighPriority:](self->_outstandingFetchOperation, "setHighPriority:", 1);
      +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addFetchOperation:", self->_outstandingFetchOperation);

      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKActivitySummaryDataProvider.m"), 354, CFSTR("_mainQueueFetchValueWithRetryCount must be run on the main queue"));

    if (a3)
      goto LABEL_3;
  }
  -[HKActivitySummaryDataProvider _transitionToFetchFailureForTimeScope:](self, "_transitionToFetchFailureForTimeScope:", 2);
}

- (void)_fetchValueWithRetryCount:(int64_t)a3
{
  _QWORD v5[6];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[HKActivitySummaryDataProvider _mainQueueFetchValueWithRetryCount:](self, "_mainQueueFetchValueWithRetryCount:", a3);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__HKActivitySummaryDataProvider__fetchValueWithRetryCount___block_invoke;
    v5[3] = &unk_1E9C44410;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_databaseChangesThrottle, 0);
  objc_storeStrong((id *)&self->_hourlyActivitySummaryCache, 0);
  objc_storeStrong((id *)&self->_observerQuery, 0);
  objc_storeStrong((id *)&self->_outstandingFetchOperation, 0);
  objc_storeStrong((id *)&self->_cachedCalendar, 0);
  objc_storeStrong((id *)&self->_activitySummaryForTimeScopeCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  HKActivitySummaryDataProvider *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
      v7 = self;
      v8 = v6;
      v9 = 0;
      goto LABEL_6;
    case 3:
      v7 = self;
      v8 = v6;
      v9 = 1;
LABEL_6:
      -[HKActivitySummaryDataProvider _averageActivitySummariesForDateRange:averagePeriod:](v7, "_averageActivitySummariesForDateRange:averagePeriod:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
    case 5:
      -[HKActivitySummaryDataProvider _dayActivitySummariesForDateRange:](self, "_dayActivitySummariesForDateRange:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 6:
      -[HKActivitySummaryDataProvider _hourActivitySummariesForDateRange:](self, "_hourActivitySummariesForDateRange:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = (void *)v10;
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (id)_averageActivitySummariesForDateRange:(id)a3 averagePeriod:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  -[HKActivitySummaryDataProvider activitySummariesForTimeScope:](self, "activitySummariesForTimeScope:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "minValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maxValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__HKActivitySummaryDataProvider__averageActivitySummariesForDateRange_averagePeriod___block_invoke;
    v17[3] = &unk_1E9C44A68;
    v18 = v8;
    v19 = v9;
    v11 = v10;
    v20 = v11;
    v12 = v9;
    v13 = v8;
    -[HKActivitySummaryDataProvider _averageActivitySummariesForCachedData:averagePeriod:handler:](self, "_averageActivitySummariesForCachedData:averagePeriod:handler:", v7, a4, v17);
    v14 = v20;
    v15 = v11;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addObserver:(id)a3
{
  -[HKSynchronousObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (HKActivitySummaryDataProvider)initWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 activityMoveMode:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKActivitySummaryDataProvider *v17;
  id v18;
  id v19;
  objc_class *v20;
  id v21;
  void *v22;
  uint64_t v23;
  HKSynchronousObserverSet *observers;
  NSCache *v25;
  NSCache *activitySummaryForTimeScopeCache;
  void *v27;
  void *v28;
  NSCache *v29;
  NSCache *hourlyActivitySummaryCache;
  HKThrottleCallback *v31;
  HKThrottleCallback *databaseChangesThrottle;
  id v34;
  id v35;
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)HKActivitySummaryDataProvider;
  v17 = -[HKActivitySummaryDataProvider init](&v36, sel_init);
  if (v17)
  {
    v35 = v15;
    v18 = v13;
    v19 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v34 = v16;
    v21 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "initWithName:loggingCategory:", v22, *MEMORY[0x1E0CB5348]);
    observers = v17->_observers;
    v17->_observers = (HKSynchronousObserverSet *)v23;

    v25 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    activitySummaryForTimeScopeCache = v17->_activitySummaryForTimeScopeCache;
    v17->_activitySummaryForTimeScopeCache = v25;

    objc_storeStrong((id *)&v17->_healthStore, a3);
    objc_storeStrong((id *)&v17->_dateCache, a4);
    objc_storeStrong((id *)&v17->_displayTypeController, a5);
    objc_storeStrong((id *)&v17->_unitController, a6);
    v17->_activityMoveMode = a7;
    -[HKActivitySummaryDataProvider dateCache](v17, "dateCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerObserver:", v17);

    -[HKActivitySummaryDataProvider _setupActivitySummaryChangeObserver](v17, "_setupActivitySummaryChangeObserver");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v17, sel__unitPreferencesDidUpdate_, CFSTR("HKUnitPreferenceControllerUnitPreferencesDidChangeNotification"), 0);

    v13 = v18;
    v14 = v21;
    v16 = v34;
    v15 = v35;
    v29 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    hourlyActivitySummaryCache = v17->_hourlyActivitySummaryCache;
    v17->_hourlyActivitySummaryCache = v29;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v17->_hourlyActivitySummaryCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setMinimumObjectCount:](v17->_hourlyActivitySummaryCache, "setMinimumObjectCount:", 10);
    v31 = -[HKThrottleCallback initWithThrottleDelay:]([HKThrottleCallback alloc], "initWithThrottleDelay:", 1.0);
    databaseChangesThrottle = v17->_databaseChangesThrottle;
    v17->_databaseChangesThrottle = v31;

  }
  return v17;
}

- (void)removeObserver:(id)a3
{
  -[HKSynchronousObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

uint64_t __63__HKActivitySummaryDataProvider__alertObserversDidUpdateValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activitySummaryDataProviderDidUpdateActivitySummaries:", *(_QWORD *)(a1 + 32));
}

void __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

uint64_t __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 40), &unk_1E9CECDB8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 40), &unk_1E9CECDD0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 48), &unk_1E9CECDE8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 56), &unk_1E9CECE00);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 64), &unk_1E9CECE18);
  return objc_msgSend(*(id *)(a1 + 32), "_alertObserversDidUpdateValues");
}

void __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_cold_1((_QWORD *)(a1 + 32), (uint64_t)v7, v9);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_226;
    v12[3] = &unk_1E9C44410;
    v10 = *(_QWORD *)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v12[5] = v10;
    v11 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_partitionAndProcessActivitySummariesForAllTimeScopes:", v6);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKActivitySummaryDataProvider _stopActivitySummaryChangeObserver](self, "_stopActivitySummaryChangeObserver");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKActivitySummaryDataProvider;
  -[HKActivitySummaryDataProvider dealloc](&v4, sel_dealloc);
}

- (void)_partitionAndProcessActivitySummariesForAllTimeScopes:(id)a3
{
  void *v4;
  void *v5;
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
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v33 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider dateCache](self, "dateCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKCalendarDateTransformNone();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKGenerateDateRangeForCharts(v5, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider dateCache](self, "dateCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKCalendarDateTransformNone();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKGenerateDateRangeForCharts(v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "minValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider dateCache](self, "dateCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKCalendarDateTransformNone();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKGenerateDateRangeForCharts(v14, 6, v15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "minValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider cachedCalendar](self, "cachedCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke;
  v40[3] = &unk_1E9C44960;
  v41 = v17;
  v42 = v9;
  v43 = v16;
  v19 = v4;
  v44 = v19;
  v45 = v13;
  v20 = v29;
  v46 = v20;
  v47 = v8;
  v21 = v31;
  v48 = v21;
  v32 = v8;
  v30 = v13;
  v22 = v16;
  v23 = v9;
  v24 = v17;
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v40);
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke_2;
  block[3] = &unk_1E9C43688;
  block[4] = self;
  v36 = v33;
  v37 = v21;
  v38 = v20;
  v39 = v19;
  v25 = v19;
  v26 = v20;
  v27 = v21;
  v28 = v33;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (id)_fetchOperationForTimeScope:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  HKHealthQueryFetchOperation *v8;
  HKHealthQueryFetchOperation *v9;
  void *v10;
  void *v11;
  HKHealthQueryFetchOperation *v12;
  _QWORD v14[4];
  HKHealthQueryFetchOperation *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HKActivitySummaryDataProvider healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKHealthQueryFetchOperation initWithHealthStore:operationDescription:completion:]([HKHealthQueryFetchOperation alloc], "initWithHealthStore:operationDescription:completion:", v7, CFSTR("ActivitySummaryQuery"), v6);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HKActivitySummaryDataProvider__fetchOperationForTimeScope_withCompletion___block_invoke;
  v14[3] = &unk_1E9C44988;
  v9 = v8;
  v15 = v9;
  -[HKActivitySummaryDataProvider _queriesForTimeScope:withCompletion:](self, "_queriesForTimeScope:withCompletion:", a3, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryFetchOperation setQueries:](v9, "setQueries:", v11);

  v12 = v9;
  return v12;
}

- (id)_queriesForTimeScope:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  -[HKActivitySummaryDataProvider cachedCalendar](self, "cachedCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 4, -5, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKGraphZoomLevelConfiguration chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:](HKGraphZoomLevelConfiguration, "chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:", a3, v10, objc_msgSend(v7, "firstWeekday"), v7, 0, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider _predicateForStartDate:endDate:calendar:activityMoveMode:](self, "_predicateForStartDate:endDate:calendar:activityMoveMode:", v12, v13, v7, self->_activityMoveMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB6280]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__HKActivitySummaryDataProvider__queriesForTimeScope_withCompletion___block_invoke;
  v19[3] = &unk_1E9C449B0;
  v20 = v6;
  v16 = v6;
  v17 = (void *)objc_msgSend(v15, "initWithPredicate:resultsHandler:", v14, v19);

  return v17;
}

- (void)_setupActivitySummaryChangeObserver
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
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  -[HKActivitySummaryDataProvider _stopActivitySummaryChangeObserver](self, "_stopActivitySummaryChangeObserver");
  -[HKActivitySummaryDataProvider healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider dateCache](self, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKCalendarDateTransformNone();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKGenerateDateRangeForCharts(v4, 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider cachedCalendar](self, "cachedCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryDataProvider _predicateForStartDate:endDate:calendar:activityMoveMode:](self, "_predicateForStartDate:endDate:calendar:activityMoveMode:", v7, v8, v9, self->_activityMoveMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6280]), "initWithPredicate:resultsHandler:", v10, &__block_literal_global_68);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_2;
  v15 = &unk_1E9C44A18;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "setUpdateHandler:", &v12);
  objc_storeStrong((id *)&self->_observerQuery, v11);
  objc_msgSend(v3, "executeQuery:", self->_observerQuery, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (id)cachedCalendar
{
  NSCalendar *cachedCalendar;
  NSCalendar *v4;
  NSCalendar *v5;

  cachedCalendar = self->_cachedCalendar;
  if (!cachedCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedCalendar;
    self->_cachedCalendar = v4;

    cachedCalendar = self->_cachedCalendar;
  }
  return cachedCalendar;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (id)_predicateForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 activityMoveMode:(int64_t)a6
{
  id v9;
  id v10;
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
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v9, "hk_activitySummaryDateComponentsFromDate:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_activitySummaryDateComponentsFromDate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForActivitySummariesWithActivityMoveMode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v26[0] = v13;
    v26[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForActivitySummariesWithActivityMoveMode:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForActivitySummariesWithActivityMoveMode:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    v25[0] = v14;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3528];
    v24[0] = v20;
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (void)_stopActivitySummaryChangeObserver
{
  void *v3;
  HKQuery *observerQuery;

  if (self->_observerQuery)
  {
    -[HKActivitySummaryDataProvider healthStore](self, "healthStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopQuery:", self->_observerQuery);

    observerQuery = self->_observerQuery;
    self->_observerQuery = 0;

  }
}

- (void)_alertObserversDidUpdateValues
{
  HKSynchronousObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__HKActivitySummaryDataProvider__alertObserversDidUpdateValues__block_invoke;
  v3[3] = &unk_1E9C44A40;
  v3[4] = self;
  -[HKSynchronousObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __76__HKActivitySummaryDataProvider__fetchOperationForTimeScope_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResults:error:", a2, a3);
}

uint64_t __69__HKActivitySummaryDataProvider__queriesForTimeScope_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKActivitySummaryDataProvider)initWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKActivitySummaryDataProvider *v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  HKSynchronousObserverSet *observers;
  NSCache *v24;
  NSCache *activitySummaryForTimeScopeCache;
  void *v26;
  void *v27;
  NSCache *v28;
  NSCache *hourlyActivitySummaryCache;
  HKThrottleCallback *v30;
  HKThrottleCallback *databaseChangesThrottle;
  id v33;
  objc_super v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)HKActivitySummaryDataProvider;
  v15 = -[HKActivitySummaryDataProvider init](&v34, sel_init);
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v33 = v14;
    v18 = v13;
    v19 = v12;
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "initWithName:loggingCategory:", v21, *MEMORY[0x1E0CB5348]);
    observers = v15->_observers;
    v15->_observers = (HKSynchronousObserverSet *)v22;

    v24 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    activitySummaryForTimeScopeCache = v15->_activitySummaryForTimeScopeCache;
    v15->_activitySummaryForTimeScopeCache = v24;

    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v15->_dateCache, a4);
    objc_storeStrong((id *)&v15->_displayTypeController, a5);
    objc_storeStrong((id *)&v15->_unitController, a6);
    -[HKActivitySummaryDataProvider dateCache](v15, "dateCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerObserver:", v15);

    -[HKActivitySummaryDataProvider _setupActivitySummaryChangeObserver](v15, "_setupActivitySummaryChangeObserver");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v15, sel__unitPreferencesDidUpdate_, CFSTR("HKUnitPreferenceControllerUnitPreferencesDidChangeNotification"), 0);

    v11 = v20;
    v12 = v19;
    v13 = v18;
    v14 = v33;
    v28 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    hourlyActivitySummaryCache = v15->_hourlyActivitySummaryCache;
    v15->_hourlyActivitySummaryCache = v28;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v15->_hourlyActivitySummaryCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setMinimumObjectCount:](v15->_hourlyActivitySummaryCache, "setMinimumObjectCount:", 10);
    v30 = -[HKThrottleCallback initWithThrottleDelay:]([HKThrottleCallback alloc], "initWithThrottleDelay:", 1.0);
    databaseChangesThrottle = v15->_databaseChangesThrottle;
    v15->_databaseChangesThrottle = v30;

  }
  return v15;
}

- (HKActivitySummary)latestActivitySummary
{
  void *v2;
  void *v3;

  -[HKActivitySummaryDataProvider activitySummariesForTimeScope:](self, "activitySummariesForTimeScope:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKActivitySummary *)v3;
}

uint64_t __59__HKActivitySummaryDataProvider__fetchValueWithRetryCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueueFetchValueWithRetryCount:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_226(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchValueWithRetryCount:", *(_QWORD *)(a1 + 40) - 1);
}

- (void)_transitionToFetchFailureForTimeScope:(int64_t)a3
{
  NSObject *v4;
  HKFetchOperation *outstandingFetchOperation;
  int v6;
  HKActivitySummaryDataProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Reached max retry count for Activity Summary. Aborting", (uint8_t *)&v6, 0xCu);
  }
  outstandingFetchOperation = self->_outstandingFetchOperation;
  self->_outstandingFetchOperation = 0;

}

void __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 7);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_3;
    v4[3] = &unk_1E9C3F0D0;
    v4[4] = v2;
    objc_msgSend(v3, "executeWithThrottle:", v4);
  }

}

void __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_4;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearCaches");
  return objc_msgSend(*(id *)(a1 + 32), "_alertObserversDidUpdateValues");
}

- (void)_clearCaches
{
  -[NSCache removeAllObjects](self->_activitySummaryForTimeScopeCache, "removeAllObjects");
  -[NSCache removeAllObjects](self->_hourlyActivitySummaryCache, "removeAllObjects");
}

- (void)_unitPreferencesDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HKActivitySummaryDataProvider *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HKActivitySummaryDataProvider__unitPreferencesDidUpdate___block_invoke;
  v6[3] = &unk_1E9C3FC50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __59__HKActivitySummaryDataProvider__unitPreferencesDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HKUnitPreferenceControllerUnitPreferenceChangedKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "_clearCaches");
    objc_msgSend(*(id *)(a1 + 40), "_alertObserversDidUpdateValues");
  }

}

- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4
{
  NSCalendar *cachedCalendar;

  -[HKActivitySummaryDataProvider _clearCaches](self, "_clearCaches", a3, a4);
  cachedCalendar = self->_cachedCalendar;
  self->_cachedCalendar = 0;

  -[HKActivitySummaryDataProvider _setupActivitySummaryChangeObserver](self, "_setupActivitySummaryChangeObserver");
  -[HKActivitySummaryDataProvider _alertObserversDidUpdateValues](self, "_alertObserversDidUpdateValues");
}

- (id)_buildActivitySummaryFromAverages:(_WDActivitySummaryAverages *)a3 pausedAverages:(_WDActivitySummaryAverages *)a4 averagePeriod:(int64_t)a5 startDate:(id)a6 calendar:(id)a7 energyUnit:(id)a8 standHourUnit:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double var0;
  double v27;
  _BOOL8 v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  void *v49;

  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = 0;
  if (v16 && a3->var0 > 0.0)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB6278]);
    v48 = v17;
    if (a5 == 1)
    {
      objc_msgSend(v16, "hk_dateBeforeDateForCalendar:rangeUnit:", v17, 0x2000);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "components:fromDate:", 30, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v22 = v24;
      objc_msgSend(v24, "setCalendar:", v25);

    }
    else if (a5)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(v17, "components:fromDate:", 14, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCalendar:", v17);
      v22 = v21;
      objc_msgSend(v21, "setDay:", 1);
    }
    var0 = a3->var0;
    v27 = a4->var0;
    v28 = a3->var0 == a4->var0;
    if (a4->var0 == 0.0 || var0 == v27)
    {
      objc_msgSend(v20, "_setGregorianDateComponents:", v22, var0, v48);
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, a3->var7 / a3->var0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleMoveTime:", v39);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, a3->var8);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleMoveTimeGoal:", v40);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, a3->var1 / a3->var0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActiveEnergyBurned:", v41);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, a3->var2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActiveEnergyBurnedGoal:", v42);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, a3->var3 / a3->var0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleExerciseTime:", v43);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, a3->var4);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setExerciseTimeGoal:", v44);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v19, a3->var5 / a3->var0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = var0 - v27;
      v30 = v22;
      if (var0 - v27 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKActivitySummaryDataProvider.m"), 692, CFSTR("_buildActivitySummaryFromAverages: Detected zero unpaused days"));

        v30 = v22;
      }
      v22 = v30;
      objc_msgSend(v20, "_setGregorianDateComponents:", v30, v48);
      objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, (a3->var7 - a4->var7) / v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleMoveTime:", v32);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, a3->var8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleMoveTimeGoal:", v33);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, (a3->var1 - a4->var1) / v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActiveEnergyBurned:", v34);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v18, a3->var2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActiveEnergyBurnedGoal:", v35);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, (a3->var3 - a4->var3) / v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleExerciseTime:", v36);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v31, a3->var4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setExerciseTimeGoal:", v37);

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v19, (a3->var5 - a4->var5) / v29);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
    }
    objc_msgSend(v20, "setAppleStandHours:", v38);

    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v19, a3->var6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStandHoursGoal:", v45);

    objc_msgSend(v20, "setActivityMoveMode:", self->_activityMoveMode);
    objc_msgSend(v20, "setPaused:", v28);

    v17 = v49;
  }

  return v20;
}

- (id)_hourActivitySummariesForDateRange:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HKActivitySummaryDataProvider__hourActivitySummariesForDateRange___block_invoke;
  v8[3] = &unk_1E9C44A90;
  v8[4] = self;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[HKActivitySummaryDataProvider _hourActivitySummariesForDateRange:pageHandler:](self, "_hourActivitySummariesForDateRange:pageHandler:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __68__HKActivitySummaryDataProvider__hourActivitySummariesForDateRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, _BYTE *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_submitHourlyQueryForPageNumber:startDate:endDate:", v14, v12, v13);
    goto LABEL_14;
  }
  objc_msgSend(v11, "activitySummaryItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_14:
    *a6 = 1;
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = 0;

    goto LABEL_15;
  }
  v27 = v14;
  v28 = v13;
  v29 = v12;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v11, "activitySummaryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v20);
        objc_msgSend(*(id *)(a1 + 32), "cachedCalendar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dateComponentsForCalendar:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateFromComponents:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsValue:exclusiveStart:exclusiveEnd:", v24, 0, 1))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  v13 = v28;
  v12 = v29;
  v14 = v27;
LABEL_15:

}

- (void)_submitHourlyQueryForPageNumber:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSCache objectForKey:](self->_hourlyActivitySummaryCache, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[HKActivitySummaryDataProvider healthStore](self, "healthStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummaryDataProvider cachedCalendar](self, "cachedCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummaryDataProvider _hourlyPageInProgress:](self, "_hourlyPageInProgress:", v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke;
    v14[3] = &unk_1E9C44AE0;
    v14[4] = self;
    v15 = v8;
    -[HKActivitySummaryDataProvider _hourlyActivityDataForStartDate:endDate:healthStore:calendar:handler:](self, "_hourlyActivityDataForStartDate:endDate:healthStore:calendar:handler:", v9, v10, v12, v13, v14);

  }
}

void __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke_2;
  v10[3] = &unk_1E9C44AB8;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hourlyActivityPageDataArrived:pageNumber:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_hourlyPageInProgress:(id)a3
{
  id v4;
  WDHourlyActivitySummaryPage *v5;

  v4 = a3;
  v5 = objc_alloc_init(WDHourlyActivitySummaryPage);
  -[WDHourlyActivitySummaryPage setActivitySummaryItems:](v5, "setActivitySummaryItems:", 0);
  -[NSCache setObject:forKey:](self->_hourlyActivitySummaryCache, "setObject:forKey:", v5, v4);

}

- (void)_hourlyActivityPageDataArrived:(id)a3 pageNumber:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  WDHourlyActivitySummaryPage *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v8)
  {
    v11 = objc_alloc_init(WDHourlyActivitySummaryPage);
    -[WDHourlyActivitySummaryPage setActivitySummaryItems:](v11, "setActivitySummaryItems:", v8);
    -[NSCache setObject:forKey:](self->_hourlyActivitySummaryCache, "setObject:forKey:", v11, v10);

  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKActivitySummaryDataProvider _hourlyActivityPageDataArrived:pageNumber:error:].cold.1((uint64_t)self, (uint64_t)v9, v12);
    -[NSCache removeObjectForKey:](self->_hourlyActivitySummaryCache, "removeObjectForKey:", v10);

  }
  -[HKActivitySummaryDataProvider _alertObserversDidUpdateValues](self, "_alertObserversDidUpdateValues");

}

- (void)_hourActivitySummariesForDateRange:(id)a3 pageHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *, void *, void *, _BYTE *);
  void *v7;
  void *v8;
  double v9;
  int64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  unsigned __int8 v28;

  v5 = a3;
  v6 = (void (**)(id, void *, void *, void *, void *, _BYTE *))a4;
  objc_msgSend(v5, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  objc_msgSend(v5, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v7;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v10 = vcvtmd_s64_f64(v9);
  v23 = v8;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v12 = v10 / 432000;
  v27 = (uint64_t)vcvtmd_s64_f64(v11) / 432000;
  v13 = 432000 * (v10 / 432000);
  do
  {
    if (v12 > v27)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ++v12;
    v13 += 432000;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphZoomLevelConfiguration defaultCalendar](HKGraphZoomLevelConfiguration, "defaultCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_dateBeforeDateForCalendar:rangeUnit:", v17, 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKGraphZoomLevelConfiguration defaultCalendar](HKGraphZoomLevelConfiguration, "defaultCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_dateBeforeDateForCalendar:rangeUnit:", v19, 32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache objectForKey:](self->_hourlyActivitySummaryCache, "objectForKey:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v6[2](v6, v21, v18, v20, v14, &v28);
    v22 = v28;

  }
  while (!v22);

}

- (id)_buildHourlyActivitySummaryFromDate:(id)a3 calendar:(id)a4 moveQuantity:(id)a5 exerciseQuantity:(id)a6 standQuantity:(id)a7 moveGoal:(id)a8 exerciseGoal:(id)a9 standGoal:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKHourlyActivitySummary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HKActivitySummaryDataProvider *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HKActivitySummaryDataProvider *v35;
  id v36;

  v35 = self;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v36 = a10;
  v20 = a4;
  v21 = a3;
  v22 = objc_alloc_init(HKHourlyActivitySummary);
  objc_msgSend(v20, "components:fromDate:", 62, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v19;
  v25 = v16;
  objc_msgSend(v23, "setCalendar:", v20);

  -[HKHourlyActivitySummary setHourlyDateComponents:](v22, "setHourlyDateComponents:", v23);
  if (v16)
  {
    -[HKHourlyActivitySummary setAppleExerciseTime:](v22, "setAppleExerciseTime:", v16);
    if (v24)
      -[HKHourlyActivitySummary setExerciseTimeGoal:](v22, "setExerciseTimeGoal:", v24);
  }
  v26 = v15;
  v28 = v35;
  v27 = v36;
  if (!v26)
  {
LABEL_7:
    if (!v18)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v35->_activityMoveMode == 2)
  {
    -[HKHourlyActivitySummary setAppleMoveTime:](v22, "setAppleMoveTime:", v26);
    goto LABEL_7;
  }
  -[HKHourlyActivitySummary setActiveEnergyBurned:](v22, "setActiveEnergyBurned:", v26);
  if (!v18)
    goto LABEL_12;
LABEL_10:
  if (v35->_activityMoveMode != 2)
  {
    -[HKHourlyActivitySummary setActiveEnergyBurnedGoal:](v22, "setActiveEnergyBurnedGoal:", v18);
    if (!v17)
      goto LABEL_18;
    goto LABEL_15;
  }
  -[HKHourlyActivitySummary setAppleMoveTimeGoal:](v22, "setAppleMoveTimeGoal:", v18);
LABEL_12:
  if (!v17)
    goto LABEL_18;
LABEL_15:
  -[HKHourlyActivitySummary setAppleStandHours:](v22, "setAppleStandHours:", v17, v35);
  if (v36)
  {
    -[HKHourlyActivitySummary setStandHoursGoal:](v22, "setStandHoursGoal:", v36);
  }
  else
  {
    v29 = v25;
    v30 = v24;
    v31 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32, 1.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHourlyActivitySummary setStandHoursGoal:](v22, "setStandHoursGoal:", v33);

    v24 = v30;
    v25 = v29;
    v27 = 0;

  }
LABEL_18:
  -[HKHourlyActivitySummary setActivityMoveMode:](v22, "setActivityMoveMode:", v28->_activityMoveMode, v35);

  return v22;
}

- (BOOL)_sampleDate:(id)a3 withinHourBeforeDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v9 = v8;

  return v7 - v9 < (double)(unint64_t)*MEMORY[0x1E0CB4790] && v7 - v9 >= 0.0;
}

- (id)_hourlySummariesFromStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 activeEnergyData:(id)a6 appleMoveTimeData:(id)a7 exerciseData:(id)a8 standData:(id)a9 dayGoalData:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v73;
  unint64_t v74;
  unint64_t v75;

  v15 = a3;
  v69 = a4;
  v16 = a5;
  v60 = a6;
  v59 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v68 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v68, "setHour:", 1);
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v16;
  v58 = v20;
  if ((unint64_t)objc_msgSend(v19, "count") < 2)
  {
    v73 = 0;
  }
  else
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateComponentsForCalendar:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v58;
    objc_msgSend(v16, "dateFromComponents:", v22);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v23 = v60;
  if (self->_activityMoveMode == 2)
    v23 = v59;
  v67 = v23;
  if (objc_msgSend(v20, "hk_isBeforeOrEqualToDate:", v69))
  {
    v24 = 0;
    v75 = 0;
    v25 = 0;
    v26 = 0;
    v27 = v20;
    v65 = v18;
    v66 = v17;
    v70 = v19;
    while (1)
    {
      v28 = v27;
      if (v24 >= objc_msgSend(v67, "count"))
      {
        v74 = v24;
        v35 = 0;
      }
      else
      {
        v63 = v26;
        v29 = v25;
        objc_msgSend(v67, "objectAtIndexedSubscript:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "startDate");
        v31 = v24;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqual:", v27);

        if (v33)
        {
          objc_msgSend(v67, "objectAtIndexedSubscript:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "quantityValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v74 = v31 + 1;
        }
        else
        {
          v74 = v31;
          v35 = 0;
        }
        v25 = v29;
        v26 = v63;
      }
      if (v75 >= objc_msgSend(v17, "count"))
      {
        v40 = 0;
      }
      else
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v75);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "startDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqual:", v27);

        if (v38)
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v75);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "quantityValue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          ++v75;
        }
        else
        {
          v40 = 0;
        }
        v19 = v70;
      }
      if (v25 >= objc_msgSend(v18, "count"))
      {
        v46 = 0;
      }
      else
      {
        v41 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v18, "objectAtIndexedSubscript:", v25);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "timeStamp");
        objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[HKActivitySummaryDataProvider _sampleDate:withinHourBeforeDate:](self, "_sampleDate:withinHourBeforeDate:", v43, v27))
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", v25);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "state"))
            v45 = 0.0;
          else
            v45 = 1.0;

          objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v62, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          ++v25;
        }
        else
        {
          v46 = 0;
        }
        v19 = v70;

      }
      if (v26 >= objc_msgSend(v19, "count"))
      {
        v47 = 0;
        if (v35)
          goto LABEL_35;
      }
      else
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v26);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          goto LABEL_35;
      }
      if (v40 || v46)
      {
LABEL_35:
        if (objc_msgSend(v47, "activityMoveMode") == self->_activityMoveMode
          && (objc_msgSend(v47, "isPaused") & 1) == 0)
        {
          v64 = v25;
          if (v47)
          {
            if (self->_activityMoveMode == 2)
              objc_msgSend(v47, "appleMoveTimeGoal");
            else
              objc_msgSend(v47, "activeEnergyBurnedGoal");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v71;
            objc_msgSend(v47, "exerciseTimeGoal");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "standHoursGoal");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v48 = 0;
            v49 = 0;
            v50 = 0;
            v51 = v71;
          }
          -[HKActivitySummaryDataProvider _buildHourlyActivitySummaryFromDate:calendar:moveQuantity:exerciseQuantity:standQuantity:moveGoal:exerciseGoal:standGoal:](self, "_buildHourlyActivitySummaryFromDate:calendar:moveQuantity:exerciseQuantity:standQuantity:moveGoal:exerciseGoal:standGoal:", v28, v51, v35, v40, v46, v49, v50, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v52);

          v19 = v70;
          v25 = v64;
        }
      }
      objc_msgSend(v71, "dateByAddingComponents:toDate:options:", v68, v28, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v73)
      {
        if (objc_msgSend(v27, "hk_isAfterOrEqualToDate:") && v26 < objc_msgSend(v19, "count") - 1)
        {
          if (v26 + 2 < objc_msgSend(v19, "count"))
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", v26 + 2);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "dateComponentsForCalendar:", v71);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v71, "dateFromComponents:", v54);
            v55 = objc_claimAutoreleasedReturnValue();

            v19 = v70;
            v73 = (void *)v55;
          }
          ++v26;
        }
      }
      else
      {
        v73 = 0;
      }

      v18 = v65;
      v17 = v66;
      v24 = v74;
      if ((objc_msgSend(v27, "hk_isBeforeOrEqualToDate:", v69) & 1) == 0)
        goto LABEL_54;
    }
  }
  v27 = v20;
LABEL_54:
  v56 = v61;

  return v56;
}

- (void)_hourlyActivityDataForStartDate:(id)a3 endDate:(id)a4 healthStore:(id)a5 calendar:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v17, "setHour:", 1);
  objc_initWeak(&location, self);
  v18 = objc_alloc(MEMORY[0x1E0CB6EF8]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke;
  v25[3] = &unk_1E9C44B30;
  v19 = v15;
  v26 = v19;
  v20 = v12;
  v27 = v20;
  v21 = v13;
  v28 = v21;
  objc_copyWeak(&v31, &location);
  v22 = v16;
  v30 = v22;
  v23 = v14;
  v29 = v23;
  v24 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:moveIntervalComponents:exerciseIntervalComponents:initialQueryResultsHandler:", v20, v21, v17, v17, v25);
  objc_msgSend(v23, "executeQuery:", v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "activeEnergyResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v9, "appleMoveTimeResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_11;
  }
  objc_msgSend(v9, "appleExerciseTimeResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    if (v11)
      v14 = v11;
    else
      v14 = v4;

    goto LABEL_11;
  }
  objc_msgSend(v9, "appleStandHourResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {

    if (!v13)
      goto LABEL_11;
LABEL_13:
    objc_msgSend(a1[4], "hk_activitySummaryDateComponentsFromDate:", a1[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "hk_activitySummaryDateComponentsFromDate:", a1[6]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB6280]);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke_2;
    v23 = &unk_1E9C44B08;
    objc_copyWeak(&v29, a1 + 9);
    v24 = a1[5];
    v25 = a1[6];
    v26 = a1[4];
    v27 = v9;
    v28 = a1[8];
    v19 = (void *)objc_msgSend(v18, "initWithPredicate:resultsHandler:", v17, &v20);
    objc_msgSend(a1[7], "executeQuery:", v19, v20, v21, v22, v23);

    objc_destroyWeak(&v29);
    goto LABEL_14;
  }

  if (v13)
    goto LABEL_13;
LABEL_11:
  (*((void (**)(void))a1[8] + 2))();
LABEL_14:

}

void __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (v16 && WeakRetained)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "activeEnergyResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "appleMoveTimeResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "appleExerciseTimeResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "appleStandHourResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_hourlySummariesFromStartDate:endDate:calendar:activeEnergyData:appleMoveTimeData:exerciseData:standData:dayGoalData:", v8, v9, v10, v11, v12, v13, v14, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (id)_predicateForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

void __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, a2, a3, "%{public}@: Received error fetching activity summaries %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)_hourlyActivityPageDataArrived:(uint64_t)a1 pageNumber:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, a2, a3, "%{public}@: Received error fetching hourly activity summaries %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
