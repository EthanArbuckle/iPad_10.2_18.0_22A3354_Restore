@implementation BerylliumBurdenDeterminer

- (BerylliumBurdenDeterminer)initWithAnalyticsEventSubmissionManager:(id)a3
{
  id v5;
  BerylliumBurdenDeterminer *v6;
  ABAfibBurdenAnalyzer *v7;
  ABAfibBurdenAnalyzer *analyzer;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BerylliumBurdenDeterminer;
  v6 = -[BerylliumBurdenDeterminer init](&v10, sel_init);
  if (v6)
  {
    v7 = (ABAfibBurdenAnalyzer *)objc_alloc_init(MEMORY[0x1E0CF6380]);
    analyzer = v6->_analyzer;
    v6->_analyzer = v7;

    objc_storeStrong((id *)&v6->_analyticsEventSubmissionManager, a3);
  }

  return v6;
}

- (id)burdenForTachogramClassifications:(id)a3 calculationType:(int64_t)a4 calculationTypeContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  id v21;
  id v22;
  int64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  _BOOL8 v46;
  id v47;
  void *v48;
  HDHRAFibBurdenAnalysisAnalyticsEvent *v49;
  void *v50;
  int64_t v51;
  HDHRAFibBurdenAnalysisAnalyticsEvent *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  HDHRAFibBurdenAnalysisAnalyticsEvent *v60;
  int64_t v61;
  id v62;
  void *v63;
  NSObject *v64;
  id v66;
  uint64_t v67;
  _QWORD *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    goto LABEL_17;
  HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FB80]), "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", 0, 0, objc_msgSend(v12, "integerValue"));
  }
  else
  {
    HKHRAFibBurdenAnalysisPercentageOverride();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = a6;
      v17 = objc_msgSend(v14, "integerValue");
      v18 = v17;
      if (v17 >= 0x65)
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:].cold.4(v18, v25, v26, v27, v28, v29, v30, v31);

        v13 = 0;
      }
      else
      {
        v19 = v17 < 3;
        v20 = v17 >= 3 ? v17 : 2;
        v21 = objc_alloc(MEMORY[0x1E0D2FB80]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v20 / 100.0);
        v22 = v11;
        v23 = a4;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v21, "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", v24, v19, 0);

        a4 = v23;
        v11 = v22;
      }
      a6 = v16;
    }
    else
    {
      v13 = 0;
    }

  }
  if (!v13)
  {
LABEL_17:
    v69 = v11;
    v32 = a4;
    objc_msgSend(v10, "hk_map:", &__block_literal_global_2, a6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABAfibBurdenAnalyzer determineBurdenForTachogramClassificationBuckets:](self->_analyzer, "determineBurdenForTachogramClassificationBuckets:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v35 = v10;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v36)
    {
      v37 = v36;
      v38 = 0;
      v39 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v71 != v39)
            objc_enumerationMutation(v35);
          v38 += objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "count");
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v37);
    }
    else
    {
      v38 = 0;
    }

    if (v34)
    {
      objc_msgSend(v34, "burdenPercentage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        switch(objc_msgSend(v34, "unavailabilityReason"))
        {
          case 0:
            _HKInitializeLogging();
            HKHRAFibBurdenLogForCategory();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:].cold.3((uint64_t)self, v64);
            goto LABEL_53;
          case 1:
            v66 = objc_alloc(MEMORY[0x1E0D2FB80]);
            v67 = 1;
            goto LABEL_49;
          case 2:
            v66 = objc_alloc(MEMORY[0x1E0D2FB80]);
            v67 = 2;
            goto LABEL_49;
          case 3:
            v66 = objc_alloc(MEMORY[0x1E0D2FB80]);
            v67 = 3;
LABEL_49:
            v13 = (void *)objc_msgSend(v66, "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", 0, 0, v67);
            if (!v13)
              goto LABEL_50;
            goto LABEL_31;
          default:
            _HKInitializeLogging();
            HKHRAFibBurdenLogForCategory();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:].cold.2((uint64_t)self, v34, v64);
LABEL_53:

            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unknown error occurred in AFib Burden infrastructure"));
            v52 = (HDHRAFibBurdenAnalysisAnalyticsEvent *)(id)objc_claimAutoreleasedReturnValue();
            v11 = v69;
            if (v52)
            {
              if (v68)
                *v68 = objc_retainAutorelease(v52);
              else
                _HKLogDroppedError();
            }

            goto LABEL_42;
        }
      }
      objc_msgSend(v34, "burdenPercentage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "floatValue");
      v44 = v43 - *MEMORY[0x1E0CF6378];

      v45 = -v44;
      if (v44 >= 0.0)
        v45 = v44;
      v46 = v45 < 2.2204e-16;
      v47 = objc_alloc(MEMORY[0x1E0D2FB80]);
      objc_msgSend(v34, "burdenPercentage");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v47, "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", v48, v46, 0);

      if (!v13)
      {
LABEL_50:
        v11 = v69;
        goto LABEL_44;
      }
LABEL_31:
      v49 = [HDHRAFibBurdenAnalysisAnalyticsEvent alloc];
      objc_msgSend(v34, "metricsForCoreAnalytics");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v32;
      v11 = v69;
      v52 = -[HDHRAFibBurdenAnalysisAnalyticsEvent initWithResult:calculationType:calculationTypeDetails:numberOfTachograms:additionalPayloadFromAlgorithm:](v49, "initWithResult:calculationType:calculationTypeDetails:numberOfTachograms:additionalPayloadFromAlgorithm:", v13, v51, v69, v38, v50);

      -[HKAnalyticsEventSubmissionManager submitEvent:error:](self->_analyticsEventSubmissionManager, "submitEvent:error:", v52, 0);
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:].cold.1((uint64_t)self, v53, v54, v55, v56, v57, v58, v59);

      v60 = [HDHRAFibBurdenAnalysisAnalyticsEvent alloc];
      v61 = v32;
      v11 = v69;
      v52 = -[HDHRAFibBurdenAnalysisAnalyticsEvent initWithResult:calculationType:calculationTypeDetails:numberOfTachograms:additionalPayloadFromAlgorithm:](v60, "initWithResult:calculationType:calculationTypeDetails:numberOfTachograms:additionalPayloadFromAlgorithm:", 0, v61, v69, v38, 0);
      -[HKAnalyticsEventSubmissionManager submitEvent:error:](self->_analyticsEventSubmissionManager, "submitEvent:error:", v52, 0);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Infrastructure error when determining AFib Burden value"));
      v62 = (id)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        if (v68)
          *v68 = objc_retainAutorelease(v62);
        else
          _HKLogDroppedError();
      }

LABEL_42:
      v13 = 0;
    }

LABEL_44:
  }

  return v13;
}

uint64_t __108__BerylliumBurdenDeterminer_burdenForTachogramClassifications_calculationType_calculationTypeContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_map:", &__block_literal_global_185);
}

uint64_t __108__BerylliumBurdenDeterminer_burdenForTachogramClassifications_calculationType_calculationTypeContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tachogramClassification");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

- (void)burdenForTachogramClassifications:(uint64_t)a3 calculationType:(uint64_t)a4 calculationTypeContext:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "[%@] Nil result received from Beryllium, implying infrastructure error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)burdenForTachogramClassifications:(NSObject *)a3 calculationType:calculationTypeContext:error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
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
  _os_log_fault_impl(&dword_1CC29C000, a3, OS_LOG_TYPE_FAULT, "[%@] Unexpected unavailability reason given: %lu", (uint8_t *)&v4, 0x16u);
}

- (void)burdenForTachogramClassifications:(uint64_t)a1 calculationType:(NSObject *)a2 calculationTypeContext:error:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_FAULT, "[%@] No burden percentage given but also no unavailability reason", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)burdenForTachogramClassifications:(uint64_t)a3 calculationType:(uint64_t)a4 calculationTypeContext:(uint64_t)a5 error:(uint64_t)a6 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "Invalid percentage given for HKHRAFibBurdenAnalysisPercentageOverride: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
