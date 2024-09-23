@implementation WDSampleListStatisticsDataProvider

- (WDSampleListStatisticsDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  WDSampleListStatisticsDataProvider *v9;
  WDSampleListStatisticsDataProvider *v10;
  uint64_t v11;
  HKUnitPreferenceController *unitController;
  uint64_t v13;
  NSMutableArray *activeDataQueries;
  uint64_t v15;
  NSMutableSet *activeQueryTypes;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WDSampleListStatisticsDataProvider;
  v9 = -[WDSampleListStatisticsDataProvider init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_msgSend(v8, "unitController");
    v11 = objc_claimAutoreleasedReturnValue();
    unitController = v10->_unitController;
    v10->_unitController = (HKUnitPreferenceController *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    activeDataQueries = v10->_activeDataQueries;
    v10->_activeDataQueries = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    activeQueryTypes = v10->_activeQueryTypes;
    v10->_activeQueryTypes = (NSMutableSet *)v15;

    objc_storeStrong((id *)&v10->_profile, a4);
    v10->_hasDetailViewController = 1;
  }

  return v10;
}

- (id)sampleTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)_statisticsAtIndexPath:(id)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
}

- (int64_t)cellStyle
{
  return 0;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (id)titleForSection:(unint64_t)a3
{
  __CFString *v4;

  if (-[NSMutableArray count](self->_data, "count", a3))
  {
    -[HKUnitPreferenceController localizedLongDisplayNameForDisplayType:](self->_unitController, "localizedLongDisplayNameForDisplayType:", self->_displayType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24D38E7C8;
  }
  return v4;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  return -[NSMutableArray count](self->_data, "count", a3);
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", a3, a4);
}

- (id)secondaryTextForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  HKPriorYearsDateFormatterNoTime();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)textAdjustsFontSizeToFitWidth
{
  return 1;
}

- (void)_handleResultsCollection:(id)a3 fromQuery:(id)a4 sampleType:(id)a5 areComplete:(BOOL)a6 withError:(id)a7 updateHandler:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;

  v10 = a6;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = (void (**)(_QWORD))a8;
  if (!v16)
  {
    objc_msgSend(a3, "statistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v10)
    {
      -[WDSampleListStatisticsDataProvider setData:](self, "setData:", v22);
      if (!v17)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(v22, "removeLastObject");
      -[WDSampleListStatisticsDataProvider setData:](self, "setData:", v22);
      if (!v17 || !objc_msgSend(v22, "count"))
        goto LABEL_14;
    }
    v17[2](v17);
LABEL_14:

    goto LABEL_15;
  }
  v18 = objc_msgSend(v16, "hk_isDatabaseAccessibilityError");
  _HKInitializeLogging();
  v19 = *MEMORY[0x24BDD3070];
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[WDSampleListStatisticsDataProvider _handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:].cold.1();
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    -[WDSampleListStatisticsDataProvider _handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:].cold.2();
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__WDSampleListStatisticsDataProvider__handleResultsCollection_fromQuery_sampleType_areComplete_withError_updateHandler___block_invoke;
  block[3] = &unk_24D38CEE8;
  block[4] = self;
  v24 = v14;
  v25 = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_15:
}

void __120__WDSampleListStatisticsDataProvider__handleResultsCollection_fromQuery_sampleType_areComplete_withError_updateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activeDataQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "activeQueryTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 48));

}

uint64_t __120__WDSampleListStatisticsDataProvider__handleResultsCollection_fromQuery_sampleType_areComplete_withError_updateHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)startCollectingDataWithUpdateHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  WDSampleListStatisticsDataProvider *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WDSampleListStatisticsDataProvider setHasCompleteDataSet:](self, "setHasCompleteDataSet:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_activeDataQueries;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[WDSampleListStatisticsDataProvider profile](self, "profile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "healthStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stopQuery:", v10);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[WDSampleListStatisticsDataProvider sampleTypes](self, "sampleTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    v17 = (os_log_t *)MEMORY[0x24BDD3070];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WDSampleListStatisticsDataProvider _startPartialDataStatisticsCollectionQueryForSampleType:updateHandler:](self, "_startPartialDataStatisticsCollectionQueryForSampleType:updateHandler:", v19, v4);
        }
        else
        {
          _HKInitializeLogging();
          v20 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = self;
            v31 = 2114;
            v32 = v19;
            _os_log_error_impl(&dword_215814000, v20, OS_LOG_TYPE_ERROR, "Data provider %{public}@ can only show hierarchical data on quantity types. Encountered type %{public}@. Skipping.", buf, 0x16u);
          }
        }
        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v15);
  }

}

- (unint64_t)_statisticsOptionsForSampleType:(id)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(a3, "aggregationStyle");
  v4 = 12;
  if (v3 == 3)
    v4 = 66;
  if (v3)
    return v4;
  else
    return 16;
}

- (void)stopCollectingData
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WDProfile healthStore](self->_profile, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_activeDataQueries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "stopQuery:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_activeDataQueries, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_activeQueryTypes, "removeAllObjects");

}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  -[NSMutableArray removeObjectAtIndex:](self->_data, "removeObjectAtIndex:", a3, a4);
  *a5 = 0;
}

- (void)deleteAllData
{
  NSMutableArray *v3;
  NSMutableArray *data;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v3;

}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  char v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[6];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v7 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v26 = a4;
  v25 = a6;
  -[NSMutableArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[WDSampleListStatisticsDataProvider sampleTypes](self, "sampleTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v24 = v7 & 2;
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14);
        -[WDSampleListStatisticsDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD3E88];
        objc_msgSend(v10, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "predicateForSamplesWithStartDate:endDate:options:", v18, v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        WDPredicateMatchingPredicates(v16, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
        v27[3] = &unk_24D38E520;
        v27[4] = self;
        v27[5] = v15;
        v28 = v21;
        v29 = v25;
        v22 = v21;
        objc_msgSend(v26, "deleteObjectsOfType:predicate:options:withCompletion:", v15, v22, v24, v27);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

}

void __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }
  (*(void (**)(void))(a1[7] + 16))();

}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  WDProfile *profile;
  void *v7;
  void *v8;
  NSMutableArray *data;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WDDataListViewController *v18;
  void *v19;
  WDDataListViewController *v20;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WDSampleListStatisticsDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  profile = self->_profile;
  -[WDProfile unitController](profile, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", profile, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  data = self->_data;
  v10 = objc_msgSend(v4, "row");

  -[NSMutableArray objectAtIndexedSubscript:](data, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD3E88];
  objc_msgSend(v11, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateForSamplesWithStartDate:endDate:options:", v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDSampleListStatisticsDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIPredicateMatchingPredicates();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDefaultQueryPredicate:", v17);
  v18 = [WDDataListViewController alloc];
  -[WDSampleListStatisticsDataProvider displayType](self, "displayType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](v18, "initWithDisplayType:profile:dataProvider:usingInsetStyling:", v19, self->_profile, v8, 1);

  return v20;
}

- (void)_startPartialDataStatisticsCollectionQueryForSampleType:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id location;
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setDay:", 1);
  -[WDSampleListStatisticsDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x24BDD14C0];
    v38[0] = v9;
    -[WDSampleListStatisticsDataProvider _predicateForTheLastMonth](self, "_predicateForTheLastMonth");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WDSampleListStatisticsDataProvider _predicateForTheLastMonth](self, "_predicateForTheLastMonth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_alloc(MEMORY[0x24BDD4000]);
  v16 = -[WDSampleListStatisticsDataProvider _statisticsOptionsForSampleType:](self, "_statisticsOptionsForSampleType:", v6);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startOfDayForDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v6, v14, v16, v19, v8);

  objc_initWeak(&location, self);
  v21 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke;
  v33[3] = &unk_24D38E548;
  objc_copyWeak(&v36, &location);
  v22 = v6;
  v34 = v22;
  v23 = v7;
  v35 = v23;
  objc_msgSend(v20, "setInitialResultsHandler:", v33);
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3;
  v29[3] = &unk_24D38E570;
  objc_copyWeak(&v32, &location);
  v24 = v22;
  v30 = v24;
  v25 = v23;
  v31 = v25;
  objc_msgSend(v20, "setStatisticsUpdateHandler:", v29);
  -[WDSampleListStatisticsDataProvider profile](self, "profile");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "healthStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "executeQuery:", v20);

  -[WDSampleListStatisticsDataProvider activeDataQueries](self, "activeDataQueries");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v20);

  -[NSMutableSet addObject:](self->_activeQueryTypes, "addObject:", v24);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:", v8, v7, *(_QWORD *)(a1 + 32), 0, v9, *(_QWORD *)(a1 + 40));

  v11 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopQuery:", v7);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2;
  v20 = &unk_24D38D0C8;
  objc_copyWeak(&v22, (id *)(a1 + 48));
  v15 = v7;
  v21 = v15;
  objc_msgSend(v14, "addOperationWithBlock:", &v17);

  v16 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v16, "_startCompleteDataStatisticsCollectionQueryForSampleType:updateHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v17, v18, v19, v20);

  objc_destroyWeak(&v22);
}

void __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activeDataQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __108__WDSampleListStatisticsDataProvider__startPartialDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 48);
  v9 = a5;
  v10 = a4;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:", v10, v11, *(_QWORD *)(a1 + 32), 1, v9, *(_QWORD *)(a1 + 40));

}

- (void)_startCompleteDataStatisticsCollectionQueryForSampleType:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setDay:", 1);
  v9 = objc_alloc(MEMORY[0x24BDD4000]);
  -[WDSampleListStatisticsDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WDSampleListStatisticsDataProvider _statisticsOptionsForSampleType:](self, "_statisticsOptionsForSampleType:", v6);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startOfDayForDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v9, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v6, v10, v11, v14, v8);

  objc_initWeak(location, self);
  v16 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke;
  v31[3] = &unk_24D38E548;
  objc_copyWeak(&v34, location);
  v17 = v6;
  v32 = v17;
  v18 = v7;
  v33 = v18;
  objc_msgSend(v15, "setInitialResultsHandler:", v31);
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2;
  v27[3] = &unk_24D38E570;
  objc_copyWeak(&v30, location);
  v19 = v17;
  v28 = v19;
  v20 = v18;
  v29 = v20;
  objc_msgSend(v15, "setStatisticsUpdateHandler:", v27);
  -[WDSampleListStatisticsDataProvider profile](self, "profile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "healthStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "executeQuery:", v15);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3;
  v25[3] = &unk_24D38CEC0;
  v25[4] = self;
  v24 = v15;
  v26 = v24;
  objc_msgSend(v23, "addOperationWithBlock:", v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

}

void __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "setHasCompleteDataSet:", 1);

  v12 = objc_loadWeakRetained(v7);
  objc_msgSend(v12, "_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:", v9, v10, *(_QWORD *)(a1 + 32), 1, v8, *(_QWORD *)(a1 + 40));

}

void __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 48);
  v9 = a5;
  v10 = a4;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:", v10, v11, *(_QWORD *)(a1 + 32), 1, v9, *(_QWORD *)(a1 + 40));

}

void __109__WDSampleListStatisticsDataProvider__startCompleteDataStatisticsCollectionQueryForSampleType_updateHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeDataQueries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (id)_predicateForTheLastMonth
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 8, -1, v2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForSamplesWithStartDate:endDate:options:", v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSPredicate)defaultQueryPredicate
{
  return self->defaultQueryPredicate;
}

- (void)setDefaultQueryPredicate:(id)a3
{
  objc_storeStrong((id *)&self->defaultQueryPredicate, a3);
}

- (BOOL)hasDetailViewController
{
  return self->_hasDetailViewController;
}

- (void)setHasDetailViewController:(BOOL)a3
{
  self->_hasDetailViewController = a3;
}

- (BOOL)hasCompleteDataSet
{
  return self->_hasCompleteDataSet;
}

- (void)setHasCompleteDataSet:(BOOL)a3
{
  self->_hasCompleteDataSet = a3;
}

- (NSString)profileName
{
  return self->_profileName;
}

- (void)setProfileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)data
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)activeDataQueries
{
  return self->_activeDataQueries;
}

- (void)setActiveDataQueries:(id)a3
{
  objc_storeStrong((id *)&self->_activeDataQueries, a3);
}

- (NSMutableSet)activeQueryTypes
{
  return self->_activeQueryTypes;
}

- (void)setActiveQueryTypes:(id)a3
{
  objc_storeStrong((id *)&self->_activeQueryTypes, a3);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_activeQueryTypes, 0);
  objc_storeStrong((id *)&self->_activeDataQueries, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->defaultQueryPredicate, 0);
}

- (id)textForObject:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (double)customCellHeight
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0.0;
}

- (double)customEstimatedCellHeight
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0.0;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (void)_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_215814000, v0, OS_LOG_TYPE_DEBUG, "Data provider %@ stats collection quey initial handler returned error: %@", v1, 0x16u);
}

- (void)_handleResultsCollection:fromQuery:sampleType:areComplete:withError:updateHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_215814000, v0, OS_LOG_TYPE_ERROR, "Data provider %@ stats collection quey initial handler returned error: %@", v1, 0x16u);
}

void __94__WDSampleListStatisticsDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke_cold_1(_QWORD *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = 138544130;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  v12 = 2114;
  v13 = a2;
  _os_log_error_impl(&dword_215814000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error deleting objects of type %{public}@ with predicate %{public}@: %{public}@", (uint8_t *)&v6, 0x2Au);
}

@end
