@implementation WDAppleStandHourStatisticsListDataProvider

- (WDAppleStandHourStatisticsListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v6;
  WDAppleStandHourStatisticsListDataProvider *v7;
  WDAppleStandHourStatisticsListDataProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKDisplayTypeValueFormatter *valueFormatter;
  uint64_t v15;
  NSDateFormatter *dateFormatter;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WDAppleStandHourStatisticsListDataProvider;
  v7 = -[WDSampleListDataProvider initWithDisplayType:profile:](&v18, sel_initWithDisplayType_profile_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[WDSampleListDataProvider displayType](v7, "displayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unitController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSampleListDataProvider displayType](v8, "displayType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unitForDisplayType:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_valueFormatterForUnit:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    valueFormatter = v8->_valueFormatter;
    v8->_valueFormatter = (HKDisplayTypeValueFormatter *)v13;

    HKDateFormatterFromTemplate();
    v15 = objc_claimAutoreleasedReturnValue();
    dateFormatter = v8->_dateFormatter;
    v8->_dateFormatter = (NSDateFormatter *)v15;

  }
  return v8;
}

- (void)_callUpdateHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *totalsByTimePeriod;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *orderedTimePeriods;
  NSMutableDictionary *v24;
  objc_super v25;

  -[WDSampleListDataProvider samples](self, "samples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSamples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startOfDayForDate:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_startOfTomorrowForDate:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v13, "setDay:", 1);
    v14 = (void *)MEMORY[0x24BDD4238];
    -[WDSampleListDataProvider samples](self, "samples");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allSamples");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKCalendarDateTransformNone();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "calculateTotalDurationsWithTimePeriods:startDate:endDate:intervalComponents:startOfDayTransform:", v16, v10, v12, v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSMutableDictionary *)objc_msgSend(v18, "mutableCopy");
    totalsByTimePeriod = self->_totalsByTimePeriod;
    self->_totalsByTimePeriod = v19;

    -[NSMutableDictionary allKeys](self->_totalsByTimePeriod, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSMutableArray *)objc_msgSend(v21, "mutableCopy");
    orderedTimePeriods = self->_orderedTimePeriods;
    self->_orderedTimePeriods = v22;

    -[NSMutableArray sortUsingComparator:](self->_orderedTimePeriods, "sortUsingComparator:", &__block_literal_global_2);
  }
  else
  {
    v24 = self->_totalsByTimePeriod;
    self->_totalsByTimePeriod = 0;

    v10 = self->_orderedTimePeriods;
    self->_orderedTimePeriods = 0;
  }

  v25.receiver = self;
  v25.super_class = (Class)WDAppleStandHourStatisticsListDataProvider;
  -[WDSampleListDataProvider _callUpdateHandler](&v25, sel__callUpdateHandler);

}

uint64_t __64__WDAppleStandHourStatisticsListDataProvider__callUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_samplesSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
}

- (id)sampleTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[WDSampleListDataProvider displayType](self, "displayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)predicateForType:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD3E88], "predicateForCategorySamplesWithOperatorType:value:", 4, 0);
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
  void *v4;
  void *v5;
  __CFString *v6;

  if (-[NSMutableArray count](self->_orderedTimePeriods, "count", a3))
  {
    -[WDSampleListDataProvider unitController](self, "unitController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSampleListDataProvider displayType](self, "displayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDisplayNameForDisplayType:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24D38E7C8;
  }
  return v6;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  return -[NSMutableArray count](self->_orderedTimePeriods, "count", a3);
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_orderedTimePeriods, "objectAtIndexedSubscript:", a3, a4);
}

- (id)textForObject:(id)a3
{
  void *v4;
  HKDisplayTypeValueFormatter *valueFormatter;
  void *v6;
  void *v7;
  void *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_totalsByTimePeriod, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  valueFormatter = self->_valueFormatter;
  -[WDSampleListDataProvider displayType](self, "displayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeValueFormatter stringFromValue:displayType:unitController:](valueFormatter, "stringFromValue:displayType:unitController:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)secondaryTextForObject:(id)a3
{
  NSDateFormatter *dateFormatter;
  void *v4;
  void *v5;

  dateFormatter = self->_dateFormatter;
  objc_msgSend(a3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  id v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_orderedTimePeriods, "objectAtIndexedSubscript:", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_orderedTimePeriods, "removeObjectAtIndex:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->_totalsByTimePeriod, "removeObjectForKey:", v7);
  -[WDAppleStandHourStatisticsListDataProvider _removeSamplesInDateRange:](self, "_removeSamplesInDateRange:", v7);

}

- (void)_removeSamplesInDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int IsLargerOrEqual;
  void *v16;
  int IsSmaller;
  BOOL v18;
  void *v19;
  void *v20;
  WDAppleStandHourStatisticsListDataProvider *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self;
  -[WDSampleListDataProvider samples](self, "samples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allSamples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        IsLargerOrEqual = HKUIObjectIsLargerOrEqual();

        objc_msgSend(v13, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        IsSmaller = HKUIObjectIsSmaller();

        if (IsLargerOrEqual)
          v18 = IsSmaller == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v13, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v19);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  -[WDSampleListDataProvider samples](v21, "samples");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeSamplesWithUUIDs:", v23);

}

- (void)deleteAllData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAppleStandHourStatisticsListDataProvider;
  -[WDSampleListDataProvider deleteAllData](&v3, sel_deleteAllData);
  -[NSMutableArray removeAllObjects](self->_orderedTimePeriods, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_totalsByTimePeriod, "removeAllObjects");
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  char v6;
  id v10;
  uint64_t v11;
  NSMutableArray *orderedTimePeriods;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a5;
  v10 = a6;
  v11 = v6 & 2;
  orderedTimePeriods = self->_orderedTimePeriods;
  v13 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](orderedTimePeriods, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider displayType](self, "displayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD3E88];
  objc_msgSend(v14, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateForSamplesWithStartDate:endDate:options:", v18, v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __102__WDAppleStandHourStatisticsListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
  v22[3] = &unk_24D38D2D8;
  v23 = v10;
  v21 = v10;
  objc_msgSend(v13, "deleteObjectsOfType:predicate:options:withCompletion:", v16, v20, v11, v22);

}

uint64_t __102__WDAppleStandHourStatisticsListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *orderedTimePeriods;
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
  void *v20;
  WDDataListViewController *v21;

  v4 = a3;
  -[WDSampleListDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  orderedTimePeriods = self->_orderedTimePeriods;
  v10 = objc_msgSend(v4, "row");

  -[NSMutableArray objectAtIndexedSubscript:](orderedTimePeriods, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD3E88];
  objc_msgSend(v11, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateForSamplesWithStartDate:endDate:options:", v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDSampleListDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIPredicateMatchingPredicates();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDefaultQueryPredicate:", v17);
  v18 = [WDDataListViewController alloc];
  -[WDSampleListDataProvider displayType](self, "displayType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider profile](self, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](v18, "initWithDisplayType:profile:dataProvider:usingInsetStyling:", v19, v20, v8, 1);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_totalsByTimePeriod, 0);
  objc_storeStrong((id *)&self->_orderedTimePeriods, 0);
}

@end
