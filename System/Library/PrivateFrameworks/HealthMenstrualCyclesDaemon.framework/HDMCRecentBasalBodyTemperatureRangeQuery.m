@implementation HDMCRecentBasalBodyTemperatureRangeQuery

- (HDMCRecentBasalBodyTemperatureRangeQuery)initWithProfile:(id)a3 sampleLimit:(int64_t)a4 upperQuantileBound:(double)a5 lowerQuantileBound:(double)a6
{
  id v11;
  HDMCRecentBasalBodyTemperatureRangeQuery *v12;
  HDMCRecentBasalBodyTemperatureRangeQuery *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDMCRecentBasalBodyTemperatureRangeQuery;
  v12 = -[HDMCRecentBasalBodyTemperatureRangeQuery init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_profile, v11);
    v13->_sampleLimit = a4;
    v13->_upperQuantileBound = a5;
    v13->_lowerQuantileBound = a6;
    if (HKCompareDoubles() != -1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("HDMCRecentBasalBodyTemperatureRangeQuery.mm"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKCompareDoubles(upperQuantileBound, 1.0) == NSOrderedAscending"));

    }
    if (HKCompareDoubles() == -1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("HDMCRecentBasalBodyTemperatureRangeQuery.mm"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKCompareDoubles(lowerQuantileBound, 0.0) != NSOrderedAscending"));

    }
    if (HKCompareDoubles() == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("HDMCRecentBasalBodyTemperatureRangeQuery.mm"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKCompareDoubles(lowerQuantileBound, upperQuantileBound) != NSOrderedDescending"));

    }
  }

  return v13;
}

- (id)rangeWithError:(id *)a3
{
  id v5;
  uint64_t v6;
  double upperQuantileBound;
  double lowerQuantileBound;
  HDMCRecentBasalBodyTemperatureRange *v9;
  double v10;
  signed int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v20;
  void *__p;
  _BYTE *v22;

  v20 = 0;
  -[HDMCRecentBasalBodyTemperatureRangeQuery accumulateSortedValuesWithError:]((uint64_t)self, &v20, &__p);
  v5 = v20;
  v6 = v22 - (_BYTE *)__p;
  if (v22 != __p)
  {
    upperQuantileBound = self->_upperQuantileBound;
    lowerQuantileBound = self->_lowerQuantileBound;
    v9 = [HDMCRecentBasalBodyTemperatureRange alloc];
    v10 = (double)(v6 >> 3);
    v11 = vcvtmd_s64_f64(lowerQuantileBound * v10);
    v12 = *((double *)__p + (int)vcvtmd_s64_f64(upperQuantileBound * v10));
    v13 = *((double *)__p + (int)vcvtmd_s64_f64(v10 * 0.5));
    v14 = *((double *)__p + v11);
    -[HDMCRecentBasalBodyTemperatureRangeQuery _bbtType](self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "canonicalUnit");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = -[HDMCRecentBasalBodyTemperatureRange _initWithUpperQuantileValue:medianValue:lowerQuantileValue:unit:](v9, "_initWithUpperQuantileValue:medianValue:lowerQuantileValue:unit:", v16, v12, v13, v14);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 11, CFSTR("Could not compute a range due to no values"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  if (v18)
  {
    if (a3)
    {
      v16 = objc_retainAutorelease(v18);
      v17 = 0;
      *a3 = v16;
      v15 = v16;
      goto LABEL_8;
    }
    _HKLogDroppedError();
  }
  v17 = 0;
  v15 = v16;
LABEL_8:

  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }

  return v17;
}

- (void)accumulateSortedValuesWithError:(_QWORD *)a3@<X8>
{
  int v5;
  id v6;
  void *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 (*v16)(__n128 *, __n128 *);
  void (*v17)(uint64_t);
  void *v18;
  void *__p;
  void *v20;
  uint64_t v21;

  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x4812000000;
    v16 = __Block_byref_object_copy__8;
    v17 = __Block_byref_object_dispose__8;
    v18 = &unk_219695E1F;
    __p = 0;
    v20 = 0;
    v21 = 0;
    v11 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __76__HDMCRecentBasalBodyTemperatureRangeQuery_accumulateSortedValuesWithError___block_invoke;
    v12[3] = &unk_24DB22698;
    v12[4] = &v13;
    v5 = -[HDMCRecentBasalBodyTemperatureRangeQuery enumerateValuesWithHandler:error:](a1, v12, (uint64_t)&v11);
    v6 = v11;
    v7 = v6;
    if (v5)
    {
      std::__sort<std::__less<double,double> &,double *>();
      v8 = v14;
      a3[1] = 0;
      a3[2] = 0;
      *a3 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a3, (const void *)v8[6], v8[7], (v8[7] - v8[6]) >> 3);
    }
    else
    {
      v9 = v6;
      v10 = v9;
      if (v9)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v9);
        else
          _HKLogDroppedError();
      }

      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
    }

    _Block_object_dispose(&v13, 8);
    if (__p)
    {
      v20 = __p;
      operator delete(__p);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
}

- (id)_bbtType
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3380]);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __76__HDMCRecentBasalBodyTemperatureRangeQuery_accumulateSortedValuesWithError___block_invoke(uint64_t a1, double a2)
{
  _QWORD *v3;
  double *v4;
  unint64_t v5;
  double *v6;
  double *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  double *v13;
  char *v14;
  uint64_t v15;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (double *)v3[7];
  v5 = v3[8];
  if ((unint64_t)v4 >= v5)
  {
    v7 = (double *)v3[6];
    v8 = v4 - v7;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v9 = v5 - (_QWORD)v7;
    v10 = (uint64_t)(v5 - (_QWORD)v7) >> 2;
    if (v10 <= v8 + 1)
      v10 = v8 + 1;
    if (v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
    {
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(v3 + 8), v11);
      v7 = (double *)v3[6];
      v4 = (double *)v3[7];
    }
    else
    {
      v12 = 0;
    }
    v13 = (double *)&v12[8 * v8];
    v14 = &v12[8 * v11];
    *v13 = a2;
    v6 = v13 + 1;
    while (v4 != v7)
    {
      v15 = *((_QWORD *)v4-- - 1);
      *((_QWORD *)v13-- - 1) = v15;
    }
    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v4 = a2;
    v6 = v4 + 1;
  }
  v3[7] = v6;
  return 1;
}

- (uint64_t)enumerateValuesWithHandler:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  if (a1)
  {
    v6 = (void *)MEMORY[0x24BE40B90];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesWithHandler_error___block_invoke;
    v11[3] = &unk_24DB226C0;
    v11[4] = a1;
    v12 = v5;
    v9 = objc_msgSend(v6, "performReadTransactionWithHealthDatabase:error:block:", v8, a3, v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __77__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesWithHandler_error___block_invoke(uint64_t a1, void *a2)
{
  return -[HDMCRecentBasalBodyTemperatureRangeQuery enumerateValuesInTransaction:handler:error:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
}

- (uint64_t)enumerateValuesInTransaction:(uint64_t)a1 handler:(void *)a2 error:(void *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[HDMCRecentBasalBodyTemperatureRangeQuery _basalBodyTemperatureDescendingEndDateQueryWithTransaction:limit:](a1, v5, *(_QWORD *)(a1 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x24BE40900];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesInTransaction_handler_error___block_invoke;
    v12[3] = &unk_24DB226E8;
    v13 = v6;
    v9 = objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v8, &v14, v12);
    v10 = v14;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_basalBodyTemperatureDescendingEndDateQueryWithTransaction:(uint64_t)a3 limit:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3380]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataType();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_class();
    objc_msgSend(v5, "databaseForEntityClass:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x24BE40940], objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v9, v7, a3, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __87__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesInTransaction_handler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x219A30F48](a3, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)recentRangeForAnalysisWithProfile:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[8];
  id v16;
  uint8_t buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (id *)MEMORY[0x24BDD3030];
  v6 = *MEMORY[0x24BDD3030];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x24BDD3030]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21961B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "recentRangeForAnalysis", ", buf, 2u);
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProfile:sampleLimit:upperQuantileBound:lowerQuantileBound:", v4, 90, 0.9, 0.1);
  v16 = 0;
  objc_msgSend(v7, "rangeWithError:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v9;
  if (!v8 && (objc_msgSend(v9, "hk_isHealthKitErrorWithCode:", 11) & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = *v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      +[HDMCRecentBasalBodyTemperatureRangeQuery recentRangeForAnalysisWithProfile:].cold.1(v12, (uint64_t)v10, (uint64_t)buf, v11);
    }

  }
  _HKInitializeLogging();
  v13 = *v5;
  if (os_signpost_enabled((os_log_t)*v5))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_21961B000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "recentRangeForAnalysis", ", v15, 2u);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

+ (void)recentRangeForAnalysisWithProfile:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  v6 = a1;
  _os_log_error_impl(&dword_21961B000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] Error querying recent BBT range: %{public}@", (uint8_t *)a3, 0x16u);

}

@end
