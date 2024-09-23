@implementation HKSleepDaySummary(HealthUI)

+ (id)aggregateWeeklySummariesFromDailySummaries:()HealthUI firstWeekdayOverride:strategy:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    if (v7)
      objc_msgSend(v10, "setFirstWeekday:", objc_msgSend(v7, "integerValue"));
    v30 = v7;
    v11 = objc_msgSend(v10, "firstWeekday");
    v29 = v8;
    objc_msgSend(v8, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v11, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v6;
    obj = v6;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v20, "dateInterval");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "endDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "hk_isBeforeOrEqualToDate:", v14))
          {
            objc_msgSend(v15, "addObject:", v20);
          }
          else
          {
            objc_msgSend(a1, "_aggregateWeeklySummaryFromDailySummaries:calendar:strategy:", v15, v10, a5);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v32, "addObject:", v23);
            v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

            objc_msgSend(v24, "addObject:", v20);
            objc_msgSend(v10, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v10, "firstWeekday"), v14, 1);
            v25 = objc_claimAutoreleasedReturnValue();

            v15 = v24;
            v14 = (void *)v25;
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v17);
    }

    objc_msgSend(a1, "_aggregateWeeklySummaryFromDailySummaries:calendar:strategy:", v15, v10, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v32, "addObject:", v26);
    v27 = v32;

    v7 = v30;
    v6 = v31;
    v8 = v29;
  }
  else
  {
    v27 = (id)MEMORY[0x1E0C9AA60];
  }

  return v27;
}

- (uint64_t)minYValue
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
}

- (uint64_t)maxYValue
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
}

- (id)hk_bedtimeGoalValue
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "primarySchedule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bedTimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_secondsFromSummaryStartDateForDateComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hk_wakeTimeGoalValue
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "primarySchedule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wakeTimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_secondsFromSummaryStartDateForDateComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hk_sleepDurationGoalValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "sleepDurationGoal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "sleepDurationGoal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValueForUnit:", v5);
    objc_msgSend(v3, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)hk_overlapsMidnightBasedDateInterval:()HealthUI gregorianCalendar:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "hk_dayIndexRangeWithCalendar:", a4);
  v7 = v6;
  v8 = objc_msgSend(a1, "morningIndex");
  return v8 >= v5 && v8 - v5 < v7;
}

- (id)_secondsFromSummaryStartDateForDateComponents:()HealthUI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(a1, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    objc_msgSend(a1, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextDateAfterDate:matchingComponents:options:", v6, v4, 512);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v11 = v10;
    objc_msgSend(a1, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "daylightSavingTimeOffsetForDate:", v9);
    v15 = v14;
    objc_msgSend(v13, "daylightSavingTimeOffsetForDate:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 + v15 - v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_aggregateWeeklySummaryFromDailySummaries:()HealthUI calendar:strategy:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v38 = a5;
    objc_msgSend(v8, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "morningIndex");
    v40 = v9;
    v13 = v9;
    v39 = v13;
    v41 = a1;
    if (objc_msgSend(v8, "count") == 7)
    {
      v37 = v12;
      v14 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v10, "dateInterval");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateInterval");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v16, v18);

    }
    else
    {
      objc_msgSend(v11, "dateInterval");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_endOfWeekContainingDate:calendar:", v22, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v16, "hk_morningIndexWithCalendar:", v13);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v15);
    }

    v23 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v10, "creationInterval");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v11;
    objc_msgSend(v11, "creationInterval");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "endDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v23, "initWithStartDate:endDate:", v25, v28);

    if (v38 == 1)
    {
      v30 = v41;
      objc_msgSend(v41, "_computeProbablePeriodsFromSummaries:summaryDateInterval:", v8, v19);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = v41;
      if (v38)
      {
        v32 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v41, "_computeAveragePeriodsFromSummaries:summaryDateInterval:", v8, v19);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v31;
LABEL_12:
    v33 = v26;
    objc_msgSend(v30, "_lastNonEmptySchedules:", v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_lastNonZeroDurationGoal:", v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6BE0], "daySummaryWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", v37, v19, v39, v32, v34, v35, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v40;
    goto LABEL_13;
  }
  v20 = 0;
LABEL_13:

  return v20;
}

+ (id)_lastNonEmptySchedules:()HealthUI
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schedules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "schedules", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          objc_msgSend(v11, "schedules");
          v14 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_lastNonZeroDurationGoal:()HealthUI
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepDurationGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "sleepDurationGoal", (_QWORD)v20);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "sleepDurationGoal");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValueForUnit:", v15);
          v17 = v16;

          if (v17 > 0.0)
          {
            objc_msgSend(v11, "sleepDurationGoal");
            v18 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v18;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_computeAveragePeriodsFromSummaries:()HealthUI summaryDateInterval:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v49 = a4;
  obj = v6;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0.0;
    v10 = *(_QWORD *)v56;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(a1, "_findMidPointOffsetForSummary:sleepCategory:", v17, 0);
        v19 = v18;
        if (v18 != -1.79769313e308)
        {
          objc_msgSend(v17, "inBedDuration");
          v15 = v15 + v20;
          v14 = v14 + v19;
          v13 = v13 + 1.0;
        }
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        _HKCategoryValueSleepAnalysisAsleepValues();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v52 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(a1, "_findMidPointOffsetForSummary:sleepCategory:", v17, objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "integerValue"));
              v27 = v26;
              if (v26 != -1.79769313e308)
              {
                objc_msgSend(v17, "sleepDuration");
                v12 = v12 + v28;
                v11 = v11 + v27;
                v9 = v9 + 1.0;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v23);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
  }
  if (v13 == 0.0 && v9 == 0.0)
  {
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v49, "startDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v13 <= 0.0)
    {
      v36 = 0;
      v35 = 0;
    }
    else
    {
      objc_msgSend(v30, "dateByAddingTimeInterval:", v14 / v13 + v15 / v13 * -0.5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v32, v15 / v13);
      objc_msgSend(MEMORY[0x1E0CB6C00], "sleepPeriodSegmentWithDateInterval:category:", v33, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v34);
      objc_msgSend(v33, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "endDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v9 > 0.0)
    {
      objc_msgSend(v30, "dateByAddingTimeInterval:", v11 / v9 + v12 / v9 * -0.5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v37, v12 / v9);
      objc_msgSend(MEMORY[0x1E0CB6C00], "sleepPeriodSegmentWithDateInterval:category:", v38, _HKCategoryValueSleepAnalysisDefaultAsleepValue());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v39);
      if (!v35
        || (objc_msgSend(v38, "startDate"),
            v40 = (void *)objc_claimAutoreleasedReturnValue(),
            v41 = objc_msgSend(v40, "hk_isBeforeDate:", v35),
            v40,
            v41))
      {
        objc_msgSend(v38, "startDate");
        v42 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v42;
      }
      if (!v36
        || (objc_msgSend(v38, "endDate"),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v44 = objc_msgSend(v43, "hk_isAfterDate:", v36),
            v43,
            v44))
      {
        objc_msgSend(v38, "endDate");
        v45 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v45;
      }

    }
    v29 = (void *)MEMORY[0x1E0C9AA60];
    if (v35 && v36)
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v35, v36);
      objc_msgSend(MEMORY[0x1E0CB6BF8], "sleepPeriodWithDateInterval:segments:", v46, v31);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v29;
}

+ (double)_findMidPointOffsetForSummary:()HealthUI sleepCategory:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v36 = a3;
  objc_msgSend(v36, "periods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  v5 = 0;
  v6 = 0;
  if (!v39)
  {
    v27 = -1.79769313e308;
    v28 = obj;
LABEL_41:

    goto LABEL_42;
  }
  v38 = *(_QWORD *)v54;
  v41 = a4;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v54 != v38)
        objc_enumerationMutation(obj);
      v40 = v7;
      v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v7);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v8, "segments");
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v50;
        v42 = *(_QWORD *)v50;
        do
        {
          v12 = 0;
          v43 = v10;
          do
          {
            if (*(_QWORD *)v50 != v11)
              objc_enumerationMutation(v44);
            v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v12);
            if (objc_msgSend(v13, "category") == a4)
            {
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v13, "sampleIntervals");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v46;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v46 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                    if (!v6
                      || (objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "startDate"),
                          v20 = (void *)objc_claimAutoreleasedReturnValue(),
                          v21 = objc_msgSend(v20, "hk_isBeforeDate:", v6),
                          v20,
                          v21))
                    {
                      objc_msgSend(v19, "startDate");
                      v22 = objc_claimAutoreleasedReturnValue();

                      v6 = (void *)v22;
                    }
                    if (v5)
                    {
                      objc_msgSend(v19, "endDate");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(v23, "hk_isAfterDate:", v5);

                      if (!v24)
                        continue;
                    }
                    objc_msgSend(v19, "endDate");
                    v25 = objc_claimAutoreleasedReturnValue();

                    v5 = (void *)v25;
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                }
                while (v16);
              }

              a4 = v41;
              v11 = v42;
              v10 = v43;
            }
            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v10);
      }

      v7 = v40 + 1;
    }
    while (v40 + 1 != v39);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  }
  while (v39);

  if (v6)
  {
    if (v5)
    {
      HKDateMid();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_37;
      goto LABEL_40;
    }
    v29 = 0;
    v5 = v6;
LABEL_39:
    v26 = v5;
    v5 = v29;
LABEL_40:
    v28 = v26;
    objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    v31 = v30;
    objc_msgSend(v36, "dateInterval");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSinceReferenceDate");
    v27 = v31 - v34;

    goto LABEL_41;
  }
  v29 = v5;
  if (v5)
    goto LABEL_39;
  v6 = 0;
LABEL_37:
  v27 = -1.79769313e308;
LABEL_42:

  return v27;
}

+ (id)_endOfWeekContainingDate:()HealthUI calendar:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v6, "firstWeekday"), v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hk_isBeforeDate:", v7))
  {
    v10 = v8;
    do
    {
      v11 = v9;

      objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v11, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v11;
    }
    while ((objc_msgSend(v9, "hk_isBeforeDate:", v7) & 1) != 0);
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

+ (id)_computeProbablePeriodsFromSummaries:()HealthUI summaryDateInterval:
{
  id v5;
  id v6;
  HKSleepStagePeriodsAggregator *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[HKSleepStagePeriodsAggregator initWithSleepDaySummaries:bucketSize:summaryDateInterval:]([HKSleepStagePeriodsAggregator alloc], "initWithSleepDaySummaries:bucketSize:summaryDateInterval:", v6, v5, 600.0);

  -[HKSleepStagePeriodsAggregator aggregateSleepPeriods](v7, "aggregateSleepPeriods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
