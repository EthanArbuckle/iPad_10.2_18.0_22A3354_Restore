@implementation HKWorkout(ActivityAchievementsDaemon)

- (uint64_t)aad_best5KDuration
{
  return objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", 5, 37);
}

- (uint64_t)aad_best10KDuration
{
  return objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", 10, 37);
}

- (uint64_t)aad_bestWheelchair5KDuration
{
  return objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", 5, 71);
}

- (uint64_t)aad_bestWheelchair10KDuration
{
  return objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", 10, 71);
}

- (double)aad_bestHalfMarathonDuration
{
  double result;

  if (!objc_msgSend(a1, "_isHalfMarathonDistance"))
    return 1.79769313e308;
  objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", vcvtmd_u64_f64(*MEMORY[0x24BE013D8]), 37);
  return result;
}

- (double)aad_bestMarathonDuration
{
  double result;

  if (!objc_msgSend(a1, "_isMarathonDistance"))
    return 1.79769313e308;
  objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", vcvtmd_u64_f64(*MEMORY[0x24BE014A0]), 37);
  return result;
}

- (double)aad_bestWheelchairHalfMarathonDuration
{
  double result;

  if (!objc_msgSend(a1, "_isHalfMarathonDistance"))
    return 1.79769313e308;
  objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", vcvtmd_u64_f64(*MEMORY[0x24BE013D8]), 71);
  return result;
}

- (double)aad_bestWheelchairMarathonDuration
{
  double result;

  if (!objc_msgSend(a1, "_isMarathonDistance"))
    return 1.79769313e308;
  objc_msgSend(a1, "_bestDurationForKilometerCount:activityType:", vcvtmd_u64_f64(*MEMORY[0x24BE014A0]), 71);
  return result;
}

- (double)_bestDurationForKilometerCount:()ActivityAchievementsDaemon activityType:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "workoutActivityType") != a4)
    return 1.79769313e308;
  v6 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quantityWithUnit:doubleValue:", v7, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "workoutEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FISplitsForMeasuringSystemIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v17, "fi_splitDistance", (_QWORD)v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "compare:", v18) != 1)
          objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count") >= a3)
  {
    objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_2);
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateInterval");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v24 = v23;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateInterval");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceReferenceDate");
    v19 = v24 - v28;

  }
  else
  {
    v19 = 1.79769313e308;
  }

  return v19;
}

- (BOOL)_isMarathonDistance
{
  void *v1;
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a1, "totalDistance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValueForUnit:", v2);
  v4 = v3 >= *MEMORY[0x24BE014A0];

  return v4;
}

- (BOOL)_isHalfMarathonDistance
{
  void *v1;
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a1, "totalDistance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValueForUnit:", v2);
  v4 = v3 >= *MEMORY[0x24BE013D8];

  return v4;
}

@end
