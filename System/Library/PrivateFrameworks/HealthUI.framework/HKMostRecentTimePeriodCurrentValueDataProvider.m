@implementation HKMostRecentTimePeriodCurrentValueDataProvider

- (id)fetchOperationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKHealthQueryFetchOperation *v11;
  HKHealthQueryFetchOperation *v12;
  void *v13;
  void *v14;
  HKHealthQueryFetchOperation *v15;
  _QWORD v17[4];
  HKHealthQueryFetchOperation *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKValueDataProvider healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HKValueDataProvider displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("MostRecentTimePeriod(%@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKHealthQueryFetchOperation initWithHealthStore:operationDescription:completion:]([HKHealthQueryFetchOperation alloc], "initWithHealthStore:operationDescription:completion:", v5, v10, v4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__HKMostRecentTimePeriodCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  v17[3] = &unk_1E9C42530;
  v12 = v11;
  v18 = v12;
  -[HKMostRecentTimePeriodCurrentValueDataProvider _mostRecentValueQueryWithCompletion:](self, "_mostRecentValueQueryWithCompletion:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryFetchOperation setQueries:](v12, "setQueries:", v14);

  v15 = v12;
  return v15;
}

uint64_t __79__HKMostRecentTimePeriodCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResults:error:", a2, a3);
}

- (id)_mostRecentValueQueryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKValueDataProvider displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultValuePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB6780];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__HKMostRecentTimePeriodCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v13[3] = &unk_1E9C42258;
  v13[4] = self;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "queryForMostRecentSampleOfType:predicate:completion:", v6, v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __86__HKMostRecentTimePeriodCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_dataProviderValueFromMostRecentSample:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_queryDateRangeFromSampleDate:(id)a3
{
  id v4;
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

  v4 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_startOfDayTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKStartOfRollingDayForDate(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKEndOfRollingDayWithStart(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueDataProvider dateCache](self, "dateCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startOfRollingDay:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKValueDataProvider dateCache](self, "dateCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endOfRollingDay:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIObjectMin(v10, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIObjectMin(v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKDataProviderNoDataCurrentValue *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMostRecentTimePeriodCurrentValueDataProvider _queryDateRangeFromSampleDate:](self, "_queryDateRangeFromSampleDate:", v7);
    v8 = (HKDataProviderNoDataCurrentValue *)objc_claimAutoreleasedReturnValue();
    -[HKDataProviderNoDataCurrentValue minValue](v8, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataProviderNoDataCurrentValue maxValue](v8, "maxValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__HKMostRecentTimePeriodCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke;
    v12[3] = &unk_1E9C42558;
    v13 = v7;
    v14 = v6;
    v11 = v7;
    -[HKMostRecentTimePeriodCurrentValueDataProvider _totalDurationFromDate:toDate:completion:](self, "_totalDurationFromDate:toDate:completion:", v9, v10, v12);

  }
  else
  {
    v8 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    (*((void (**)(id, HKDataProviderNoDataCurrentValue *, _QWORD))v6 + 2))(v6, v8, 0);
  }

}

void __100__HKMostRecentTimePeriodCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  HKGenericDataProviderCurrentValue *v7;
  id v8;

  v8 = a2;
  v6 = a4;
  if (v8)
  {
    v7 = -[HKGenericDataProviderCurrentValue initWithValue:]([HKGenericDataProviderCurrentValue alloc], "initWithValue:", v8);
    -[HKGenericDataProviderCurrentValue setDate:](v7, "setDate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_totalDurationFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueDataProvider displayType](self, "displayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultValuePredicate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithStartDate:endDate:options:", v8, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  -[HKValueDataProvider displayType](self, "displayType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sampleType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  HKUIPredicateMatchingPredicates(v25, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __91__HKMostRecentTimePeriodCurrentValueDataProvider__totalDurationFromDate_toDate_completion___block_invoke;
  v26[3] = &unk_1E9C3FC08;
  v27 = v8;
  v28 = v9;
  v29 = v10;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  v22 = (void *)objc_msgSend(v13, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v15, v17, 0, v18, v26);

  -[HKValueDataProvider healthStore](self, "healthStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "executeQuery:", v22);

}

void __91__HKMostRecentTimePeriodCurrentValueDataProvider__totalDurationFromDate_toDate_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB7010], "coalesceTimePeriodsFromSamples:strictStartDate:strictEndDate:", a3, a1[4], a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB7010], "totalDurationFromCoalescedDateIntervals:", v6);
  v7 = a1[6];
  if (v8 <= 0.0)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v7 + 16))(v7, 0, 0, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, id))(v7 + 16))(v7, v9, 0, v10);

  }
}

@end
