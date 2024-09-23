@implementation WDSampleListDataProvider

- (WDSampleListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  WDSampleListDataProvider *v9;
  WDSampleListDataProvider *v10;
  HKSortedSampleArray *v11;
  HKSortedSampleArray *samples;
  HKSortedSampleArray *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WDSampleListDataProvider;
  v9 = -[WDSampleListDataProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_storeWeak((id *)&v10->_profile, v8);
    v11 = (HKSortedSampleArray *)objc_alloc_init(MEMORY[0x24BDD3FB8]);
    samples = v10->_samples;
    v10->_samples = v11;

    v13 = v10->_samples;
    -[WDSampleListDataProvider _samplesSortDescriptor](v10, "_samplesSortDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSortedSampleArray setSortDescriptor:](v13, "setSortDescriptor:", v14);

    v10->_didFetchInitialData = 0;
  }

  return v10;
}

- (id)sampleTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)predicateForType:(id)a3
{
  return 0;
}

- (id)_samplesSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
}

- (id)_defaultPredicateWithPredicateForType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[WDSampleListDataProvider predicateForType:](self, "predicateForType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider defaultQueryPredicate](self, "defaultQueryPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WDPredicateMatchingPredicates(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDefaultQueryPredicate:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKSampleListDataProviderFilter *v9;
  HKSampleListDataProviderFilter *defaultQueryPredicateFilter;
  id v11;

  objc_storeStrong((id *)&self->_defaultQueryPredicate, a3);
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BDD3EF8]);
  v7 = (void *)MEMORY[0x24BDBCF20];
  -[HKDisplayType sampleType](self->_displayType, "sampleType");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (HKSampleListDataProviderFilter *)objc_msgSend(v6, "initWithPredicate:dataTypes:", v5, v8);
  defaultQueryPredicateFilter = self->_defaultQueryPredicateFilter;
  self->_defaultQueryPredicateFilter = v9;

}

- (BOOL)hasCompleteDataSet
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[NSDictionary count](self->_pagingContexts, "count"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_pagingContexts;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSDictionary objectForKeyedSubscript:](self->_pagingContexts, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isFetchingData") & 1) != 0)
        {

LABEL_15:
          v10 = 0;
          goto LABEL_16;
        }
        v9 = objc_msgSend(v8, "requiresPaging");

        if ((v9 & 1) != 0)
          goto LABEL_15;
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_16:

  return v10;
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
  __CFString *v5;

  if (-[HKSortedSampleArray count](self->_samples, "count", a3) < 1)
  {
    v5 = &stru_24D38E7C8;
  }
  else
  {
    -[WDSampleListDataProvider unitController](self, "unitController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedLongDisplayNameForDisplayType:", self->_displayType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  return -[HKSortedSampleArray count](self->_samples, "count", a3);
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  return (id)-[HKSortedSampleArray sampleAtIndex:](self->_samples, "sampleAtIndex:", a3, a4);
}

- (id)secondaryTextForObject:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringForDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)textAdjustsFontSizeToFitWidth
{
  return 1;
}

- (double)customCellHeight
{
  return 0.0;
}

- (double)customEstimatedCellHeight
{
  return 0.0;
}

- (void)startCollectingDataWithUpdateHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id updateCallback;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x2199E6E80]();
  updateCallback = self->_updateCallback;
  self->_updateCallback = v5;

  if (self->_didFetchInitialData)
    v4[2](v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "updateController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WDSampleListDataProvider sampleTypes](self, "sampleTypes", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObserver:forType:", self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[WDSampleListDataProvider _requestNextPageOfData](self, "_requestNextPageOfData");
}

- (void)stopCollectingData
{
  id updateCallback;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  updateCallback = self->_updateCallback;
  self->_updateCallback = 0;

  -[WDSampleListDataProvider _stopAllQueries](self, "_stopAllQueries");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WDSampleListDataProvider sampleTypes](self, "sampleTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "updateController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObserver:forType:", self, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_stopAllQueries
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WDSampleListDataProvider sampleTypes](self, "sampleTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[WDSampleListDataProvider _pagingContextForSampleType:](self, "_pagingContextForSampleType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "currentDataFetcher");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "currentDataFetcher");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stop");

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_resetAllData
{
  NSDictionary *pagingContexts;

  -[WDSampleListDataProvider _stopAllQueries](self, "_stopAllQueries");
  pagingContexts = self->_pagingContexts;
  self->_pagingContexts = 0;

  -[HKSortedSampleArray removeAllSamples](self->_samples, "removeAllSamples");
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  -[HKSortedSampleArray removeSampleAtIndex:](self->_samples, "removeSampleAtIndex:", a3, a4);
  *a5 = 0;
}

- (void)deleteAllData
{
  -[HKSortedSampleArray removeAllSamples](self->_samples, "removeAllSamples");
}

- (BOOL)canEditRowAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= -[WDSampleListDataProvider numberOfSections](self, "numberOfSections"))
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "row");
    v7 = v6 < -[WDSampleListDataProvider numberOfObjectsForSection:](self, "numberOfObjectsForSection:", objc_msgSend(v4, "section"));
  }

  return v7;
}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "row");
  v14 = objc_msgSend(v12, "section");

  -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__WDSampleListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
  v17[3] = &unk_24D38D9D0;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "deleteObjectWithHealthStore:options:completion:", v11, a5, v17);

}

uint64_t __84__WDSampleListDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE4A5A0]);
  -[WDSampleListDataProvider profileName](self, "profileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSample:usingInsetStyling:profileName:delegate:", v7, 1, v9, self);

  return v10;
}

- (HKHealthStore)healthStore
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKHealthStore *)v3;
}

- (id)displayTypeController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "displayTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unitController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "unitController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultPredicateForSampleType:(id)a3
{
  WDProfile **p_profile;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  p_profile = &self->_profile;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "displayTypeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayTypeForObjectType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v8, "unitController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wd_listViewControllerDataProviderWithProfile:unitController:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "defaultQueryPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5
{
  WDProfile **p_profile;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WDDataListViewController *v19;
  id v20;
  WDDataListViewController *v21;

  p_profile = &self->_profile;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "displayTypeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "displayTypeForObjectType:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v14, "unitController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wd_listViewControllerDataProviderWithProfile:unitController:isHierarchical:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "defaultQueryPredicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIPredicateMatchingPredicates();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDefaultQueryPredicate:", v18);
  v19 = [WDDataListViewController alloc];
  v20 = objc_loadWeakRetained((id *)p_profile);
  v21 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](v19, "initWithDisplayType:profile:dataProvider:usingInsetStyling:", v13, v20, v16, 1);

  -[WDDataListViewController setTitle:](v21, "setTitle:", v8);
  return v21;
}

- (id)accessViewControllerForSample:(id)a3 healthStore:(id)a4
{
  id v5;
  id v6;
  WDAppAccessListViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WDAppAccessListViewController initWithSample:healthStore:]([WDAppAccessListViewController alloc], "initWithSample:healthStore:", v6, v5);

  return v7;
}

- (BOOL)shareDocumentUsingSample:(id)a3
{
  return objc_msgSend(a3, "hasAssociatedReport");
}

- (void)viewControllerWantsDataIncludingDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WDSampleListDataProvider _resetAllData](self, "_resetAllData");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WDSampleListDataProvider sampleTypes](self, "sampleTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[WDSampleListDataProvider _pagingContextForSampleType:](self, "_pagingContextForSampleType:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          -[WDSampleListDataProvider queryDateForSelectedDate:](self, "queryDateForSelectedDate:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFetchUntilDate:", v12);

        }
        if (!self->_updateCallback)
        {

          goto LABEL_13;
        }
        -[WDSampleListDataProvider _requestNextPageOfDataForSampleType:](self, "_requestNextPageOfDataForSampleType:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (id)queryDateForSelectedDate:(id)a3
{
  return a3;
}

- (void)_requestNextPageOfData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WDSampleListDataProvider sampleTypes](self, "sampleTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[WDSampleListDataProvider _requestNextPageOfDataForSampleType:](self, "_requestNextPageOfDataForSampleType:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_pagingContextForSampleType:(id)a3
{
  id v4;
  NSDictionary *pagingContexts;
  NSDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WDSampleListDataProviderPagingContext *v13;
  NSDictionary *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pagingContexts = self->_pagingContexts;
  if (!pagingContexts)
  {
    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WDSampleListDataProvider sampleTypes](self, "sampleTypes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = objc_alloc_init(_WDSampleListDataProviderPagingContext);
          -[_WDSampleListDataProviderPagingContext setRequiresPaging:](v13, "setRequiresPaging:", 1);
          -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v14 = self->_pagingContexts;
    self->_pagingContexts = v6;

    pagingContexts = self->_pagingContexts;
  }
  -[NSDictionary objectForKeyedSubscript:](pagingContexts, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  return 0;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = (objc_class *)MEMORY[0x24BDD3F00];
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend([v11 alloc], "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v15, v14, a5, v13, v12);

  return v16;
}

- (void)_requestNextPageOfDataForSampleType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id WeakRetained;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WDSampleListDataProvider _pagingContextForSampleType:](self, "_pagingContextForSampleType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFetchingData") & 1) != 0 || !objc_msgSend(v5, "requiresPaging"))
    goto LABEL_11;
  -[WDSampleListDataProvider _defaultPredicateWithPredicateForType:](self, "_defaultPredicateWithPredicateForType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earliestProcessedSampleDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WDSampleListDataProvider _UUIDsForSamplesWithEndDate:](self, "_UUIDsForSamplesWithEndDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K <= %@"), *MEMORY[0x24BDD32E0], v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsWithUUIDs:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14C0], "notPredicateWithSubpredicate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    HKUIPredicateMatchingPredicates();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HKUIPredicateMatchingPredicates();
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
LABEL_7:

    v6 = (void *)v13;
    goto LABEL_8;
  }
  objc_msgSend(v5, "fetchUntilDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "fetchUntilDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %@"), *MEMORY[0x24BDD32E0], v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIPredicateMatchingPredicates();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke;
  v27[3] = &unk_24D38E6F8;
  v27[4] = self;
  v18 = v4;
  v28 = v18;
  v19 = (void *)MEMORY[0x2199E6E80](v27);
  -[WDSampleListDataProvider createDataFetcherForSampleType:predicate:limit:sortDescriptors:resultsHandler:](self, "createDataFetcherForSampleType:predicate:limit:sortDescriptors:resultsHandler:", v18, v6, 200, v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_205;
    v25[3] = &unk_24D38E720;
    v26 = v19;
    -[WDSampleListDataProvider createQueryForSampleType:predicate:limit:sortDescriptors:resultsHandler:](self, "createQueryForSampleType:predicate:limit:sortDescriptors:resultsHandler:", v18, v6, 200, v16, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x24BE4A800]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "healthStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v22, "initWithHealthStore:query:", v24, v21);

  }
  objc_msgSend(v5, "setFetchingData:", 1);
  objc_msgSend(v5, "setCurrentDataFetcher:", v20);
  objc_msgSend(v20, "start");

LABEL_11:
}

void __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_2;
  v10[3] = &unk_24D38D410;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  if (*(_QWORD *)(a1 + 40))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_215814000, v2, OS_LOG_TYPE_ERROR, "%@: Error fetching samples of type (%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleQueryResultsForSampleType:results:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __64__WDSampleListDataProvider__requestNextPageOfDataForSampleType___block_invoke_205(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleQueryResultsForSampleType:(id)a3 results:(id)a4
{
  HKSortedSampleArray *samples;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  v14 = a4;
  samples = self->_samples;
  v7 = a3;
  -[HKSortedSampleArray insertSamples:](samples, "insertSamples:", v14);
  objc_msgSend(v14, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDSampleListDataProvider _pagingContextForSampleType:](self, "_pagingContextForSampleType:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCurrentDataFetcher:", 0);
  objc_msgSend(v10, "setFetchingData:", 0);
  objc_msgSend(v10, "fetchUntilDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = 1;
  else
    v12 = objc_msgSend(v14, "count") == 200;
  objc_msgSend(v10, "setRequiresPaging:", v12);

  objc_msgSend(v10, "setFetchUntilDate:", 0);
  if (v9)
  {
    objc_msgSend(v10, "setEarliestProcessedSampleDate:", v9);
  }
  else
  {
    objc_msgSend(v10, "earliestProcessedSampleDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEarliestProcessedSampleDate:", v13);

  }
  -[WDSampleListDataProvider _callUpdateHandler](self, "_callUpdateHandler");

}

- (id)_UUIDsForSamplesWithEndDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HKSortedSampleArray allSamples](self->_samples, "allSamples", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((HKUIObjectIsLarger() & 1) != 0)
        {

          goto LABEL_13;
        }
        if (objc_msgSend(v13, "isEqualToDate:", v4))
        {
          objc_msgSend(v12, "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

- (void)_callUpdateHandler
{
  void (**updateCallback)(void);

  updateCallback = (void (**)(void))self->_updateCallback;
  if (updateCallback)
    updateCallback[2]();
}

- (void)refineSamplesWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  _BOOL4 v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HKSampleListDataProviderFilter *defaultQueryPredicateFilter;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v7 = a7;
  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = -[WDSampleListDataProvider _handleObjectsRemoved:](self, "_handleObjectsRemoved:", a6);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
        defaultQueryPredicateFilter = self->_defaultQueryPredicateFilter;
        if (!defaultQueryPredicateFilter
          || -[HKSampleListDataProviderFilter acceptsDataObject:](defaultQueryPredicateFilter, "acceptsDataObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17)))
        {
          objc_msgSend(v12, "addObject:", v18);
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  if (((v11 | -[HKSortedSampleArray insertSamples:](self->_samples, "insertSamples:", v12)) & 1) != 0
    || v7)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke;
    v20[3] = &unk_24D38E748;
    v20[4] = self;
    -[WDSampleListDataProvider refineSamplesWithCompletion:](self, "refineSamplesWithCompletion:", v20);
  }

}

void __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2;
  block[3] = &unk_24D38CEE8;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __117__WDSampleListDataProvider_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeSamplesWithUUIDs:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "insertSamples:");
  return objc_msgSend(*(id *)(a1 + 40), "_callUpdateHandler");
}

- (BOOL)_handleObjectsRemoved:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "UUID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[HKSortedSampleArray removeSamplesWithUUIDs:](self->_samples, "removeSamplesWithUUIDs:", v5);
  return v12;
}

- (NSPredicate)defaultQueryPredicate
{
  return self->_defaultQueryPredicate;
}

- (BOOL)hasDetailViewController
{
  return self->_hasDetailViewController;
}

- (void)setHasDetailViewController:(BOOL)a3
{
  self->_hasDetailViewController = a3;
}

- (NSString)profileName
{
  return self->_profileName;
}

- (void)setProfileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (WDProfile)profile
{
  return (WDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKSortedSampleArray)samples
{
  return self->_samples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_defaultQueryPredicate, 0);
  objc_storeStrong(&self->_updateCallback, 0);
  objc_storeStrong((id *)&self->_defaultQueryPredicateFilter, 0);
  objc_storeStrong((id *)&self->_pagingContexts, 0);
}

- (id)textForObject:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

@end
