@implementation HKChartDataCacheController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_activitySummaryDataProvider, 0);
  objc_storeStrong((id *)&self->_secondaryValueDataProviders, 0);
  objc_storeStrong((id *)&self->_alternateCurrentValueDataProvidersByDisplayType, 0);
  objc_storeStrong((id *)&self->_currentValueDataProvidersByDisplayType, 0);
  objc_storeStrong((id *)&self->_chartCachesByCustomDisplayType, 0);
  objc_storeStrong((id *)&self->_chartCachesByDisplayTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_chartCachesByTimeScopeAndDisplayTypeIdentifier, 0);
}

- (HKChartDataCacheController)initWithHealthStore:(id)a3 unitController:(id)a4 updateController:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKChartDataCacheController *v11;
  HKChartDataCacheController *v12;
  NSArray *v13;
  uint64_t v14;
  id v15;
  NSArray *chartCachesByTimeScopeAndDisplayTypeIdentifier;
  NSArray *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *chartCachesByDisplayTypeIdentifier;
  NSMutableArray *v20;
  NSMutableArray *chartCachesByCustomDisplayType;
  NSMutableDictionary *v22;
  NSMutableDictionary *currentValueDataProvidersByDisplayType;
  NSMutableDictionary *v24;
  NSMutableDictionary *alternateCurrentValueDataProvidersByDisplayType;
  NSMutableDictionary *v26;
  NSMutableDictionary *secondaryValueDataProviders;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HKChartDataCacheController;
  v11 = -[HKChartDataCacheController init](&v29, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HKChartDataCacheController setHealthStore:](v11, "setHealthStore:", v8);
    -[HKChartDataCacheController setUnitController:](v12, "setUnitController:", v9);
    -[HKChartDataCacheController setUpdateController:](v12, "setUpdateController:", v10);
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 8;
    do
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSArray addObject:](v13, "addObject:", v15);

      --v14;
    }
    while (v14);
    chartCachesByTimeScopeAndDisplayTypeIdentifier = v12->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
    v12->_chartCachesByTimeScopeAndDisplayTypeIdentifier = v13;
    v17 = v13;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    chartCachesByDisplayTypeIdentifier = v12->_chartCachesByDisplayTypeIdentifier;
    v12->_chartCachesByDisplayTypeIdentifier = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    chartCachesByCustomDisplayType = v12->_chartCachesByCustomDisplayType;
    v12->_chartCachesByCustomDisplayType = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentValueDataProvidersByDisplayType = v12->_currentValueDataProvidersByDisplayType;
    v12->_currentValueDataProvidersByDisplayType = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    alternateCurrentValueDataProvidersByDisplayType = v12->_alternateCurrentValueDataProvidersByDisplayType;
    v12->_alternateCurrentValueDataProvidersByDisplayType = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    secondaryValueDataProviders = v12->_secondaryValueDataProviders;
    v12->_secondaryValueDataProviders = v26;

  }
  return v12;
}

- (void)setUpdateController:(id)a3
{
  objc_storeStrong((id *)&self->_updateController, a3);
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (id)interactiveChartsCacheForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(v6, "hk_healthQueryChartDataSourceDependsOnTimeScope"))
    -[HKChartDataCacheController _timeScopeBasedChartCacheForDisplayType:timeScope:](self, "_timeScopeBasedChartCacheForDisplayType:timeScope:", v6, a4);
  else
    -[HKChartDataCacheController _chartCacheForDisplayType:timeScope:chartCachesByDisplayTypeIdentifier:](self, "_chartCacheForDisplayType:timeScope:chartCachesByDisplayTypeIdentifier:", v6, a4, self->_chartCachesByDisplayTypeIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allInteractiveChartsCaches
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = self->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v36;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v36 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v6);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allValues](self->_chartCachesByDisplayTypeIdentifier, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v17);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_chartCachesByCustomDisplayType;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v24), "chartCache", (_QWORD)v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v22);
  }

  return v3;
}

- (id)_timeScopeBasedChartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  NSArray *chartCachesByTimeScopeAndDisplayTypeIdentifier;
  id v7;
  void *v8;
  void *v9;

  chartCachesByTimeScopeAndDisplayTypeIdentifier = self->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
  v7 = a3;
  -[NSArray objectAtIndexedSubscript:](chartCachesByTimeScopeAndDisplayTypeIdentifier, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartDataCacheController _chartCacheForDisplayType:timeScope:chartCachesByDisplayTypeIdentifier:](self, "_chartCacheForDisplayType:timeScope:chartCachesByDisplayTypeIdentifier:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_chartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4 chartCachesByDisplayTypeIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "displayTypeIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[HKChartDataCacheController _generateChartCacheForDisplayType:timeScope:](self, "_generateChartCacheForDisplayType:timeScope:", v8, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldBufferFetchOperations:", 1);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
    -[HKChartDataCacheController _subscribeForUpdatesForDisplayType:](self, "_subscribeForUpdatesForDisplayType:", v8);
  }

  return v11;
}

- (id)_generateChartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKChartCache *v10;
  void *v11;

  v6 = a3;
  -[HKChartDataCacheController healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartDataCacheController unitController](self, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_healthQueryChartCacheDataSourceForTimeScope:healthStore:unitController:", a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(HKChartCache);
  -[HKChartCache setDataSource:](v10, "setDataSource:", v9);
  +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartCache setOperationManager:](v10, "setOperationManager:", v11);

  return v10;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  if (objc_msgSend(a6, "count"))
  {
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v11 = 0;
    v12 = 1;
    if (!-[HKChartDataCacheController _anySampleShouldInvalidateCache:](self, "_anySampleShouldInvalidateCache:", v10)
      && !a7)
    {
      if (objc_msgSend(v10, "count"))
      {
        -[HKChartDataCacheController _chartCacheIdentifiersFromSamples:](self, "_chartCacheIdentifiersFromSamples:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
      }
      else
      {
        v12 = 0;
        v11 = 0;
      }
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKChartDataCacheController allInteractiveChartsCaches](self, "allInteractiveChartsCaches", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v18, "setShouldBufferFetchOperations:", 0);
        if (v12)
        {
          objc_msgSend(v18, "invalidateCache");
        }
        else if (v11)
        {
          objc_msgSend(v18, "invalidateResultsForIdentifiers:", v11);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (BOOL)_anySampleShouldInvalidateCache:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB7150]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {
    v11 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = 1;
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "quantityType", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v12 == v4;
LABEL_16:

        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "categoryType", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v12 == v13;

        goto LABEL_16;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    v11 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_17:

  return v11;
}

- (void)updateController:(id)a3 didReceiveHighFrequencyUpdateForType:(id)a4
{
  id v5;
  void *v6;
  double v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    if (objc_msgSend(v8, "isMinimumDurationRestricted"))
    {
      objc_msgSend(v8, "minimumAllowedDuration");
      v7 = v9 + 1.0;
    }

  }
  objc_msgSend(v6, "dateByAddingTimeInterval:", -v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartDataCacheController _chartCacheIdentifiersFromStartDate:endDate:](self, "_chartCacheIdentifiersFromStartDate:endDate:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HKChartDataCacheController allInteractiveChartsCaches](self, "allInteractiveChartsCaches", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "invalidateResultsForIdentifiers:", v12);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (id)_chartCacheIdentifiersFromSamples:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "hasUndeterminedDuration", (_QWORD)v18);
        objc_msgSend(v11, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
        else
          objc_msgSend(v11, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKChartDataCacheController _chartCacheIdentifiersFromStartDate:endDate:](self, "_chartCacheIdentifiersFromStartDate:endDate:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_chartCacheIdentifiersFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];

  v20 = a3;
  v19 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  for (i = 0; i != 8; ++i)
  {
    +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "approximateSeriesPointIntervalAtResolution:", 0);
    v9 = v8;
    objc_msgSend(v20, "dateByAddingTimeInterval:", -v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = v13;
      memset(v23, 0, sizeof(v23));
      HKGraphSeriesDataBlockPathContainingDate(v10, i, v12, v23);
      memset(v22, 0, sizeof(v22));
      HKGraphSeriesDataBlockPathContainingDate(v11, i, v12, v22);
      v15 = v23[0];
      if (v23[0] <= v22[0])
      {
        do
        {
          v21[0] = v15;
          v21[1] = i;
          v21[2] = v12;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
        while (v15++ < v22[0]);
      }
      v13 = 0;
      v12 = 1;
    }
    while ((v14 & 1) != 0);

  }
  return v5;
}

- (void)_subscribeForUpdatesForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "displayTypeIdentifier") == 80)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSampleTypeUpdateController addObserver:forType:](self->_updateController, "addObserver:forType:", self, v5);
    -[HKSampleTypeUpdateController addObserver:forType:](self->_updateController, "addObserver:forType:", self, v6);

LABEL_13:
    goto LABEL_14;
  }
  if (!-[HKChartDataCacheController _displayTypeIsActivity:](self, "_displayTypeIsActivity:", v4))
  {
    objc_msgSend(v4, "sampleType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0CB7148];

    if (v8 == v9)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(MEMORY[0x1E0CB6B00], "associatedBalanceMetricsTypes", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
              objc_enumerationMutation(v5);
            -[HKSampleTypeUpdateController addObserver:forType:](self->_updateController, "addObserver:forType:", self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }
    }
    else
    {
      objc_msgSend(v4, "sampleType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSampleTypeUpdateController addObserver:forType:](self->_updateController, "addObserver:forType:", self, v5);
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)_displayTypeIsActivity:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "baseDisplayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isActivitySummary");

  }
  else
  {
    v5 = objc_msgSend(v3, "isActivitySummary");
  }

  return v5;
}

- (id)currentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentValueDataProvidersByDisplayType, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[HKChartDataCacheController _createCurrentValueDataProviderForDisplayType:healthStore:updateController:dateCache:](self, "_createCurrentValueDataProviderForDisplayType:healthStore:updateController:dateCache:", v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentValueDataProvidersByDisplayType, "setObject:forKeyedSubscript:", v14, v10);
  }

  return v14;
}

- (id)alternateCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alternateCurrentValueDataProvidersByDisplayType, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[HKChartDataCacheController _createAlternateCurrentValueDataProviderForDisplayType:healthStore:updateController:dateCache:](self, "_createAlternateCurrentValueDataProviderForDisplayType:healthStore:updateController:dateCache:", v10, v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v14 = (void *)v15;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alternateCurrentValueDataProvidersByDisplayType, "setObject:forKeyedSubscript:", v15, v10);
    }
    else
    {
      -[HKChartDataCacheController currentValueDataProviderForDisplayType:healthStore:updateController:dateCache:](self, "currentValueDataProviderForDisplayType:healthStore:updateController:dateCache:", v10, v11, v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alternateCurrentValueDataProvidersByDisplayType, "setObject:forKeyedSubscript:", v16, v10);

    }
  }

  return v14;
}

- (id)_createCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __objc2_class *v16;
  void *v17;
  uint64_t v18;
  HKCountCurrentValueDataProvider *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "presentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationForTimeScope:", 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentValue");

  switch(v15)
  {
    case 1:
      v16 = HKMostRecentValueDataProvider;
      goto LABEL_6;
    case 2:
      v16 = HKCumulativeSumCurrentValueDataProvider;
      goto LABEL_6;
    case 3:
      v16 = HKMostRecentTimePeriodCurrentValueDataProvider;
LABEL_6:
      v18 = objc_msgSend([v16 alloc], "initWithHealthStore:updateController:dateCache:displayType:", v10, v11, v12, v9);
      goto LABEL_10;
    case 4:
      v19 = [HKCountCurrentValueDataProvider alloc];
      v20 = v10;
      v21 = v11;
      v22 = v12;
      v23 = v9;
      v24 = 0;
      goto LABEL_9;
    case 5:
      v19 = [HKCountCurrentValueDataProvider alloc];
      v20 = v10;
      v21 = v11;
      v22 = v12;
      v23 = v9;
      v24 = 1;
LABEL_9:
      v18 = -[HKCountCurrentValueDataProvider initWithHealthStore:updateController:dateCache:displayType:countStyle:](v19, "initWithHealthStore:updateController:dateCache:displayType:countStyle:", v20, v21, v22, v23, v24);
LABEL_10:
      v17 = (void *)v18;
      break;
    default:
      v17 = 0;
      break;
  }

  return v17;
}

- (id)_createAlternateCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HKLastUpdatedDayCurrentValueDataProvider *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "presentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationForTimeScope:", 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentValue");

  if (v15 == 6)
    v16 = -[HKValueDataProvider initWithHealthStore:updateController:dateCache:displayType:]([HKLastUpdatedDayCurrentValueDataProvider alloc], "initWithHealthStore:updateController:dateCache:displayType:", v10, v11, v12, v9);
  else
    v16 = 0;

  return v16;
}

- (id)activitySummaryDataProviderWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  HKActivitySummaryDataProvider *activitySummaryDataProvider;
  id v11;
  id v12;
  id v13;
  id v14;
  HKActivitySummaryDataProvider *v15;
  HKActivitySummaryDataProvider *v16;

  activitySummaryDataProvider = self->_activitySummaryDataProvider;
  if (!activitySummaryDataProvider)
  {
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v15 = -[HKActivitySummaryDataProvider initWithHealthStore:dateCache:displayTypeController:unitController:]([HKActivitySummaryDataProvider alloc], "initWithHealthStore:dateCache:displayTypeController:unitController:", v14, v13, v12, v11);

    v16 = self->_activitySummaryDataProvider;
    self->_activitySummaryDataProvider = v15;

    activitySummaryDataProvider = self->_activitySummaryDataProvider;
  }
  return activitySummaryDataProvider;
}

- (void)addCustomChartCache:(id)a3 forDisplayType:(id)a4
{
  id v6;
  id v7;
  _HKCustomCacheDisplayTypeTuple *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_HKCustomCacheDisplayTypeTuple initWithCustomCache:displayType:]([_HKCustomCacheDisplayTypeTuple alloc], "initWithCustomCache:displayType:", v7, v6);

  -[NSMutableArray addObject:](self->_chartCachesByCustomDisplayType, "addObject:", v8);
  -[HKChartDataCacheController _subscribeForUpdatesForDisplayType:](self, "_subscribeForUpdatesForDisplayType:", v6);

}

- (void)_removeCustomCachesForDisplayTypeIdentifier:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (-[NSMutableArray count](self->_chartCachesByCustomDisplayType, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_chartCachesByCustomDisplayType, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "displayTypeIdentifier");

      if (v8 == a3)
        objc_msgSend(v9, "addIndex:", v5);

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_chartCachesByCustomDisplayType, "count"));
  }
  -[NSMutableArray removeObjectsAtIndexes:](self->_chartCachesByCustomDisplayType, "removeObjectsAtIndexes:", v9);

}

- (id)findCustomCachesForDisplayType:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_chartCachesByCustomDisplayType;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "displayType", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          objc_msgSend(v11, "chartCache");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)removeCachesForDisplayTypeIdentifier:(int64_t)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeObjectForKey:", v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_chartCachesByDisplayTypeIdentifier, "removeObjectForKey:", v5);
  -[HKChartDataCacheController _removeCustomCachesForDisplayTypeIdentifier:](self, "_removeCustomCachesForDisplayTypeIdentifier:", a3);

}

- (HKSampleTypeUpdateController)updateController
{
  return self->_updateController;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

@end
