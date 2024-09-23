@implementation HKCumulativeSumCurrentValueDataProvider

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
  id v13;
  void *v14;
  void *v15;
  HKHealthQueryFetchOperation *v16;
  _QWORD v18[4];
  HKHealthQueryFetchOperation *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(v6, "stringWithFormat:", CFSTR("MostRecentSum(%@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKHealthQueryFetchOperation initWithHealthStore:operationDescription:completion:]([HKHealthQueryFetchOperation alloc], "initWithHealthStore:operationDescription:completion:", v5, v10, v4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HKCumulativeSumCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  v18[3] = &unk_1E9C42230;
  v20 = v4;
  v12 = v11;
  v19 = v12;
  v13 = v4;
  -[HKCumulativeSumCurrentValueDataProvider _mostRecentValueQueryWithCompletion:](self, "_mostRecentValueQueryWithCompletion:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryFetchOperation setQueries:](v12, "setQueries:", v15);

  v16 = v12;
  return v16;
}

void __72__HKCumulativeSumCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, id, id);
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(void (**)(uint64_t, uint64_t, id, id))(v5 + 16);
  v8 = a3;
  v9 = a2;
  v7(v5, v6, v9, v8);
  objc_msgSend(*(id *)(a1 + 32), "completedWithResults:error:", v9, v8);

}

- (id)_mostRecentValueQueryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB6780];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__HKCumulativeSumCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v11[3] = &unk_1E9C42258;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "queryForMostRecentSampleOfType:predicate:completion:", v6, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __79__HKCumulativeSumCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_dataProviderValueFromMostRecentSample:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  HKDataProviderNoDataCurrentValue *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKCalendarDateTransformNone();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKStartOfRollingDayForDate(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HKEndOfRollingDayWithStart(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__HKCumulativeSumCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke;
    v13[3] = &unk_1E9C42918;
    v14 = v7;
    v15 = v6;
    v11 = v7;
    -[HKCumulativeSumCurrentValueDataProvider _sumFromDate:toDate:completion:](self, "_sumFromDate:toDate:completion:", v9, v10, v13);

  }
  else
  {
    v12 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    (*((void (**)(id, HKDataProviderNoDataCurrentValue *, _QWORD))v6 + 2))(v6, v12, 0);

  }
}

void __93__HKCumulativeSumCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  HKGenericQuantityDataProviderCurrentValue *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "sumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HKGenericQuantityDataProviderCurrentValue initWithQuantity:]([HKGenericQuantityDataProviderCurrentValue alloc], "initWithQuantity:", v5);
    -[HKGenericQuantityDataProviderCurrentValue setDate:](v6, "setDate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_sumFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sampleType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB6C88]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__HKCumulativeSumCurrentValueDataProvider__sumFromDate_toDate_completion___block_invoke;
  v20[3] = &unk_1E9C42940;
  v21 = v8;
  v14 = v8;
  v15 = (void *)objc_msgSend(v13, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v12, 0, 16, v20);
  -[HKValueDataProvider displayType](self, "displayType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "behavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMergeStrategy:", objc_msgSend(v17, "statisticsMergeStrategy"));

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v9);
  objc_msgSend(v15, "_setDateInterval:", v18);

  -[HKValueDataProvider healthStore](self, "healthStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "executeQuery:", v15);

}

uint64_t __74__HKCumulativeSumCurrentValueDataProvider__sumFromDate_toDate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
