@implementation FCSWeeklyGoalRecommendationEngine

+ (id)_activitySummariesSortedByEnergyBurn:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global);
}

uint64_t __74__FCSWeeklyGoalRecommendationEngine__activitySummariesSortedByEnergyBurn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "activeEnergyBurned");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeEnergyBurned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_activitySummariesSortedByMoveValue:(id)a3 activityMoveMode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  if (a4 == 2)
    objc_msgSend(v6, "_activitySummariesSortedByMoveMinutes:", v5);
  else
    objc_msgSend(v6, "_activitySummariesSortedByEnergyBurn:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_activitySummariesSortedByMoveMinutes:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_186);
}

uint64_t __75__FCSWeeklyGoalRecommendationEngine__activitySummariesSortedByMoveMinutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "appleMoveTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleMoveTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (double)_minThresholdForActivityMoveMode:(int64_t)a3
{
  double result;

  result = 10.0;
  if (a3 == 2)
    return 1.0;
  return result;
}

+ (double)_averageMoveFromActivitySummaries:(id)a3 forNumberOfSamples:(int64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;

  v6 = a3;
  if (objc_msgSend(v6, "count") < (unint64_t)a4)
    a4 = objc_msgSend(v6, "count");
  if (a4 < 1)
    goto LABEL_12;
  v7 = 0;
  v8 = 0;
  v9 = 0.0;
  do
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MoveValueAsDoubleWithSummary(v10);
    objc_msgSend(a1, "_minThresholdForActivityMoveMode:", objc_msgSend(v10, "activityMoveMode"));
    v13 = v11 < v12;
    v14 = -0.0;
    if (!v13)
      v14 = v11;
    v9 = v9 + v14;
    if (!v13)
      ++v8;

    ++v7;
  }
  while (a4 != v7);
  if (v8)
    v15 = v9 / (double)v8;
  else
LABEL_12:
    v15 = 0.0;

  return v15;
}

+ (unint64_t)_numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__FCSWeeklyGoalRecommendationEngine__numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate___block_invoke;
    v8[3] = &unk_1E8807DA0;
    v8[4] = &v9;
    v8[5] = a1;
    objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
    v6 = v10[3];
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __101__FCSWeeklyGoalRecommendationEngine__numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  int v7;

  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "_isMoveGoalAchievedForActivitySummary:", v6);

  if (v7)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  else
    *a4 = 1;
}

+ (BOOL)_isMoveGoalAchievedForActivitySummary:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = MoveValueAsDoubleWithSummary(v3);
  v5 = MoveGoalValueAsDoubleWithSummary(v3);

  return v4 >= v5;
}

+ (unint64_t)_numSamplesWithMoveGreaterThanTheGoalByPercent:(double)a3 forSummaries:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = a3 + 1.0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v13 = MoveValueAsDoubleWithSummary(v12);
        if (v13 > v9 * MoveGoalValueAsDoubleWithSummary(v12))
          ++v8;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (double)recommendedNewWeeklyGoalForActivitySummaries:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
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
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activityMoveMode");
  v8 = MoveGoalValueAsDoubleWithSummary(v6);
  v9 = v8;
  if (v5 < 7)
    goto LABEL_44;
  v10 = v8;
  v77 = v7;
  v78 = a1;
  v72 = v6;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "_gregorianDateComponents");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 6);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = v15;
      v18 = v14;
      v19 = v13;
      v20 = (void *)MEMORY[0x1D17AA5A8]();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "dateComponentsForCalendar:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dateFromComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "earlierDate:", v84);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = objc_msgSend(v21, "isEqualToDate:", v15);

      if ((v19 & 1) == 0)
        break;
      objc_msgSend(v85, "addObject:", v13);
      objc_autoreleasePoolPop(v20);
      if (++v16 >= objc_msgSend(v4, "count"))
        goto LABEL_11;
    }
    objc_autoreleasePoolPop(v20);
  }
  else
  {
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
  }
LABEL_11:
  while (v16 < objc_msgSend(v4, "count"))
  {
    v22 = v15;
    v23 = v14;
    v24 = v13;
    v25 = (void *)MEMORY[0x1D17AA5A8]();
    objc_msgSend(v4, "objectAtIndexedSubscript:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dateComponentsForCalendar:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "earlierDate:", v80);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = objc_msgSend(v26, "isEqualToDate:", v15);

    if ((v24 & 1) == 0)
    {
      objc_autoreleasePoolPop(v25);
      break;
    }
    objc_msgSend(v82, "addObject:", v13);
    objc_autoreleasePoolPop(v25);
    ++v16;
  }
  while (v16 < objc_msgSend(v4, "count"))
  {
    v27 = v15;
    v28 = v14;
    v29 = v13;
    v30 = (void *)MEMORY[0x1D17AA5A8]();
    objc_msgSend(v4, "objectAtIndexedSubscript:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dateComponentsForCalendar:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "earlierDate:", v79);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v29) = objc_msgSend(v31, "isEqualToDate:", v15);

    if ((v29 & 1) == 0)
    {
      objc_autoreleasePoolPop(v30);
      break;
    }
    objc_msgSend(v81, "addObject:", v13);
    objc_autoreleasePoolPop(v30);
    ++v16;
  }
  if (v16 >= objc_msgSend(v4, "count"))
  {
    v35 = v15;
    v34 = v14;
  }
  else
  {
    do
    {
      v32 = v13;
      v33 = (void *)MEMORY[0x1D17AA5A8]();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "dateComponentsForCalendar:", v11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dateFromComponents:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "earlierDate:", v12);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToDate:", v35);

      if (v37)
        objc_msgSend(v83, "addObject:", v13);
      objc_autoreleasePoolPop(v33);
      ++v16;
      v14 = v34;
      v15 = v35;
    }
    while (v16 < objc_msgSend(v4, "count"));
  }
  v75 = (void *)v12;
  v70 = objc_msgSend(v85, "count");
  v38 = v82;
  v69 = objc_msgSend(v82, "count");
  v39 = v81;
  v68 = objc_msgSend(v81, "count");
  v40 = objc_msgSend(v83, "count");
  v67 = objc_msgSend(v78, "_numberOfInvalidDaysFromActivitySummaries:forExpectedNumberOfSamples:", v85, 7);
  v41 = objc_msgSend(v78, "_numberOfInvalidDaysFromActivitySummaries:forExpectedNumberOfSamples:", v82, 7);
  v42 = objc_msgSend(v78, "_numberOfInvalidDaysFromActivitySummaries:forExpectedNumberOfSamples:", v81, 7);
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v82);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObjectsFromArray:", v81);
    objc_msgSend(v43, "addObjectsFromArray:", v83);
    v44 = objc_msgSend(v78, "_numberOfDaysGoalAchievedInSummaries:", v43);
    v6 = v72;
    if (v44 > 8)
    {
      v45 = v75;
      if ((unint64_t)v44 >= 0x12)
      {
        if ((unint64_t)objc_msgSend((id)objc_opt_class(), "_numSamplesWithMoveGreaterThanTheGoalByPercent:forSummaries:", v43, 0.1) <= 0xD)v9 = v10;
        else
          v9 = v10 * 1.1;
      }
    }
    else
    {
      if ((unint64_t)objc_msgSend((id)objc_opt_class(), "_numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate:", v43) >= 4)v9 = v10;
      else
        v9 = v10 * 0.9;
      v45 = v75;
    }

    v38 = v82;
LABEL_39:
    v46 = v76;
    goto LABEL_40;
  }
  v66 = v41;
  if (v68)
  {
    v71 = v42;
    v39 = v81;
    v45 = v75;
    v6 = v72;
    v46 = v76;
    switch(objc_msgSend(v78, "_numberOfDaysGoalAchievedInSummaries:", v81))
    {
      case 0:
      case 1:
      case 2:
        v47 = 0.9;
        goto LABEL_62;
      case 3:
        if (v71)
          v9 = v10;
        else
          v9 = v10 * 0.9;
        goto LABEL_40;
      case 4:
        objc_msgSend(v78, "_activitySummariesSortedByMoveValue:activityMoveMode:", v81, v77);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v58, 3);
        if (!v71)
        {
          if (v59 / v10 >= 0.75)
            v60 = 1.1;
          else
            v60 = 0.9;
          v9 = v10 * v60;
        }

        v38 = v82;
        v46 = v76;
        v45 = v75;
        goto LABEL_40;
      case 5:
      case 6:
        goto LABEL_40;
      case 7:
        v47 = 1.1;
LABEL_62:
        v9 = v10 * v47;
        break;
      default:
        v9 = 0.0;
        v6 = v72;
        goto LABEL_39;
    }
    goto LABEL_40;
  }
  v51 = v70 != 0;
  if (v69)
    v51 = 2;
  v45 = v75;
  if (v51 == 1)
  {
    v55 = objc_msgSend(v78, "_numberOfDaysGoalAchievedInSummaries:", v85);
    objc_msgSend(v78, "_activitySummariesSortedByMoveValue:activityMoveMode:", v85, v77);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v72;
    v46 = v76;
    v56 = v55;
    v39 = v81;
    switch(v56)
    {
      case 0:
        if (v67 <= 6)
          goto LABEL_52;
        break;
      case 1:
      case 2:
LABEL_52:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 4, v66);
        v9 = v57;
        break;
      case 3:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 4);
        if (!v67)
        {
LABEL_81:
          v9 = v61;
          if (v61 / v10 >= 0.75)
            v9 = v10 * 0.9;
        }
        break;
      case 4:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 3);
        if (v64 / v10 >= 0.75)
          v64 = v10;
        if (v67)
          v9 = v10;
        else
          v9 = v64;
        break;
      case 5:
      case 6:
        goto LABEL_76;
      case 7:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 7);
        if (v65 / v10 >= 1.25)
          v9 = v65;
        else
          v9 = v10 * 1.1;
        break;
      default:
        v9 = 0.0;
        v39 = v81;
        break;
    }
    goto LABEL_76;
  }
  v6 = v72;
  v46 = v76;
  if (v51 == 2)
  {
    v52 = objc_msgSend(v78, "_numberOfDaysGoalAchievedInSummaries:", v82);
    objc_msgSend(v78, "_activitySummariesSortedByMoveValue:activityMoveMode:", v82, v77);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    switch(v52)
    {
      case 0:
      case 1:
      case 2:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 4);
        v9 = v54;
        goto LABEL_75;
      case 3:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 4);
        v39 = v81;
        v46 = v76;
        if (!v66)
          goto LABEL_81;
        break;
      case 4:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 3);
        if (v62 / v10 >= 0.75)
          v62 = v10;
        if (v66)
          v9 = v10;
        else
          v9 = v62;
        goto LABEL_75;
      case 5:
      case 6:
        v9 = v10 * 1.1;
        goto LABEL_75;
      case 7:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 7);
        if (v63 / v10 >= 1.25)
          v9 = v63;
        else
          v9 = v10 * 1.1;
        goto LABEL_75;
      default:
        v9 = 0.0;
LABEL_75:
        v39 = v81;
        v46 = v76;
        break;
    }
LABEL_76:

    v38 = v82;
    goto LABEL_40;
  }
  v39 = v81;
LABEL_40:
  v48 = floor(v9 / 10.0) * 10.0;
  v49 = floor(v9);
  if (v77 == 2)
    v9 = v49;
  else
    v9 = v48;

LABEL_44:
  return v9;
}

+ (int64_t)_numberOfDaysGoalAchievedInSummaries:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend((id)objc_opt_class(), "_isMoveGoalAchievedForActivitySummary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_numberOfInvalidDaysFromActivitySummaries:(id)a3 forExpectedNumberOfSamples:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;

  v6 = a3;
  v7 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MoveValueAsDoubleWithSummary(v9);
      objc_msgSend(a1, "_minThresholdForActivityMoveMode:", objc_msgSend(v9, "activityMoveMode"));
      if (v10 < v11)
        ++v7;

      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
  }
  v12 = v7 + a4 - objc_msgSend(v6, "count");

  return v12;
}

@end
