@implementation HDAudioAnalyticsUtilities

+ (id)localGregorianCalendar
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

+ (double)leqFromStatistics:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!a3)
    return 0.0;
  objc_msgSend(a3, "averageQuantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "decibelAWeightedSoundPressureLevelUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", v4);
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

+ (double)durationFromStatistics:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!a3)
    return 0.0;
  objc_msgSend(a3, "duration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  return v6;
}

+ (double)doseFromStatistics:(id)a3 days:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = a3;
  v7 = -1.0;
  if (v6)
  {
    objc_msgSend(a1, "leqFromStatistics:", v6);
    v9 = v8;
    objc_msgSend(a1, "durationFromStatistics:", v6);
    v11 = v10;
    objc_msgSend(MEMORY[0x24BDD3938], "maximumDurationInSecondsForLEQ:days:", a4, v9);
    if (v12 > 2.22044605e-16)
      v7 = v11 / v12 * 100.0;
  }

  return v7;
}

+ (int64_t)exposureAlertCount:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "count");
  else
    return 0;
}

+ (id)fullDays:(int64_t)a3 beforeDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a1, "localGregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startOfDayForDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v9, "setDay:", -a3);
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v9, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v10, v8);

  return v11;
}

+ (id)rollingDays:(int64_t)a3 beforeDate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "localGregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setDay:", -a3);
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v8, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v6);

  return v10;
}

+ (id)boundedIntegerForExposureDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 == 0.0)
  {
    v5 = &unk_24DC65E18;
  }
  else
  {
    objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC66F98, &unk_24DC660E8, &__block_literal_global, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

unint64_t __63__HDAudioAnalyticsUtilities_boundedIntegerForExposureDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 3600.0);
}

+ (id)boundedIntegerForSyncDelayDuration:(double)a3
{
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t j;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 190);
  for (i = 1; i != 61; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  for (j = 120; j != 660; j += 60)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", j);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = 0;
  v11 = 900;
  do
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    v10 += 15;
    v11 += 900;
  }
  while (v10 < 0x2E);
  v13 = 167;
  v14 = 7200;
  do
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    v14 += 3600;
    --v13;
  }
  while (v13);
  objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", v5, &unk_24DC66100, &__block_literal_global_241, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

unint64_t __64__HDAudioAnalyticsUtilities_boundedIntegerForSyncDelayDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForEventDuration:(double)a3
{
  if (a3 < 1800.0)
    return &unk_24DC65E18;
  objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC66FB0, &unk_24DC66298, &__block_literal_global_261);
  return (id)objc_claimAutoreleasedReturnValue();
}

unint64_t __60__HDAudioAnalyticsUtilities_boundedIntegerForEventDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 3600.0);
}

+ (id)boundedIntegerForLockedDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 >= 0.0)
  {
    objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC66FC8, &unk_24DC664F0, &__block_literal_global_289, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_24DC662B0;
  }
  return v5;
}

unint64_t __61__HDAudioAnalyticsUtilities_boundedIntegerForLockedDuration___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 60.0);
}

+ (id)boundedIntegerForTimeSinceLastNotification:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 >= 0.0)
  {
    if (a3 >= 720.0)
    {
      objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC66FE0, &unk_24DC66640, &__block_literal_global_306, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &unk_24DC65E18;
    }
  }
  else
  {
    v5 = &unk_24DC662B0;
  }
  return v5;
}

unint64_t __72__HDAudioAnalyticsUtilities_boundedIntegerForTimeSinceLastNotification___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1 / 86400.0);
}

+ (id)boundedIntegerForLEQ:(double)a3
{
  return (id)objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC66FF8, &unk_24DC66730, &__block_literal_global_319, a3);
}

unint64_t __50__HDAudioAnalyticsUtilities_boundedIntegerForLEQ___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForSoundReductionLEQ:(double)a3
{
  return (id)objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC67010, &unk_24DC66778, &__block_literal_global_325, a3);
}

unint64_t __64__HDAudioAnalyticsUtilities_boundedIntegerForSoundReductionLEQ___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForDose:(double)a3
{
  return (id)objc_msgSend(a1, "boundedIntegerForValue:orderedBuckets:sentinel:transformer:", &unk_24DC67028, &unk_24DC66898, &__block_literal_global_340, a3);
}

unint64_t __51__HDAudioAnalyticsUtilities_boundedIntegerForDose___block_invoke(double a1)
{
  return vcvtmd_s64_f64(a1);
}

+ (id)boundedIntegerForValue:(double)a3 orderedBuckets:(id)a4 sentinel:(id)a5 transformer:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (*((uint64_t (**)(id, double))a6 + 2))(a6, a3);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v11 <= objc_msgSend(v17, "integerValue", (_QWORD)v20))
        {
          v18 = v17;

          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
        continue;
      break;
    }
  }

  v18 = v10;
LABEL_11:

  return v18;
}

+ (id)audioAverageAndDurationForExposureType:(int64_t)a3 profile:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id *v32;
  id v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a1, "_quantityTypeForExposureType:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v32 = a7;
    v33 = v14;
    v16 = (void *)MEMORY[0x24BE40E20];
    HDSampleEntityPredicateForStartDate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v17;
    objc_msgSend(v15, "maximumAllowedDuration");
    objc_msgSend(v13, "dateByAddingTimeInterval:", -v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v20;
    HDSampleEntityPredicateForEndDate();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateMatchingAllPredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD3E80], "_quantityTypeWithCode:", 272);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C30]), "initForProfile:quantityType:predicate:restrictedSourceEntities:attenuationType:", v12, v15, v23, 0, v24);
      v26 = _HKStatisticsOptionAttenuateSamples() | 0x42;

    }
    else
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C38]), "initForProfile:quantityType:predicate:restrictedSourceEntities:", v12, v15, v23, 0);
      v26 = 66;
    }
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C40]), "initWithProfile:quantityType:", v12, v15);
    objc_msgSend(MEMORY[0x24BE40C28], "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v15, 0, v26, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDataSource:", v25);
    objc_msgSend(v29, "setSourceOrderProvider:", v28);
    v30 = 0;
    v14 = v33;
    if (objc_msgSend(v29, "queryForInitialStatisticsWithError:", v32))
    {
      objc_msgSend(v29, "currentStatistics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("Unknown audio exposure type"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v27);
      else
        _HKLogDroppedError();
    }

    v30 = 0;
  }

  return v30;
}

+ (id)_quantityTypeForExposureType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 <= 3)
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", **((_QWORD **)&unk_24DC5EE88 + a3), v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)audioExposureEventsForExposureType:(int64_t)a3 profile:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  uint64_t v57;
  id v58;
  _QWORD v59[3];
  _QWORD v60[5];

  v60[3] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((unint64_t)(a3 - 1) >= 2)
    v13 = (_QWORD *)MEMORY[0x24BDD2918];
  else
    v13 = (_QWORD *)MEMORY[0x24BDD28D8];
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE40E20];
  v47 = v12;
  HDSampleEntityPredicateForStartDate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v16;
  objc_msgSend(v14, "maximumAllowedDuration");
  objc_msgSend(v11, "dateByAddingTimeInterval:", -v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v19;
  HDSampleEntityPredicateForEndDate();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v51 = v14;
  v52 = v10;
  objc_msgSend(MEMORY[0x24BE40A50], "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v14, v10, 0, v22, 0, 0, &v58);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v58;
  v25 = v24;
  if (!v23)
  {
    v26 = v24;
    if (v26)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v26);
      else
        _HKLogDroppedError();
    }

  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      v44 = v25;
      v45 = v22;
      v46 = v11;
      v27 = 0;
      v49 = *MEMORY[0x24BDD3580];
      v50 = v23;
      do
      {
        v28 = (void *)MEMORY[0x24BE40E20];
        objc_msgSend(v23, "objectAtIndexedSubscript:", v27);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "endDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        HDSampleEntityPredicateForStartDate();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v53;
        objc_msgSend(v23, "objectAtIndexedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "maximumAllowedDuration");
        objc_msgSend(v30, "dateByAddingTimeInterval:", -v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HDSampleEntityPredicateForStartDate();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v33;
        objc_msgSend(v23, "objectAtIndexedSubscript:", v27);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "startDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        HDSampleEntityPredicateForEndDate();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "predicateMatchingAllPredicates:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x24BE40B90];
        objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", v49);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v41 = objc_msgSend(v39, "countOfSamplesWithType:profile:matchingPredicate:withError:", v40, v52, v38, &v57);

        v23 = v50;
        if (v41 >= 1)
        {
          objc_msgSend(v50, "objectAtIndexedSubscript:", v27);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v42);

        }
        ++v27;
      }
      while (objc_msgSend(v50, "count") > v27);
      v22 = v45;
      v11 = v46;
      v25 = v44;
    }
  }
  else
  {
    v48 = v23;
  }

  return v48;
}

+ (id)latestAudioExposureEventForExposureType:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;

  v7 = a4;
  v8 = (_QWORD *)MEMORY[0x24BDD2918];
  if (a3 == 1)
    v8 = (_QWORD *)MEMORY[0x24BDD28D8];
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x24BE40A50], "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v9, v7, 0, 0, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  v12 = v11;
  if (!v10)
  {
    v13 = v11;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

  }
  return v10;
}

@end
