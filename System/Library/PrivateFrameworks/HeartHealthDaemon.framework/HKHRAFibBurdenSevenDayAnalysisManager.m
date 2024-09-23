@implementation HKHRAFibBurdenSevenDayAnalysisManager

- (HKHRAFibBurdenSevenDayAnalysisManager)initWithProfile:(id)a3 analyzer:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  HKHRAFibBurdenSevenDayAnalysisModeDeterminer *v10;
  HKHRAFibBurdenSevenDayAnalysisManager *v11;

  v6 = (objc_class *)MEMORY[0x1E0CB6360];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer initWithProfile:calendarCache:]([HKHRAFibBurdenSevenDayAnalysisModeDeterminer alloc], "initWithProfile:calendarCache:", v8, v9);
  v11 = -[HKHRAFibBurdenSevenDayAnalysisManager initWithProfile:modeDeterminer:analyzer:calendarCache:dateGenerator:](self, "initWithProfile:modeDeterminer:analyzer:calendarCache:dateGenerator:", v8, v10, v7, v9, &__block_literal_global_15);

  return v11;
}

uint64_t __66__HKHRAFibBurdenSevenDayAnalysisManager_initWithProfile_analyzer___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (HKHRAFibBurdenSevenDayAnalysisManager)initWithProfile:(id)a3 modeDeterminer:(id)a4 analyzer:(id)a5 calendarCache:(id)a6 dateGenerator:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKHRAFibBurdenSevenDayAnalysisManager *v17;
  HKHRAFibBurdenSevenDayAnalysisManager *v18;
  uint64_t v19;
  id dateGenerator;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisManager;
  v17 = -[HKHRAFibBurdenSevenDayAnalysisManager init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_storeStrong((id *)&v18->_modeDeterminer, a4);
    objc_storeStrong((id *)&v18->_analyzer, a5);
    objc_storeStrong((id *)&v18->_calendarCache, a6);
    v19 = MEMORY[0x1D17A8B4C](v16);
    dateGenerator = v18->_dateGenerator;
    v18->_dateGenerator = (id)v19;

  }
  return v18;
}

- (id)analyzePreviousCalendarWeekWithFeatureStatus:(id)a3 shouldSaveSampleToDatabase:(BOOL)a4 breadcrumbManager:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  _QWORD *dateGenerator;
  void (*v12)(_QWORD *);
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HKHRAFibBurdenSevenDayAnalysisModeDeterminer *modeDeterminer;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  HKHRAFibBurdenAnalyzer *analyzer;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  _BOOL4 v41;
  const char *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v47;
  uint64_t v48;
  _BOOL4 v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  HKHRAFibBurdenSevenDayAnalysisManager *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v7 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  dateGenerator = self->_dateGenerator;
  v12 = (void (*)(_QWORD *))dateGenerator[2];
  v13 = a3;
  v12(dateGenerator);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKHRAFibBurdenSevenDayAnalysisManager _determineDayIndexRangeForPreviousCalendarWeekWithCurrentDate:](self, "_determineDayIndexRangeForPreviousCalendarWeekWithCurrentDate:", v14);
  v17 = v16;
  modeDeterminer = self->_modeDeterminer;
  v52 = 0;
  -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer determineModeForAnalysisWeekRange:featureStatus:error:](modeDeterminer, "determineModeForAnalysisWeekRange:featureStatus:error:", v15, v16, v13, &v52);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v52;
  if (!v19)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:].cold.1((uint64_t)self, (uint64_t)v20, v26);

    v20 = v20;
    if (v20)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    v24 = objc_alloc(MEMORY[0x1E0D2FBB8]);
    v25 = 1;
    goto LABEL_26;
  }
  v49 = v7;
  v21 = objc_msgSend(v19, "integerValue");
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21 != 2)
  {
    v48 = v21;
    if (v23)
    {
      NSStringFromHKDayIndexRange();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = self;
      v55 = 2112;
      v56 = v27;
      _os_log_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Performing analysis for day index range: %@", buf, 0x16u);

    }
    objc_msgSend(v10, "dropBreadcrumb:", 3);
    analyzer = self->_analyzer;
    v51 = v20;
    -[HKHRAFibBurdenAnalyzer generateSevenDayBurdenWithRange:breadcrumbManager:error:](analyzer, "generateSevenDayBurdenWithRange:breadcrumbManager:error:", v15, v17, v10, &v51);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v51;

    objc_msgSend(v10, "dropBreadcrumb:", 5);
    if (!v29)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:].cold.2();

      v30 = v30;
      if (v30)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v30);
        else
          _HKLogDroppedError();
      }

      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBB8]), "initWithResult:sample:onboardedWithinAnalysisInterval:", 1, 0, 0);
      goto LABEL_42;
    }
    v31 = objc_msgSend(v29, "unavailabilityReason");
    v32 = 0;
    v33 = CFSTR("Not enough total tachograms");
    v34 = 3;
    switch(v31)
    {
      case 0:
        objc_msgSend(v29, "burdenPercentage", CFSTR("Not enough total tachograms"));
        v35 = v29;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v47 = v35;
        v50 = v30;
        -[HKHRAFibBurdenSevenDayAnalysisManager _createBurdenSampleWithPercentage:burdenPercentageWasClampedToLowerBound:range:shouldSaveSampleToDatabase:error:](self, "_createBurdenSampleWithPercentage:burdenPercentageWasClampedToLowerBound:range:shouldSaveSampleToDatabase:error:", objc_msgSend(v35, "burdenPercentageWasClampedToLowerBound"), v15, v17, v49, &v50, v37);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v50;

        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (!v32)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:].cold.4();

          v32 = 0;
          v34 = 1;
          v30 = v38;
          v33 = CFSTR("Error saving sample to HealthKit");
          v29 = v47;
          goto LABEL_41;
        }
        v41 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        if (v49)
        {
          v29 = v47;
          if (v41)
          {
            *(_DWORD *)buf = 138412290;
            v54 = self;
            v42 = "[%@] Saved sample to HealthKit";
LABEL_39:
            _os_log_impl(&dword_1CC29C000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
          }
        }
        else
        {
          v29 = v47;
          if (v41)
          {
            *(_DWORD *)buf = 138412290;
            v54 = self;
            v42 = "[%@] Sample created but not saved";
            goto LABEL_39;
          }
        }

        v34 = 0;
        v33 = CFSTR("Sample created");
        v30 = v38;
LABEL_41:
        objc_msgSend(v10, "dropAnalysisResultBreadcrumbWithContext:", v33);
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBB8]), "initWithResult:sample:onboardedWithinAnalysisInterval:", v34, v32, v48 == 1);

LABEL_42:
        v20 = v30;
        goto LABEL_43;
      case 1:
        goto LABEL_41;
      case 2:
        v32 = 0;
        v33 = CFSTR("Not enough days with minimum number tachograms");
        v34 = 4;
        goto LABEL_41;
      case 3:
        v32 = 0;
        v33 = CFSTR("Not enough segments");
        v34 = 5;
        goto LABEL_41;
      default:
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:].cold.3((uint64_t)self, v29, v45);

        v32 = 0;
        v33 = CFSTR("Received unexpected unavailability reason");
        v34 = 1;
        goto LABEL_41;
    }
  }
  if (v23)
  {
    *(_DWORD *)buf = 138543362;
    v54 = self;
    _os_log_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mode determination indicated we should not perform analysis, skipping.", buf, 0xCu);
  }

  v24 = objc_alloc(MEMORY[0x1E0D2FBB8]);
  v25 = 2;
LABEL_26:
  v44 = (void *)objc_msgSend(v24, "initWithResult:sample:onboardedWithinAnalysisInterval:", v25, 0, 0);
LABEL_43:

  return v44;
}

- (BOOL)_isDayOneDayAfterCalendarWeekWithCurrentDate:(id)a3
{
  HKCalendarCache *calendarCache;
  id v4;
  void *v5;
  uint64_t v6;

  calendarCache = self->_calendarCache;
  v4 = a3;
  -[HKCalendarCache currentCalendar](calendarCache, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "component:fromDate:", 512, v4);

  LOBYTE(v4) = v6 == *MEMORY[0x1E0D2FAB0];
  return (char)v4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_determineDayIndexRangeForPreviousCalendarWeekWithCurrentDate:(id)a3
{
  HKCalendarCache *calendarCache;
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  calendarCache = self->_calendarCache;
  v4 = a3;
  -[HKCalendarCache currentCalendar](calendarCache, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HKHRAFibBurdenPreviousWeekDayIndexRange();
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)_createBurdenSampleWithPercentage:(double)a3 burdenPercentageWasClampedToLowerBound:(BOOL)a4 range:(id)a5 shouldSaveSampleToDatabase:(BOOL)a6 error:(id *)a7
{
  int64_t var1;
  int64_t var0;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HDProfile **p_profile;
  id WeakRetained;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  BOOL v42;
  id v43;
  void *v45;
  _BOOL4 v46;
  void *v47;
  _QWORD v48[2];

  v46 = a6;
  var1 = a5.var1;
  var0 = a5.var0;
  v48[1] = *MEMORY[0x1E0C80C00];
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", var0, 0, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = var0 + var1;
  v15 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v14, 0, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v20 = a7;
  objc_msgSend(v19, "quantityWithUnit:doubleValue:", v18, a3);
  v21 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v21;
  objc_msgSend(v24, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v25, v21, v15, v16, v26, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "deviceManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentDeviceEntityWithError:", v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v45 = v16;
    v32 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v32, "dataProvenanceManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "defaultLocalDataProvenanceWithDeviceEntity:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v27;
    if (v46)
    {
      v36 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v36, "dataManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "insertDataObjects:withProvenance:creationDate:error:", v38, v34, v20, CFAbsoluteTimeGetCurrent());
      v40 = v15;
      v41 = v39;

      v42 = v41 == 0;
      v15 = v40;
      if (v42)
        v35 = 0;
      else
        v35 = v27;
    }
    v43 = v35;

    v16 = v45;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_modeDeterminer, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:(NSObject *)a3 shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CC29C000, a2, a3, "[%{public}@] Error received when determining analysis mode: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Error received when performing burden analysis: %@");
  OUTLINED_FUNCTION_2();
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:(NSObject *)a3 shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "unavailabilityReason");
  _os_log_fault_impl(&dword_1CC29C000, a3, OS_LOG_TYPE_FAULT, "[%@] Received unexpected unavailability reason: %ld", (uint8_t *)&v4, 0x16u);
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Error saving sample to HealthKit: %@");
  OUTLINED_FUNCTION_2();
}

@end
