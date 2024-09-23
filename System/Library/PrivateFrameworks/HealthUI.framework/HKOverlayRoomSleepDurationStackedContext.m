@implementation HKOverlayRoomSleepDurationStackedContext

- (HKOverlayRoomSleepDurationStackedContext)initWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5 primaryDisplayType:(id)a6 uniqueIdentifier:(id)a7 firstWeekdayOverride:(id)a8 currentCalendarOverride:(id)a9 isInfoButtonHidden:(BOOL)a10
{
  NSString *v16;
  NSNumber *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSString *uniqueIdentifier;
  NSString *v24;
  NSNumber *firstWeekdayOverride;
  NSNumber *v26;
  HKOverlayRoomSleepDurationStackedContext *v27;
  objc_super v30;

  v16 = (NSString *)a7;
  v17 = (NSNumber *)a8;
  v18 = a9;
  v19 = a6;
  v20 = a4;
  v21 = a3;
  -[HKOverlayRoomSleepDurationStackedContext _generateSleepDurationStackedDisplayTypeWithApplicationItems:overlayChartController:sleepChartFormatter:](self, "_generateSleepDurationStackedDisplayTypeWithApplicationItems:overlayChartController:sleepChartFormatter:", v21, v20, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v16;
  v24 = v16;

  firstWeekdayOverride = self->_firstWeekdayOverride;
  self->_firstWeekdayOverride = v17;
  v26 = v17;

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomSleepDurationStackedContext;
  v27 = -[HKOverlayRoomStackedContext initWithDisplayType:overlayDisplayType:stackedDisplayType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:](&v30, sel_initWithDisplayType_overlayDisplayType_stackedDisplayType_overlayChartController_currentCalendarOverride_applicationItems_isInfoButtonHidden_, v19, 0, v22, v20, v18, v21, a10);

  return v27;
}

- (HKOverlayRoomSleepDurationStackedContext)initWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5 primarySampleType:(id)a6 uniqueIdentifier:(id)a7 firstWeekdayOverride:(id)a8 currentCalendarOverride:(id)a9 isInfoButtonHidden:(BOOL)a10
{
  NSString *v16;
  NSNumber *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSString *uniqueIdentifier;
  NSString *v24;
  NSNumber *firstWeekdayOverride;
  NSNumber *v26;
  HKOverlayRoomSleepDurationStackedContext *v27;
  objc_super v30;

  v16 = (NSString *)a7;
  v17 = (NSNumber *)a8;
  v18 = a9;
  v19 = a6;
  v20 = a4;
  v21 = a3;
  -[HKOverlayRoomSleepDurationStackedContext _generateSleepDurationStackedDisplayTypeWithApplicationItems:overlayChartController:sleepChartFormatter:](self, "_generateSleepDurationStackedDisplayTypeWithApplicationItems:overlayChartController:sleepChartFormatter:", v21, v20, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v16;
  v24 = v16;

  firstWeekdayOverride = self->_firstWeekdayOverride;
  self->_firstWeekdayOverride = v17;
  v26 = v17;

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomSleepDurationStackedContext;
  v27 = -[HKOverlayRoomStackedContext initWithSampleType:overlayDisplayType:stackedDisplayType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:](&v30, sel_initWithSampleType_overlayDisplayType_stackedDisplayType_overlayChartController_currentCalendarOverride_applicationItems_isInfoButtonHidden_, v19, 0, v22, v20, v18, v21, a10);

  return v27;
}

- (id)_generateSleepDurationStackedDisplayTypeWithApplicationItems:(id)a3 overlayChartController:(id)a4 sleepChartFormatter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKInteractiveChartDisplayType *v15;
  void *v16;
  HKInteractiveChartDisplayType *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayTypeWithIdentifier:", &unk_1E9CECA28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomSleepDurationStackedContext _generateSleepSeriesWithTemplateDisplayType:applicationItems:](self, "_generateSleepSeriesWithTemplateDisplayType:applicationItems:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepDurationStackedContext _generateNamedDataSourceWithTemplateDisplayType:overlayChartController:applicationItems:](self, "_generateNamedDataSourceWithTemplateDisplayType:overlayChartController:applicationItems:", v12, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v12, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v15, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v12, v8, objc_msgSend(v16, "code"));

  objc_msgSend(v9, "displayTypeForGraphSeries:namedDataSource:templateDisplayType:timeScope:formatter:", v13, v14, v17, 3, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_generateSleepSeriesWithTemplateDisplayType:(id)a3 applicationItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  objc_msgSend(a4, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKOverlayContextUtilities stackedAxisConfiguration](HKOverlayContextUtilities, "stackedAxisConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:](HKSleepUtilities, "buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:", 0, v5, v6, v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CECA40, &unk_1E9CECA58);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CECA40, &unk_1E9CECA70);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:axisBoundsOverrides:](HKNumericFixedAxisScalingRule, "ruleWithDefaultAxisBounds:axisBoundsOverrides:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNoDataAxisBounds:", v10);
  objc_msgSend(v8, "setAxisScalingRule:", v11);
  objc_msgSend(v5, "localization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "shortenedDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKOverlayContextUtilities setStackedSeriesLegend:title:](HKOverlayContextUtilities, "setStackedSeriesLegend:title:", v8, v13);

  return v8;
}

- (id)_generateNamedDataSourceWithTemplateDisplayType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKSleepChartDataSource *v22;
  void *v23;
  HKSleepChartDataSource *v24;
  HKInteractiveChartOverlayNamedDataSource *v25;

  v7 = (void *)MEMORY[0x1E0C99D48];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "hk_gregorianCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepDurationStackedContext firstWeekdayOverride](self, "firstWeekdayOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HKOverlayRoomSleepDurationStackedContext firstWeekdayOverride](self, "firstWeekdayOverride");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFirstWeekday:", objc_msgSend(v12, "integerValue"));

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[HKOverlayRoomSleepDurationStackedContext uniqueIdentifier](self, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomSleepDurationStackedContext firstWeekdayOverride](self, "firstWeekdayOverride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HKOverlayRoomSleepDurationStackedContext firstWeekdayOverride](self, "firstWeekdayOverride");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v14, &stru_1E9C4C428);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKSleepQueryCacheIdentifier%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKSleepQueryIdentifier%@"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKOverlayRoomStackedContextSleepDuration%@"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [HKSleepChartDataSource alloc];
  objc_msgSend(v8, "healthStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[HKSleepChartDataSource initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:](v22, "initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:", v23, v9, 2, v19, v20, v10);
  v25 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v24, v21, 0);

  return v25;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSNumber)firstWeekdayOverride
{
  return self->_firstWeekdayOverride;
}

- (void)setFirstWeekdayOverride:(id)a3
{
  objc_storeStrong((id *)&self->_firstWeekdayOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstWeekdayOverride, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
