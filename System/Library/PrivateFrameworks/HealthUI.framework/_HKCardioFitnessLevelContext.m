@implementation _HKCardioFitnessLevelContext

- (_HKCardioFitnessLevelContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 baseDisplayType:(id)a6 cardioFitnessLevel:(int64_t)a7
{
  id v12;
  id v13;
  _HKCardioFitnessLevelContext *v14;
  _HKCardioFitnessLevelContext *v15;
  uint64_t v16;
  HKHealthStore *healthStore;
  _HKCardioFitnessLevelDataSourceDelegate *v18;
  int64_t cardioFitnessLevel;
  void *v20;
  uint64_t v21;
  HKDateRangeDataSourceDelegate *dataSourceDelegate;
  HKDateRangeDataSource *v23;
  uint64_t v24;
  HKGraphSeries *cardioFitnessLevelSeries;
  HKInteractiveChartDisplayType *v26;
  HKGraphSeries *v27;
  HKDisplayType *baseDisplayType;
  HKInteractiveChartCardioFitnessFormatter *v29;
  uint64_t v30;
  HKInteractiveChartDisplayType *overlayDisplayType;
  uint64_t v32;
  HKUnit *unit;
  void *v34;
  objc_super v36;

  v12 = a4;
  v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)_HKCardioFitnessLevelContext;
  v14 = -[_HKCardioFitnessOverlayContext initWithMode:applicationItems:overlayChartController:](&v36, sel_initWithMode_applicationItems_overlayChartController_, a3, v12, a5);
  v15 = v14;
  if (v14)
  {
    v14->_cardioFitnessLevel = a7;
    objc_storeStrong((id *)&v14->_baseDisplayType, a6);
    objc_msgSend(v12, "healthStore");
    v16 = objc_claimAutoreleasedReturnValue();
    healthStore = v15->_healthStore;
    v15->_healthStore = (HKHealthStore *)v16;

    v18 = [_HKCardioFitnessLevelDataSourceDelegate alloc];
    cardioFitnessLevel = v15->_cardioFitnessLevel;
    objc_msgSend(v12, "healthStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_HKCardioFitnessLevelDataSourceDelegate initWithCardioFitnessLevel:healthStore:baseDisplayType:](v18, "initWithCardioFitnessLevel:healthStore:baseDisplayType:", cardioFitnessLevel, v20, v13);
    dataSourceDelegate = v15->_dataSourceDelegate;
    v15->_dataSourceDelegate = (HKDateRangeDataSourceDelegate *)v21;

    v23 = -[HKDateRangeDataSource initWithSourceDelegate:]([HKDateRangeDataSource alloc], "initWithSourceDelegate:", v15->_dataSourceDelegate);
    -[_HKCardioFitnessLevelContext _makeGraphSeriesWithDataSource:baseDisplayType:](v15, "_makeGraphSeriesWithDataSource:baseDisplayType:", v23, v13);
    v24 = objc_claimAutoreleasedReturnValue();
    cardioFitnessLevelSeries = v15->_cardioFitnessLevelSeries;
    v15->_cardioFitnessLevelSeries = (HKGraphSeries *)v24;

    v26 = [HKInteractiveChartDisplayType alloc];
    v27 = v15->_cardioFitnessLevelSeries;
    baseDisplayType = v15->_baseDisplayType;
    v29 = objc_alloc_init(HKInteractiveChartCardioFitnessFormatter);
    v30 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v26, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v27, baseDisplayType, v29, 124);
    overlayDisplayType = v15->_overlayDisplayType;
    v15->_overlayDisplayType = (HKInteractiveChartDisplayType *)v30;

    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mL/(kg*min)"));
    v32 = objc_claimAutoreleasedReturnValue();
    unit = v15->_unit;
    v15->_unit = (HKUnit *)v32;

    -[_HKCardioFitnessOverlayContext _cardioFitnessContextItemWithLevel:sampleCount:](v15, "_cardioFitnessContextItemWithLevel:sampleCount:", v15->_cardioFitnessLevel, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKCardioFitnessOverlayContext setLastUpdatedItem:](v15, "setLastUpdatedItem:", v34);

  }
  return v15;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  if (a5 > 5)
    -[_HKCardioFitnessLevelContext _updateContextItemWithSampleCountForDateInterval:timeScope:completion:](self, "_updateContextItemWithSampleCountForDateInterval:timeScope:completion:", a3, a5, a7, a6);
  else
    -[_HKCardioFitnessLevelContext _updateContextItemWithChartPointCountForDateInterval:timeScope:completion:](self, "_updateContextItemWithChartPointCountForDateInterval:timeScope:completion:", a3, a5, a7, a6);
}

- (void)_updateContextItemWithChartPointCountForDateInterval:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  -[_HKCardioFitnessOverlayContext overlayChartController](self, "overlayChartController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryDisplayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    -[_HKCardioFitnessOverlayContext overlayChartController](self, "overlayChartController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "graphSeriesForTimeScope:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __106___HKCardioFitnessLevelContext__updateContextItemWithChartPointCountForDateInterval_timeScope_completion___block_invoke;
    v17[3] = &unk_1E9C41238;
    v17[4] = self;
    v19 = a4;
    v18 = v9;
    objc_msgSend(v13, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v14, a4, 0, v15, v16, v17);

  }
}

- (void)_updateContextItemWithSampleCountForDateInterval:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int64_t cardioFitnessLevel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKUnit *unit;
  void *v18;
  void *v19;
  void *v20;
  HKUnit *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  HKHealthStore *healthStore;
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v37 = a5;
  +[HKCardioFitnessUtilities cardioFitnessLevelDateIntervalsWithDateInterval:healthStore:](HKCardioFitnessUtilities, "cardioFitnessLevelDateIntervalsWithDateInterval:healthStore:", a3, self->_healthStore);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v8)
  {
    v9 = v8;
    v39 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        cardioFitnessLevel = self->_cardioFitnessLevel;
        objc_msgSend(v11, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKCardioFitnessUtilities cardioFitnessDataForLevel:date:healthStore:](HKCardioFitnessUtilities, "cardioFitnessDataForLevel:date:healthStore:", cardioFitnessLevel, v13, self->_healthStore);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v33 = v37;
          (*((void (**)(id, _QWORD, _QWORD))v37 + 2))(v37, 0, 0);
          v36 = obj;
          v30 = obj;
          v29 = v40;
          goto LABEL_15;
        }
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
        if (+[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayLowerBound:](HKCardioFitnessUtilities, "cardioFitnessLevelChartShouldDisplayLowerBound:", self->_cardioFitnessLevel))
        {
          v16 = (void *)MEMORY[0x1E0CB6A28];
          unit = self->_unit;
          objc_msgSend(v14, "vo2MaxLowerBound");
          objc_msgSend(v16, "quantityWithUnit:doubleValue:", unit);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForQuantitySamplesWithOperatorType:quantity:", 3, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v19);

        }
        if (+[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayUpperBound:](HKCardioFitnessUtilities, "cardioFitnessLevelChartShouldDisplayUpperBound:", self->_cardioFitnessLevel))
        {
          v20 = (void *)MEMORY[0x1E0CB6A28];
          v21 = self->_unit;
          objc_msgSend(v14, "vo2MaxUpperBound");
          objc_msgSend(v20, "quantityWithUnit:doubleValue:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForQuantitySamplesWithOperatorType:quantity:", 0, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v23);

        }
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v15);
        objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithinDateInterval:options:", v11, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc(MEMORY[0x1E0CB3528]);
        v47[0] = v25;
        v47[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v26, "initWithType:subpredicates:", 1, v27);

        objc_msgSend(v40, "addObject:", v28);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v9)
        continue;
      break;
    }
  }

  v29 = v40;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 2, v40);
  v31 = objc_alloc(MEMORY[0x1E0CB6AE0]);
  -[HKDisplayType sampleType](self->_baseDisplayType, "sampleType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __102___HKCardioFitnessLevelContext__updateContextItemWithSampleCountForDateInterval_timeScope_completion___block_invoke;
  v41[3] = &unk_1E9C417D0;
  v41[4] = self;
  v33 = v37;
  v42 = v37;
  v34 = (void *)objc_msgSend(v31, "initWithSampleType:predicate:resultsHandler:", v32, v30, v41);

  healthStore = self->_healthStore;
  v36 = obj;
  -[HKHealthStore executeQuery:](healthStore, "executeQuery:", v34);

LABEL_15:
}

- (id)_makeGraphSeriesWithDataSource:(id)a3 baseDisplayType:(id)a4
{
  int64_t cardioFitnessLevel;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  cardioFitnessLevel = self->_cardioFitnessLevel;
  v7 = a4;
  v8 = a3;
  v9 = +[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayUpperBound:](HKCardioFitnessUtilities, "cardioFitnessLevelChartShouldDisplayUpperBound:", cardioFitnessLevel);
  if (+[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayLowerBound:](HKCardioFitnessUtilities, "cardioFitnessLevelChartShouldDisplayLowerBound:", self->_cardioFitnessLevel))
  {
    v10 = v9 | 2;
  }
  else
  {
    v10 = v9;
  }
  +[HKLevelOverlaySeries levelOverlaySeriesWithDisplayType:dataSource:options:](HKLevelOverlaySeries, "levelOverlaySeriesWithDisplayType:dataSource:options:", v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)cardioFitnessLevel
{
  return self->_cardioFitnessLevel;
}

- (void)setCardioFitnessLevel:(int64_t)a3
{
  self->_cardioFitnessLevel = a3;
}

- (HKGraphSeries)cardioFitnessLevelSeries
{
  return self->_cardioFitnessLevelSeries;
}

- (void)setCardioFitnessLevelSeries:(id)a3
{
  objc_storeStrong((id *)&self->_cardioFitnessLevelSeries, a3);
}

- (HKDateRangeDataSourceDelegate)dataSourceDelegate
{
  return self->_dataSourceDelegate;
}

- (void)setDataSourceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceDelegate, a3);
}

- (HKInteractiveChartDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (void)setOverlayDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_overlayDisplayType, a3);
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (void)setBaseDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_baseDisplayType, a3);
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_dataSourceDelegate, 0);
  objc_storeStrong((id *)&self->_cardioFitnessLevelSeries, 0);
}

@end
