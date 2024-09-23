@implementation HDStatisticsCollectionCalculatorDefaultDataSource

- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDStatisticsCollectionCalculatorDefaultDataSource *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HDStatisticsCollectionCalculatorDefaultDataSource;
  v14 = -[HDStatisticsCollectionCalculatorDefaultDataSource init](&v25, sel_init);
  v15 = (uint64_t)v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    v16 = objc_msgSend(v11, "copy");
    v17 = *(void **)(v15 + 32);
    *(_QWORD *)(v15 + 32) = v16;

    v18 = objc_msgSend(v12, "copy");
    v19 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v18;

    v20 = objc_msgSend(v13, "copy");
    v21 = *(void **)(v15 + 48);
    *(_QWORD *)(v15 + 48) = v20;

    *(_BYTE *)(v15 + 16) = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(v15 + 32), "underlyingSampleType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", objc_msgSend(v22, "code"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(v15 + 16) = v23 != 0;

    }
    -[HDStatisticsCollectionCalculatorDefaultDataSource _updateFullPredicate](v15);
  }

  return (id)v15;
}

- (void)_updateFullPredicate
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    v8 = *(id *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "underlyingSampleType");
      v2 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v2;
    }
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    HDSampleEntityPredicateForDataType(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      HDDataEntityPredicateForSourceEntitySet(7, *(void **)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v3, "addObject:");
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;

  }
}

- (id)initForProfile:(id)a3 categoryType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v10 = (void *)MEMORY[0x1E0CB6CD0];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "countUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:", v13, 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HDStatisticsCollectionCalculatorDefaultDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:](self, "initForProfile:quantityType:predicate:restrictedSourceEntities:", v14, v16, v12, v11);
  return v17;
}

- (void)setRestrictedSourceEntities:(id)a3
{
  NSSet *v4;
  NSSet *restrictedSourceEntities;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  restrictedSourceEntities = self->_restrictedSourceEntities;
  self->_restrictedSourceEntities = v4;

  -[HDStatisticsCollectionCalculatorDefaultDataSource _updateFullPredicate]((uint64_t)self);
}

- (void)setPredicate:(id)a3
{
  HDSQLitePredicate *v4;
  HDSQLitePredicate *predicate;

  v4 = (HDSQLitePredicate *)objc_msgSend(a3, "copy");
  predicate = self->_predicate;
  self->_predicate = v4;

  -[HDStatisticsCollectionCalculatorDefaultDataSource _updateFullPredicate]((uint64_t)self);
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v11;
  id v12;
  HDSQLitePredicate *v13;
  HKQuantityType *quantityType;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id WeakRetained;
  void *v26;
  HDSQLitePredicate *v27;
  id v28;
  id v29;
  _BOOL4 v30;
  NSNumber *anchor;
  uint64_t v32;
  NSNumber *v33;
  NSNumber *v34;
  id v36;
  id v37;
  _QWORD v39[5];
  HDSQLitePredicate *v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  _QWORD *v45;
  _QWORD v46[4];
  _QWORD v47[4];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v11 = a4;
  v37 = a6;
  v12 = a7;
  v13 = self->_fullPredicate;
  if (v11)
  {
    quantityType = self->_quantityType;
    objc_msgSend(v11, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityType _earliestAllowedStartDateForSampleOverlappingDate:](quantityType, "_earliestAllowedStartDateForSampleOverlappingDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForEndDate(6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v52[0] = self->_fullPredicate;
    v52[1] = v18;
    v52[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      HDSampleEntityPredicateForStartDate(6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayByAddingObject:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v23;
    }
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v21);
    v24 = objc_claimAutoreleasedReturnValue();

    v13 = (HDSQLitePredicate *)v24;
  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = -1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
  v39[3] = &unk_1E6D10728;
  v39[4] = self;
  v27 = v13;
  v40 = v27;
  v43 = v47;
  v44 = &v48;
  v45 = v46;
  v28 = v12;
  v41 = v28;
  v29 = v37;
  v42 = v29;
  v30 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v26, a5, v39);

  if (v30)
  {
    anchor = self->_anchor;
    if (!anchor || (v32 = v49[3], v32 > -[NSNumber longLongValue](anchor, "longLongValue")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v49[3]);
      v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v34 = self->_anchor;
      self->_anchor = v33;

    }
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

uint64_t __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  id v20;
  _QWORD *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  id v42;
  _QWORD *v43;
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  __int128 v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[5];

  v63[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  +[HDHealthEntity maxRowIDForPredicate:healthDatabase:error:](HDSampleEntity, "maxRowIDForPredicate:healthDatabase:error:", 0, v6, &v53);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v53;

  if (v7)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
  {
    if (a3)
    {
      v25 = 0;
      *a3 = objc_retainAutorelease(v8);
    }
    else
    {
      _HKLogDroppedError();
      v25 = 0;
    }
    goto LABEL_22;
  }
  v47 = a3;
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v10 + 64))
    goto LABEL_9;
  v11 = objc_msgSend(v7, "longLongValue");
  if (v11 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "longLongValue"))
  {
    v10 = *(_QWORD *)(a1 + 32);
LABEL_9:
    objc_storeStrong((id *)(v10 + 64), v7);
  }
  v46 = v8;
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(v13 + 32);
  v16 = *(void **)(v13 + 88);
  v17 = *(unsigned __int8 *)(v13 + 16);
  v18 = *(unsigned __int8 *)(v13 + 17);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2;
  v48[3] = &unk_1E6D10700;
  v48[4] = v13;
  v51 = *(_OWORD *)(a1 + 64);
  v52 = *(_QWORD *)(a1 + 80);
  v49 = *(id *)(a1 + 48);
  v50 = *(id *)(a1 + 56);
  v19 = v15;
  v20 = v16;
  v21 = v48;
  v22 = v14;
  v23 = v12;
  objc_opt_self();
  if (v17)
  {
    if (v18)
      v24 = 5;
    else
      v24 = 1;
    v54 = MEMORY[0x1E0C809B0];
    v55 = 3221225472;
    v56 = __154__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateWithProfile_quantityType_predicate_filter_isQuantityType_includeUnfrozenSeries_error_block___block_invoke;
    v57 = &unk_1E6D10750;
    v58 = v20;
    v59 = v21;
    v25 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesBySeriesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesBySeriesForPredicate:profile:options:error:handler:", v22, v23, v24, v47, &v54);

    v26 = v58;
  }
  else
  {
    v26 = v23;
    v43 = v21;
    v41 = v21;
    v42 = v22;
    v45 = v19;
    v27 = v19;
    objc_opt_self();
    v63[0] = CFSTR("data_provenances.source_id");
    v63[1] = CFSTR("start_date");
    v63[2] = CFSTR("end_date");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v28, "indexOfObject:", CFSTR("data_provenances.source_id"));
    v39 = objc_msgSend(v28, "indexOfObject:", CFSTR("start_date"));
    v29 = objc_msgSend(v28, "indexOfObject:", CFSTR("end_date"));
    v30 = (void *)objc_msgSend(v27, "dataObjectClass");

    v31 = (void *)objc_msgSend((id)objc_msgSend(v30, "hd_dataEntityClass"), "entityClassForEnumeration");
    objc_msgSend(v31, "syntheticQuantityColumnName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v23;
    if (v32)
    {
      objc_msgSend(v28, "arrayByAddingObject:", v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v33;
    }
    v34 = MEMORY[0x1E0C809B0];
    objc_msgSend(v26, "database");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v34;
    v55 = 3221225472;
    v56 = __120__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateSampleTypeWithProfile_quantityType_predicate_error_block___block_invoke;
    v57 = &unk_1E6D10778;
    v60 = v39;
    v61 = v29;
    v62 = v40;
    v58 = v32;
    v59 = v41;
    v36 = v41;
    v37 = v32;
    v25 = objc_msgSend(v31, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v28, v42, v35, v47, &v54);

    v19 = v45;
    v21 = v43;
    v23 = v44;
  }

  v8 = v46;
LABEL_22:

  return v25;
}

uint64_t __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2(_QWORD *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;

  v16 = a1[4];
  v17 = *(_QWORD *)(v16 + 72);
  if (v17 >= 1)
  {
    v18 = *(_QWORD *)(v16 + 80);
    if (v18)
    {
      v19 = *(_QWORD *)(a1[7] + 8);
      v20 = *(_QWORD *)(v19 + 24);
      if (v20 >= v17)
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v18, a10);
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
        ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        *(_QWORD *)(v19 + 24) = v20 + 1;
      }
    }
  }
  v22 = *(_QWORD *)(a1[8] + 8);
  if (*(_QWORD *)(v22 + 24) < a2)
    *(_QWORD *)(v22 + 24) = a2;
  v23 = *(_QWORD *)(a1[9] + 8);
  if (*(_QWORD *)(v23 + 24) != a2)
  {
    if (a3 != a6)
    {
      (*(void (**)(double))(a1[5] + 16))(a3);
      v23 = *(_QWORD *)(a1[9] + 8);
    }
    *(_QWORD *)(v23 + 24) = a2;
  }
  return (*(uint64_t (**)(double, double, double))(a1[6] + 16))(a5, a6, a7);
}

uint64_t __154__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateWithProfile_quantityType_predicate_filter_isQuantityType_includeUnfrozenSeries_error_block___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  if (objc_msgSend(MEMORY[0x1E0CB6FA0], "filter:acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", *(_QWORD *)(a1 + 32), a5, a6))return (*(uint64_t (**)(double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(a2, a3, a4, a5, a6);
  else
    return 1;
}

uint64_t __120__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateSampleTypeWithProfile_quantityType_predicate_error_block___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v6;
  double v7;
  __n128 v8;
  unint64_t v9;

  v6 = MEMORY[0x1BCCAB1A4](a4, a1[6]);
  v7 = MEMORY[0x1BCCAB1A4](a4, a1[7]);
  HDSQLiteColumnAsInt64();
  if (a1[4])
  {
    HDSQLiteColumnWithNameAsDouble();
    v8.n128_u64[0] = v9;
  }
  else
  {
    v8.n128_u64[0] = 0;
  }
  return (*(uint64_t (**)(double, double, __n128, double, double))(a1[5] + 16))(v6, v7, v8, v6, v7);
}

- (BOOL)addValuesForQuantitySamples:(id)a3 calculator:(id)a4 includeSeries:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  char v16;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (!v7)
    goto LABEL_4;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke;
  v21[3] = &unk_1E6D107A0;
  v21[4] = self;
  objc_msgSend(v10, "hk_firstObjectPassingTest:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke_2;
    v18[3] = &unk_1E6CEB3F8;
    v18[4] = self;
    v19 = v10;
    v20 = v11;
    v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDQuantitySampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, a6, v18);

  }
  else
  {
LABEL_4:
    v16 = -[HDStatisticsCollectionCalculatorDefaultDataSource _addValuesForQuantitySamples:calculator:requiresSeriesValues:transaction:error:]((uint64_t)self, v10, v11, 0, 0, (uint64_t)a6);
  }

  return v16;
}

BOOL __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
    v5 = objc_msgSend(v3, "count") > 1;
  else
    v5 = 0;

  return v5;
}

uint64_t __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDStatisticsCollectionCalculatorDefaultDataSource _addValuesForQuantitySamples:calculator:requiresSeriesValues:transaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 1, a2, a3);
}

- (uint64_t)_addValuesForQuantitySamples:(void *)a3 calculator:(char)a4 requiresSeriesValues:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  if (a1)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __132__HDStatisticsCollectionCalculatorDefaultDataSource__addValuesForQuantitySamples_calculator_requiresSeriesValues_transaction_error___block_invoke;
    v16[3] = &unk_1E6D107C8;
    v17 = v11;
    v18 = a1;
    v21 = a4;
    v19 = v12;
    v20 = v13;
    v14 = objc_msgSend(v19, "performAddSampleTransaction:error:", v16, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __132__HDStatisticsCollectionCalculatorDefaultDataSource__addValuesForQuantitySamples_calculator_requiresSeriesValues_transaction_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  void *v23;
  unsigned int v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v49, 16);
  v25 = 1;
  if (!v4)
    goto LABEL_27;
  v5 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v28 != v5)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v7, "quantityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));

      if (!v9)
        continue;
      v10 = *(void **)(a1 + 48);
      if (!*(_BYTE *)(a1 + 64))
      {
        if (!+[HDStatisticsCollectionCalculatorDefaultDataSource _addValueForQuantitySample:calculator:error:]((uint64_t)HDStatisticsCollectionCalculatorDefaultDataSource, v7, *(void **)(a1 + 48), (uint64_t)a2))goto LABEL_26;
        continue;
      }
      v11 = *(void **)(a1 + 56);
      v12 = v7;
      v13 = v10;
      v14 = v11;
      v15 = objc_opt_self();
      if (objc_msgSend(v12, "count") == 1)
      {
        v16 = +[HDStatisticsCollectionCalculatorDefaultDataSource _addValueForQuantitySample:calculator:error:](v15, v12, v13, (uint64_t)a2);

        goto LABEL_22;
      }
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__204;
      v47 = __Block_byref_object_dispose__204;
      v48 = 0;
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 1;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v38 = 0;
      objc_msgSend(v12, "_startTimestamp");
      v38 = v17;
      objc_msgSend(v12, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __115__HDStatisticsCollectionCalculatorDefaultDataSource__addValueForQuantitySeriesSample_calculator_transaction_error___block_invoke;
      v31[3] = &unk_1E6D107F0;
      v34 = v37;
      v35 = &v39;
      v19 = v13;
      v32 = v19;
      v20 = v12;
      v33 = v20;
      v36 = &v43;
      v21 = +[HDQuantitySampleSeriesEntity enumerateDataWithIdentifier:transaction:error:handler:](HDQuantitySampleSeriesEntity, "enumerateDataWithIdentifier:transaction:error:handler:", v18, v14, a2, v31);

      if (!v21)
        goto LABEL_20;
      if (!*((_BYTE *)v40 + 24))
      {
        v22 = (id)v44[5];
        v23 = v22;
        if (v22)
        {
          if (a2)
            *a2 = objc_retainAutorelease(v22);
          else
            _HKLogDroppedError();
        }

LABEL_20:
        v16 = 0;
        goto LABEL_21;
      }
      v16 = 1;
LABEL_21:

      _Block_object_dispose(v37, 8);
      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v43, 8);

LABEL_22:
      if ((v16 & 1) == 0)
      {
LABEL_26:
        v25 = 0;
        goto LABEL_27;
      }
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v49, 16);
    if (v4)
      continue;
    break;
  }
  v25 = 1;
LABEL_27:

  return v25;
}

+ (uint64_t)_addValueForQuantitySample:(void *)a3 calculator:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(v7, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quantityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "canonicalUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v10);
  v12 = v11;

  objc_msgSend(v7, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v7, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;
  objc_msgSend(v7, "sourceRevision");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_sourceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v21, "longLongValue"), a4, v12, v15, v18);

  return v22;
}

uint64_t __115__HDStatisticsCollectionCalculatorDefaultDataSource__addValueForQuantitySeriesSample_calculator_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  int v6;
  double v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id obj;

  v3 = a2;
  if (objc_msgSend(v3, "hasDuration"))
  {
    objc_msgSend(v3, "timeInterval");
    v5 = v4;
  }
  else
  {
    v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  v6 = objc_msgSend(v3, "hasDuration");
  objc_msgSend(v3, "timeInterval");
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v3, "duration");
    v8 = v8 + v9;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "value");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 40), "sourceRevision");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_sourceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longLongValue");
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v17 + 40);
  LOBYTE(v10) = objc_msgSend(v10, "addSampleValue:startTime:endTime:sourceID:error:", v16, &obj, v12, v5, v8);
  objc_storeStrong((id *)(v17 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v10;

  v18 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  return v18;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HDSQLitePredicate)predicate
{
  return self->_predicate;
}

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (BOOL)includeUnfrozenSeries
{
  return self->_includeUnfrozenSeries;
}

- (void)setIncludeUnfrozenSeries:(BOOL)a3
{
  self->_includeUnfrozenSeries = a3;
}

- (NSNumber)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)maxRowID
{
  return self->_maxRowID;
}

- (int64_t)shouldContinueFrequency
{
  return self->_shouldContinueFrequency;
}

- (void)setShouldContinueFrequency:(int64_t)a3
{
  self->_shouldContinueFrequency = a3;
}

- (id)shouldContinueHandler
{
  return self->_shouldContinueHandler;
}

- (void)setShouldContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong(&self->_shouldContinueHandler, 0);
  objc_storeStrong((id *)&self->_maxRowID, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_fullPredicate, 0);
}

@end
