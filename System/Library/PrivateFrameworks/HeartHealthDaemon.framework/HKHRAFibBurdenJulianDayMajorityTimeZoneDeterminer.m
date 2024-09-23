@implementation HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer

- (HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4
{
  id v6;
  id v7;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v8;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v9;
  uint64_t v10;
  HKSeriesType *seriesType;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer;
  v8 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
    v10 = objc_claimAutoreleasedReturnValue();
    seriesType = v9->_seriesType;
    v9->_seriesType = (HKSeriesType *)v10;

    objc_storeStrong((id *)&v9->_calendarCache, a4);
  }

  return v9;
}

- (id)determineJulianDayToMajorityTimeZoneForRange:(id)a3 error:(id *)a4
{
  int64_t var1;
  int64_t var0;
  id v8;
  void *v9;
  HKSeriesType *seriesType;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;
  int64_t v33;
  int64_t v34;
  id v35;
  _QWORD v36[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)MEMORY[0x1E0D29578];
  seriesType = self->_seriesType;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v9, "entityEnumeratorWithType:profile:", seriesType, WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer _totalDatePredicateForStartDayIndex:endDayIndex:](self, "_totalDatePredicateForStartDayIndex:endDayIndex:", var0, var0 + var1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(v12, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D29230]);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29358], objc_opt_class(), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOrderingTerms:", v15);

  v35 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke;
  v31[3] = &unk_1E87EF930;
  v31[4] = self;
  v33 = var0;
  v34 = var1;
  v17 = v8;
  v32 = v17;
  LOBYTE(v8) = objc_msgSend(v12, "enumerateWithError:handler:", &v35, v31);
  v18 = v35;
  if ((v8 & 1) != 0)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__1;
    v29 = __Block_byref_object_dispose__1;
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_211;
    v24[3] = &unk_1E87EF980;
    v24[4] = &v25;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v24);
    v19 = (id)v26[5];
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:].cold.1((uint64_t)self, (uint64_t)v18, v20);

    v21 = v18;
    v22 = v21;
    if (v21)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v21);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }

  return v19;
}

uint64_t __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  HKHRJulianDayTimeZoneState *v22;
  HKHRJulianDayTimeZoneState *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a2;
  objc_msgSend(v3, "_timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1[4] + 24);
  objc_msgSend(v3, "_timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarForTimeZone:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hk_dayIndexWithCalendar:", v7);

  v10 = a1[6];
  v11 = __OFSUB__(v9, v10);
  v12 = v9 - v10;
  if (v12 < 0 == v11 && v12 < a1[7])
  {
    v14 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = v18;

    objc_msgSend(v19, "objectForKey:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = objc_alloc_init(HKHRJulianDayTimeZoneState);
    v23 = v22;

    -[HKHRJulianDayTimeZoneState setCount:](v23, "setCount:", -[HKHRJulianDayTimeZoneState count](v23, "count") + 1);
    objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHRJulianDayTimeZoneState setLastSampleDate:](v23, "setLastSampleDate:", v24);

    objc_msgSend(v19, "setObject:forKey:", v23, v4);
    v25 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v19, v26);

  }
  return 1;
}

void __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[7];
  _QWORD v8[4];
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a2;
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__1;
  v9[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = -1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_2;
  v7[3] = &unk_1E87EF958;
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = &v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v12[5], v5);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
}

void __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count") > *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)
    || objc_msgSend(v6, "count") == *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)
    && (objc_msgSend(v6, "lastSampleDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "compare:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)),
        v7,
        v8 == 1))
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v6, "count");
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    objc_msgSend(v6, "lastSampleDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)_totalDatePredicateForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_earliestPossibleDateWithDayIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_latestPossibleDateWithDayIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  HDSampleEntityPredicateForDateInterval();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_seriesType, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)determineJulianDayToMajorityTimeZoneForRange:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%@] Failed to enumerate across samples, received error: %@", (uint8_t *)&v3, 0x16u);
}

@end
