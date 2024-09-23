@implementation HKMostRecentValueDataProvider

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
  objc_msgSend(v6, "stringWithFormat:", CFSTR("MostRecentSample(%@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKHealthQueryFetchOperation initWithHealthStore:operationDescription:completion:]([HKHealthQueryFetchOperation alloc], "initWithHealthStore:operationDescription:completion:", v5, v10, v4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__HKMostRecentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  v18[3] = &unk_1E9C42230;
  v20 = v4;
  v12 = v11;
  v19 = v12;
  v13 = v4;
  -[HKMostRecentValueDataProvider _mostRecentValueQueryWithCompletion:](self, "_mostRecentValueQueryWithCompletion:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryFetchOperation setQueries:](v12, "setQueries:", v15);

  v16 = v12;
  return v16;
}

void __62__HKMostRecentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB6780];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HKMostRecentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v11[3] = &unk_1E9C424B0;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "queryForMostRecentSampleOfType:predicate:completion:", v6, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __69__HKMostRecentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  HKDataProviderNoDataCurrentValue *v7;
  HKDataProviderNoDataCurrentValue *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v9, "dataProviderValue");
      v7 = (HKDataProviderNoDataCurrentValue *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    }
    v8 = v7;
    (*(void (**)(uint64_t, HKDataProviderNoDataCurrentValue *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

@end
