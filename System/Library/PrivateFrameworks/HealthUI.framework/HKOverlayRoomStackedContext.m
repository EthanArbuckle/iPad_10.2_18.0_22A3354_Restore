@implementation HKOverlayRoomStackedContext

- (HKOverlayRoomStackedContext)initWithSampleType:(id)a3 overlayDisplayType:(id)a4 stackedSampleType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  HKOverlayRoomStackedContext *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  HKOverlayRoomStackedContext *v37;
  id v38;
  void *v39;

  v15 = a3;
  v38 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v39 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  objc_msgSend(v19, "timeScopeController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "selectedTimeScope");

  objc_msgSend(v19, "displayTypeController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "displayTypeForObjectType:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomStackedContext _generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:](self, "_generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:", v25, v15, v17, v19, v23, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayTypeController");
  v26 = v15;
  v36 = v15;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayTypeForObjectType:", v16);
  v28 = v21;
  v29 = self;
  v30 = v16;
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomStackedContext _generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:](v29, "_generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:", v31, v30, v17, v19, v23, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = a9;
  v37 = -[HKOverlayRoomStackedContext initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:](v29, "initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:", v35, v25, v26, v38, v32, v31, v30, v17, v23, v39, v19, v34);

  return v37;
}

- (HKOverlayRoomStackedContext)initWithSampleType:(id)a3 overlayDisplayType:(id)a4 stackedDisplayType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HKOverlayRoomStackedContext *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HKOverlayRoomStackedContext *v39;
  id v40;

  v15 = a3;
  v40 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v38 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  v37 = v20;
  objc_msgSend(v19, "timeScopeController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "selectedTimeScope");

  objc_msgSend(v19, "displayTypeController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "displayTypeForObjectType:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomStackedContext _generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:](self, "_generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:", v25, v15, v17, v19, v23, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayTypeController");
  v26 = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sampleType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayTypeForObjectType:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sampleType");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v15;
  v36 = v15;
  v32 = (void *)v30;
  LOBYTE(v34) = a9;
  v39 = -[HKOverlayRoomStackedContext initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:](v26, "initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:", v35, v25, v31, v40, v30, v17, v23, v38, v19, v34);

  return v39;
}

- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 overlayDisplayType:(id)a4 stackedDisplayType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  HKOverlayRoomStackedContext *v35;
  id v36;

  v14 = a3;
  v36 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v33 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v19;
  objc_msgSend(v18, "timeScopeController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "selectedTimeScope");

  objc_msgSend(v14, "sampleType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayTypeController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "displayTypeForObjectType:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleType");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v14;
  v31 = v14;
  v28 = (void *)v26;
  LOBYTE(v30) = a9;
  v35 = -[HKOverlayRoomStackedContext initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:](self, "initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:", v27, 0, v22, v36, v15, v25, v26, v16, v21, v32, v18, v30);

  return v35;
}

- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 overlayDisplayType:(id)a4 stackedSampleType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HKOverlayRoomStackedContext *v28;
  void *v29;
  HKOverlayRoomStackedContext *v30;
  uint64_t v32;
  void *v33;
  id v34;

  v15 = a3;
  v34 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v33 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  objc_msgSend(v19, "timeScopeController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "selectedTimeScope");

  objc_msgSend(v19, "displayTypeController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "displayTypeForObjectType:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomStackedContext _generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:](self, "_generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:", v25, v16, v17, v19, v23, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleType");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = self;
  v29 = (void *)v27;
  LOBYTE(v32) = a9;
  v30 = -[HKOverlayRoomStackedContext initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:](v28, "initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:", v15, 0, v27, v34, v26, v25, v16, v17, v23, v21, v19, v32);

  return v30;
}

- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 templateDisplayType:(id)a4 sampleType:(id)a5 overlayDisplayType:(id)a6 stackedDisplayType:(id)a7 stackedTemplateDisplayType:(id)a8 stackedSampleType:(id)a9 overlayChartController:(id)a10 currentTimeScope:(int64_t)a11 currentCalendar:(id)a12 applicationItems:(id)a13 isInfoButtonHidden:(BOOL)a14
{
  id v21;
  HKOverlayRoomStackedContext *v22;
  HKOverlayRoomStackedContext *v23;
  HKDisplayTypeContextItem *lastUpdatedItem;
  id obj;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  obj = a7;
  v30 = a7;
  v29 = a8;
  v28 = a9;
  v27 = a12;
  v21 = a13;
  v22 = -[HKOverlayRoomStackedContext init](self, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_applicationItems, a13);
    objc_storeStrong((id *)&v23->_currentCalendar, a12);
    objc_storeStrong((id *)&v23->_sampleType, a5);
    objc_storeStrong((id *)&v23->_templateDisplayType, a4);
    objc_storeStrong((id *)&v23->_displayType, a3);
    objc_storeStrong((id *)&v23->_overlayDisplayType, a6);
    objc_storeStrong((id *)&v23->_stackedSampleType, a9);
    objc_storeStrong((id *)&v23->_stackedTemplateDisplayType, a8);
    objc_storeStrong((id *)&v23->_stackedBaseDisplayType, obj);
    lastUpdatedItem = v23->_lastUpdatedItem;
    v23->_lastUpdatedItem = 0;

    v23->_currentTimeScope = a11;
    v23->_isInfoButtonHidden = a14;
  }

  return v23;
}

- (id)_generateDisplayTypeForTemplateDisplayType:(id)a3 sampleType:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 currentTimeScope:(int64_t)a7 currentCalendar:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend((id)objc_opt_class(), "generateDisplayTypeForTemplateDisplayType:sampleType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:", v17, v16, v15, v14, a7, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)generateDisplayTypeForTemplateDisplayType:(id)a3 sampleType:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 currentTimeScope:(int64_t)a7 currentCalendar:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  HKInteractiveChartDisplayType *v22;
  void *v23;
  HKInteractiveChartDisplayType *v24;
  void *v25;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v18, "hk_interactiveChartsFormatterForTimeScope:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:](HKOverlayRoomStackedContext, "generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:", v18, v17, v15, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_generateNamedDataSourceForTemplateDisplayType:overlayChartController:applicationItems:currentTimeScope:currentCalendar:", v18, v16, v15, a7, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v18, "sampleType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v22, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v20, v18, v19, objc_msgSend(v23, "code"));

  objc_msgSend(v16, "displayTypeForGraphSeries:namedDataSource:templateDisplayType:timeScope:formatter:", v20, v21, v24, a7, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)generateCustomSeriesWithTemplateDisplayType:(id)a3 sampleType:(id)a4 applicationItems:(id)a5 currentTimeScope:(int64_t)a6
{
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
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "displayCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unitController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chartDataCacheController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKOverlayContextUtilities stackedAxisConfiguration](HKOverlayContextUtilities, "stackedAxisConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:chartSizeClass:", a6, v10, v11, v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "yAxis");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v8, "localization");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortenedDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayContextUtilities setStackedSeriesLegend:title:](HKOverlayContextUtilities, "setStackedSeriesLegend:title:", v14, v17);

  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
      +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  return v14;
}

+ (id)_generateNamedDataSourceForTemplateDisplayType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 currentTimeScope:(int64_t)a6 currentCalendar:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HKInteractiveChartOverlayNamedDataSource *v19;

  v10 = a7;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v11, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hk_healthQueryChartCacheDataSourceForTimeScope:healthStore:unitController:", a6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setCalendarOverride:", v10);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "sampleType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringWithFormat:", CFSTR("HKOverlayRoomStackedContext_%ld"), objc_msgSend(v17, "code"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HKInteractiveChartOverlayNamedDataSource initWithDataSource:named:withContextTitleForTimeScope:]([HKInteractiveChartOverlayNamedDataSource alloc], "initWithDataSource:named:withContextTitleForTimeScope:", v15, v18, 0);
  return v19;
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return !a4;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)stackedBaseDisplayTypeForOverlay:(int64_t)a3
{
  return self->_stackedBaseDisplayType;
}

- (id)stackedOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)contextItemForLastUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKOverlayRoomStackedContext lastUpdatedItem](self, "lastUpdatedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HKOverlayRoomStackedContext applicationItems](self, "applicationItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeScopeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "selectedTimeScope");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomStackedContext buildContextItemWithValue:unit:valueContext:forTimeScope:](self, "buildContextItemWithValue:unit:valueContext:forTimeScope:", v8, 0, 0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomStackedContext setLastUpdatedItem:](self, "setLastUpdatedItem:", v9);

  }
  return -[HKOverlayRoomStackedContext lastUpdatedItem](self, "lastUpdatedItem");
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_initWeak(&location, self);
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v18[3] = &unk_1E9C41F90;
  objc_copyWeak(v21, &location);
  v16 = v13;
  v19 = v16;
  v21[1] = (id)a5;
  v17 = v14;
  v20 = v17;
  -[HKOverlayRoomStackedContext chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:](self, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", 1, v15, v16, 1, a5, a6, v18);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

void __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = WeakRetained;
  if (a4)
  {
    objc_msgSend(WeakRetained, "stackedBaseDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayPillValueProvidingFactory overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:](HKOverlayPillValueProvidingFactory, "overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:", v14, 0, +[HKOverlayPillValueProvidingFactory interfaceLayoutForController:](HKOverlayPillValueProvidingFactory, "interfaceLayoutForController:", *(_QWORD *)(a1 + 32)));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stackedBaseDisplayType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v13, "applicationItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unitController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueFromChartPoints:unit:displayType:timeScope:unitPreferenceController:", v9, v10, v16, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(_QWORD *)(a1 + 56);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
    v22[3] = &unk_1E9C41C00;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v13, "setLastUpdatedItemFromPillValue:timeScope:completion:", v20, v21, v22);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)chartPointsForChartPointType:(unint64_t)a3 dateIntervals:(id)a4 overlayChartController:(id)a5 dateIntervalMustMatchView:(BOOL)a6 timeScope:(int64_t)a7 resolution:(int64_t)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35[4];
  BOOL v36;
  id location[2];

  v13 = a4;
  v14 = a5;
  v15 = a9;
  objc_initWeak(location, self);
  v27 = (void *)a3;
  if (a3 == 1)
  {
    -[HKOverlayRoomStackedContext stackedBaseDisplayType](self, "stackedBaseDisplayType");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[HKOverlayRoomStackedContext displayType](self, "displayType");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v17 = (void *)v16;
    goto LABEL_7;
  }
  v17 = 0;
LABEL_7:
  objc_msgSend(v17, "graphSeriesForTimeScope:", a7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomStackedContext _canonicalUnitOverrideForDisplayType:](self, "_canonicalUnitOverrideForDisplayType:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[HKOverlayRoomStackedContext applicationItems](self, "applicationItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unitController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unitForChartingDisplayType:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)a8;
    v28 = v15;
    objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(v35, location);
    v36 = a6;
    v31 = v21;
    v32 = v14;
    v34 = v28;
    v35[1] = v27;
    v33 = v22;
    v35[2] = (id)a7;
    v35[3] = v25;
    objc_msgSend(v32, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v29);

    objc_destroyWeak(v35);
    v15 = v28;
  }
  else
  {
    (*((void (**)(id, _QWORD, void *, uint64_t, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AA60], v18, 1, 0);
  }

  objc_destroyWeak(location);
}

void __155__HKOverlayRoomStackedContext_chartPointsForChartPointType_dateIntervals_overlayChartController_dateIntervalMustMatchView_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(void);
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v10 = WeakRetained;
  if (!a3)
  {
    v25 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_7:
    v25();
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 104))
  {
    if (objc_msgSend(WeakRetained, "_obsoleteDateRange:overlayController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 48), "lastUpdatedItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
      {
        v25 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        goto LABEL_7;
      }
    }
  }
  v17 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(unsigned __int8 *)(a1 + 104);
  v20 = *(_QWORD *)(a1 + 80);
  v21 = *(_QWORD *)(a1 + 88);
  v26 = v8;
  v22 = v10;
  v23 = *(_QWORD *)(a1 + 96);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __155__HKOverlayRoomStackedContext_chartPointsForChartPointType_dateIntervals_overlayChartController_dateIntervalMustMatchView_timeScope_resolution_completion___block_invoke_2;
  v27[3] = &unk_1E9C41FB8;
  v28 = v7;
  v29 = *(id *)(a1 + 64);
  v24 = v23;
  v10 = v22;
  v8 = v26;
  objc_msgSend(v17, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", v20, v16, v18, v19, v21, v24, v27);

LABEL_8:
}

void __155__HKOverlayRoomStackedContext_chartPointsForChartPointType_dateIntervals_overlayChartController_dateIntervalMustMatchView_timeScope_resolution_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setLastUpdatedItemFromPillValue:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HKOverlayRoomStackedContext *v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke;
  v12[3] = &unk_1E9C42008;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(*(id *)(a1 + 32), "valueString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "valueString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "unitString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildContextItemWithValue:unit:valueContext:forTimeScope:", v4, v5, 0, *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLastUpdatedItem:", v6);

LABEL_5:
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "attributedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "attributedValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_buildContextItemWithAttributedValue:valueContext:forTimeScope:", v4, 0, *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLastUpdatedItem:", v9);

    goto LABEL_5;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
    __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)_obsoleteDateRange:(id)a3 overlayController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = a3;
  objc_msgSend(a4, "primaryGraphViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectiveVisibleRangeActive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "compare:", v11) || objc_msgSend(v10, "compare:", v12);
  return v13;
}

- (id)stackedContextButtonBackground
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HKOverlayRoomStackedContext stackedBaseDisplayType](self, "stackedBaseDisplayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomStackedContext _setupContextItemForDisplayType:timeScope:valueContext:](self, "_setupContextItemForDisplayType:timeScope:valueContext:", v13, a6, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setUnit:", v11);
  objc_msgSend(v14, "setValue:", v12);

  -[HKOverlayRoomStackedContext _setAccessibiltyIdentifier:displayType:](self, "_setAccessibiltyIdentifier:displayType:", v14, v13);
  return v14;
}

- (id)_buildContextItemWithAttributedValue:(id)a3 valueContext:(id)a4 forTimeScope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  -[HKOverlayRoomStackedContext stackedBaseDisplayType](self, "stackedBaseDisplayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomStackedContext _setupContextItemForDisplayType:timeScope:valueContext:](self, "_setupContextItemForDisplayType:timeScope:valueContext:", v10, a5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v9);
  v13 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v11, "selectedMetricColors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contextViewPrimaryTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAttribute:value:range:", v13, v15, 0, objc_msgSend(v9, "length"));

  +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:selectedText:](HKDisplayTypeContextItemAttributedLabelOverride, "attributedLabelOverrideWithText:selectedText:", v9, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAttributedLabelTextOverride:", v16);
  -[HKOverlayRoomStackedContext _setAccessibiltyIdentifier:displayType:](self, "_setAccessibiltyIdentifier:displayType:", v11, v10);

  return v11;
}

- (id)_setupContextItemForDisplayType:(id)a3 timeScope:(int64_t)a4 valueContext:(id)a5
{
  id v8;
  id v9;
  HKDisplayTypeContextItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(HKDisplayTypeContextItem);
  -[HKSampleType identifier](self->_stackedSampleType, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAnalyticsIdentifier:](v10, "setAnalyticsIdentifier:", v11);

  -[HKOverlayRoomStackedContext _contextItemTitleForDisplayType:timeScope:](self, "_contextItemTitleForDisplayType:timeScope:", v9, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v10, "setTitle:", v12);

  -[HKDisplayTypeContextItem setInfoHidden:](v10, "setInfoHidden:", self->_isInfoButtonHidden);
  v13 = objc_msgSend(v9, "contextItemShouldUseTightSpacingBetweenValueAndUnit");

  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v10, "setUseTightSpacingBetweenValueAndUnit:", v13);
  -[HKOverlayRoomStackedContext stackedContextButtonBackground](self, "stackedContextButtonBackground");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v10, "setMetricColors:", v15);

  -[HKOverlayRoomStackedContext stackedSampleType](self, "stackedSampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomStackedContext stackedTemplateDisplayType](self, "stackedTemplateDisplayType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKOverlayContextUtilities stackedChartMetricColorsForSampleType:templateType:](HKOverlayContextUtilities, "stackedChartMetricColorsForSampleType:templateType:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v10, "setSelectedMetricColors:", v18);

  -[HKDisplayTypeContextItem setValueContext:](v10, "setValueContext:", v8);
  return v10;
}

- (void)_setAccessibiltyIdentifier:(id)a3 displayType:(id)a4
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)MEMORY[0x1E0CB3940];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "localization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_chartOverlayAccessibilityIdentifier:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v10);

    v5 = (id)v10;
  }
  else
  {
    objc_msgSend(v11, "displayTypeIdentifierString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_chartOverlayAccessibilityIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v9);
  }

}

- (id)_contextItemTitleForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "chartsRelativeData");

  if (a4 == 6 || !v7)
  {
    objc_msgSend(v5, "localization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortenedDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OVERLAY_AVERAGE_DATA_TYPE_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "embeddedDisplayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_canonicalUnitOverrideForDisplayType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CB4928];

  if (v4 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (HKInteractiveChartDisplayType)displayType
{
  return self->_displayType;
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (HKSampleType)stackedSampleType
{
  return self->_stackedSampleType;
}

- (HKInteractiveChartDisplayType)stackedBaseDisplayType
{
  return self->_stackedBaseDisplayType;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (HKDisplayType)templateDisplayType
{
  return self->_templateDisplayType;
}

- (void)setTemplateDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_templateDisplayType, a3);
}

- (HKDisplayType)stackedTemplateDisplayType
{
  return self->_stackedTemplateDisplayType;
}

- (void)setStackedTemplateDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_stackedTemplateDisplayType, a3);
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (int64_t)currentTimeScope
{
  return self->_currentTimeScope;
}

- (void)setCurrentTimeScope:(int64_t)a3
{
  self->_currentTimeScope = a3;
}

- (BOOL)isInfoButtonHidden
{
  return self->_isInfoButtonHidden;
}

- (void)setIsInfoButtonHidden:(BOOL)a3
{
  self->_isInfoButtonHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_stackedTemplateDisplayType, 0);
  objc_storeStrong((id *)&self->_templateDisplayType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_stackedBaseDisplayType, 0);
  objc_storeStrong((id *)&self->_stackedSampleType, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

+ (void)generateCustomSeriesWithTemplateDisplayType:(uint64_t)a3 sampleType:(uint64_t)a4 applicationItems:(uint64_t)a5 currentTimeScope:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7813000, a1, a3, "Numeric Axis missing from Stacked Context", a5, a6, a7, a8, 0);
}

void __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7813000, a1, a3, "Unable to setLastUpdatedItemFromPillValue: no value/unit or attributed value was found.", a5, a6, a7, a8, 0);
}

@end
