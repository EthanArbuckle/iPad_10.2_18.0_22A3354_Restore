@implementation HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource

- (HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource)initWithProfile:(id)a3
{
  id v4;
  HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *v5;
  HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource;
  v5 = -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)activePairedWatchTypeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE46D88], "activeWatchProductType", a3);
}

- (id)ageWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMobilityAnalyticsUtilities ageWithProfile:date:error:](HDMobilityAnalyticsUtilities, "ageWithProfile:date:error:", WeakRetained, v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)biologicalSexWithError:(id *)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDMobilityAnalyticsUtilities biologicalSexWithProfile:error:](HDMobilityAnalyticsUtilities, "biologicalSexWithProfile:error:", WeakRetained, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hasHeightWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x24BDD3E80]);
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x24BDD35D0]);
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _hasSampleWithType:error:](self, "_hasSampleWithType:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)numberOfDaysSinceLastWalkingSteadinessMeasurementWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  HKMobilityWalkingSteadinessType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _numberOfDaysSinceLastSampleWithSampleType:predicate:error:](self, "_numberOfDaysSinceLastSampleWithSampleType:predicate:error:", v5, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
  {
    if (objc_msgSend(v6, "integerValue") <= 85)
      v8 = v6;
    else
      v8 = &unk_24D4E2290;
  }
  else if (v7)
  {
    if (a3)
    {
      v8 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v8 = 0;
    }
  }
  else
  {
    v8 = &unk_24D4E2278;
  }

  return v8;
}

- (id)numberOfLowNotificationsInPastYearWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfCategorySamplesInPastYearWithType:values:error:](self, "_countOfCategorySamplesInPastYearWithType:values:error:", v5, &unk_24D4E2370, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberOfRepeatLowNotificationsInPastYearWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfCategorySamplesInPastYearWithType:values:error:](self, "_countOfCategorySamplesInPastYearWithType:values:error:", v5, &unk_24D4E2388, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberOfVeryLowNotificationsInPastYearWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfCategorySamplesInPastYearWithType:values:error:](self, "_countOfCategorySamplesInPastYearWithType:values:error:", v5, &unk_24D4E23A0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberOfRepeatVeryLowNotificationsInPastYearWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfCategorySamplesInPastYearWithType:values:error:](self, "_countOfCategorySamplesInPastYearWithType:values:error:", v5, &unk_24D4E23B8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberOfInitialNotificationsInPastYearWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfCategorySamplesInPastYearWithType:values:error:](self, "_countOfCategorySamplesInPastYearWithType:values:error:", v5, &unk_24D4E23D0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)daysSinceLastRepeatNotificationWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _numberOfDaysSinceLastCategorySampleWithSampleType:values:error:](self, "_numberOfDaysSinceLastCategorySampleWithSampleType:values:error:", v5, &unk_24D4E23E8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)daysSinceLastInitialNotificationWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _numberOfDaysSinceLastCategorySampleWithSampleType:values:error:](self, "_numberOfDaysSinceLastCategorySampleWithSampleType:values:error:", v5, &unk_24D4E2400, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentWalkingSteadinessClassificationWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  HKQuantity *v12;
  NSError *v13;
  void *v14;
  NSError *v16;
  NSError *v17;
  NSError *errorOut;
  HKAppleWalkingSteadinessClassification classificationOut;
  id v20;

  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource hasWalkingSteadinessMeasurementsWithError:](self, "hasWalkingSteadinessMeasurementsWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
    return 0;
  HKMobilityWalkingSteadinessType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v20 = 0;
  objc_msgSend(v8, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v7, WeakRetained, 0, 0, 0, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (!v10)
  {
    v16 = (NSError *)v11;
    v13 = v16;
    if (v16)
    {
      if (a3)
      {
        v13 = objc_retainAutorelease(v16);
        v14 = 0;
        *a3 = v13;
        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  classificationOut = 0;
  objc_msgSend(v10, "quantity");
  v12 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  errorOut = 0;
  HKAppleWalkingSteadinessClassificationForQuantity(v12, &classificationOut, &errorOut);
  v13 = errorOut;

  if (!classificationOut)
  {
    v17 = v13;
    if (v17)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BE46DA8], "payloadStringForWalkingSteadinessClassification:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v14;
}

- (id)previousWalkingSteadinessClassificationWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  HDProfile **p_profile;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  HKQuantity *v19;
  NSError *v20;
  void *v21;
  id v23;
  NSError *v24;
  NSError *v25;
  NSError *v26;
  HKAppleWalkingSteadinessClassification classificationOut;
  id v28;
  id v29;

  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource hasWalkingSteadinessMeasurementsWithError:](self, "hasWalkingSteadinessMeasurementsWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
    return 0;
  HKMobilityWalkingSteadinessType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE40BC0];
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v29 = 0;
  objc_msgSend(v8, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v7, WeakRetained, 0, 0, 0, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;

  if (v11)
  {
    objc_msgSend(v11, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BE40BC0];
    v16 = objc_loadWeakRetained((id *)p_profile);
    v28 = 0;
    objc_msgSend(v15, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v7, v16, 0, v14, 0, &v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v28;

    if (v17)
    {
      classificationOut = 0;
      objc_msgSend(v17, "quantity");
      v19 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      HKAppleWalkingSteadinessClassificationForQuantity(v19, &classificationOut, &v26);
      v20 = v26;

      if (classificationOut)
      {
        objc_msgSend(MEMORY[0x24BE46DA8], "payloadStringForWalkingSteadinessClassification:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      v25 = v20;
      if (v25)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v25);
        else
          _HKLogDroppedError();
      }

    }
    else
    {
      v24 = (NSError *)v18;
      v20 = v24;
      if (v24)
      {
        if (a3)
        {
          v20 = objc_retainAutorelease(v24);
          v21 = 0;
          *a3 = v20;
          goto LABEL_22;
        }
        _HKLogDroppedError();
      }
    }
    v21 = 0;
    goto LABEL_22;
  }
  v23 = v12;
  v18 = v23;
  if (!v23)
    goto LABEL_17;
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_17:
    v21 = 0;
    goto LABEL_23;
  }
  v18 = objc_retainAutorelease(v23);
  v21 = 0;
  *a3 = v18;
LABEL_23:

  return v21;
}

- (id)hasWalkingSteadinessMeasurementsWithError:(id *)a3
{
  void *v5;
  void *v6;

  HKMobilityWalkingSteadinessType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _hasSampleWithType:error:](self, "_hasSampleWithType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)walkingSteadinessNotificationsEnabledWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureSettingsForFeatureIdentifier:error:", *MEMORY[0x24BDD2EA0], a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "numberForKey:", *MEMORY[0x24BDD2EB0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource walkingSteadinessNotificationsEnabledWithError:].cold.1((uint64_t)self, (uint64_t *)a3, v9);
    v8 = 0;
  }

  return v8;
}

- (id)areHealthNotificationsAuthorizedWithError:(id *)a3
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "areHealthNotificationsAuthorized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_samplePredicateForPastYearFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 4, -1, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE40E20];
  HDSampleEntityPredicateForStartDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  HDSampleEntityPredicateForStartDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_categoryValuePredicateWithValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "hk_map:", &__block_literal_global_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40E20], "predicateMatchingAnyPredicates:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __94__HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource__categoryValuePredicateWithValues___block_invoke()
{
  return HDCategorySampleEntityPredicateForValue();
}

- (id)_countOfCategorySamplesInPastYearWithType:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _categoryValuePredicateWithValues:](self, "_categoryValuePredicateWithValues:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfSamplesInPastYearWithType:valuePredicate:error:](self, "_countOfSamplesInPastYearWithType:valuePredicate:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_countOfSamplesInPastYearWithType:(id)a3 valuePredicate:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDBCEB8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _samplePredicateForPastYearFromDate:](self, "_samplePredicateForPastYearFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  if (v8)
    objc_msgSend(v11, "addObject:", v8);
  objc_msgSend(MEMORY[0x24BE40E20], "predicateMatchingAllPredicates:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _countOfSamplesWithType:predicate:error:](self, "_countOfSamplesWithType:predicate:error:", v10, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_countOfSamplesWithType:(id)a3 predicate:(id)a4 error:(id *)a5
{
  void *v7;
  HDProfile **p_profile;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;

  v7 = (void *)MEMORY[0x24BE40BC0];
  p_profile = &self->_profile;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  v12 = objc_msgSend(v7, "countOfSamplesWithType:profile:matchingPredicate:withError:", v10, WeakRetained, v9, a5);

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
}

- (id)_numberOfDaysSinceLastSampleWithSampleType:(id)a3 predicate:(id)a4 error:(id *)a5
{
  void *v7;
  HDProfile **p_profile;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v7 = (void *)MEMORY[0x24BE40BC0];
  p_profile = &self->_profile;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  v20 = 0;
  objc_msgSend(v7, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v10, WeakRetained, 0, v9, 0, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v20;
  if (!v12)
  {
    v14 = v13;
    v15 = v14;
    if (v14)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v14);
        v16 = 0;
        *a5 = v15;
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    v16 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v12, "hasUndeterminedDuration") & 1) != 0)
    objc_msgSend(v12, "startDate");
  else
    objc_msgSend(v12, "endDate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BE46D88];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberOfDaysBetweenStartDate:endDate:", v15, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v16;
}

- (id)_numberOfDaysSinceLastCategorySampleWithSampleType:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _categoryValuePredicateWithValues:](self, "_categoryValuePredicateWithValues:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _numberOfDaysSinceLastSampleWithSampleType:predicate:error:](self, "_numberOfDaysSinceLastSampleWithSampleType:predicate:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_hasSampleWithType:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v10 = 0;
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _numberOfDaysSinceLastSampleWithSampleType:predicate:error:](self, "_numberOfDaysSinceLastSampleWithSampleType:predicate:error:", a3, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x24BDBD1C8];
  }
  else if (v6)
  {
    if (a4)
    {
      v8 = 0;
      *a4 = objc_retainAutorelease(v6);
    }
    else
    {
      _HKLogDroppedError();
      v8 = 0;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v8;
}

- (id)_hasLaunchedHealthAppInLastWeekWithError:(id *)a3
{
  return -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _hasLaunchedHealthAppInLastTimeInterval:error:](self, "_hasLaunchedHealthAppInLastTimeInterval:error:", a3, 604800.0);
}

- (id)_hasLaunchedHealthAppInLastMonthWithError:(id *)a3
{
  return -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _hasLaunchedHealthAppInLastTimeInterval:error:](self, "_hasLaunchedHealthAppInLastTimeInterval:error:", a3, 2592000.0);
}

- (id)_hasLaunchedHealthAppInLastTimeInterval:(double)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  id v14;
  id v16;

  v16 = 0;
  -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource _healthAppLastOpenedDateWithError:](self, "_healthAppLastOpenedDateWithError:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v11 = v10;

    v12 = v11 >= 0.0 && v11 < a3;
    v13 = (void *)MEMORY[0x24BDBD1C0];
    if (v12)
      v13 = (void *)MEMORY[0x24BDBD1C8];
    v14 = v13;
  }
  else if (v7)
  {
    if (a4)
    {
      v14 = 0;
      *a4 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }
  else
  {
    v14 = (id)MEMORY[0x24BDBD1C0];
  }

  return v14;
}

- (id)_healthAppLastOpenedDateWithError:(id *)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x24BDD45F0]);
  objc_msgSend(v4, "hk_dateForKey:", *MEMORY[0x24BDD45F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)walkingSteadinessNotificationsEnabledWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_2160FB000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to retrieve feature settings due to error %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
