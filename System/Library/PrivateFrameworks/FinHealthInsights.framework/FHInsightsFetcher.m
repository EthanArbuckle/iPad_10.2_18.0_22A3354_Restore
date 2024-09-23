@implementation FHInsightsFetcher

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_insightsFetcher;
}

void __35__FHInsightsFetcher_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FHInsightsFetcher _init]([FHInsightsFetcher alloc], "_init");
  v1 = (void *)sharedInstance_insightsFetcher;
  sharedInstance_insightsFetcher = (uint64_t)v0;

}

- (id)_init
{
  FHInsightsFetcher *v2;
  uint64_t v3;
  NSDecimalNumberHandler *roundingBehavior;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHInsightsFetcher;
  v2 = -[FHInsightsFetcher init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1520], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 2, 0, 0, 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    roundingBehavior = v2->_roundingBehavior;
    v2->_roundingBehavior = (NSDecimalNumberHandler *)v3;

  }
  return v2;
}

- (id)totalSpendAmountBetweenDates:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  int v23;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = (id)objc_opt_new();
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  v8 = objc_alloc(MEMORY[0x24BE315E8]);
  v9 = (void *)objc_msgSend(v8, "initWithEntity:", *MEMORY[0x24BE315A0]);
  objc_msgSend(v9, "fieldsInOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE315E0];
  v12 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke;
  v25[3] = &unk_250C74628;
  v13 = v5;
  v26 = v13;
  v14 = v6;
  v27 = v14;
  objc_msgSend(v11, "initWithBuilder:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE31500];
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke_2;
  v24[3] = &unk_250C74650;
  v24[4] = &v28;
  v24[5] = &v32;
  objc_msgSend(v9, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:", v15, v16, v10, v24);
  v17 = (void *)MEMORY[0x24BDD1518];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "decimalValue");
  }
  else
  {
    v22[0] = 0;
    v22[1] = 0;
    v23 = 0;
  }
  objc_msgSend(v17, "decimalNumberWithDecimal:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v20, CFSTR("overallSpending"));

  objc_msgSend(v7, "setValue:forKey:", v33[5], CFSTR("categorySpending"));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v7;
}

void __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *MEMORY[0x24BE31428];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "addDateClause:fieldName:expression:", v3, CFSTR("transactions.t_date"), v4);
  objc_msgSend(v5, "addDateClause:fieldName:expression:", *MEMORY[0x24BE31430], CFSTR("transactions.t_date"), *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "addIntegerClause:fieldName:expression:", *MEMORY[0x24BE31420], CFSTR("transactions.a_type"), 2);
  objc_msgSend(v5, "addIntegerClause:fieldName:expression:", *MEMORY[0x24BE31438], CFSTR("transactions.t_fh_internal_state"), 6);

}

void __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v3 = objc_msgSend(v14, "signedIntegerAtIndex:", 14);
  v4 = objc_msgSend(v14, "signedIntegerAtIndex:", 10);
  if (v3 == 13 || !v3)
  {
    v5 = (void *)MEMORY[0x24BDD1518];
    objc_msgSend(v14, "objectAtIndex:", 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decimalNumberWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 <= 8 && ((1 << v4) & 0x103) != 0)
    {
      v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      objc_msgSend(v14, "objectAtIndex:", 6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9 + v11;

      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v14, "objectAtIndex:", 23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOrAddToDecimalValue:forKey:", v8, v13);

    }
  }

}

- (id)retrieveSpendInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t i;
  void *v46;
  FHCategorySpendInsight *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  os_signpost_id_t v79;
  NSObject *v80;
  void *v81;
  void *v83;
  FHOverallSpendInsight *v84;
  void *v85;
  id v86;
  uint64_t v87;
  int64_t v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  FHInsightsFetcher *ptr;
  id obj;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[16];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v91 = a3;
  v9 = a4;
  FinHealthLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  FinHealthLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  ptr = self;
  v12 = os_signpost_id_make_with_pointer(v11, self);

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23B4E6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "insight:retriveSpendingInsights", (const char *)&unk_23B4F4707, buf, 2u);
  }

  FinHealthLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23B4E6000, v13, OS_LOG_TYPE_INFO, "BEGIN \"insight:retriveSpendingInsights\", buf, 2u);
  }

  v84 = objc_alloc_init(FHOverallSpendInsight);
  v89 = (void *)objc_opt_new();
  +[FHInsightsFetcher sharedInstance](FHInsightsFetcher, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "totalSpendAmountBetweenDates:endDate:", v91, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKey:", CFSTR("overallSpending"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  v83 = v15;
  objc_msgSend(v15, "objectForKey:", CFSTR("categorySpending"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = FHIsDateBetweenDates();

  if ((_DWORD)v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = FHNumberOfDaysBetweenDates();

  }
  else
  {
    v22 = FHNumberOfDaysBetweenDates();
  }
  switch(a6)
  {
    case 3:
      FHStartOfLastYear();
      v23 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      FHDateStartOfLastMonth();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == FHNumberOfDaysInMonthForDate() || v22 >= FHNumberOfDaysInMonthForDate())
        FHNumberOfDaysInMonthForDate();
      goto LABEL_18;
    case 1:
      FHDateFromNumberOfDays();
      v23 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v30 = 0.0;
      v34 = 3.40282347e38;
      v32 = v18;
      goto LABEL_23;
  }
  v24 = (void *)v23;
LABEL_18:
  FHDateFromNumberOfDays();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[FHInsightsFetcher sharedInstance](FHInsightsFetcher, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "totalSpendAmountBetweenDates:endDate:", v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "objectForKey:", CFSTR("overallSpending"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  objc_msgSend(v27, "objectForKey:", CFSTR("categorySpending"));
  v31 = objc_claimAutoreleasedReturnValue();

  v32 = v18 - v30;
  v33 = fabs(v18 - v30) / v30 * 100.0;
  if (v30 == 0.0)
    v34 = 3.40282347e38;
  else
    v34 = v33;
  v90 = (void *)v31;
LABEL_23:
  v35 = 2;
  if (v32 >= 0.0)
    v35 = 1;
  if (v32 == 0.0)
    v36 = 0;
  else
    v36 = v35;
  -[FHFeatureInsight setDirection:](v84, "setDirection:", v36);
  -[FHFeatureInsight setType:](v84, "setType:", CFSTR("FHInsightTypeOverallSpend"));
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v18 / 100.0);
  objc_msgSend(v37, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHFeatureInsight setSpendAmount:](v84, "setSpendAmount:", v38);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v30 / 100.0);
  objc_msgSend(v39, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHFeatureInsight setAverageAmount:](v84, "setAverageAmount:", v40);

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v32 / 100.0);
  objc_msgSend(v41, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHFeatureInsight setSpendingInsightAmount:](v84, "setSpendingInsightAmount:", v42);

  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v34);
  objc_msgSend(v43, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHFeatureInsight setSpendingInsightPercentageValue:](v84, "setSpendingInsightPercentageValue:", v44);

  -[FHFeatureInsight setStartDate:](v84, "setStartDate:", v91);
  -[FHFeatureInsight setEndDate:](v84, "setEndDate:", v9);
  -[FHFeatureInsight setWindow:](v84, "setWindow:", a6);
  -[FHFeatureInsight setCurrencyCode:](v84, "setCurrencyCode:", CFSTR("USD"));
  objc_msgSend(v89, "addObject:", v84);
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v19;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
  if (v92)
  {
    v87 = *(_QWORD *)v97;
    v88 = a6;
    v86 = v9;
    do
    {
      for (i = 0; i != v92; ++i)
      {
        if (*(_QWORD *)v97 != v87)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        v47 = objc_alloc_init(FHCategorySpendInsight);
        objc_msgSend(MEMORY[0x24BDD1518], "zero");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "zero");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectForKeyedSubscript:", v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "objectForKey:", v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v90, "objectForKeyedSubscript:", v46);
          v52 = objc_claimAutoreleasedReturnValue();

          v48 = (void *)v52;
        }
        v95 = v50;
        objc_msgSend(v50, "decimalNumberBySubtracting:", v48);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = 0x24BDD1000uLL;
        objc_msgSend(MEMORY[0x24BDD1518], "zero");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v48, "compare:", v56);

        if (!v57)
        {
          -[FHFeatureInsight setDirection:](v47, "setDirection:", 1);
          v66 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", 3.40282347e38);
LABEL_41:
          v62 = (void *)v66;
          -[FHFeatureInsight setSpendingInsightPercentageValue:](v47, "setSpendingInsightPercentageValue:", v66);
          goto LABEL_44;
        }
        objc_msgSend(MEMORY[0x24BDD1518], "zero");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v54, "compare:", v58);

        if (!v59)
        {
          -[FHFeatureInsight setDirection:](v47, "setDirection:", 0);
          objc_msgSend(MEMORY[0x24BDD1518], "zero");
          v66 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        objc_msgSend(MEMORY[0x24BDD1518], "zero");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v54, "compare:", v60);

        if (v61 == 1)
        {
          -[FHFeatureInsight setDirection:](v47, "setDirection:", 1);
          objc_msgSend(v54, "decimalNumberByDividingBy:", v48);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("100"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "decimalNumberByMultiplyingBy:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHFeatureInsight setSpendingInsightPercentageValue:](v47, "setSpendingInsightPercentageValue:", v65);

          v55 = 0x24BDD1000;
        }
        else
        {
          -[FHFeatureInsight setDirection:](v47, "setDirection:", 2);
          objc_msgSend(v48, "decimalNumberBySubtracting:", v95);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "decimalNumberByDividingBy:", v48);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("100"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "decimalNumberByMultiplyingBy:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "decimalNumberByRoundingAccordingToBehavior:", ptr->_roundingBehavior);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHFeatureInsight setSpendingInsightPercentageValue:](v47, "setSpendingInsightPercentageValue:", v69);

        }
        v9 = v86;
LABEL_44:

        -[FHFeatureInsight setType:](v47, "setType:", CFSTR("FHInsightTypeCategorySpend"));
        objc_msgSend(*(id *)(v55 + 1304), "defaultDatabaseAmountMultiplier");
        v70 = v55;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "decimalNumberByDividingBy:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHFeatureInsight setSpendAmount:](v47, "setSpendAmount:", v72);

        objc_msgSend(*(id *)(v70 + 1304), "defaultDatabaseAmountMultiplier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "decimalNumberByDividingBy:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHFeatureInsight setAverageAmount:](v47, "setAverageAmount:", v74);

        objc_msgSend(*(id *)(v70 + 1304), "defaultDatabaseAmountMultiplier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "decimalNumberByDividingBy:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHFeatureInsight setSpendingInsightAmount:](v47, "setSpendingInsightAmount:", v76);

        -[FHFeatureInsight setStartDate:](v47, "setStartDate:", v91);
        -[FHFeatureInsight setEndDate:](v47, "setEndDate:", v9);
        -[FHFeatureInsight setWindow:](v47, "setWindow:", v88);
        -[FHFeatureInsight setCurrencyCode:](v47, "setCurrencyCode:", CFSTR("USD"));
        -[FHCategorySpendInsight setMerchantCategory:](v47, "setMerchantCategory:", (int)objc_msgSend(v46, "intValue"));
        objc_msgSend(v89, "addObject:", v47);

      }
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    }
    while (v92);
  }

  FinHealthLogObject();
  v77 = objc_claimAutoreleasedReturnValue();
  FinHealthLogObject();
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = os_signpost_id_make_with_pointer(v78, ptr);

  if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23B4E6000, v77, OS_SIGNPOST_INTERVAL_END, v79, "insight:retriveSpendingInsights", (const char *)&unk_23B4F4707, buf, 2u);
  }

  FinHealthLogObject();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23B4E6000, v80, OS_LOG_TYPE_INFO, "END \"insight:retriveSpendingInsights\", buf, 2u);
  }

  v81 = (void *)objc_msgSend(v89, "copy");
  return v81;
}

- (id)retrieveInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 *p_buf;
  id v34[2];
  id location;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x24BE315E8]);
  v13 = (void *)objc_msgSend(v12, "initWithEntity:", *MEMORY[0x24BE31480]);
  objc_msgSend(v13, "fieldsInOrder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BE315E0];
  v17 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke;
  v36[3] = &unk_250C74628;
  v18 = v9;
  v37 = v18;
  v19 = v10;
  v38 = v19;
  objc_msgSend(v16, "initWithBuilder:", v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  FinHealthLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_23B4E6000, v21, OS_LOG_TYPE_DEBUG, "databaseClauses: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = (id)objc_opt_new();
  objc_initWeak(&location, self);
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_74;
  v31[3] = &unk_250C74678;
  objc_copyWeak(v34, &location);
  v22 = *MEMORY[0x24BE31500];
  v34[1] = (id)a6;
  v23 = v11;
  v32 = v23;
  p_buf = &buf;
  objc_msgSend(v13, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:", v20, v22, v15, v31);
  v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_2;
  v29[3] = &unk_250C746A0;
  v25 = v23;
  v30 = v25;
  objc_msgSend(v24, "sortUsingComparator:", v29);
  v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  return v26;
}

void __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *MEMORY[0x24BE31428];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "addDateClause:fieldName:expression:", v3, CFSTR("features_insight_trends.trend_date"), v4);
  objc_msgSend(v5, "addDateClause:fieldName:expression:", *MEMORY[0x24BE31430], CFSTR("features_insight_trends.trend_date"), *(_QWORD *)(a1 + 40));

}

void __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_74(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  FHCategorySpendInsight *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;

  v35 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (a4 & 1) == 0)
  {
    objc_msgSend(v35, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v35, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(v35, "objectAtIndex:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    objc_msgSend(v35, "objectAtIndex:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v35, "objectAtIndex:", 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(v35, "objectAtIndex:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "objectAtIndex:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 56) != v13 || !objc_msgSend(*(id *)(a1 + 32), "containsObject:", v23))
      goto LABEL_13;
    v24 = v11;
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("FHInsightTypeCategorySpend")))
    {
      v25 = objc_alloc_init(FHCategorySpendInsight);
      -[FHFeatureInsight setType:](v25, "setType:", CFSTR("FHInsightTypeCategorySpend"));
      -[FHFeatureInsight setDetectionType:](v25, "setDetectionType:", 2);
      -[FHFeatureInsight setDirection:](v25, "setDirection:", v24);
      -[FHCategorySpendInsight setMerchantCategory:](v25, "setMerchantCategory:", FHMerchantCategoryFromString());
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("FHInsightTypeOverallSpend")))
    {
      v25 = objc_alloc_init(FHOverallSpendInsight);
      -[FHFeatureInsight setType:](v25, "setType:", CFSTR("FHInsightTypeOverallSpend"));
      -[FHFeatureInsight setDetectionType:](v25, "setDetectionType:", 2);
      -[FHFeatureInsight setDirection:](v25, "setDirection:", v24);
    }
    else
    {
      if (!objc_msgSend(v23, "isEqualToString:", CFSTR("FHInsightTypeMerchantSpend")))
      {
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FHInsightTypeAggregateTag")) & 1) == 0
          && !objc_msgSend(v23, "isEqualToString:", CFSTR("FHInsightTypeCompoundTag")))
        {
          goto LABEL_13;
        }
        v25 = objc_alloc_init(FHSearchTagSpendInsight);
        -[FHFeatureInsight setDetectionType:](v25, "setDetectionType:", 2);
        -[FHFeatureInsight setDirection:](v25, "setDirection:", v24);
        -[FHFeatureInsight setWindow:](v25, "setWindow:", v13);
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHFeatureInsight setStartDate:](v25, "setStartDate:", v30);

        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHFeatureInsight setEndDate:](v25, "setEndDate:", v31);

        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v16);
        -[FHFeatureInsight setSpendAmount:](v25, "setSpendAmount:", v32);

        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v19);
        -[FHFeatureInsight setAverageAmount:](v25, "setAverageAmount:", v33);

        -[FHFeatureInsight setCurrencyCode:](v25, "setCurrencyCode:", CFSTR("USD"));
        if (objc_msgSend(v23, "isEqualToString:", CFSTR("FHInsightTypeAggregateTag")))
          v34 = CFSTR("FHInsightTypeAggregateTag");
        else
          v34 = CFSTR("FHInsightTypeCompoundTag");
        -[FHFeatureInsight setType:](v25, "setType:", v34);
LABEL_12:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v25);

LABEL_13:
        goto LABEL_14;
      }
      v25 = objc_alloc_init(FHMerchantSpendInsight);
      -[FHFeatureInsight setType:](v25, "setType:", CFSTR("FHInsightTypeMerchantSpend"));
      -[FHFeatureInsight setDetectionType:](v25, "setDetectionType:", 2);
      -[FHFeatureInsight setDirection:](v25, "setDirection:", v24);
      -[FHCategorySpendInsight setMerchantName:](v25, "setMerchantName:", v21);
    }
    -[FHFeatureInsight setWindow:](v25, "setWindow:", v13);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHFeatureInsight setStartDate:](v25, "setStartDate:", v26);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHFeatureInsight setEndDate:](v25, "setEndDate:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v16);
    -[FHFeatureInsight setSpendAmount:](v25, "setSpendAmount:", v28);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v19);
    -[FHFeatureInsight setAverageAmount:](v25, "setAverageAmount:", v29);

    -[FHFeatureInsight setCurrencyCode:](v25, "setCurrencyCode:", CFSTR("USD"));
    goto LABEL_12;
  }
LABEL_14:

}

uint64_t __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 != v12)
    {
      v14 = v9 > v12;
      goto LABEL_14;
    }
    objc_msgSend(v5, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FHInsightTypeCategorySpend")) & 1) != 0)
    {
      objc_msgSend(v6, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("FHInsightTypeCategorySpend"));

      if (v17)
      {
        v18 = objc_msgSend(v5, "merchantCategory");
        v14 = v18 <= objc_msgSend(v6, "merchantCategory");
        goto LABEL_14;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "spendAmount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spendAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v19, "compare:", v20);

    goto LABEL_14;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (NSDecimalNumberHandler)roundingBehavior
{
  return self->_roundingBehavior;
}

- (void)setRoundingBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_roundingBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundingBehavior, 0);
}

@end
