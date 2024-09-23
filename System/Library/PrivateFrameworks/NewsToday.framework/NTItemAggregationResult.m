@implementation NTItemAggregationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unusedSectionDescriptors, 0);
  objc_storeStrong((id *)&self->_aggregatedItemsBySectionDescriptor, 0);
}

- (double)headlineScale
{
  return self->_headlineScale;
}

- (NTItemAggregationResult)init
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
    v8 = "-[NTItemAggregationResult init]";
    v9 = 2080;
    v10 = "NTNewsTodayResultsExplicitAllocationAggregator.m";
    v11 = 1024;
    v12 = 54;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTItemAggregationResult init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTItemAggregationResult)initWithAggregatedItemsBySectionDescriptor:(id)a3 unusedSectionDescriptors:(id)a4
{
  id v6;
  id v7;
  NTItemAggregationResult *v8;
  uint64_t v9;
  NSDictionary *aggregatedItemsBySectionDescriptor;
  uint64_t v11;
  NSSet *unusedSectionDescriptors;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTItemAggregationResult initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTItemAggregationResult initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:].cold.1();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NTItemAggregationResult;
  v8 = -[NTItemAggregationResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    aggregatedItemsBySectionDescriptor = v8->_aggregatedItemsBySectionDescriptor;
    v8->_aggregatedItemsBySectionDescriptor = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    unusedSectionDescriptors = v8->_unusedSectionDescriptors;
    v8->_unusedSectionDescriptors = (NSSet *)v11;

    v8->_headlineScale = 1.0;
  }

  return v8;
}

- (id)copyWithHeadlineScale:(double)a3
{
  NTItemAggregationResult *v5;
  void *v6;
  void *v7;
  NTItemAggregationResult *v8;

  v5 = [NTItemAggregationResult alloc];
  -[NTItemAggregationResult aggregatedItemsBySectionDescriptor](self, "aggregatedItemsBySectionDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTItemAggregationResult unusedSectionDescriptors](self, "unusedSectionDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTItemAggregationResult initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:](v5, "initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:", v6, v7);

  -[NTItemAggregationResult setHeadlineScale:](v8, "setHeadlineScale:", a3);
  return v8;
}

- (double)headlineSlotCostWithSlotCost:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NTItemAggregationResult aggregatedItemsBySectionDescriptor](self, "aggregatedItemsBySectionDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__NTItemAggregationResult_headlineSlotCostWithSlotCost___block_invoke;
  v10[3] = &unk_24DB5F3A0;
  v10[4] = &v11;
  *(double *)&v10[5] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v6 = v12[3];
  -[NTItemAggregationResult headlineScale](self, "headlineScale");
  v8 = v6 * v7;
  _Block_object_dispose(&v11, 8);
  return v8;
}

double __56__NTItemAggregationResult_headlineSlotCostWithSlotCost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  unint64_t v5;
  uint64_t v6;
  double result;

  v4 = *(double *)(a1 + 40);
  v5 = objc_msgSend(a3, "count");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v6 + 24) + v4 * (double)v5;
  *(double *)(v6 + 24) = result;
  return result;
}

- (double)sectionOverheadSlotCostWithInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[NTItemAggregationResult aggregatedItemsBySectionDescriptor](self, "aggregatedItemsBySectionDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__NTItemAggregationResult_sectionOverheadSlotCostWithInfo___block_invoke;
  v9[3] = &unk_24DB5F3C8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __59__NTItemAggregationResult_sectionOverheadSlotCostWithInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  v14 = a2;
  v5 = objc_msgSend(a3, "count");
  v6 = v14;
  if (v5)
  {
    objc_msgSend(v14, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(*(id *)(a1 + 32), "allowSectionTitles");

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "sectionSlotCostInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sectionTitleSlotCost");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 24);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "sectionSlotCostInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionFooterSlotCost");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

    v6 = v14;
  }

}

- (double)slotCostWithInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  -[NTItemAggregationResult sectionOverheadSlotCostWithInfo:](self, "sectionOverheadSlotCostWithInfo:", v4);
  v6 = v5;
  objc_msgSend(v4, "sectionSlotCostInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "headlineSlotCost");
  -[NTItemAggregationResult headlineSlotCostWithSlotCost:](self, "headlineSlotCostWithSlotCost:");
  v9 = v6 + v8;

  return v9;
}

- (unint64_t)itemCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NTItemAggregationResult aggregatedItemsBySectionDescriptor](self, "aggregatedItemsBySectionDescriptor", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "count");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)aggregatedItemsBySectionDescriptor
{
  return self->_aggregatedItemsBySectionDescriptor;
}

- (void)setAggregatedItemsBySectionDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)unusedSectionDescriptors
{
  return self->_unusedSectionDescriptors;
}

- (void)setUnusedSectionDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHeadlineScale:(double)a3
{
  self->_headlineScale = a3;
}

- (double)slotsUsed
{
  return self->_slotsUsed;
}

- (void)setSlotsUsed:(double)a3
{
  self->_slotsUsed = a3;
}

- (void)initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"unusedSectionDescriptors", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregatedItemsBySectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
