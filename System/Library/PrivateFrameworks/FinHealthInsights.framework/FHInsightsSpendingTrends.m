@implementation FHInsightsSpendingTrends

- (FHInsightsSpendingTrends)initWithWeeklyThreshold:(double)a3 monthlyThreshold:(double)a4 merchantCounts:(id)a5
{
  id v9;
  FHInsightsSpendingTrends *v10;
  id v11;
  uint64_t v12;
  FHDatabaseEntity *transactionAndFeauturesEntities;
  id v14;
  uint64_t v15;
  FHDatabaseEntity *insightsDestinationEntity;
  uint64_t v17;
  OS_dispatch_queue *insightsProcessingQueue;
  BOOL v19;
  double v20;
  BOOL v21;
  double v22;
  objc_super v24;

  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FHInsightsSpendingTrends;
  v10 = -[FHInsightsSpendingTrends init](&v24, sel_init);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BE315E8]);
    v12 = objc_msgSend(v11, "initWithJoinKey:entities:", *MEMORY[0x24BE31590], *MEMORY[0x24BE315A0], *MEMORY[0x24BE31588], 0);
    transactionAndFeauturesEntities = v10->_transactionAndFeauturesEntities;
    v10->_transactionAndFeauturesEntities = (FHDatabaseEntity *)v12;

    v14 = objc_alloc(MEMORY[0x24BE315E8]);
    v15 = objc_msgSend(v14, "initWithEntity:", *MEMORY[0x24BE31480]);
    insightsDestinationEntity = v10->_insightsDestinationEntity;
    v10->_insightsDestinationEntity = (FHDatabaseEntity *)v15;

    objc_msgSend((id)objc_opt_class(), "_defaultQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    insightsProcessingQueue = v10->_insightsProcessingQueue;
    v10->_insightsProcessingQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v10->_merchantCounts, a5);
    v19 = a3 > 1.0 || a3 < -1.0;
    v20 = *(double *)&defaultWeeklyThreshold;
    if (!v19)
      v20 = a3;
    v21 = a4 > 1.0 || a4 < -1.0;
    v22 = *(double *)&defaultMonthlyThreshold;
    if (!v21)
      v22 = a4;
    v10->_weeklyThreshold = v20;
    v10->_monthlyThreshold = v22;
  }

  return v10;
}

- (FHInsightsSpendingTrends)initWithMerchantCounts:(id)a3
{
  return -[FHInsightsSpendingTrends initWithWeeklyThreshold:monthlyThreshold:merchantCounts:](self, "initWithWeeklyThreshold:monthlyThreshold:merchantCounts:", a3, *(double *)&defaultWeeklyThreshold, *(double *)&defaultMonthlyThreshold);
}

- (FHInsightsSpendingTrends)trendsWithCompletion:(id)a3
{
  id v4;
  NSObject *insightsProcessingQueue;
  id v6;
  FHInsightsSpendingTrends *result;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  insightsProcessingQueue = self->_insightsProcessingQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__FHInsightsSpendingTrends_trendsWithCompletion___block_invoke;
  v8[3] = &unk_250C743F8;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(insightsProcessingQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return result;
}

void __49__FHInsightsSpendingTrends_trendsWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "clearData");
    objc_msgSend(*(id *)(a1 + 32), "_computeCategoryAndMerchantTrends");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_computeCategoryAndMerchantTrends
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  FHDatabaseEntity *transactionAndFeauturesEntities;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  double v23;
  double v24;
  NSObject *v25;
  _BOOL4 v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[24];
  id v59;
  id location;
  uint64_t v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[3];
  uint64_t v70;
  _QWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  double *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t (*v130)(uint64_t, uint64_t);
  void (*v131)(uint64_t);
  id v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t (*v142)(uint64_t, uint64_t);
  void (*v143)(uint64_t);
  id v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  id v156;
  uint8_t buf[4];
  double v158;
  uint64_t v159;

  v159 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_insightsProcessingQueue);
  objc_msgSend(MEMORY[0x24BE315E0], "initWithBuilder:", &__block_literal_global);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = 0;
  v152 = &v151;
  v153 = 0x3032000000;
  v154 = __Block_byref_object_copy_;
  v155 = __Block_byref_object_dispose_;
  v156 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v145 = 0;
  v146 = &v145;
  v147 = 0x3032000000;
  v148 = __Block_byref_object_copy_;
  v149 = __Block_byref_object_dispose_;
  v150 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v139 = 0;
  v140 = &v139;
  v141 = 0x3032000000;
  v142 = __Block_byref_object_copy_;
  v143 = __Block_byref_object_dispose_;
  v144 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v133 = 0;
  v134 = &v133;
  v135 = 0x3032000000;
  v136 = __Block_byref_object_copy_;
  v137 = __Block_byref_object_dispose_;
  v138 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v127 = 0;
  v128 = &v127;
  v129 = 0x3032000000;
  v130 = __Block_byref_object_copy_;
  v131 = __Block_byref_object_dispose_;
  v132 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = __Block_byref_object_copy_;
  v125 = __Block_byref_object_dispose_;
  v126 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = __Block_byref_object_copy_;
  v119 = __Block_byref_object_dispose_;
  v120 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy_;
  v113 = __Block_byref_object_dispose_;
  v114 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy_;
  v107 = __Block_byref_object_dispose_;
  v108 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy_;
  v101 = __Block_byref_object_dispose_;
  v102 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  v89 = 0;
  v90 = (double *)&v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v81 = 0;
  v82 = (double *)&v81;
  v83 = 0x2020000000;
  v84 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  v73 = 0;
  v74 = (double *)&v73;
  v75 = 0x2020000000;
  v76 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v72 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v72 = v5;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v70 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v70 = v8;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v68 = v11;
  v61 = 0;
  v62 = (double *)&v61;
  v63 = 0x2020000000;
  v64 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  v64 = v14;
  objc_initWeak(&location, self);
  transactionAndFeauturesEntities = self->_transactionAndFeauturesEntities;
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_73;
  v58[3] = &unk_250C74460;
  objc_copyWeak(&v59, &location);
  v16 = *MEMORY[0x24BE31500];
  v58[4] = &v61;
  v58[5] = &v65;
  v58[6] = v69;
  v58[7] = &v77;
  v58[8] = &v73;
  v58[9] = &v81;
  v58[10] = &v151;
  v58[11] = &v103;
  v58[12] = v71;
  v58[13] = &v93;
  v58[14] = &v89;
  v58[15] = &v127;
  v58[16] = &v97;
  v58[17] = &v145;
  v58[18] = &v121;
  v58[19] = &v139;
  v58[20] = &v115;
  v58[21] = &v133;
  v58[22] = &v109;
  v58[23] = &v85;
  -[FHDatabaseEntity queryDataWithBlock:logicalOperator:selectFields:usingBlock:](transactionAndFeauturesEntities, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:", v49, v16, &unk_250C77D38, v58);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v62[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v66[3]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateStartOfWeekOnMonday();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateEndOfWeekStartingOnMonday();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateStartOfMonth();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateEndOfMonth();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = FHNumberOfDaysBetweenDates();
  if ((defaultWeeklyFillFactorStatus & 1) != 0)
  {
    v22 = 1;
  }
  else if (FHIsDateBetweenDates() && v86[3] && v78[3])
  {
    -[FHInsightsSpendingTrends _fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:](self, "_fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:", v48, v19, v47, v21, v82[3], v74[3]);
    v24 = v23;
    v22 = v23 >= *MEMORY[0x24BE314A0];
    FinHealthLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v158 = v24;
      _os_log_impl(&dword_23B4E6000, v25, OS_LOG_TYPE_DEBUG, "weeklyFillFactor: %f", buf, 0xCu);
    }

  }
  else
  {
    v22 = 0;
  }
  if ((defaultMonthlyFillFactorStatus & 1) != 0)
  {
    v26 = 1;
    if (!v22)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (!FHIsDateBetweenDates() || !v86[3] || !v94[3])
  {
    v26 = 0;
    if (!v22)
      goto LABEL_22;
    goto LABEL_21;
  }
  -[FHInsightsSpendingTrends _fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:](self, "_fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:", v46, v19, v20, v21, v82[3], v90[3]);
  v28 = v27;
  v26 = v27 >= *MEMORY[0x24BE31490];
  FinHealthLogObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v158 = v28;
    _os_log_impl(&dword_23B4E6000, v29, OS_LOG_TYPE_DEBUG, "monthlyFillFactor: %f", buf, 0xCu);
  }

  if (v22)
  {
LABEL_21:
    v30 = (void *)v152[5];
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_80;
    v57[3] = &unk_250C74488;
    v57[4] = self;
    objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v57);
    v31 = (void *)v146[5];
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_2;
    v56[3] = &unk_250C74488;
    v56[4] = self;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v56);
    v32 = (void *)objc_msgSend((id)v104[5], "copy");
    -[FHInsightsSpendingTrends _orderedTimeStampAndAmountPair:](self, "_orderedTimeStampAndAmountPair:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHInsightsSpendingTrends _computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:](self, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v34, v35, CFSTR("Overall Spend"), CFSTR("FHInsightTypeOverallSpend"), 1);

    v36 = (void *)v140[5];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_3;
    v55[3] = &unk_250C74488;
    v55[4] = self;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v55);
    v37 = (void *)v134[5];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_4;
    v54[3] = &unk_250C74488;
    v54[4] = self;
    objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v54);

  }
LABEL_22:
  if (v26)
  {
    v38 = (void *)v128[5];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_5;
    v53[3] = &unk_250C74488;
    v53[4] = self;
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v53);
    v39 = (void *)v122[5];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_6;
    v52[3] = &unk_250C74488;
    v52[4] = self;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v52);
    v40 = (void *)objc_msgSend((id)v98[5], "copy");
    -[FHInsightsSpendingTrends _orderedTimeStampAndAmountPair:](self, "_orderedTimeStampAndAmountPair:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHInsightsSpendingTrends _computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:](self, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v42, v43, CFSTR("Overall Spend"), CFSTR("FHInsightTypeOverallSpend"), 2);

    v44 = (void *)v116[5];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_7;
    v51[3] = &unk_250C74488;
    v51[4] = self;
    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v51);
    v45 = (void *)v110[5];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_8;
    v50[3] = &unk_250C74488;
    v50[4] = self;
    objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v50);

  }
  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v121, 8);

  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v133, 8);

  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v145, 8);

  _Block_object_dispose(&v151, 8);
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *MEMORY[0x24BE31420];
  v3 = a2;
  objc_msgSend(v3, "addIntegerClause:fieldName:expression:", v2, CFSTR("transactions.t_type"), 0);
  objc_msgSend(v3, "addIntegerClause:fieldName:expression:", *MEMORY[0x24BE31428], CFSTR("transactions.t_status"), 0);
  objc_msgSend(v3, "addIntegerClause:fieldName:expression:", *MEMORY[0x24BE31430], CFSTR("transactions.t_status"), 1);
  objc_msgSend(v3, "addIntegerClause:fieldName:expression:", v2, CFSTR("transactions.a_type"), 2);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_73(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v6;
  id *WeakRetained;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id obj;
  id obja;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 192));
  if (WeakRetained && (a4 & 1) == 0)
  {
    objc_msgSend(v6, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9 / 100.0;

    objc_msgSend(v6, "objectAtIndex:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v6, "objectAtIndex:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "integerValue");
    FHMerchantCategoryToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndex:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndex:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndex:", 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fmin(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24), v13);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), v13);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
    FHDateStartOfWeekOnMonday();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "timeIntervalSinceReferenceDate");
    v22 = v21;
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(double *)(v23 + 24);
    if (v22 <= v24)
    {
      if (v22 == v24)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
      }
    }
    else
    {
      *(double *)(v23 + 24) = v22;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24);
    v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v22);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "objectForKey:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
      v27 = v25;
    else
      v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v28 = v27;

    objc_msgSend(v28, "setOrAddToDoubleValue:forKey:", v108, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setOrAddToDoubleValue:forKey:", v108, v10);
    v103 = v28;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKey:", v28, v15);
    FHDateStartOfMonth();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    v31 = v30;
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v33 = *(double *)(v32 + 24);
    v97 = (void *)v20;
    v98 = v6;
    v95 = v29;
    if (v31 <= v33)
    {
      if (v31 == v33)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v10
                                                                     + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112)
                                                                                             + 8)
                                                                                 + 24);
      }
    }
    else
    {
      *(double *)(v32 + 24) = v31;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v10;
    }
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v31);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "objectForKey:", v15);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
      v37 = v35;
    else
      v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v38 = v37;

    objc_msgSend(v38, "setOrAddToDoubleValue:forKey:", v34, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "setOrAddToDoubleValue:forKey:", v34, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "setObject:forKey:", v38, v15);
    objc_msgSend(WeakRetained[3], "objectForKey:", v105);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "integerValue");
    v41 = *MEMORY[0x24BE31488];

    if (v40 > v41)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), "objectForKey:", v105);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      v44 = v19;
      if (v42)
        v45 = v42;
      else
        v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v46 = v45;

      objc_msgSend(v46, "setOrAddToDoubleValue:forKey:", v108, v10);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), "setObject:forKey:", v46, v105);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "objectForKey:", v105);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
        v49 = v47;
      else
        v49 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v50 = v49;

      objc_msgSend(v50, "setOrAddToDoubleValue:forKey:", v34, v10);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setObject:forKey:", v50, v105);

      v19 = v44;
    }
    v51 = v103;
    v52 = v104;
    v100 = v15;
    v101 = WeakRetained;
    v99 = v19;
    v102 = v38;
    if (v104)
    {
      objc_msgSend(v104, "componentsSeparatedByString:", *MEMORY[0x24BE31570]);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE31678], "reconstructAggregateFeaturesWithProcessingWindow:");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K == %@ OR SELF.%K == %@"), *MEMORY[0x24BE31418], *MEMORY[0x24BE31560], *MEMORY[0x24BE31418], *MEMORY[0x24BE31558]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v53;
      objc_msgSend(v53, "filteredArrayUsingPredicate:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v55, "count"))
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v92 = v55;
        obj = v55;
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v114;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v114 != v58)
                objc_enumerationMutation(obj);
              v60 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
              v61 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40);
              objc_msgSend(v60, "name");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectForKey:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v63;
              if (v63)
                v65 = v63;
              else
                v65 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v66 = v65;

              objc_msgSend(v66, "setOrAddToDoubleValue:forKey:", v108, v10);
              v67 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40);
              objc_msgSend(v60, "name");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setObject:forKey:", v66, v68);

              v69 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
              objc_msgSend(v60, "name");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKey:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v71;
              if (v71)
                v73 = v71;
              else
                v73 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v74 = v73;

              objc_msgSend(v74, "setOrAddToDoubleValue:forKey:", v34, v10);
              v75 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
              objc_msgSend(v60, "name");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setObject:forKey:", v74, v76);

            }
            v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
          }
          while (v57);
        }

        v15 = v100;
        WeakRetained = v101;
        v51 = v103;
        v52 = v104;
        v19 = v99;
        v38 = v102;
        v55 = v92;
      }

    }
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BE31678], "reconstructCompoundFeatures:", v19);
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "objectForKey:", *MEMORY[0x24BE31568]);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v77;
      if (v77)
      {
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v110;
          do
          {
            for (j = 0; j != v80; ++j)
            {
              if (*(_QWORD *)v110 != v81)
                objc_enumerationMutation(v78);
              objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * j), "featureLabel");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "objectForKey:", v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v84;
              if (v84)
                v86 = v84;
              else
                v86 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v87 = v86;

              objc_msgSend(v87, "setOrAddToDoubleValue:forKey:", v108, v10);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setObject:forKey:", v87, v83);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "objectForKey:", v83);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = v88;
              if (v88)
                v90 = v88;
              else
                v90 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v91 = v90;

              objc_msgSend(v91, "setOrAddToDoubleValue:forKey:", v34, v10);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "setObject:forKey:", v91, v83);

            }
            v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
          }
          while (v80);
        }
      }

      v15 = v100;
      WeakRetained = v101;
      v51 = v103;
      v52 = v104;
      v19 = v99;
      v38 = v102;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24);

    v6 = v98;
  }

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeCategorySpend"), 1);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeMerchantSpend"), 1);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeAggregateTag"), 1);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeCompoundTag"), 1);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeCategorySpend"), 2);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeMerchantSpend"), 2);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeAggregateTag"), 2);

}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "_orderedTimeStampAndAmountPair:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_computeAndStoreTrend:indexedAmountSums:insightFeatureName:insightType:trendWindow:", v9, v10, v6, CFSTR("FHInsightTypeCompoundTag"), 2);

}

- (double)_fillFactorWithStartOfPeriodForMostRecentEntryDate:(id)a3 mostRecentEntryDate:(id)a4 endOfPeriodForMostRecentEntryDate:(id)a5 numberOfDaysSinceFirstTransaction:(unint64_t)a6 transactionCount:(unint64_t)a7 transactionCountForMostRecentPeriod:(unint64_t)a8 transactionAmountSums:(double)a9 transactionAmountSumsForMostRecentPeriod:(double)a10
{
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  int v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = a5;
  v17 = a3;
  v18 = FHNumberOfDaysBetweenDates();
  v19 = FHNumberOfDaysBetweenDates();

  v20 = (a10 / (double)(unint64_t)v18 / ((double)(unint64_t)(a9 - a10) / (double)(a6 - v18))
       + (double)(unint64_t)v18 / (double)(unint64_t)v19
       + (double)a8 / (double)(unint64_t)v18 / ((double)(a7 - a8) / (double)(a6 - v18)))
      / 3.0;
  FinHealthLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134217984;
    v24 = v20;
    _os_log_impl(&dword_23B4E6000, v21, OS_LOG_TYPE_DEBUG, "fillFactorForPeriod: %f", (uint8_t *)&v23, 0xCu);
  }

  return v20;
}

- (id)_orderedTimeStampAndAmountPair:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_84);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v4, "addObject:", v13);
            objc_msgSend(v3, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v10);
      }

    }
  }
  v15 = (void *)MEMORY[0x24BDBCE30];
  v16 = (void *)objc_msgSend(v4, "copy");
  v17 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v15, "arrayWithObjects:", v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __59__FHInsightsSpendingTrends__orderedTimeStampAndAmountPair___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "lessThanOrEqual:", a2);
}

- (void)_computeAndStoreTrend:(id)a3 indexedAmountSums:(id)a4 insightFeatureName:(id)a5 insightType:(id)a6 trendWindow:(int64_t)a7
{
  uint64_t v12;
  double v13;
  NSObject *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  FHInsightsSpendingTrends *v38;
  int64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  uint8_t buf[4];
  double v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v43 = a4;
  v41 = a5;
  v39 = a7;
  v40 = a6;
  v12 = 48;
  if (a7 == 1)
    v12 = 40;
  v38 = self;
  v13 = *(double *)((char *)&self->super.isa + v12);
  FinHealthLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v53 = v13;
    _os_log_impl(&dword_23B4E6000, v14, OS_LOG_TYPE_DEBUG, "threshold: %f", buf, 0xCu);
  }

  v15 = (unint64_t *)MEMORY[0x24BE314A8];
  if (a7 != 1)
    v15 = (unint64_t *)MEMORY[0x24BE31498];
  v16 = *v15;
  v17 = objc_msgSend(v43, "count");
  if (v17 >= v16)
  {
    v18 = v17;
    v19 = 0x24BDD1000uLL;
    do
    {
      objc_msgSend(v43, "subarrayWithRange:", v18 - v16, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndex:", --v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      objc_msgSend(MEMORY[0x24BE31680], "kendallCoefficientWithIndexedAmountSums:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(*(Class *)(v19 + 1304)), "initWithDouble:", v13);
      v26 = objc_msgSend(v24, "greaterThanOrEqual:", v25);

      if ((v26 & 1) != 0)
      {
        v27 = 1;
      }
      else
      {
        v28 = (void *)objc_msgSend(objc_alloc(*(Class *)(v19 + 1304)), "initWithDouble:", -v13);
        v29 = objc_msgSend(v24, "lessThanOrEqual:", v28);

        if ((v29 & 1) == 0)
        {
          FinHealthLogObject();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v53 = *(double *)&v41;
            v54 = 2112;
            v55 = v40;
            _os_log_impl(&dword_23B4E6000, v30, OS_LOG_TYPE_DEBUG, "No trend detected for %@: %@", buf, 0x16u);
          }
          goto LABEL_15;
        }
        v27 = 2;
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v20, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:argumentArray:", CFSTR("average(%@)"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "expressionValueWithObject:context:", 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BE315F0];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __111__FHInsightsSpendingTrends__computeAndStoreTrend_indexedAmountSums_insightFeatureName_insightType_trendWindow___block_invoke;
      v44[3] = &unk_250C744F0;
      v49 = v23;
      v50 = v27;
      v45 = v41;
      v46 = v40;
      v47 = v32;
      v51 = v39;
      v48 = v33;
      v35 = v33;
      v36 = v32;
      objc_msgSend(v34, "initWithBuilder:", v44);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseEntity insertOrUpdate:upsert:](v38->_insightsDestinationEntity, "insertOrUpdate:upsert:", v37, 0);

      v19 = 0x24BDD1000;
LABEL_15:

    }
    while (v18 >= v16);
  }

}

void __111__FHInsightsSpendingTrends__computeAndStoreTrend_indexedAmountSums_insightFeatureName_insightType_trendWindow___block_invoke(double *a1, void *a2)
{
  double v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;

  v3 = a1[8];
  v4 = a2;
  objc_msgSend(v4, "addDoubleValueForField:fieldValue:", CFSTR("features_insight_trends.trend_date"), v3);
  objc_msgSend(v4, "addIntegerValueForField:fieldValue:", CFSTR("features_insight_trends.trend_direction"), *((_QWORD *)a1 + 9));
  objc_msgSend(v4, "addStringValueForField:fieldValue:", CFSTR("features_insight_trends.trend_feature_name"), *((_QWORD *)a1 + 4));
  objc_msgSend(v4, "addStringValueForField:fieldValue:", CFSTR("features_insight_trends.trend_feature_type"), *((_QWORD *)a1 + 5));
  objc_msgSend(v4, "addIntegerValueForField:fieldValue:", CFSTR("features_insight_trends.trend_window"), *((_QWORD *)a1 + 10));
  objc_msgSend(v4, "addNumberValueForField:fieldValue:", CFSTR("features_insight_trends.trend_average"), *((_QWORD *)a1 + 6));
  objc_msgSend(v4, "addDecimalNumberValueForField:fieldValue:", CFSTR("features_insight_trends.trend_spend"), *((_QWORD *)a1 + 7));
  v5 = CFSTR("Downward");
  if (*((_QWORD *)a1 + 9) == 1)
    v5 = CFSTR("Upward");
  v6 = CFSTR("monthly");
  if (*((_QWORD *)a1 + 10) == 1)
    v6 = CFSTR("weekly");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ trend for feature %@, type %@"), v5, v6, *((_QWORD *)a1 + 4), *((_QWORD *)a1 + 5));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addStringValueForField:fieldValue:", CFSTR("features_insight_trends.trend_readable_description"), v7);

}

- (id)_kendallCoefficientWithIndexedAmountSums:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;

  v3 = a3;
  v4 = v3;
  if (!v3 || (unint64_t)objc_msgSend(v3, "count") < 2)
    goto LABEL_14;
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
    do
    {
      for (i = v7; i < objc_msgSend(v4, "count"); ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "lessThan:", v10);

        if (v11)
        {
          ++v5;
        }
        else
        {
          objc_msgSend(v4, "objectAtIndex:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndex:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "greaterThan:", v13);

          v6 += v14;
        }
      }
      ++v7;
    }
    while (v7 < objc_msgSend(v4, "count") - 1);
  }
  if (v6 + v5)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", (double)(v5 - v6) / (double)(v6 + v5));
  else
LABEL_14:
    v15 = 0;

  return v15;
}

+ (id)_defaultQueue
{
  if (_defaultQueue_onceToken != -1)
    dispatch_once(&_defaultQueue_onceToken, &__block_literal_global_117);
  return (id)_defaultQueue_defaultQueue;
}

void __41__FHInsightsSpendingTrends__defaultQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.finhealth.insights", 0);
  v1 = (void *)_defaultQueue_defaultQueue;
  _defaultQueue_defaultQueue = (uint64_t)v0;

}

+ (void)setThresholdsWithWeeklyThreshold:(double)a3 monthlyThreshold:(double)a4
{
  defaultWeeklyThreshold = *(_QWORD *)&a3;
  defaultMonthlyThreshold = *(_QWORD *)&a4;
}

+ (void)overrideWeeklyFillFactor
{
  defaultWeeklyFillFactorStatus = 1;
}

+ (void)overrideMonthlyFillFactor
{
  defaultMonthlyFillFactorStatus = 1;
}

- (FHDatabaseEntity)transactionAndFeauturesEntities
{
  return self->_transactionAndFeauturesEntities;
}

- (void)setTransactionAndFeauturesEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FHDatabaseEntity)insightsDestinationEntity
{
  return self->_insightsDestinationEntity;
}

- (void)setInsightsDestinationEntity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)merchantCounts
{
  return self->_merchantCounts;
}

- (void)setMerchantCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)insightsProcessingQueue
{
  return self->_insightsProcessingQueue;
}

- (double)weeklyThreshold
{
  return self->_weeklyThreshold;
}

- (double)monthlyThreshold
{
  return self->_monthlyThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insightsProcessingQueue, 0);
  objc_storeStrong((id *)&self->_merchantCounts, 0);
  objc_storeStrong((id *)&self->_insightsDestinationEntity, 0);
  objc_storeStrong((id *)&self->_transactionAndFeauturesEntities, 0);
}

@end
