@implementation HKCountCurrentValueDataProvider

- (HKCountCurrentValueDataProvider)initWithHealthStore:(id)a3 updateController:(id)a4 dateCache:(id)a5 displayType:(id)a6 countStyle:(int64_t)a7
{
  HKCountCurrentValueDataProvider *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKCountCurrentValueDataProvider;
  result = -[HKValueDataProvider initWithHealthStore:updateController:dateCache:displayType:](&v9, sel_initWithHealthStore_updateController_dateCache_displayType_, a3, a4, a5, a6);
  if (result)
    result->_countStyle = a7;
  return result;
}

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
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HKHealthQueryFetchOperation *v19;
  _QWORD aBlock[4];
  HKHealthQueryFetchOperation *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(v6, "stringWithFormat:", CFSTR("CurrentValueCount(%@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKHealthQueryFetchOperation initWithHealthStore:operationDescription:completion:]([HKHealthQueryFetchOperation alloc], "initWithHealthStore:operationDescription:completion:", v5, v10, v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKCountCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E9C42230;
  v23 = v4;
  v12 = v11;
  v22 = v12;
  v13 = v4;
  v14 = _Block_copy(aBlock);
  v15 = -[HKCountCurrentValueDataProvider countStyle](self, "countStyle");
  if (v15 == 1)
  {
    -[HKCountCurrentValueDataProvider _countAllSamplesQueryWithCompletion:](self, "_countAllSamplesQueryWithCompletion:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v15)
    {
      v17 = 0;
      goto LABEL_7;
    }
    -[HKCountCurrentValueDataProvider _mostRecentValueQueryWithCompletion:](self, "_mostRecentValueQueryWithCompletion:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
LABEL_7:
  v24[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryFetchOperation setQueries:](v12, "setQueries:", v18);

  v19 = v12;
  return v19;
}

void __64__HKCountCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v11[2] = __71__HKCountCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v11[3] = &unk_1E9C42258;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "queryForMostRecentSampleOfType:predicate:completion:", v6, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __71__HKCountCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD v13[5];
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
    v13[2] = __85__HKCountCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke;
    v13[3] = &unk_1E9C42280;
    v14 = v7;
    v15 = v6;
    v13[4] = self;
    v11 = v7;
    -[HKCountCurrentValueDataProvider _countFromDate:toDate:completion:](self, "_countFromDate:toDate:completion:", v9, v10, v13);

  }
  else
  {
    v12 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    (*((void (**)(id, HKDataProviderNoDataCurrentValue *, _QWORD))v6 + 2))(v6, v12, 0);

  }
}

void __85__HKCountCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = a1[5];
  v4 = a1[6];
  v6 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v6, "_dataProviderValueForCount:sampleDate:", a2, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v7);

}

- (id)_dataProviderValueForCount:(id)a3 sampleDate:(id)a4
{
  id v5;
  id v6;
  HKGenericDataProviderCurrentValue *v7;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = -[HKGenericDataProviderCurrentValue initWithValue:]([HKGenericDataProviderCurrentValue alloc], "initWithValue:", v5);
    -[HKGenericDataProviderCurrentValue setDate:](v7, "setDate:", v6);
  }
  else
  {
    v7 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }

  return v7;
}

- (void)_countFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultValuePredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithStartDate:endDate:options:", v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  -[HKValueDataProvider displayType](self, "displayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIPredicateMatchingPredicates(v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__HKCountCurrentValueDataProvider__countFromDate_toDate_completion___block_invoke;
  v21[3] = &unk_1E9C422A8;
  v22 = v8;
  v18 = v8;
  v19 = (void *)objc_msgSend(v14, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v16, v17, 0, 0, v21);

  -[HKValueDataProvider healthStore](self, "healthStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "executeQuery:", v19);

}

void __68__HKCountCurrentValueDataProvider__countFromDate_toDate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  void *v6;
  id v7;
  void (*v8)(uint64_t, _QWORD);
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    v8 = *(void (**)(uint64_t, _QWORD))(v4 + 16);
    v9 = a4;
    v8(v4, 0);
  }

}

- (id)_countAllSamplesQueryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HKCountCurrentValueDataProvider *v16;
  id v17;

  v4 = a3;
  -[HKValueDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValuePredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKValueDataProvider displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CB6AE0]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HKCountCurrentValueDataProvider__countAllSamplesQueryWithCompletion___block_invoke;
  v14[3] = &unk_1E9C422D0;
  v15 = v8;
  v16 = self;
  v17 = v4;
  v10 = v4;
  v11 = v8;
  v12 = (void *)objc_msgSend(v9, "initWithSampleType:predicate:resultsHandler:", v11, v6, v14);

  return v12;
}

void __71__HKCountCurrentValueDataProvider__countAllSamplesQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD);
  id v11;

  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = a4;
    objc_msgSend(a3, "objectForKeyedSubscript:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_dataProviderValueForCount:sampleDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void (**)(uint64_t, _QWORD))(v9 + 16);
    v11 = a4;
    v10(v9, 0);
  }

}

- (int64_t)countStyle
{
  return self->_countStyle;
}

@end
