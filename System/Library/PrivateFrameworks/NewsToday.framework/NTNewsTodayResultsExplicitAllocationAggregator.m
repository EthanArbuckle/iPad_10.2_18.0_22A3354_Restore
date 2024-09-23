@implementation NTNewsTodayResultsExplicitAllocationAggregator

- (id)aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NTItemAggregationResult *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NTNewsTodayResultsExplicitAllocationAggregator *v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  uint64_t v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator aggregateSections:itemsBySectionDescriptor:budgetInfo:].cold.2();
  if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator aggregateSections:itemsBySectionDescriptor:budgetInfo:].cold.1();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  objc_msgSend(v10, "slotsLimit");
  v41 = v11;
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "respectMinMaxLimit"))
  {
    v43[0] = &__block_literal_global_7;
    v16 = (void **)v43;
    v17 = &__block_literal_global_101;
  }
  else
  {
    v42 = &__block_literal_global_103;
    v16 = &v42;
    v17 = &__block_literal_global_104;
  }
  v16[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_5;
  v29[3] = &unk_24DB5F538;
  v19 = v8;
  v30 = v19;
  v39 = v40;
  v20 = v9;
  v31 = v20;
  v21 = v15;
  v32 = v21;
  v22 = v14;
  v33 = v22;
  v23 = v13;
  v34 = v23;
  v35 = self;
  v24 = v10;
  v36 = v24;
  v25 = v12;
  v37 = v25;
  v26 = v18;
  v38 = v26;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v29);
  v27 = -[NTItemAggregationResult initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:]([NTItemAggregationResult alloc], "initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:", v22, v21);

  _Block_object_dispose(v40, 8);
  return v27;
}

- (NTNewsTodayResultsExplicitAllocationAggregator)init
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
    v8 = "-[NTNewsTodayResultsExplicitAllocationAggregator init]";
    v9 = 2080;
    v10 = "NTNewsTodayResultsExplicitAllocationAggregator.m";
    v11 = 1024;
    v12 = 153;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTNewsTodayResultsExplicitAllocationAggregator init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsExplicitAllocationAggregator)initWithConfigurationManager:(id)a3 feedPersonalizer:(id)a4 filterDate:(id)a5 todayData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NTNewsTodayResultsExplicitAllocationAggregator *v15;
  NTNewsTodayResultsExplicitAllocationAggregator *v16;
  uint64_t v17;
  NSDate *filterDate;
  uint64_t v19;
  FCTodayPrivateData *todayData;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator initWithConfigurationManager:feedPersonalizer:filterDate:todayData:].cold.2();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator initWithConfigurationManager:feedPersonalizer:filterDate:todayData:].cold.1();
LABEL_6:
  v22.receiver = self;
  v22.super_class = (Class)NTNewsTodayResultsExplicitAllocationAggregator;
  v15 = -[NTNewsTodayResultsExplicitAllocationAggregator init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationManager, a3);
    objc_storeStrong((id *)&v16->_feedPersonalizer, a4);
    v17 = objc_msgSend(v13, "copy");
    filterDate = v16->_filterDate;
    v16->_filterDate = (NSDate *)v17;

    v19 = objc_msgSend(v14, "copy");
    todayData = v16->_todayData;
    v16->_todayData = (FCTodayPrivateData *)v19;

  }
  return v16;
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "minimumStoriesAllocation");
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maximumStoriesAllocation");
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_3()
{
  return -1;
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_4()
{
  return -1;
}

void __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = a2;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_6;
  v13[3] = &unk_24DB5F510;
  v23 = *(_QWORD *)(a1 + 104);
  v24 = a4;
  v8 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v22 = v7;
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(void **)(a1 + 80);
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = *(id *)(a1 + 88);
  v25 = a3;
  v21 = *(id *)(a1 + 96);
  v12 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

}

void __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int16 v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_7;
  v38[3] = &__block_descriptor_48_e5_v8__0l;
  v38[4] = *(_QWORD *)(a1 + 112);
  v38[5] = a4;
  v7 = MEMORY[0x219A33CDC](v38);
  v8 = (void (**)(_QWORD))v7;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) <= 0.0)
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
      v12 = objc_msgSend(v10, "count");
      if (v11 != v12)
      {
        v30 = v11 - v12;
        v13 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v31 = v10;
        v14 = v10;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v35 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "clusterID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                objc_msgSend(v13, "removeObject:", v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v16);
        }

        v33 = 0.0;
        v32 = 0;
        if (v14)
          v20 = v14;
        else
          v20 = (id)MEMORY[0x24BDBD1A8];
        objc_msgSend(*(id *)(a1 + 64), "_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:", v6, v9, *(_QWORD *)(a1 + 72), v20, v13, v30, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), *(_QWORD *)(a1 + 80), &v33, (char *)&v32 + 1, &v32);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)v32)
        {
          v8[2](v8);
          v10 = v31;
        }
        else
        {
          v22 = objc_msgSend(v14, "count");
          v23 = *(_QWORD *)(a1 + 120);
          v24 = objc_msgSend(*(id *)(a1 + 88), "count");
          if (!v22 && HIBYTE(v32) && v23 + 1 == v24)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
          v25 = *(void **)(a1 + 80);
          objc_msgSend(v21, "fc_setByTransformingWithBlock:", &__block_literal_global_108);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "unionSet:", v26);

          v27 = *(void **)(a1 + 56);
          objc_msgSend(v21, "fc_setByTransformingWithBlock:", &__block_literal_global_109);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "unionSet:", v28);

          if (v14)
          {
            objc_msgSend(v14, "addObjectsFromArray:", v21);
          }
          else
          {
            v29 = (void *)objc_msgSend(v21, "mutableCopy");
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v29, v6);

          }
          v10 = v31;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104)
                                                                                               + 8)
                                                                                   + 24)
                                                                       - v33;
        }

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }

  }
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_7(uint64_t result)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(result + 32);
  **(_BYTE **)(result + 40) = 1;
  *v1 = 1;
  return result;
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clusterID");
}

- (id)_itemsForSection:(id)a3 items:(id)a4 withBudgetInfo:(id)a5 previouslyChosenItems:(id)a6 priorClusterIDsInOtherSections:(id)a7 sectionItemsLimit:(unint64_t)a8 otherArticleIDs:(id)a9 remainingSlots:(double)a10 slotsUsed:(double *)a11 noMoreItemsToGive:(BOOL *)a12 noRoomForMoreItems:(BOOL *)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v55 = a7;
  v23 = v19;
  v24 = a9;
  if (!v23 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.11();
    if (v20)
      goto LABEL_6;
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.10();
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.9();
    if (v22)
      goto LABEL_11;
  }
  else if (v22)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.8();
LABEL_11:
  if (!v24 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.7();
  if (!v55 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.6();
  if (!a8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.5();
  if (a10 < 0.0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.4();
    if (a11)
      goto LABEL_25;
  }
  else if (a11)
  {
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.3();
LABEL_25:
  if (!a12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.2();
  if (!a13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.1();
  -[NTNewsTodayResultsExplicitAllocationAggregator feedPersonalizer](self, "feedPersonalizer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "incrementalSortTransformationWithFeedPersonalizer:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v20;
  objc_msgSend(v26, "transformFeedItems:", v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fc_setByTransformingWithBlock:", &__block_literal_global_123);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v24;
  -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:](self, "_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:", v23, v55, v28, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "transformFeedItems:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v22;
  v53 = v23;
  v51 = v21;
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v21, "sectionSlotCostInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0.0;
  }
  else
  {
    objc_msgSend(v23, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v21;
    if (v34)
      v36 = objc_msgSend(v21, "allowSectionTitles");
    else
      v36 = 0;

    objc_msgSend(v35, "sectionSlotCostInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v37;
    v38 = 0.0;
    if (v36)
    {
      objc_msgSend(v37, "sectionTitleSlotCost");
      v38 = v39;
    }
    objc_msgSend(v32, "sectionFooterSlotCost");
    v33 = v38 + v40;
    v23 = v53;
  }
  v41 = a10 - v33;
  objc_msgSend(v32, "headlineSlotCost");
  v43 = v41 / v42;
  if (v43 >= (double)a8)
    v43 = (double)a8;
  objc_msgSend(v23, "incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:", v25, (unint64_t)v43, v31);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "transformFeedItems:", v30);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "count"))
  {
    v46 = (double)(unint64_t)objc_msgSend(v45, "count");
    objc_msgSend(v32, "headlineSlotCost");
    v48 = v33 + v46 * v47;
  }
  else
  {
    v48 = 0.0;
  }
  *a11 = v48;
  *a13 = v41 <= 0.0;
  *a12 = objc_msgSend(v30, "count") == 0;

  return v45;
}

uint64_t __237__NTNewsTodayResultsExplicitAllocationAggregator__itemsForSection_items_withBudgetInfo_previouslyChosenItems_priorClusterIDsInOtherSections_sectionItemsLimit_otherArticleIDs_remainingSlots_slotsUsed_noMoreItemsToGive_noRoomForMoreItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clusterID");
}

- (id)_sectionFilterTransformationWithDescriptor:(id)a3 priorClusterIDsInOtherSections:(id)a4 priorClusterIDsInSection:(id)a5 otherArticleIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NTSectionFeedFilterTransformation *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  NTSectionFeedFilterTransformation *v26;
  void *v28;
  void *v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:].cold.4();
    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:].cold.3();
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:].cold.2();
    if (v12)
      goto LABEL_11;
  }
  else if (v12)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:].cold.1();
LABEL_11:
  v14 = objc_msgSend(v10, "supplementalInterSectionFilterOptions");
  v15 = objc_msgSend(v10, "supplementalIntraSectionFilterOptions");
  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(v10, "supplementalIntraSectionFilterOptions");
  if ((v14 & 4) != 0)
    objc_msgSend(v16, "unionSet:", v11);
  v28 = v12;
  v29 = v11;
  if ((v15 & 4) != 0)
  {
    v18 = v17 | 4;
    objc_msgSend(v16, "unionSet:", v12);
  }
  else
  {
    v18 = v17 | 0x84;
  }
  -[NTNewsTodayResultsExplicitAllocationAggregator todayData](self, "todayData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [NTSectionFeedFilterTransformation alloc];
  -[NTNewsTodayResultsExplicitAllocationAggregator configurationManager](self, "configurationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "readArticlesFilterMethod");
  v23 = objc_msgSend(v10, "seenArticlesFilterMethod");
  v24 = (double)objc_msgSend(v10, "seenArticlesMinimumTimeSinceFirstSeenToFilter");
  -[NTNewsTodayResultsExplicitAllocationAggregator filterDate](self, "filterDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:](v20, "initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:", v19, v21, v22, v23, v18, v13, v24, v16, v25);

  return v26;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (NSDate)filterDate
{
  return self->_filterDate;
}

- (void)setFilterDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FCTodayPrivateData)todayData
{
  return self->_todayData;
}

- (void)setTodayData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayData, 0);
  objc_storeStrong((id *)&self->_filterDate, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)initWithConfigurationManager:feedPersonalizer:filterDate:todayData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"filterDate", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfigurationManager:feedPersonalizer:filterDate:todayData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationManager", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)aggregateSections:itemsBySectionDescriptor:budgetInfo:.cold.1()
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

- (void)aggregateSections:itemsBySectionDescriptor:budgetInfo:.cold.2()
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

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"noRoomForMoreItemsOut", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"noMoreItemsToGive", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"slotsUsedOut", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"remainingSlots >= 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionItemsLimit > 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorClusterIDsInOtherSections", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"previouslyChosenItems", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.9()
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

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.11()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorClusterIDsInSection", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorClusterIDsInOtherSections", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
