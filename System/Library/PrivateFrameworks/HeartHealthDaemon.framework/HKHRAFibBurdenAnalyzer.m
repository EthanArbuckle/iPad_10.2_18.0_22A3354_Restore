@implementation HKHRAFibBurdenAnalyzer

- (HKHRAFibBurdenAnalyzer)initWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  BerylliumBurdenDeterminer *v9;
  id v10;
  HKHRAFibBurdenTachogramClassificationsRetriever *v11;
  HKHRAFibBurdenTachogramClassifierFactory *v12;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v13;
  HKHRAFibBurdenAnalyzer *v14;

  v4 = (objc_class *)MEMORY[0x1E0CB62B8];
  v5 = a3;
  v6 = [v4 alloc];
  HKHRAFibBurdenLogForCategory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithLoggingCategory:healthDataSource:", v7, v5);

  v9 = -[BerylliumBurdenDeterminer initWithAnalyticsEventSubmissionManager:]([BerylliumBurdenDeterminer alloc], "initWithAnalyticsEventSubmissionManager:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v11 = -[HKHRAFibBurdenTachogramClassificationsRetriever initWithProfile:calendarCache:]([HKHRAFibBurdenTachogramClassificationsRetriever alloc], "initWithProfile:calendarCache:", v5, v10);
  v12 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
  v13 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer initWithProfile:calendarCache:]([HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer alloc], "initWithProfile:calendarCache:", v5, v10);

  v14 = -[HKHRAFibBurdenAnalyzer initWithClassificationRetriever:burdenDeterminer:tachogramClassifierFactory:majorityTimeZoneDeterminer:calendarCache:dateGenerator:](self, "initWithClassificationRetriever:burdenDeterminer:tachogramClassifierFactory:majorityTimeZoneDeterminer:calendarCache:dateGenerator:", v11, v9, v12, v13, v10, &__block_literal_global);
  return v14;
}

uint64_t __42__HKHRAFibBurdenAnalyzer_initWithProfile___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (HKHRAFibBurdenAnalyzer)initWithClassificationRetriever:(id)a3 burdenDeterminer:(id)a4 tachogramClassifierFactory:(id)a5 majorityTimeZoneDeterminer:(id)a6 calendarCache:(id)a7 dateGenerator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HKHRAFibBurdenAnalyzer *v19;
  HKHRAFibBurdenAnalyzer *v20;
  uint64_t v21;
  id dateGenerator;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HKHRAFibBurdenAnalyzer;
  v19 = -[HKHRAFibBurdenAnalyzer init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_classificationRetriever, a3);
    objc_storeStrong((id *)&v20->_burdenDeterminer, a4);
    objc_storeStrong((id *)&v20->_tachogramClassifierFactory, a5);
    objc_storeStrong((id *)&v20->_majorityTimeZoneDeterminer, a6);
    objc_storeStrong((id *)&v20->_calendarCache, a7);
    v21 = MEMORY[0x1D17A8B4C](v18);
    dateGenerator = v20->_dateGenerator;
    v20->_dateGenerator = (id)v21;

  }
  return v20;
}

- (id)generateSevenDayBurdenWithRange:(id)a3 breadcrumbManager:(id)a4 error:(id *)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  void *v10;
  HKHRAFibBurdenTachogramClassificationsRetriever *classificationRetriever;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  id v17;
  id v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  -[HKHRAFibBurdenTachogramClassifierFactory createTachogramClassifier](self->_tachogramClassifierFactory, "createTachogramClassifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  classificationRetriever = self->_classificationRetriever;
  v19 = 0;
  -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsDayIndexRange:tachogramClassifier:error:](classificationRetriever, "tachogramClassificationsDayIndexRange:tachogramClassifier:error:", var0, var1, v10, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (!v12)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[HKHRAFibBurdenAnalyzer generateSevenDayBurdenWithRange:breadcrumbManager:error:].cold.1();

    v17 = v13;
    if (v17)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    v14 = 0;
    v15 = CFSTR("Error classifying tachograms");
    goto LABEL_11;
  }
  objc_msgSend(v9, "dropBreadcrumb:", 4);
  -[HKHRAFibBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:](self->_burdenDeterminer, "burdenForTachogramClassifications:calculationType:calculationTypeContext:error:", v12, 0, 0, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = CFSTR("Error determining burden");
LABEL_11:
    objc_msgSend(v9, "dropAnalysisResultBreadcrumbWithContext:", v15);
  }

  return v14;
}

- (id)generateSixWeekBurdenHistogramsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKHRAFibBurdenTachogramClassifierFactory createTachogramClassifier](self->_tachogramClassifierFactory, "createTachogramClassifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHRAFibBurdenAnalyzer _generateDayOfWeekHistogramWithTachogramClassifier:error:](self, "_generateDayOfWeekHistogramWithTachogramClassifier:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HKHRAFibBurdenAnalyzer _generateTimeOfDayHistogramWithTachogramClassifier:error:](self, "_generateTimeOfDayHistogramWithTachogramClassifier:error:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBA0]), "initWithDayOfWeekHistogram:timeOfDayHistogram:", v6, v7);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_generateDayOfWeekHistogramWithTachogramClassifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id v10;
  unint64_t v11;
  void *v12;
  HKHRAFibBurdenTachogramClassificationsRetriever *classificationRetriever;
  void *v14;
  id v15;
  HKHRAFibBurdenDeterminer *burdenDeterminer;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  id *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  HKHRAFibBurdenAnalyzer *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HKHRAFibBurdenDayOfWeekHistogramOverride();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = self;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Using override for day of week histogram", buf, 0xCu);
    }

    v9 = v7;
  }
  else
  {
    v34 = a4;
    v10 = 0;
    v35 = 0;
    v36 = 0;
    v40 = 0;
    v41 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v11 = 1;
    while (1)
    {
      v12 = (void *)MEMORY[0x1D17A89E4]();
      classificationRetriever = self->_classificationRetriever;
      v43 = v10;
      -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsForLastSixWeeksOfWeekday:tachogramClassifier:error:](classificationRetriever, "tachogramClassificationsForLastSixWeeksOfWeekday:tachogramClassifier:error:", v11, v6, &v43);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v43;

      if (!v14)
        break;
      burdenDeterminer = self->_burdenDeterminer;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v15;
      -[HKHRAFibBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:](burdenDeterminer, "burdenForTachogramClassifications:calculationType:calculationTypeContext:error:", v14, 2, v17, &v42);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v42;

      if (v18)
      {
        switch(v11)
        {
          case 1uLL:
            v19 = v36;
            v36 = v18;
            goto LABEL_12;
          case 2uLL:
            v19 = v35;
            v35 = v18;
            goto LABEL_12;
          case 3uLL:
            v19 = v41;
            v41 = v18;
            goto LABEL_12;
          case 4uLL:
            v19 = v40;
            v40 = v18;
            goto LABEL_12;
          case 5uLL:
            v19 = v39;
            v39 = v18;
            goto LABEL_12;
          case 6uLL:
            v19 = v38;
            v38 = v18;
            goto LABEL_12;
          case 7uLL:
            v19 = v37;
            v37 = v18;
            goto LABEL_12;
          default:
            break;
        }
      }
      else
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[HKHRAFibBurdenAnalyzer _logDayNameForWeekday:](self, "_logDayNameForWeekday:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = self;
          v46 = 2112;
          v47 = v21;
          v48 = 2112;
          v49 = v10;
          _os_log_error_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_ERROR, "[%@] Error received while determining burden for %@, aborting day of week histogram burden analysis: %@", buf, 0x20u);

        }
LABEL_12:

      }
      objc_autoreleasePoolPop(v12);
      if (v18)
      {
        if (v11++ < 7)
          continue;
      }
      goto LABEL_26;
    }
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[HKHRAFibBurdenAnalyzer _logDayNameForWeekday:](self, "_logDayNameForWeekday:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v45 = self;
      v46 = 2112;
      v47 = v33;
      v48 = 2112;
      v49 = v15;
      _os_log_error_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_ERROR, "[%@] Error received while classifying tachograms for %@, aborting day of week histogram burden analysis: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v10 = v15;
LABEL_26:
    if (v10)
    {
      v7 = 0;
      v23 = v35;
      v24 = v36;
      v9 = v34;
      if (v34)
      {
        v9 = 0;
        *v34 = objc_retainAutorelease(v10);
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    else
    {
      v7 = 0;
      v23 = v35;
      v24 = v36;
      if (v36 && v35 && v41 && v40 && v39 && v38 && v37)
      {
        v9 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FB88]), "initWithSundayBurden:mondayBurden:tuesdayBurden:wednesdayBurden:thursdayBurden:fridayBurden:saturdayBurden:", v36, v35, v41, v40, v39, v38, v37);
      }
      else
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[HKHRAFibBurdenAnalyzer _generateDayOfWeekHistogramWithTachogramClassifier:error:].cold.1((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);

        v9 = 0;
      }
    }

  }
  return v9;
}

- (id)_generateTimeOfDayHistogramWithTachogramClassifier:(id)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  HKHRAFibBurdenTachogramClassificationsRetriever *classificationRetriever;
  NSObject *v16;
  NSObject *v17;
  HKHRAFibBurdenDeterminer *burdenDeterminer;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  uint8_t buf[4];
  HKHRAFibBurdenAnalyzer *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  NSObject *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  HKHRAFibBurdenTimeOfDayHistogramOverride();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = self;
      _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Using override for time of day histogram", buf, 0xCu);
    }

    v8 = v6;
  }
  else
  {
    v50 = 0;
    -[HKHRAFibBurdenAnalyzer _julianDayToTimeZoneMappingForPastSixWeeksWithError:](self, "_julianDayToTimeZoneMappingForPastSixWeeksWithError:", &v50);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v50;
    v46 = (void *)v9;
    if (v9)
    {
      v39 = a4;
      v11 = 0;
      v44 = 0;
      v45 = 0;
      v12 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      while (1)
      {
        v13 = (void *)MEMORY[0x1D17A89E4]();
        v14 = v12 + 4;
        classificationRetriever = self->_classificationRetriever;
        v49 = v10;
        -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsForLastSixWeeksOfHoursFrom:to:julianDayToMajorityTimeZone:tachogramClassifier:error:](classificationRetriever, "tachogramClassificationsForLastSixWeeksOfHoursFrom:to:julianDayToMajorityTimeZone:tachogramClassifier:error:", v12, v12 + 4, v46, v47, &v49);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v49;

        if (!v16)
          break;
        burdenDeterminer = self->_burdenDeterminer;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v17;
        -[HKHRAFibBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:](burdenDeterminer, "burdenForTachogramClassifications:calculationType:calculationTypeContext:error:", v16, 1, v19, &v48);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v48;

        if (!v20)
        {
          _HKInitializeLogging();
          HKHRAFibBurdenLogForCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v52 = self;
            v53 = 2048;
            v54 = v12;
            v55 = 2048;
            v56 = v12 + 4;
            v57 = 2112;
            v58 = v10;
            _os_log_error_impl(&dword_1CC29C000, v26, OS_LOG_TYPE_ERROR, "[%@] Error received while determining burden between hours %ld and %ld, aborting day of week histogram burden analysis: %@", buf, 0x2Au);
          }

          goto LABEL_33;
        }
        switch(v11)
        {
          case 0:
            v21 = v45;
            v45 = v20;
            break;
          case 1:
            v21 = v44;
            v44 = v20;
            break;
          case 2:
            v21 = v43;
            v43 = v20;
            break;
          case 3:
            v21 = v42;
            v42 = v20;
            break;
          case 4:
            v21 = v41;
            v41 = v20;
            break;
          case 5:
            v21 = v40;
            v40 = v20;
            break;
          default:
            _HKInitializeLogging();
            HKHRAFibBurdenLogForCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v52 = self;
              v53 = 2048;
              v54 = v12;
              _os_log_fault_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_FAULT, "[%@] Invalid start hour being used for burden analysis calculation: %ld", buf, 0x16u);
            }
            break;
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
        v12 += 4;
        if ((unint64_t)(v14 - 4) >= 0x14)
        {
          if (v10)
          {
LABEL_20:
            v22 = v45;
            v23 = v40;
            if (v39)
            {
              v8 = 0;
              *v39 = objc_retainAutorelease(v10);
            }
            else
            {
              _HKLogDroppedError();
              v8 = 0;
            }
            v6 = 0;
            v28 = v43;
            v27 = v44;
            v30 = v41;
            v29 = v42;
            goto LABEL_46;
          }
LABEL_34:
          v27 = v44;
          v22 = v45;
          v29 = v42;
          v28 = v43;
          v23 = v40;
          v30 = v41;
          if (v45 && v44 && v43 && v42 && v41 && v40)
          {
            v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBC0]), "initWithMidnightToFourAMBurden:fourAMtoEightAMBurden:eightAMToNoonBurden:noonToFourPMBurden:fourPMToEightPMBurden:eightPMToMidnightBurden:", v45, v44, v43, v42, v41, v40);
            v6 = 0;
          }
          else
          {
            _HKInitializeLogging();
            HKHRAFibBurdenLogForCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            v6 = 0;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              -[HKHRAFibBurdenAnalyzer _generateDayOfWeekHistogramWithTachogramClassifier:error:].cold.1((uint64_t)self, v31, v32, v33, v34, v35, v36, v37);

            v8 = 0;
          }
LABEL_46:

          goto LABEL_49;
        }
      }
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v52 = self;
        v53 = 2048;
        v54 = v12;
        v55 = 2048;
        v56 = v12 + 4;
        v57 = 2112;
        v58 = v17;
        _os_log_error_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_ERROR, "[%@] Error received while classifying tachograms between hours %ld and %ld, aborting time of day histogram burden analysis: %@", buf, 0x2Au);
      }
      v10 = v17;
LABEL_33:

      objc_autoreleasePoolPop(v13);
      if (v10)
        goto LABEL_20;
      goto LABEL_34;
    }
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[HKHRAFibBurdenAnalyzer _generateTimeOfDayHistogramWithTachogramClassifier:error:].cold.1();

    v25 = v10;
    v22 = v25;
    if (v25)
    {
      if (a4)
      {
        v22 = objc_retainAutorelease(v25);
        v8 = 0;
        *a4 = v22;
        v10 = v22;
        goto LABEL_49;
      }
      _HKLogDroppedError();
    }
    v8 = 0;
    v10 = v22;
LABEL_49:

  }
  return v8;
}

- (id)_julianDayToTimeZoneMappingForPastSixWeeksWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_dateGenerator + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", v8);

  -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:](self->_majorityTimeZoneDeterminer, "determineJulianDayToMajorityTimeZoneForRange:error:", v9 - 42, 42, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_logDayNameForWeekday:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return CFSTR("Unknownday");
  else
    return off_1E87EF440[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_majorityTimeZoneDeterminer, 0);
  objc_storeStrong((id *)&self->_tachogramClassifierFactory, 0);
  objc_storeStrong((id *)&self->_burdenDeterminer, 0);
  objc_storeStrong((id *)&self->_classificationRetriever, 0);
}

- (void)generateSevenDayBurdenWithRange:breadcrumbManager:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Error received while classifying tachograms, aborting seven day burden analysis: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_generateDayOfWeekHistogramWithTachogramClassifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CC29C000, a2, a3, "[%@] Expected to have all buckets filled in, at least one missing!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_generateTimeOfDayHistogramWithTachogramClassifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Error received while determining julian day to majority time zone, aborting time of day histogram burden analysis: %@");
  OUTLINED_FUNCTION_2();
}

@end
