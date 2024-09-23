@implementation _HKSleepComparisonContext

- (_HKSleepComparisonContext)initWithStackedSampleType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 contextChangeDelegate:(id)a7 primarySleepDisplayType:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _HKSleepComparisonContext *v21;
  char v23;
  objc_super v24;

  v14 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  if (-[_HKSleepComparisonContext _sampleTypeShouldUseSleepQuantityDistribution:](self, "_sampleTypeShouldUseSleepQuantityDistribution:", v19))
  {
    -[_HKSleepComparisonContext _generateSleepDistributionDisplayTypeForStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:](self, "_generateSleepDistributionDisplayTypeForStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:", v19, v18, v17, v16);
  }
  else
  {
    -[_HKSleepComparisonContext _defaultStackedInteractiveChartDisplayTypeForSampleType:overlayChartController:applicationItems:formatterTimeScope:](self, "_defaultStackedInteractiveChartDisplayTypeForSampleType:overlayChartController:applicationItems:formatterTimeScope:", v19, v17, v16, 5);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)_HKSleepComparisonContext;
  v23 = 1;
  v21 = -[HKOverlayRoomStackedContext initWithDisplayType:overlayDisplayType:stackedDisplayType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:](&v24, sel_initWithDisplayType_overlayDisplayType_stackedDisplayType_overlayChartController_currentCalendarOverride_applicationItems_isInfoButtonHidden_, v15, 0, v20, v17, v18, v16, v23);

  if (v21)
    objc_storeWeak((id *)&v21->_contextChangeDelegate, v14);

  return v21;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[_HKSleepComparisonContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComparisonContextSelected:", v5);

}

- (void)stackedOverlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[_HKSleepComparisonContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComparisonContextSelected:", v5);

}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (id)_generateSleepDistributionDisplayTypeForStackedSampleType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKQuantityDistributionDataSource *v17;
  void *v18;
  void *v19;
  HKQuantityDistributionDataSource *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HKInteractiveChartOverlayNamedDataSource *v24;
  HKInteractiveChartDisplayType *v25;
  void *v26;
  HKInteractiveChartDisplayType *v27;
  void *v28;
  _QWORD v30[5];

  v8 = a6;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "timeScopeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "selectedTimeScope");

  objc_msgSend(v8, "displayTypeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayTypeForObjectType:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "hk_interactiveChartsFormatterForTimeScope:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:](HKOverlayRoomStackedContext, "generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:", v14, v10, v8, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [HKQuantityDistributionDataSource alloc];
  objc_msgSend(v9, "unitPreferenceController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "healthStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __151___HKSleepComparisonContext__generateSleepDistributionDisplayTypeForStackedSampleType_currentCalendarOverride_overlayChartController_applicationItems___block_invoke;
  v30[3] = &__block_descriptor_40_e48__24__0___HKQuantityDistributionData_8__HKUnit_16l;
  v30[4] = 0;
  v20 = -[HKQuantityDistributionDataSource initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:](v17, "initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:", v10, v18, v19, 6, 0, 0, v14, 0, 0, v30);

  -[HKHealthQueryChartCacheDataSource setQueryAlignment:](v20, "setQueryAlignment:", 1);
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_msgSend(v10, "code");

  objc_msgSend(v21, "stringWithFormat:", CFSTR("_HKSleepComparisonContext_%ld"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v20, v23, 0);
  v25 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v14, "sampleType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v25, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v16, v14, v15, objc_msgSend(v26, "code"));

  objc_msgSend(v9, "displayTypeForGraphSeries:namedDataSource:templateDisplayType:timeScope:formatter:", v16, v24, v27, v12, v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_defaultStackedInteractiveChartDisplayTypeForSampleType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 formatterTimeScope:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, uint64_t);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKInteractiveChartDisplayType *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(_QWORD *, uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "displayTypeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayTypeForObjectType:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __144___HKSleepComparisonContext__defaultStackedInteractiveChartDisplayTypeForSampleType_overlayChartController_applicationItems_formatterTimeScope___block_invoke;
  v27 = &unk_1E9C45760;
  v28 = v11;
  v29 = v8;
  v30 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v11;
  v15 = (void (**)(void *, uint64_t))_Block_copy(&v24);
  v31[0] = &unk_1E9CED178;
  v15[2](v15, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v31[1] = &unk_1E9CED190;
  v15[2](v15, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v17;
  v31[2] = &unk_1E9CED1A8;
  v15[2](v15, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v18;
  v31[3] = &unk_1E9CED1C0;
  v15[2](v15, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4, v24, v25, v26, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "hk_interactiveChartsFormatterForTimeScope:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HKInteractiveChartDisplayType initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:]([HKInteractiveChartDisplayType alloc], "initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:", v14, v21, objc_msgSend(v13, "code"), v20);

  return v22;
}

- (BOOL)_sampleTypeShouldUseSleepQuantityDistribution:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)*MEMORY[0x1E0CB5D20])
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == (void *)*MEMORY[0x1E0CB5CB0];

  }
  return v6;
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  return (HKOverlaySleepRoomContextChangeDelegate *)objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
}

@end
