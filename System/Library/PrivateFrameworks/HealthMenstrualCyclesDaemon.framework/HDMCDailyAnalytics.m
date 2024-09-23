@implementation HDMCDailyAnalytics

+ (id)_setDiagnosticOnboardingFieldsInMetric:(id)a3 keyValueDomain:(id)a4 heartRateInputFeatureStatus:(id)a5 deviationDetectionFeatureStatus:(id)a6 wristTemperatureInputFeatureStatus:(id)a7 gregorianCalendar:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
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
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v48 = a7;
  v49 = a8;
  v51 = 0;
  objc_msgSend(v15, "hdmc_legacyOnboardingVersionCompletedWithError:", &v51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v51;
  v20 = v19;
  if (!v18 && v19)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      +[HDMCDailyAnalytics(Onboarding) _setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.1(v21);
      if (a9)
        goto LABEL_5;
    }
    else if (a9)
    {
LABEL_5:
      v22 = objc_retainAutorelease(v20);
      v23 = 0;
      *a9 = v22;
LABEL_21:
      v27 = v48;
      goto LABEL_22;
    }
    _HKLogDroppedError();
    v23 = 0;
    v22 = v20;
    goto LABEL_21;
  }
  v47 = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18 != 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOnboardingCompleted:", v24);

  objc_msgSend(v14, "setOnboardedVersion:", v18);
  v50 = v20;
  objc_msgSend(v15, "hdmc_legacyOnboardingFirstCompletedDateWithError:", &v50);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v50;

  if (v25 || !v22)
  {
    if (v25)
    {
      v28 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_weeksBetweenStartDate:endDate:calendar:", v25, v29, v49);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWeeksSinceOnboarded:", v30);

    }
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "getActivePairedDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x24BDD16E0];
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("02979F49-FAFA-49CC-8478-C2562BC81FB6"));
      objc_msgSend(v33, "numberWithBool:", objc_msgSend(v32, "supportsCapability:", v34));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHasCompatiblePairedAppleWatch:", v35);

      v36 = (void *)MEMORY[0x24BDD16E0];
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("CBC78224-8F5E-4D43-8666-69ADBE2A6277"));
      objc_msgSend(v36, "numberWithBool:", objc_msgSend(v32, "supportsCapability:", v37));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHasWristTemperatureCompatiblePairedWatch:", v38);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", HKMCIsAlgorithmsVersionSameOnPairedDevice());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHasSameAlgorithmVersionOnPairedWatch:", v39);

    }
    v40 = objc_msgSend(v47, "isOnboardingRecordPresent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWasHeartRateInputDelivered:", v41);

    v42 = objc_msgSend(v17, "isOnboardingRecordPresent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWasDeviationDetectionDelivered:", v43);

    v27 = v48;
    v44 = objc_msgSend(v48, "isOnboardingRecordPresent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWasWristTemperatureInputDelivered:", v45);

    v23 = v14;
  }
  else
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x24BDD3030];
    v27 = v48;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCDailyAnalytics(Onboarding) _setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.2(v26);
    if (a9)
    {
      v23 = 0;
      *a9 = objc_retainAutorelease(v22);
    }
    else
    {
      _HKLogDroppedError();
      v23 = 0;
    }
  }

  v16 = v47;
LABEL_22:

  return v23;
}

+ (id)_setDeviationSampleFieldsInMetric:(id)a3 profile:(id)a4 userCalendar:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v57 = 0;
  +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:profile:calendar:error:](HDMCDailyAnalytics, "_countDeviationSamplesInPastYearOfType:profile:calendar:error:", 1, v10, v11, &v57);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v57;
  if (!v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("countPastYear"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("hasConfirmedInThePastMonth"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:profile:calendar:error:](HDMCDailyAnalytics, "_countDeviationSamplesInPastYearOfType:profile:calendar:error:", 2, v10, v11, &v56);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v56;
    if (v18)
    {
      v14 = v18;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:].cold.3();
        if (a6)
          goto LABEL_8;
      }
      else if (a6)
      {
LABEL_8:
        v14 = objc_retainAutorelease(v14);
        v15 = 0;
        *a6 = v14;
LABEL_41:

        goto LABEL_42;
      }
      _HKLogDroppedError();
      v15 = 0;
      goto LABEL_41;
    }
    v50 = v16;
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("countPastYear"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("hasConfirmedInThePastMonth"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:profile:calendar:error:](HDMCDailyAnalytics, "_countDeviationSamplesInPastYearOfType:profile:calendar:error:", 3, v10, v11, &v55);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v55;
    if (!v20)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("countPastYear"));
      v47 = v19;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("hasConfirmedInThePastMonth"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:profile:calendar:error:](HDMCDailyAnalytics, "_countDeviationSamplesInPastYearOfType:profile:calendar:error:", 0, v10, v11, &v54);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v54;
      v46 = v21;
      if (v14)
      {
        v22 = v48;
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:].cold.1();
        if (a6)
        {
          v15 = 0;
          *a6 = objc_retainAutorelease(v14);
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
        v42 = v49;
        v41 = v46;
      }
      else
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("countPastYear"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("hasConfirmedInThePastMonth"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCountConfirmedSpottingDeviationPastYear:", v53);
        objc_msgSend(v9, "setCountConfirmedIrregularDeviationPastYear:", v51);
        objc_msgSend(v9, "setCountConfirmedInfrequentDeviationPastYear:", v48);
        v44 = v23;
        objc_msgSend(v9, "setCountConfirmedProlongedDeviationPastYear:", v23);
        v24 = objc_msgSend(v53, "integerValue");
        v25 = objc_msgSend(v51, "integerValue") + v24;
        v26 = objc_msgSend(v48, "integerValue");
        v27 = objc_msgSend(v23, "integerValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v25 + v26 + v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCountTotalConfirmedDeviationsPastYear:", v28);

        v29 = objc_msgSend(v50, "integerValue");
        v30 = objc_msgSend(v52, "integerValue") + v29;
        v31 = objc_msgSend(v45, "integerValue");
        v32 = objc_msgSend(v49, "integerValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v30 + v31 + v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCountTotalConfirmedDeviationsPastMonth:", v33);

        v34 = objc_msgSend(v50, "integerValue");
        v35 = MEMORY[0x24BDBD1C0];
        v36 = MEMORY[0x24BDBD1C8];
        if (v34 == 1)
          v37 = MEMORY[0x24BDBD1C8];
        else
          v37 = MEMORY[0x24BDBD1C0];
        objc_msgSend(v9, "setHasConfirmedSpottingDeviationPastMonth:", v37);
        if (objc_msgSend(v52, "integerValue") == 1)
          v38 = v36;
        else
          v38 = v35;
        objc_msgSend(v9, "setHasConfirmedIrregularDeviationPastMonth:", v38);
        if (objc_msgSend(v49, "integerValue") == 1)
          v39 = v36;
        else
          v39 = v35;
        objc_msgSend(v9, "setHasConfirmedInfrequentDeviationPastMonth:", v39);
        if (objc_msgSend(v45, "integerValue") == 1)
          v40 = v36;
        else
          v40 = v35;
        objc_msgSend(v9, "setHasConfirmedProlongedDeviationPastMonth:", v40);
        v15 = v9;

        v41 = v46;
        v22 = v48;
        v42 = v49;
      }

      v19 = v47;
      goto LABEL_40;
    }
    v14 = v20;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:].cold.2();
      if (a6)
        goto LABEL_12;
    }
    else if (a6)
    {
LABEL_12:
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a6 = v14;
LABEL_40:

      v16 = v50;
      goto LABEL_41;
    }
    _HKLogDroppedError();
    v15 = 0;
    goto LABEL_40;
  }
  v14 = v13;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
  {
    +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:].cold.4();
    if (a6)
      goto LABEL_4;
LABEL_19:
    _HKLogDroppedError();
    v15 = 0;
    goto LABEL_42;
  }
  if (!a6)
    goto LABEL_19;
LABEL_4:
  v14 = objc_retainAutorelease(v14);
  v15 = 0;
  *a6 = v14;
LABEL_42:

  return v15;
}

+ (id)_countDeviationSamplesInPastYearOfType:(int64_t)a3 profile:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  HKCategoryTypeFromDeviationType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:", v14, v13, 365);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v16 = objc_msgSend(MEMORY[0x24BE40BC0], "countOfSamplesWithType:profile:matchingPredicate:withError:", v12, v10, v15, &v26);
  v17 = v26;
  if (!v17)
  {
    if (v16 < 1)
    {
      v27[0] = CFSTR("countPastYear");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v27[1] = CFSTR("hasConfirmedInThePastMonth");
      v28[0] = v18;
      v28[1] = &unk_24DB30198;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v25 = 0;
    objc_msgSend(a1, "_hasConfirmedDeviationInPastMonthOfType:profile:calendar:error:", a3, v10, v11, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;
    v18 = v21;
    if (v20)
    {
      v29[0] = CFSTR("countPastYear");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v29[1] = CFSTR("hasConfirmedInThePastMonth");
      v30[0] = v22;
      v30[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    v23 = v21;
    v22 = v23;
    if (v23)
    {
      if (a6)
      {
        v22 = objc_retainAutorelease(v23);
        v19 = 0;
        *a6 = v22;
        goto LABEL_14;
      }
      _HKLogDroppedError();
    }
    v19 = 0;
    goto LABEL_14;
  }
  v18 = v17;
  if (a6)
  {
    v18 = objc_retainAutorelease(v17);
    v19 = 0;
    *a6 = v18;
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }
LABEL_15:

  return v19;
}

+ (id)_hasConfirmedDeviationInPastMonthOfType:(int64_t)a3 profile:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v23;

  v8 = a5;
  v9 = a4;
  HKCategoryTypeFromDeviationType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(MEMORY[0x24BE40BC0], "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v10, v9, 0, 0, 0, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v23;
  v13 = v12;
  if (v11)
    v14 = 1;
  else
    v14 = v12 == 0;
  if (v14)
  {
    v15 = &unk_24DB30198;
    if (v11)
    {
      objc_msgSend(v11, "_creationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hk_startOfDateByAddingDays:toDate:", -30, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "hk_isAfterOrEqualToDate:", v18);
      v20 = &unk_24DB301B0;
      if (!v19)
        v20 = &unk_24DB30198;
      v15 = v20;

    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:].cold.1();
    if (a6)
    {
      v15 = 0;
      *a6 = objc_retainAutorelease(v13);
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
  }

  return v15;
}

+ (id)_setDetectedDeviationFieldsInMetric:(id)a3 gregorianCalendar:(id)a4 deviationDetectionAnalyticsKeyValueDomain:(id)a5 todayDayIndex:(int64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v53 = 0;
  +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:](HDMCDailyAnalytics, "_getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:", 1, v12, v13, &v53);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v53;
  if (!v15)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("countPastYear"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCountDetectedSpottingDeviationsPastYear:");
    v52 = 0;
    +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:](HDMCDailyAnalytics, "_getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:", 2, v12, v13, &v52);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v52;
    if (v19)
    {
      v16 = v19;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:].cold.1();
        if (a7)
          goto LABEL_8;
      }
      else if (a7)
      {
LABEL_8:
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a7 = v16;
LABEL_39:

        goto LABEL_40;
      }
      _HKLogDroppedError();
      v17 = 0;
      goto LABEL_39;
    }
    v47 = v18;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("countPastYear"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCountDetectedIrregularDeviationsInPastYear:");
    v51 = 0;
    +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:](HDMCDailyAnalytics, "_getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:", 3, v12, v13, &v51);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v51;
    if (v21)
    {
      v16 = v21;
      v22 = v20;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:].cold.1();
        if (a7)
          goto LABEL_12;
      }
      else if (a7)
      {
LABEL_12:
        v23 = v46;
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a7 = v16;
LABEL_33:
        v18 = v47;
LABEL_38:

        goto LABEL_39;
      }
      v23 = v46;
      _HKLogDroppedError();
      v17 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("countPastYear"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCountDetectedInfrequentDeviationsPastYear:");
    v50 = 0;
    +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:](HDMCDailyAnalytics, "_getDeviationDetectedCountForDeviationType:gregorianCalendar:domain:error:", 0, v12, v13, &v50);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v50;
    v45 = v24;
    if (v25)
    {
      v16 = v25;
      v22 = v20;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:].cold.1();
      v23 = v46;
      if (a7)
      {
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a7 = v16;
      }
      else
      {
        _HKLogDroppedError();
        v17 = 0;
      }
      v18 = v47;
      goto LABEL_37;
    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("countPastYear"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCountDetectedProlongedDeviationsPastYear:", v26);
    v42 = (void *)MEMORY[0x24BDD16E0];
    v40 = objc_msgSend(v48, "integerValue");
    v38 = objc_msgSend(v46, "integerValue") + v40;
    v41 = v26;
    objc_msgSend(v42, "numberWithInteger:", v38 + objc_msgSend(v44, "integerValue") + objc_msgSend(v26, "integerValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCountTotalDetectedDeviationsPastYear:", v27);

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("countPastMonth"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v20;
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("countPastMonth"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("countPastMonth"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("countPastMonth"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v28;
    v39 = v29;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v29, "integerValue")+ objc_msgSend(v28, "integerValue")+ objc_msgSend(v30, "integerValue")+ objc_msgSend(v36, "integerValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCountTotalDetectedDeviationsPastMonth:", v31);

    v32 = *MEMORY[0x24BE46B00];
    v49 = 0;
    objc_msgSend(v13, "numberForKey:error:", v32, &v49);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v49;
    if (!v16)
    {
      if (v33)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6 - objc_msgSend(v33, "integerValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDaysSinceDeviationTilePosted:", v34);

      }
      v23 = v46;
      v17 = v11;
      goto LABEL_36;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:].cold.1();
      if (a7)
        goto LABEL_23;
    }
    else if (a7)
    {
LABEL_23:
      v23 = v46;
      v17 = 0;
      *a7 = objc_retainAutorelease(v16);
LABEL_36:

      v18 = v47;
      v22 = v43;
LABEL_37:

      goto LABEL_38;
    }
    v23 = v46;
    _HKLogDroppedError();
    v17 = 0;
    goto LABEL_36;
  }
  v16 = v15;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
  {
    +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:].cold.1();
    if (a7)
      goto LABEL_4;
LABEL_19:
    _HKLogDroppedError();
    v17 = 0;
    goto LABEL_40;
  }
  if (!a7)
    goto LABEL_19;
LABEL_4:
  v16 = objc_retainAutorelease(v16);
  v17 = 0;
  *a7 = v16;
LABEL_40:

  return v17;
}

+ (id)_getDeviationDetectedCountForDeviationType:(int64_t)a3 gregorianCalendar:(id)a4 domain:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  HKMCDeviationDetectionAnalyticsKeyFromDeviationType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v9, "propertyListValueForKey:error:", v10, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v25;
  v13 = v12;
  if (v11 || !v12)
  {
    v16 = HKMCTodayIndex();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __107__HDMCDailyAnalytics_Deviation___getDeviationDetectedCountForDeviationType_gregorianCalendar_domain_error___block_invoke;
    v24[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
    v24[4] = v16 - 30;
    objc_msgSend(v11, "hk_filter:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = CFSTR("countPastYear");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = CFSTR("countPastMonth");
    v27[0] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v21 = v14;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v13;
      v23 = v22;
      _os_log_error_impl(&dword_21961B000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);

    }
    if (a6)
    {
      v15 = 0;
      *a6 = objc_retainAutorelease(v13);
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
  }

  return v15;
}

BOOL __107__HDMCDailyAnalytics_Deviation___getDeviationDetectedCountForDeviationType_gregorianCalendar_domain_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") > *(_QWORD *)(a1 + 32);
}

+ (id)_setCycleFactorRelatedFieldsInMetric:(id)a3 analysis:(id)a4 appProtectedKeyValueDomain:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  id v24;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a4, "ongoingCycleFactors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    v15 = MEMORY[0x24BDBD1C8];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16), "hkmc_cycleFactor");
        if ((unint64_t)(v17 - 3) >= 7)
        {
          if (v17 == 2)
          {
            objc_msgSend(v9, "setOngoingPregnancy:", v15);
          }
          else if (v17 == 1)
          {
            objc_msgSend(v9, "setOngoingLactation:", v15);
          }
        }
        else
        {
          objc_msgSend(v9, "setOngoingContraception:", v15);
        }
        ++v16;
      }
      while (v13 != v16);
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v13 = v18;
    }
    while (v18);
  }

  v19 = *MEMORY[0x24BE46880];
  v27 = 0;
  objc_msgSend(v10, "numberForKey:error:", v19, &v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v27;
  v22 = v21;
  if (v20)
    v23 = 1;
  else
    v23 = v21 == 0;
  if (v23)
  {
    objc_msgSend(v9, "setIsEligibleForCycleFactorsReminder:", v20);
    v24 = v9;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCDailyAnalytics(Deviation) _setCycleFactorRelatedFieldsInMetric:analysis:appProtectedKeyValueDomain:error:].cold.1();
    if (a6)
    {
      v24 = 0;
      *a6 = objc_retainAutorelease(v22);
    }
    else
    {
      _HKLogDroppedError();
      v24 = 0;
    }
  }

  return v24;
}

+ (BOOL)shouldSubmit
{
  void *v2;
  char IsEventUsed;

  +[HDMCDailyMetric eventName](HDMCDailyMetric, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

- (HDMCDailyAnalytics)initWithProfile:(id)a3 analysis:(id)a4 heartRateFeatureAvailabilityManager:(id)a5 deviationDetectionFeatureAvailabilityManager:(id)a6 wristTemperatureInputFeatureAvailabilityManager:(id)a7 pregnancyManager:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HDMCDailyAnalytics *v21;
  HDMCDailyAnalytics *v22;
  uint64_t v23;
  HDKeyValueDomain *keyValueDomain;
  uint64_t v25;
  HDKeyValueDomain *fertileWindowNotificationKeyValueDomain;
  uint64_t v27;
  HKFeatureStatusManager *heartRateFeatureStatusManager;
  uint64_t v29;
  HKFeatureStatusManager *deviationDetectionFeatureStatusManager;
  uint64_t v31;
  HDKeyValueDomain *deviationDetectionAnalyticsKeyValueDomain;
  uint64_t v33;
  HDKeyValueDomain *appProtectedKeyValueDomain;
  uint64_t v35;
  HKFeatureStatusManager *wristTemperatureInputFeatureStatusManager;
  uint64_t v37;
  HKSPSleepStore *sleepStore;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v40.receiver = self;
  v40.super_class = (Class)HDMCDailyAnalytics;
  v21 = -[HDMCDailyAnalytics init](&v40, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    objc_storeStrong((id *)&v22->_analysis, a4);
    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v22->_profile);
    v23 = objc_claimAutoreleasedReturnValue();
    keyValueDomain = v22->_keyValueDomain;
    v22->_keyValueDomain = (HDKeyValueDomain *)v23;

    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_syncedUnprotectedDomainWithProfile:", v22->_profile);
    v25 = objc_claimAutoreleasedReturnValue();
    fertileWindowNotificationKeyValueDomain = v22->_fertileWindowNotificationKeyValueDomain;
    v22->_fertileWindowNotificationKeyValueDomain = (HDKeyValueDomain *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v17, v15);
    heartRateFeatureStatusManager = v22->_heartRateFeatureStatusManager;
    v22->_heartRateFeatureStatusManager = (HKFeatureStatusManager *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v18, v15);
    deviationDetectionFeatureStatusManager = v22->_deviationDetectionFeatureStatusManager;
    v22->_deviationDetectionFeatureStatusManager = (HKFeatureStatusManager *)v29;

    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:", v22->_profile);
    v31 = objc_claimAutoreleasedReturnValue();
    deviationDetectionAnalyticsKeyValueDomain = v22->_deviationDetectionAnalyticsKeyValueDomain;
    v22->_deviationDetectionAnalyticsKeyValueDomain = (HDKeyValueDomain *)v31;

    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_appProtectedSyncedMenstrualCyclesDefaultsDomainWithProfile:", v22->_profile);
    v33 = objc_claimAutoreleasedReturnValue();
    appProtectedKeyValueDomain = v22->_appProtectedKeyValueDomain;
    v22->_appProtectedKeyValueDomain = (HDKeyValueDomain *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v19, v15);
    wristTemperatureInputFeatureStatusManager = v22->_wristTemperatureInputFeatureStatusManager;
    v22->_wristTemperatureInputFeatureStatusManager = (HKFeatureStatusManager *)v35;

    objc_storeStrong((id *)&v22->_pregnancyManager, a8);
    v37 = objc_msgSend(objc_alloc(MEMORY[0x24BEA9950]), "initWithIdentifier:healthStore:options:", CFSTR("HDMCDailyAnalytics"), 0, 2);
    sleepStore = v22->_sleepStore;
    v22->_sleepStore = (HKSPSleepStore *)v37;

  }
  return v22;
}

- (BOOL)submitMetricWithError:(id *)a3
{
  void *v5;
  HDMCDailyMetric *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  HKFeatureStatusManager *heartRateFeatureStatusManager;
  id v12;
  id v13;
  HKFeatureStatusManager *deviationDetectionFeatureStatusManager;
  id v15;
  id v16;
  id v17;
  HKFeatureStatusManager *wristTemperatureInputFeatureStatusManager;
  void *v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  HDMCDailyAnalytics *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v33;
  void *v34;
  HDMCDailyMetric *v35;
  id v36;
  id v37;
  id v38;
  id v39;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDMCDailyMetric initWithImproveHealthAndActivityAllowed:]([HDMCDailyMetric alloc], "initWithImproveHealthAndActivityAllowed:", HKImproveHealthAndActivityAnalyticsAllowed());
  -[HDProfile featureSettingsManager](self->_profile, "featureSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD2E28];
  v39 = 0;
  objc_msgSend(v7, "featureSettingsForFeatureIdentifier:error:", v8, &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;

  if (v9)
  {
    heartRateFeatureStatusManager = self->_heartRateFeatureStatusManager;
    v38 = v10;
    -[HKFeatureStatusManager featureStatusWithError:](heartRateFeatureStatusManager, "featureStatusWithError:", &v38);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v38;

    v35 = v6;
    if (v12)
    {
      deviationDetectionFeatureStatusManager = self->_deviationDetectionFeatureStatusManager;
      v37 = v13;
      -[HKFeatureStatusManager featureStatusWithError:](deviationDetectionFeatureStatusManager, "featureStatusWithError:", &v37);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v37;

      v34 = v5;
      if (v15)
      {
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE46C08]), "initWithObservationEnabled:", 0);
        wristTemperatureInputFeatureStatusManager = self->_wristTemperatureInputFeatureStatusManager;
        v36 = v16;
        -[HKFeatureStatusManager featureStatusWithError:](wristTemperatureInputFeatureStatusManager, "featureStatusWithError:", &v36);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v36;

        v21 = v19 != 0;
        if (v19)
        {
          if (!-[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](self, "_collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:", v35, v17, v12, v15, v19, v34, a3))goto LABEL_23;
          objc_msgSend(v15, "onboardingRecord");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "featureSettings");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = self;
          v24 = (void *)v22;
          v25 = -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](v23, "_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:", v35, v17, v9, v12, v22, v19, v34, a3);

          if (!v25)
          {
LABEL_23:
            v21 = 0;
LABEL_37:

            goto LABEL_38;
          }
          objc_msgSend((id)objc_opt_class(), "eventName");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          -[HDMCDailyMetric eventPayload](v35, "eventPayload");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
            -[HDMCDailyAnalytics submitMetricWithError:].cold.4();
          v31 = v20;
          v26 = v31;
          if (v31)
          {
            if (a3)
            {
              v26 = objc_retainAutorelease(v31);
              *a3 = v26;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
        }

        goto LABEL_37;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCDailyAnalytics submitMetricWithError:].cold.3();
      v30 = v16;
      v17 = v30;
      if (v30)
      {
        if (a3)
        {
          v17 = objc_retainAutorelease(v30);
          v21 = 0;
          *a3 = v17;
          v20 = v17;
LABEL_38:

          v5 = v34;
          goto LABEL_39;
        }
        _HKLogDroppedError();
      }
      v21 = 0;
      v20 = v17;
      goto LABEL_38;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCDailyAnalytics submitMetricWithError:].cold.2();
    v29 = v13;
    v15 = v29;
    if (v29)
    {
      if (a3)
      {
        v15 = objc_retainAutorelease(v29);
        v21 = 0;
        *a3 = v15;
        v20 = v15;
LABEL_39:

        v6 = v35;
        goto LABEL_40;
      }
      _HKLogDroppedError();
    }
    v21 = 0;
    v20 = v15;
    goto LABEL_39;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HDMCDailyAnalytics submitMetricWithError:].cold.1();
  v28 = v10;
  v12 = v28;
  if (!v28)
    goto LABEL_30;
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_30:
    v21 = 0;
    v20 = v12;
    goto LABEL_40;
  }
  v12 = objc_retainAutorelease(v28);
  v21 = 0;
  *a3 = v12;
  v20 = v12;
LABEL_40:

  return v21;
}

- (BOOL)_collectDiagnosticFieldsForMetric:(id)a3 settingsManager:(id)a4 heartRateInputFeatureStatus:(id)a5 deviationDetectionFeatureStatus:(id)a6 wristTemperatureInputFeatureStatus:(id)a7 gregorianCalendar:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HDKeyValueDomain *keyValueDomain;
  void *v21;
  id v22;
  id v23;
  HKSPSleepStore *sleepStore;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  HDProfile *profile;
  void *v39;
  void *v40;
  id v41;
  int64_t v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  HDMCDaySummaryEnumerator *v51;
  uint64_t v52;
  HDMCDaySummaryEnumerator *v53;
  BOOL v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  HDMCDaySummaryEnumerator *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[5];
  id v76;
  id v77;
  _QWORD v78[6];
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id v91;
  char v92[32];
  char v93[32];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v73 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  keyValueDomain = self->_keyValueDomain;
  v91 = 0;
  v69 = v16;
  v70 = v17;
  v71 = v18;
  v74 = v19;
  +[HDMCDailyAnalytics _setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](HDMCDailyAnalytics, "_setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:", v15, keyValueDomain, v16, v17, v18, &v91);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v91;
  if (v21)
  {
    v23 = v21;

    sleepStore = self->_sleepStore;
    v90 = v22;
    -[HKSPSleepStore currentSleepEventRecordWithError:](sleepStore, "currentSleepEventRecordWithError:", &v90);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v90;

    objc_msgSend(v25, "sleepCoachingOnboardingFirstCompletedDate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sleepTrackingOnboardingFirstCompletedDate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    if (v68 && v65)
      v27 = -[HKSPSleepStore hasSleepFocusMode](self->_sleepStore, "hasSleepFocusMode", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIsSleepConfiguredToAllowWristTemperatureMeasurements:", v28);

    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend((id)v29, "hk_morningIndexWithCalendar:", v74);

    v72 = objc_alloc_init(MEMORY[0x24BDD3968]);
    LOBYTE(v63) = 1;
    v67 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", self->_profile, v72, v30 - 45, 45, 1, 0, v63);
    v86 = 0;
    v87 = &v86;
    v88 = 0x2020000000;
    v89 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2;
    v84 = __Block_byref_object_dispose__2;
    v85 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v79 = v26;
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke;
    v78[3] = &unk_24DB21EA0;
    v78[4] = &v86;
    v78[5] = &v80;
    LOBYTE(v29) = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v67, "enumerateWithError:handler:", &v79, v78);
    v31 = v79;

    if ((v29 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v87[3]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDaysWithWristTempInPast45Days:", v32);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)v81[5], "count"));
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCountWatchesWithWristTempMeasurementDataInLast45Days:", v33);
    }
    else
    {
      _HKInitializeLogging();
      v33 = (id)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v36 = (void *)objc_opt_class();
        -[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.2(v36, (uint64_t)v31, (uint64_t)v93);
      }
    }

    v37 = (void *)MEMORY[0x24BE40BC0];
    profile = self->_profile;
    -[HDMCDailyAnalytics _predicateForSleepDataFromPast45DaysWithCalendar:](self, "_predicateForSleepDataFromPast45DaysWithCalendar:", v74);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v31;
    objc_msgSend(v37, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v66, profile, MEMORY[0x24BDBD1B8], v39, 0, 0, &v77);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v77;

    if (objc_msgSend(v40, "count"))
    {
      v42 = -[HDMCDailyAnalytics _daysWithSleepSamples:calendar:](self, "_daysWithSleepSamples:calendar:", v40, v74);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDaysWornWatchToSleepInLast45Days:", v43);

    }
    -[HKMCAnalysis fertileWindowProjections](self->_analysis, "fertileWindowProjections");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count") == 0;

    if (v45)
    {
      v53 = v67;
      v55 = v41;
    }
    else
    {
      -[HKMCAnalysis fertileWindowProjections](self->_analysis, "fertileWindowProjections");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "allDays");
      v50 = v49;

      v51 = [HDMCDaySummaryEnumerator alloc];
      if (v50 <= 0)
        v52 = 0x7FFFFFFFFFFFFFD3;
      else
        v52 = v50 + v48 - 45;
      LOBYTE(v64) = 1;
      v53 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v51, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", self->_profile, v72, v52, 45, 1, 0, v64);

      v87[3] = 0;
      v76 = v41;
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke_201;
      v75[3] = &unk_24DB21EC8;
      v75[4] = &v86;
      v54 = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v53, "enumerateWithError:handler:", &v76, v75);
      v55 = v76;

      if (v54)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v87[3]);
        v56 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDaysWithWristTempIn45DaysBeforeFertileWindowEnd:", v56);
      }
      else
      {
        _HKInitializeLogging();
        v56 = (id)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = (void *)objc_opt_class();
          -[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.1(v57, (uint64_t)v55, (uint64_t)v92);
        }
      }

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v73, "internalCycleFactorsOverrideEnabled"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInternalLiveOnCycleFactorOverrideEnabled:", v58);

    v59 = (void *)MEMORY[0x24BDD16E0];
    -[HDProfile notificationManager](self->_profile, "notificationManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "numberWithBool:", objc_msgSend(v60, "areHealthNotificationsAuthorized"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAreHealthNotificationsAuthorized:", v61);

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v86, 8);

    v15 = v23;
  }
  else
  {
    _HKInitializeLogging();
    v34 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.3(v34, (uint64_t)self, (uint64_t)v22);
    v35 = v22;
    v25 = v35;
    if (v35)
    {
      if (a9)
      {
        v25 = objc_retainAutorelease(v35);
        *a9 = v25;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    v55 = v25;
  }

  return v21 != 0;
}

void __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "wristTemperature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v7, "wristTemperature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "watchBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
}

void __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke_201(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "wristTemperature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (BOOL)_collectSensitiveFieldsForMetric:(id)a3 settingsManager:(id)a4 menstrualCyclesSettings:(id)a5 heartRateInputFeatureStatus:(id)a6 deviationDetectionSettings:(id)a7 wristTemperatureInputFeatureStatus:(id)a8 gregorianCalendar:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  BOOL v33;
  id v34;
  id v35;
  BOOL v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  HDProfile *profile;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  HDProfile *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  HKMCAnalysis *analysis;
  HDKeyValueDomain *keyValueDomain;
  HDKeyValueDomain *fertileWindowNotificationKeyValueDomain;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
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
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  HDProfile *v104;
  void *v105;
  id v106;
  id v107;
  HDKeyValueDomain *deviationDetectionAnalyticsKeyValueDomain;
  void *v109;
  id v110;
  id v111;
  HKMCAnalysis *v112;
  HDKeyValueDomain *appProtectedKeyValueDomain;
  id v114;
  id v115;
  HKSPSleepStore *sleepStore;
  id v117;
  id v118;
  HKSPSleepStore *v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  HKSPSleepStore *v132;
  void *v133;
  id v134;
  void *v135;
  uint64_t v136;
  id v137;
  _UNKNOWN **v138;
  int v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  uint64_t v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  unint64_t v158;
  void *v159;
  NSObject *v160;
  void *v161;
  id v162;
  void *v163;
  HKMCAnalysis *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t i;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  id v182;
  id v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  unint64_t v195;
  uint64_t v196;
  void *v197;
  void *v198;
  HKMCAnalysis *v199;
  HDProfile *v200;
  id v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  unint64_t v207;
  void *v208;
  void *v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *pregnancyManager;
  id v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  id v235;
  void *v236;
  void *v237;
  id v238;
  void *v239;
  void *v240;
  id v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  id v247;
  id v248;
  id v249;
  void *v250;
  void *v251;
  id v252;
  void *v253;
  id v254;
  uint64_t v255;
  id v256;
  id v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  id v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  HDMCDailyAnalytics *v270;
  id v271;
  void *v272;
  id v273;
  void *v274;
  void *v275;
  id v276;
  uint64_t v277;
  id v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288[2];
  id v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  uint8_t v295[128];
  uint8_t buf[4];
  id v297;
  __int16 v298;
  void *v299;
  uint64_t v300;

  v300 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = v16;
  if ((objc_msgSend(v16, "isImproveHealthAndActivityAllowed") & 1) != 0)
  {
    v274 = v21;
    v264 = (id)HKMCTodayIndex();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDProfile deviceContextManager](self->_profile, "deviceContextManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = 0;
    objc_msgSend(v24, "numberOfDeviceContextsPerDeviceType:", &v294);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v294;

    if (v25)
    {
      v269 = v20;
      objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB301C8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB301C8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCountPairediPhone:", v28);

      }
      else
      {
        objc_msgSend(v23, "setCountPairediPhone:", &unk_24DB301E0);
      }

      objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB301F8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB301F8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCountPairediPad:", v39);

      }
      else
      {
        objc_msgSend(v23, "setCountPairediPad:", &unk_24DB301E0);
      }

      objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB30210);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v271 = v22;
      if (v40)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB30210);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCountPairedWatch:", v41);

      }
      else
      {
        objc_msgSend(v23, "setCountPairedWatch:", &unk_24DB301E0);
      }
      v267 = v17;

      objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB30228);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v268 = v19;
      v270 = self;
      v43 = v18;
      if (v42)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24DB30228);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCountPairedVisionPro:", v44);

      }
      else
      {
        objc_msgSend(v23, "setCountPairedVisionPro:", &unk_24DB301E0);
      }

      objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", *MEMORY[0x24BDD2A88]);
      v45 = objc_claimAutoreleasedReturnValue();
      -[HDProfile userCharacteristicsManager](self->_profile, "userCharacteristicsManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v293 = v26;
      v266 = (void *)v45;
      objc_msgSend(v46, "userCharacteristicForType:error:", v45, &v293);
      v47 = objc_claimAutoreleasedReturnValue();
      v37 = v293;

      v272 = (void *)v47;
      if (v47 || !v37)
      {
        if (v47)
        {
          v48 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "_yearsBetweenStartDateComponents:endDate:calendar:", v47, v49, v271);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v50)
          {
            _HKInitializeLogging();
            v51 = (void *)*MEMORY[0x24BDD3030];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
              -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.16(v51);
          }
          objc_msgSend(v23, "setAge:", v50);

        }
        objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", *MEMORY[0x24BDD2A78]);
        v52 = objc_claimAutoreleasedReturnValue();
        -[HDProfile userCharacteristicsManager](self->_profile, "userCharacteristicsManager");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v292 = v37;
        v263 = (void *)v52;
        objc_msgSend(v53, "userCharacteristicForType:error:", v52, &v292);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v292;

        v56 = (void *)v54;
        if (v54 || !v55)
        {
          v261 = (void *)v54;
          v262 = v43;
          objc_msgSend(v23, "setBiologicalSex:", v54);
          objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)MEMORY[0x24BE40BC0];
          profile = self->_profile;
          -[HDMCDailyAnalytics _predicateForSleepDataFromPast48HoursWithCalendar:](self, "_predicateForSleepDataFromPast48HoursWithCalendar:", v271);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v291 = v55;
          objc_msgSend(v58, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v57, profile, MEMORY[0x24BDBD1B8], v60, 0, 0, &v291);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v291;

          v259 = v61;
          v260 = (void *)v57;
          if (v61)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v61, "count") != 0);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setHasSleepSamplesPast48Hours:", v63);

            v64 = (void *)MEMORY[0x24BE40BC0];
            v65 = self->_profile;
            -[HDMCDailyAnalytics _predicateForFirstPartySleepDataFromPast48HoursWithCalendar:](self, "_predicateForFirstPartySleepDataFromPast48HoursWithCalendar:", v271);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v290 = v62;
            objc_msgSend(v64, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v57, v65, MEMORY[0x24BDBD1B8], v66, 0, 0, &v290);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v290;

            v258 = v67;
            if (v67)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v67, "count") != 0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setHasFirstPartySleepSamplesPast48Hours:", v69);

              analysis = self->_analysis;
              keyValueDomain = self->_keyValueDomain;
              fertileWindowNotificationKeyValueDomain = self->_fertileWindowNotificationKeyValueDomain;
              v289 = v68;
              +[HDMCDailyAnalytics _setCycleStatisticsFieldsInMetric:analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:](HDMCDailyAnalytics, "_setCycleStatisticsFieldsInMetric:analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:", v23, analysis, keyValueDomain, fertileWindowNotificationKeyValueDomain, v264, v275, v271, &v289);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = v289;

              v17 = v267;
              v257 = v73;
              if (v73)
              {
                v253 = v74;
                v75 = v73;

                objc_msgSend(v262, "numberForKey:", *MEMORY[0x24BE46840]);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setPeriodPredictionEnabled:", v76);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v267, "menstruationNotificationsEnabled"));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setPeriodNotificationEnabled:", v77);

                objc_msgSend(v262, "numberForKey:", *MEMORY[0x24BE46828]);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setFertilityPredictionEnabled:", v78);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v267, "fertileWindowNotificationsEnabled"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setFertilityNotificationEnabled:", v79);

                objc_msgSend(v268, "onboardingRecord");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "featureSettings");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = *MEMORY[0x24BDD2EB0];
                objc_msgSend(v81, "numberForKey:", *MEMORY[0x24BDD2EB0]);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setSensorBasedPredictionEnabled:", v83);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 1));
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setDeviationDetectionSpottingEnabled:", v84);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 2));
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setDeviationDetectionIrregularEnabled:", v85);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 3));
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setDeviationDetectionInfrequentEnabled:", v86);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 0));
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setDeviationDetectionProlongedEnabled:", v87);

                objc_msgSend(v274, "onboardingRecord");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "featureSettings");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "numberForKey:", v82);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setWristTemperatureBasedPredictionEnabled:", v90);

                v19 = v268;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46920]));
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogFactorsEnabled:", v91);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46960]));
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogSymptomsEnabled:", v92);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46930]));
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogSpottingEnabled:", v93);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46958]));
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogSexualActivityEnabled:", v94);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46918]));
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogCervicalMucusQualityEnabled:", v95);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46900]));
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogBasalBodyTemperatureEnabled:", v96);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46940]));
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogOvulationTestResultEnabled:", v97);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46948]));
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogPregnancyTestResultEnabled:", v98);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x24BE46950]));
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setLogProgesteroneTestResultEnabled:", v99);

                v18 = v262;
                if (objc_msgSend(v268, "isOnboardingRecordPresent"))
                {
                  objc_msgSend(v268, "onboardingRecord");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "onboardingCompletion");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "countryCode");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "setHeartRateInputDeliveryCountryCode:", v102);

                  v19 = v268;
                }
                objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
                v103 = objc_claimAutoreleasedReturnValue();
                v104 = self->_profile;
                v288[1] = v253;
                v252 = (id)v103;
                +[HDMCDailyAnalytics _setDeviationSampleFieldsInMetric:profile:userCalendar:error:](HDMCDailyAnalytics, "_setDeviationSampleFieldsInMetric:profile:userCalendar:error:", v75, v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = v253;

                if (v105)
                {
                  v251 = v105;
                  v107 = v105;

                  deviationDetectionAnalyticsKeyValueDomain = self->_deviationDetectionAnalyticsKeyValueDomain;
                  v288[0] = v106;
                  +[HDMCDailyAnalytics _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:](HDMCDailyAnalytics, "_setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:", v107, v271, deviationDetectionAnalyticsKeyValueDomain, v264, v288);
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  v110 = v288[0];

                  v250 = v109;
                  if (v109)
                  {
                    v111 = v109;

                    v112 = self->_analysis;
                    appProtectedKeyValueDomain = self->_appProtectedKeyValueDomain;
                    v287 = v110;
                    +[HDMCDailyAnalytics _setCycleFactorRelatedFieldsInMetric:analysis:appProtectedKeyValueDomain:error:](HDMCDailyAnalytics, "_setCycleFactorRelatedFieldsInMetric:analysis:appProtectedKeyValueDomain:error:", v111, v112, appProtectedKeyValueDomain, &v287);
                    v114 = (id)objc_claimAutoreleasedReturnValue();
                    v115 = v287;

                    if (v114)
                    {
                      v248 = v114;
                      v249 = v114;

                      sleepStore = self->_sleepStore;
                      v286 = v115;
                      -[HKSPSleepStore currentSleepEventRecordWithError:](sleepStore, "currentSleepEventRecordWithError:", &v286);
                      v117 = (id)objc_claimAutoreleasedReturnValue();
                      v118 = v286;

                      if (v117)
                      {
                        objc_msgSend(v117, "sleepCoachingOnboardingFirstCompletedDate");
                        v247 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v117, "sleepTrackingOnboardingFirstCompletedDate");
                        v246 = (void *)objc_claimAutoreleasedReturnValue();
                        v119 = self->_sleepStore;
                        v285 = v118;
                        -[HKSPSleepStore currentSleepSettingsWithError:](v119, "currentSleepSettingsWithError:", &v285);
                        v120 = (void *)objc_claimAutoreleasedReturnValue();
                        v121 = v285;

                        v244 = v120;
                        if (v120)
                        {
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (objc_msgSend(v120, "sleepModeOptions") >> 14) & 1);
                          v122 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v249, "setIsSleepScreenEnabled:", v122);

                        }
                        else
                        {
                          _HKInitializeLogging();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.15();
                          objc_msgSend(v249, "setIsSleepScreenEnabled:", *MEMORY[0x24BDD2780]);
                        }
                        v132 = self->_sleepStore;
                        v284 = v121;
                        -[HKSPSleepStore currentSleepScheduleWithError:](v132, "currentSleepScheduleWithError:", &v284);
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        v134 = v284;

                        v243 = v133;
                        if (v133)
                        {
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v133, "isEnabled"));
                          v135 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v249, "setIsSleepScheduleEnabled:", v135);

                        }
                        else
                        {
                          _HKInitializeLogging();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.14();
                          objc_msgSend(v249, "setIsSleepScheduleEnabled:", *MEMORY[0x24BDD2780]);
                        }
                        -[HDProfile featureAvailabilityProvidingForFeatureIdentifier:](self->_profile, "featureAvailabilityProvidingForFeatureIdentifier:", *MEMORY[0x24BDD2E88]);
                        v283 = v134;
                        v242 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v242, "featureOnboardingRecordWithError:", &v283);
                        v136 = objc_claimAutoreleasedReturnValue();
                        v137 = v283;

                        v138 = &off_24DB21000;
                        v245 = (void *)v136;
                        if (v136)
                        {
                          v139 = objc_msgSend(v274, "isOnboardingRecordPresent");
                          v241 = v117;
                          v140 = v271;
                          v141 = v249;
                          if (v139)
                          {
                            objc_msgSend(v274, "onboardingRecord");
                            v142 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v142, "onboardingCompletion");
                            v143 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v143, "countryCode");
                            v144 = v137;
                            v145 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v249, "setWristTemperatureInputDeliveryCountryCode:", v145);

                            v137 = v144;
                            v141 = v249;

                            v140 = v271;
                            v19 = v268;
                          }
                          if (v247)
                          {
                            if (v246)
                            {
                              if ((v139 & -[HKSPSleepStore hasSleepFocusMode](self->_sleepStore, "hasSleepFocusMode")) == 1)
                              {
                                objc_msgSend(v245, "onboardingCompletion");
                                v146 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v146)
                                {
                                  objc_msgSend(v245, "onboardingCompletion");
                                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v147, "completionDate");
                                  v148 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (objc_msgSend(v148, "compare:", v246) == -1)
                                    v149 = v246;
                                  else
                                    v149 = v148;
                                  v150 = v149;
                                  v151 = (void *)MEMORY[0x24BDD16E0];
                                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                                  v152 = objc_claimAutoreleasedReturnValue();
                                  v153 = v140;
                                  v154 = v150;
                                  v155 = (void *)v152;
                                  objc_msgSend(v151, "_weeksBetweenStartDate:endDate:calendar:", v154, v152, v153);
                                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v249, "setWeeksSinceOnboardedWristTemperatureOvulationPrediction:", v156);

                                  -[HKMCAnalysis cycles](self->_analysis, "cycles");
                                  v157 = (void *)objc_claimAutoreleasedReturnValue();
                                  v158 = objc_msgSend(v157, "count");

                                  if (v158 >= 2)
                                  {
                                    _HKInitializeLogging();
                                    v159 = (void *)*MEMORY[0x24BDD3030];
                                    v239 = v154;
                                    v240 = v148;
                                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
                                    {
                                      v160 = v159;
                                      v161 = (void *)objc_opt_class();
                                      v162 = v137;
                                      v163 = (void *)MEMORY[0x24BDD16E0];
                                      v164 = self->_analysis;
                                      v254 = v161;
                                      -[HKMCAnalysis cycles](v164, "cycles");
                                      v165 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v163, "numberWithUnsignedInteger:", objc_msgSend(v165, "count"));
                                      v166 = (void *)objc_claimAutoreleasedReturnValue();
                                      *(_DWORD *)buf = 138543618;
                                      v297 = v161;
                                      v298 = 2112;
                                      v299 = v166;
                                      _os_log_impl(&dword_21961B000, v160, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of historical cycles: %@", buf, 0x16u);

                                      v137 = v162;
                                      v154 = v239;

                                      v148 = v240;
                                    }
                                    -[HDMCDailyAnalytics _eligibleCyclesStartPastDayIndex:](self, "_eligibleCyclesStartPastDayIndex:", objc_msgSend(v154, "hk_dayIndexWithCalendar:", v271));
                                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (objc_msgSend(v167, "count"))
                                    {
                                      v237 = v167;
                                      v238 = v137;
                                      v236 = v25;
                                      v281 = 0u;
                                      v282 = 0u;
                                      v279 = 0u;
                                      v280 = 0u;
                                      v168 = v167;
                                      v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v279, v295, 16);
                                      if (v169)
                                      {
                                        v170 = v169;
                                        v171 = 0;
                                        v172 = 0;
                                        v173 = 0;
                                        v174 = 0;
                                        v175 = 0;
                                        v255 = *(_QWORD *)v280;
                                        do
                                        {
                                          for (i = 0; i != v170; ++i)
                                          {
                                            if (*(_QWORD *)v280 != v255)
                                              objc_enumerationMutation(v168);
                                            v177 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * i);
                                            v178 = objc_msgSend(v177, "ovulationConfirmationType");
                                            if (v178 == 1)
                                              v179 = v174 + 1;
                                            else
                                              v179 = v174;
                                            if (v178 == 2)
                                              ++v175;
                                            else
                                              v174 = v179;
                                            v180 = objc_msgSend(v177, "ovulationConfirmationFailure");
                                            switch(v180)
                                            {
                                              case 3:
                                                ++v172;
                                                break;
                                              case 2:
                                                ++v171;
                                                break;
                                              case 1:
                                                ++v173;
                                                break;
                                            }
                                          }
                                          v170 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v279, v295, 16);
                                        }
                                        while (v170);
                                      }
                                      else
                                      {
                                        v171 = 0;
                                        v172 = 0;
                                        v173 = 0;
                                        v174 = 0;
                                        v175 = 0;
                                      }

                                      if (v174 >= 15)
                                        v184 = 15;
                                      else
                                        v184 = v174;
                                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v184);
                                      v185 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_ConfirmedWristTemp:", v185);

                                      if (v175 >= 15)
                                        v186 = 15;
                                      else
                                        v186 = v175;
                                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v186);
                                      v187 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_ConfirmedOPK:", v187);

                                      if (v173 >= 15)
                                        v188 = 15;
                                      else
                                        v188 = v173;
                                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v188);
                                      v189 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_FailedAvailability:", v189);

                                      if (v171 >= 15)
                                        v190 = 15;
                                      else
                                        v190 = v171;
                                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v190);
                                      v191 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_FailedNoise:", v191);

                                      if (v172 >= 15)
                                        v192 = 15;
                                      else
                                        v192 = v172;
                                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v192);
                                      v193 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_FailedOther:", v193);

                                      v194 = (void *)MEMORY[0x24BDD16E0];
                                      v195 = objc_msgSend(v168, "count");
                                      if (v195 >= 0xF)
                                        v196 = 15;
                                      else
                                        v196 = v195;
                                      objc_msgSend(v194, "numberWithUnsignedInteger:", v196);
                                      v197 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles:", v197);

                                      v17 = v267;
                                      v138 = &off_24DB21000;
                                      self = v270;
                                      v25 = v236;
                                      v167 = v237;
                                      v137 = v238;
                                      v154 = v239;
                                      v148 = v240;
                                    }

                                  }
                                  v19 = v268;
                                  v141 = v249;
                                }
                              }
                            }
                          }
                          v198 = v138[9];
                          v200 = self->_profile;
                          v199 = self->_analysis;
                          v278 = v137;
                          objc_msgSend(v198, "_setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:", v141, v199, v200, v264, &v278);
                          v182 = (id)objc_claimAutoreleasedReturnValue();
                          v256 = v278;

                          v36 = v182 != 0;
                          if (v182)
                          {
                            v273 = v182;
                            v201 = v182;

                            -[HKMCAnalysis menstruationProjections](self->_analysis, "menstruationProjections");
                            v202 = (void *)objc_claimAutoreleasedReturnValue();
                            v203 = objc_msgSend(v202, "count");

                            if (v203)
                            {
                              -[HKMCAnalysis menstruationProjections](self->_analysis, "menstruationProjections");
                              v204 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v204, "firstObject");
                              v205 = (void *)objc_claimAutoreleasedReturnValue();

                              if (objc_msgSend(v205, "isPartiallyLogged"))
                              {
                                -[HKMCAnalysis menstruationProjections](self->_analysis, "menstruationProjections");
                                v206 = (void *)objc_claimAutoreleasedReturnValue();
                                v207 = objc_msgSend(v206, "count");

                                v208 = v201;
                                if (v207 >= 2)
                                {
                                  -[HKMCAnalysis menstruationProjections](self->_analysis, "menstruationProjections");
                                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v209, "objectAtIndexedSubscript:", 1);
                                  v210 = objc_claimAutoreleasedReturnValue();

                                  v205 = (void *)v210;
                                }
                              }
                              else
                              {
                                v208 = v201;
                              }
                              v212 = objc_msgSend(v205, "mostLikelyDays") - (_QWORD)v264;
                              v213 = objc_msgSend(v205, "daysOffsetFromCalendarMethod");
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v212);
                              v214 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v208, "setDaysBeforeMostLikelyPeriodPredictionStart:", v214);

                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v213);
                              v215 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v208, "setDaysFirstPeriodPredictionShifted:", v215);

                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v213 != 0);
                              v216 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v208, "setDidFirstPeriodPredictionShift:", v216);

                              objc_msgSend(v205, "predictionPrimarySource");
                              NSStringFromPredictionPrimarySource();
                              v217 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v208, "setPredictionPrimarySourceTypeFirstPeriodPrediction:", v217);

                            }
                            -[HKMCAnalysis cycles](self->_analysis, "cycles");
                            v218 = (void *)objc_claimAutoreleasedReturnValue();
                            v219 = objc_msgSend(v218, "count");

                            if (v219)
                            {
                              v220 = HKMCTodayIndex();
                              -[HKMCAnalysis cycles](self->_analysis, "cycles");
                              v221 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v221, "firstObject");
                              v222 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v222, "menstruationSegment");
                              v223 = (void *)objc_claimAutoreleasedReturnValue();
                              v224 = v220 - objc_msgSend(v223, "days");

                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v224);
                              v225 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v201, "setDaysSinceCycleStart:", v225);

                            }
                            objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
                            v265 = (id)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v265, "getActivePairedDevice");
                            v226 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v226, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
                            v227 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v201, "setActiveWatchProductType:", v227);

                            pregnancyManager = self->_pregnancyManager;
                            v277 = 0;
                            +[HDMCDailyAnalytics _setPregnancyPropertiesInMetric:manager:todayAsDate:gregorianCalendar:error:](HDMCDailyAnalytics, "_setPregnancyPropertiesInMetric:manager:todayAsDate:gregorianCalendar:error:", v201, pregnancyManager, v275, v271, &v277);
                            v229 = (id)objc_claimAutoreleasedReturnValue();

                            -[HDProfile medicalIDDataManager](self->_profile, "medicalIDDataManager");
                            v230 = (void *)objc_claimAutoreleasedReturnValue();
                            v276 = 0;
                            objc_msgSend(v230, "fetchMedicalIDIfSetUpWithError:", &v276);
                            v231 = (void *)objc_claimAutoreleasedReturnValue();
                            v55 = v276;

                            if (v231)
                            {
                              objc_msgSend(v231, "pregnancyEstimatedDueDate");
                              v232 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v232 != 0);
                              v233 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v229, "setHasPregnancyInMedicalID:", v233);

                            }
                            else
                            {
                              if (v55)
                              {
                                _HKInitializeLogging();
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                                  -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.12();
                              }
                              objc_msgSend(v229, "setHasPregnancyInMedicalID:", MEMORY[0x24BDBD1C0]);
                            }
                            v19 = v268;

                            v249 = v229;
                            v35 = v266;
                            v17 = v267;
                            v18 = v262;
                            v182 = v273;
                            v211 = v265;
                          }
                          else
                          {
                            _HKInitializeLogging();
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                              -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.13();
                            v211 = v256;
                            if (v211)
                            {
                              v35 = v266;
                              if (a10)
                              {
                                v211 = objc_retainAutorelease(v211);
                                *a10 = v211;
                                v55 = v211;
                              }
                              else
                              {
                                v235 = v211;
                                _HKLogDroppedError();
                                v211 = v235;
                                v55 = v235;
                              }
                            }
                            else
                            {
                              v55 = 0;
                              v35 = v266;
                            }
                          }

                          v114 = v248;
                          v117 = v241;
                        }
                        else
                        {
                          _HKInitializeLogging();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.11();
                          v181 = v137;
                          v182 = v181;
                          if (v181)
                          {
                            v35 = v266;
                            if (a10)
                            {
                              v182 = objc_retainAutorelease(v181);
                              v36 = 0;
                              *a10 = v182;
                            }
                            else
                            {
                              _HKLogDroppedError();
                              v36 = 0;
                            }
                            v55 = v182;
                          }
                          else
                          {
                            v36 = 0;
                            v55 = 0;
                            v35 = v266;
                          }
                          v114 = v248;
                        }

                        v131 = v247;
                      }
                      else
                      {
                        _HKInitializeLogging();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                          -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.10();
                        v131 = v118;
                        if (v131)
                        {
                          v35 = v266;
                          if (a10)
                          {
                            v131 = objc_retainAutorelease(v131);
                            v36 = 0;
                            *a10 = v131;
                            v55 = v131;
                          }
                          else
                          {
                            v183 = v131;
                            _HKLogDroppedError();
                            v131 = v183;
                            v36 = 0;
                            v55 = v183;
                          }
                        }
                        else
                        {
                          v36 = 0;
                          v55 = 0;
                          v35 = v266;
                        }
                        v114 = v248;
                      }

                      v107 = v249;
                    }
                    else
                    {
                      _HKInitializeLogging();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                        -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.9();
                      v130 = v115;
                      if (v130)
                      {
                        v35 = v266;
                        v107 = v111;
                        if (a10)
                        {
                          v117 = objc_retainAutorelease(v130);
                          v36 = 0;
                          *a10 = v117;
                        }
                        else
                        {
                          v117 = v130;
                          _HKLogDroppedError();
                          v36 = 0;
                        }
                        v55 = v117;
                      }
                      else
                      {
                        v36 = 0;
                        v55 = 0;
                        v35 = v266;
                        v107 = v111;
                        v117 = 0;
                      }
                    }

                  }
                  else
                  {
                    _HKInitializeLogging();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                      -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.8();
                    v128 = v110;
                    v114 = v128;
                    if (v128)
                    {
                      v35 = v266;
                      if (a10)
                      {
                        v129 = objc_retainAutorelease(v128);
                        v36 = 0;
                        *a10 = v129;
                        v114 = v129;
                        v55 = v129;
                      }
                      else
                      {
                        v114 = v128;
                        _HKLogDroppedError();
                        v36 = 0;
                        v55 = v114;
                      }
                    }
                    else
                    {
                      v36 = 0;
                      v55 = 0;
                      v35 = v266;
                    }
                  }

                  v75 = v107;
                  v127 = v250;
                  v105 = v251;
                }
                else
                {
                  _HKInitializeLogging();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                    -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.7();
                  v127 = v106;
                  if (v127)
                  {
                    v35 = v266;
                    if (a10)
                    {
                      v127 = objc_retainAutorelease(v127);
                      v36 = 0;
                      *a10 = v127;
                      v55 = v127;
                    }
                    else
                    {
                      v55 = v127;
                      _HKLogDroppedError();
                      v127 = v55;
                      v36 = 0;
                    }
                  }
                  else
                  {
                    v36 = 0;
                    v55 = 0;
                    v35 = v266;
                  }
                }

                v23 = v75;
                v56 = v261;
                v126 = v252;
                v22 = v271;
              }
              else
              {
                v22 = v271;
                v18 = v262;
                _HKInitializeLogging();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                  -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.6();
                v126 = v74;
                v19 = v268;
                if (v126)
                {
                  v35 = v266;
                  v56 = v261;
                  if (a10)
                  {
                    v126 = objc_retainAutorelease(v126);
                    v36 = 0;
                    *a10 = v126;
                    v55 = v126;
                  }
                  else
                  {
                    v55 = v126;
                    _HKLogDroppedError();
                    v126 = v55;
                    v36 = 0;
                  }
                }
                else
                {
                  v36 = 0;
                  v55 = 0;
                  v35 = v266;
                  v56 = v261;
                }
              }

              v125 = v257;
            }
            else
            {
              _HKInitializeLogging();
              v17 = v267;
              v18 = v262;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
                -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.5();
              v124 = v68;
              v55 = v124;
              v19 = v268;
              v22 = v271;
              if (v124)
              {
                v35 = v266;
                v56 = v261;
                if (a10)
                {
                  v125 = objc_retainAutorelease(v124);
                  v36 = 0;
                  *a10 = v125;
                  v55 = v125;
                }
                else
                {
                  _HKLogDroppedError();
                  v36 = 0;
                  v125 = v55;
                }
              }
              else
              {
                v36 = 0;
                v125 = 0;
                v35 = v266;
                v56 = v261;
              }
            }

            v123 = v258;
          }
          else
          {
            _HKInitializeLogging();
            v19 = v268;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
              -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.4();
            v123 = v62;
            v17 = v267;
            v18 = v262;
            v22 = v271;
            if (v123)
            {
              v35 = v266;
              v56 = v261;
              if (a10)
              {
                v123 = objc_retainAutorelease(v123);
                v36 = 0;
                *a10 = v123;
                v55 = v123;
              }
              else
              {
                v55 = v123;
                _HKLogDroppedError();
                v123 = v55;
                v36 = 0;
              }
            }
            else
            {
              v36 = 0;
              v55 = 0;
              v35 = v266;
              v56 = v261;
            }
          }

        }
        else
        {
          _HKInitializeLogging();
          v22 = v271;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.3();
          v19 = v268;
          v18 = v43;
          if (a10)
          {
            v55 = objc_retainAutorelease(v55);
            v36 = 0;
            *a10 = v55;
          }
          else
          {
            _HKLogDroppedError();
            v36 = 0;
          }
          v35 = v266;
          v17 = v267;
        }

        v37 = v55;
        v20 = v269;
      }
      else
      {
        _HKInitializeLogging();
        v20 = v269;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.2();
        if (a10)
        {
          v37 = objc_retainAutorelease(v37);
          v36 = 0;
          *a10 = v37;
        }
        else
        {
          _HKLogDroppedError();
          v36 = 0;
        }
        v18 = v43;
        v35 = v266;
        v17 = v267;
      }

      goto LABEL_213;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3068], OS_LOG_TYPE_ERROR))
      -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.1();
    v34 = v26;
    v35 = v34;
    if (v34)
    {
      if (a10)
      {
        v35 = objc_retainAutorelease(v34);
        v36 = 0;
        *a10 = v35;
        v37 = v35;
LABEL_213:

        v21 = v274;
        v33 = v36;
        goto LABEL_214;
      }
      _HKLogDroppedError();
    }
    v36 = 0;
    v37 = v35;
    goto LABEL_213;
  }
  v29 = v22;
  _HKInitializeLogging();
  v30 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    *(_DWORD *)buf = 138543362;
    v297 = (id)objc_opt_class();
    v32 = v297;
    _os_log_impl(&dword_21961B000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);

  }
  v33 = 1;
  v22 = v29;
LABEL_214:

  return v33;
}

- (id)_eligibleCyclesStartPastDayIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[HKMCAnalysis cycles](self->_analysis, "cycles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__HDMCDailyAnalytics__eligibleCyclesStartPastDayIndex___block_invoke;
  v8[3] = &unk_24DB21EF0;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v5, "hk_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__HDMCDailyAnalytics__eligibleCyclesStartPastDayIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "lastDayIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "lastDayIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cycles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v8) & 1) != 0)
    {

    }
    else
    {
      v9 = *(_QWORD *)(a1 + 40);

      if (v9 <= v6)
      {
        v10 = v3;
        goto LABEL_6;
      }
    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (int64_t)_daysWithSleepSamples:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "startDate", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hk_morningIndexWithCalendar:", v6);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = objc_msgSend(v7, "count");
  return v16;
}

- (id)_predicateForSleepDataFromPast45DaysWithCalendar:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD3990];
  v4 = *MEMORY[0x24BDD2A28];
  v5 = a3;
  objc_msgSend(v3, "categoryTypeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hk_morningIndexWithCalendar:", v5);

  objc_msgSend(MEMORY[0x24BDBCE60], "hk_sleepDayStartForMorningIndex:calendar:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_sleepDayStartForMorningIndex:calendar:", v8 - 46, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v10, v9);
  HDSampleEntityPredicateForDateInterval();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _HKCategoryValueSleepAnalysisAsleepValues();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDCategorySampleEntityPredicateEqualToValues();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BE40E20];
  v20[0] = v12;
  HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  v20[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v17, v20[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_predicateForSleepDataFromPast48HoursWithCalendar:(id)a3
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
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -172800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v5, v4);
  HDSampleEntityPredicateForDateInterval();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HKCategoryValueSleepAnalysisAsleepValues();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDCategorySampleEntityPredicateEqualToValues();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE40E20];
  v14[0] = v7;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_predicateForFirstPartySleepDataFromPast48HoursWithCalendar:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  -[HDMCDailyAnalytics _predicateForSleepDataFromPast48HoursWithCalendar:](self, "_predicateForSleepDataFromPast48HoursWithCalendar:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE40E20];
  v9[0] = v3;
  HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingAllPredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_pregnancyManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_appProtectedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_deviationDetectionAnalyticsKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_deviationDetectionFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_fertileWindowNotificationKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

+ (id)_setFertileWindowFieldsInMetric:(id)a3 analysis:(id)a4 profile:(id)a5 todayDayIndex:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id *v53;
  void *v55;
  id *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(v13, "fertileWindowProjections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v57 = a1;
    objc_msgSend(v13, "fertileWindowProjections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "allDays");
    if (v20 <= 0)
      v21 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v21 = v20 + v19 - 1;

    v22 = v21 - a6;
    objc_msgSend(v13, "fertileWindowProjections");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "daysOffsetFromCalendarMethod");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDaysBeforeFertileWindowEnd:", v26);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDaysFertileWindowShifted:", v27);

    objc_msgSend(v13, "fertileWindowProjections");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "predictionPrimarySource");
    NSStringFromPredictionPrimarySource();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredictionPrimarySourceTypeFertileWindow:", v30);

    objc_msgSend(v13, "fertileWindowProjections");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "allDays");
    v35 = v34 + v33 - 1;
    if (v34 <= 0)
      v35 = 0x7FFFFFFFFFFFFFFFLL;
    v36 = v35 - v25;

    v37 = objc_alloc_init(MEMORY[0x24BDD3968]);
    if (v36 >= a6)
    {
      v45 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v56 = a7;
    v62 = 0;
    objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 - 5, 6, v14, v37, &v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v62;
    if (!v38)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.1();
      v47 = v39;
      v38 = v47;
      if (v47)
      {
        if (v56)
          *v56 = objc_retainAutorelease(v47);
        else
          _HKLogDroppedError();
      }
      v45 = v38;
      goto LABEL_57;
    }
    objc_msgSend(v12, "setDaysWithWristTempIn6DaysBeforeCalendarOvulation:", v38);
    v61 = v39;
    objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 - 9, 10, v14, v37, &v61);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v61;

    v42 = (void *)v40;
    if (!v40)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.2();
      v48 = v41;
      v45 = v48;
      if (!v48)
        goto LABEL_56;
      if (!v56)
        goto LABEL_53;
      v45 = objc_retainAutorelease(v48);
      *v56 = v45;
LABEL_56:

LABEL_57:
      v46 = 0;
      goto LABEL_58;
    }
    v55 = (void *)v40;
    objc_msgSend(v12, "setDaysWithWristTempIn10DaysBeforeCalendarOvulation:", v40);
    if (v36 + 3 >= a6)
    {
      v44 = v41;
    }
    else
    {
      v60 = v41;
      objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 + 1, 3, v14, v37, &v60);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v60;

      if (!v43)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.3();
        v52 = v44;
        v45 = v52;
        if (v52)
        {
          if (v56)
          {
            v45 = objc_retainAutorelease(v52);
            *v56 = v45;
          }
          else
          {
            _HKLogDroppedError();
          }
        }
        v42 = v55;
        goto LABEL_56;
      }
      objc_msgSend(v12, "setDaysWithWristTempIn3DaysAfterCalendarOvulation:", v43);

    }
    if (v36 + 6 >= a6)
    {
      v50 = v44;
    }
    else
    {
      v59 = v44;
      objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 + 1, 6, v14, v37, &v59);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v59;

      if (!v49)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.4();
        v45 = v50;
        v42 = v55;
        v53 = v56;
        if (!v45)
          goto LABEL_56;
        if (!v56)
          goto LABEL_53;
LABEL_48:
        v45 = objc_retainAutorelease(v45);
        *v53 = v45;
        goto LABEL_56;
      }
      objc_msgSend(v12, "setDaysWithWristTempIn6DaysAfterCalendarOvulation:", v49);

    }
    v42 = v55;
    if (v36 + 10 >= a6)
    {
      v45 = v50;
      goto LABEL_36;
    }
    v58 = v50;
    objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 + 1, 10, v14, v37, &v58);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v58;

    if (v51)
    {
      objc_msgSend(v12, "setDaysWithWristTempIn10DaysAfterOvulation:", v51);

LABEL_36:
      goto LABEL_15;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.5();
    v45 = v45;
    v53 = v56;
    if (!v45)
      goto LABEL_56;
    if (!v56)
    {
LABEL_53:
      _HKLogDroppedError();
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  v45 = 0;
LABEL_16:
  v46 = v12;
LABEL_58:

  return v46;
}

+ (id)_setCycleStatisticsFieldsInMetric:(id)a3 analysis:(id)a4 keyValueDomain:(id)a5 fertileWindowNotificationKeyValueDomain:(id)a6 todayDayIndex:(int64_t)a7 todayAsDate:(id)a8 gregorianCalendar:(id)a9 error:(id *)a10
{
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  id v54;
  id v56;
  id v57;
  id v58;
  id v59;

  v14 = a10;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v57 = a8;
  v19 = a9;
  objc_msgSend(v16, "statistics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cycleLengthMedian");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && (objc_msgSend(v21, "doubleValue"), v22 > 0.0))
  {
    v23 = v22;
    v54 = v18;
    objc_msgSend(v16, "lastLoggedDayIndex");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v16, "lastLoggedDayIndex");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(a7 - v26) / v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNumberOfCyclesSinceLastDayOfLogging:", v27);

    }
    v59 = 0;
    objc_msgSend(v17, "hdmc_lastLoggedInCycleTrackingDateWithError:", &v59);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v59;
    v30 = v29;
    if (!v28 && v29)
    {
      _HKInitializeLogging();
      v31 = v54;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Analysis) _setCycleStatisticsFieldsInMetric:analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:].cold.2();
        if (a10)
          goto LABEL_9;
      }
      else if (a10)
      {
LABEL_9:
        v30 = objc_retainAutorelease(v30);
        v14 = 0;
        *a10 = v30;
        goto LABEL_22;
      }
      _HKLogDroppedError();
      goto LABEL_22;
    }
    if (v28)
    {
      objc_msgSend(v19, "components:fromDate:toDate:options:", 16, v28, v57, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)objc_msgSend(v40, "day") / v23);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setNumberOfCyclesSinceLastDayOfLoggingInCycleTracking:", v42);

        v14 = a10;
      }

    }
    v43 = v14;
    v56 = v17;
    objc_msgSend(v16, "statistics");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "cycleLengthLowerPercentile");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v46 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v45, "doubleValue");
      objc_msgSend(v46, "numberWithDouble:", v47 / v23);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCycleLengthVariationLowerPercentile:", v48);

    }
    objc_msgSend(v16, "statistics");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "cycleLengthUpperPercentile");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v50, "doubleValue");
      objc_msgSend(v51, "numberWithDouble:", v52 / v23);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCycleLengthVariationUpperPercentile:", v53);

    }
    v18 = v54;
    v14 = v43;
  }
  else
  {
    v56 = v17;
    v30 = 0;
  }
  v32 = v30;
  v58 = v30;
  v31 = v18;
  objc_msgSend(v18, "hdmc_updatedFertileWindowNotificationFireDateWithError:", &v58);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v58;

  if (v33 || !v30)
  {
    if (v33)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7 - objc_msgSend(v33, "hk_dayIndexWithCalendar:", v19));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNumberOfDaysSinceLastFiredUpdateFertileWindowNotification:", v36);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "numberOfDailySleepHeartRateStatisticsForPast100Days"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfDailySleepHeartRateStatisticsForPast100Days:", v37);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "numberOfDailyAwakeHeartRateStatisticsForPast100Days"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfDailyAwakeHeartRateStatisticsForPast100Days:", v38);

    v14 = (id *)v15;
    v17 = v56;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCDailyAnalytics(Analysis) _setCycleStatisticsFieldsInMetric:analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:].cold.1();
    v17 = v56;
    if (v14)
    {
      v34 = objc_retainAutorelease(v30);
      v35 = v14;
      v14 = 0;
      *v35 = v34;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

LABEL_22:
  return v14;
}

+ (id)_setPregnancyPropertiesInMetric:(id)a3 manager:(id)a4 todayAsDate:(id)a5 gregorianCalendar:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a4, "getCurrentPregnancyModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "state"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPregnancyModeState:", v15);

    objc_msgSend(v14, "sample");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD3CA8];
      objc_msgSend(v14, "sample");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "gestationalAgeInComponentsOnDate:pregnancyStartDate:startTimeZoneName:", v11, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v22, "weekOfMonth"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGestationalAge:", v23);

    }
    objc_msgSend(v14, "educationalStepsCompletedDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24 != 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHasOnboardedPregnancyMode:", v25);

    if (v24)
    {
      objc_msgSend(v14, "educationalStepsCompletedDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:toDate:options:", 0x2000, v26, v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v28, "weekOfYear"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWeeksSinceOnboardedPregnancyMode:", v29);

    }
  }
  else
  {
    _HKInitializeLogging();
    v30 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      *(_DWORD *)v34 = 138543362;
      *(_QWORD *)&v34[4] = objc_opt_class();
      v32 = *(id *)&v34[4];
      _os_log_impl(&dword_21961B000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] PregnancyProvider could not return a pregnancyModel", v34, 0xCu);

    }
    objc_msgSend(v10, "setHasOnboardedPregnancyMode:", MEMORY[0x24BDBD1C0], *(_OWORD *)v34);
  }

  return v10;
}

+ (id)_daysWithWristTemperatureSamplesInDayIndexRange:(id)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  int64_t var1;
  int64_t var0;
  id v10;
  id v11;
  HDMCDaySummaryEnumerator *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a4;
  v11 = a5;
  LOBYTE(v20) = 1;
  v12 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v10, v11, var0, var1, 1, 0, v20);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21[4] = &v23;
  v22 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __108__HDMCDailyAnalytics_Analysis___daysWithWristTemperatureSamplesInDayIndexRange_profile_calendarCache_error___block_invoke;
  v21[3] = &unk_24DB21EC8;
  v13 = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v12, "enumerateWithError:handler:", &v22, v21);
  v14 = v22;
  v15 = v14;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24[3]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v14;
    v18 = v17;
    if (v17)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __108__HDMCDailyAnalytics_Analysis___daysWithWristTemperatureSamplesInDayIndexRange_profile_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "wristTemperature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)submitMetricWithError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature settings for menstrual cycles: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)submitMetricWithError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature status for prediction improvements: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)submitMetricWithError:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature status for deviation detection: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)submitMetricWithError:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature status for wrist temperature input: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectDiagnosticFieldsForMetric:(uint64_t)a3 settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_3_1(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v4, v5, "[%{public}@] Error computing days with wrist temperature samples 45 days before fertile window end: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_collectDiagnosticFieldsForMetric:(uint64_t)a3 settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_3_1(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_21961B000, v4, v5, "[%{public}@] Error computing days with wrist temperature samples 45 days before now and different bundle identifiers within the past 45 days: %{public}@");

  OUTLINED_FUNCTION_6();
}

- (void)_collectDiagnosticFieldsForMetric:(uint64_t)a3 settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;

  v4 = OUTLINED_FUNCTION_4(a1);
  objc_opt_class();
  OUTLINED_FUNCTION_10_0();
  v9 = a3;
  v6 = v5;
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v4, v7, "[%{public}@] Error retrieving diagnostic onboarding metrics: %{public}@", v8);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10_0();
  v3 = v0;
  OUTLINED_FUNCTION_2_0(&dword_21961B000, v1, (uint64_t)v1, "%{public}@: Failed to get device contexts dictionary for HealthMenstrualCycles daily analytics: %{public}@", v2);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Failed to read date of birth with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Failed to read biological sex with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Failed to read anySleepSamplesPast48Hours with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Failed to read firstPartySleepSamplesPast48Hours with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Failed to set statistics and Heart Rate fields with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.7()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving deviation sample metrics: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.8()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving deviation detected metrics: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.9()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error setting cycle factor reminder metrics: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.10()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving sleep event record: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.11()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature status for sleeping wrist temperature: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.12()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving medical ID data: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.13()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error setting fertile window fields in metric: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.14()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving sleep screen enabled status: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.15()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving current sleep settings: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_collectSensitiveFieldsForMetric:(void *)a1 settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.16(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;

  v1 = OUTLINED_FUNCTION_4(a1);
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_21961B000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to convert date of birth to a date", (uint8_t *)&v3, 0xCu);

}

@end
