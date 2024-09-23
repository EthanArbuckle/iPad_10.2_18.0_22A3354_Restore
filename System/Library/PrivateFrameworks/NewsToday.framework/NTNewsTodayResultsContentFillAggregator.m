@implementation NTNewsTodayResultsContentFillAggregator

- (NTNewsTodayResultsContentFillAggregator)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsTodayResultsContentFillAggregator init]";
    v9 = 2080;
    v10 = "NTNewsTodayResultsContentFillAggregator.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTNewsTodayResultsContentFillAggregator init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsContentFillAggregator)initWithAggregator:(id)a3 minHeadlineScale:(double)a4 maxHeadlineScale:(double)a5
{
  id v9;
  NTNewsTodayResultsContentFillAggregator *v10;
  NTNewsTodayResultsContentFillAggregator *v11;
  double v12;
  double v13;
  objc_super v15;

  v9 = a3;
  if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:].cold.4();
  if (a4 < 0.0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:].cold.3();
  if (a5 < 0.0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:].cold.2();
  if (a4 > a5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:].cold.1();
  v15.receiver = self;
  v15.super_class = (Class)NTNewsTodayResultsContentFillAggregator;
  v10 = -[NTNewsTodayResultsContentFillAggregator init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_aggregator, a3);
    v12 = 1.0;
    if (a4 == 0.0)
      v13 = 1.0;
    else
      v13 = a4;
    if (a5 != 0.0)
      v12 = a5;
    v11->_minHeadlineScale = v13;
    v11->_maxHeadlineScale = v12;
  }

  return v11;
}

- (id)aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD, double);
  double v37;
  double i;
  double j;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NTNewsTodayResultsContentFillAggregator minHeadlineScale](self, "minHeadlineScale");
  v12 = v11;
  -[NTNewsTodayResultsContentFillAggregator maxHeadlineScale](self, "maxHeadlineScale");
  v14 = v13;
  objc_msgSend(v10, "sectionSlotCostInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "headlineSlotCost");
  v17 = v16;
  objc_msgSend(v10, "sectionSlotCostInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionTitleSlotCost");
  v20 = v19;
  objc_msgSend(v10, "sectionSlotCostInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionFooterSlotCost");
  v23 = v22;
  objc_msgSend(v10, "slotsLimit");
  v25 = v24;

  objc_msgSend(v10, "sectionSlotCostInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionTitleSlotCost");
  v28 = v27;
  objc_msgSend(v10, "slotsLimit");
  v30 = v28 / v29;

  v31 = (void *)objc_opt_new();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __97__NTNewsTodayResultsContentFillAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke;
  v52[3] = &unk_24DB5F5A8;
  v52[4] = self;
  v32 = v8;
  v53 = v32;
  v33 = v9;
  v54 = v33;
  v34 = v10;
  v55 = v34;
  v35 = v31;
  v56 = v35;
  v36 = (void (**)(_QWORD, double))MEMORY[0x219A33CDC](v52);
  if (v12 != 1.0)
  {
    v37 = v12 - (v17 + v20 + v23) / v25;
    for (i = 1.0 - v30; i >= v37 && i > 0.0; i = i - v30)
      v36[2](v36, i);
  }
  if (v14 != 1.0)
  {
    for (j = v30 + 1.0; j <= v14; j = v30 + j)
      v36[2](v36, j);
  }
  v36[2](v36, 1.0);
  if (!objc_msgSend(v35, "count"))
  {
    -[NTNewsTodayResultsContentFillAggregator aggregator](self, "aggregator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "aggregateSections:itemsBySectionDescriptor:budgetInfo:", v32, v33, v34);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTNewsTodayResultsContentFillAggregator maxHeadlineScale](self, "maxHeadlineScale");
    v42 = (void *)objc_msgSend(v41, "copyWithHeadlineScale:");
    objc_msgSend(v42, "slotCostWithInfo:", v34);
    v44 = v43;
    objc_msgSend(v34, "slotsLimit");
    if (v44 <= v45)
    {
      v48 = v35;
      v49 = v42;
    }
    else
    {
      -[NTNewsTodayResultsContentFillAggregator minHeadlineScale](self, "minHeadlineScale");
      if (v46 > 1.0)
      {
        -[NTNewsTodayResultsContentFillAggregator minHeadlineScale](self, "minHeadlineScale");
        v47 = (void *)objc_msgSend(v41, "copyWithHeadlineScale:");
        objc_msgSend(v35, "addObject:", v47);

LABEL_17:
        goto LABEL_18;
      }
      v48 = v35;
      v49 = v41;
    }
    objc_msgSend(v48, "addObject:", v49);
    goto LABEL_17;
  }
LABEL_18:
  -[NTNewsTodayResultsContentFillAggregator _bestResultOfResults:withBudgetInfo:](self, "_bestResultOfResults:withBudgetInfo:", v35, v34);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

void __97__NTNewsTodayResultsContentFillAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v2);
    v2 = v3;
  }

}

- (id)_aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5 scale:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:].cold.4();
    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:].cold.3();
LABEL_6:
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:].cold.2();
  if (a6 <= 0.0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:].cold.1();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v13, "sectionSlotCostInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "headlineSlotCost");
  objc_msgSend(v14, "setHeadlineSlotCost:", v15 * a6);

  -[NTNewsTodayResultsContentFillAggregator aggregator](self, "aggregator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "aggregateSections:itemsBySectionDescriptor:budgetInfo:", v10, v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sectionOverheadSlotCostWithInfo:", v12);
  v19 = v18;
  objc_msgSend(v12, "sectionSlotCostInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "headlineSlotCost");
  objc_msgSend(v17, "headlineSlotCostWithSlotCost:");
  v22 = v21;

  objc_msgSend(v12, "slotsLimit");
  v24 = (v23 - v19) / v22;
  -[NTNewsTodayResultsContentFillAggregator minHeadlineScale](self, "minHeadlineScale");
  if (v25 <= v24 && (-[NTNewsTodayResultsContentFillAggregator maxHeadlineScale](self, "maxHeadlineScale"), v24 <= v26))
    v27 = (void *)objc_msgSend(v17, "copyWithHeadlineScale:", v24);
  else
    v27 = 0;

  return v27;
}

- (id)_bestResultOfResults:(id)a3 withBudgetInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke;
  v18 = &unk_24DB5F5D0;
  v7 = v6;
  v19 = v7;
  objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count", v15, v16, v17, v18))
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("itemCount"), 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:comparator:", CFSTR("headlineScale"), 1, &__block_literal_global_8);
    v20[0] = v10;
    v20[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

BOOL __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "slotsLimit");
  v6 = v5;
  objc_msgSend(v4, "slotCostWithInfo:", *(_QWORD *)(a1 + 32));
  v8 = v7;

  return vabdd_f64(v6, v8) < 0.01;
}

uint64_t __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "doubleValue");
  v7 = v6 + -1.0;
  if (v7 < 0.0)
    v7 = -v7;
  objc_msgSend(v4, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "doubleValue");
  v11 = v10;

  v12 = v11 + -1.0;
  if (v11 + -1.0 < 0.0)
    v12 = -(v11 + -1.0);
  objc_msgSend(v9, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "compare:", v13);

  return v14;
}

- (double)minHeadlineScale
{
  return self->_minHeadlineScale;
}

- (void)setMinHeadlineScale:(double)a3
{
  self->_minHeadlineScale = a3;
}

- (double)maxHeadlineScale
{
  return self->_maxHeadlineScale;
}

- (void)setMaxHeadlineScale:(double)a3
{
  self->_maxHeadlineScale = a3;
}

- (NTTodayResultsAggregator)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_aggregator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"minHeadlineScale <= maxHeadlineScale", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"0 <= maxHeadlineScale", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"0 <= minHeadlineScale", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregator", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"inputScale > 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"budgetInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemsBySectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
