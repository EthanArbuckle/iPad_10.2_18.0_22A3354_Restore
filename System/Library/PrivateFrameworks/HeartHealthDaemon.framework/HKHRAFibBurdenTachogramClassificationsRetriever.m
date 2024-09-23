@implementation HKHRAFibBurdenTachogramClassificationsRetriever

- (HKHRAFibBurdenTachogramClassificationsRetriever)initWithProfile:(id)a3 calendarCache:(id)a4
{
  return -[HKHRAFibBurdenTachogramClassificationsRetriever initWithProfile:dateGenerator:calendarCache:](self, "initWithProfile:dateGenerator:calendarCache:", a3, &__block_literal_global_6, a4);
}

uint64_t __81__HKHRAFibBurdenTachogramClassificationsRetriever_initWithProfile_calendarCache___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (HKHRAFibBurdenTachogramClassificationsRetriever)initWithProfile:(id)a3 dateGenerator:(id)a4 calendarCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKHRAFibBurdenTachogramClassificationsRetriever *v11;
  HKHRAFibBurdenTachogramClassificationsRetriever *v12;
  uint64_t v13;
  HKSeriesType *seriesType;
  uint64_t v15;
  id dateGenerator;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKHRAFibBurdenTachogramClassificationsRetriever;
  v11 = -[HKHRAFibBurdenTachogramClassificationsRetriever init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
    v13 = objc_claimAutoreleasedReturnValue();
    seriesType = v12->_seriesType;
    v12->_seriesType = (HKSeriesType *)v13;

    objc_storeStrong((id *)&v12->_calendarCache, a5);
    v15 = MEMORY[0x1D17A8B4C](v9);
    dateGenerator = v12->_dateGenerator;
    v12->_dateGenerator = (id)v15;

  }
  return v12;
}

- (id)tachogramClassificationsDayIndexRange:(id)a3 tachogramClassifier:(id)a4 error:(id *)a5
{
  int64_t var1;
  int64_t var0;
  int64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a3.var0 + a3.var1;
  v10 = a4;
  -[HKHRAFibBurdenTachogramClassificationsRetriever _totalDatePredicateForStartDayIndex:endDayIndex:](self, "_totalDatePredicateForStartDayIndex:endDayIndex:", var0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = var1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke;
  v15[3] = &unk_1E87EFD68;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke_2;
  v14[3] = &__block_descriptor_48_e40_q32__0__HKHeartbeatSeriesSample_8q16__24l;
  v14[4] = var0;
  -[HKHRAFibBurdenTachogramClassificationsRetriever _tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:](self, "_tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:", v11, v10, a5, v15, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = a2;
  objc_msgSend(v3, "_timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarForTimeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  return v7;
}

uint64_t __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3 - v3 >= *(_QWORD *)(a1 + 40) || a3 < v3)
    return 2;
  else
    return 1;
}

- (id)tachogramClassificationsForLastSixWeeksOfWeekday:(int64_t)a3 tachogramClassifier:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  HKHRAFibBurdenTachogramClassificationsRetriever *v32;
  id v33;
  id v34;

  v7 = (objc_class *)MEMORY[0x1E0C99D78];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setWeekday:", a3);
  (*((void (**)(void))self->_dateGenerator + 2))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startOfDayForDate:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, -42, v25, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke;
  v30[3] = &unk_1E87EFDB0;
  v31 = v13;
  v32 = self;
  v18 = v14;
  v33 = v18;
  v34 = v15;
  v19 = v15;
  v20 = v13;
  objc_msgSend(v16, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v10, v9, 1028, v30);

  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v18;
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_2;
  v29[3] = &unk_1E87EFD68;
  v29[4] = self;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_3;
  v27[3] = &unk_1E87EFDD8;
  v22 = v18;
  -[HKHRAFibBurdenTachogramClassificationsRetriever _tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:](self, "_tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:", v21, v8, a5, v29, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a2;
  if (v6)
  {
    v16 = v6;
    if (objc_msgSend(*(id *)(a1 + 32), "compare:", v6) == -1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v16, "hk_dayIndexWithCalendar:", v7);

      v9 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      v11 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_earliestPossibleDateWithDayIndex:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_latestPossibleDateWithDayIndex:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

      HDSampleEntityPredicateForDateInterval();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);

    }
    else
    {
      *a4 = 1;
    }
    v6 = v16;
  }

}

uint64_t __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = a2;
  objc_msgSend(v3, "_timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarForTimeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  return v7;
}

uint64_t __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "containsObject:", v2))
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

- (id)tachogramClassificationsForLastSixWeeksOfHoursFrom:(int64_t)a3 to:(int64_t)a4 julianDayToMajorityTimeZone:(id)a5 tachogramClassifier:(id)a6 error:(id *)a7
{
  id v12;
  HKCalendarCache *calendarCache;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  HKHRAFibBurdenTachogramClassificationsRetriever *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  _QWORD v31[5];

  v12 = a5;
  calendarCache = self->_calendarCache;
  v14 = a6;
  -[HKCalendarCache currentCalendar](calendarCache, "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_dateGenerator + 2))();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startOfDayForDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "hk_dayIndexWithCalendar:", v18);

  -[HKHRAFibBurdenTachogramClassificationsRetriever _totalDatePredicateForStartDayIndex:endDayIndex:](self, "_totalDatePredicateForStartDayIndex:endDayIndex:", v19 - 42, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke;
  v31[3] = &unk_1E87EFD68;
  v31[4] = self;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2;
  v24[3] = &unk_1E87EFE00;
  v27 = v19 - 42;
  v28 = v19;
  v25 = v12;
  v26 = self;
  v29 = a3;
  v30 = a4;
  v21 = v12;
  -[HKHRAFibBurdenTachogramClassificationsRetriever _tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:](self, "_tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:", v20, v14, a7, v31, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = a2;
  objc_msgSend(v3, "_timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarForTimeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  return v7;
}

uint64_t __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v5 = a2;
  if (a1[6] > a3 || a1[7] <= a3)
  {
    v12 = 2;
  }
  else
  {
    v6 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1[5] + 24), "calendarForTimeZone:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aFibBurden_dateForAFibBurdenClassification");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "component:fromDate:", 32, v10);

      if (v11 >= a1[8])
      {
        if (v11 < a1[9])
          v12 = 1;
        else
          v12 = 2;
      }
      else
      {
        v12 = 2;
      }

    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2_cold_1((uint64_t)a1, v13);

      v12 = 2;
    }

  }
  return v12;
}

- (id)_tachogramClassificationsWithPredicate:(id)a3 tachogramClassifier:(id)a4 error:(id *)a5 dayIndexBlock:(id)a6 filterBlock:(id)a7
{
  id v11;
  id v12;
  void *v13;
  HKSeriesType *seriesType;
  id v15;
  id v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  HKHRAFibBurdenTachogramClassificationsBuilder *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = (void *)MEMORY[0x1E0D29578];
  seriesType = self->_seriesType;
  v15 = a4;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v13, "entityEnumeratorWithType:profile:", seriesType, WeakRetained);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setPredicate:", v16);
  objc_msgSend(v18, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D29230]);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29358], objc_opt_class(), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOrderingTerms:", v20);

  v21 = [HKHRAFibBurdenTachogramClassificationsBuilder alloc];
  v22 = objc_loadWeakRetained((id *)&self->_profile);
  v23 = -[HKHRAFibBurdenTachogramClassificationsBuilder initWithProfile:classifier:](v21, "initWithProfile:classifier:", v22, v15);

  v38 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke;
  v34[3] = &unk_1E87EFE28;
  v24 = v11;
  v36 = v24;
  v34[4] = self;
  v25 = v12;
  v37 = v25;
  v26 = (id)v23;
  v35 = v26;
  LOBYTE(v23) = objc_msgSend(v18, "enumerateWithError:handler:", &v38, v34);
  v27 = v38;
  if ((v23 & 1) != 0)
  {
    objc_msgSend(v26, "buildClassifications");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[HKHRAFibBurdenTachogramClassificationsRetriever _tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:].cold.1((uint64_t)self, (uint64_t)v27, v29);

    v30 = v27;
    v31 = v30;
    if (v30)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v30);
      else
        _HKLogDroppedError();
    }

    v28 = 0;
  }

  return v28;
}

uint64_t __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;

  v3 = a2;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = (_QWORD *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldAnalyzeSample:", v3))
  {
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v7 = 0;
    if (v6)
    {
      if (v6 == 1)
        objc_msgSend(*(id *)(a1 + 40), "addSampleToClassify:dayIndex:", v3, v4);
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke_cold_1(v5, (uint64_t)v7, v8);

    }
  }

  return 1;
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

- (BOOL)_shouldAnalyzeSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v16;
  HKHRAFibBurdenTachogramClassificationsRetriever *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !objc_msgSend(v6, "integerValue"))
  {
    objc_msgSend(v4, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7240]);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9 && -[NSObject integerValue](v9, "integerValue") == 2)
    {
      v10 = 1;
LABEL_15:

      goto LABEL_16;
    }
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

    if (v13)
    {
      HKHRAFibBurdenLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_INFO, "[%@] Ignoring sample from incompatible tachogram version", (uint8_t *)&v16, 0xCu);
      }

    }
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

  if (v8)
  {
    HKHRAFibBurdenLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = self;
      _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_INFO, "[%@] Ignoring sample from non-background context", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_seriesType, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_FAULT, "[%@] Unable to determine majority time zone for sample, even though majority time zone should have considered all samples.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_tachogramClassificationsWithPredicate:(NSObject *)a3 tachogramClassifier:error:dayIndexBlock:filterBlock:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CC29C000, a2, a3, "[%@] Failed to enumerate across samples, received error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CC29C000, a2, a3, "[%@] Error while filtering samples: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
